#!/usr/bin/perl -w
# --
# DBUpdate-to-3.1.pl - update script to migrate OTRS 3.0.x to 3.1.x
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: DBUpdate-to-3.1.pl,v 1.43 2011/11/02 22:14:26 cr Exp $
# --
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU AFFERO General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# or see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;

# use ../ as lib location
use File::Basename;
use FindBin qw($RealBin);
use lib dirname($RealBin);
use lib dirname($RealBin) . '/Kernel/cpan-lib';

use vars qw($VERSION);
$VERSION = qw($Revision: 1.43 $) [1];

use Getopt::Std qw();
use Kernel::Config;
use Kernel::System::Log;
use Kernel::System::Time;
use Kernel::System::Encode;
use Kernel::System::DB;
use Kernel::System::Main;
use Kernel::System::State;
use Kernel::System::SysConfig;
use Kernel::System::XML;
use Kernel::System::DynamicField;
use Kernel::System::Cache;

{

    # get options
    my %Opts;
    Getopt::Std::getopt( 'h', \%Opts );

    if ( exists $Opts{h} ) {
        print <<"EOF";

DBUpdate-to-3.1.pl <Revision $VERSION> - Upgrade scripts for OTRS 3.0.x to 3.1.x migration.
Copyright (C) 2001-2011 OTRS AG, http://otrs.org/

EOF
        exit 1;
    }

    print "\nMigration started...\n\n";

    # create common objects
    my $CommonObject = _CommonObjectsBase();

    # define the number of steps
    my $Steps = 18;

    print "Step 1 of $Steps: Refresh configuration cache... ";
    RebuildConfig($CommonObject);
    print "done.\n\n";

    # create common objects with new default config
    $CommonObject = _CommonObjectsBase();

    # check framework version
    print "Step 2 of $Steps: Check framework version... ";
    _CheckFrameworkVersion($CommonObject);
    print "done.\n\n";

    print "Step 3 of $Steps: Creating DynamicField tables (if necessary)... ";
    if ( _CheckDynamicFieldTables($CommonObject) ) {
        print "done.\n\n";
    }
    else {
        print "Error!\n\n";
    }

    # insert dynamic field records, if necessary
    print "Step 4 of $Steps: Create new dynamic fields for free fields (text, key, date)... ";
    if ( !_IsFreefieldsMigrationAlreadyDone($CommonObject) ) {
        _DynamicFieldCreation($CommonObject);
    }
    print "done.\n\n";

    # migrate ticket free field
    print "Step 5 of $Steps: Migrate ticket free fields to dynamic fields... \n";
    if ( !_IsFreefieldsMigrationAlreadyDone($CommonObject) ) {
        my $TicketMigrated = _DynamicFieldTicketMigration($CommonObject);
    }
    print "done.\n\n";

    # migrate ticket free field
    print "Step 6 of $Steps: Migrate article free fields to dynamic fields... \n";
    if ( !_IsFreefieldsMigrationAlreadyDone($CommonObject) ) {
        my $ArticleMigrated = _DynamicFieldArticleMigration($CommonObject);
    }
    print "done.\n\n";

    # verify ticket migration
    my $VerificationTicketData = 1;
    print "Step 7 of $Steps: Verify if ticket data was successfully migrated... ";
    if ( !_IsFreefieldsMigrationAlreadyDone($CommonObject) ) {
        $VerificationTicketData = _VerificationTicketData($CommonObject);
    }
    print "done.\n\n";

    # verify article migration
    my $VerificationArticleData = 1;
    print "Step 8 of $Steps: Verify if article data was successfully migrated... ";
    if ( !_IsFreefieldsMigrationAlreadyDone($CommonObject) ) {
        $VerificationArticleData = _VerificationArticleData($CommonObject);
    }
    print "done.\n\n";

    if ( !$VerificationTicketData || !$VerificationArticleData ) {
        print STDERR "Ticket or article data was not successfully migrated!\n";
        print STDERR
            "DO NOT CONTINUE THE UPGRADING PROCESS UNTIL THIS ISSUE IS FIXED, OTHERWISE YOU MAY LOSE DATA!\n";
        die;
    }

    # Migrate free fields configuration
    print "Step 9 of $Steps: Migrate free fields configuration... ";
    _MigrateFreeFieldsConfiguration($CommonObject);
    print "done.\n\n";

    print
        "Step 10 of $Steps: Update history type from 'TicketFreeTextUpdate' to 'TicketDynamicFieldUpdate'... ";
    if ( _UpdateHistoryType($CommonObject) ) {
        print "done.\n\n";
    }
    else {
        print "Error!\n\n";
    }

    # Migrate free fields configuration
    print "Step 11 of $Steps: Migrate free fields window configuration... ";
    if ( _MigrateWindowConfiguration($CommonObject) ) {
        print "done.\n\n";
    }
    else {
        print "Error!\n\n";
    }

    # Migrate free fields configuration for stats
    print "Step 12 of $Steps: Migrate free fields stats configuration... ";
    if ( _MigrateStatsConfiguration($CommonObject) ) {
        print "done.\n\n";
    }
    else {
        print "Error!\n\n";
    }

    # Migrate free fields configuration for generic agent jobs
    print "Step 13 of $Steps: Migrate free fields generic agent jobs configuration.. ";
    if ( _MigrateGenericAgentJobConfiguration($CommonObject) ) {
        print "done.\n\n";
    }
    else {
        print "Error!\n\n";
    }

    # Migrate free fields configuration for Post Master
    print "Step 14 of $Steps: Migrate free fields post master configuration.. ";
    if ( _MigratePostMasterConfiguration($CommonObject) ) {
        print "done.\n\n";
    }
    else {
        print "Error!\n\n";
    }

    # Migrate free fields responses configuration
    print "Step 15 of $Steps: Migrate free fields standard responses configuration.. ";
    if ( _MigrateResponsesConfiguration($CommonObject) ) {
        print "done.\n\n";
    }
    else {
        print "Error!\n\n";
    }

    # Migrate free fields auto responses configuration
    print "Step 16 of $Steps: Migrate free fields auto responses configuration.. ";
    if ( _MigrateAutoResponsesConfiguration($CommonObject) ) {
        print "done.\n\n";
    }
    else {
        print "Error!\n\n";
    }

    # Migrate free fields salutations configuration
    print "Step 17 of $Steps: Migrate free fields salutations configuration.. ";
    if ( _MigrateSalutationsConfiguration($CommonObject) ) {
        print "done.\n\n";
    }
    else {
        print "Error!\n\n";
    }

    # Migrate free fields signatures configuration
    print "Step 18 of $Steps: Migrate free fields signatures configuration.. ";
    if ( _MigrateSignaturesConfiguration($CommonObject) ) {
        print "done.\n\n";
    }
    else {
        print "Error!\n\n";
    }

    print "Migration completed!\n";

    exit 0;
}

sub _CommonObjectsBase {
    my %CommonObject;
    $CommonObject{ConfigObject} = Kernel::Config->new();
    $CommonObject{LogObject}    = Kernel::System::Log->new(
        LogPrefix => 'OTRS-DBUpdate-to-3.1',
        %CommonObject,
    );
    $CommonObject{EncodeObject} = Kernel::System::Encode->new(%CommonObject);
    $CommonObject{MainObject}   = Kernel::System::Main->new(%CommonObject);
    $CommonObject{TimeObject}   = Kernel::System::Time->new(%CommonObject);
    $CommonObject{DBObject}     = Kernel::System::DB->new(%CommonObject);
    $CommonObject{XMLObject}    = Kernel::System::XML->new(%CommonObject);
    return \%CommonObject;
}

=item RebuildConfig($CommonObject)

refreshes the configuration to make sure that a ZZZAAuto.pm is present
after the upgrade.

    RebuildConfig($CommonObject);

=cut

sub RebuildConfig {
    my $CommonObject = shift;

    # write now default config options
    my $SysConfigObject = Kernel::System::SysConfig->new( %{$CommonObject} );
    if ( !$SysConfigObject->WriteDefault() ) {
        die "ERROR: Can't write default config files!";
    }

    # reload config object
    $CommonObject->{ConfigObject} = Kernel::Config->new( %{$CommonObject} );

    return 1;
}

=item _CheckFrameworkVersion()

Check if framework it's the correct one for Dinamic Fields migration.

    _CheckFrameworkVersion();

=cut

sub _CheckFrameworkVersion {
    my $CommonObject = shift;

    my $Home = $CommonObject->{ConfigObject}->Get('Home');

    # load RELEASE file
    if ( -e !"$Home/RELEASE" ) {
        die "ERROR: $Home/RELEASE does not exist!";
    }
    my $ProductName;
    my $Version;
    if ( open( my $Product, '<', "$Home/RELEASE" ) ) {
        while (<$Product>) {

            # filtering of comment lines
            if ( $_ !~ /^#/ ) {
                if ( $_ =~ /^PRODUCT\s{0,2}=\s{0,2}(.*)\s{0,2}$/i ) {
                    $ProductName = $1;
                }
                elsif ( $_ =~ /^VERSION\s{0,2}=\s{0,2}(.*)\s{0,2}$/i ) {
                    $Version = $1;
                }
            }
        }
        close($Product);
    }
    else {
        die "ERROR: Can't read $CommonObject->{Home}/RELEASE: $!";
    }

    if ( $ProductName ne 'OTRS' ) {
        die "Not framework version required"
    }
    if ( $Version !~ /^3\.1(.*)$/ ) {
        die "Not framework version required"
    }

    return 1;
}

=item _CheckDynamicFieldTables($CommonObject)

