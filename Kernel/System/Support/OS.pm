# --
# Kernel/System/Support/OS.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: OS.pm,v 1.7 2007/11/22 15:57:24 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::OS;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

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
        '_DistributionCheck', '_KernelInfoCheck',
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
    my ( $Self, %Param ) = @_;

    # add new function name here
    my @ModuleList = (
        '_DistributionCheck', '_KernelInfoCheck',
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

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see http://www.gnu.org/licenses/gpl.txt.

=cut

=head1 VERSION

$Revision: 1.7 $ $Date: 2007/11/22 15:57:24 $

=cut
