package Test_GetArticleFreeTextConfigOptions;

#  scripts/test/iso/101__GetArticleFreeTextConfigOptions.t - all iPhone tests
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: 101__GetArticleFreeTextConfigOptions.t,v 1.68 2012/02/01 18:51:07 md Exp $
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
my %param = basetest::NewParam("_GetArticleFreeTextConfigOptions");

my $ret=$phone->_GetArticleFreeTextValues(\%param);
;
warn Dump($ret);