Checks if the DynamicField tables exist, and if they don't they will be created.

    _CheckDynamicFieldTables($CommonObject);

=cut

sub _CheckDynamicFieldTables {
    my $CommonObject = shift;

    # execute a count query, it will return a value even
    # if table is empty, and an error if the table is not created yet

    my $SuccessMaster = $CommonObject->{DBObject}->Do(
        SQL => 'SELECT count(id) FROM dynamic_field',
    );

    if ( !$SuccessMaster ) {
        die "Check if dynamic_field table exists, failed!";
    }

    my $SuccessSlave = $CommonObject->{DBObject}->Do(
        SQL => 'SELECT count(field_id) FROM dynamic_field_value',
    );

    if ( !$SuccessSlave ) {
        die "Check if dynamic_field_value table exists, failed!";
    }

    return 1;
}

=item _IsFreefieldsMigrationAlreadyDone($CommonObject)

Checks if the free field were dropped already, then the migration can be skipped.

    my $AlreadyDone = _IsFreefieldsMigrationAlreadyDone($CommonObject);

=cut

sub _IsFreefieldsMigrationAlreadyDone {
    my $CommonObject = shift;

    # First ticket and article added on installation
    # are used to verify if free fields are present
    my $SuccessTicket = $CommonObject->{DBObject}->Do(
        SQL   => 'SELECT freekey1, freetext1, freetime1 FROM ticket',
        LIMIT => 1,
    );

    my $SuccessArticle = $CommonObject->{DBObject}->Do(
        SQL   => 'SELECT a_freekey1, a_freetext1 FROM article',
        LIMIT => 1,
    );

    if ( !$SuccessTicket && !$SuccessArticle ) {
        print "Free fields were deleted, migration is already done!\n";
        return 1
    }

    return 0;
}

=item _DynamicFieldCreation($CommonObject)

Create new dynamic field entries for free fields on ticket and article table, if necessary.

    _DynamicFieldCreation($CommonObject);

=cut

sub _DynamicFieldCreation {
    my $CommonObject = shift;

    # select dynamic field entries
    my $SuccessTicket = $CommonObject->{DBObject}->Prepare(
        SQL => 'SELECT id, name FROM dynamic_field',
    );

    my %Data;
    while ( my @Row = $CommonObject->{DBObject}->FetchrowArray() ) {
        $Data{ $Row[1] } = $Row[0];
    }

    my $FieldOrder = 1;

    # insert new ticket dynamic field entries if necessary
    for my $Index ( 1 .. 16 ) {
        for my $FreeField ( 'TicketFreeKey', 'TicketFreeText' ) {

            if ( !$Data{ $FreeField . $Index } ) {
                my $FieldName = $FreeField . $Index;

                # insert new dynamic field
                my $SuccessTicketField = $CommonObject->{DBObject}->Do(
                    SQL =>
                        "INSERT INTO dynamic_field (name, label, field_order, field_type, object_type, config,
                            valid_id, create_time, create_by, change_time, change_by)
                        VALUES (?, ?, ?, 'Text', 'Ticket', '--- {}\n', 1, current_timestamp, 1, current_timestamp, 1)",
                    Bind => [
                        \$FieldName, \$FieldName, \$FieldOrder,
                    ],
                );
                $FieldOrder++;
                if ( !$SuccessTicketField ) {
                    die "Could not create new DynamicField $FieldName";
                }
            }
        }
    }

    # insert new ticket dynamic field entries if necessary
    for my $Index ( 1 .. 6 ) {

        if ( !$Data{ 'TicketFreeTime' . $Index } ) {
            my $FieldName = 'TicketFreeTime' . $Index;

            # insert new dynamic field
            my $SuccessTicketField = $CommonObject->{DBObject}->Do(
                SQL =>
                    "INSERT INTO dynamic_field (name, label, field_order, field_type, object_type, config,
                        valid_id, create_time, create_by, change_time, change_by)
                    VALUES (?, ?, ?, 'DateTime', 'Ticket', '--- {}\n', 1, current_timestamp, 1, current_timestamp, 1)",
                Bind => [
                    \$FieldName, \$FieldName, \$FieldOrder,
                ],
            );
            $FieldOrder++;
            if ( !$SuccessTicketField ) {
                die "Could not create new DynamicField $FieldName";
            }
        }
    }

    # insert new article dynamic field entries if necessary
    for my $Index ( 1 .. 3 ) {
        for my $FreeField ( 'ArticleFreeKey', 'ArticleFreeText' ) {
            if ( !$Data{ $FreeField . $Index } ) {
                my $FieldName = $FreeField . $Index;

                # insert new dynamic field
                my $SuccessArticleField = $CommonObject->{DBObject}->Do(
                    SQL =>
                        "INSERT INTO dynamic_field (name, label, field_order, field_type, object_type, config,
                            valid_id, create_time, create_by, change_time, change_by)
                        VALUES (?, ?, ?, 'Text', 'Article', '--- {}\n', 1, current_timestamp, 1, current_timestamp, 1)",
                    Bind => [
                        \$FieldName, \$FieldName, \$FieldOrder,
                    ],
                );
                $FieldOrder++;
                if ( !$SuccessArticleField ) {
                    die "Could not create new DynamicField $FieldName";
                }
            }
        }
    }

    return 1;
}

=item _DynamicFieldTicketMigration($CommonObject)

Copy data from ticket free fields to dynamic fields.

    _DynamicFieldTicketMigration($CommonObject);

=cut

sub _DynamicFieldTicketMigration {
    my $CommonObject = shift;

    my $MigratedTicketCounter = 0;
    my %TicketFreeFields      = (
        FreeKey  => 16,
        FreeText => 16,
        FreeTime => 6,
    );

    # create fields string and condition
    my $FreeFieldsTicket   = "";
    my $FreeFieldsTicketDB = "";
    my $TicketCondition    = "";
    for my $FreeField ( sort keys %TicketFreeFields ) {

        for my $Index ( 1 .. $TicketFreeFields{$FreeField} ) {
            $FreeFieldsTicket   .= lc($FreeField) . $Index . ", ";
            $FreeFieldsTicketDB .= "'Ticket" . $FreeField . $Index . "', ";
            $TicketCondition    .= lc($FreeField) . $Index . " IS NOT NULL OR ";
        }
    }

    # remove unnecessary part
    $FreeFieldsTicket   = substr $FreeFieldsTicket,   0, -2;
    $FreeFieldsTicketDB = substr $FreeFieldsTicketDB, 0, -2;
    $TicketCondition    = substr $TicketCondition,    0, -3;

    # get dynamic field ids and names
    my %DynamicFieldIDs;
    my $SuccessFields = $CommonObject->{DBObject}->Prepare(
        SQL => "SELECT id, name FROM dynamic_field
                WHERE name in ($FreeFieldsTicketDB)
                    AND object_type = 'Ticket'
                ",
    );
    while ( my @Row = $CommonObject->{DBObject}->FetchrowArray() ) {
        $DynamicFieldIDs{ $Row[1] } = $Row[0];
    }

    # select dynamic field entries
    my $SuccessTicketHowMuch = $CommonObject->{DBObject}->Prepare(
        SQL => 'SELECT count(id) FROM ticket ' .
            'WHERE ' . $TicketCondition,
    );

    my $HowMuchTickets = 0;
    while ( my @Row = $CommonObject->{DBObject}->FetchrowArray() ) {
        $HowMuchTickets = $Row[0];
    }

    # create new db connection
    my $DBConnectionObject = Kernel::System::DB->new( %{ $CommonObject->{DBObject} } );

    # select dynamic field entries
    my $SuccessTicket = $CommonObject->{DBObject}->Prepare(
        SQL => 'SELECT id, ' . $FreeFieldsTicket . ' FROM ticket ' .
            'WHERE ' . $TicketCondition . ' ' .
            'ORDER BY id',
    );

    while ( my @Row = $CommonObject->{DBObject}->FetchrowArray() ) {

        # select dynamic field entries
        my $SuccessTicketDynamicFields = $DBConnectionObject->Prepare(
            SQL => "
                SELECT DISTINCT(dfv.field_id), dfv.object_id
                FROM dynamic_field_value dfv
                WHERE dfv.field_id IN (" . join( ',', values %DynamicFieldIDs ) . ")
                    AND dfv.object_id = $Row[0]",
        );
        my %DynamicFieldRetrieved;
        while ( my @DFVRow = $DBConnectionObject->FetchrowArray() ) {
            $DynamicFieldRetrieved{ $DFVRow[0] . $DFVRow[1] } = 1;
        }

        my $FieldCounter  = 0;
        my $SuccessTicket = 1;
        my $TicketCounter = 1;
        for my $FreeField ( sort keys %TicketFreeFields ) {

            for my $Index ( 1 .. $TicketFreeFields{$FreeField} ) {
                $FieldCounter++;
                if ( defined $Row[$FieldCounter] ) {

                    my $FieldID    = $DynamicFieldIDs{ 'Ticket' . $FreeField . $Index };
                    my $FieldType  = ( $FreeField eq 'FreeTime' ? 'DateTime' : 'Text' );
                    my $FieldValue = $Row[$FieldCounter];
                    my $ValueType  = ( $FreeField eq 'FreeTime' ? 'date' : 'text' );
                    my $ObjectID   = $Row[0];
                    if ( !defined $DynamicFieldRetrieved{ $FieldID . $ObjectID } ) {

                        # insert new dinamic field value
                        my $SuccessTicketField = $DBConnectionObject->Do(
                            SQL =>
                                'INSERT INTO dynamic_field_value (' .
                                'field_id, object_id, value_' . $ValueType .
                                ') VALUES (?, ?, ?)',
                            Bind => [
                                \$FieldID, \$ObjectID, \$FieldValue,
                            ],
                        );
                        if ( !$SuccessTicketField ) {
                            $SuccessTicket = 0;
                        }
                    }
                }
            }
        }
        if ( !$SuccessTicket ) {
            print "   Free fields from ticket with ID:$Row[0] was not successfully migrated. \n";
        }
        else {

            # ticket counter
            $MigratedTicketCounter++;
            print "   Migrated ticket $MigratedTicketCounter of $HowMuchTickets. \n"
                if ( $MigratedTicketCounter % 100 ) == 0;
        }
    }

    print "\n Migrated $MigratedTicketCounter tickets of $HowMuchTickets. \n";

    return $MigratedTicketCounter;
}

