# --
# Kernel/Config.pm - Config file for OTRS kernel
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: Config.pm.dist,v 1.23 2010/01/13 22:25:00 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
#  Note:
#
#  -->> OTRS does have a lot of config settings. For more settings
#       (Notifications, Ticket::ViewAccelerator, Ticket::NumberGenerator,
#       LDAP, PostMaster, Session, Preferences, ...) see
#       Kernel/Config/Defaults.pm and copy your wanted lines into "this"
#       config file. This file will not be changed on update!
#
# --

package Kernel::Config;
use strict;
use warnings;

my $myotrsroot= '/home/mdupont/projects/otrs/git/public/otrs';

our $dbuser='otrs';
our $dbpass='5ypUVX4jqK1g';
our $basepath='';
our $dbname='otrs2';
our $dbserver='';
our $dbport='5432';
our $dbtype='pgsql';
our $dsn = "DBI:Pg:dbname";

sub Load {
    my $Self = shift;
    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
    #                                                      #
    #         Start of your own config options!!!          #
    #                                                      #
    # ---------------------------------------------------- #
    # ---------------------------------------------------- #

    # ---------------------------------------------------- #
    # database settings                                    #
    # ---------------------------------------------------- #
    # DatabaseHost
    # (The database host.)
    $Self->{DatabaseHost} = $dbserver || 'localhost';
    # Database
    # (The database name.)
    $Self->{Database} = $dbname || 'otrs';
    # DatabaseUser
    # (The database user.)
    $Self->{DatabaseUser} = $dbuser || 'otrs';
    # DatabasePw
    # (The password of database user. You also can use bin/otrs.CryptPassword.pl
    # for crypted passwords.)
    $Self->{DatabasePw} = $dbpass;
    # DatabaseDSN
    # (The database DSN for MySQL ==> more: "man DBD::mysql")
    $Self->{DatabaseDSN} =  "$dsn=$Self->{Database};host=$Self->{DatabaseHost};port=$dbport;";

    # (The database DSN for PostgreSQL ==> more: "man DBD::Pg")
    # if you want to use a local socket connection
#    $Self->{DatabaseDSN} = "DBI:Pg:dbname=$Self->{Database};";
    # if you want to use a tcpip connection
#    $Self->{DatabaseDSN} = "DBI:Pg:dbname=$Self->{Database};host=$Self->{DatabaseHost};";

    # ---------------------------------------------------- #
    # fs root directory
    # ---------------------------------------------------- #
    $Self->{Home} = $myotrsroot; #'/usr/share/otrs';

    # ---------------------------------------------------- #
    # insert your own config settings "here"               #
    # config settings taken from Kernel/Config/Defaults.pm #
    # ---------------------------------------------------- #
    # $Self->{SessionUseCookie} = 0;
    # $Self->{CheckMXRecord} = 0;

    # ---------------------------------------------------- #
    # switch off the web based installer for the Debian package
    $Self->{SecureMode} = 1;

    # ---------------------------------------------------- #
    # data inserted by installer                           #
    # ---------------------------------------------------- #
    # $DIBI$
    $Self->{PostmasterUserID} = "1";
    

$Self->{'PostmasterX-Header'} =  [
  'From',
  'To',
  'Cc',
  'Reply-To',
  'ReplyTo',
  'Subject',
  'Message-ID',
  'Message-Id',
  'Resent-To',
  'Resent-From',
  'Precedence',
  'Mailing-List',
  'List-Id',
  'List-Archive',
  'Errors-To',
  'References',
  'In-Reply-To',
  'X-Loop',
  'X-Spam-Flag',
  'X-Spam-Status',
  'X-Spam-Level',
  'X-No-Loop',
  'X-Priority',
  'Importance',
  'X-Mailer',
  'User-Agent',
  'Organization',
  'X-Original-To',
  'Delivered-To',
  'Envelope-To',
  'Return-Path',
  'X-OTRS-Loop',
  'X-OTRS-Info',
  'X-OTRS-Priority',
  'X-OTRS-Queue',
  'X-OTRS-Lock',
  'X-OTRS-Ignore',
  'X-OTRS-State',
  'X-OTRS-State-PendingTime',
  'X-OTRS-Type',
  'X-OTRS-Service',
  'X-OTRS-SLA',
  'X-OTRS-CustomerNo',
  'X-OTRS-CustomerUser',
  'X-OTRS-SenderType',
  'X-OTRS-ArticleType',
  'X-OTRS-FollowUp-Priority',
  'X-OTRS-FollowUp-Queue',
  'X-OTRS-FollowUp-Lock',
  'X-OTRS-FollowUp-State',
  'X-OTRS-FollowUp-State-PendingTime',
  'X-OTRS-FollowUp-Type',
  'X-OTRS-FollowUp-Service',
  'X-OTRS-FollowUp-SLA',
  'X-OTRS-FollowUp-SenderType',
  'X-OTRS-FollowUp-ArticleType'
];

$Self->{'CustomerPreferences'} =  {
  'Module' => 'Kernel::System::CustomerUser::Preferences::DB',
  'Params' => {
    'Table' => 'customer_preferences',
    'TableKey' => 'preferences_key',
    'TableUserID' => 'user_id',
    'TableValue' => 'preferences_value'
  }
};

#    $Self->{"Ticket::ViewableStateType"} = ["TicketViewableStateType"];
$Self->{'Ticket::ViewableStateType'} =  [
  'new',
  'open',
  'pending reminder',
  'pending auto'
];

#    $Self->{"Ticket::UnlockStateType"} = "TicketUnlockStateType";
$Self->{'Ticket::UnlockStateType'} =  [
  'new',
  'open'
];

$Self->{'Ticket::ViewableLocks'} =  [
  '\'unlock\'',
  '\'tmp_lock\''
];

    $Self->{"ArticleDir"}=$myotrsroot . "/var/article";

#    $Self->{"Ticket::EventModulePost"} = {TestModule => {
#	test =>1,
#	Module => "TestPostEventModule"					  }};

$Self->{'Ticket::EventModulePost'}->{'98-ArticleSearchIndex'} =  {
  'Event' => '(ArticleCreate|ArticleUpdate)',
  'Module' => 'Kernel::System::Ticket::Event::ArticleSearchIndex'
};


$Self->{'PostMaster::PreFilterModule'}->{'1-SystemMonitoring'} =  {
  'ArticleType' => 'note-report',
  'CloseActionState' => 'closed successful',
  'ClosePendingTime' => '172800',
  'CloseTicketRegExp' => 'OK|UP',
  'DefaultService' => 'Host',
  'FreeTextHost' => '12',
  'FreeTextService' => '9',
  'FreeTextState' => '2',
  'FromAddressRegExp' => 'nagios@example.com',
  'HostRegExp' => '\\s*Host:\\s+(.*)\\s*',
  'Module' => 'Kernel::System::PostMaster::Filter::SystemMonitoring',
  'NewTicketRegExp' => 'CRITICAL|DOWN',
  'SenderType' => 'system',
  'ServiceRegExp' => '\\s*Service:\\s+(.*)\\s*',
  'StateRegExp' => '\\s*State:\\s+(\\S+)'
};

#    use Kernel::System::DynamicField::Backend;
#    $Self->{'DynamicFields::Backend'} = {
#	"FieldType" => {
#	    "Module" => "TestFieldTypeModule"
#	}
#    };


$Self->{'iPhone::Frontend::AgentTicketMove'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketMove'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketMove'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketMove'}->{'TimeUnits'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketMove'}->{'StateDefault'} =  'open';
$Self->{'iPhone::Frontend::AgentTicketMove'}->{'StateType'} =  [
  'open',
  'closed'
];
$Self->{'iPhone::Frontend::AgentTicketMove'}->{'State'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketMove'}->{'Owner'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketMove'}->{'RequiredLock'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketMove'}->{'Permission'} =  'compose';
$Self->{'iPhone::Frontend::AgentTicketCompose'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketCompose'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketCompose'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketCompose'}->{'TimeUnits'} =  '1';
$Self->{'iPhone::Frontend::ComposeExcludeCcRecipients'} =  '0';
$Self->{'iPhone::Frontend::ComposeReplaceSenderAddress'} =  '0';
$Self->{'iPhone::Frontend::ComposeAddCustomerAddress'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketCompose'}->{'StateType'} =  [
  'open',
  'closed',
  'pending auto',
  'pending reminder'
];
$Self->{'iPhone::Frontend::AgentTicketCompose'}->{'StateDefault'} =  'open';
$Self->{'iPhone::Frontend::AgentTicketCompose'}->{'State'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketCompose'}->{'RequiredLock'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketCompose'}->{'Permission'} =  'compose';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'HistoryComment'} =  '%%Close';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'HistoryType'} =  'AddNote';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'TimeUnits'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'Title'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'ArticleTypes'} =  {
  'note-external' => '0',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'Body'} =  '';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'Subject'} =  'Close';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'Note'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'StateDefault'} =  'closed successful';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'StateType'} =  [
  'closed'
];
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'State'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'Responsible'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'Owner'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'Service'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'TicketType'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'RequiredLock'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketClose'}->{'Permission'} =  'close';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'HistoryComment'} =  '%%Note';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'HistoryType'} =  'AddNote';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'TimeUnits'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'Title'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'ArticleTypes'} =  {
  'note-external' => '1',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'Body'} =  '';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'Subject'} =  'Note';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'Note'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'State'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'Responsible'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'Owner'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'Service'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'TicketType'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'RequiredLock'} =  '0';
$Self->{'iPhone::Frontend::AgentTicketNote'}->{'Permission'} =  'note';



$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'HistoryComment'} =  '';
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'HistoryType'} =  'PhoneCallCustomer';
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'TimeUnits'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'SenderType'} =  'customer';
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'ArticleTypeDefault'} =  'phone';
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'PriorityDefault'} =  '3 normal';
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'StateDefault'} =  'open';
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'State'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'CustomerID'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'Responsible'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'Owner'} =  '1';
$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'Service'} =  '1';

$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'TicketType'} =  '1';

$Self->{'iPhone::Frontend::AgentTicketPhone'}->{'Permission'} =  'compose';

$Self->{'iPhone::LogFile'} =  '/tmp/iPhone.log';
$Self->{'iPhone::DebugLog'} =  '0';


    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
    #                                                      #
    #           End of your own config options!!!          #
    #                                                      #
    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
}


# ---------------------------------------------------- #
# needed system stuff (don't edit this)                #
# ---------------------------------------------------- #
use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.23 $)[1];

use Kernel::Config::Defaults;
push (@ISA, 'Kernel::Config::Defaults');

# -----------------------------------------------------#

1;
