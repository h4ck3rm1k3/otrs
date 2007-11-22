# --
# Kernel/System/Support/Webserver.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: Webserver.pm,v 1.5 2007/11/22 13:05:10 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::Webserver;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.5 $) [1];

=head1 NAME

Kernel::System::Support::Webserver - global system informations

=head1 SYNOPSIS

All required system informations to a running OTRS host.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create Webserver info object

    use Kernel::Config;
    use Kernel::System::Log;
    my $ConfigObject = Kernel::Config->new();
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
    );

    $SystemInfoObject = Kernel::System::Support::Webserver->new(
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
    for (qw(ConfigObject LogObject MainObject)) {
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

    # ------------------------------------------------------------ #
    # Get information about all Webservers
    # ------------------------------------------------------------ #

    # create config array
    my $ConfigArray = [];

    #    my $ConfigArray = [
    #        {
    #            Key => 'ApacheHome',
    #            Name => 'Apache Home Directory',
    #            Description => 'Please tell me the path to the Apache home directory (/etc/apache2)',
    #            Input => {
    #                Type => 'Text',
    #                Size => 40,
    #            },
    #        },
    #    ];

    # ------------------------------------------------------------ #
    # Get information about used Webserver
    # ------------------------------------------------------------ #

    # try to find out which Webserver is configured
    my $WebserverType = '';
    if ( $ENV{SERVER_SOFTWARE} =~ /^.*Apache.*$/i ) {
        $WebserverType = 'Apache.pm';
    }
    else {
        $WebserverType = 'IIS.pm';
    }

    # try to get availible modules and the directory name
    my $DirName = $Self->{ConfigObject}->Get('Home') . "/Kernel/System/Support/Webserver";

    # read all availible modules in @List
    my @List = glob( $DirName . "/*.pm" );
    for my $File (@List) {

        # remove .pm
        $File =~ s/^.*\/(.+?)\.pm$/$1/;
        if ( $WebserverType eq $File ) {
            my $GenericModule = "Kernel::System::Support::Webserver::$File";

            # load module $GenericModule and check if loadable
            if ( $Self->{MainObject}->Require($GenericModule) ) {

                # create new object
                my $SupportObject = $GenericModule->new( %{$Self} );
                if ($SupportObject) {
                    my $ArrayRef = $SupportObject->SupportConfigArrayGet();
                    if ( $ArrayRef && ref($ArrayRef) eq 'ARRAY' ) {
                        push( @{$ConfigArray}, @{$ArrayRef} );
                    }
                }
            }
        }
    }

    # return config array
    return $ConfigArray;
}

=item SupportInfoGet()

returns a array reference with support information.

$WebserverArray => [
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

    my $DataArray = [];

    # check needed stuff
    for (qw(ModuleInputHash)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    if ( ref( $Param{ModuleInputHash} ) ne 'HASH' ) {
        $Self->{LogObject}
            ->Log( Priority => 'error', Message => "ModuleInputHash must be a hash reference!" );
        return;
    }

    # ------------------------------------------------------------ #
    # Get information about all Webservers
    # ------------------------------------------------------------ #

    # please add for each new check a part like this
    #    my $OneCheck = $Self->Check(
    #        Type => $Param{ModuleInputHash}->{Type} || '',
    #    );
    #    push (@{$DataArray}, $OneCheck);

    # ------------------------------------------------------------ #
    # Get information about used Webserver
    # ------------------------------------------------------------ #

    # try to find out which Webserver is configured
    my $WebserverType = '';
    if ( $ENV{SERVER_SOFTWARE} =~ /^.*Apache.*$/i ) {
        $WebserverType = 'Apache';
    }
    else {
        $WebserverType = 'IIS';
    }

    # try to get availible modules and the directory name
    my $DirName = $Self->{ConfigObject}->Get('Home') . "/Kernel/System/Support/Webserver";

    # read all availible modules in @List
    my @List = glob( $DirName . "/*.pm" );
    for my $File (@List) {

        # remove .pm
        $File =~ s/^.*\/(.+?)\.pm$/$1/;
        if ( $WebserverType eq $File ) {
            my $GenericModule = "Kernel::System::Support::Webserver::$File";

            # load module $GenericModule and check if loadable
            if ( $Self->{MainObject}->Require($GenericModule) ) {

                # create new object
                my $SupportObject = $GenericModule->new( %{$Self} );
                if ($SupportObject) {
                    my $ArrayRef = $SupportObject->SupportInfoGet(
                        ModuleInputHash => $Param{ModuleInputHash}, );
                    if ( $ArrayRef && ref($ArrayRef) eq 'ARRAY' ) {
                        push( @{$DataArray}, @{$ArrayRef} );
                    }
                }
            }
        }
    }

    return $DataArray;
}

=item AdminChecksGet()

returns a array reference with AdminChecks information.

$WebserverArray => [
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
    if ( $ENV{SERVER_SOFTWARE} =~ /^.*Apache.*$/i ) {
        $WebserverType = 'Apache.pm';
    }
    else {
        $WebserverType = 'IIS.pm';
    }

    # try to get availible modules and the directory name
    my $DirName = $Self->{ConfigObject}->Get('Home') . "/Kernel/System/Support/Webserver";

    # read all availible modules in @List
    my @List = glob( $DirName . "/*.pm" );
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
did not receive this file, see http://www.gnu.org/licenses/gpl.txt.

=cut

=head1 VERSION

$Revision: 1.5 $ $Date: 2007/11/22 13:05:10 $

=cut
