# --
# Kernel/System/Support/Database/mssql.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: mssql.pm,v 1.1 2007/06/18 19:56:07 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::Database::mssql;

use strict;
use Kernel::System::XML;

use vars qw(@ISA $VERSION);
$VERSION = '$Revision: 1.1 $';
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
