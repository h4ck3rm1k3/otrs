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
use Data::Dumper;
use basetest;
my $phone = basetest::NewPhone();

my %Param = basetest::NewParam("ArticleGet");

# create an article
my $ArticleID = $phone->{TicketObject}->ArticleCreate(
    TicketID       => $Param{TicketID},
    ArticleType    => 'note-internal',
    SenderType     => 'agent',
    From           => 'Some Agent <agentl@localunittest.com>',
    To             => 'Some Customer <customer@localunittest.com>',
    Subject        => 'some short description',
    Body           => 'the message text',
    ContentType    => 'text/plain; charset=ISO-8859-15',
    HistoryType    => 'OwnerUpdate',
    HistoryComment => 'Some free text!',
    UserID         => 1,
    NoAgentNotify  => 1,
);

my %Ticket = $phone->ArticleGet(UserID => 1, ArticleID => $ArticleID);
#%Ticket = $phone->ArticleGet(UserID => 1, TicketID => 199);
#warn Dumper($TicketObject->ArticleGet(UserID => 1, TicketID => 199));
#warn Dumper($TicketObject->ArticleGet(UserID => 1, ArticleID => 251));

warn Dumper(\%Ticket);