=item _DynamicFieldArticleMigration($CommonObject)

Copy data from article free fields to dynamic fields.

    _DynamicFieldArticleMigration($CommonObject);

=cut

sub _DynamicFieldArticleMigration {
    my $CommonObject = shift;

    my $MigratedArticleCounter = 0;
    my %ArticleFreeFields      = (
        FreeKey  => 3,
        FreeText => 3,
    );

    # create fields string and condition
    my $FreeFieldsArticle   = "";
    my $FreeFieldsArticleDB = "";
    my $ArticleCondition    = "";
    for my $FreeField ( sort keys %ArticleFreeFields ) {

        for my $Index ( 1 .. $ArticleFreeFields{$FreeField} ) {
            $FreeFieldsArticle   .= 'a_' . lc($FreeField) . $Index . ", ";
            $FreeFieldsArticleDB .= "'Article" . $FreeField . $Index . "', ";
            $ArticleCondition    .= 'a_' . lc($FreeField) . $Index . " IS NOT NULL OR ";
        }
    }

    # remove unnecessary part
    $FreeFieldsArticle   = substr $FreeFieldsArticle,   0, -2;
    $FreeFieldsArticleDB = substr $FreeFieldsArticleDB, 0, -2;
    $ArticleCondition    = substr $ArticleCondition,    0, -3;

    # get dynamic field ids
    my %DynamicFieldIDs;
    my $SuccessFields = $CommonObject->{DBObject}->Prepare(
        SQL => "SELECT id, name FROM dynamic_field
                WHERE name in ($FreeFieldsArticleDB)
                    AND object_type = 'Article'
                ",
    );
    while ( my @Row = $CommonObject->{DBObject}->FetchrowArray() ) {
        $DynamicFieldIDs{ $Row[1] } = $Row[0];
    }

    # select articles with dynamic field entries
    my $SuccessArticleHowMuch = $CommonObject->{DBObject}->Prepare(
        SQL => 'SELECT count(id) FROM article ' .
            'WHERE ' . $ArticleCondition,
    );

    my $HowMuchArticles = 0;
    while ( my @Row = $CommonObject->{DBObject}->FetchrowArray() ) {
        $HowMuchArticles = $Row[0];
    }

    # create new db connection
    my $DBConnectionObject = Kernel::System::DB->new( %{ $CommonObject->{DBObject} } );

    # select dynamic field entries
    my $SuccessArticle = $CommonObject->{DBObject}->Prepare(
        SQL => 'SELECT id, ' . $FreeFieldsArticle . ' FROM article ' .
            'WHERE ' . $ArticleCondition . ' ' .
            'ORDER BY id',
    );

    while ( my @Row = $CommonObject->{DBObject}->FetchrowArray() ) {

        # select dynamic field entries
        my $SuccessArticleDynamicFields = $DBConnectionObject->Prepare(
            SQL => "SELECT dfv.field_id, dfv.object_id
                FROM dynamic_field_value dfv
                WHERE dfv.field_id IN (" . join( ',', values %DynamicFieldIDs ) . ")
                    AND dfv.object_id = $Row[0]",
        );
        my %DynamicFieldRetrieved;
        while ( my @Row = $DBConnectionObject->FetchrowArray() ) {
            $DynamicFieldRetrieved{ $Row[0] . $Row[1] } = 1;
        }

        my $FieldCounter   = 0;
        my $SuccessArticle = 1;
        my $ArticleCounter = 1;
        for my $FreeField ( sort keys %ArticleFreeFields ) {

            for my $Index ( 1 .. $ArticleFreeFields{$FreeField} ) {
                $FieldCounter++;
                if ( defined $Row[$FieldCounter] ) {

                    my $FieldID    = $DynamicFieldIDs{ 'Article' . $FreeField . $Index };
                    my $FieldType  = ( $FreeField eq 'FreeTime' ? 'DateTime' : 'Text' );
                    my $FieldValue = $Row[$FieldCounter];
                    my $ValueType  = ( $FreeField eq 'FreeTime' ? 'date' : 'text' );
                    my $ObjectID   = $Row[0];
                    if ( !defined $DynamicFieldRetrieved{ $FieldID . $ObjectID } ) {

                        # insert new dynamic field value
                        my $SuccessArticleField = $DBConnectionObject->Do(
                            SQL =>
                                'INSERT INTO dynamic_field_value (' .
                                'field_id, object_id, value_' . $ValueType .
                                ') VALUES (?, ?, ?)',
                            Bind => [
                                \$FieldID, \$ObjectID, \$FieldValue,
                            ],
                        );
                        if ( !$SuccessArticleField ) {
                            $SuccessArticle = 0;
                        }
                    }
                }
            }
        }
        if ( !$SuccessArticle ) {
            print "   Free fields from article with ID:$Row[0] was not successfully migrated. \n";
        }
        else {

            # article counter
            $MigratedArticleCounter++;
            print "   Migrated article $MigratedArticleCounter of $HowMuchArticles. \n"
                if ( $MigratedArticleCounter % 100 ) == 0;
        }
    }

    print "\n Migrated $MigratedArticleCounter articles of $HowMuchArticles. \n";

    return $MigratedArticleCounter;
}

=item _VerificationTicketData($CommonObject)

Checks if the data for ticket was successfully migrated.

    _VerificationTicketData($CommonObject);

=cut

sub _VerificationTicketData {
    my $CommonObject = shift;

    my $MigratedTicketCounter = 0;
    my %TicketFreeFields      = (
        FreeKey  => 16,
        FreeText => 16,
        FreeTime => 6,
    );

    # create fields string and condition
    my $FreeFieldsTicket   = "";
    my $FreeFieldsTicketDB = "";
    my $TicketCondition    = "";
    for my $FreeField ( sort keys %TicketFreeFields ) {

        for my $Index ( 1 .. $TicketFreeFields{$FreeField} ) {
            $FreeFieldsTicket   .= lc($FreeField) . $Index . ", ";
            $FreeFieldsTicketDB .= "'Ticket" . $FreeField . $Index . "', ";
            $TicketCondition    .= lc($FreeField) . $Index . " IS NOT NULL OR ";
        }
    }

    # remove unnecessary part
    $FreeFieldsTicket   = substr $FreeFieldsTicket,   0, -2;
    $FreeFieldsTicketDB = substr $FreeFieldsTicketDB, 0, -2;
    $TicketCondition    = substr $TicketCondition,    0, -3;

    # create new db connection
    my $DBConnectionObject = Kernel::System::DB->new( %{ $CommonObject->{DBObject} } );

    # get dynamic field ids and names
    my %DynamicFieldIDs;
    my $SuccessFields = $CommonObject->{DBObject}->Prepare(
        SQL => 'SELECT id, name FROM dynamic_field ' .
            'WHERE name in (' . $FreeFieldsTicketDB . ')',

        #        Bind => [\$FreeFieldsTicket],
    );
    while ( my @Row = $CommonObject->{DBObject}->FetchrowArray() ) {
        $DynamicFieldIDs{ $Row[1] } = $Row[0];
    }

    # select dynamic field entries
    my $SuccessTicket = $CommonObject->{DBObject}->Prepare(
        SQL => 'SELECT id, ' . $FreeFieldsTicket . ' FROM ticket ' .
            'WHERE ' . $TicketCondition . ' ' .
            'ORDER BY id',
    );

    while ( my @Row = $CommonObject->{DBObject}->FetchrowArray() ) {

        # set object type
        my $ObjectType = 'Ticket';

        # select dynamic field entries
        my $SuccessDynamicField = $DBConnectionObject->Prepare(
            SQL =>
                "SELECT dfv.id, dfv.field_id, df.object_type, dfv.object_id,
                    dfv.value_text, dfv.value_int, dfv.value_date
                FROM dynamic_field_value dfv, dynamic_field df
                WHERE df.object_type ='$ObjectType'
                    AND dfv.object_id = $Row[0]
                    AND df.id = dfv.field_id
                ORDER BY dfv.id",
        );

        my %DynamicFieldValue;
        while ( my @DFVRow = $DBConnectionObject->FetchrowArray() ) {
            my $TextValue = defined $DFVRow[4] ? $DFVRow[4] : '';
            my $IntValue  = defined $DFVRow[5] ? $DFVRow[5] : '';
            my $DateValue = defined $DFVRow[6] ? $DFVRow[6] : '';
            $DynamicFieldValue{ $DFVRow[1] . $DFVRow[2] . $DFVRow[3] }
                = $TextValue . $IntValue . $DateValue;
        }

        my $FieldCounter  = 0;
        my $SuccessTicket = 1;
        my $TicketCounter = 1;
        for my $FreeField ( sort keys %TicketFreeFields ) {

            for my $Index ( 1 .. $TicketFreeFields{$FreeField} ) {
                $FieldCounter++;
                if ( defined $Row[$FieldCounter] ) {

                    my $FieldID    = $DynamicFieldIDs{ 'Ticket' . $FreeField . $Index };
                    my $FieldType  = ( $FreeField eq 'FreeTime' ? 'DateTime' : 'Text' );
                    my $FieldValue = $Row[$FieldCounter];
                    my $ValueType  = ( $FreeField eq 'FreeTime' ? 'date' : 'text' );
                    my $ObjectID   = $Row[0];
                    if (
                        $DynamicFieldValue{ $FieldID . $ObjectType . $ObjectID } ne
                        $Row[$FieldCounter]
                        )
                    {
                        print STDERR
                            "A field was not correctly migrated: $FieldID $ObjectType $ObjectID\n";
                        print STDERR "  Found DynamicField value '"
                            . $DynamicFieldValue{ $FieldID . $ObjectType . $ObjectID }
                            . "', expected '"
                            . $Row[$FieldCounter] . "'!\n";
                        return 0;
                    }
                }
            }
        }
    }

    return 1;
}

