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

#require "/home/mdupont/experiments/sfk11/otrs/head/otrs-moose/test/TestBase.t"; #test frame
use Kernel::System::User;
use Kernel::System::DB;
use Kernel::System::Log;
use Kernel::System::Encode;
use Kernel::System::Main;
use Kernel::Config;
use Kernel::System::UnitTest;
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
    );




       
my $home  = $ConfigObject->Get('Home');
my $FileArray = $Self->{MainObject}->FileRead(
    Location => $home . '/scripts/test/sample/SystemMonitoring1.box',
    Result => 'ARRAY',    # optional - SCALAR|ARRAY
);


my $BackendObject = Kernel::System::DynamicField::Backend->new( %{$Self} );
$ConfigObject->{"DynamicFields::Backend"} = $BackendObject;
$Self->{"DynamicFieldBackendObject"} = $BackendObject;
my $PostMasterObject = Kernel::System::PostMaster->new(
    %{$Self},
    Email => $FileArray,
    DynamicFieldBackendObject => $BackendObject
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

$Self->Is(
    $Ticket{TicketFreeText1},
    'delphin',
    "Host check",
);

$Self->Is(
    $Ticket{TicketFreeText2},
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

$PostMasterObject = Kernel::System::PostMaster->new(
    %{$Self},
    Email => $FileArray,
);

@Return = $PostMasterObject->Run();
$Self->Is(
    $Return[0] || 0,
    2,
    "Run() - NewTicket",
);

if ($Return[1])
{
	die "No TicketID in return " . Dump(\@Return);
}

if (!$Ticket{TicketID})	
{
	die "No Ticket ID in Ticket Object" . Dump(\%Ticket);
}

$Self->True(
    $Return[1] == $Ticket{TicketID},
    "Run() - NewTicket/TicketID",
);

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
