
use basetest;
my $phone = basetest::NewPhone();
#my %param = basetest::NewParam("_CheckRequiredFreeTextField");
use Data::Dumper;
#my $phone = require "basetest.t";

my %Param = (	 
   	  Screen=> "Phone" , 
	  Action=> "Phone",
	  QueueID => 1,
	  UserID  => 1
	 );



warn Dumper($phone->_GetScreenElementsFreeTextFields(16,"TicketFreeText","TicketFreeKey",%Param));