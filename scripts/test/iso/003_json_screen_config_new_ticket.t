use Core; # tests
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
    my $Method = $Self->{ParamObject}->SetParam( Param => 'Method'  , Value => "ScreenActions");

    my $jsonpp = JSON::PP->new();
    $jsonpp = $jsonpp->canonical(1);
    $jsonpp = $jsonpp->pretty(1);

    my $jsonin = q[{"Action":"Phone","StateID":"4","CustomerID":"otrs","PriorityID":"3","SLAID":"1","CustomerUserLogin":"fer","TimeUnits":"","Subject":"Test%20for%20Mike","ServiceID":"1","Body":"Body","OwnerID":"3","QueueID":"3","PendingDate":""}];

    my	$data = $jsonpp->decode( $jsonin ); # pretty-printing
    my	$pretty_printed = $jsonpp->pretty->encode( $data ); # pretty-printing
    
    my $Data   = $Self->{ParamObject}->SetParam( Param => 'Data', Value => $pretty_printed);

    my $json = $Self->Dispatch();
    #http://localhost:82/otrs/json.pl?

#Response:
    my $output_cr_30 ='{"Result":"successful","Data":["199"]}';
        

    
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

