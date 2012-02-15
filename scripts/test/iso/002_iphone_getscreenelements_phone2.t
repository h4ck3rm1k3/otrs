
use basetest;
use Data::Dumper;

my $phone = basetest::NewPhone();
my %param = basetest::NewParam("_CheckRequiredFreeTextField");

#my $phone = require "basetest.t";

$phone->{Config}->{"CustomerID"}=1;
$phone->{Config}->{"ArticleFreeText"}->{"2"}={
		Mandatory => 1 
	};
$phone->{Config}->{"TicketFreeText"}->{"1"}=2;
$phone->{Config}->{"TicketFreeTime"}->{"2"}=1;

my @ret=$phone-> _GetScreenElements(    
	 Screen=> "Phone" , 
	 Action=> "Phone",
	 QueueID => 1,
	 UserID  => 1
	 );
warn Dumper(\@ret);


for my $x (@{$ret[0]})
{
	print "got field with name : ".  $x->{Name} . "\n";
} 
