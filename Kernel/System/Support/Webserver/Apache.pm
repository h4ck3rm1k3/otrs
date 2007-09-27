# --
# Kernel/System/Support/Webserver/Apache.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: Apache.pm,v 1.5 2007/09/27 12:13:32 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::Webserver::Apache;

use strict;

use vars qw(@ISA $VERSION);
$VERSION = '$Revision: 1.5 $';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

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
}

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

    my $OneCheck = $Self->ApacheDBICheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->ApacheReloadCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->ModPerlVersionCheck();
    push (@{$DataArray}, $OneCheck);

#    # please add for each new check a part like this
#    my $OneCheck = $Self->Check(
#        Type => $Param{ModuleInputHash}->{Type} || '',
#    );
#    push (@{$DataArray}, $OneCheck);

    return $DataArray;
}

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
    my $OneCheck = $Self->ApacheDBICheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->ApacheReloadCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->ModPerlVersionCheck();
    push (@{$DataArray}, $OneCheck);

    return $DataArray;
}

sub ApacheDBICheck {
    my $Self = shift;
    my %Param = @_;
    my $Data = {};

    # check if Apache::DBI is loaded
    my $ApacheDBI = 0;
    my $Check = '';
    my $Message = '';

    foreach my $Module (keys %INC) {
        $Module =~ s/\//::/g;
        $Module =~ s/\.pm$//g;
        if ($Module eq 'Apache::DBI' || $Module eq 'Apache2::DBI') {
            $ApacheDBI = $Module;
        }
    }
    if (!$ApacheDBI) {
        $Check = 'Critical';
        $Message = 'Apache::DBI should be used to get a better performance (pre establish datababase connections).';
    }
    else {
        $Check = 'OK';
        $Message = "$ApacheDBI";
    }
    $Data = {
        Key => 'Apache::DBI',
        Name => 'Apache::DBI',
        Description => "Check used Apache::DBI.",
        Comment => $Message,
        Check => $Check,
    },
    return $Data;
}

sub ApacheReloadCheck {
    my $Self = shift;
    my %Param = @_;
    my $Data = {};

    # reload check
    my $Check = 'Failed';
    my $Message = '';
    if ($ENV{MOD_PERL}) {
        eval "require mod_perl";
        if (defined $mod_perl::VERSION) {
            if ($mod_perl::VERSION >= 1.99) {
                # check if Apache::Reload is loaded
                my $ApacheReload = 0;
                foreach my $Module (keys %INC) {
                    $Module =~ s/\//::/g;
                    $Module =~ s/\.pm$//g;
                    if ($Module eq 'Apache::Reload' || $Module eq 'Apache2::Reload') {
                        $ApacheReload = $Module;
                    }
                }
                if (!$ApacheReload) {
                    $Check = 'Critical';
                    $Message = 'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler in Apache config file.';
                }
                else {
                    $Check = 'OK';
                    $Message = "$ApacheReload";
                }
            }
        }
    }
    else {
        $Check = 'Critical';
        $Message = 'You should use mod_perl to increase your performance very strong!';
    }
    $Data = {
        Key => 'Apache::Reload',
        Name => 'Apache::Reload',
        Description => "Check used Apache::Reload/Apache2::Reload.",
        Comment => $Message,
        Check => $Check,
    },
    return $Data;
}

sub ModPerlVersionCheck {
    my $Self = shift;
    my %Param = @_;
    my $Data = {};

    # check mod_perl version
    my $Check = 'Failed';
    my $Message = '';
    if ($ENV{MOD_PERL}) {
        if ($ENV{MOD_PERL} =~ /\/1.99/) {
            $Check = 'Critical';
            $Message = "You use a beta version of mod_perl ($ENV{MOD_PERL}), you should upgrade to a stable version.";
        }
        elsif ($ENV{MOD_PERL} =~ /\/1/) {
            $Check = 'Critical';
            $Message = "You should update mod_perl to 2.x ($ENV{MOD_PERL}).";
        }
        else {
            $Check = 'OK';
            $Message = "$ENV{MOD_PERL}";
        }
    }
    else {
        $Check = 'Critical';
        $Message = 'You should use mod_perl to increase your performance.';
    }
    $Data = {
        Key => 'mod_perl version',
        Name => 'mod_perl version',
        Description => "Check used mod_perl version.",
        Comment => $Message,
        Check => $Check,
    },
    return $Data;
}

1;
