package Test_SetTicketFreeText;

#  scripts/test/iso/134__SetTicketFreeText.t - all iPhone tests
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: 134__SetTicketFreeText.t,v 1.68 2012/02/01 18:51:07 md Exp $
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
my %param = basetest::NewParam("_SetTicketFreeText");

$param{"TicketID"}="79";
$param{"TicketDynamicField-test"}="Blah1";
my $ret=$phone->_SetTicketDynamicFields(%param);
warn Dump($ret);

$param{"ArticleID"}="79";
$param{"ArticleDynamicField-test2"}="Blah2";
my $ret2=$phone->_SetArticleDynamicFields(%param);
warn Dump($ret2);

