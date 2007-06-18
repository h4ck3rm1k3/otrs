# --
# Kernel/System/Support/Database/oracle.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: oracle.pm,v 1.4 2007/06/18 19:47:58 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::Database::oracle;

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
#    );
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
    # check ORACLE_HOME
    my $Check = 'Failed';
    my $Message = 'No ORACLE_HOME found!';
    if ($ENV{ORACLE_HOME}) {
        if (! -e $ENV{ORACLE_HOME}) {
            $Message = "ORACLE_HOME don't exists ($ENV{ORACLE_HOME})";
            $Check = 'Failed';
        }
        else {
            $Message = "$ENV{ORACLE_HOME}";
            $Check = 'OK';
        }
    }
    push (@DataArray,
        {
            Key => 'ORACLE_HOME',
            Name => 'ORACLE_HOME',
            Description => "Check ORACLE_HOME.",
            Comment => $Message,
            Check => $Check,
        },
    );
    # check NLS_LANG
    $Check = 'Failed';
    $Message = 'No NLS_LANG found!';
    if ($ENV{NLS_LANG}) {
        if ($Self->{ConfigObject}->Get('DefaultCharset') =~ /utf(\-8|8)/i) {
            if ($ENV{NLS_LANG} !~ /utf(\-8|8)/) {
                $Message = "$ENV{NLS_LANG}, need .utf8 in NLS_LANG (e. g. german_germany.utf8)";
                $Check = 'Failed';
            }
            else {
                $Message = "$ENV{NLS_LANG}";
                $Check = 'OK';
            }
        }
        else {
            $Message = "$ENV{NLS_LANG}";
            $Check = 'OK';
        }
    }
    push (@DataArray,
        {
            Key => 'NLS_LANG',
            Name => 'NLS_LANG',
            Description => "Check NLS_LANG.",
            Comment => $Message,
            Check => $Check,
        },
    );
    # check NLS_DATE_FORMAT
    $Check = 'Failed';
    $Message = 'No NLS_DATE_FORMAT found!';
    if ($ENV{NLS_DATE_FORMAT}) {
        if ($ENV{NLS_DATE_FORMAT} ne "YYYY-MM-DD HH24:MI:SS") {
            $Message = "$ENV{NLS_DATE_FORMAT}, need 'YYYY-MM-DD HH24:MI:SS' for NLS_DATE_FORMAT (not $ENV{NLS_DATE_FORMAT})";
            $Check = 'Failed';
        }
        else {
            $Message = "$ENV{NLS_DATE_FORMAT}";
            $Check = 'OK';
        }
    }
    push (@DataArray,
        {
            Key => 'NLS_DATE_FORMAT',
            Name => 'NLS_DATE_FORMAT',
            Description => "Check NLS_DATE_FORMAT.",
            Comment => $Message,
            Check => $Check,
        },
    );
    # table check
    my $File = $Self->{ConfigObject}->Get('Home')."/scripts/database/otrs-schema.xml";
    if (-f $File) {
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

    return \@DataArray;
}

1;
