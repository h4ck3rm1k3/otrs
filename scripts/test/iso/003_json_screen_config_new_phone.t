package Kernel::System::Web::Request; # -*- perl -*-
use strict;
use warnings;
sub SetParam {
    my ( $Self, %Param ) = @_;
    my $Value = $Param{Value};
    $Self->{Query}->param( $Param{Param}, $Value );
    return $Value;
}

package Core; # -*- perl -*-
use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.16 $) [1];

# use ../../ as lib location
use FindBin qw($Bin);
use lib "$Bin/../..";
use lib "$Bin/../../Kernel/cpan-lib";

use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::DB;
use Kernel::System::Main;
use Kernel::System::Time;
use Kernel::System::Auth;
use Kernel::System::User;
use Kernel::System::Group;
use Kernel::System::Queue;
use Kernel::System::Service;
use Kernel::System::Type;
use Kernel::System::State;
use Kernel::System::Lock;
use Kernel::System::SLA;
use Kernel::System::CustomerUser;
use Kernel::System::Ticket;
use Kernel::System::LinkObject;
use Kernel::System::JSON;
use Kernel::System::iPhone;

use Kernel::System::Web::Request;



sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Dispatch {
    my ($Self) = @_;


    # get log filename
    $Self->{DebugLogFile} = $Self->{ConfigObject}->Get('iPhone::LogFile') || '';

    # set common variables
    my $User   = $Self->{ParamObject}->GetParam( Param => 'User' );
    my $Pw     = $Self->{ParamObject}->GetParam( Param => 'Password' );
    my $Object = $Self->{ParamObject}->GetParam( Param => 'Object' );
    my $Method = $Self->{ParamObject}->GetParam( Param => 'Method' );
    my $Data   = $Self->{ParamObject}->GetParam( Param => 'Data' );
    my $ParamScalar = $Self->{JSONObject}->Decode( Data => $Data );

    my %Param;
    if ($ParamScalar) {
        %Param = %{$ParamScalar};
    }
    $User ||= '';
    $Pw   ||= '';

    # inbound log
    if ( $Self->{ConfigObject}->Get('iPhone::DebugLog') ) {
        my $Message = 'User=' . $User . '&Password=****' . '&Object=' . $Object
            . '&Method=' . $Method . '&Data=' . $Data;

        $Self->Log(
            Direction => 'Inbound',
            Message   => $Message,
        );
    }

    # agent auth
    my %ParamFixed;
    if (1) {
        my $AuthObject = Kernel::System::Auth->new( %{$Self} );
        my $UserLogin = $AuthObject->Auth( User => $User, Pw => $Pw );

        if ( !$UserLogin ) {
            $Self->{LogObject}->Log(
                Priority => 'notice',
                Message  => "Auth for user $User failed!",
            );
            return $Self->Result();
        }

        # set user id
        my $UserID = $Self->{UserObject}->UserLookup(
            UserLogin => $UserLogin,
        );
        return if !$UserID;

        $ParamFixed{UserID} = $UserID;
    }

    # system auth
    else {
        my $RequiredUser     = $Self->{ConfigObject}->Get('SOAP::User');
        my $RequiredPassword = $Self->{ConfigObject}->Get('SOAP::Password');

        if (
            !defined $RequiredUser
            || !length $RequiredUser
            || !defined $RequiredPassword || !length $RequiredPassword
            )
        {
            $Self->{LogObject}->Log(
                Priority => 'notice',
                Message  => 'SOAP::User or SOAP::Password is empty, SOAP access denied!',
            );
            return $Self->Result();
        }

        if ( $User ne $RequiredUser || $Pw ne $RequiredPassword ) {
            $Self->{LogObject}->Log(
                Priority => 'notice',
                Message  => "Auth for user $User failed!",
            );
            return $Self->Result();
        }
    }

    if ( !$Self->{$Object} && $Object ne 'CustomObject' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No such Object $Object!",
        );
        return $Self->Result();
    }

    if ( ( $Self->{$Object} && !$Self->{$Object}->can($Method) ) && !$Self->can($Method) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No such method '$Method' in '$Object'!",
        );
        return $Self->Result();
    }

    # object white list
    my $ObjectWhiteList = $Self->{ConfigObject}->Get('iPhone::API::Object');
    if ($ObjectWhiteList) {
        if ( !defined $ObjectWhiteList->{$Object} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No access to '$Object'!",
            );
            return $Self->Result();
        }
        if ( $ObjectWhiteList->{$Object} && $Method !~ /$ObjectWhiteList->{$Object}/ ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No access method '$Method' of '$Object'!",
            );
            return $Self->Result();
        }
    }

    # ticket permission check

    if ( $Object eq 'CustomObject' ) {
        my @Result = $Self->{iPhoneObject}->$Method(
            %Param,
            %ParamFixed,
        );
        return $Self->Result( \@Result );
    }
    else {
        my @Result = $Self->{$Object}->$Method(
            %Param,
            %ParamFixed,
        );
        return $Self->Result( \@Result );
    }
}