=item _VerificationArticleData($CommonObject)

Checks if the data for ticket was successfully migrated.

    _VerificationArticleData($CommonObject);

=cut

sub _VerificationArticleData {
    my $CommonObject = shift;

    my $MigratedArticleCounter = 0;
    my %ArticleFreeFields      = (
        FreeKey  => 3,
        FreeText => 3,
    );

    # create fields string and condition
    my $FreeFieldsArticle   = "";
    my $FreeFieldsArticleDB = "";
    my $ArticleCondition    = "";
    for my $FreeField ( sort keys %ArticleFreeFields ) {

        for my $Index ( 1 .. $ArticleFreeFields{$FreeField} ) {
            $FreeFieldsArticle   .= 'a_' . lc($FreeField) . $Index . ", ";
            $FreeFieldsArticleDB .= "'Article" . $FreeField . $Index . "', ";
            $ArticleCondition    .= 'a_' . lc($FreeField) . $Index . " IS NOT NULL OR ";
        }
    }

    # remove unnecessary part
    $FreeFieldsArticle   = substr $FreeFieldsArticle,   0, -2;
    $FreeFieldsArticleDB = substr $FreeFieldsArticleDB, 0, -2;
    $ArticleCondition    = substr $ArticleCondition,    0, -3;

    # create new db connection
    my $DBConnectionObject = Kernel::System::DB->new( %{ $CommonObject->{DBObject} } );

    # get dynamic field ids and names
    my %DynamicFieldIDs;
    my $SuccessFields = $CommonObject->{DBObject}->Prepare(
        SQL => 'SELECT id, name FROM dynamic_field ' .
            'WHERE name in (' . $FreeFieldsArticleDB . ')',

        #        Bind => [\$FreeFieldsArticle],
    );
    while ( my @Row = $CommonObject->{DBObject}->FetchrowArray() ) {
        $DynamicFieldIDs{ $Row[1] } = $Row[0];
    }

    # select dynamic field entries
    my $SuccessArticle = $CommonObject->{DBObject}->Prepare(
        SQL => 'SELECT id, ' . $FreeFieldsArticle . ' FROM article ' .
            'WHERE ' . $ArticleCondition . ' ' .
            'ORDER BY id',
    );

    while ( my @Row = $CommonObject->{DBObject}->FetchrowArray() ) {

        # set object type
        my $ObjectType = 'Article';

        # select dynamic field entries
        my $SuccessDynamicField = $DBConnectionObject->Prepare(
            SQL => "SELECT dfv.id, dfv.field_id, df.object_type, dfv.object_id,
                    dfv.value_text, dfv.value_int, dfv.value_date
                FROM dynamic_field_value dfv, dynamic_field df
                WHERE df.object_type ='$ObjectType'
                    AND dfv.object_id = $Row[0]
                    AND df.id = dfv.field_id
                ORDER BY dfv.id",
        );

        my %DynamicFieldValue;
        while ( my @DFVRow = $DBConnectionObject->FetchrowArray() ) {
            my $TextValue = defined $DFVRow[4] ? $DFVRow[4] : '';
            my $IntValue  = defined $DFVRow[5] ? $DFVRow[5] : '';
            my $DateValue = defined $DFVRow[6] ? $DFVRow[6] : '';
            $DynamicFieldValue{ $DFVRow[1] . $DFVRow[2] . $DFVRow[3] }
                = $TextValue . $IntValue . $DateValue;
        }

        my $FieldCounter   = 0;
        my $SuccessArticle = 1;
        my $ArticleCounter = 1;
        for my $FreeField ( sort keys %ArticleFreeFields ) {

            for my $Index ( 1 .. $ArticleFreeFields{$FreeField} ) {
                $FieldCounter++;
                if ( defined $Row[$FieldCounter] ) {

                    my $FieldID    = $DynamicFieldIDs{ 'Article' . $FreeField . $Index };
                    my $FieldType  = ( $FreeField eq 'FreeTime' ? 'DateTime' : 'Text' );
                    my $FieldValue = $Row[$FieldCounter];
                    my $ValueType  = ( $FreeField eq 'FreeTime' ? 'date' : 'text' );
                    my $ObjectID   = $Row[0];
                    if ( $DynamicFieldValue{ $FieldID . $ObjectType . $ObjectID } ne $FieldValue ) {
                        print STDERR
                            "A field was not correctly migrated (Field $FieldID ObjectType $ObjectType ObjectID $ObjectID)!\n";
                        print STDERR "  Found DynamicField value '"
                            . $DynamicFieldValue{ $FieldID . $ObjectType . $ObjectID }
                            . "', expected '"
                            . $Row[$FieldCounter] . "'!\n";
                        return 0;
                    }
                }
            }
        }
    }

    return 1;
}

=item _MigrateFreeFieldsConfiguration($CommonObject)

migrates the configuration of the free fields from SysConfig to the
new dynamic_fields table.

    _MigrateFreeFieldsConfiguration($CommonObject);

=cut

