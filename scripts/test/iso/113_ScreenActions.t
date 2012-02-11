package TestScreenActions; #-*-perl-*-

#  scripts/test/iso/113_ScreenActions.t - all iPhone tests
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: 113_ScreenActions.t,v 1.68 2012/02/01 18:51:07 md Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.68 $) [1];

use strict;
use warnings;
use YAML;
use basetest;
my $phone = basetest::NewPhone();
my %param = basetest::NewParam("ScreenActions");

for my $Action (qw(Phone Note Close Compose Move ))
{   
    $param{Action}=$Action;	
    $param{From}="md\@otrs.com";	

    %param = (%param,
    	ArticleTypeID           => '9',
	CustomerUserLogin => "md\@otrs.com",
	PriorityID=>1,
    	From           => 'Some Agent <agentl@otrs.com>',
	To             => 'Some Customer <customer@otrs.com>',
	Cc             => 'Some Customer <customer@otrs.com>',
	Bcc             => 'Some Customer <customer@otrs.com>',
	References             => '',
	InReplyTo             => '',
	Subject        => 'some short description',
	Body           => 'the message text',
	ContentType    => 'text/plain; charset=ISO-8859-15',
	HistoryType    => 'OwnerUpdate',
	HistoryComment => 'Some free text!',
	UserID         => 1,
	NoAgentNotify  => 1);

    my $ret=$phone->ScreenActions(%param);
    warn Dump($ret);	
}


