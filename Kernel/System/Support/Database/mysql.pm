# --
# Kernel/System/Support/Database/mysql.pm - all required system information
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: mysql.pm,v 1.24 2010/02/09 19:57:03 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Support::Database::mysql;

use strict;
use warnings;

use Kernel::System::XML;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.24 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for (qw(ConfigObject LogObject MainObject DBObject EncodeObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    # create additional objects
    $Self->{XMLObject} = Kernel::System::XML->new( %{$Self} );

    return $Self;
}

sub AdminChecksGet {
    my ( $Self, %Param ) = @_;

    # add new function name here
    my @ModuleList = (
        '_MaxAllowedPackageCheck',
        '_QueryCacheSizeCheck',
        '_TableCheck',
        '_UTF8SupportCheck',
        '_UTF8ClientCheck',
        '_UTF8DatabaseCheck',
        '_UTF8TableCheck',
        '_VersionCheck',
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
    my $Message = 'No database version found.';
    $Self->{DBObject}->Prepare( SQL => 'show variables' );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        # if row not version row, next.
        if ( $Row[0] !~ /^version$/i ) {
            next;
        }

        if ( $Row[1] =~ /^(\d{1,3})\.(\d{1,3}).*$/ ) {
            if ( $1 >= 4 ) {
                $Check   = 'OK';
                $Message = "MySQL $Row[1]";
            }
            else {
                $Check   = 'Failed';
                $Message = "Version $Row[1], you should use 4.1 or higher.";
            }
        }
        else {
            $Check   = 'Critical';
            $Message = "Unknown database version $Row[1]";
        }
    }
    my $Data = {
        Name        => 'Database Version',
        Description => 'Check database version.',
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
        Name        => 'Database (utf8)',
        Description => 'Check database utf8 support.',
        Comment     => 'No database version found.',
        Check       => 'Critical',
    };

    # ask the database
    $Self->{DBObject}->Prepare( SQL => 'show variables' );

    # fetch the result
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        # next row if not version
        next if $Row[0] !~ /^version$/i;

        # find the version number
        if ( $Row[1] =~ /^(4\.(1|2|3|4|5)|5\.|6\.|7\.)/ ) {
            $Data->{Comment} = 'Your database version supports utf8.';
            $Data->{Check}   = 'OK';

            next;
        }

        $Data->{Comment} = "utf8 is not supported (MySQL $Row[1]).";
        $Data->{Check}   = 'Failed';
    }

    return $Data;
}

sub _UTF8ClientCheck {
    my ( $Self, %Param ) = @_;
    my $Data = {};

    my $Check   = 'Failed';
    my $Message = 'No character_set_client setting found.';

    # utf-8 client check
    if ( $Self->{ConfigObject}->Get('DefaultCharset') !~ /utf(\-8|8)/i ) {
        return;
    }

    # ask the database
    $Self->{DBObject}->Prepare( SQL => 'show variables' );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        #next if row not character_set_client
        next if $Row[0] !~ /^character_set_client/i;

        if ( $Row[1] =~ /utf8/ ) {
            $Check   = 'OK';
            $Message = "Your client connection is $Row[1].";

            next;
        }
        $Message = "Found character_set_client, but it's set to $Row[1] (needs to be utf8).";
    }

    $Data = {
        Name        => 'Client Connection (utf8)',
        Description => 'Check if the client uses utf8 for the connection.',
        Check       => $Check,
        Comment     => $Message,
    };

    return $Data;
}

sub _UTF8DatabaseCheck {
    my ( $Self, %Param ) = @_;

    # utf-8 database check
    if ( $Self->{ConfigObject}->Get('DefaultCharset') !~ /utf(\-8|8)/i ) {
        return;
    }
    my $Check   = 'Failed';
    my $Message = 'No character_set_database setting found.';
    $Self->{DBObject}->Prepare( SQL => 'show variables' );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Row[0] =~ /^character_set_database/i ) {
            $Message
                = "Character_set_database setting found, but it's set to $Row[1] (needs to be utf8).";
            if ( $Row[1] =~ /utf8/ ) {
                $Check   = 'OK';
                $Message = "Your database character setting is $Row[1].";
            }
        }
    }

    my $Data = {
        Name        => 'Database Character (utf8)',
        Description => 'Check if the database uses utf8 as charset.',
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
        $Self->{DBObject}->Prepare( SQL => 'show table status' );
        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            if ( $Row[14] !~ /^utf8/i ) {
                if ($Message) {
                    $Message .= ', ';
                }
                $Message .= "$Row[0]\[$Row[14]\]";
            }
            else {
                $Message2 = $Row[14];
            }
        }
        if ($Message) {
            $Check   = 'Failed';
            $Message = "Invalid charset collation for: $Message";
        }
        else {
            $Check   = 'OK';
            $Message = $Message2;
        }
        $Data = {
            Name        => 'Table Collation (utf8)',
            Description => 'Check the utf8 table charset collation.',
            Comment     => "Your charset collation is set to $Message.",
            Check       => $Check,
        };
        return $Data;
    }
    return;
}

