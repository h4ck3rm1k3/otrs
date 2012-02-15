# -*- perl -*-
use strict;
use warnings;
use basetest;
use YAML;
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
$phone->{ConfigObject}->{Debug}=999;
$phone->{Debug}=999;
$phone->{Config}->{"ArticleFreeText"}->{"1"}=2;
$phone->{Config}->{"ArticleFreeText"}->{"2"}=1;
my @ret= $phone->_GetScreenElementsFreeTextFields(3,"ArticleFreeText","ArticleFreeKey",%Param);

if (@ret)
{
    warn Dump(\@ret);
}

for my $x (@ret)
{
    warn $x->{Name};
} 
