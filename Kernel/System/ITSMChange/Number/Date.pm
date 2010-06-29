# --
# ITSMChange/Number/Date.pm - a date based change number generator
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: Date.pm,v 1.1 2010/06/29 12:41:36 sb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

# Generates ticket numbers like yyyymmddss##### (e. g. 2002062300001)

package Kernel::System::ITSMChange::Number::Date;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub ChangeNumberCreate {
    my ( $Self, %Param ) = @_;

    # get needed config options
    my $CounterLog = $Self->{ConfigObject}->Get('ITSMChange::CounterLog');

    # define number of maximum loops if created change number exists
    my $MaxRetryNumber        = 16000;
    my $LoopProtectionCounter = 0;

    # try to create a unique change number for up to $MaxRetryNumber times
    while ( $LoopProtectionCounter <= $MaxRetryNumber ) {

        # get current time
        my ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = $Self->{TimeObject}->SystemTime2Date(
            SystemTime => $Self->{TimeObject}->SystemTime(),
        );

        # read count
        my $Count      = 0;
        my $LastModify = '';
        if ( -f $CounterLog ) {
            my $ContentSCALARRef = $Self->{MainObject}->FileRead(
                Location => $CounterLog,
            );
            if ( $ContentSCALARRef && ${$ContentSCALARRef} ) {
                ( $Count, $LastModify ) = split( /;/, ${$ContentSCALARRef} );

                # just debug
                if ( $Self->{Debug} > 0 ) {
                    $Self->{LogObject}->Log(
                        Priority => 'debug',
                        Message  => "Read counter from $CounterLog: $Count",
                    );
                }
            }
        }

        # check if we need to reset the counter
        if ( !$LastModify || $LastModify ne "$Year-$Month-$Day" ) {
            $Count = 0;
        }

        # count auto increment
        $Count++;

        # increase the the counter faster if we are in loop pretection mode
        $Count += $LoopProtectionCounter;

        my $Content = $Count . ";$Year-$Month-$Day;";

        # write new count
        my $Write = $Self->{MainObject}->FileWrite(
            Location => $CounterLog,
            Content  => \$Content,
        );
        if ($Write) {
            if ( $Self->{Debug} > 0 ) {
                $Self->{LogObject}->Log(
                    Priority => 'debug',
                    Message  => "Write counter: $Count",
                );
            }
        }

        # pad change number with leading '0' to length 5
        $Count = sprintf "%05d", $Count;

        # create new change number
        my $ChangeNumber = $Year . $Month . $Day . $Count;

        # lookup if change number exists already
        my $ChangeID = $Self->ChangeLookup(
            ChangeNumber => $ChangeNumber,
        );

        # now we have a new unused change number and return it
        return $ChangeNumber if !$ChangeID;

        # start loop protection mode
        $LoopProtectionCounter++;

        # create new change number again
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "ChangeNumber ($ChangeNumber) exists! Creating a new one.",
        );
    }

    # loop was running too long
    $Self->{LogObject}->Log(
        Priority => 'error',
        Message  => "LoopProtectionCounter is now $LoopProtectionCounter!"
            . " Stopped ChangeNumberCreate()!",
    );
    return;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=head1 VERSION

$Revision: 1.1 $ $Date: 2010/06/29 12:41:36 $

=cut