sub _MaxAllowedPackageCheck {
    my ( $Self, %Param ) = @_;
    my $Data = {};

    # max_allowed_packet check
    my $Check   = 'Failed';
    my $Message = 'No "max_allowed_packet" configuration found.';
    $Self->{DBObject}->Prepare( SQL => 'show variables' );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Row[0] =~ /^max_allowed_packet/i ) {
            if ( $Row[1] < 1024 * 1024 * 7 ) {
                $Row[1]  = int( $Row[1] / 1024 / 1024 );
                $Check   = 'Failed';
                $Message = "\"max_allowed_packet\" should be higher then 7 MB (it's $Row[1] MB).";
            }
            else {
                $Row[1]  = int( $Row[1] / 1024 / 1024 );
                $Check   = 'OK';
                $Message = "Your configuration setting is $Row[1] MB.";
            }
        }
    }
    $Data = {
        Name        => 'Max Package Size',
        Description => 'Check "max_allowed_packet" setting.',
        Comment     => $Message,
        Check       => $Check,
    };
    return $Data;
}

sub _QueryCacheSizeCheck {
    my ( $Self, %Param ) = @_;
    my $Data = {};

    # query_cache_size check
    my $Check   = 'Failed';
    my $Message = 'No "query_cache_size" setting found.';
    $Self->{DBObject}->Prepare( SQL => 'show variables' );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Row[0] =~ /^query_cache_size/i ) {
            if ( !$Row[1] ) {
                $Check = 'Critical';
                $Message
                    = 'The setting "query_cache_size" should be used, you will get improvements up to 30 % of speed.';
            }
            elsif ( $Row[1] < 1024 * 1024 * 10 ) {
                $Row[1] = int( $Row[1] / 1024 / 1024 );
                $Check = 'Critical';
                $Message
                    = "The setting \"query_cache_size\" should be higher than 10 MB (it's $Row[1] MB).";
            }
            else {
                $Row[1]  = int( $Row[1] / 1024 / 1024 );
                $Check   = 'OK';
                $Message = "$Row[1] MB";
            }
        }
    }
    $Data = {
        Name        => 'Query Cache Size',
        Description => 'Check "query_cache_size" setting.',
        Comment     => $Message,
        Check       => $Check,
    };
    return $Data;
}

sub _TableCheck {
    my ( $Self, %Param ) = @_;
    my $Data = {};

    # table check
    my $File = $Self->{ConfigObject}->Get('Home') . '/scripts/database/otrs-schema.xml';
    if ( -f $File ) {
        my $Count   = 0;
        my $Check   = 'Failed';
        my $Message = '';
        my $Content = '';
        my $In;
        if ( open( $In, '<', $File ) ) {
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
                    # Do quick checks on tables, other way it takes over 420 sec
                    # or longer to check it.
                    if (
                        $Self->{DBObject}->Prepare( SQL => "CHECK TABLE $Table->{Name} FAST QUICK" )
                        )
                    {
                        my $Status;
                        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
                            $Status = $Row[3];    # look at field 'Msg_text'
                        }
                        next if $Status =~ /^(OK|Table\sis\salready\sup\sto\sdate)/i;
                        push @Problems, "$Table->{Name}\[$Status\]";
                    }
                    else {
                        push @Problems, "$Table->{Name}\[unable to check table\]";
                    }
                }
            }
            if (@Problems) {
                $Message = join "\n", @Problems;
            }
            else {
                $Check   = 'OK';
                $Message = "$Count tables checked.";
            }
            $Data = {
                Name        => 'Table Check',
                Description => 'Check existing framework tables.',
                Comment     => $Message,
                Check       => $Check,
            };
        }
        else {
            $Data = {
                Name        => 'Table Check',
                Description => 'Check existing framework tables.',
                Comment     => "Can't open file $File: $!",
                Check       => 'Critical',
            };
        }
    }
    else {
        $Data = {
            Name        => 'Table Check',
            Description => 'Check existing framework tables.',
            Comment     => "Can't find file $File!",
            Check       => 'Critical',
        };
    }
    return $Data;
}

1;
