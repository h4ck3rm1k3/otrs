use lib "test_config";

use vars qw($VERSION);
$VERSION = qw($Revision: 1.29 $) [1];

use Kernel::System::EventHandler;
use Kernel::System::Main;
use Kernel::System::GenericInterface::Webservice;
use Kernel::System::GenericInterface::DebugLog;
use Kernel::Output::HTML::NotificationSchedulerCheck;
use Kernel::System::Group;
use Kernel::System::PID;
use Kernel::System::GenericInterface::Webservice;
use Kernel::System::VariableCheck qw(:all);

#use Kernel::System::GenericInterface::Webservice;
use Kernel::System::Ticket;
use strict;
#Handler.pm: Attempt to reload Kernel/System/GenericInterface/Webservice.pm aborted.
#/usr/share/otrs/Kernel/GenericInterface/Event/Handler.pm line 20.
#BEGIN failed--compilation aborted at /usr/share/otrs/Kernel/GenericInterface/Event/Handler.pm line 20.
# /usr/share/otrs//Kernel/System/Main.pm line 132
#Kernel::System::Main::Require('Kernel::System::Main=HASH(0x2446c8f0)', 'Kernel::GenericInterface::Event::Handler') called at /usr/share/otrs//Kernel/System/EventHandler.pm line 212
#Kernel::System::EventHandler::EventHandler('Kernel::System::Ticket=HASH(0x249fa578)', 'Event', 'TicketFlagSet', 'UserID', 2, 'Data', 'HASH(0x24c5d6c8)', 'Transaction', 1, ...) called at /usr/share/otrs//Kernel/System/EventHandler.pm line 274
# 	Kernel::System::EventHandler::EventHandlerTransaction('Kernel::System::Ticket=HASH(0x249fa578)') called at /usr/share/otrs//Kernel/System/Ticket.pm line 6853
#	Kernel::System::Ticket::DESTROY('Kernel::System::Ticket=HASH(0x249fa578)') 

my $ConfigObject = Kernel::Config->new();


$ConfigObject->Set( Key   =>'DynamicFields::Backend',
		    Value => { 
			test => 
			{
			    Module => "Funky",
			    somesub => sub { warn "foo"; },
			}
		    }
		    );

$ConfigObject->Set( Key   =>'ArticleDir',    Value => "/tmp");

# it is a file
$ConfigObject->Set( Key   =>'Ticket::CounterLog',    Value => "/tmp/counterlog.txt");


my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
use Kernel::System::Log;
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $TimeObject = Kernel::System::Time->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
use Kernel::System::DB;
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );


my %Self;
my $WebserviceObject = Kernel::System::GenericInterface::Webservice->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
       DBObject=>$DBObject,
       TimeObject=>$TimeObject,
);

$ConfigObject->Set(
    Key   => 'Ticket::EventModulePost###1000-GenericInterface',
    Value => {
        Module      => 'Kernel::GenericInterface::Event::Handler',
        Event       => '.*',
        Transaction => 1,
    },
);

$ConfigObject->Set(
    Key   =>'Ticket::ViewableStateType',
    Value => {}
);
$ConfigObject->Set(
    Key   =>'Ticket::UnlockStateType',
    Value => {}
);

$ConfigObject->Set(
    Key   =>'Ticket::ViewableLocks',
    Value => {}
);

$ConfigObject->Set(
    Key   => 'CustomerPreferences',
    Value => {
    },
);


my $ticket= Kernel::System::Ticket->new(
   ConfigObject => $ConfigObject,
   LogObject=>$LogObject,,
   TimeObject=>$TimeObject,
   DBObject=>$DBObject,
   MainObject=>$MainObject,
   EncodeObject=>$EncodeObject,
   );



my        $TicketID = $ticket->TicketCreate(
            Title        => 'Some Ticket Title',
            Queue        => 'Raw',
            Lock         => 'unlock',
            Priority     => '3 normal',
            State        => 'closed successful',
            CustomerNo   => '123465',
            CustomerUser => 'customer@example.com',
            OwnerID      => 1,
            UserID       => 1,
        );


#EventHandlerPipe
$ticket->EventHandlerInit(
    
    # name of configured event modules
    Config     => 'Example::EventModule',
    
    # current object, $Self, used in events as "ExampleObject"
    BaseObject => 'ExampleObject',
    
    # served default objects in any event backend
    Objects    => {
	UserObject => "UserObject",
	XZY        => "XYZ",
    },
    );


Kernel::System::EventHandler::EventHandlerTransaction($ticket);

1;

package Kernel::System::Ticket;
sub EventHandlerTransaction
{
    warn "todo";
}

1;
