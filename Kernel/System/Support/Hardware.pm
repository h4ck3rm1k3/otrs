# --
# Kernel/System/Support/Hardware.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: Hardware.pm,v 1.11 2007/11/22 14:57:20 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::Hardware;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.11 $) [1];

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
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for (qw(ConfigObject LogObject)) {
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
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw()) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
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
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ModuleInputHash} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
        return;
    }
    if ( ref( $Param{ModuleInputHash} ) ne 'HASH' ) {
        $Self->{LogObject}
            ->Log( Priority => 'error', Message => "ModuleInputHash must be a hash reference!" );
        return;
    }

    # add new function name here
    my @ModuleList = (
        '_CPULoadCheck', '_DiskUsageCheck',
        '_MemorySwapCheck',
    );

    my @DataArray;

    FUNCTIONNAME:
    for my $FunctionName (@ModuleList) {

        # run function and get check data
        my $Check = $Self->$FunctionName( Type => $Param{ModuleInputHash}->{Type} || '', );

        next FUNCTIONNAME if !$Check;

        # attach check data if valid
        push @DataArray, $Check;
    }

    return \@DataArray;
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
    my ( $Self, %Param ) = @_;

    # add new function name here
    my @ModuleList = (
        '_CPULoadCheck', '_DiskUsageCheck',
        '_MemorySwapCheck',
    );

    my @DataArray;

    FUNCTIONNAME:
    for my $FunctionName (@ModuleList) {

        # run function and get check data
        my $Check = $Self->$FunctionName();

        next FUNCTIONNAME if !$Check;

        # attach check data if valid
        push @DataArray, $Check;
    }

    return \@DataArray;
}

=item _MemorySwapCheck()

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
sub _MemorySwapCheck {
    my ( $Self, %Param ) = @_;
    my $ReturnHash = {};

    my $MemInfoFile;
    my $MemTotal;
    my $MemFree;
    my $SwapTotal;
    my $SwapFree;

    # If used OS is a linux system
    if ( $^O =~ /(linux|unix|netbsd|freebsd|darwin)/i ) {
        if ( open( $MemInfoFile, '<', "/proc/meminfo" ) ) {
            while (<$MemInfoFile>) {
                my $TmpLine = $_;
                if ( $TmpLine =~ /MemTotal/ ) {
                    $TmpLine =~ s/^.*?(\d+).*$/$1/;
                    $MemTotal = int($TmpLine);
                }
                elsif ( $TmpLine =~ /MemFree/ ) {
                    $TmpLine =~ s/^.*?(\d+).*$/$1/;
                    $MemFree = int($TmpLine);
                }
                elsif ( $TmpLine =~ /SwapTotal/ ) {
                    $TmpLine =~ s/^.*?(\d+).*$/$1/;
                    $SwapTotal = int($TmpLine);
                }
                elsif ( $TmpLine =~ /SwapFree/ ) {
                    $TmpLine =~ s/^.*?(\d+).*$/$1/;
                    $SwapFree = int($TmpLine);
                }
            }
            close($MemInfoFile);

            # build return hash
            my $Describtion
                = "The Host System has: \n"
                . int( $MemTotal / 1024 )
                . " MB Memory total \n"
                . int( $MemFree / 1024 )
                . " MB Memory free \n"
                . int( $SwapTotal / 1024 )
                . " MB Swap total \n"
                . int( $SwapFree / 1024 )
                . " MB Swap free ";

            if ( !$SwapTotal ) {
                $ReturnHash = {
                    Key         => 'MemorySwapCheck',
                    Name        => 'Memory Swap Check',
                    Description => "A Memory Check. We try to find out if \n"
                        . "SwapFree : SwapTotal < 60 % \n"
                        . " or if more than 200 MB Swap is used.",
                    Comment => "No Swap enabled!",
                    Check   => 'Failed',
                };
            }
            elsif (( ($SwapFree) / ($SwapTotal) < 60 )
                || ( ($SwapTotal) - ($SwapFree) > 20000 ) )
            {
                $ReturnHash = {
                    Key         => 'MemorySwapCheck',
                    Name        => 'Memory Swap Check',
                    Description => "A Memory Check. We try to find out if \n"
                        . "SwapFree : SwapTotal < 60 % \n"
                        . " or if more than 200 MB Swap is used.",
                    Comment => "$Describtion",
                    Check   => 'OK',
                };
            }
            else {
                $ReturnHash = {
                    Key         => 'MemorySwapCheck',
                    Name        => 'Memory Swap Check',
                    Description => "A Memory Check. We try to find out if \n"
                        . "SwapFree : SwapTotal < 60 % \n"
                        . " or if more than 200 MB Swap is used.",
                    Comment => "$Describtion",
                    Check   => 'Failed',
                };
            }
        }
    }
    elsif ( $^O =~ /win/i ) {
        return;
    }

    return $ReturnHash;
}

