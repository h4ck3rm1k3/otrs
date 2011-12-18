package Kernel::System::Ticket;

sub EventHandlerTransaction
{

}


package Main;
use YAML;
use Test::More tests => 1;
use_ok ("Kernel::System::PostMaster::FollowUp");
use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::DB;
use Kernel::System::Group;
use Kernel::System::CustomerUser;
use Kernel::System::Ticket;
use Kernel::System::EventHandler;
use Kernel::System::EmailParser;


# use local Config object because it will be modified
my $ConfigObject    = Kernel::Config->new();


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

my $dbuser='otrs';
my $dbpass='6EgaoMxp7Ygs';
my $basepath='';
my $dbname='otrs2';

my $DBObject        = Kernel::System::DB->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    # if you don't supply the following parameters, the ones found in
    # Kernel/Config.pm are used instead:
    DatabaseDSN  => 'DBI:Pg:database=' . $dbname . ';host=localhost;',
    DatabaseUser => $dbuser,
    DatabasePw   => $dbpass,
    Type         => 'postgresql',
    Attribute => {
            LongTruncOk => 1,
            LongReadLen => 100*1024,
    },
    AutoConnectNo => 0, # 0|1 disable auto-connect to database in constructor
    );

my $TimeObject = Kernel::System::Time->new(
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    );


my $UserObject      = Kernel::System::User->new(     
    ConfigObject => $ConfigObject   ,
    LogObject=>$LogObject,
    TimeObject=>$TimeObject,
    MainObject   => $MainObject,
    EncodeObject => $EncodeObject,
    DBObject  => $DBObject
    );

my $GroupObject     = Kernel::System::Group->new(        
    ConfigObject => $ConfigObject,    UserObject   => $UserObject,
    DBObject  => $DBObject,
    MainObject   => $MainObject,
    LogObject=>$LogObject,
    EncodeObject => $EncodeObject,
    );

$ConfigObject->Set(
    Key   => 'CustomerPreferences',
    Value => {
    },
);

$ConfigObject->Set(
    Key   => 'DynamicFields::Backend',
    Value => {
	from => {
	    Module => "Kernel::Test"
	}
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
$ConfigObject->Set( Key   =>'ArticleDir',    Value => "/tmp");

my $CustomerUserObject = Kernel::System::CustomerUser->new(   ConfigObject => $ConfigObject,   
    DBObject  => $DBObject,
    MainObject   => $MainObject,
    LogObject=>$LogObject,
    EncodeObject => $EncodeObject,
    );

my $ticket= Kernel::System::Ticket->new(
   ConfigObject => $ConfigObject,
   LogObject=>$LogObject,,
   TimeObject=>$TimeObject,
   DBObject=>$DBObject,
   MainObject=>$MainObject,
   EncodeObject=>$EncodeObject,
   );

my $parser = Kernel::System::EmailParser->new(
        ConfigObject => $ConfigObject   ,
        LogObject=>$LogObject,
        EncodeObject => $EncodeObject,
    Email => "TO: mdupont",
    );

my $obj = Kernel::System::PostMaster::FollowUp->new(
   Debug =>1,
    DBObject  => $DBObject,
    ConfigObject => $ConfigObject   ,
    LogObject=>$LogObject,
    TimeObject=>$TimeObject,
    MainObject   => $MainObject,
    EncodeObject => $EncodeObject,
    TicketObject => $ticket,
    ParserObject => $parser,

##
   );

my $ret = $obj->Run(
    TicketID         => 1,
    InmailUserID     => 1,
    TimeObject=>$TimeObject,
    GetParam         => {
	TicketID => 1,
	UserID   => 1,
	ArticleType => "email-external", #1
	'X-OTRS-FollowUp-ArticleType' => 'email-external',
	'X-OTRS-FollowUp-SenderType' => "agent",
	'X-OTRS-FollowUp-State-PendingTime' => "+6h",

#'X-OTRS-FollowUp-State'
#'X-OTRS-FollowUp-Priority'
#'X-OTRS-FollowUp-Queue'
#'X-OTRS-FollowUp-Lock'
#'X-OTRS-FollowUp-Type'
#'X-OTRS-FollowUp-Service'
#'X-OTRS-FollowUp-SLA'
#'X-OTRS-FollowUp-TicketKey1'
#'X-OTRS-FollowUp-TicketValue1'
	TimeObject=>$TimeObject,
	From => "",
	ReplyTo => "",
        To => "",
        Cc => "",
        Subject => "",
	'Message-ID' => "",
        'In-Reply-To' => "",
        'References' => "",
	'Content-Type' => "charset=utf8",
	Body =>"",
	Debug => 1
    },
    Tn               => 1,
    AutoResponseType => 1,
    Debug => 1
);

ok ($ret==1);

eval {
my $ret = $obj->Run(
    TicketID         => 1,
    InmailUserID     => 1,
    TimeObject=>$TimeObject,
    GetParam         => {
	TicketID => 1,
	UserID   => 1,
	ArticleType => "email-external", #1
	'X-OTRS-FollowUp-ArticleType' => 'email-external',
	'X-OTRS-FollowUp-SenderType' => "agent",
	'X-OTRS-FollowUp-State-PendingTime' => "+6 errors",
#'X-OTRS-FollowUp-State'
#'X-OTRS-FollowUp-Priority'
#'X-OTRS-FollowUp-Queue'
#'X-OTRS-FollowUp-Lock'
#'X-OTRS-FollowUp-Type'
#'X-OTRS-FollowUp-Service'
#'X-OTRS-FollowUp-SLA'
#'X-OTRS-FollowUp-TicketKey1'
#'X-OTRS-FollowUp-TicketValue1'
	TimeObject=>$TimeObject,
	From => "",
	ReplyTo => "",
        To => "",
        Cc => "",
        Subject => "",
	'Message-ID' => "",
        'In-Reply-To' => "",
        'References' => "",
	'Content-Type' => "charset=utf8",
	Body =>"",
	Debug => 1
    },
    Tn               => 1,
    AutoResponseType => 1,
    Debug => 1
);
};
ok ($@ =~ /Date Parsing Failed/);