sub _MigrateFreeFieldsConfiguration {
    my $CommonObject = shift;

    # Purge cache first to make sure that the DF API works correctly
    #   after we made inserts by hand.
    my $CacheObject = Kernel::System::Cache->new( %{$CommonObject} );
    $CacheObject->CleanUp(
        Type => 'DynamicField',
    );

    # create additional objects
    my $DynamicFieldObject = Kernel::System::DynamicField->new( %{$CommonObject} );

    my $DynamicFields = $DynamicFieldObject->DynamicFieldList(
        Valid      => 0,
        ResultType => 'HASH',
    );

    $DynamicFields = { reverse %{$DynamicFields} };

    for my $Index ( 1 .. 16 ) {
        FIELD:
        for my $FreeField ( 'TicketFreeKey', 'TicketFreeText' ) {

            my $FieldName = $FreeField . $Index;

            if ( defined $DynamicFields->{$FieldName} ) {

                my $FieldConfig = $DynamicFieldObject->DynamicFieldGet(
                    ID => $DynamicFields->{$FieldName},
                );

                # Get all Attributes from Item
                my $PossibleValues = $CommonObject->{ConfigObject}->Get($FieldName);
                $FieldConfig->{Config}->{PossibleValues} = $PossibleValues;

                if ( !$PossibleValues || !%{$PossibleValues} ) {

                    # Leave this a text field. If the config setting was disabled,
                    #   disable this field.
                    if ( !defined $PossibleValues ) {

                        my $SuccessTicketField = $DynamicFieldObject->DynamicFieldUpdate(
                            %{$FieldConfig},
                            Reorder => 0,
                            ValidID => 2,
                            UserID  => 1,
                        );

                        if ( !$SuccessTicketField ) {
                            die "Could not migrate configuration for dynamic field: $FieldName";
                        }
                    }

                    next FIELD;
                }

                if ( $FreeField eq 'TicketFreeText' ) {

         # If the corresponding key has only one possible value for this entry, use it as the label.
                    my $KeyName      = 'TicketFreeKey' . $Index;
                    my $PossibleKeys = my $PossibleValues
                        = $CommonObject->{ConfigObject}->Get($KeyName);

                    if ( ref $PossibleKeys eq 'HASH' && scalar keys %{$PossibleKeys} == 1 ) {
                        for my $Key ( keys %{$PossibleKeys} ) {
                            $FieldConfig->{Label} = $PossibleKeys->{$Key};
                        }
                    }
                }

                my $DefaultSelection
                    = $CommonObject->{ConfigObject}->Get( $FieldName . "::DefaultSelection" );
                $FieldConfig->{Config}->{DefaultValue} = $DefaultSelection;

                # set new values
                my $SuccessTicketField = $DynamicFieldObject->DynamicFieldUpdate(
                    %{$FieldConfig},
                    FieldType => 'Dropdown',
                    Reorder   => 0,
                    ValidID   => 1,
                    UserID    => 1,
                );

                if ( !$SuccessTicketField ) {
                    die "Could not migrate configuration for dynamic field: $FieldName";
                }
            }
        }
    }

    for my $Index ( 1 .. 6 ) {

        FIELD:
        my $FieldName = 'TicketFreeTime' . $Index;
        if ( defined $DynamicFields->{$FieldName} ) {
            my $FieldConfig = $DynamicFieldObject->DynamicFieldGet(
                ID => $DynamicFields->{$FieldName},
            );

            # Get all Attributes from Item
            my $TimeKey = $CommonObject->{ConfigObject}->Get( 'TicketFreeTimeKey' . $Index );
            $FieldConfig->{Label} = $TimeKey;
            if ( !$TimeKey ) {

                my $SuccessTicketField = $DynamicFieldObject->DynamicFieldUpdate(
                    %{$FieldConfig},
                    Reorder => 0,
                    ValidID => 2,
                    UserID  => 1,
                );

                if ( !$SuccessTicketField ) {
                    die "Could not migrate configuration for dynamic field: $FieldName";
                }

                next FIELD;
            }

            $FieldConfig->{Config}->{DefaultValue}
                = $CommonObject->{ConfigObject}->Get( 'TicketFreeTimeDiff' . $Index );

            my $FreeTimePeriod
                = $CommonObject->{ConfigObject}->Get( 'TicketFreeTimePeriod' . $Index );

            if ( $FreeTimePeriod && ref $FreeTimePeriod eq 'HASH' ) {
                $FieldConfig->{Config}->{YearsPeriod}   = 1;
                $FieldConfig->{Config}->{YearsInFuture} = $FreeTimePeriod->{YearPeriodFuture};
                $FieldConfig->{Config}->{YearsInPast}   = $FreeTimePeriod->{YearPeriodPast};
            }

            # set new values
            my $SuccessTicketField = $DynamicFieldObject->DynamicFieldUpdate(
                %{$FieldConfig},
                FieldType => 'DateTime',
                Reorder   => 0,
                ValidID   => 1,
                UserID    => 1,
            );

            if ( !$SuccessTicketField ) {
                die "Could not migrate configuration for dynamic field: $FieldName";
            }
        }
    }

    for my $Index ( 1 .. 3 ) {

        FIELD:
        for my $FreeField ( 'ArticleFreeKey', 'ArticleFreeText' ) {

            my $FieldName = $FreeField . $Index;
            if ( defined $DynamicFields->{$FieldName} ) {
                my $FieldConfig = $DynamicFieldObject->DynamicFieldGet(
                    ID => $DynamicFields->{$FieldName},
                );

                # Get all Attributes from Item
                my $PossibleValues = $CommonObject->{ConfigObject}->Get($FieldName);

                if ( ref $PossibleValues eq 'HASH' ) {

                    # search for "None" value in possible values list
                    if ( $PossibleValues->{''} && $PossibleValues->{''} eq '-' ) {

                        # delete "None" value from the list
                        delete $PossibleValues->{''};

                        # set possible none configuration inside the field config
                        $FieldConfig->{Config}->{PossibleNone} = 1;
                    }
                }

                # set none empty PossibleValues into the field config
                $FieldConfig->{Config}->{PossibleValues} = $PossibleValues;
                if ( !$PossibleValues || !%{$PossibleValues} ) {

                    # Leave this a text field. If the config setting was disabled,
                    #   disable this field.
                    if ( !defined $PossibleValues ) {
                        my $SuccessTicketField = $DynamicFieldObject->DynamicFieldUpdate(
                            %{$FieldConfig},
                            Reorder => 0,
                            ValidID => 2,
                            UserID  => 1,
                        );

                        if ( !$SuccessTicketField ) {
                            die "Could not migrate configuration for dynamic field: $FieldName";
                        }
                    }

                    next FIELD;
                }

                if ( $FreeField eq 'ArticleFreeText' ) {

         # If the corresponding key has only one possible value for this entry, use it as the label.
                    my $KeyName      = 'ArticleFreeKey' . $Index;
                    my $PossibleKeys = my $PossibleValues
                        = $CommonObject->{ConfigObject}->Get($KeyName);

                    if ( ref $PossibleKeys eq 'HASH' && scalar keys %{$PossibleKeys} == 1 ) {
                        for my $Key ( keys %{$PossibleKeys} ) {
                            $FieldConfig->{Label} = $PossibleKeys->{$Key};
                        }
                    }
                }

                $FieldConfig->{Config}->{DefaultValue}
                    = $CommonObject->{ConfigObject}->Get( $FieldName . "::DefaultSelection" )
                    ;

                # set new values
                my $SuccessTicketField = $DynamicFieldObject->DynamicFieldUpdate(
                    %{$FieldConfig},
                    FieldType => 'Dropdown',
                    Reorder   => 0,
                    ValidID   => 1,
                    UserID    => 1,
                );

                if ( !$SuccessTicketField ) {
                    die "Could not migrate configuration for dynamic field: $FieldName";
                }
            }

        }
    }

    return 1;
}

=item _UpdateHistoryType($CommonObject)

remove the old history types ( TicketFreeTextUpdate, TicketFreeTimeUpdate )
and introduce a new one for dynamic fields (TicketDynamicFieldUpdate), all old entries will mere into the new one.

    _UpdateHistoryType($CommonObject);

=cut

sub _UpdateHistoryType {
    my $CommonObject = shift;

    # set fields name
    my $HistoryEntryToRename = 'TicketFreeTextUpdate';
    my $NewHistoryEntry      = 'TicketDynamicFieldUpdate';

    # rename the history type 'TicketFreeTextUpdate' to 'TicketDynamicFieldUpdate'
    my $SuccessUpdate = $CommonObject->{DBObject}->Do(
        SQL =>
            "UPDATE ticket_history_type set name=? WHERE name=?",
        Bind => [
            \$NewHistoryEntry, \$HistoryEntryToRename,
        ],
    );

    if ( !$SuccessUpdate ) {
        print "Could not possible to change the name for the ticket history type!\n";
        return 0;
    }

    return 1;
}

=item _MigrateWindowConfiguration($CommonObject)

migrates the configuration of the free fields for each window to the
new dynamic field structure.

    _MigrateWindowConfiguration($CommonObject);

=cut

sub _MigrateWindowConfiguration {
    my $CommonObject = shift;

    # Purge cache first to make sure that the DF API works correctly
    #   after we made inserts by hand.
    my $CacheObject = Kernel::System::Cache->new( %{$CommonObject} );
    $CacheObject->CleanUp(
        Type => 'DynamicField',
    );

    # create additional objects
    my $DynamicFieldObject = Kernel::System::DynamicField->new( %{$CommonObject} );
    my $SysConfigObject    = Kernel::System::SysConfig->new( %{$CommonObject} );

    my $DynamicFields = $DynamicFieldObject->DynamicFieldList(
        Valid      => 0,
        ResultType => 'HASH',
    );

    $DynamicFields = { reverse %{$DynamicFields} };

    my @Windows = (
        'CustomerTicketMessage',
        'CustomerTicketSearch',
        'AgentTicketResponsible',
        'AgentTicketPriority',
        'AgentTicketPhoneOutbound',
        'AgentTicketPhoneInbound',
        'AgentTicketPhone',
        'AgentTicketPending',
        'AgentTicketOwner',
        'AgentTicketNote',
        'AgentTicketMove',
        'AgentTicketForward',
        'AgentTicketFreeText',
        'AgentTicketEmail',
        'AgentTicketCompose',
        'AgentTicketClose',
    );

    for my $Window (@Windows) {

        my $WindowConfig =
            $CommonObject->{ConfigObject}->Get("Ticket::Frontend::$Window");

        my $KeyString       = "Ticket::Frontend::$Window" . "###DynamicField";
        my $ExistingSetting = $CommonObject->{ConfigObject}->Get("Ticket::Frontend::$Window") || {};
        my %ValuesToSet     = %{ $ExistingSetting->{DynamicField} || {} };

        for my $FreeField ( 'TicketFreeKey', 'TicketFreeText' ) {
            if ( defined $WindowConfig->{$FreeField} ) {

                my $Config = $WindowConfig->{$FreeField};

                for my $Index ( 1 .. 16 ) {

                    my $FieldName = $FreeField . $Index;
                    if ( defined $DynamicFields->{$FieldName} && $Config->{$Index} ) {

                        $ValuesToSet{$FieldName} = $Config->{$Index};
                    }
                }
            }
        }

        # end TicketFree Key and Text

        if ( defined $WindowConfig->{TicketFreeTime} ) {

            my $Config = $WindowConfig->{TicketFreeTime};

            for my $Index ( 1 .. 6 ) {

                my $FieldName = 'TicketFreeTime' . $Index;
                if ( defined $DynamicFields->{$FieldName} && $Config->{$Index} ) {

                    $ValuesToSet{$FieldName} = $Config->{$Index};
                }
            }
        }

        # end TicketFreeTime

        for my $FreeField ( 'ArticleFreeKey', 'ArticleFreeText' ) {
            if ( defined $WindowConfig->{$FreeField} ) {

                my $Config = $WindowConfig->{$FreeField};

                for my $Index ( 1 .. 3 ) {

                    my $FieldName = $FreeField . $Index;
                    if ( defined $DynamicFields->{$FieldName} && $Config->{$Index} ) {

                        $ValuesToSet{$FieldName} = $Config->{$Index};
                    }
                }

            }
        }

        # end ArticleFree Key and Text

        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => $KeyString,
            Value => \%ValuesToSet,
        );

        if ( !$Success ) {
            print
                "Could not migrate the config values on $Window window!\n";
            return 0;
        }

    }

    # AgentTicketSearch configuration

    my $WindowConfig =
        $CommonObject->{ConfigObject}->Get('Ticket::Frontend::AgentTicketSearch');

    my $ExistingSetting = $CommonObject->{ConfigObject}->Get('Ticket::Frontend::AgentTicketSearch')
        || {};
    my %ValuesToSet = %{ $ExistingSetting->{DynamicField} || {} };

    if ( defined $WindowConfig->{Defaults} ) {

        my $Config = $WindowConfig->{Defaults};

        for my $Index ( 1 .. 16 ) {

            my $FieldName = 'TicketFreeText' . $Index;
            if ( defined $DynamicFields->{$FieldName} && $Config->{$FieldName} ) {

                $ValuesToSet{$FieldName} = $Config->{$FieldName};
            }
        }

        for my $Index ( 1 .. 5 ) {

            my $FieldName = 'TicketFreeTime' . $Index;
            if ( defined $DynamicFields->{$FieldName} && $Config->{$FieldName} ) {

                $ValuesToSet{$FieldName} = $Config->{$FieldName};
            }
        }
    }

    my $Success = $SysConfigObject->ConfigItemUpdate(
        Valid => 1,
        Key   => 'Ticket::Frontend::AgentTicketSearch###DynamicField',
        Value => \%ValuesToSet,
    );

    if ( !$Success ) {
        print
            "Could not migrate the config values on AgentTicketSearch window!\n";
        return 0;
    }

    return 1;
}

