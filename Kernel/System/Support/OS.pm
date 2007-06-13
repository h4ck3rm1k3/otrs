# --
# Kernel/System/Support/OS.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: OS.pm,v 1.2 2007/06/13 09:57:41 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::OS;

use strict;

use vars qw(@ISA $VERSION);
$VERSION = '$Revision: 1.2 $';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

=head1 NAME

Kernel::System::Support::OS - global system informations

=head1 SYNOPSIS

All required system informations to a running OTRS host.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create OS info object

use Kernel::Config;
use Kernel::System::Log;
my $ConfigObject = Kernel::Config->new();
my $LogObject = Kernel::System::Log->new(
    ConfigObject => $ConfigObject,
);

$SystemInfoObject = Kernel::System::Support::OS->new(
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
    my $ConfigArray = [

    ];
    # return config array
    return $ConfigArray;
}

=item SupportInfoGet()

returns a array reference with support information.

$OSArray => [
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
    my $OneCheck = $Self->DistributionCheck(
        Type => $Param{ModuleInputHash}->{Type} || '',
    );
    push (@{$DataArray}, $OneCheck);

    # please add for each new check a part like this
    $OneCheck = $Self->KernelInfoCheck(
        Type => $Param{ModuleInputHash}->{Type} || '',
    );
    push (@{$DataArray}, $OneCheck);

    return $DataArray;
}

=item AdminChecksGet()

returns a array reference with AdminChecks information.

$OSArray => [
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
    my @DataArray = ();
    # check needed stuff
    foreach (qw()) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
    # please add for each new check a part like this
    my $OneCheck = $Self->DistributionCheck();
    push (@DataArray, $OneCheck);

    $OneCheck = $Self->KernelInfoCheck();
    push (@DataArray, $OneCheck);

    return \@DataArray;
}

=item DistributionCheck()

returns a hash reference with DistributionCheck information.

$DistributionCheck =>
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

sub DistributionCheck {
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

    # If used OS is a linux system
    if ($^O =~ /(linux|unix|netbsd|freebsd|darwin)/i) {
        my $TmpLine = "";
        if (open(DISTRIBUTION, "</etc/issue")) {
            while(<DISTRIBUTION>) {
                $TmpLine .= $_;
            }
            close(DISTRIBUTION);
            if($TmpLine) {
                $TmpLine =~ s/\\.*//;
                $TmpLine =~ s/\n//g;
                $ReturnHash = {
                    Key => 'DistributionCheck',
                    Name => 'Distribution',
                    Description => "Shows the used distribution. \n",
                    Comment => "\"$TmpLine\" is used.",
                    Check => 'OK',
                };
            }
        }
        else {
            $ReturnHash = {
                Key => 'DistributionCheck',
                Name => 'Distribution',
                Description => "Shows the used distribution. \n",
                Comment => "Can´\'t find /etc/issue... \n",
                Check => 'Failed',
            };
        }
    }
    elsif ($^O =~ /win/i) {# TODO / Ausgabe unter Windows noch pruefen

    }
    return $ReturnHash;
}

sub KernelInfoCheck {
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

    # If used OS is a linux system
    if ($^O =~ /(linux|unix|netbsd|freebsd|darwin)/i) {
        my $TmpLine = "";
        if (open(KERNELINFO, "uname -a |")) {
            while(<KERNELINFO>) {
                $TmpLine .= $_;
            }
            close(KERNELINFO);
            if($TmpLine) {
                $TmpLine =~ s/\s+$//g;
                $TmpLine =~ s/^\s+//g;
                $ReturnHash = {
                    Key => 'KernelVersionCheck',
                    Name => 'Kernel Version',
                    Description => "Shows the used Kernel version. \n",
                    Comment => "\"$TmpLine\" is used.",
                    Check => 'OK',
                };
            }
        }
        else {
            $ReturnHash = {
                Key => 'KernelVersionCheck',
                Name => 'Kernel Version',
                Description => "Shows the used Kernel version. \n",
                Comment => "Can´\'t execute uname -a... \n",
                Check => 'Failed',
            };
        }
    }
    elsif ($^O =~ /win/i) {# TODO / Ausgabe unter Windows noch pruefen

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

$Revision: 1.2 $ $Date: 2007/06/13 09:57:41 $

=cut
