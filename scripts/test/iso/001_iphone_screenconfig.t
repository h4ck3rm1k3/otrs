package Test;

#  scripts/test/iso/001_iphone.t - all iPhone tests
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: iPhone.pm,v 1.68 2012/02/01 18:51:07 md Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.68 $) [1];

use strict;
use warnings;

use basetest;
my $phone = basetest::NewPhone();

my %param= (
   UserID=> 1,
   TicketID =>1,
   QueueID => 1,
   ResponseID => 1,
   Screen => "Phone",
   Subject => "Subject",
   TimeStamp => "2001-01-01 10:10:01",
   TicketFreeText1 => "freetext1",
);

##
$phone->{ConfigObject}->Set(Key=>'Ticket::Frontend::Quote', Value=>">");

$phone->ScreenConfig(%param);


1;
