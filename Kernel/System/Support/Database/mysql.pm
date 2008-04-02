# --
# Kernel/System/Support/Database/mysql.pm - all required system informations
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: mysql.pm,v 1.14 2008/04/02 07:58:39 ot Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::Support::Database::mysql;

use strict;
use warnings;

use Kernel::System::XML;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.14 $) [1];

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
        '_MaxAllowedPackageCheck', '_QueryCacheSizeCheck',
        '_TableCheck',             '_UTF8ClientCheck',
        '_UTF8DatabaseCheck',      '_UTF8SupportCheck',
        '_UTF8TableCheck',         '_VersionCheck',
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
        '_MaxAllowedPackageCheck', '_QueryCacheSizeCheck',
        '_TableCheck',             '_UTF8ClientCheck',
        '_UTF8DatabaseCheck',      '_UTF8SupportCheck',
        '_UTF8TableCheck',         '_VersionCheck',
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

sub _VersionCheck {
    my ( $Self, %Param ) = @_;

    # version check
    my $Check   = 'Failed';
    my $Message = 'No version found!';
    $Self->{DBObject}->Prepare( SQL => "show variables" );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        # if row not version row, next.
        if ( $Row[0] !~ /^version$/i ) {
            next;
        }

        if ( $Row[1] =~ /^(\d{1,3})\.(\d{1,3}).*$/ ) {
            if ( $1 > 4 || ( $1 > 3 && $2 > 0 ) ) {
                $Check   = 'OK';
                $Message = "MySQL $Row[1]";
            }
            else {
                $Check   = 'Failed';
                $Message = "Version $Row[1], you should use 4.1 or higner.";
            }
        }
        else {
            $Check   = 'Failed';
            $Message = "Unkown version $Row[1]";
        }
    }
    my $Data = {
        Key         => 'version',
        Name        => 'version',
        Description => "Check version.",
        Comment     => $Message,
        Check       => $Check,
    };
    return $Data;
}

sub _UTF8SupportCheck {
    my ( $Self, %Param ) = @_;

    # utf-8 support check
    if ( $Self->{ConfigObject}->Get('DefaultCharset') !~ /utf(\-8|8)/i ) {
        return;
    }

    my $Data = {
        Key         => 'utf8 support',
        Name        => 'utf8 support',
        Description => "Check database utf8 support.",
        Comment     => 'No version found!',
        Check       => 'Failed',
    };

    # ask the database
    $Self->{DBObject}->Prepare( SQL => 'show variables' );

    # fetch the result
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        # next row if not version
        next if $Row[0] !~ /^version$/i;

        # find the version number
        if ( $Row[1] =~ /^(4\.(1|2|3)|5\.|6\.)/ ) {
            $Data->{Comment} = "MySQL $Row[1]";
            $Data->{Check}   = 'OK';

            next;
        }

        $Data->{Comment} = "utf8 not supported (MySQL $Row[1])";
    }

    return $Data;
}

sub _UTF8ClientCheck {
    my ( $Self, %Param ) = @_;
    my $Data = {};

    # utf-8 client check
    if ( $Self->{ConfigObject}->Get('DefaultCharset') !~ /utf(\-8|8)/i ) {
        return;
    }

    $Data = {
        Key         => 'utf8 client connection',
        Name        => 'utf8 client connection',
        Description => "Check the utf8 client connection.",
        Comment     => 'Failed',
        Check       => 'No character_set_client found!',
    };

    # ask the database
    $Self->{DBObject}->Prepare( SQL => "show variables" );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        #next if row not character_set_client
        next if $Row[0] !~ /^character_set_client/i;

        if ( $Row[1] =~ /utf8/ ) {
            $Data->{Check}   = 'OK';
            $Data->{Message} = "$Row[1]";

            next;
        }
        $Data->{Message} = "character_set_client found but it's set to $Row[1] (need to be utf8)";
    }

    return $Data;
}

sub _UTF8DatabaseCheck {
    my ( $Self, %Param ) = @_;

    # utf-8 database check
    if ( $Self->{ConfigObject}->Get('DefaultCharset') !~ /utf(\-8|8)/i ) {
        return;
    }
    my $Check   = 'Failed';
    my $Message = 'No character_set_databse found!';
    $Self->{DBObject}->Prepare( SQL => "show variables" );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Row[0] =~ /^character_set_database/i ) {
            $Message = "character_set_database found but it's set to $Row[1] (need to be utf8)";
            if ( $Row[1] =~ /utf8/ ) {
                $Check   = 'OK';
                $Message = "$Row[1]";
            }
        }
    }

    my $Data = {
        Key         => 'utf8 database character',
        Name        => 'utf8 database character',
        Description => "Check the utf8 database character.",
        Comment     => $Message,
        Check       => $Check,
        };
        return $Data;
}

