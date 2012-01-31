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

my $ConfigObject = Kernel::Config->new();
my $pfm = $ConfigObject->Get('PostMaster::PreFilterModule');

my $SystemMonitoringConf = {
    'FreeTextState' => '1',
    'HostRegExp' => '\\s*Host:\\s+(.*)\\s*',
    'FreeTextHost' => '1',
    'Module' => 'Kernel::System::PostMaster::Filter::SystemMonitoring',
    'CloseTicketRegExp' => 'OK|UP',
    'ClosePendingTime' => '172800',
    'FromAddressRegExp' => 'nagios@example.com',
    'DefaultService' => 'Host',
    'CloseActionState' => 'closed successful',
    'ServiceRegExp' => '\\s*Service:\\s+(.*)\\s*',
    'SenderType' => 'system',
    'ArticleType' => 'note-report',
    'StateRegExp' => '\\s*State:\\s+(\\S+)',
    'NewTicketRegExp' => 'CRITICAL|DOWN',
    'FreeTextService' => '2'
};

my $EncodeObject = Kernel::System::Encode->new(
    ConfigObject => $ConfigObject,
    );

my $LogObject = Kernel::System::Log->new(
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
    LogObject    => $LogObject,
    );

my $DBObject = Kernel::System::DB->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    );

my $Self = Kernel::System::UnitTest->new(
    EncodeObject => $EncodeObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    DBObject     => $DBObject,
    TimeObject   => $TimeObject,
    Debug =>10
    );

my $TicketObject = Kernel::System::Ticket->new( %{$Self} ,

    Debug => 10,
    );

my $Content= q[Return-Path: <michael.dupont@otrs.com>
To: otrs@example.com
Subject:  "** CRITICAL Service Alert: HOSTALIAS4/SERVICEDESC2 is CRITICAL **"
Date: Sun, 18 Mar 2017 00:15:46 +0100 (CET)
From: nagios@example.com
Mime-Version: 1.0

***** Icinga *****

Notification Type: CRITICAL

Service: HTTP2
Host: Router2
Address: 192.168.1.1
State: CRITICAL

Date/Time: Sun, 18 Mar 2017 00:15:46 +0100 (CET)

Additional Info:

this is a test outtage
 ];


my $PostMasterObject = Kernel::System::PostMaster->new(
    %{$Self},
    
    ConfigObject => $ConfigObject,
    Email        => \$Content,
    Debug => 10,
    );

my @Return = $PostMasterObject->Run();

my %Ticket       = $TicketObject->TicketGet(
    TicketID => $Return[1],
    Debug => 10,
);


1;