sub _CPULoadCheck {
    my ( $Self, %Param ) = @_;

    my $ReturnHash = {};

    # check needed stuff
    for (qw()) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    my @SplitArray = {};

    # If used OS is a linux system
    if ( $^O =~ /(linux|unix|netbsd|freebsd|darwin)/i ) {
        if ( -e "/proc/loadavg" ) {
            my $LoadFile;
            open( $LoadFile, '<', "/proc/loadavg" );
            while (<$LoadFile>) {
                @SplitArray = split( " ", $_ );
            }
            close($LoadFile);

            # build return hash
            my $Describtion
                = "The Host System has a load: \n"
                . $SplitArray[0]
                . " in the last 1 minute \n"
                . $SplitArray[1]
                . " in the last 5 minutes \n"
                . $SplitArray[2]
                . " in the last 15 minutes";

            if ( $SplitArray[2] < '1.00' ) {
                $ReturnHash = {
                    Key         => 'CPULoadCheck',
                    Name        => 'CPU Load',
                    Description => "A CPU load check. We try to find out if \n"
                        . "the system load in the last 15 minutes > 1. \n",
                    Comment => "$Describtion",
                    Check   => 'OK',
                };
            }
            else {
                $ReturnHash = {
                    Key         => 'CPULoadCheck',
                    Name        => 'CPU Load',
                    Description => "A CPU load check. We try to find out if \n"
                        . "the system load in the last 15 minutes < 1 \n",
                    Comment => "$Describtion",
                    Check   => 'Failed',
                };
            }
        }
    }
    elsif ( $^O =~ /win/i ) {
        return;
    }
    return $ReturnHash;
}

sub _DiskUsageCheck {
    my ( $Self, %Param ) = @_;

    my $Data    = {};
    my $Check   = 'OK';
    my $Message = '';

    # If used OS is a linux system
    if ( $^O =~ /(linux|unix|netbsd|freebsd|darwin)/i ) {
        my $In;
        if ( open( $In, "df -l |" ) ) {
            while (<$In>) {
                if ( $_ =~ /^(.+?)\s.*\s(\d\d\d|\d\d|\d)%.+?$/ ) {
                    if ( $2 > 90 ) {
                        $Check = 'Failed';
                    }
                    if ( $Check ne 'Failed' && $2 > 85 ) {
                        $Check = 'Critical';
                    }
                    if ($Message) {
                        $Message .= ",";
                    }
                    $Message .= "$1\[$2%\]";
                }
            }
            close($In);
            if ( $Check eq 'Failed' ) {
                $Message = "Disk ist full ($Message).";
            }
            else {
                $Message = "Disk usage ($Message).";
            }
        }
        $Data = {
            Key         => 'disk usage',
            Name        => 'disk usage',
            Description => "Check disk usage.",
            Comment     => $Message,
            Check       => $Check,
        };
        return $Data;
    }
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

$Revision: 1.11 $ $Date: 2007/11/22 14:57:20 $

=cut
