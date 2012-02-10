package Test_TicketCommonActions;

#  scripts/test/iso/114__TicketCommonActions.t - all iPhone tests
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: 114__TicketCommonActions.t,v 1.68 2012/02/01 18:51:07 md Exp $
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
my %param = basetest::NewParam("_TicketCommonActions");

for my $Action (qw(Phone Note Close Compose Move ))
{
	$param{Action}=$Action,
	$param{Body}="Body for $Action",

%param = (%param, (
    ArticleType    => 'note-internal',
    SenderType     => 'agent',
    From           => 'Some Agent <agentl@otrs.com>',
    To             => 'Some Customer <customer@otrs.com>',
    Subject        => 'some short description',
    ContentType    => 'text/plain; charset=ISO-8859-15',
    HistoryType    => 'OwnerUpdate',
    HistoryComment => 'Some free text!',
)   );

	my $ret=$phone->_TicketCommonActions(%param);
	warn Dump($ret);	
}	
;