sub Result {
    my ( $Self, $Result ) = @_;

    my %ResultProtocol;

    if ($Result) {
        if ( @{$Result} ) {
            if ( @{$Result}[0] eq -1 ) {
                $ResultProtocol{Result} = 'failed';
                for my $Key (qw(error notice)) {
                    $ResultProtocol{Message} = $Self->{LogObject}->GetLogEntry(
                        Type => $Key,
                        What => 'Message',
                    );
                    last if $ResultProtocol{Message};
                }
            }

            else {
                $ResultProtocol{Result} = 'successful';
                $ResultProtocol{Data}   = $Result;
            }
        }

        else {
            $ResultProtocol{Result} = 'successful';
            $ResultProtocol{Data}   = $Result;
        }
    }

    else {
        $ResultProtocol{Result} = 'failed';
        for my $Key (qw(error notice)) {
            $ResultProtocol{Message} = $Self->{LogObject}->GetLogEntry(
                Type => $Key,
                What => 'Message',
            );
            last if $ResultProtocol{Message};
        }
    }

    # set result to a variable for easy log output
    my $JSONResult = $Self->{JSONObject}->Encode( Data => \%ResultProtocol );

    # outbound log
    if ( $Self->{ConfigObject}->Get('iPhone::DebugLog') ) {

        $Self->Log(
            Direction => 'Outbound',
            Message   => $JSONResult,
            )
    }

    return $JSONResult;
}

sub Log {
    my ( $Self, %Param ) = @_;

    my $FH;

    # open logfile
    if ( !open $FH, '>>', $Self->{DebugLogFile} ) {

        # print error screen
        print STDERR "\n";
        print STDERR " >> Can't write $Self->{LogFile}: $! <<\n";
        print STDERR "\n";
        return;
    }

    # write log file
    print $FH '[' . $Self->{TimeObject}->CurrentTimestamp() . ']';
    print $FH "[Debug] [$Param{Direction}] [$Param{Message}\n";

    # close file handle
    close $FH;
    return 1;
}

sub CreateTestUsers
{
# create needed users
    my $Self=shift;
    my $ConfigObject = $Self->{ConfigObject} ;
    my $UserObject = $Self->{UserObject} ;
    
    # disable email checks to create new user
    my $CheckEmailAddressesOrg = $ConfigObject->Get('CheckEmailAddresses') || 1;
    $ConfigObject->Set(
	Key   => 'CheckEmailAddresses',
	Value => 0,
	);
    
    # create new users for the tests
    my $UserID = $UserObject->UserAdd(
	UserFirstname => 'IPhone',
	UserLastname  => 'UnitTest',
	UserLogin     => 'cr',
	UserEmail     => 'cr@otrs.com',
	UserPw     => '123',
	ValidID       => 1,
	ChangeUserID  => 1,
	);
    
    
    # restore original email check param
    $ConfigObject->Set(
        Key   => 'CheckEmailAddresses',
        Value => $CheckEmailAddressesOrg,
	);
}