=item _MigrateStatsConfiguration($CommonObject)

migrates the configuration of the free fields for each statistic to the
new dynamic field structure.

    _MigrateStatsConfiguration($CommonObject);

=cut

sub _MigrateStatsConfiguration {
    my $CommonObject = shift;

    # Purge cache first to make sure that the DF API works correctly
    #   after we made inserts by hand.
    my $CacheObject = Kernel::System::Cache->new( %{$CommonObject} );
    $CacheObject->CleanUp(
        Type => 'DynamicField',
    );

    # Purge xml cache in order to re-read all stats from the database
    # this will be usefull because we are updating DB registers by hand
    $CacheObject->CleanUp(
        Type => 'XML',
    );

    # create additional objects
    my $DynamicFieldObject = Kernel::System::DynamicField->new( %{$CommonObject} );

    # create new db connection
    my $DBConnectionObject = Kernel::System::DB->new( %{ $CommonObject->{DBObject} } );

    # find all statistics parts that need to be updated
    return if !$DBConnectionObject->Prepare(
        SQL => "SELECT xml_type, xml_key, xml_content_key, xml_content_value
            FROM xml_storage
            WHERE xml_type = 'Stats'
                AND xml_content_key like '%UseAs%'
                AND xml_content_value like 'TicketFree%'
            ORDER BY xml_key",
    );

    my @StatRecordsToChange;

    # loop trought all results
    while ( my @Row = $DBConnectionObject->FetchrowArray() ) {

        # get field details
        my %StatRecordConfig = (
            XMLType         => $Row[0],
            XMLKey          => $Row[1],
            XMLContentKey   => $Row[2],
            XMLContentValue => $Row[3],
        );

        # save field details
        push @StatRecordsToChange, \%StatRecordConfig;
    }

    # get DynamicFields list
    my $DynamicFields = $DynamicFieldObject->DynamicFieldList(
        Valid      => 0,
        ResultType => 'HASH',
    );

    # reverse the DynamicFields list to create a lookup table
    $DynamicFields = { reverse %{$DynamicFields} };

    STATSFIELDCONFIG:
    for my $StatRecordConfig (@StatRecordsToChange) {

        # check if the migarted dynamic field is available
        next STATSFIELDCONFIG if !$DynamicFields->{ $StatRecordConfig->{XMLContentValue} };

        # set new field name for stats
        $StatRecordConfig->{XMLContentValueNew}
            = 'DynamicField_' . $StatRecordConfig->{XMLContentValue};

        # update database
        my $SuccessStatsUpdate = $DBConnectionObject->Do(
            SQL =>
                'UPDATE xml_storage
                SET xml_content_value = ?
                WHERE xml_type = ?
                    AND xml_key = ?
                    AND xml_content_key = ?
                    AND xml_content_value = ?',
            Bind => [
                \$StatRecordConfig->{XMLContentValueNew},
                \$StatRecordConfig->{XMLType},
                \$StatRecordConfig->{XMLKey},
                \$StatRecordConfig->{XMLContentKey},
                \$StatRecordConfig->{XMLContentValue},
            ],
        );

        # check for errors
        if ( !$SuccessStatsUpdate ) {
            print "Could not migrate the statistic ID $StatRecordConfig->{XMLKEY}"
                . " field $StatRecordConfig->{XMLContentValue}\n";

            # return error
            return 0;
        }
    }

    # return success
    return 1;
}

=item _MigrateGenericAgentJobConfiguration($CommonObject)

migrates the configuration of the free fields for each generic agent job to the
new dynamic field structure.

    _MigrateGenericAgentJobConfiguration($CommonObject);

=cut

sub _MigrateGenericAgentJobConfiguration {
    my $CommonObject = shift;

    # create additional objects
    my $DynamicFieldObject = Kernel::System::DynamicField->new( %{$CommonObject} );

    # create new db connection
    my $DBConnectionObject = Kernel::System::DB->new( %{ $CommonObject->{DBObject} } );

    # get DynamicFields list
    my $DynamicFields = $DynamicFieldObject->DynamicFieldList(
        Valid      => 0,
        ResultType => 'HASH',
    );

    # reverse the DynamicFields list to create a lookup table
    $DynamicFields = { reverse %{$DynamicFields} };

    # find all free fields for search to be migrated
    return if !$DBConnectionObject->Prepare(
        SQL => "SELECT gaj.job_name, gaj.job_key, gaj.job_value
            FROM generic_agent_jobs gaj
            WHERE gaj.job_key like 'TicketFree%'
            ORDER BY gaj.job_name",
    );

    my @SearchRecordsToChange;

    # loop trought all results
    while ( my @Row = $DBConnectionObject->FetchrowArray() ) {

        # get field details
        my %JobRecordConfig = (
            JobName  => $Row[0],
            JobKey   => $Row[1],
            JobValue => $Row[2],
        );

        # save field details
        push @SearchRecordsToChange, \%JobRecordConfig;
    }

    # set search prefix
    my $SearchPrefix = 'Search_DynamicField_';

    JOBFIELDCONFIG:
    for my $JobRecordConfig (@SearchRecordsToChange) {

        # check if the migarted dynamic field is available
        next JOBFIELDCONFIG if !$DynamicFields->{ $JobRecordConfig->{JobKey} };

        # append search prefix to search free fields
        $JobRecordConfig->{JobKeyNew} = $SearchPrefix . $JobRecordConfig->{JobKey};

        # update database
        my $SuccessJobUpdate = $DBConnectionObject->Do(
            SQL => "UPDATE generic_agent_jobs gaj
                SET gaj.job_key = ?
                WHERE gaj.job_name = ?
                    AND gaj.job_key = ?
                    AND gaj.job_value = ?",
            Bind => [
                \$JobRecordConfig->{JobKeyNew},
                \$JobRecordConfig->{JobName},
                \$JobRecordConfig->{JobKey},
                \$JobRecordConfig->{JobValue},
            ],
        );

        # check for errors
        if ( !$SuccessJobUpdate ) {
            print "Could not migrate the Generic Agent Job $JobRecordConfig->{JobKey}"
                . " field $JobRecordConfig->{JobKey}\n";

            return 0;
        }
    }

    # find all free fields for set to be migrated
    return if !$DBConnectionObject->Prepare(
        SQL => "SELECT gaj.job_name, gaj.job_key, gaj.job_value
            FROM generic_agent_jobs gaj
            WHERE gaj.job_key like 'NewTicketFree%'
            ORDER BY gaj.job_name",
    );

    my @SetRecordsToChange;

    # loop trought all results
    while ( my @Row = $DBConnectionObject->FetchrowArray() ) {

        # get field details
        my %JobRecordConfig = (
            JobName  => $Row[0],
            JobKey   => $Row[1],
            JobValue => $Row[2],
        );

        # save field details
        push @SetRecordsToChange, \%JobRecordConfig;
    }

    # set the set prefix
    my $SetPrefix = 'DynamicField_';

    JOBFIELDCONFIG:
    for my $JobRecordConfig (@SetRecordsToChange) {

        # remove the new prefix
        $JobRecordConfig->{JobKeyTemp} = $JobRecordConfig->{JobKey};
        $JobRecordConfig->{JobKeyTemp} =~ s{New}{};

        # check if the migarted dynamic field is available
        next JOBFIELDCONFIG if !$DynamicFields->{ $JobRecordConfig->{JobKeyTemp} };

        # append set prefix to set free fields
        $JobRecordConfig->{JobKeyNew} = $SetPrefix . $JobRecordConfig->{JobKeyTemp};

        if ( $JobRecordConfig->{JobValue} ) {

            # update database
            my $SuccessJobUpdate = $DBConnectionObject->Do(
                SQL => "UPDATE generic_agent_jobs gaj
                    SET gaj.job_key = ?
                    WHERE gaj.job_name = ?
                        AND gaj.job_key = ?
                        AND gaj.job_value = ?",
                Bind => [
                    \$JobRecordConfig->{JobKeyNew},
                    \$JobRecordConfig->{JobName},
                    \$JobRecordConfig->{JobKey},
                    \$JobRecordConfig->{JobValue},
                ],
            );

            # check for errors
            if ( !$SuccessJobUpdate ) {
                print "Could not migrate the Generic Agent Job $JobRecordConfig->{JobKey}"
                    . " field $JobRecordConfig->{JobKey}\n";

                return 0;
            }
        }
        else {

            # delete empty options
            my $SuccessJobDelete = $DBConnectionObject->Do(
                SQL => "DELETE FROM generic_agent_jobs
                    WHERE job_name = ?
                        AND job_key = ?
                        AND job_value = ?",
                Bind => [
                    \$JobRecordConfig->{JobName},
                    \$JobRecordConfig->{JobKey},
                    \$JobRecordConfig->{JobValue},
                ],
            );

            # check for errors
            if ( !$SuccessJobDelete ) {
                print "Could not delete empty field $JobRecordConfig->{JobKey} from the "
                    . "Generic Agent Job $JobRecordConfig->{JobKey}\n";

                return 0;
            }
        }
    }
    return 1;
}

