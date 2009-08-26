# --
# Kernel/System/Support/Cron.pm - all required system information
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: Cron.pm,v 1.4 2009/08/26 22:45:42 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Support::Cron;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = '$Revision: 1.4 $';

=head1 NAME

Kernel::System::Support::Cron - global system information

=head1 SYNOPSIS

All required system information to a running OTRS host.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create Cron info object

    use Kernel::Config;
    use Kernel::System::Log;
    my $ConfigObject = Kernel::Config->new();
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
    );

    $SystemInfoObject = Kernel::System::Support::Cron->new(
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

=item AdminChecksGet()

returns a array reference with AdminChecks information.

$CronArray => [
            {
                Name => 'Plattform',
                Comment => 'Linux',
                Description => 'Please add more memory.',
                Check => 'OK',
            },
            {
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
    my @ModuleList = ();

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

=item _Check()

returns a hash reference with Check information.

$CheckHash =>
            {
                Name => 'Plattform',
                Comment => 'Linux',
                Description => 'Please add more memory.',
                Check => 'OK',
            };

# check if config value is available
if ($Param{Type}) {
    print STDERR "TYPE: " . $Param{Type};
}

=cut

sub _Check {
    my ( $Self, %Param ) = @_;

    my $ReturnHash = {};

    # check needed stuff
    for (qw()) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # If used OS is a linux system
    if ( $^O =~ /linux/ || /unix/ || /netbsd/ || /freebsd/ || /Darwin/ ) {

    }
    elsif ( $^O =~ /win/i ) {    # TODO / Ausgabe unter Windows noch pruefen

    }
    return $ReturnHash;
}

1;
