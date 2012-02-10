package Test_TicketFreeTextSet;

#  scripts/test/iso/116__TicketFreeTextSet.t - all iPhone tests
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: 116__TicketFreeTextSet.t,v 1.68 2012/02/01 18:51:07 md Exp $
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
my %param = basetest::NewParam("_TicketFreeTextSet");
my %param2 = (
   TicketID =>$param{TicketID},
   UserID =>$param{UserID},
   Key => "TicketFreeText1",
   Value => "TicketFreeTextvalue",
   );
my $ret=$phone->_TicketFreeTextSet (%param2);
;
warn Dump($ret);

