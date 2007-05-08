# --
# Kernel/System/Support/Hardware.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: Hardware.pm,v 1.2 2007/05/08 08:00:56 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::Hardware;

use strict;

use vars qw(@ISA $VERSION);
$VERSION = '$Revision: 1.2 $';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

=head1 NAME

Kernel::System::Support::Hardware - global system informations

=head1 SYNOPSIS

All required system informations to a running OTRS host.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create hardware info object

use Kernel::Config;
use Kernel::System::Log;
my $ConfigObject = Kernel::Config->new();
my $LogObject = Kernel::System::Log->new(
    ConfigObject => $ConfigObject,
);

$SystemInfoObject = Kernel::System::Support::Hardware->new(
    ConfigObject => $ConfigObject,
    LogObject => $LogObject,
);

=cut

sub new {
    my $Type = shift;
    my %Param = @_;
    # allocate new hash for object
    my $Self = {};
    bless ($Self, $Type);
    # check needed objects
    foreach (qw(ConfigObject LogObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    return $Self;
}

=item SupportConfigArrayGet()

return an array reference with required config information.

$ArrayRef = $Support->SupportConfigArrayGet();

my $ConfigArray = [
    {
        Key => 'TicketDump',
        Name => 'Dump Tickets',
        Description => 'Please tell me how many latest Tickets we shut dump?',
            Input => {
            Type => 'Select',
            Data => {
                All => 'All',
                0 => '0',
                10 => 'Last 10',
                100 => 'Last 100',
                1000 => 'Last 1000',
            },
        },
    },
    {
        Key => 'ApacheHome',
        Name => 'Apache Home Directory',
        Description => 'Please tell me the path to the Apache home directory (/etc/apache2)',
        Input => {
            Type => 'Text',
            Size => 40,
        },
    },
];

=cut

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
    my $ConfigArray = [];
    # return config array
    return $ConfigArray;
}

=item SupportInfoGet()

returns a array reference with support information.

$HardwareArray => [
    {
        Key => 'Plattform',
        Name => 'Plattform',
        Comment => 'Linux',
        Description => 'Please add more memory.',
        Check => 'OK',
    },
    {
        Key => 'Version',
        Name => 'Version',
        Comment => 'openSUSE 10.2',
        Description => 'Please add more memory.',
        Check => 'OK',
    },
];

=cut

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
    # please add for each new check a part like this
    my $OneCheck = $Self->MemorySwapCheck(
        Type => $Param{ModuleInputHash}->{Type} || '',
    );
    push (@{$DataArray}, $OneCheck);

    return $DataArray;
}

=item AdminChecksGet()

returns a array reference with AdminChecks information.

$HardwareArray => [
    {
        Key => 'Plattform',
        Name => 'Plattform',
        Comment => 'Linux',
        Description => 'Please add more memory.',
        Check => 'OK',
    },
    {
        Key => 'Version',
        Name => 'Version',
        Comment => 'openSUSE 10.2',
        Description => 'Please add more memory.',
        Check => 'OK',
    },
];

=cut

sub AdminChecksGet {
    my $Self = shift;
    my %Param = @_;
    my $DataArray = [];
    # check needed stuff
    foreach (qw()) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
    # please add for each new check a part like this
    my $OneCheck = $Self->MemorySwapCheck();
    push (@{$DataArray}, $OneCheck);

    return $DataArray;
}

=item MemorySwapCheck()

returns a hash reference with MemorySwapCheck information.

$MemorySwapCheckHash =>
    {
        Key => 'Plattform',
        Name => 'Plattform',
        Comment => 'Linux',
        Description => 'Please add more memory.',
        Check => 'OK',
    };

# check if config value availible
if ($Param{Type}) {
    print STDERR "TYPE: " . $Param{Type};
}

=cut

sub MemorySwapCheck {
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

    my %MemTmpInfo = ();
    # If used OS is a linux system
    if ($^O =~ /linux/ || /unix/ || /netbsd/ || /freebsd/ || /Darwin/) {
        if (-e "/proc/meminfo") {
            open(MEMINFOFILE, "</proc/meminfo");
            while(<MEMINFOFILE>) {
                my $TmpLine = $_;
                if ($TmpLine =~ /MemTotal/) {
                    $TmpLine =~ s/^.*?(\d+).*$/$1/;
                    $MemTmpInfo{MemorySwapCheck}{MemTotal} = $TmpLine;
                }
                elsif ($TmpLine =~ /MemFree/) {
                    $TmpLine =~ s/^.*?(\d+).*$/$1/;
                    $MemTmpInfo{MemorySwapCheck}{MemFree} = $TmpLine;
                }
                elsif ($TmpLine =~ /SwapTotal/) {
                    $TmpLine =~ s/^.*?(\d+).*$/$1/;
                    $MemTmpInfo{MemorySwapCheck}{SwapTotal} = $TmpLine;
                }
                elsif ($TmpLine =~ /SwapFree/) {
                    $TmpLine =~ s/^.*?(\d+).*$/$1/;
                    $MemTmpInfo{MemorySwapCheck}{SwapFree} = $TmpLine;
                }
            }
            close(MEMINFOFILE);
        }
    }
    elsif ($^O =~ /win/i) {# TODO / Ausgabe unter Windows noch pruefen

    }

    # build return hash
    my $Describtion = "The Host System has: \n"
        .'- '.sprintf ("%.0f", ($MemTmpInfo{MemorySwapCheck}{MemTotal} / 1024)) . " MB Memory total \n"
        .'- '.sprintf ("%.0f", ($MemTmpInfo{MemorySwapCheck}{MemFree} / 1024)) . " MB Memory free \n"
        .'- '.sprintf ("%.0f", ($MemTmpInfo{MemorySwapCheck}{SwapTotal} / 1024)) . " MB Swap total \n"
        .'- '.sprintf ("%.0f", ($MemTmpInfo{MemorySwapCheck}{SwapFree} / 1024)) . " MB Swap free ";

    if ((($MemTmpInfo{MemorySwapCheck}{SwapFree})/($MemTmpInfo{MemorySwapCheck}{SwapTotal}) < 60) ||
        (($MemTmpInfo{MemorySwapCheck}{SwapTotal})-($MemTmpInfo{MemorySwapCheck}{SwapFree}) > 20000)
    ) {
        $ReturnHash = {
            Key => 'MemorySwapCheck',
            Name => 'Memory Swap Check',
            Description => "A Memory Check. We try to find out if \n"
                ."SwapFree : SwapTotal < 60 % \n"
                ." or if more than 200 MB Swap is used.",
            Comment => "$Describtion",
            Check => 'OK',
        };
    }
    else {
        $ReturnHash = {
            Key => 'MemorySwapCheck',
            Name => "A Memory Check. We try to find out if \n"
                ."SwapFree : SwapTotal < 60 %"
                ." or if more than 200 MB Swap is used.",
            Comment => "$Describtion",
            Description => 'A Memory Check.',
            Check => 'Failed',
        };
    }
    return $ReturnHash;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see http://www.gnu.org/licenses/gpl.txt.

=cut

=head1 VERSION

$Revision: 1.2 $ $Date: 2007/05/08 08:00:56 $

=cut