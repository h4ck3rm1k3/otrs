# --
# Kernel/System/Support/OTRS.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: OTRS.pm,v 1.2 2007/07/11 12:52:54 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::OTRS;

use strict;

use vars qw(@ISA $VERSION);
$VERSION = '$Revision: 1.2 $';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

=head1 NAME

Kernel::System::Support::OTRS - global system informations

=head1 SYNOPSIS

All required system informations to a running OTRS host.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create OTRS info object

    use Kernel::Config;
    use Kernel::System::Log;
    my $ConfigObject = Kernel::Config->new();
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
    );

    $SystemInfoObject = Kernel::System::Support::OTRS->new(
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

$OTRSArray => [
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
#    # please add for each new check a part like this
#    my $OneCheck = $Self->Check(
#        Type => $Param{ModuleInputHash}->{Type} || '',
#    );
#    push (@{$DataArray}, $OneCheck);

    return $DataArray;
}

=item AdminChecksGet()

returns a array reference with AdminChecks information.

$OTRSArray => [
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
    my $DataArray = [];
    # check needed stuff
    foreach (qw()) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
#    # please add for each new check a part like this
#    my $OneCheck = $Self->Check();
#    push (@{$DataArray}, $OneCheck);

    return $DataArray;
}

sub OTRSLogGet {
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
    if ($^O =~ /linux/ || /unix/ || /netbsd/ || /freebsd/ || /Darwin/) {
        my $Filehandle = '';
        my $TmpLine = '';
        my $Logfile = $Self->{Home}."/var/log/support.log";

        if (open ($Filehandle, "$Logfile")) {
            while (<$Filehandle>) {
                $TmpLine .= $_;
            }
            close ($Filehandle);
            if($TmpLine) {
                $ReturnHash =
                {
                    Key => 'OTRSLog',
                    Name => 'OTRSLog',
                    Comment => 'The OTRS Log',
                    Description => $TmpLine,
                    Check => 'OK',
                };
            }
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

$Revision: 1.2 $ $Date: 2007/07/11 12:52:54 $

=cut