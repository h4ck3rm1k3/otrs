# --
# Kernel/System/Support/Database/mysql.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: mysql.pm,v 1.11 2007/09/27 12:11:49 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::Database::mysql;

use strict;
use Kernel::System::XML;

use vars qw(@ISA $VERSION);
$VERSION = '$Revision: 1.11 $';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

sub new {
    my $Type = shift;
    my %Param = @_;
    # allocate new hash for object
    my $Self = {};
    bless ($Self, $Type);
    # check needed objects
    foreach (qw(ConfigObject LogObject DBObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    $Self->{XMLObject} = Kernel::System::XML->new(%Param);

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

    my $OneCheck = $Self->MaxAllowedPackageCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->QueryCacheSizeCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->TableCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->UTF8ClientCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->UTF8DatabaseCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->UTF8SupportCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->UTF8TableCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->VersionCheck();
    push (@{$DataArray}, $OneCheck);

#    # please add for each new check a part like this
#    my $OneCheck = $Self->AdminChecksGet(
#        Type => $Param{ModuleInputHash}->{Type} || '',
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
    # please add for each new check a part like this
    my $OneCheck = $Self->MaxAllowedPackageCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->QueryCacheSizeCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->TableCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->UTF8ClientCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->UTF8DatabaseCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->UTF8SupportCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->UTF8TableCheck();
    push (@{$DataArray}, $OneCheck);

    $OneCheck = $Self->VersionCheck();
    push (@{$DataArray}, $OneCheck);

    return $DataArray;
}

sub VersionCheck {
    my $Self = shift;
    my %Param = @_;
    my $Data = {};

    # version check
    my $Check = 'Failed';
    my $Message = 'No version found!';
    $Self->{DBObject}->Prepare(SQL => "show variables");
    while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[0] =~ /^version$/i) {
                if ($Row[1] =~ /^(\d{1,3})\.(\d{1,3}).*$/) {
                    if ($1 > 4 || ($1 > 3 && $2 > 0)) {
                        $Check = 'OK';
                        $Message = "MySQL $Row[1]";
                    }
                    else {
                        $Check = 'Failed';
                        $Message = "Version $Row[1], you should use 4.1 or higner.";
                    }
                }
                else {
                    $Check = 'Failed';
                    $Message = "Unkown version $Row[1]";
                }
            }
    }
    $Data = {
        Key => 'version',
        Name => 'version',
        Description => "Check version.",
        Comment => $Message,
        Check => $Check,
    },
    return $Data;
}

sub UTF8SupportCheck {
    my $Self = shift;
    my %Param = @_;
    my $Data = {};

    # utf-8 support check
    if ($Self->{ConfigObject}->Get('DefaultCharset') =~ /utf(\-8|8)/i) {
        my $Check = 'Failed';
        my $Message = 'No version found!';
        $Self->{DBObject}->Prepare(SQL => "show variables");
        while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[0] =~ /^version$/i) {
                if ($Row[1] =~ /^(4\.(1|2|3)|5\.|6\.)/) {
                    $Message = "MySQL $Row[1]";
                    $Check = 'OK';
                }
                else {
                    $Message = "utf8 not supported (MySQL $Row[1])";
                    $Check = 'Failed';
                }
            }
        }
        $Data = {
            Key => 'utf8 support',
            Name => 'utf8 support',
            Description => "Check database utf8 support.",
            Comment => $Message,
            Check => $Check,
        },
    }

    return $Data;
}

sub UTF8ClientCheck {
    my $Self = shift;
    my %Param = @_;
    my $Data = {};

    # utf-8 client check
    if ($Self->{ConfigObject}->Get('DefaultCharset') =~ /utf(\-8|8)/i) {
        my $Check = 'Failed';
        my $Message = 'No character_set_client found!';
        $Self->{DBObject}->Prepare(SQL => "show variables");
        while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[0] =~ /^character_set_client/i) {
                $Message = "character_set_client found but it's set to $Row[1] (need to be utf8)";
                if ($Row[1] =~ /utf8/) {
                    $Check = 'OK';
                    $Message = "$Row[1]";
                }
            }
        }

        $Data = {
            Key => 'utf8 client connection',
            Name => 'utf8 client connection',
            Description => "Check the utf8 client connection.",
            Comment => $Message,
            Check => $Check,
        },
    }

    return $Data;
}

sub UTF8DatabaseCheck {
    my $Self = shift;
    my %Param = @_;
    my $Data = {};

    # utf-8 database check
    if ($Self->{ConfigObject}->Get('DefaultCharset') =~ /utf(\-8|8)/i) {
        my $Check = 'Failed';
        my $Message = 'No character_set_databse found!';
        $Self->{DBObject}->Prepare(SQL => "show variables");
        while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[0] =~ /^character_set_database/i) {
                $Message = "character_set_database found but it's set to $Row[1] (need to be utf8)";
                if ($Row[1] =~ /utf8/) {
                    $Check = 'OK';
                    $Message = "$Row[1]";
                }
            }
        }

        $Data = {
            Key => 'utf8 database character',
            Name => 'utf8 database character',
            Description => "Check the utf8 database character.",
            Comment => $Message,
            Check => $Check,
        },
    }

    return $Data;
}

