use lib "test_config";
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



Kernel::System::Main::Require($MainObject, 'Kernel::Output::HTML::NotificationSchedulerCheck');
Kernel::System::Main::Require($MainObject, 'Kernel::Output::HTML::NotificationSchedulerCheck');
Kernel::System::Main::Require($MainObject, 'Kernel::Output::HTML::NotificationSchedulerCheck');
