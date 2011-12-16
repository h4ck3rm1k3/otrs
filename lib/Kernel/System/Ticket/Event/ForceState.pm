# --
# Kernel/System/Ticket/Event/ForceState.pm - set state
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: ForceState.pm,v 1.11 2010/05/19 07:08:18 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket::Event::ForceState;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.11 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
    for (
        qw(ConfigObject TicketObject LogObject UserObject CustomerUserObject SendmailObject TimeObject EncodeObject)
        )
    {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Data Event Config)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    for (qw(TicketID)) {
        if ( !$Param{Data}->{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_ in Data!" );
            return;
        }
    }

    my %Ticket = $Self->{TicketObject}->TicketGet(
        TicketID => $Param{Data}->{TicketID},
        UserID   => $Param{UserID},
    );

    # should I unlock a ticket after move?
    return 1 if lc $Ticket{Lock} ne 'lock';

    # set now state
    for my $OldState ( keys %{ $Param{Config} } ) {
        next if !$OldState;
        next if $OldState ne $Ticket{State};

        $Self->{TicketObject}->TicketStateSet(
            TicketID           => $Param{Data}->{TicketID},
            State              => $Param{Config}->{$OldState},
            SendNoNotification => 1,
            UserID             => 1,
        );
    }
    return 1;
}

1;
