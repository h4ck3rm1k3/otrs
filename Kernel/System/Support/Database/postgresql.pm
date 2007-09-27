# --
# Kernel/System/Support/Database/postgresql.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: postgresql.pm,v 1.3 2007/09/27 10:17:22 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::Database::postgresql;

use strict;
use Kernel::System::XML;

use vars qw(@ISA $VERSION);
$VERSION = '$Revision: 1.3 $';
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
    # verion check
    my $Check = 'Failed';
    my $Message = 'No version found!';
    $Self->{DBObject}->Prepare(SQL => "show all");
    while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[0] =~ /^server_version/i) {
                if ($Row[1] =~ /^(\d{1,3}).*$/) {
                    if ($1 > 7) {
                        $Check = 'OK';
                        $Message = "$Row[1]";
                    }
                    else {
                        $Check = 'Failed';
                        $Message = "Its version $Row[1], you should use 8.x or higner.";
                    }
                }
                else {
                    $Check = 'Failed';
                    $Message = "Unkown version $Row[1]";
                }
            }
    }
    push (@DataArray,
        {
            Key => 'version',
            Name => 'version',
            Description => "Check version.",
            Comment => $Message,
            Check => $Check,
        },
    );
    # utf-8 client check
    if ($Self->{ConfigObject}->Get('DefaultCharset') =~ /utf(\-8|8)/i) {
        my $Check = 'Failed';
        my $Message = 'No client_encoding found!';
        $Self->{DBObject}->Prepare(SQL => "show all");
        while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[0] =~ /^client_encoding/i) {
                $Message = "client_encoding found but it's set to $Row[1] (need to be UNICODE)";
                if ($Row[1] =~ /UNICODE/i) {
                    $Check = 'OK';
                    $Message = "$Row[1]";
                }
            }
        }
        push (@DataArray,
            {
                Key => 'utf8 client connection',
                Name => 'utf8 client connection',
                Description => "Check the utf8 client connection.",
                Comment => $Message,
                Check => $Check,
            },
        );
    }
    # utf-8 server check
    if ($Self->{ConfigObject}->Get('DefaultCharset') =~ /utf(\-8|8)/i) {
        my $Check = 'Failed';
        my $Message = 'No server_encoding found!';
        $Self->{DBObject}->Prepare(SQL => "show all");
        while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[0] =~ /^server_encoding/i) {
                $Message = "server_encoding found but it's set to $Row[1] (need to be UNICODE)";
                if ($Row[1] =~ /UNICODE/i) {
                    $Check = 'OK';
                    $Message = "$Row[1]";
                }
            }
        }
        push (@DataArray,
            {
                Key => 'utf8 server connection',
                Name => 'utf8 server connection',
                Description => "Check the utf8 server connection.",
                Comment => $Message,
                Check => $Check,
            },
        );
    }
    # verion check
    $Check = 'Failed';
    $Message = 'No DateStyle found!';
    $Self->{DBObject}->Prepare(SQL => "show all");
    while (my @Row = $Self->{DBObject}->FetchrowArray()) {
            if ($Row[0] =~ /^DateStyle/i) {
                if ($Row[1] =~ /^ISO/i) {
                    $Check = 'OK';
                    $Message = "$Row[1]";
                }
                else {
                    $Check = 'Failed';
                    $Message = "Unkown DateStyle ($Row[1]) need ISO.";
                }
            }
    }
    push (@DataArray,
        {
            Key => 'DateStyle',
            Name => 'DateStyle',
            Description => "Check DateStyle.",
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
            push (@DataArray,
                {
                    Key => 'Table',
                    Name => 'Table',
                    Description => "Check existing framework tables.",
                    Comment => $Message,
                    Check => $Check,
                },
            );
        }
        else {
            push (@DataArray,
                {
                    Key => 'Table',
                    Name => 'Table',
                    Description => "Check existing framework tables.",
                    Comment => "Can't open file $File: $!",
                    Check => $Check,
                },
            );
        }
    }
    else {
        push (@DataArray,
            {
                Key => 'Table',
                Name => 'Table',
                Description => "Check existing framework tables.",
                Comment => "Can't find file $File!",
                Check => 'Failed',
            },
        );
    }

    return \@DataArray;
}

1;
