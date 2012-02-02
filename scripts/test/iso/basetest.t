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
my $ConfigObject = Kernel::Config->new(
#    Debug => 999,
    );
my $EncodeObject = Kernel::System::Encode->new(
    ConfigObject => $ConfigObject,
 #   Debug => 999,
    );

my $LogObject = Kernel::System::Log->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
 #   Debug => 999,
    );

my $MainObject = Kernel::System::Main->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
#    Debug => 999,
    );
    
my $TimeObject = Kernel::System::Time->new(
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
#    Debug => 999,
    );

my $DBObject = Kernel::System::DB->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
 #   Debug => 999,
    );

die unless $DBObject;

my $Self = Kernel::System::UnitTest->new(
    EncodeObject => $EncodeObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    DBObject     => $DBObject,
    TimeObject   => $TimeObject,
  #  Debug =>10
    );

my $TicketObject = Kernel::System::Ticket->new(
    EncodeObject => $EncodeObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    DBObject     => $DBObject,
    TimeObject   => $TimeObject,   
#    Debug => 10,
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
#    Debug =>10

);

$phone->{LanguageObject}= $lang;

# my $stdhash = {
#     ArticleFreeText =>  {  '1' => '1',  '2' => '1',  '3' => '1'},
#     TicketFreeTime => {  '1' => '1',  '2' => '1',  '3' => '1',  '4' => '1',  '5' => '1',  '6' => '1' },
#     TicketFreeText =>  {  '1' => '1',  '10' => '1',  '11' => '1',  '12' => '1',  '13' => '1',  '14' => '1',  '15' => '1',  '16' => '1',  '2' => '1',  '3' => '1',  '4' => '1',  '5' => '1',  '6' => '1',  '7' => '1',  '8' => '1',  '9' => '1'},
#     TimeUnits =>  '1',
#     StateDefault =>  'open',
#     StateType =>  [  'open',  'closed' ,  'pending auto',  'pending reminder'],
#     State => '1',
#     Owner =>  '1',
#     Title =>  '1',
#     ArticleTypes =>  {
# 	'note-external' => '1',
# 	'note-internal' => '1',
# 	'note-report' => '0'
#     },
# 	    ArticleTypeDefault =>  'note-internal',
# 	    Body =>  '',
# 	    Subject => 'Close',
# 	    Note =>'1',
# 	    StateDefault => 'closed successful',
# 	    RequiredLock => '1',
# 	    HistoryComment =>  '%%Close',
# 	    HistoryType => 'AddNote',
# 	    Permission =>  'compose',
# 	    Responsible =>  '0',
# 	    ArticleFreeText =>  {  '1' => '1',  '2' => '1',  '3' => '0'},
# 	    TicketFreeTime =>  {  '1' => '1',  '2' => '1',  '3' => '1',  '4' => '1',  '5' => '1',  '6' => '1'}
# };

# $phone->{ConfigObject}->Set(Key=>'iPhone::Frontend::AgentTicketMove',	    Value => $stdhash);
# $phone->{ConfigObject}->Set(Key=>'iPhone::Frontend::AgentTicketCompose',	    Value => $stdhash);
# $phone->{ConfigObject}->Set(Key=>'iPhone::Frontend::AgentTicketClose',	    Value => $stdhash);
# $phone->{ConfigObject}->Set(Key=>'iPhone::Frontend::AgentTicketNote',	    Value => $stdhash);
# $phone->{ConfigObject}->Set(Key=>'iPhone::Frontend::AgentTicketPhone',	    Value => $stdhash);
# $phone->{ConfigObject}->Set(Key=>'iPhone::LogFile',	    Value => '/tmp/iPhone.log');
# $phone->{ConfigObject}->Set(Key=>'iPhone::DebugLog',	    Value => '9');


$phone->{ConfigObject}->{ArticleTypes}  = {  
    
    'note-external' => '1',
    'note-internal' => '1',
    'note-report'    => '1',
    'email-external' => 1,
    'email-internal' => 1
};


$phone->{'ConfigObject'}->{'TicketFreeText'} =  {
  '1' => '1',
  '10' => '1',
  '11' => '1',
  '12' => '1',
  '13' => '1',
  '14' => '1',
  '15' => '1',
  '16' => '1',
  '2' => '1',
  '3' => '1',
  '4' => '1',
  '5' => '1',
  '6' => '1',
  '7' => '1',
  '8' => '1', 
  '9' => '0'
};

$phone->{'ConfigObject'}->{'TicketFreeText'} =  {
  '1' => '1',
  '10' => '1',
  '11' => '1',
  '12' => '1',
  '13' => '1',
  '14' => '1',
  '15' => '1',
  '16' => '1',
  '2' => '1',
  '3' => '1',
  '4' => '1',
  '5' => '1',
  '6' => '1',
  '7' => '1',
  '8' => '1',
  '9' => '1'
};

$phone->{'ConfigObject'}->{'ArticleFreeText'} =  {
  '1' => '1',
  '2' => '1',
  '3' => '1'
};

$phone->{'ConfigObject'}->{'TicketFreeTime'} =  {
  '1' => '1',
  '2' => '1',
  '3' => '1',
  '4' => '1',
  '5' => '1',
  '6' => '1'
};

#$phone->{ConfigObject}->{Debug}=999;
#$phone->{Debug}=999;

$phone->{ConfigObject}->Set(Key => 'ArticleFreeKey1::DefaultSelection', Value=>"Test");
$phone->{ConfigObject}->Set(Key => 'ArticleFreeText1',Value=>"Blah");
$phone->{ConfigObject}->Set(Key => 'ArticleFreeKey1',Value=>["a","b"]);



$phone;
