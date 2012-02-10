package basetest;
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

sub NewPhone {

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
	LanguageObject=> $lang,
	);
    RunConfig($phone);
    
    return $phone;
}

sub NewParam
{
    my $name =shift;

    warn "getting params for $name";

    my %Param= (
	UserID=> 1,
	TicketID =>1,
	QueueID => 1,
	ResponseID => 1,
	Screen => "Phone",
	Subject => "Subject",
	TimeStamp => "2001-01-01 10:10:01",
	TicketFreeText1 => "freetext1",
	ArticleID=>251,
	StateID =>1
	);
    
    for my $f (1 .. 16)
    {
	$Param{"TicketFreeText$f"}= "SomeText$f";
	$Param{"TicketFreeKey$f"}= "SomeTextKey$f";
    }
    
    for my $f (1 .. 3)
    {
	$Param{"ArticleFreeText$f"}= "SomeAText$f";
	$Param{"ArticleFreeKet$f"}= "SomeATextKey$f";
	
    }
    
    for my $f (1 .. 6)
    {
	$Param{"TicketFreeTime$f"}  = "2011-01-01 12:0${f}:00";
    }
    
    return %Param;
}

sub RunConfig
{
    my $Self=shift;

    $Self->{ConfigObject}->{ArticleTypes}  = {  
	
	'note-external' => '1',
	'note-internal' => '1',
	'note-report'    => '1',
	'email-external' => 1,
	'email-internal' => 1
    };


    $Self->{'ConfigObject'}->{'TicketFreeText'} =  {
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

    $Self->{'ConfigObject'}->{'TicketFreeText'} =  {
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

    $Self->{'ConfigObject'}->{'ArticleFreeText'} =  {
	'1' => '1',
	'2' => '1',
	'3' => '1'
    };

    $Self->{'ConfigObject'}->{'TicketFreeTime'} =  {
	'1' => '1',
	'2' => '1',
	'3' => '1',
	'4' => '1',
	'5' => '1',
	'6' => '1'
    };

#$phone->{ConfigObject}->{Debug}=999;
#$Self->{Debug}=999;

    $Self->{ConfigObject}->Set(Key => 'CheckEmailAddresses', Value => 0);
    $Self->{ConfigObject}->Set(Key => 'ArticleFreeKey1::DefaultSelection', Value=>"Test");
    $Self->{ConfigObject}->Set(Key => 'ArticleFreeText1',Value=>"Blah");
    $Self->{ConfigObject}->Set(Key => 'ArticleFreeKey1',Value=>["a","b"]);
    $Self->{ConfigObject}->Set(Key => 'ArticleTypeDefault',Value=>"note-internal");

    my $stdconf={
	'ArticleTypeDefault' => 'note-internal',
	ArticleTypes =>{
	    'note-internal' =>1,
            'note-external' =>1,
            'note-report'   =>1
	},
	'SenderType' => 'customer',
	'HistoryType' => 'AddNote',
	'HistoryComment' => 'This is a test',
	Permission=>"note",
	RequiredLock=>1,
	Note=>1,
	Title=>1,
	TicketType=>1,
	TimeUnits=>1,
	Service=>1,
	Owner => 1,
	Responsible =>1,
	Priority=>1,
	PriorityDefault=>"3 normal",
	State =>1,
	Body=> "default body",
	Subject => "Close"	   	    
    };

    $Self->{ConfigObject}->Set(Key=>'iPhone::Frontend::AgentTicketPhone', Value=>$stdconf);
    $Self->{ConfigObject}->Set(Key=>'iPhone::Frontend::AgentTicketNote', Value=>$stdconf);
    $Self->{ConfigObject}->Set(Key=>'iPhone::Frontend::AgentTicketClose', Value=>$stdconf);
    $Self->{ConfigObject}->Set(Key=>'iPhone::Frontend::AgentTicketCompose', Value=>$stdconf);
    $Self->{ConfigObject}->Set(Key=>'iPhone::Frontend::AgentTicketMove', Value=>$stdconf);

}

sub CreateParams
{

}

sub CreateCustomerUserObject
{
    my $phone=shift;
    my $param=shift;

    my %UserList = $phone->{CustomerUserObject}->CustomerSearch(
	PostMasterSearch => "md\@otrs.com",
	);
    
    my $UserID;
    my $UserRand = "testuser123";
    if (%UserList)
    {
	warn Dump(\%UserList);
	my @ids = keys %UserList;
	$UserID = shift @ids;
    } elsif(!%UserList) {
	
	my $Key = "test";
	$UserID = $phone->{CustomerUserObject}->CustomerUserAdd(
	    Source         => 'CustomerUser',
	    UserFirstname  => 'Firstname Test' . $Key,
	    UserLastname   => 'Lastname Test' . $Key,
	    UserCustomerID => $UserRand . '-Customer-Id',
	    UserLogin      => $UserRand,
	    UserEmail      => "md\@otrs.com",
	    UserPassword   => 'some_pass',
	    ValidID        => 1,
	    UserID         => 1,
	    );
    }
    
    warn "UserID $UserID";
    
#$param{CustomerID}=$UserID;
    $param->{CustomerUserLogin}=$UserRand . '-Email@example.com';
    $param->{StateID}=1;
    $param->{PriorityID}=1;
    
}

sub CreateTestArticle
{
    my $phone=shift;
    my $param=shift;

    $phone->{Config} = $phone->{ConfigObject}->Get('iPhone::Frontend::AgentTicketCompose')|| die;
    
# create a new ticket
    my $TicketID = $phone->{TicketObject}->TicketCreate(
	Title        => 'My ticket created by Agent A',
	Queue        => 'Raw',
	Lock         => 'unlock',
	Priority     => '3 normal',
	State        => 'open',
	CustomerNo   => '123465',
	CustomerUser => 'customer@example.com',
	OwnerID      => 1,
	UserID       => 1,
	From           => 'Some Agent <agentl@otrs.com>',
	);
    
# create an article for
    my $ArticleID = $phone->{TicketObject}->ArticleCreate(
	TicketID       => $TicketID,
	ArticleType    => 'note-internal',
	SenderType     => 'agent',
	From           => 'Some Agent <agentl@otrs.com>',
	To             => 'Some Customer <customer@otrs.com>',
	Subject        => 'some short description',
	Body           => 'the message text',
	ContentType    => 'text/plain; charset=ISO-8859-15',
	HistoryType    => 'OwnerUpdate',
	HistoryComment => 'Some free text!',
	UserID         => 1,
	NoAgentNotify  => 1,
	);
    $param->{ArticleID}=$ArticleID;
    $param->{TicketID}=$TicketID;
    
}
1;
