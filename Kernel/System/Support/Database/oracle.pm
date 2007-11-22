# --
# Kernel/System/Support/Database/oracle.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: oracle.pm,v 1.9 2007/11/22 13:39:21 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support::Database::oracle;

use strict;
use warnings;

use Kernel::System::XML;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.9 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for (qw(ConfigObject LogObject DBObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    $Self->{XMLObject} = Kernel::System::XML->new(%Param);

    return $Self;
}

sub SupportConfigArrayGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw()) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
}

sub SupportInfoGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ModuleInputHash} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
        return;
    }
    if ( ref( $Param{ModuleInputHash} ) ne 'HASH' ) {
        $Self->{LogObject}
            ->Log( Priority => 'error', Message => "ModuleInputHash must be a hash reference!" );
        return;
    }

    # add new function name here
    my @ModuleList = (
        '_TableCheck', '_NLSDateFormatCheck',
        '_OracleHomeCheck', '_NLSLangCheck',
    );

    my @DataArray;

    FUNCTIONNAME:
    for my $FunctionName (@ModuleList) {

        # run function and get check data
        my $Check = $Self->$FunctionName( Type => $Param{ModuleInputHash}->{Type} || '', );

        next FUNCTIONNAME if !$Check;

        # attach check data if valid
        push @DataArray, $Check;
    }

    return \@DataArray;
}

sub AdminChecksGet {
    my ( $Self, %Param ) = @_;

    # add new function name here
    my @ModuleList = (
        '_TableCheck', '_NLSDateFormatCheck',
        '_OracleHomeCheck', '_NLSLangCheck',
    );

    my @DataArray;

    FUNCTIONNAME:
    for my $FunctionName (@ModuleList) {

        # run function and get check data
        my $Check = $Self->$FunctionName();

        next FUNCTIONNAME if !$Check;

        # attach check data if valid
        push @DataArray, $Check;
    }

    return \@DataArray;
}

sub _OracleHomeCheck {
    my ( $Self, %Param ) = @_;

    my $Data = {};

    # check ORACLE_HOME
    my $Check   = 'Failed';
    my $Message = 'No ORACLE_HOME found!';
    if ( $ENV{ORACLE_HOME} ) {
        if ( !-e $ENV{ORACLE_HOME} ) {
            $Message = "ORACLE_HOME don't exists ($ENV{ORACLE_HOME})";
            $Check   = 'Failed';
        }
        else {
            $Message = "$ENV{ORACLE_HOME}";
            $Check   = 'OK';
        }
    }
    $Data = {
        Key         => 'ORACLE_HOME',
        Name        => 'ORACLE_HOME',
        Description => "Check ORACLE_HOME.",
        Comment     => $Message,
        Check       => $Check,
        };
        return $Data;
}

sub _NLSLangCheck {
    my ( $Self, %Param ) = @_;

    my $Data = {};

    # check NLS_LANG
    my $Check   = 'Failed';
    my $Message = 'No NLS_LANG found!';
    if ( $ENV{NLS_LANG} ) {
        if ( $Self->{ConfigObject}->Get('DefaultCharset') =~ /utf(\-8|8)/i ) {
            if ( $ENV{NLS_LANG} !~ /utf(\-8|8)/ ) {
                $Message = "$ENV{NLS_LANG}, need .utf8 in NLS_LANG (e. g. german_germany.utf8)";
                $Check   = 'Failed';
            }
            else {
                $Message = "$ENV{NLS_LANG}";
                $Check   = 'OK';
            }
        }
        else {
            $Message = "$ENV{NLS_LANG}";
            $Check   = 'OK';
        }
    }
    $Data = {
        Key         => 'NLS_LANG',
        Name        => 'NLS_LANG',
        Description => "Check NLS_LANG.",
        Comment     => $Message,
        Check       => $Check,
        };
        return $Data;
}

sub _NLSDateFormatCheck {
    my ( $Self, %Param ) = @_;

    my $Data = {};

    # check NLS_DATE_FORMAT
    my $Check   = 'Failed';
    my $Message = 'No NLS_DATE_FORMAT found!';
    if ( $ENV{NLS_DATE_FORMAT} ) {
        if ( $ENV{NLS_DATE_FORMAT} ne "YYYY-MM-DD HH24:MI:SS" ) {
            $Message
                = "$ENV{NLS_DATE_FORMAT}, need 'YYYY-MM-DD HH24:MI:SS' for NLS_DATE_FORMAT (not $ENV{NLS_DATE_FORMAT})";
            $Check = 'Failed';
        }
        else {
            $Message = "$ENV{NLS_DATE_FORMAT}";
            $Check   = 'OK';
        }
    }
    $Data = {
        Key         => 'NLS_DATE_FORMAT',
        Name        => 'NLS_DATE_FORMAT',
        Description => "Check NLS_DATE_FORMAT.",
        Comment     => $Message,
        Check       => $Check,
        };
        return $Data;
}

sub _TableCheck {
    my ( $Self, %Param ) = @_;

    my $Data = {};

    # table check
    my $File = $Self->{ConfigObject}->Get('Home') . "/scripts/database/otrs-schema.xml";
    if ( -f $File ) {
        my $Count   = 0;
        my $Check   = 'Failed';
        my $Message = '';
        my $Content = '';
        my $In;
        if ( open( $In, '<', "$File" ) ) {
            while (<$In>) {
                $Content .= $_;
            }
            close($In);
            my @XMLHash = $Self->{XMLObject}->XMLParse2XMLHash( String => $Content );
            for my $Table ( @{ $XMLHash[1]->{database}->[1]->{Table} } ) {
                if ($Table) {
                    $Count++;
                    if ( $Self->{DBObject}
                        ->Prepare( SQL => "select * from $Table->{Name}", Limit => 1 ) )
                    {
                        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
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
                $Check   = 'OK';
                $Message = "$Count Tables";
            }
            $Data = {
                Key         => 'Table',
                Name        => 'Table',
                Description => "Check existing framework tables.",
                Comment     => $Message,
                Check       => $Check,
                };
        }
        else {
            $Data = {
                Key         => 'Table',
                Name        => 'Table',
                Description => "Check existing framework tables.",
                Comment     => "Can't open file $File: $!",
                Check       => $Check,
                };
        }
    }
    else {
        $Data = {
            Key         => 'Table',
            Name        => 'Table',
            Description => "Check existing framework tables.",
            Comment     => "Can't find file $File!",
            Check       => 'Failed',
            };
    }
    return $Data;
}

1;
