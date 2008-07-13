# --
# Kernel/System/Support/Database.pm - all required system information
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: Database.pm,v 1.9 2008/07/13 23:25:41 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::Support::Database;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.9 $) [1];

=head1 NAME

Kernel::System::Support::Database - global system information

=head1 SYNOPSIS

All required system information to a running OTRS host.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create Database info object

    use Kernel::Config;
    use Kernel::System::Log;
    my $ConfigObject = Kernel::Config->new();
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
    );

    $SystemInfoObject = Kernel::System::Support::Database->new(
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
    for (qw(ConfigObject LogObject MainObject DBObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    return $Self;
}

=item AdminChecksGet()

returns a array reference with AdminChecks information.

$DatabaseArray => [
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

    my $DataArray = [];

    # check needed stuff
    for (qw()) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # ------------------------------------------------------------ #
    # Get information about all databases
    # ------------------------------------------------------------ #

    # please add for each new check a part like this
    #    my $OneCheck = $Self->Check();
    #    push (@{$DataArray}, $OneCheck);

    # ------------------------------------------------------------ #
    # Get information about used database
    # ------------------------------------------------------------ #

    # try to find out which ticket database is configured
    my $DatabaseType = $Self->{DBObject}->{'DB::Type'};

    # try to get availible modules and the directory name
    my $DirName = $Self->{ConfigObject}->Get('Home') . "/Kernel/System/Support/Database";

    # read all availible modules in @List
    my @List = glob( $DirName . "/*.pm" );
    for my $File (@List) {

        # remove .pm
        $File =~ s/^.*\/(.+?)\.pm$/$1/;
        if ( $DatabaseType =~ /ODBC/i ) {
            $DatabaseType = $Self->{ConfigObject}->Get('Database::Type');
        }
        if ( $DatabaseType =~ /^$File/i ) {
            my $GenericModule = "Kernel::System::Support::Database::$File";

            # load module $GenericModule and check if loadable
            if ( $Self->{MainObject}->Require($GenericModule) ) {

                # create new object
                my $SupportObject = $GenericModule->new( %{$Self} );
                if ($SupportObject) {
                    my $ArrayRef = $SupportObject->AdminChecksGet();
                    if ( $ArrayRef && ref($ArrayRef) eq 'ARRAY' ) {
                        push( @{$DataArray}, @{$ArrayRef} );
                    }
                }
            }
        }

    }

    return $DataArray;
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

# check if config value availible
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
    elsif ( $^O =~ /win/i ) {

    }
    return $ReturnHash;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.

=cut

=head1 VERSION

$Revision: 1.9 $ $Date: 2008/07/13 23:25:41 $

=cut
