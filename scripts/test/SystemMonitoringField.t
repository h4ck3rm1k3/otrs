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

my $DynamicFieldObject = Kernel::System::DynamicField->new( %{$Self} );

#####
my $DynamicFieldHostID = $DynamicFieldObject->DynamicFieldAdd(
    Name       => "DynamicFieldSystemMonitoringHost",
    Label      => 'SystemMonitoring-Host',
    FieldOrder => 9991,
    FieldType  => 'Text',
    ObjectType => 'Ticket',
    Config     => {
        DefaultValue  => "None",
    },
    ValidID => 1,
    UserID  => 1,
);

# sanity check
$Self->True(
	$DynamicFieldHostID,
    "DynamicFieldAdd() - create testing dynamic field",
);

my $DynamicFieldData = $DynamicFieldObject->DynamicFieldGet(
    ID => $DynamicFieldHostID,
);

# sanity check
warn "Check the DynamicFieldData:". Dump($DynamicFieldData);
#$Self->True(
#		#    $Self->IsHashRefWithData($DynamicFieldData),
#    "DynamicFieldGet() - for testing dynamic field",
#);


###
{
    my $Success = $DynamicFieldObject->DynamicFieldDelete(
        ID     => $DynamicFieldHostID,
        UserID => 1,
    );

    # sanity check
    $Self->True(
        $Success,
        "DynamicFieldDelete() for DynamicField $DynamicFieldData->{Name}"
    );
}
