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

use YAML;

my $ConfigObject = Kernel::Config->new();
#warn "Config Object :" . Dump ($ConfigObject);

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
    Debug =>3
    );

my $TicketObject = Kernel::System::Ticket->new( %{$Self} ,
						Debug =>3
    );

#my $PostMasterNewTicket = Kernel::System::PostMaster::NewTicket->new(    %{$Self},);
#my @Return = $PostMasterNewTicket->Run();
#warn "Kernel::System::PostMaster::NewTicket::Run returned:". Dump(\@Return);
#warn "Ticket:" . Dump(\%Ticket);

my $sm = Kernel::System::PostMaster::Filter::SystemMonitoring->new(%{$Self}, 
								   TicketObject => $TicketObject,
								   TimeObject   => $TimeObject,
								   Debug        => 3
);

my $Content= q[Return-Path: <nagios@example.com>
To: otrs@example.com
Subject: ** PROBLEM alert 1 - delphin1234 host is DOWN **
Message-Id: <20070317231546.0DFD55DC00F@h53795.example.com>
Date: Sun, 18 Mar 2007 00:15:46 +0100 (CET)
From: nagios@example.com
Mime-Version: 1.0
***** Nagios  *****

Notification Type: PROBLEM
Host: delphin1234
State: DOWN for 0d 0h 0m 0s
Address: 127.1.1.1
Info:

CRITICAL - Time to live exceeded (127.1.1.1)

Date/Time: Sun Mar 18 00:18:30 CET 2007

ACK by: 
Comment:
 	    ];

my @Content = split /\n/, $Content;
for my $Line (@Content) {    $Line .= "\n";}
my $EmailC = \@Content;

my $PostMasterObject = Kernel::System::PostMaster->new(
    %{$Self},
    ConfigObject => $ConfigObject,
    Email        => $EmailC,
    Debug        => 3
    );


my @Return = $PostMasterObject->Run();


my %Ticket       = $TicketObject->TicketGet(
    TicketID => $Return[1],
);

warn "Return:" . Dump(\%Ticket);

1;
