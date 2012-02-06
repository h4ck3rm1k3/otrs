# -*- perl -*-
use strict;
use warnings;

my $phone = require "basetest.t";

my %Param = (	 
   	  Screen=> "Phone" , 
	  Action=> "Phone",
	  QueueID => 1,
	  UserID  => 1,
	  TicketID => 197,
	  Subject => "TestSubject",
	  Body => "TestBody",
	  ArticleTypeID =>1,
	  HistoryComment => "Comment",
	 );



 
warn Dumper($phone->
     _TicketCommonActions(%Param));