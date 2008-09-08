# --
# Kernel/System/Ticket/Event/NagiosAcknowledge.pm - acknowlege nagios tickets
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: NagiosAcknowledge.pm,v 1.3 2008/09/08 21:49:45 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::Ticket::Event::NagiosAcknowledge;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
    for (
        qw(ConfigObject TicketObject LogObject UserObject CustomerUserObject SendmailObject TimeObject EncodeObject UserObject)
        )
    {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID Event Config)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # check if it's a Nagios related ticket
    my %Ticket = $Self->{TicketObject}->TicketGet( TicketID => $Param{TicketID} );
    if ( !$Ticket{TicketFreeText1} ) {
        $Self->{LogObject}->Log( Priority => 'debug', Message => "No Nagios Ticket!" );
        return 1;
    }

    # check if it's an acknowledge
    return 1 if $Ticket{Lock} ne 'lock';

    # agent lookup
    my %User = $Self->{UserObject}->GetUserData(
        UserID   => $Param{UserID},
        Cached => 1, # not required -> 0|1 (default 0)
    );

    # send acknowledge to nagios
    my $CMD = $Self->{ConfigObject}->Get( 'Nagios::Acknowledge::CMD' );
    my $Data;
    if ( $Ticket{TicketFreeText2} !~ /^host$/i) {
        $Data = $Self->{ConfigObject}->Get( 'Nagios::Acknowledge::NamedPipe::Service' );
    }
    else {
        $Data = $Self->{ConfigObject}->Get( 'Nagios::Acknowledge::NamedPipe::Host' );
    }

    # replace ticket tags
    for my $Key ( keys %Ticket ) {
        next if !defined $Ticket{$Key};

        # strip not allowd chars
        $Ticket{$Key} =~ s/'//g;
        $Ticket{$Key} =~ s/;//g;
        $Data =~ s/<$Key>/$Ticket{$Key}/g;
    }

    # replace login
    $Data =~ s/<LOGIN>/$User{UserLogin}/g;

    # replace host
    $Data =~ s/<HOST_NAME>/$Ticket{TicketFreeText1}/g;

    # replace time stamp
    $Data =~ s/<HOST_SERVICE>/$Ticket{TicketFreeText2}/g;

    # replace time stamp
    my $Time = time();
    $Data =~ s/<UNIXTIME>/$Time/g;

    # replace OUTPUTSTRING
    $CMD =~ s/<OUTPUTSTRING>/$Data/g;

#print STDERR "$CMD\n";
    system ( $CMD );

    $Self->{TicketObject}->HistoryAdd(
        TicketID     => $Param{TicketID},
        HistoryType  => 'Misc',
        Name         => "Sent Acknowledge to Nagios",
        CreateUserID => $Param{UserID},
    );

    return 1;
}

1;
