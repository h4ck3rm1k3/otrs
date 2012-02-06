

my $phone = require "basetest.t";

warn Dumper($phone-> _GetScreenElements(    
	 Screen=> "Phone" , 
	 Action=> "Phone",
	 QueueID => 1,
	 UserID  => 1
	 ));