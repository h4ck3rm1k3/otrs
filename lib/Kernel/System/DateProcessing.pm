package Kernel::System::DateProcessing;
use Exporter;
use base Exporter;
@EXPORT_OK = qw(ValidateAndTransformPendingTime);

use Time::ParseDate;
use POSIX qw(strftime);
use Carp qw(confess);

sub ValidateAndTransformPendingTime
{
    my $pending_time_parameter=shift;

    # simple shortcuts for hour minutes and days
    $pending_time_parameter =~ s/([\d\s]+)d$/$1 days/;
    $pending_time_parameter =~ s/([\d\s]+)h$/$1 hours/;
    $pending_time_parameter =~ s/([\d\s]+)m$/$1 minutes/;
    
    $seconds_since_jan1_1970 = parsedate($pending_time_parameter);

    confess "Date Parsing Failed" unless $seconds_since_jan1_1970 > 0;

    # convert to array
    my @localtime= localtime($seconds_since_jan1_1970);

    # normalize the time back to the standard
    my $normalized_date =strftime ("%F %T", @localtime);
   
    return $normalized_date;
}

1;

