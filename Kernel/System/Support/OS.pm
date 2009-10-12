# --
# Kernel/System/Support/OS.pm - all required system information
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: OS.pm,v 1.13 2009/10/12 19:50:46 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Support::OS;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.13 $) [1];

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

sub AdminChecksGet {
    my ( $Self, %Param ) = @_;

    # add new function name here
    my @ModuleList = (
        '_CPULoadCheck',      '_DiskUsageCheck',  '_MemorySwapCheck',
        '_DistributionCheck', '_KernelInfoCheck', '_PerlCheck',
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

sub _DistributionCheck {
    my ( $Self, %Param ) = @_;

    my $ReturnHash = {};

    # If used OS is a linux system
    if ( $^O =~ /(linux|unix|netbsd|darwin)/i ) {
        my $TmpLine = "";
        my $Distribution;
        if ( open( $Distribution, '<', "/etc/issue" ) ) {
            while (<$Distribution>) {
                $TmpLine .= $_;
            }
            close($Distribution);
            if ($TmpLine) {
                $TmpLine =~ s/\\.*//;
                $TmpLine =~ s/\n//g;
                $ReturnHash = {
                    Name        => 'Distribution',
                    Description => "Shows the used distribution.",
                    Comment     => "\"$TmpLine\" is used.",
                    Check       => 'OK',
                };
            }
        }
        else {
            $ReturnHash = {
                Name        => 'Distribution',
                Description => "Shows the used distribution.",
                Comment     => "Can\'t find /etc/issue...",
                Check       => 'Failed',
            };
        }
    }
    elsif ( $^O =~ /win/i ) {
        require Win32;
        my $WinVersion = Win32::GetOSName();
        $ReturnHash = {
            Name        => 'Distribution',
            Description => "Shows the used distribution.",
            Comment     => "$WinVersion is used.",
            Check       => 'OK',
        };
    }
    elsif ( $^O =~ /freebsd/i ) {
        $ReturnHash = {
            Name        => 'Distribution',
            Description => "Shows the used distribution.",
            Comment     => "$^O is used.",
            Check       => 'OK',
        };
    }
    return $ReturnHash;
}

sub _KernelInfoCheck {
    my ( $Self, %Param ) = @_;

    my $ReturnHash = {};

    # If used OS is a linux system
    if ( $^O =~ /(linux|unix|netbsd|freebsd|darwin)/i ) {
        my $TmpLine = "";
        my $KernelInfo;
        if ( open( $KernelInfo, "uname -a |" ) ) {
            while (<$KernelInfo>) {
                $TmpLine .= $_;
            }
            close($KernelInfo);
            if ($TmpLine) {
                $TmpLine =~ s/\s+$//g;
                $TmpLine =~ s/^\s+//g;
                $ReturnHash = {
                    Name        => 'Kernel Version',
                    Description => "Shows the used Kernel version.",
                    Comment     => "\"$TmpLine\" is used.",
                    Check       => 'OK',
                };
            }
        }
        else {
            $ReturnHash = {
                Name        => 'Kernel Version',
                Description => "Shows the used Kernel version.",
                Comment     => "Can\'t execute uname -a...",
                Check       => 'Critical',
            };
        }
    }
    elsif ( $^O =~ /win/i ) {
        return;
    }
    return $ReturnHash;
}

sub _PerlCheck {
    my ( $Self, %Param ) = @_;

    my $ReturnHash = {};

    # check verison string
    my $Version = sprintf "%vd", $^V;
    my $OS      = sprintf "$^O", $^V;
    if ( $Version =~ /(\d+)\.(\d+)\.(\d+)/i ) {
        if ( $1 <= 5 && $2 <= 8 && $3 <= 7 ) {
            $ReturnHash = {
                Name        => 'PerlCheck',
                Description => "Check Perl version.",
                Comment =>
                    "Your Perl $Version ($OS) is to old, you should upgrade to Perl 5.8.8 or higher.",
                Check => 'Failed',
            };

        }
        else {
            $ReturnHash = {
                Name        => 'PerlCheck',
                Description => "Check Perl Version.",
                Comment     => "Perl $Version ($OS) is used.",
                Check       => 'OK',
            };
        }
    }
    else {
        $ReturnHash = {
            Name        => 'PerlCheck',
            Description => "Check Perl Version.",
            Comment     => "Unable to parse version string ($Version / $OS).",
            Check       => 'Critical',
        };
    }
    return $ReturnHash;
}

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
                    Name        => 'Memory Swap Check',
                    Description => "A Memory Check. We try to find out if "
                        . "SwapFree : SwapTotal < 60 % "
                        . " or if more than 200 MB Swap is used.",
                    Comment => "No Swap enabled!",
                    Check   => 'Critical',
                };
            }
            elsif (
                ( ($SwapFree) / ($SwapTotal) < 60 )
                || ( ($SwapTotal) - ($SwapFree) > 20000 )
                )
            {
                $ReturnHash = {
                    Name        => 'Memory Swap Check',
                    Description => "A Memory Check. We try to find out if "
                        . "SwapFree : SwapTotal < 60 % "
                        . " or if more than 200 MB Swap is used.",
                    Comment => "$Describtion",
                    Check   => 'OK',
                };
            }
            else {
                $ReturnHash = {
                    Name        => 'Memory Swap Check',
                    Description => "A Memory Check. We try to find out if "
                        . "SwapFree : SwapTotal < 60 % "
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
                    Name        => 'CPU Load',
                    Description => "A CPU load check. We try to find out if "
                        . "the system load in the last 15 minutes > 1.",
                    Comment => "$Describtion",
                    Check   => 'OK',
                };
            }
            else {
                $ReturnHash = {
                    Name        => 'CPU Load',
                    Description => "A CPU load check. We try to find out if "
                        . "the system load in the last 15 minutes < 1.",
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
        if ( open( $In, "df -lx tmpfs -x iso9960 -x udf |" ) ) {
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
                $Message = "Disk is full ($Message).";
            }
            else {
                $Message = "Disk usage ($Message).";
            }
        }
        $Data = {
            Name        => 'Disk Usage',
            Description => "Check disk usage.",
            Comment     => $Message,
            Check       => $Check,
        };
        return $Data;
    }
}

1;
