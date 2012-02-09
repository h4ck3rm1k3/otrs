
use basetest;
use Data::Dumper;

my $phone = basetest::NewPhone();
my %param = basetest::NewParam("_CheckRequiredFreeTextField");

#my $phone = require "basetest.t";

warn Dumper($phone-> _GetScreenElements(    
	 Screen=> "Phone" , 
	 Action=> "Phone",
	 QueueID => 1,
	 UserID  => 1
	 ));