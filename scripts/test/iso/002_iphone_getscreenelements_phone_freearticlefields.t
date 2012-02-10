# -*- perl -*-
use strict;
use warnings;
use basetest;
my $phone = basetest::NewPhone();
#my %param = basetest::NewParam("_CheckRequiredFreeTextField");
#my $phone = require "basetest.t";
use Data::Dumper;
my %Param = (	 
   	  Screen=> "Phone" , 
	  Action=> "Phone",
	  QueueID => 1,
	  UserID  => 1
	 );


#TicketFreeKey2  => ['Product', 'Product2'],
$phone->{ConfigObject}->{Debug}=999;

$phone->{ConfigObject}->Set(Key => 'ArticleFreeKey1::DefaultSelection', Value=>"Test");
$phone->{ConfigObject}->Set(Key => 'ArticleFreeText1',Value=>"Blah");
$phone->{ConfigObject}->Set(Key => 'ArticleFreeKey1',Value=>["a","b"]);
# $phone->{ConfigObject}->Set('ArticleFreeText1') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeText1') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeText1') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeKey2::DefaultSelection') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeText2') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeKey2') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeText2') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeText2') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeText2') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeKey3::DefaultSelection') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeText3') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeKey3') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeText3') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeText3') --> <undef>
# $phone->{ConfigObject}->Set('ArticleFreeText3') --> <undef>
 
warn Dumper($phone->
     _GetScreenElementsFreeTextFields(3,"ArticleFreeText","ArticleFreeKey",%Param));