=item _MigratePostMasterConfiguration($CommonObject)

migrates the configuration of the free fields for PostMaster module into the
new dynamic field structure.

    _MigratePostMasterConfiguration($CommonObject);

=cut

sub _MigratePostMasterConfiguration {
    my $CommonObject = shift;

    # Purge cache first to make sure that the DF API works correctly
    #   after we made inserts by hand.
    my $CacheObject = Kernel::System::Cache->new( %{$CommonObject} );
    $CacheObject->CleanUp(
        Type => 'DynamicField',
    );

    # create additional objects
    my $DynamicFieldObject = Kernel::System::DynamicField->new( %{$CommonObject} );
    my $SysConfigObject    = Kernel::System::SysConfig->new( %{$CommonObject} );

    # get current dynamic fields
    my $DynamicFields = $DynamicFieldObject->DynamicFieldList(
        Valid      => 0,
        ResultType => 'HASH',
    );

    # set values as keys
    $DynamicFields = { reverse %{$DynamicFields} };

    # Post Master configuration
    my $ExistingSetting = $CommonObject->{ConfigObject}->Get('PostmasterX-Header');
    my @ValuesToSet = @{ $ExistingSetting || () };

    if ( scalar @ValuesToSet ) {

        # transform the array from config into a hash
        # in order to facility the interaction with the values
        my %CurrentXHeaders = map { $_ => 1 } @ValuesToSet;

        # migration for ticket fields
        my %XHeadersToChange = (
            'X-OTRS-TicketKey'            => 'TicketFreeKey',
            'X-OTRS-TicketValue'          => 'TicketFreeText',
            'X-OTRS-FollowUp-TicketKey'   => 'TicketFreeKey',
            'X-OTRS-FollowUp-TicketValue' => 'TicketFreeText',
        );

        for my $Key ( sort keys %XHeadersToChange ) {
            for my $Index ( 1 .. 16 ) {

                # set header and field name
                my $HeaderName = $Key . $Index;
                my $FieldName  = $XHeadersToChange{$Key} . $Index;

                if ( defined $DynamicFields->{$FieldName} && defined $CurrentXHeaders{$HeaderName} )
                {

                    # set header name for dynamic field
                    my $NewHeaderName = 'X-OTRS-DynamicField-' . $FieldName;

                    # delete old element
                    delete $CurrentXHeaders{$HeaderName};

                    # set new element
                    $CurrentXHeaders{$NewHeaderName} = 1;

                    # update rows in postmaster_filter table
                    my $SuccessUpdate = $CommonObject->{DBObject}->Do(
                        SQL =>
                            "UPDATE postmaster_filter SET f_key=? WHERE f_key=?",
                        Bind => [
                            \$NewHeaderName, \$HeaderName,
                        ],
                    );

                    if ( !$SuccessUpdate ) {
                        print "Could not possible to change the key for the post master filter!\n";
                    }

                }
            }
        }

        # migration for time fields
        %XHeadersToChange = (
            'X-OTRS-TicketTime'          => 'TicketFreeTime',
            'X-OTRS-FollowUp-TicketTime' => 'TicketFreeTime',
        );

        for my $Key ( sort keys %XHeadersToChange ) {
            for my $Index ( 1 .. 6 ) {

                my $HeaderName = $Key . $Index;
                my $FieldName  = $XHeadersToChange{$Key} . $Index;
                if ( defined $DynamicFields->{$FieldName} && defined $CurrentXHeaders{$HeaderName} )
                {

                    # set header name for dynamic field
                    my $NewHeaderName = 'X-OTRS-DynamicField-' . $FieldName;

                    # delete old element
                    delete $CurrentXHeaders{$HeaderName};

                    # set new element
                    $CurrentXHeaders{$NewHeaderName} = 1;

                    # update rows in postmaster_filter table
                    my $SuccessUpdate = $CommonObject->{DBObject}->Do(
                        SQL =>
                            "UPDATE postmaster_filter SET f_key=? WHERE f_key=?",
                        Bind => [
                            \$NewHeaderName, \$HeaderName,
                        ],
                    );

                    if ( !$SuccessUpdate ) {
                        print "Could not possible to change the key for the post master filter!\n";
                    }

                }
            }
        }

        # migration for article fields
        %XHeadersToChange = (
            'X-OTRS-ArticleKey'            => 'ArticleFreeKey',
            'X-OTRS-ArticleValue'          => 'ArticleFreeText',
            'X-OTRS-FollowUp-ArticleKey'   => 'ArticleFreeKey',
            'X-OTRS-FollowUp-ArticleValue' => 'ArticleFreeText',
        );

        for my $Key ( sort keys %XHeadersToChange ) {
            for my $Index ( 1 .. 3 ) {

                my $HeaderName = $Key . $Index;
                my $FieldName  = $XHeadersToChange{$Key} . $Index;
                if ( defined $DynamicFields->{$FieldName} && defined $CurrentXHeaders{$HeaderName} )
                {

                    # set header name for dynamic field
                    my $NewHeaderName = 'X-OTRS-DynamicField-' . $FieldName;

                    # delete old element
                    delete $CurrentXHeaders{$HeaderName};

                    # set new element
                    $CurrentXHeaders{$NewHeaderName} = 1;

                    # update rows in postmaster_filter table
                    my $SuccessUpdate = $CommonObject->{DBObject}->Do(
                        SQL =>
                            "UPDATE postmaster_filter SET f_key=? WHERE f_key=?",
                        Bind => [
                            \$NewHeaderName, \$HeaderName,
                        ],
                    );

                    if ( !$SuccessUpdate ) {
                        print "Could not possible to change the key for the post master filter!\n";
                    }

                }
            }
        }

        # revert values from hash into an array
        @ValuesToSet = sort keys %CurrentXHeaders;

    }

    # execute the update action in sysconfig
    my $Success = $SysConfigObject->ConfigItemUpdate(
        Valid => 1,
        Key   => 'PostmasterX-Header',
        Value => \@ValuesToSet,
    );

    if ( !$Success ) {
        print
            "Could not migrate the config values on AgentTicketSearch window!\n";
        return 0;
    }

    return 1;
}

=item _MigrateResponsesConfiguration($CommonObject)

migrates the configuration of the free fields for each response to the
new dynamic field structure.

    _MigrateResponsesConfiguration($CommonObject);

=cut

sub _MigrateResponsesConfiguration {
    my $CommonObject = shift;

    # create additional objects
    my $DynamicFieldObject = Kernel::System::DynamicField->new( %{$CommonObject} );

    # create new db connection
    my $DBConnectionObject = Kernel::System::DB->new( %{ $CommonObject->{DBObject} } );

    # get DynamicFields list
    my $DynamicFields = $DynamicFieldObject->DynamicFieldList(
        Valid      => 0,
        ResultType => 'HASH',
    );

    # reverse the DynamicFields list to create a lookup table
    $DynamicFields = { reverse %{$DynamicFields} };

    # localize dynamic fields
    my %LocalDynamicFields = %{$DynamicFields};

    # use only dynamic fields migrated from Ticket Free Fields
    FIELDNAME:
    for my $FieldName ( keys %LocalDynamicFields ) {
        next FIELDNAME if $FieldName =~ m{\A TicketFree ( ?: Text|Key|Time ) \d+ \Z}xms;
        delete $LocalDynamicFields{$FieldName};
    }

    # find all responses that has defined free fields tags
    return if !$DBConnectionObject->Prepare(
        SQL => "SELECT sr.id, sr.name, sr.text
            FROM standard_response sr
            WHERE sr.text like '%OTRS_TICKET_TicketFree%'
            ORDER BY sr.id",
    );

    my @ResponseRecordsToChange;

    # loop trought all results
    while ( my @Row = $DBConnectionObject->FetchrowArray() ) {

        # get response details
        my %ResponseRecordConfig = (
            ResponseID      => $Row[0],
            ResponseName    => $Row[1],
            ResponseText    => $Row[2],
            ResponseTextNew => $Row[2]
        );

        for my $FieldName ( keys %LocalDynamicFields ) {

            # replace all ocurrences of this $FieldName
            $ResponseRecordConfig{ResponseTextNew}
                =~ s{OTRS_TICKET_$FieldName}{OTRS_TICKET_DynamicField_$FieldName}gsx;
        }

        # save redord details to update DB later
        push @ResponseRecordsToChange, \%ResponseRecordConfig;
    }

    for my $ResponseRecordConfig (@ResponseRecordsToChange) {

        # update database
        my $SuccessResponseUpdate = $DBConnectionObject->Do(
            SQL => "UPDATE standard_response sr
                SET sr.text = ?
                WHERE sr.id = ?
                    AND sr.name = ?",
            Bind => [
                \$ResponseRecordConfig->{ResponseTextNew},
                \$ResponseRecordConfig->{ResponseID},
                \$ResponseRecordConfig->{ResponseName},
            ],
        );

        # check for errors
        if ( !$SuccessResponseUpdate ) {
            print "Could not migrate the Response $ResponseRecordConfig->{ResponseName}\n";
            return 0;
        }
    }
    return 1;
}

=item _MigrateAutoResponsesConfiguration($CommonObject)

migrates the configuration of the free fields for each auto response to the
new dynamic field structure.

    _MigrateResponsesConfiguration($CommonObject);

=cut