sub UTF8TableCheck {
    my $Self = shift;
    my %Param = @_;
    my $Data = {};

        # utf-8 table check
    if ($Self->{ConfigObject}->Get('DefaultCharset') =~ /utf(\-8|8)/i) {
        my $Check = 'Failed';
        my $Message = '';
        my $Message2 = '';
        $Self->{DBObject}->Prepare(SQL => "show table status");
        while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[14] !~ /^utf8/i) {
                $Message .= "$Row[0][$Row[14]],";
            }
            else {
                $Message2 = $Row[14];
            }
        }
        if ($Message) {
            $Check = 'Failed';
            $Message = "Invalid collation for: $Message";
        }
        else {
            $Check = 'OK';
            $Message = $Message2;
        }
        $Data = {
            Key => 'utf8 table collation',
            Name => 'utf8 table collation',
            Description => "Check the utf8 table collation.",
            Comment => $Message,
            Check => $Check,
        },
    }
    return $Data;
}

sub MaxAllowedPackageCheck {
    my $Self = shift;
    my %Param = @_;
    my $Data = {};

    # max_allowed_packet check
    my $Check = 'Failed';
    my $Message = 'No max_allowed_packet found!';
    $Self->{DBObject}->Prepare(SQL => "show variables");
    while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[0] =~ /^max_allowed_packet/i) {
                if ($Row[1] < 1024*1024*7) {
                    $Row[1] = int($Row[1]/1024);
                    $Check = 'Failed';
                    $Message = "max_allowed_packet should be higher the 7000 KB (its $Row[1] KB)";
                }
                else {
                    $Row[1] = int($Row[1]/1024);
                    $Check = 'OK';
                    $Message = "$Row[1] KB";
                }
            }
    }
    $Data = {
        Key => 'max_allowed_packet',
        Name => 'max_allowed_packet',
        Description => "Check max_allowed_packet setting.",
        Comment => $Message,
        Check => $Check,
    },
    return $Data;
}

sub QueryCacheSizeCheck {
    my $Self = shift;
    my %Param = @_;
    my $Data = {};

    # query_cache_size check
    my $Check = 'Failed';
    my $Message = 'No query_cache_size found!';
    $Self->{DBObject}->Prepare(SQL => "show variables");
    while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[0] =~ /^query_cache_size/i) {
                if (!$Row[1]) {
                    $Check = 'Failed';
                    $Message = "query_cache_size should be used, you will get improvements between 10 and 30 % of speed!";
                }
                elsif ($Row[1] < 1024*1024*8) {
                    $Row[1] = int($Row[1]/1024);
                    $Check = 'Critical';
                    $Message = "query_cache_size should be higher the 8000 KB (its $Row[1] KB)";
                }
                else {
                    $Row[1] = int($Row[1]/1024);
                    $Check = 'OK';
                    $Message = "$Row[1] KB";
                }
            }
    }
    $Data = {
        Key => 'query_cache_size',
        Name => 'query_cache_size',
        Description => "Check query_cache_size setting.",
        Comment => $Message,
        Check => $Check,
    },
    return $Data;
}

sub TableCheck {
    my $Self = shift;
    my %Param = @_;
    my $Data = {};

    # table check
    my $File = $Self->{ConfigObject}->Get('Home')."/scripts/database/otrs-schema.xml";
    if (-f $File) {
        my $Count = 0;
        my $Check = 'Failed';
        my $Message = '';
        my $Content = '';
        my $In;
        if (open($In, '<', "$File")) {
            while (<$In>) {
                $Content .= $_;
            }
            close ($In);
            my @XMLHash = $Self->{XMLObject}->XMLParse2XMLHash(String => $Content);

            foreach my $Table (@{$XMLHash[1]->{database}->[1]->{Table}}) {
                if ($Table) {
                    $Count++;
                    if ($Self->{DBObject}->Prepare(SQL => "select * from $Table->{Name}", Limit => 1)) {
                        while (my @Row = $Self->{DBObject}->FetchrowArray()) {
                        }
                    }
                    else {
                        $Message .= "$Table->{Name}, ";
                    }
                }
            }
            if ($Message) {
                $Message = "Table dosn't exists: $Message";
            }
            else {
                $Check = 'OK';
                $Message = "$Count Tables";
            }
            $Data = {
                Key => 'Table',
                Name => 'Table',
                Description => "Check existing framework tables.",
                Comment => $Message,
                Check => $Check,
            },
        }
        else {
            $Data = {
                Key => 'Table',
                Name => 'Table',
                Description => "Check existing framework tables.",
                Comment => "Can't open file $File: $!",
                Check => $Check,
            },
        }
    }
    else {
        $Data = {
            Key => 'Table',
            Name => 'Table',
            Description => "Check existing framework tables.",
            Comment => "Can't find file $File!",
            Check => 'Failed',
        },
    }
    return $Data;
}

1;
