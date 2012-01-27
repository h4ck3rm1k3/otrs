# --
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
use YAML;
use Kernel::System::Ticket;
use Kernel::System::PostMaster;


# create the self object

#require "/home/mdupont/experiments/sfk11/otrs/head/otrs-moose/test/TestBase.t"; #test frame
use Kernel::System::User;
use Kernel::System::DB;
use Kernel::System::Log;
use Kernel::System::Encode;
use Kernel::System::Main;
use Kernel::Config;
use Kernel::System::UnitTest;
use YAML;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::DB;
use Kernel::System::Time;
use Kernel::System::UnitTest;

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
    );

my $BackendObject = Kernel::System::DynamicField::Backend->new( %{$Self} );

$ConfigObject->{"DynamicFields::Backend"} = $BackendObject;

#Config.pm<2>

#warn Dump($Self);

my $Config= $Self->{ConfigObject};

die "No config object" unless $Config;
my $home  = $Config->Get('Home');
my $FileArray = $Self->{MainObject}->FileRead(
    Location => $home . '/scripts/test/sample/SystemMonitoring1.box',
    Result => 'ARRAY',    # optional - SCALAR|ARRAY
);

my $PostMasterObject = Kernel::System::PostMaster->new(
    %{$Self},
    Email => $FileArray,
);

my @Return = $PostMasterObject->Run();
$Self->Is(
    $Return[0] || 0,
    1,
    "Run() - NewTicket",
);
$Self->True(
    $Return[1] || 0,
    "Run() - NewTicket/TicketID",
);

my $TicketObject = Kernel::System::Ticket->new( %{$Self} );
my %Ticket       = $TicketObject->TicketGet(
    TicketID => $Return[1],
);

#warn "Ticket:" . Dump(\%Ticket);

$Self->Is(
    $Ticket{"SystemMonitoring-Host"},
    'delphin',
    "Host check",
);

$Self->Is(
    $Ticket{"SystemMonitoring-Service"},
    'Host',
    "Service check",
);
$Self->Is(
    $Ticket{State},
    'new',
    "Run() - Ticket State",
);

$FileArray = $Self->{MainObject}->FileRead(
    Location => $Self->{ConfigObject}->Get('Home') . '/scripts/test/sample/SystemMonitoring2.box',
    Result => 'ARRAY',    # optional - SCALAR|ARRAY
);

#    Email => $FileArray,

## 
use Kernel::System::PostMaster::Filter::SystemMonitoring;



$Self->{Debug} =1;

my $TicketObject2 = Kernel::System::Ticket->new( %{$Self} );


my $sm = Kernel::System::PostMaster::Filter::SystemMonitoring->new(%{$Self}, TicketObject => $TicketObject2,
   TimeObject =>   $TimeObject						     
);
#warn "System Monitoring:" . Dump($sm);

my %MailParam = (
   JobConfig => {
   	     FromAddressRegExp => "nagios\@example.com"
   },	     
   GetParam => {
   	    From=> "nagios\@example.com", # FromAddressRegExp
	    Subject => "Subject: ** PROBLEM alert 1 - delphin host is DOWN **",
	    Body    => q[
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
 		]
    }
);
my $ret = $sm->Run(%MailParam);
warn "Run returned:" . Dump($ret);


$TicketObject = Kernel::System::Ticket->new( %{$Self} );
%Ticket       = $TicketObject->TicketGet(
    TicketID => $Return[1],
);
$Self->Is(
    $Ticket{State},
    'closed successful',
    "Run() - Ticket State",
);

# delete ticket
my $Delete = $TicketObject->TicketDelete(
    TicketID => $Return[1],
    UserID   => 1,
);
$Self->True(
    $Delete || 0,
    "TicketDelete()",
);

1;
