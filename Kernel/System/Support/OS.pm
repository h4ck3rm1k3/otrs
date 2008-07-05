# --
# Kernel/System/Support/OS.pm - all required system information
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: OS.pm,v 1.9 2008/07/05 14:35:22 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::Support::OS;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.9 $) [1];

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

sub SupportInfoGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ModuleInputHash} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
        return;
    }
    if ( ref( $Param{ModuleInputHash} ) ne 'HASH' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'ModuleInputHash must be a hash reference!',
        );
        return;
    }

    # add new function name here
    my @ModuleList = (
        '_CPULoadCheck', '_DiskUsageCheck', '_MemorySwapCheck',
        '_DistributionCheck', '_KernelInfoCheck', '_PerlCheck',
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

sub AdminChecksGet {
    my ( $Self, %Param ) = @_;

    # add new function name here
    my @ModuleList = (
        '_CPULoadCheck', '_DiskUsageCheck', '_MemorySwapCheck',
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
                    Key         => 'DistributionCheck',
                    Name        => 'Distribution',
                    Description => "Shows the used distribution.",
                    Comment     => "\"$TmpLine\" is used.",
                    Check       => 'OK',
                };
            }
        }
        else {
            $ReturnHash = {
                Key         => 'DistributionCheck',
                Name        => 'Distribution',
                Description => "Shows the used distribution.",
                Comment     => "Can´\'t find /etc/issue...",
                Check       => 'Failed',
            };
        }
    }
    elsif ( $^O =~ /(win|freebsd)/i ) {
        $ReturnHash = {
            Key         => 'DistributionCheck',
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
                    Key         => 'KernelVersionCheck',
                    Name        => 'Kernel Version',
                    Description => "Shows the used Kernel version.",
                    Comment     => "\"$TmpLine\" is used.",
                    Check       => 'OK',
                };
            }
        }
        else {
            $ReturnHash = {
                Key         => 'KernelVersionCheck',
                Name        => 'Kernel Version',
                Description => "Shows the used Kernel version.",
                Comment     => "Can´\'t execute uname -a...",
                Check       => 'Failed',
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
    if ( $Version =~ /(\d+)\.(\d+)\.(\d+)/i ) {
        if ( $1 <= 5 && $2 <= 8 && $3 <= 7 ) {
            $ReturnHash = {
                Key         => 'PerlCheck',
                Name        => 'PerlCheck',
                Description => "Check Perl Version.",
                Comment     => "Perl $Version is to old, you should upgrade to Perl 5.8.8 or higher.",
                Check       => 'Failed',
            };

        }
        else {
            $ReturnHash = {
                Key         => 'PerlCheck',
                Name        => 'PerlCheck',
                Description => "Check Perl Version.",
                Comment     => "Perl $Version is used.",
                Check       => 'OK',
            };
        }
    }
    else {
        $ReturnHash = {
            Key         => 'PerlCheck',
            Name        => 'PerlCheck',
            Description => "Check Perl Version.",
            Comment     => "Unable to parse versio string ($Version).",
            Check       => 'Failed',
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
                    Key         => 'MemorySwapCheck',
                    Name        => 'Memory Swap Check',
                    Description => "A Memory Check. We try to find out if "
                        . "SwapFree : SwapTotal < 60 % "
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
                    Description => "A Memory Check. We try to find out if "
                        . "SwapFree : SwapTotal < 60 % "
                        . " or if more than 200 MB Swap is used.",
                    Comment => "$Describtion",
                    Check   => 'OK',
                };
            }
            else {
                $ReturnHash = {
                    Key         => 'MemorySwapCheck',
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
                    Key         => 'CPULoadCheck',
                    Name        => 'CPU Load',
                    Description => "A CPU load check. We try to find out if "
                        . "the system load in the last 15 minutes > 1.",
                    Comment => "$Describtion",
                    Check   => 'OK',
                };
            }
            else {
                $ReturnHash = {
                    Key         => 'CPULoadCheck',
                    Name        => 'CPU Load',
                    Description => "A CPU load check. We try to find out if "
                        . "the system load in the last 15 minutes < 1",
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
                $Message = "Disk is full ($Message).";
            }
            else {
                $Message = "Disk usage ($Message).";
            }
        }
        $Data = {
            Key         => 'disk usage',
            Name        => 'Disk Usage',
            Description => "Check disk usage.",
            Comment     => $Message,
            Check       => $Check,
        };
        return $Data;
    }
}

1;