sub test{
    my $Self = Core->new();

    # common objects
    $Self->{ConfigObject} = Kernel::Config->new();
    $Self->{EncodeObject} = Kernel::System::Encode->new( %{$Self} );
    $Self->{LogObject}    = Kernel::System::Log->new(
        LogPrefix => 'OTRS-RPC',
        %{$Self},
    );
    $Self->{MainObject}         = Kernel::System::Main->new( %{$Self} );
    $Self->{DBObject}           = Kernel::System::DB->new( %{$Self} );
    $Self->{TimeObject}         = Kernel::System::Time->new( %{$Self} );
    $Self->{UserObject}         = Kernel::System::User->new( %{$Self} );
    $Self->{GroupObject}        = Kernel::System::Group->new( %{$Self} );
    $Self->{QueueObject}        = Kernel::System::Queue->new( %{$Self} );
    $Self->{ServiceObject}      = Kernel::System::Service->new( %{$Self} );
    $Self->{TypeObject}         = Kernel::System::Type->new( %{$Self} );
    $Self->{StateObject}        = Kernel::System::State->new( %{$Self} );
    $Self->{LockObject}         = Kernel::System::Lock->new( %{$Self} );
    $Self->{SLAObject}          = Kernel::System::SLA->new( %{$Self} );
    $Self->{CustomerUserObject} = Kernel::System::CustomerUser->new( %{$Self} );
    $Self->{TicketObject}       = Kernel::System::Ticket->new( %{$Self} );
    $Self->{LinkObject}         = Kernel::System::LinkObject->new( %{$Self} );
    $Self->{JSONObject}         = Kernel::System::JSON->new( %{$Self} );
    $Self->{ParamObject}        = Kernel::System::Web::Request->new( %{$Self} );
    $Self->{iPhoneObject}       = Kernel::System::iPhone->new( %{$Self} );
 
    my $User   = $Self->{ParamObject}->SetParam( Param => 'User', Value=>"cr" );
    my $Pw     = $Self->{ParamObject}->SetParam( Param => 'Password', Value =>"123" );
    my $Object = $Self->{ParamObject}->SetParam( Param => 'Object' , Value => "CustomObject");
    my $Method = $Self->{ParamObject}->SetParam( Param => 'Method'  , Value => "ScreenConfig");
    my $Data   = $Self->{ParamObject}->SetParam( Param => 'Data', Value => q[{"Screen":"Phone", "Language":"en"}]);

#    $Self->CreateTestUsers;
    
    my $json = $Self->Dispatch();
#http://localhost/otrs30/json.pl?User=cr&Password=123&Object=CustomObject&Method=ScreenConfig&Data=

    my $output_mike_test_31 = '{"Result":"successful","Data":[{"Actions":{"Parameters":{"Action":"Phone"},"Method":"ScreenActions","Object":"CustomObject"},"Elements":[{"Default":"","Datatype":"Text","DynamicOptions":{"Parameters":[{"Search":"CustomerUserLogin"}],"Method":"CustomerSearch","Object":"CustomObject"},"Title":"From customer","AutoFillElements":[{"Parameters":[{"CustomerUserID":"CustomerUserLogin"}],"ElementName":"CustomerID","Method":"CustomerIDGet","Object":"CustomObject"}],"Viewtype":"AutoCompletion","Mandatory":1,"Name":"CustomerUserLogin"},{"Options":{"":"-"},"Default":"","Datatype":"Text","Viewtype":"Picker","Mandatory":1,"Name":"QueueID","Title":"To queue"},{"Default":"","Datatype":"Text","DynamicOptions":{"Parameters":[{"QueueID":"QueueID","AllUsers":1}],"Method":"UsersGet","Object":"CustomObject"},"Viewtype":"Picker","Mandatory":0,"Name":"OwnerID","Title":"Owner"},{"Default":"","Datatype":"Text","Title":"Subject","Max":250,"Viewtype":"Input","Min":1,"Mandatory":1,"Name":"Subject"},{"Default":"","Datatype":"Text","Title":"Text","Max":20000,"Viewtype":"TextArea","Min":1,"Mandatory":1,"Name":"Body"},{"Default":"","Datatype":"Text","Title":"CustomerID","Max":150,"Viewtype":"Input","Min":1,"Mandatory":0,"Name":"CustomerID"},{"Default":4,"Datatype":"Text","DynamicOptions":{"Parameters":[{"QueueID":"QueueID"}],"Method":"NextStatesGet","Object":"CustomObject"},"Title":"Next Ticket State","DefaultOption":"open","Viewtype":"Picker","Mandatory":1,"Name":"StateID"},{"Default":"","Datatype":"DateTime","Viewtype":"Picker","Mandatory":0,"Name":"PendingDate","Title":"Pending Date (for pending* states)"},{"Default":3,"Datatype":"Text","DynamicOptions":{"Parameters":"","Method":"PrioritiesGet","Object":"CustomObject"},"Title":"Priority","DefaultOption":"3 normal","Viewtype":"Picker","Mandatory":1,"Name":"PriorityID"},{"Default":"","Datatype":"Numeric","Title":"Time units  (work units)","Max":10,"Viewtype":"Input","Min":1,"Mandatory":0,"Name":"TimeUnits"}],"Title":"New Phone Ticket"}]}';


#Response:
#OTRS answers the fields configured (Fixed and FreeFields) it includes all the fields parameters so the iPhone can render them

    my $output_cr_30 ='{"Result":"successful","Data":[{"Elements":[{"AutoFillElements":[{"ElementName":"CustomerID","Parameters":[{"CustomerUserID":"CustomerUserLogin"}],"Method":"CustomerIDGet","Object":"CustomObject"}],"Datatype":"Text","Default":"","Viewtype":"AutoCompletion","DynamicOptions":{"Parameters":[{"Search":"CustomerUserLogin"}],"Method":"CustomerSearch","Object":"CustomObject"},"Mandatory":1,"Name":"CustomerUserLogin","Title":"From customer"},{"Options":{"":"-","1":"Postmaster","4":"Misc","3":"Junk","2":"Raw","5":"Test"},"Datatype":"Text","Default":"","Viewtype":"Picker","Mandatory":1,"Name":"QueueID","Title":"To queue"},{"Datatype":"Text","Default":"","Viewtype":"Picker","DynamicOptions":{"Parameters":[{"CustomerUserID":"CustomerUserLogin","QueueID":"QueueID","TicketID":"TicketID"}],"Method":"ServicesGet","Object":"CustomObject"},"Mandatory":0,"Name":"ServiceID","Title":"Service"},{"Datatype":"Text","Default":"","Viewtype":"Picker","DynamicOptions":{"Parameters":[{"CustomerUserID":"CustomerUserLogin","QueueID":"QueueID","ServiceID":"ServiceID","TicketID":"TicketID"}],"Method":"SLAsGet","Object":"CustomObject"},"Mandatory":0,"Name":"SLAID","Title":"SLA"},{"Datatype":"Text","Default":"","Viewtype":"Picker","DynamicOptions":{"Parameters":[{"QueueID":"QueueID","AllUsers":1}],"Method":"UsersGet","Object":"CustomObject"},"Mandatory":0,"Name":"OwnerID","Title":"Owner"},{"Max":250,"Datatype":"Text","Default":"","Viewtype":"Input","Mandatory":1,"Min":1,"Name":"Subject","Title":"Subject"},{"Max":20000,"Datatype":"Text","Default":"","Viewtype":"TextArea","Mandatory":1,"Min":1,"Name":"Body","Title":"Text"},{"Max":150,"Datatype":"Text","Default":"","Viewtype":"Input","Mandatory":0,"Min":1,"Name":"CustomerID","Title":"CustomerID"},{"DefaultOption":"open","Datatype":"Text","Default":"4","Viewtype":"Picker","DynamicOptions":{"Parameters":[{"QueueID":"QueueID"}],"Method":"NextStatesGet","Object":"CustomObject"},"Mandatory":1,"Name":"StateID","Title":"Next Ticket State"},{"Datatype":"DateTime","Default":"","Viewtype":"Picker","Mandatory":0,"Name":"PendingDate","Title":"Pending Date (for pending* states)"},{"DefaultOption":"3 normal","Datatype":"Text","Default":"3","Viewtype":"Picker","DynamicOptions":{"Parameters":"","Method":"PrioritiesGet","Object":"CustomObject"},"Mandatory":1,"Name":"PriorityID","Title":"Priority"},{"Max":10,"Datatype":"Numeric","Default":"","Viewtype":"Input","Mandatory":0,"Min":1,"Name":"TimeUnits","Title":"Time units  (work units)"}],"Actions":{"Parameters":{"Action":"Phone"},"Method":"ScreenActions","Object":"CustomObject"},"Title":"New Phone Ticket"}]}';

my $result_30_local = '{"Result":"successful","Data":[{"Actions":{"Parameters":{"Action":"Phone"},"Method":"ScreenActions","Object":"CustomObject"},"Elements":[{"Default":"","Datatype":"Text","DynamicOptions":{"Parameters":[{"Search":"CustomerUserLogin"}],"Method":"CustomerSearch","Object":"CustomObject"},"Title":"From customer","AutoFillElements":[{"Parameters":[{"CustomerUserID":"CustomerUserLogin"}],"ElementName":"CustomerID","Method":"CustomerIDGet","Object":"CustomObject"}],"Viewtype":"AutoCompletion","Mandatory":1,"Name":"CustomerUserLogin"},{"Options":{"":"-"},"Default":"","Datatype":"Text","Viewtype":"Picker","Mandatory":1,"Name":"QueueID","Title":"To queue"},{"Default":"","Datatype":"Text","DynamicOptions":{"Parameters":[{"QueueID":"QueueID","AllUsers":1}],"Method":"UsersGet","Object":"CustomObject"},"Viewtype":"Picker","Mandatory":0,"Name":"OwnerID","Title":"Owner"},{"Default":"","Datatype":"Text","Title":"Subject","Max":250,"Viewtype":"Input","Min":1,"Mandatory":1,"Name":"Subject"},{"Default":"","Datatype":"Text","Title":"Text","Max":20000,"Viewtype":"TextArea","Min":1,"Mandatory":1,"Name":"Body"},{"Default":"","Datatype":"Text","Title":"CustomerID","Max":150,"Viewtype":"Input","Min":1,"Mandatory":0,"Name":"CustomerID"},{"Default":"4","Datatype":"Text","DynamicOptions":{"Parameters":[{"QueueID":"QueueID"}],"Method":"NextStatesGet","Object":"CustomObject"},"Title":"Next Ticket State","DefaultOption":"open","Viewtype":"Picker","Mandatory":1,"Name":"StateID"},{"Default":"","Datatype":"DateTime","Viewtype":"Picker","Mandatory":0,"Name":"PendingDate","Title":"Pending Date (for pending* states)"},{"Default":"3","Datatype":"Text","DynamicOptions":{"Parameters":"","Method":"PrioritiesGet","Object":"CustomObject"},"Title":"Priority","DefaultOption":"3 normal","Viewtype":"Picker","Mandatory":1,"Name":"PriorityID"},{"Options":{"Phone":"Phone","":"-","Notebook":"Notebook","PC":"PC"},"Default":"","Datatype":"Text","FreeTextKey":{"Product":"Product"},"Title":"Product","Viewtype":"Picker","Mandatory":0,"Name":"TicketFreeText1"},{"Default":"","Datatype":"Numeric","Title":"Time units  (work units)","Max":10,"Viewtype":"Input","Min":1,"Mandatory":0,"Name":"TimeUnits"}],"Title":"New Phone Ticket"}]}';

use JSON::PP;
my $jsonpp = JSON::PP->new();
$jsonpp = $jsonpp->canonical(1);
$jsonpp = $jsonpp->pretty(1);

if($json ne $output_cr_30)
    {	    
#	warn "BAD : $json\n is not $compare";
#	print 
	my	$data = $jsonpp->decode( $json ); # pretty-printing
	my	$pretty_printed = $jsonpp->pretty->encode( $data ); # pretty-printing
#	print $pretty_printed;
	open OUT, ">003_json_screen_config_new_phone_last_output.json" or die;
	print OUT $pretty_printed;
	close OUT;


	my	$data2 = $jsonpp->decode( $output_cr_30 ); # pretty-printing
	open OUT, ">003_json_screen_config_new_phone_standard_output.json" or die;
	print OUT  $jsonpp->pretty->encode( $data2 ); # pretty-printing;
	close OUT;

	system ( "diff -u 003_json_screen_config_new_phone_last_output.json 003_json_screen_config_new_phone_standard_output.json > 003_json_screen_config_new_phone_json.diff");

    }
}


test;

