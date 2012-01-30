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
#warn "Config Object :" . Dump ($ConfigObject);

my $pfm = $ConfigObject->Get('PostMaster::PreFilterModule');
#warn Dumper($pfm);
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

#$ConfigObject->Get('PostMaster::PreFilterModule'})

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
    Debug =>1
    );

my $TicketObject = Kernel::System::Ticket->new( %{$Self} ,
						Debug =>1
    );

#my $PostMasterNewTicket = Kernel::System::PostMaster::NewTicket->new(    %{$Self},);
#my @Return = $PostMasterNewTicket->Run();
#warn "Kernel::System::PostMaster::NewTicket::Run returned:". Dump(\@Return);
#warn "Ticket:" . Dump(\%Ticket);

my $Content= q[Return-Path: <nagios@example.com>
To: otrs@example.com
Subject: ** PROBLEM alert 1 - delphin host is DOWN **
Message-Id: <20070317231546.0DFD55DC00F@h53795.example.com>
Date: Sun, 18 Mar 2007 00:15:46 +0100 (CET)
From: nagios@example.com
Mime-Version: 1.0

***** Nagios  *****

Notification Type: PROBLEM
Host: delphin
State: DOWN for 0d 0h 0m 0s
Address: 127.1.1.1
Info:

CRITICAL - Time to live exceeded (127.1.1.1)

Date/Time: Sun Mar 18 00:18:30 CET 2007

ACK by: 
Comment:
 
];


my $PostMasterObject = Kernel::System::PostMaster->new(
    %{$Self},
    
    ConfigObject => $ConfigObject,
    Email        => \$Content,
    );

#my $GetParam = $PostMasterObject->GetEmailParams();
#die "GetParam " . Dump($GetParam);

my @Return = $PostMasterObject->Run();
#warn "Return:" . Dump(\@Return);

my %Ticket       = $TicketObject->TicketGet(
    TicketID => $Return[1],
);

#warn "Return:" . Dump(\%Ticket);

1;
