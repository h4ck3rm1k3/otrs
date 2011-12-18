# --
# Kernel::System::DateProcessing.pm - flexible relative time stamps for Pending Time. 
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: DateProcessing.pm,v 1.79 2011/11/12 09:06:15 mdupont Exp $
#
# This package use Time::ParseDate from David Muir Sharnoff (http://search.cpan.org/~muir/Time-modules-2003.0211/lib/Time/ParseDate.pm )
# for parsing the follow up date stamps. The parsing is extended by using shortcuts, so you dont have to write hours, days or minutes. You can use D, H and M.
#
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DateProcessing;
use Exporter;
use base Exporter;
@EXPORT_OK = qw(ValidateAndTransformPendingTime);



use Time::ParseDate;
use POSIX qw(strftime);
use Carp qw(confess);

sub ValidateAndTransformPendingTime
{
    my $Self =shift; # self object containing a Log object

    # check needed Objects
    my	$LogObject = $Self->{LogObject} || die "No LogObject in Self";


    my $pending_time_parameter=shift;

    # simple shortcuts for hour minutes and days
    $pending_time_parameter =~ s/([\d\s]+)d$/$1 days/;
    $pending_time_parameter =~ s/([\d\s]+)h$/$1 hours/;
    $pending_time_parameter =~ s/([\d\s]+)m$/$1 minutes/;
    
    $seconds_since_jan1_1970 = parsedate($pending_time_parameter);


    if ($seconds_since_jan1_1970 == 0)
    {
	$LogObject->Log(
            Priority => 'Error',
            Message  => "Parsing of the date stamp $pending_time_parameter failed. Processing cannot continue "
	    );

	confess "Date Parsing Failed";
    }
    # convert to array
    my @localtime= localtime($seconds_since_jan1_1970);

    # normalize the time back to the standard
    my $normalized_date =strftime ("%F %T", @localtime);
   
    return $normalized_date;
}

1;

