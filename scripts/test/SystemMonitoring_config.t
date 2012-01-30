# -- -*- perl -*- 
# SystemMonitoring.t - SystemMonitoring tests
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: SystemMonitoring.t,v 1.2 2010/02/15 18:16:06 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
use strict;
use warnings;
use Kernel::System::Ticket;
use Kernel::System::PostMaster;
use Kernel::Config;

use Kernel::System::DB;
use Kernel::System::DynamicField;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::Time;
use Kernel::System::UnitTest;
use Kernel::System::User;
use Kernel::System::PostMaster::NewTicket;
use Kernel::System::PostMaster::Filter::SystemMonitoring;
use Data::Dumper;
use YAML;
use Kernel::System::XML;

my $ConfigObject = Kernel::Config->new();
#warn "Config Object :" . Dump ($ConfigObject);

use Kernel::System::SysConfig;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::Main;
    use Kernel::System::Time;
    use Kernel::System::DB;
    use Kernel::System::SysConfig;
    use Kernel::Language;


my $EncodeObject  = Kernel::System::Encode->new(
    ConfigObject => $ConfigObject,
    );
my $LogObject    = Kernel::System::Log->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    );
my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    );
my $TimeObject = Kernel::System::Time->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    );
my $DBObject = Kernel::System::DB->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    );

my $LanguageObject = Kernel::Language->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    );
my $SysConfigObject = Kernel::System::SysConfig->new(
        ConfigObject   => $ConfigObject,
        EncodeObject   => $EncodeObject,
        LogObject      => $LogObject,
        DBObject       => $DBObject,
        MainObject     => $MainObject,
        TimeObject     => $TimeObject,
        LanguageObject => $LanguageObject,
    );


my $XMLObject = Kernel::System::XML->new(    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
        DBObject       => $DBObject,
);
my @XMLHash = $XMLObject->XMLParse2XMLHash( String => q[
    <ConfigItem Name="PostMaster::PreFilterModule###00-SystemMonitoring" Required="0" Valid="0">
        <Description Translatable="1">Basic mail interface to System Monitoring Suites. Use this block if the filter should run BEFORE PostMasterFilter.</Description>
        <Group>SystemMonitoring</Group>
        <SubGroup>Core::PostMaster</SubGroup>
        <Setting>
            <Hash>
                <Item Key="Module">Kernel::System::PostMaster::Filter::SystemMonitoring</Item>
                <Item Key="FromAddressRegExp">nagios@example.com</Item>
                <Item Key="StateRegExp">\s*State:\s+(\S+)</Item>
                <Item Key="HostRegExp">\s*Host:\s+(.*)\s*</Item>
                <Item Key="ServiceRegExp">\s*Service:\s+(.*)\s*</Item>
                <Item Key="NewTicketRegExp">CRITICAL|DOWN</Item>
                <Item Key="CloseTicketRegExp">OK|UP</Item>
                <Item Key="CloseActionState">closed successful</Item>
                <Item Key="ClosePendingTime">172800</Item>
                <Item Key="DefaultService">Host</Item>
                <Item Key="FreeTextHost">1</Item>
                <Item Key="FreeTextService">2</Item>
                <Item Key="SenderType">system</Item>
                <Item Key="ArticleType">note-report</Item>
                <Item Key="FreeTextState">1</Item>
            </Hash>
        </Setting>
    </ConfigItem>


] );
warn Dumper( \@XMLHash);

$SysConfigObject->ConfigItemUpdate(
    Valid => 1,
    Key   => 'PostMaster::PreFilterModule###00-SystemMonitoring',
    Value => \@XMLHash
    );
#

1;
