#!/usr/bin/perl -w
# --
# bin/otrs.UnlockTickets.pl - to unlock tickets
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: otrs.UnlockTickets.pl,v 1.7 2010/10/11 15:51:26 martin Exp $
# --
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU AFFERO General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# or see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;

# use ../ as lib location
use File::Basename;
use FindBin qw($RealBin);
use lib dirname($RealBin);

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Time;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::DB;
use Kernel::System::Ticket;
use Kernel::System::User;
use Kernel::System::State;
use Kernel::System::Lock;

use Date::Pcalc qw(Delta_Days Add_Delta_Days Day_of_Week Day_of_Week_Abbreviation);

my $Debug = 0;

# common objects
my %CommonObject;
$CommonObject{ConfigObject} = Kernel::Config->new();
$CommonObject{EncodeObject} = Kernel::System::Encode->new(%CommonObject);
$CommonObject{LogObject}    = Kernel::System::Log->new(
    LogPrefix => 'OTRS-otrs.UnlockTickets.pl',
    %CommonObject,
);
$CommonObject{MainObject}   = Kernel::System::Main->new(%CommonObject);
$CommonObject{TimeObject}   = Kernel::System::Time->new(%CommonObject);
$CommonObject{DBObject}     = Kernel::System::DB->new(%CommonObject);
$CommonObject{TicketObject} = Kernel::System::Ticket->new(%CommonObject);
$CommonObject{UserObject}   = Kernel::System::User->new(%CommonObject);
$CommonObject{StateObject}  = Kernel::System::State->new(%CommonObject);
$CommonObject{LockObject}   = Kernel::System::Lock->new(%CommonObject);

my @UnlockStateIDs = $CommonObject{StateObject}->StateGetStatesByType(
    Type   => 'Unlock',
    Result => 'ID',
);
my @ViewableLockIDs = $CommonObject{LockObject}->LockViewableLock( Type => 'ID' );

# check args
my $Command = shift || '--help';
print "otrs.UnlockTickets.pl <Revision $VERSION> - unlock tickets\n";
print "Copyright (C) 2001-2010 OTRS AG, http://otrs.org/\n";

# unlock all tickets
if ( $Command eq '--all' ) {
    print " Unlock all tickets:\n";
    my @Tickets;
    exit 1 if !$CommonObject{DBObject}->Prepare(
        SQL => "SELECT st.tn, st.ticket_answered, st.id, st.user_id FROM "
            . " ticket st, queue sq WHERE st.queue_id = sq.id AND "
            . " st.ticket_lock_id NOT IN ( ${\(join ', ', @ViewableLockIDs)} ) ",
    );

    while ( my @Row = $CommonObject{DBObject}->FetchrowArray() ) {
        push @Tickets, \@Row;
    }
    for (@Tickets) {
        my @Row = @{$_};
        print " Unlocking ticket id $Row[0] ...";
        my $Unlock = $CommonObject{TicketObject}->LockSet(
            TicketID => $Row[2],
            Lock     => 'unlock',
            UserID   => 1,
        );
        if ($Unlock) {
            print " done.\n";
        }
        else {
            print " failed.\n";
        }
    }
    exit 0;
}

# unlock old tickets
elsif ( $Command eq '--timeout' ) {
    print " Unlock old tickets:\n";
    my @Tickets;
    exit 1 if !$CommonObject{DBObject}->Prepare(
        SQL => "SELECT st.tn, st.ticket_answered, st.id, st.timeout, sq.unlock_timeout "
            . " FROM ticket st, queue sq WHERE st.queue_id = sq.id AND "
            . " st.ticket_answered != 1 AND sq.unlock_timeout != 0 AND "
            . " st.ticket_state_id IN ( ${\(join ', ', @UnlockStateIDs)} ) AND "
            . " st.ticket_lock_id NOT IN ( ${\(join ', ', @ViewableLockIDs)} ) ",
    );

    while ( my @Row = $CommonObject{DBObject}->FetchrowArray() ) {
        my $CountedTime = $CommonObject{TimeObject}->WorkingTime(
            StartTime => $Row[3],
            StopTime  => $CommonObject{TimeObject}->SystemTime(),
        );
        if ( $CountedTime >= $Row[4] * 60 ) {
            push @Tickets, \@Row;
        }
    }
    for (@Tickets) {
        my @Row = @{$_};
        print " Unlocking ticket id $Row[0] ...";
        my $Unlock = $CommonObject{TicketObject}->LockSet(
            TicketID => $Row[2],
            Lock     => 'unlock',
            UserID   => 1,
        );
        if ($Unlock) {
            print " done.\n";
        }
        else {
            print " failed.\n";
        }
    }
    exit 0;
}

# show usage
else {
    print "usage: $0 [options] \n";
    print "  Options are as follows:\n";
    print "  --help        display this option help\n";
    print "  --timeout     unlock old tickets\n";
    print "  --all         unlock all tickets (force)\n";
    exit 1;
}
