# --
# Kernel/System/Support/Database/mysql.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: mysql.pm,v 1.4 2007/06/11 10:03:04 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::Database::mysql;

use strict;
use Kernel::System::XML;

use vars qw(@ISA $VERSION);
$VERSION = '$Revision: 1.4 $';
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
#    # please add for each new check a part like this
#    my $OneCheck = $Self->Check(
#        Type => $Param{ModuleInputHash}->{Type} || '',
#    push (@{$DataArray}, $OneCheck);

    return $DataArray;
}

sub AdminChecksGet {
    my $Self = shift;
    my %Param = @_;
    my @DataArray = ();
    # check needed stuff
    foreach (qw()) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }

    # utf-8 support check
    if ($Self->{ConfigObject}->Get('DefaultCharset') =~ /utf(\-8|8)/i) {
        my $Check = 'Failed';
        my $Message = 'No version found!';
        $Self->{DBObject}->Prepare(SQL => "show variables");
        while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[0] =~ /^version$/i) {
                if ($Row[1] =~ /^(4\.(1|2|3)|5\.)/) {
                    $Message = "MySQL $Row[1]";
                    $Check = 'OK';
                }
                else {
                    $Message = "utf8 not supported (MySQL $Row[1])";
                    $Check = 'Failed';
                }
            }
        }
        push (@DataArray,
            {
                Key => 'utf8 support Check',
                Name => 'utf8 support Check',
                Description => "Check database utf8 support",
                Comment => $Message,
                Check => $Check,
            },
        );
    }
    # utf-8 check
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
        push (@DataArray,
            {
                Key => 'utf8 Check',
                Name => 'utf8 Check',
                Description => "Check the utf8 client connection",
                Comment => $Message,
                Check => $Check,
            },
        );
    }
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
    push (@DataArray,
        {
            Key => 'max_allowed_packet Check',
            Name => 'max_allowed_packet Check',
            Description => "Check max_allowed_packet setting",
            Comment => $Message,
            Check => $Check,
        },
    );
    # table check
    my $File = $Self->{ConfigObject}->Get('Home')."/scripts/database/otrs-schema.xml";
    if (-f $File) {
        my $Count = 0;
        my $Check = 'Failed';
        my $Message = '';
        my $Content = '';
        if (open(IN, "< $File")) {
            while (<IN>) {
                $Content .= $_;
            }
            close (IN);
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
                $Message = "Tables dosn't exists: $Message";
            }
            else {
                $Check = 'OK';
                $Message = "$Count Tables";
            }
            push (@DataArray,
                {
                    Key => 'Table Check',
                    Name => 'Table Check',
                    Description => "Check existing tables",
                    Comment => $Message,
                    Check => $Check,
                },
            );
        }
        else {
            push (@DataArray,
                {
                    Key => 'Table Check',
                    Name => 'Table Check',
                    Description => "Check existing tables",
                    Comment => "Can't open file $File: $!",
                    Check => $Check,
                },
            );
        }
    }
    else {
        push (@DataArray,
            {
                Key => 'Table Check',
                Name => 'Table Check',
                Description => "Check existing tables",
                Comment => "Can't find file $File!",
                Check => 'Failed',
            },
        );
    }

    return \@DataArray;
}

1;
