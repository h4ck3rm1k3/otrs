# --
# Kernel/System/Support/Webserver.pm - all required system information
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: Webserver.pm,v 1.9 2009/08/26 22:45:42 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Support::Webserver;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.9 $) [1];

=head1 NAME

Kernel::System::Support::Webserver - global system information

=head1 SYNOPSIS

All required system information to a running OTRS host.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create Webserver info object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::Main;
    use Kernel::System::Support::Webserver;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
    my $SystemInfoObject = Kernel::System::Support::Webserver->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for (qw(ConfigObject LogObject MainObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    return $Self;
}

=item AdminChecksGet()

returns a array reference with AdminChecks information.

$WebserverArray => [
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
    # Get information about all Webservers
    # ------------------------------------------------------------ #

    # please add for each new check a part like this
    #    my $OneCheck = $Self->Check();
    #    push (@{$DataArray}, $OneCheck);

    # ------------------------------------------------------------ #
    # Get information about used Webserver
    # ------------------------------------------------------------ #

    # try to find out which Webserver is configured
    my $WebserverType = '';
    if ( $ENV{SERVER_SOFTWARE} =~ /apache/i ) {
        $WebserverType = 'Apache';
    }
    else {
        $WebserverType = 'IIS';
    }

    # try to get available modules and the directory name
    my $DirName = $Self->{ConfigObject}->Get('Home') . '/Kernel/System/Support/Webserver';

    # read all available modules in @List
    my @List = glob( $DirName . '/*.pm' );
    for my $File (@List) {

        # remove .pm
        $File =~ s/^.*\/(.+?)\.pm$/$1/;
        if ( $WebserverType =~ /^$File/i ) {
            my $GenericModule = "Kernel::System::Support::Webserver::$File";

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
    elsif ( $^O =~ /win/i ) {

    }
    return $ReturnHash;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=cut

=head1 VERSION

$Revision: 1.9 $ $Date: 2009/08/26 22:45:42 $

=cut
