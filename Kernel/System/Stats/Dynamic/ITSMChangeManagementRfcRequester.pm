# --
# Kernel/System/Stats/Dynamic/ITSMChangeManagementRfcRequester.pm - all advice functions
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: ITSMChangeManagementRfcRequester.pm,v 1.3 2010/01/25 10:05:42 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Stats::Dynamic::ITSMChangeManagementRfcRequester;

use strict;
use warnings;

use Kernel::System::CustomerUser;
use Kernel::System::ITSMChange;
use Kernel::System::Ticket;
use Kernel::System::User;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (
        qw(DBObject ConfigObject LogObject UserObject TimeObject MainObject EncodeObject)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    # create needed objects
    $Self->{CustomerUserObject} = Kernel::System::CustomerUser->new( %{$Self} );
    $Self->{ChangeObject}       = Kernel::System::ITSMChange->new( %{$Self} );
    $Self->{TicketObject}       = Kernel::System::Ticket->new( %{$Self} );
    $Self->{UserObject}         = Kernel::System::User->new( %{$Self} );

    return $Self;
}

sub GetObjectName {
    my ( $Self, %Param ) = @_;

    return 'ITSMChangeManagementRfcRequester';
}

sub GetObjectAttributes {
    my ( $Self, %Param ) = @_;

    my $RfCTypes = $Self->{ConfigObject}->Get('ITSMChange::AddChangeLinkTicketTypes');

    # get all rfcs
    my @TicketIDs = $Self->{TicketObject}->TicketSearch(
        UserID     => 1,
        Permission => 'ro',
        Limit      => 100_000_000,
        Types      => $RfCTypes,
        Result     => 'ARRAY',
    );

    # get all requester
    my %Requester;

    TICKETID:
    for my $TicketID (@TicketIDs) {
        my %Ticket = $Self->{TicketObject}->TicketGet(
            TicketID => $TicketID,
            UserID   => 1,
        );

        next TICKETID if !%Ticket;

        if ( $Ticket{CustomerUserID} ) {
            my $CustomerUserID = $Ticket{CustomerUserID};

            next TICKETID if $Requester{"customer_$CustomerUserID"};

            my %CustomerUser = $Self->{CustomerUserObject}->CustomerUserDataGet(
                User => $CustomerUserID,
            );

            $Requester{"customer_$CustomerUserID"} = sprintf "%s (%s %s)",
                $CustomerUser{UserLogin},
                $CustomerUser{UserFirstname},
                $CustomerUser{UserLastname};
        }
        else {
            my $OwnerID = $Ticket{OwnerID};

            next TICKETID if $Requester{"agent_$OwnerID"};

            my %User = $Self->{UserObject}->GetUserData(
                UserID => $OwnerID,
            );

            $Requester{"agent_$OwnerID"} = sprintf "%s (%s %s)",
                $User{UserLogin},
                $User{UserFirstname},
                $User{UserLastname};
        }
    }

    my @ObjectAttributes = (
        {
            Name             => 'Requester',
            UseAsXvalue      => 0,
            UseAsValueSeries => 1,
            UseAsRestriction => 0,
            SelectedValues   => [ keys %Requester ],
            Element          => 'Requester',
            Block            => 'MultiSelectField',
            Values           => \%Requester,
        },
        {
            Name             => 'Timeperiod',
            UseAsXvalue      => 1,
            UseAsValueSeries => 0,
            UseAsRestriction => 0,
            Element          => 'TimePeriod',
            TimePeriodFormat => 'DateInputFormat',    # 'DateInputFormatLong',
            Block            => 'Time',
            Values           => {
                TimeStart => 'TicketCreateTimeNewerDate',
                TimeStop  => 'TicketCreateTimeOlderDate',
            },
        },
    );

    return @ObjectAttributes;
}

sub GetStatElement {
    my ( $Self, %Param ) = @_;

    # check what type of requester we have
    # ticket search criteria differ for agents and customers
    my ( $Type, $ID ) = split /_/, $Param{Requester}->[0];
    my $Key = $Type eq 'agent' ? 'OwnerIDs' : 'CustomerUserLogin';
    $Param{$Key} = [$ID];

    # get ticket types that are handled as RfCs
    my $RfCTypes = $Self->{ConfigObject}->Get('ITSMChange::AddChangeLinkTicketTypes');

    # search tickets
    my @TicketIDs = $Self->{TicketObject}->TicketSearch(
        UserID     => 1,
        Result     => 'ARRAY',
        Permission => 'ro',
        Limit      => 100_000_000,
        Types      => $RfCTypes,
        %Param,
    );

    # if this wants the number of RfCs for an agent we have to check
    # whether a customer id is in the ticket. The owner is *NOT* the
    # requester then.
    if ( $Type eq 'agent' ) {
        my $Count = 0;

        TICKETID:
        for my $TicketID (@TicketIDs) {
            my %Ticket = $Self->{TicketObject}->TicketGet(
                TicketID => $TicketID,
            );

            next TICKETID if !%Ticket;
            next TICKETID if $Ticket{CustomerUserID};

            $Count++;
        }

        return $Count;
    }

    return scalar @TicketIDs;
}

sub ExportWrapper {
    my ( $Self, %Param ) = @_;

    return \%Param;
}

sub ImportWrapper {
    my ( $Self, %Param ) = @_;

    return \%Param;
}

1;
