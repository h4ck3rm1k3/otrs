# --
# Kernel/System/Support/OS.pm - all required system information
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: OS.pm,v 1.8 2008/06/03 09:32:21 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::Support::OS;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.8 $) [1];

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
    my $ConfigArray = [

    ];

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
        $Self->{LogObject}
            ->Log( Priority => 'error', Message => "ModuleInputHash must be a hash reference!" );
        return;
    }

    # add new function name here
    my @ModuleList = (
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
                    Description => "Shows the used distribution. \n",
                    Comment     => "\"$TmpLine\" is used.",
                    Check       => 'OK',
                };
            }
        }
        else {
            $ReturnHash = {
                Key         => 'DistributionCheck',
                Name        => 'Distribution',
                Description => "Shows the used distribution. \n",
                Comment     => "Can´\'t find /etc/issue... \n",
                Check       => 'Failed',
            };
        }
    }
    elsif ( $^O =~ /(win|freebsd)/i ) {
        $ReturnHash = {
            Key         => 'DistributionCheck',
            Name        => 'Distribution',
            Description => "Shows the used distribution. \n",
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
                    Description => "Shows the used Kernel version. \n",
                    Comment     => "\"$TmpLine\" is used.",
                    Check       => 'OK',
                };
            }
        }
        else {
            $ReturnHash = {
                Key         => 'KernelVersionCheck',
                Name        => 'Kernel Version',
                Description => "Shows the used Kernel version. \n",
                Comment     => "Can´\'t execute uname -a... \n",
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

1;
