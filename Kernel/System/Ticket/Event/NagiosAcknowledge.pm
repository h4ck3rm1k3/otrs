# --
# Kernel/System/Ticket/Event/NagiosAcknowledge.pm - acknowlege nagios tickets
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: NagiosAcknowledge.pm,v 1.10 2011/06/11 20:38:30 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket::Event::NagiosAcknowledge;

use strict;
use warnings;
use LWP::UserAgent;
use CGI;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.10 $) [1];

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

    # get correct FreeFields
    $Self->{Fhost}    = $Self->{ConfigObject}->Get('Nagios::Acknowledge::FreeField::Host');
    $Self->{Fservice} = $Self->{ConfigObject}->Get('Nagios::Acknowledge::FreeField::Service');

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

    # check if acknowledge is active
    my $Type = $Self->{ConfigObject}->Get('Nagios::Acknowledge::Type');
    return 1 if !$Type;

    # check if it's a Nagios related ticket
    my %Ticket = $Self->{TicketObject}->TicketGet( TicketID => $Param{TicketID} );
    if ( !$Ticket{ $Self->{Fhost} } ) {
        $Self->{LogObject}->Log( Priority => 'debug', Message => "No Nagios Ticket!" );
        return 1;
    }

    # check if it's an acknowledge
    return 1 if $Ticket{Lock} ne 'lock';

    # agent lookup
    my %User = $Self->{UserObject}->GetUserData(
        UserID => $Param{UserID},
        Cached => 1,                # not required -> 0|1 (default 0)
    );

    my $Return;
    if ( $Type eq 'pipe' ) {
        $Return = $Self->_Pipe(
            Ticket => \%Ticket,
            User   => \%User,
        );
    }
    elsif ( $Type eq 'http' ) {
        $Return = $Self->_HTTP(
            Ticket => \%Ticket,
            User   => \%User,
        );
    }
    else {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Unknown Nagios acknowledge type ($Type)!",
        );
        return 1;
    }

    if ($Return) {
        $Self->{TicketObject}->HistoryAdd(
            TicketID     => $Param{TicketID},
            HistoryType  => 'Misc',
            Name         => "Sent Acknowledge to Nagios ($Type).",
            CreateUserID => $Param{UserID},
        );
        return 1;
    }
    else {
        $Self->{TicketObject}->HistoryAdd(
            TicketID     => $Param{TicketID},
            HistoryType  => 'Misc',
            Name         => "Was not able to send Acknowledge to Nagios ($Type)!",
            CreateUserID => $Param{UserID},
        );
        return;
    }
}

sub _Pipe {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Ticket User)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    my %Ticket = %{ $Param{Ticket} };
    my %User   = %{ $Param{User} };

    # send acknowledge to nagios
    my $CMD = $Self->{ConfigObject}->Get('Nagios::Acknowledge::NamedPipe::CMD');
    my $Data;
    if ( $Ticket{ $Self->{Fservice} } !~ /^host$/i ) {
        $Data = $Self->{ConfigObject}->Get('Nagios::Acknowledge::NamedPipe::Service');
    }
    else {
        $Data = $Self->{ConfigObject}->Get('Nagios::Acknowledge::NamedPipe::Host');
    }

    # replace ticket tags
    for my $Key ( keys %Ticket ) {
        next if !defined $Ticket{$Key};

        # strip not allowed characters
        $Ticket{$Key} =~ s/'//g;
        $Ticket{$Key} =~ s/;//g;
        $Data         =~ s/<$Key>/$Ticket{$Key}/g;
    }

    # replace config tags
    $Data =~ s{<CONFIG_(.+?)>}{$Self->{ConfigObject}->Get($1)}egx;

    # replace login
    $Data =~ s/<LOGIN>/$User{UserLogin}/g;

    # replace host
    $Data =~ s/<HOST_NAME>/$Ticket{$Self->{Fhost}}/g;

    # replace time stamp
    $Data =~ s/<SERVICE_NAME>/$Ticket{$Self->{Fservice}}/g;

    # replace time stamp
    my $Time = time();
    $Data =~ s/<UNIXTIME>/$Time/g;

    # replace OUTPUTSTRING
    $CMD =~ s/<OUTPUTSTRING>/$Data/g;

    #print STDOUT "$CMD\n";
    system($CMD );

    return 1;
}

sub _HTTP {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Ticket User)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    my %Ticket = %{ $Param{Ticket} };
    my %User   = %{ $Param{User} };

    my $URL  = $Self->{ConfigObject}->Get('Nagios::Acknowledge::HTTP::URL');
    my $User = $Self->{ConfigObject}->Get('Nagios::Acknowledge::HTTP::User');
    my $Pw   = $Self->{ConfigObject}->Get('Nagios::Acknowledge::HTTP::Password');

    if ( $Ticket{ $Self->{Fservice} } !~ /^host$/i ) {
        $URL =~ s/<CMD_TYP>/34/g;
    }
    else {
        $URL =~ s/<CMD_TYP>/33/g;
    }

    # replace host
    $URL =~ s/<HOST_NAME>/$Ticket{$Self->{Fhost}}/g;

    # replace time stamp
    $URL =~ s/<SERVICE_NAME>/$Ticket{$Self->{Fservice}}/g;

    # replace ticket tags

    for my $Key ( keys %Ticket ) {
        next if !defined $Ticket{$Key};

        # URLencode values
        CGI::escape( $Ticket{$Key} );
        $URL =~ s/<$Key>/$Ticket{$Key}/g;
    }

    # replace config tags
    $URL =~ s{<CONFIG_(.+?)>}{$Self->{ConfigObject}->Get($1)}egx;

    my $UserAgent = LWP::UserAgent->new();
    $UserAgent->timeout(15);

    my $Request = HTTP::Request->new( GET => $URL );
    $Request->authorization_basic( $User, $Pw );
    my $Response = $UserAgent->request($Request);
    if ( !$Response->is_success() ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't request $URL: " . $Response->status_line(),
        );
        return;
    }

    #    return $Response->content();

    return 1;
}
1;
