#!/usr/bin/perl -w
# --
# bin/otrs.ITSMChangesCheck.pl - check pending tickets
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: otrs.ITSMChangesCheck.pl,v 1.2 2010/01/27 14:52:13 reb Exp $
# --
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU AFFERO General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# or see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;

# use ../ as lib location
use File::Basename;
use FindBin qw($RealBin);
use lib dirname($RealBin);
use lib dirname($RealBin) . '/Kernel/cpan-lib';

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

use Date::Pcalc qw(Day_of_Week Day_of_Week_Abbreviation);
use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Time;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::DB;
use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::History;
use Kernel::System::ITSMChange::ITSMWorkOrder;

{

    package OTRSMockObject;

    use base 'Kernel::System::EventHandler';

    sub new {
        my ( $Class, %Objects ) = @_;

        my $Self = bless {}, $Class;

        for my $Object ( keys %Objects ) {
            $Self->{$Object} = $Objects{$Object};
        }

        # init of event handler
        $Self->EventHandlerInit(
            Config     => 'ITSMChangeCronjob::EventModule',
            BaseObject => 'ChangeObject',
            Objects    => {
                %{$Self},
            },
        );

        return $Self;
    }
}

# common objects
my %CommonObject;
$CommonObject{ConfigObject} = Kernel::Config->new();
$CommonObject{EncodeObject} = Kernel::System::Encode->new(%CommonObject);
$CommonObject{LogObject}    = Kernel::System::Log->new(
    LogPrefix => 'OTRS-ITSMChangesCheck',
    %CommonObject,
);
$CommonObject{MainObject}      = Kernel::System::Main->new(%CommonObject);
$CommonObject{TimeObject}      = Kernel::System::Time->new(%CommonObject);
$CommonObject{DBObject}        = Kernel::System::DB->new(%CommonObject);
$CommonObject{ChangeObject}    = Kernel::System::ITSMChange->new(%CommonObject);
$CommonObject{WorkOrderObject} = Kernel::System::ITSMChange::ITSMWorkOrder->new(%CommonObject);
$CommonObject{HistoryObject}   = Kernel::System::ITSMChange::History->new(%CommonObject);

my $MockedObject = OTRSMockObject->new(%CommonObject);

# check args
my $Command = shift || '--help';
print "otrs.ITSMChangesCheck.pl <Revision $VERSION> - check itsm changes\n";
print "Copyright (C) 2003-2010 OTRS AG, http://otrs.com/\n";

# if sysconfig option is disabled -> exit
my $SysConfig = $CommonObject{ConfigObject}->Get('ITSMChange::TimeReachedNotifications');
if ( !$SysConfig->{Frequency} ) {
    exit(0);
}

# do change/workorder reminder notification jobs

my $SystemTime = $CommonObject{TimeObject}->SystemTime();
my $Now        = $CommonObject{TimeObject}->SystemTime2TimeStamp(
    SystemTime => $SystemTime,
);

# notifications for changes' plannedXXXtime events
for my $Type (qw(StartTime EndTime)) {

    # get changes with PlannedStartTime older than now
    my $PlannedChangeIDs = $CommonObject{ChangeObject}->ChangeSearch(
        "Planned${Type}OlderDate" => $Now,
        UserID                    => 1,
    ) || [];

    CHANGEID:
    for my $ChangeID ( @{$PlannedChangeIDs} ) {

        # get change data
        my $Change = $CommonObject{ChangeObject}->ChangeGet(
            ChangeID => $ChangeID,
            UserID   => 1,
        );

        # skip change if there is already an actualXXXtime set or notification was sent
        next CHANGEID if $Change->{"Actual$Type"};

        my $LastNotificationSentDate = ChangeNotificationSent(
            ChangeID => $ChangeID,
            Type     => "Planned${Type}",
        );

        next CHANGEID if SentWithinPeriod($LastNotificationSentDate);

        $CommonObject{LogObject}->Log(
            Priority => 'error',
            Message  => "$ChangeID => Planned$Type ( " . $Change->{"Planned$Type"} . ")",
        );

        # trigger ChangePlannedStartTimeReachedPost-Event
        $MockedObject->EventHandler(
            Event => "ChangePlanned${Type}ReachedPost",
            Data  => {
                ChangeID => $ChangeID,
            },
            UserID => 1,
        );
    }

    # get changes with actualxxxtime
    my $ActualChangeIDs = $CommonObject{ChangeObject}->ChangeSearch(
        "Actual${Type}OlderDate" => $Now,
        UserID                   => 1,
    ) || [];

    CHANGEID:
    for my $ChangeID ( @{$ActualChangeIDs} ) {

        # get change data
        my $Change = $CommonObject{ChangeObject}->ChangeGet(
            ChangeID => $ChangeID,
            UserID   => 1,
        );

        my $LastNotificationSentDate = ChangeNotificationSent(
            ChangeID => $ChangeID,
            Type     => "Actual${Type}",
        );

        next CHANGEID if $LastNotificationSentDate;

        $CommonObject{LogObject}->Log(
            Priority => 'error',
            Message  => "$ChangeID => Actual$Type ( " . $Change->{"Actual$Type"} . ")",
        );

        # trigger Event
        $MockedObject->EventHandler(
            Event => "ChangeActual${Type}ReachedPost",
            Data  => {
                ChangeID => $ChangeID,
            },
            UserID => 1,
        );
    }
}

# check if a notification was already sent for the given change
sub ChangeNotificationSent {
    my (%Param) = @_;

    # check needed stuff
    for my $Needed (qw(ChangeID Type)) {
        return if !$Param{$Needed};
    }

    # get history entries
    my $History = $CommonObject{HistoryObject}->ChangeHistoryGet(
        ChangeID => $Param{ChangeID},
        UserID   => 1,
    );

    # search for notifications sent earlier
    for my $HistoryEntry ( reverse @{$History} ) {
        if (
            $HistoryEntry->{HistoryType}   eq 'Change' . $Param{Type} . 'Reached'
            && $HistoryEntry->{ContentNew} eq 'Notification Sent'
            )
        {
            return $HistoryEntry->{CreateTime};
        }
    }

    return;
}

sub SentWithinPeriod {
    my ($LastNotificationSentDate) = @_;

    return if !$LastNotificationSentDate;

    # get SysConfig option
    my $Config = $CommonObject{ConfigObject}->Get('ITSMChange::TimeReachedNotifications');

    # if notifications should be sent only once
    return 1 if $Config->{Frequency} eq 'once';

    # get epoche seconds of send time
    my $SentEpoche = $CommonObject{TimeObject}->TimeStamp2SystemTime(
        String => $LastNotificationSentDate,
    );

    # calc diff
    my $EpocheSinceSent = $SystemTime - $SentEpoche;
    my $HoursSinceSent  = int( $EpocheSinceSent / 60 * 60 );

    if ( $HoursSinceSent >= $Config->{Hours} ) {
        return;
    }

    return 1;
}

exit(0);
