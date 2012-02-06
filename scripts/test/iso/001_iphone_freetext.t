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
use Data::Dumper;
use YAML;
use Kernel::System::LinkObject;
use Kernel::System::iPhone;
my $ConfigObject = Kernel::Config->new();
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

die unless $DBObject;

my $Self = Kernel::System::UnitTest->new(
    EncodeObject => $EncodeObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    DBObject     => $DBObject,
    TimeObject   => $TimeObject,
    Debug =>10
    );

my $TicketObject = Kernel::System::Ticket->new(
    EncodeObject => $EncodeObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    DBObject     => $DBObject,
    TimeObject   => $TimeObject,   
    Debug => 10,
    );

my $user = Kernel::System::User->new(
    DBObject     => $DBObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    TimeObject   => $TimeObject,
    MainObject   => $MainObject,  
    EncodeObject => $EncodeObject, 
   );

my $group = Kernel::System::Group->new(
    DBObject     => $DBObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    TimeObject   => $TimeObject,
    MainObject   => $MainObject,  
    EncodeObject => $EncodeObject, 
   );


my %Self=(
   
    DBObject     => $DBObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    TimeObject   => $TimeObject,
    MainObject   => $MainObject,  
    EncodeObject => $EncodeObject, 
    %{$TicketObject}
   );

my  $queue   =  Kernel::System::Queue->new(    %Self   );
my  $service  = Kernel::System::Service->new(        %Self);
my  $type  =  Kernel::System::Type->new(%Self);
my  $state =  Kernel::System::State->new(%Self);
my  $lock  = Kernel::System::Lock->new(%Self);
my  $sla   =  Kernel::System::SLA->new(%Self);
my  $customeruser   =  Kernel::System::CustomerUser->new(%Self);
my  $ticket   = Kernel::System::Ticket->new(%Self);
my  $link   =  Kernel::System::LinkObject->new(%Self);

use Kernel::Language;

my  $lang   =  Kernel::Language->new(%Self);

my $phone = Kernel::System::iPhone->new(
    %Self,
    UserObject => $user,
    GroupObject => $group,
    QueueObject => $queue,
    ServiceObject => $service,
    TypeObject => $type,
    #StateObject => $state,
    LockObject => $lock,
    SLAObject => $sla,
    CustomerUserObject => $customeruser,
    TicketObject => $TicketObject,
    LinkObject => $link,
    EncodeObject => $EncodeObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    DBObject     => $DBObject,
    TimeObject   => $TimeObject,
    Debug =>10

);

$phone->{LanguageObject}= $lang;

$phone->{Config}->{ArticleTypes}  = {  
    
    'note-external' => '1',
    'note-internal' => '1',
    'note-report'    => '1',
    'email-external' => 1,
    'email-internal' => 1
};
 

# $phone-> _GetNoteTypes();
# $phone->ScreenConfig();
# $phone->Badges();
# $phone->EscalationView();
# $phone->StatusView();
# $phone->LockedView();
# $phone->WatchedView();
# $phone->ResponsibleView();
# $phone->QueueView();
# $phone->TicketList(TicketID => 199);
# $phone->TicketGet();
# $phone->ArticleGet();
# $phone->ServicesGet();
# $phone->SLAsGet();
# $phone->UsersGet();
# $phone->NextStatesGet();
# $phone->PrioritiesGet();
# $phone->CustomerSearch();
# $phone->ScreenActions();
# $phone->VersionGet();
# $phone->CustomerIDGet();
# $phone->ArticleIndex();
# $phone->InitConfigGet();
# $phone->_GetTypes();
# $phone-> _GetTos();

$phone-> _GetScreenElements(    Screen=> "Phone"  );
$phone-> _GetScreenElements(    Screen=> "Move"   );
$phone-> _GetScreenElements(    Screen=> "Compose", TicketID => 199);

 $phone-> _TicketPhoneNew();
 $phone-> _TicketCommonActions();
# $phone-> _TicketCompose();
# $phone-> _TicketMove();
$phone-> _GetComposeDefaults(
    TicketID => 199
    );
# $phone-> _TransfromDateSelection();
