# --
# Kernel/System/Support/OTRS.pm - all required otrs informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: OTRS.pm,v 1.5 2007/09/04 08:42:58 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::OTRS;

use strict;
use Kernel::System::Ticket;

use vars qw(@ISA $VERSION);
$VERSION = '$Revision: 1.5 $';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

sub new {
    my $Type = shift;
    my %Param = @_;
    # allocate new hash for object
    my $Self = {};
    bless ($Self, $Type);
    # check needed objects
    foreach (qw(ConfigObject LogObject DBObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    $Self->{TicketObject} = Kernel::System::Ticket->new(%Param);

    return $Self;
}

sub SupportConfigArrayGet {
    my $Self = shift;
    my %Param = @_;
    # check needed stuff
    foreach (qw()) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
    # create config array
    my $ConfigArray = [

    ];
    # return config array
    return $ConfigArray;
}

sub SupportInfoGet {
    my $Self = shift;
    my %Param = @_;
    my $DataArray = [];
    # check needed stuff
    foreach (qw(ModuleInputHash)) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
    if (ref($Param{ModuleInputHash}) ne 'HASH') {
        $Self->{LogObject}->Log(Priority => 'error', Message => "ModuleInputHash must be a hash reference!");
        return;
    }
    my $OneCheck = $Self->OTRSLogGet(
        Type => $Param{ModuleInputHash}->{Type} || '',
    );

#    # please add for each new check a part like this
#    my $OneCheck = $Self->Check(
#        Type => $Param{ModuleInputHash}->{Type} || '',
#    );
    push (@{$DataArray}, $OneCheck);

    return $DataArray;
}

sub AdminChecksGet {
    my $Self = shift;
    my %Param = @_;
    my @DataArray = ();
    # check needed stuff
    foreach (qw()) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
    # Ticket::IndexModule check
    my $Check = 'Failed';
    my $Message = '';
    my $Module = $Self->{ConfigObject}->Get('Ticket::IndexModule');
    $Self->{DBObject}->Prepare(SQL => "SELECT count(*) from ticket");
    while (my @Row = $Self->{DBObject}->FetchrowArray()) {
        if ($Row[0] > 80000) {
            if ($Module =~ /RuntimeDB/) {
                $Check = 'Failed';
                $Message = "You should use the StaticDB backend. See admin manual (Performance Tuning) for more information.";
            }
            else {
                $Check = 'OK';
                $Message = "";
            }
        }
        elsif ($Row[0] > 60000) {
            if ($Module =~ /RuntimeDB/) {
                $Check = 'Critical';
                $Message = "You should use the StaticDB backend. See admin manual (Performance Tuning) for more information.";
            }
            else {
                $Check = 'OK';
                $Message = "";
            }
        }
        else {
            $Check = 'OK';
            $Message = "You are using $Module, that's fine for $Row[0] tickets in your system.";
        }
    }
    push (@DataArray,
        {
            Key => 'Ticket::IndexModule',
            Name => 'Ticket::IndexModule',
            Description => "Check Ticket::IndexModule setting.",
            Comment => $Message,
            Check => $Check,
        },
    );
    # OpenTicketCheck check
    $Check = 'Failed';
    $Message = '';
    my @TicketIDs = $Self->{TicketObject}->TicketSearch(
        Result => 'ARRAY',
        StateType => 'Open',
        UserID => 1,
        Permission => 'ro',
        Limit => 99999999,
    );
    if ($#TicketIDs > 10000) {
        $Check = 'Failed';
        $Message = "You should not have more then 8000 open tickets in your system. You currently have ".
            $#TicketIDs.". In case you want to improve your performance, close not needed open tickets.";

    }
    elsif ($#TicketIDs > 8000) {
        $Check = 'Critical';
        $Message = "You should not have more then 8000 open tickets in your system. You currently have ".
            $#TicketIDs.". In case you want to improve your performance, close not needed open tickets.";

    }
    else {
        $Check = 'OK';
        $Message = "You have ".$#TicketIDs." open tickets in your system.";
    }
    push (@DataArray,
        {
            Key => 'OpenTicketCheck',
            Name => 'OpenTicketCheck',
            Description => "Check open tickets in your system.",
            Comment => $Message,
            Check => $Check,
        },
    );

    return \@DataArray;
}

sub OTRSLogGet {
    my $Self = shift;
    my %Param = @_;
    my $ReturnHash = {};
    # check needed stuff
    foreach (qw()) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
    my $TmpLine = '';
    my $Logfile = $Self->{ConfigObject}->Get('Home')."/var/log/support.log";
    if (open (LOGFILE, $Logfile)) {
        while (<LOGFILE>) {
            $TmpLine .= $_;
        }
        close (LOGFILE);
        if($TmpLine) {
            $ReturnHash =
            {
                Key => 'OTRSLog',
                Name => 'OTRSLog',
                Comment => 'The OTRS Log',
                Description => $TmpLine,
                Check => 'OK',
            };
        }
    }
    return $ReturnHash;
}

1;
