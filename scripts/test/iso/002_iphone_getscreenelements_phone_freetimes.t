use strict;
use warnings;

my $phone = require "basetest.t";

my %Param = (	 
   	  Screen=> "Phone" , 
	  Action=> "Phone",
	  QueueID => 1,
	  UserID  => 1
	 );


warn Dumper($phone->_GetScreenElementsTicketFreeTimeFields(%Param));