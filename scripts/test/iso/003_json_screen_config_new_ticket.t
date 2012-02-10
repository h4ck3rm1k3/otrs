use Core; # tests -*-perl-*-
use strict;
use warnings;
sub test{
    my $Self = Core->new(    iPhoneObject       => $phone);
    my $User   = $Self->{ParamObject}->SetParam( Param => 'User', Value=>"cr" );
    my $Pw     = $Self->{ParamObject}->SetParam( Param => 'Password', Value =>"123" );
    my $Object = $Self->{ParamObject}->SetParam( Param => 'Object' , Value => "CustomObject");
    my $Method = $Self->{ParamObject}->SetParam( Param => 'Method'  , Value => "ScreenActions");
    my $jsonpp = JSON::PP->new();
    $jsonpp = $jsonpp->canonical(1);
    $jsonpp = $jsonpp->pretty(1);

    my $jsonin = '{"Action":"Phone","StateID":"4","CustomerID":"otrs","PriorityID":"3","SLAID":"1","CustomerUserLogin":"fer","TimeUnits":"","Subject":"Test%20for%20Mike","ServiceID":"1","Body":"Body","OwnerID":"3","QueueID":"3","PendingDate":"",';
    $jsonin .=	basetest::NewParamJson();
    $jsonin .=	'}';  
    my $x="";
    my	$data = $jsonpp->decode( $jsonin ); # pretty-printing
    my	$pretty_printed = $jsonpp->pretty->encode( $data ); # pretty-printing    

    my $Data   = $Self->{ParamObject}->SetParam( Param => 'Data', Value => $pretty_printed);

    my $json = $Self->Dispatch();
    my $output_cr_30 ='{"Result":"successful","Data":["199"]}';
    
    if($json ne $output_cr_30)
    {	    
	my	$data = $jsonpp->decode( $json ); # pretty-printing
	my	$pretty_printed = $jsonpp->pretty->encode( $data ); # pretty-printing
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