sub _MigrateAutoResponsesConfiguration {
    my $CommonObject = shift;

    # create additional objects
    my $DynamicFieldObject = Kernel::System::DynamicField->new( %{$CommonObject} );

    # create new db connection
    my $DBConnectionObject = Kernel::System::DB->new( %{ $CommonObject->{DBObject} } );

    # get DynamicFields list
    my $DynamicFields = $DynamicFieldObject->DynamicFieldList(
        Valid      => 0,
        ResultType => 'HASH',
    );

    # reverse the DynamicFields list to create a lookup table
    $DynamicFields = { reverse %{$DynamicFields} };

    # localize dynamic fields
    my %LocalDynamicFields = %{$DynamicFields};

    # use only dynamic fields migrated from Ticket Free Fields
    FIELDNAME:
    for my $FieldName ( keys %LocalDynamicFields ) {
        next FIELDNAME if $FieldName =~ m{\A TicketFree ( ?: Text|Key|Time ) \d+ \Z}xms;
        delete $LocalDynamicFields{$FieldName};
    }

    # find all auto responses that has defined free fields tags
    return if !$DBConnectionObject->Prepare(
        SQL => "SELECT ar.id, ar.name, ar.text0, ar.text1, ar.text2
            FROM auto_response ar
            WHERE ar.text0 like '%OTRS_TICKET_TicketFree%'
                OR ar.text1 like '%OTRS_TICKET_TicketFree%'
                OR ar.text2 like '%OTRS_TICKET_TicketFree%'
            ORDER BY ar.id",
    );

    my @AutoResponseRecordsToChange;

    # loop trought all results
    while ( my @Row = $DBConnectionObject->FetchrowArray() ) {

        # get auto response details
        my %AutoResponseRecordConfig = (
            AutoResponseID       => $Row[0],
            AutoResponseName     => $Row[1],
            AutoResponseText0    => $Row[2],
            AutoResponseText0New => $Row[2],
            AutoResponseText1    => $Row[3],
            AutoResponseText1New => $Row[3],
            AutoResponseText2    => $Row[4],
            AutoResponseText2New => $Row[4],
        );

        for my $FieldName ( keys %LocalDynamicFields ) {

            # replace all ocurrences of this $FieldName
            $AutoResponseRecordConfig{AutoResponseText0New}
                =~ s{OTRS_TICKET_$FieldName}{OTRS_TICKET_DynamicField_$FieldName}gsx;

            $AutoResponseRecordConfig{AutoResponseText1New}
                =~ s{OTRS_TICKET_$FieldName}{OTRS_TICKET_DynamicField_$FieldName}gsx;

            if ( $AutoResponseRecordConfig{AutoResponseText2New} ) {
                $AutoResponseRecordConfig{AutoResponseText2New}
                    =~ s{OTRS_TICKET_$FieldName}{OTRS_TICKET_DynamicField_$FieldName}gsx;
            }
        }

        # save redord details to update DB later
        push @AutoResponseRecordsToChange, \%AutoResponseRecordConfig;
    }

    for my $AutoResponseRecordConfig (@AutoResponseRecordsToChange) {

        # update database
        my $SuccessAutoResponseUpdate = $DBConnectionObject->Do(
            SQL => "UPDATE auto_response ar
                SET ar.text0 = ?, ar.text1 = ?, ar.text2 = ?
                WHERE ar.id = ?
                    AND ar.name = ?",
            Bind => [
                \$AutoResponseRecordConfig->{AutoResponseText0New},
                \$AutoResponseRecordConfig->{AutoResponseText1New},
                \$AutoResponseRecordConfig->{AutoResponseText2New},
                \$AutoResponseRecordConfig->{AutoResponseID},
                \$AutoResponseRecordConfig->{AutoResponseName},
            ],
        );

        # check for errors
        if ( !$SuccessAutoResponseUpdate ) {
            print "Could not migrate the Auto Response "
                . "$AutoResponseRecordConfig->{AutoResponseName}\n";
            return 0;
        }
    }
    return 1;
}

=item _MigrateSalutationsConfiguration($CommonObject)

migrates the configuration of the free fields for each salutation to the
new dynamic field structure.

    _MigrateSalutationsConfiguration($CommonObject);

=cut

sub _MigrateSalutationsConfiguration {
    my $CommonObject = shift;

    # create additional objects
    my $DynamicFieldObject = Kernel::System::DynamicField->new( %{$CommonObject} );

    # create new db connection
    my $DBConnectionObject = Kernel::System::DB->new( %{ $CommonObject->{DBObject} } );

    # get DynamicFields list
    my $DynamicFields = $DynamicFieldObject->DynamicFieldList(
        Valid      => 0,
        ResultType => 'HASH',
    );

    # reverse the DynamicFields list to create a lookup table
    $DynamicFields = { reverse %{$DynamicFields} };

    # localize dynamic fields
    my %LocalDynamicFields = %{$DynamicFields};

    # use only dynamic fields migrated from Ticket Free Fields
    FIELDNAME:
    for my $FieldName ( keys %LocalDynamicFields ) {
        next FIELDNAME if $FieldName =~ m{\A TicketFree ( ?: Text|Key|Time ) \d+ \Z}xms;
        delete $LocalDynamicFields{$FieldName};
    }

    # find all salutations that has defined free fields tags
    return if !$DBConnectionObject->Prepare(
        SQL => "SELECT s.id, s.name, s.text
            FROM salutation s
            WHERE s.text like '%OTRS_TICKET_TicketFree%'
            ORDER BY s.id",
    );

    my @SalutationRecordsToChange;

    # loop trought all results
    while ( my @Row = $DBConnectionObject->FetchrowArray() ) {

        # get salutation details
        my %SalutationRecordConfig = (
            SalutationID      => $Row[0],
            SalutationName    => $Row[1],
            SalutationText    => $Row[2],
            SalutationTextNew => $Row[2]
        );

        for my $FieldName ( keys %LocalDynamicFields ) {

            # replace all ocurrences of this $FieldName
            $SalutationRecordConfig{SalutationTextNew}
                =~ s{OTRS_TICKET_$FieldName}{OTRS_TICKET_DynamicField_$FieldName}gsx;
        }

        # save redord details to update DB later
        push @SalutationRecordsToChange, \%SalutationRecordConfig;
    }

    for my $SalutationRecordConfig (@SalutationRecordsToChange) {

        # update database
        my $SuccessSalutationUpdate = $DBConnectionObject->Do(
            SQL => "UPDATE salutation s
                SET s.text = ?
                WHERE s.id = ?
                    AND s.name = ?",
            Bind => [
                \$SalutationRecordConfig->{SalutationTextNew},
                \$SalutationRecordConfig->{SalutationID},
                \$SalutationRecordConfig->{SalutationName},
            ],
        );

        # check for errors
        if ( !$SuccessSalutationUpdate ) {
            print "Could not migrate the Salutation $SalutationRecordConfig->{SalutationName}\n";
            return 0;
        }
    }
    return 1;
}

=item _MigrateSignaturesConfiguration($CommonObject)

migrates the configuration of the free fields for each signature to the
new dynamic field structure.

    _MigrateSignaturesConfiguration($CommonObject);

=cut

sub _MigrateSignaturesConfiguration {
    my $CommonObject = shift;

    # create additional objects
    my $DynamicFieldObject = Kernel::System::DynamicField->new( %{$CommonObject} );

    # create new db connection
    my $DBConnectionObject = Kernel::System::DB->new( %{ $CommonObject->{DBObject} } );

    # get DynamicFields list
    my $DynamicFields = $DynamicFieldObject->DynamicFieldList(
        Valid      => 0,
        ResultType => 'HASH',
    );

    # reverse the DynamicFields list to create a lookup table
    $DynamicFields = { reverse %{$DynamicFields} };

    # localize dynamic fields
    my %LocalDynamicFields = %{$DynamicFields};

    # use only dynamic fields migrated from Ticket Free Fields
    FIELDNAME:
    for my $FieldName ( keys %LocalDynamicFields ) {
        next FIELDNAME if $FieldName =~ m{\A TicketFree ( ?: Text|Key|Time ) \d+ \Z}xms;
        delete $LocalDynamicFields{$FieldName};
    }

    # find all signatures that has defined free fields tags
    return if !$DBConnectionObject->Prepare(
        SQL => "SELECT s.id, s.name, s.text
            FROM signature s
            WHERE s.text like '%OTRS_TICKET_TicketFree%'
            ORDER BY s.id",
    );

    my @SignatureRecordsToChange;

    # loop trought all results
    while ( my @Row = $DBConnectionObject->FetchrowArray() ) {

        # get signature details
        my %SignatureRecordConfig = (
            SignatureID      => $Row[0],
            SignatureName    => $Row[1],
            SignatureText    => $Row[2],
            SignatureTextNew => $Row[2]
        );

        for my $FieldName ( keys %LocalDynamicFields ) {

            # replace all ocurrences of this $FieldName
            $SignatureRecordConfig{SignatureTextNew}
                =~ s{OTRS_TICKET_$FieldName}{OTRS_TICKET_DynamicField_$FieldName}gsx;
        }

        # save redord details to update DB later
        push @SignatureRecordsToChange, \%SignatureRecordConfig;
    }

    for my $SignatureRecordConfig (@SignatureRecordsToChange) {

        # update database
        my $SuccessSignatureUpdate = $DBConnectionObject->Do(
            SQL => "UPDATE signature s
                SET s.text = ?
                WHERE s.id = ?
                    AND s.name = ?",
            Bind => [
                \$SignatureRecordConfig->{SignatureTextNew},
                \$SignatureRecordConfig->{SignatureID},
                \$SignatureRecordConfig->{SignatureName},
            ],
        );

        # check for errors
        if ( !$SuccessSignatureUpdate ) {
            print "Could not migrate the Signature $SignatureRecordConfig->{SignatureName}\n";
            return 0;
        }
    }
    return 1;
}

1;
