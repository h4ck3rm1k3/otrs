
use basetest;
use Data::Dumper;

my $phone = basetest::NewPhone();
my %param = basetest::NewParam("_CheckRequiredFreeTextField");

#my $phone = require "basetest.t";

$phone->{Config}->{"CustomerID"}=1;
$phone->{Config}->{"ArticleFreeText"}->{"2"}=1;
$phone->{Config}->{"TicketFreeText"}->{"1"}=2;
$phone->{Config}->{"TicketFreeTime"}->{"2"}={};

$phone->{Config}->{"ArticleDynamicFields"}->{"test1"}={
	Mandatory => 1 ,
	Max => 250,
};

$phone->{Config}->{"TicketDynamicFields"}->{"test3"}=1;
$phone->{Config}->{"TicketDynamicFields"}->{"test2"}=1;
$phone->{Config}->{"TicketDynamicFields"}->{"test"}=1;

my @ret;
push @ret,$phone-> _GetScreenElementsArticleDynamicFields(       	 ObjectType=> "Article" , 	 );
for my $x (@ret)
{
	print "got Article field with name : ".  $x->{Name} . "\n";	
} 


push @ret,$phone-> _GetScreenElementsArticleDynamicFields(       	 ObjectType=> "Ticket" , 	 );

for my $x (@ret)
{
	print "got Ticket field with name : ".  $x->{Name} . "\n";	
} 

warn Dumper(\@ret);
