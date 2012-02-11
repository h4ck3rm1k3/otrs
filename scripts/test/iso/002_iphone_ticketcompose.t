# -*- perl -*-
use strict;
use warnings;
use basetest;
use Data::Dumper;
my $phone = basetest::NewPhone();
#my %param = basetest::NewParam("_CheckRequiredFreeTextField");

#my $phone = require "basetest.t";

my %Param = (	 
    Screen=> "Phone" , 
    Action=> "Phone",
    QueueID => 1,
    UserID  => 1,
    TicketID => 197,
    StateID => 1,
    From => "root\@localhost",
    To => "mdupont\@otrs.com",
    Subject => "TestSubject",
    Body => "TestBody",
    ArticleTypeID =>1,
    HistoryComment => "Comment",
    Cc => "mdupont2\@otrs.com",
    Bcc => "mdupont3\@otrs.com",
    InReplyTo => "none",
    References => "",
	  ## now lets add in some free text
    TicketFreeKey16 => "free 16",
    TicketFreeText16 => "free 16",
    ArticleFreeKey1 => "SomeKey",
    ArticleFreeText1 => "SomeValue",
    ArticleFreeTime1Year => "2001",
    ArticleFreeTime1Month => "11",
    ArticleFreeTime1Day => "11",
    ArticleFreeTime1Hour => "11",
    ArticleFreeTime1Minute => "11",
    ##########
    SomeKey        => "SomeKeyValue",
    SomeKey2        => "SomeKeyValue2",
    TicketFreeKey1 => "TicketID",
    TicketFreeText1 => "SomeKey",
    TicketFreeTime1Year => "2011", 
    TicketFreeTime1Month => "11",
    TicketFreeTime1Day => "11",
    TicketFreeTime1Hour => "11",
    TicketFreeTime1Minute => "11",
    

	 );


my $ticketid=	$phone->_TicketCompose(%Param);

my %TicketData = $phone->TicketGet(
    TicketID => $Param{TicketID},
    UserID   => $Param{UserID}
    );

warn Dumper(%TicketData);
