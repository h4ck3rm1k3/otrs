use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::Time;
use Kernel::System::DB;
use Kernel::System::XML;
warn "Begin";
use var::packagesetup::SystemMonitoring;

#Nagios::Acknowledge::FreeField::Host: TicketFreeText1
#Nagios::Acknowledge::FreeField::Service: TicketFreeText2

# PostMaster::PreFilterModule:
#   1-SystemMonitoring:
#     ArticleType: note-report
#     CloseActionState: closed successful
#     ClosePendingTime: 172800
#     CloseTicketRegExp: OK|UP
#     DefaultService: Host
#     FreeTextHost: 1
#     FreeTextService: 2
#     FreeTextState: 1
#     FromAddressRegExp: nagios@example.com
#     HostRegExp: \s*Host:\s+(.*)\s*
#     Module: Kernel::System::PostMaster::Filter::SystemMonitoring
#     NewTicketRegExp: CRITICAL|DOWN
#     SenderType: system
#     ServiceRegExp: \s*Service:\s+(.*)\s*
#     StateRegExp: \s*State:\s+(\S+)


my $ConfigObject = Kernel::Config->new(); # TODO : created inside the object and outside
my $EncodeObject = Kernel::System::Encode->new(
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
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $XMLObject = Kernel::System::XML->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        MainObject   => $MainObject,
    );

warn "New Object";
    my $CodeObject = var::packagesetup::SystemMonitoring->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
        TimeObject   => $TimeObject,
        DBObject     => $DBObject,
        XMLObject    => $XMLObject,
    );

warn "CodeInstall";
my $Result = $CodeObject->CodeInstall();

warn "CodeUpgrade";
my $Result2 =  $CodeObject->CodeUpgradeFromLowerThan_2_3_1 ();
