use Core;

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
    $Self->{LanguageObject} =  Kernel::Language->new(%{$Self}); 
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

