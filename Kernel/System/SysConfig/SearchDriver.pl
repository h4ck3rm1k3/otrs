package test;
use lib "/home/mdupont/projects/otrs/test_system";
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::Main;
 use Kernel::System::Time;
 use Kernel::System::DB;
 use Kernel::System::SysConfig;
 use Kernel::Language;
 use Kernel::System::SysConfig::Search;
use Kernel::Config;
my $ConfigObject = Kernel::Config->new();
my $EncodeObject  = Kernel::System::Encode->new(
     ConfigObject => $ConfigObject,
     );
my $LogObject    = Kernel::System::Log->new(
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
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    );
my $DBObject = Kernel::System::DB->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    );
my $LanguageObject = Kernel::Language->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    );
my $SysConfigObject = Kernel::System::SysConfig->new(
    ConfigObject   => $ConfigObject,
    EncodeObject   => $EncodeObject,
    LogObject      => $LogObject,
    DBObject       => $DBObject,
    MainObject     => $MainObject,
    TimeObject     => $TimeObject,
    LanguageObject => $LanugageObject,
    );
#$SysConfigObject->
my @List = $SysConfigObject->ConfigItemSearch(
    Search => 'some topic',
    );
warn join "\n",@List;
1;