sub _UTF8TableCheck {
    my ( $Self, %Param ) = @_;
    my $Data = {};

    # utf-8 table check
    if ( $Self->{ConfigObject}->Get('DefaultCharset') =~ /utf(\-8|8)/i ) {
        my $Check    = 'Failed';
        my $Message  = '';
        my $Message2 = '';
        $Self->{DBObject}->Prepare( SQL => "show table status" );
        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            if ( $Row[14] !~ /^utf8/i ) {
                $Message .= "$Row[0][$Row[14]],";
            }
            else {
                $Message2 = $Row[14];
            }
        }
        if ($Message) {
            $Check   = 'Failed';
            $Message = "Invalid collation for: $Message";
        }
        else {
            $Check   = 'OK';
            $Message = $Message2;
        }
        $Data = {
            Key         => 'utf8 table collation',
            Name        => 'utf8 table collation',
            Description => "Check the utf8 table collation.",
            Comment     => $Message,
            Check       => $Check,
            },
            return $Data;
    }
    return;
}

sub _MaxAllowedPackageCheck {
    my ( $Self, %Param ) = @_;
    my $Data = {};

    # max_allowed_packet check
    my $Check   = 'Failed';
    my $Message = 'No max_allowed_packet found!';
    $Self->{DBObject}->Prepare( SQL => "show variables" );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Row[0] =~ /^max_allowed_packet/i ) {
            if ( $Row[1] < 1024 * 1024 * 7 ) {
                $Row[1]  = int( $Row[1] / 1024 );
                $Check   = 'Failed';
                $Message = "max_allowed_packet should be higher the 7000 KB (its $Row[1] KB)";
            }
            else {
                $Row[1]  = int( $Row[1] / 1024 );
                $Check   = 'OK';
                $Message = "$Row[1] KB";
            }
        }
    }
    $Data = {
        Key         => 'max_allowed_packet',
        Name        => 'max_allowed_packet',
        Description => "Check max_allowed_packet setting.",
        Comment     => $Message,
        Check       => $Check,
        },
        return $Data;
}

sub _QueryCacheSizeCheck {
    my ( $Self, %Param ) = @_;
    my $Data = {};

    # query_cache_size check
    my $Check   = 'Failed';
    my $Message = 'No query_cache_size found!';
    $Self->{DBObject}->Prepare( SQL => "show variables" );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Row[0] =~ /^query_cache_size/i ) {
            if ( !$Row[1] ) {
                $Check = 'Failed';
                $Message
                    = "query_cache_size should be used, you will get improvements between 10 and 30 % of speed!";
            }
            elsif ( $Row[1] < 1024 * 1024 * 8 ) {
                $Row[1]  = int( $Row[1] / 1024 );
                $Check   = 'Critical';
                $Message = "query_cache_size should be higher the 8000 KB (its $Row[1] KB)";
            }
            else {
                $Row[1]  = int( $Row[1] / 1024 );
                $Check   = 'OK';
                $Message = "$Row[1] KB";
            }
        }
    }
    $Data = {
        Key         => 'query_cache_size',
        Name        => 'query_cache_size',
        Description => "Check query_cache_size setting.",
        Comment     => $Message,
        Check       => $Check,
        },
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

            my @Problems;
            for my $Table ( @{ $XMLHash[1]->{database}->[1]->{Table} } ) {
                if ($Table) {
                    $Count++;

                    # use 'CHECK TABLE'-statement to determine state of each table
                    # (which may yield several lines per table, the last of which will
                    # contain the overall state of that table)
                    if ( $Self->{DBObject}->Prepare( SQL => "CHECK TABLE $Table->{Name}" ) ) {
                        my $Status;
                        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
                            $Status = $Row[3];      # look at field 'Msg_text'
                        }
                        next if $Status eq 'OK';
                        push @Problems, $Status;
                    }
                    else {
                        push @Problems, "unable to check table '$Table->{Name}'";
                    }
                }
            }
            if (@Problems) {
                $Message = join "\n", @Problems;
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
                },
                ;
        }
        else {
            $Data = {
                Key         => 'Table',
                Name        => 'Table',
                Description => "Check existing framework tables.",
                Comment     => "Can't open file $File: $!",
                Check       => $Check,
                },
                ;
        }
    }
    else {
        $Data = {
            Key         => 'Table',
            Name        => 'Table',
            Description => "Check existing framework tables.",
            Comment     => "Can't find file $File!",
            Check       => 'Failed',
            },
            ;
    }
    return $Data;
}

1;
