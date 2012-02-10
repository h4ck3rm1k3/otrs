package Test; #-*-perl-*-

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

use basetest;
my $phone = basetest::NewPhone();

$phone->{Config} = $phone->{ConfigObject}->Get('iPhone::Frontend::AgentTicketCompose')|| die;

# create a new ticket
my $TicketID = $phone->{TicketObject}->TicketCreate(
    Title        => 'My ticket created by Agent A',
    Queue        => 'Raw',
    Lock         => 'unlock',
    Priority     => '3 normal',
    State        => 'open',
    CustomerNo   => '123465',
    CustomerUser => 'customer@example.com',
    OwnerID      => 1,
    UserID       => 1,
    From           => 'Some Agent <agentl@otrs.com>',
);

# create an article for
my $ArticleID = $phone->{TicketObject}->ArticleCreate(
    TicketID       => $TicketID,
    ArticleType    => 'note-internal',
    SenderType     => 'agent',
    From           => 'Some Agent <agentl@otrs.com>',
    To             => 'Some Customer <customer@otrs.com>',
    Subject        => 'some short description',
    Body           => 'the message text',
    ContentType    => 'text/plain; charset=ISO-8859-15',
    HistoryType    => 'OwnerUpdate',
    HistoryComment => 'Some free text!',
    UserID         => 1,
    NoAgentNotify  => 1,
);
warn "Created article ID $ArticleID";

my %Param = basetest->NewParam("test");
$Param{Action}= "Phone";
$Param{Body}= "Body123";
$Param{ArticleType}="note-internal";
$Param{ArticleID}=$ArticleID;


$phone-> _GetScreenElements(    Screen=> "Phone", UserID =>1,TicketID => $TicketID,%Param  ); ##
$phone-> _GetScreenElements(    Screen=> "Move" , UserID =>1,TicketID => $TicketID,%Param  );
#$phone-> _GetScreenElements(    Screen=> "Compose", TicketID => $TicketID, UserID =>1); #
$phone-> _GetScreenElements(    Screen=> "Compose", TicketID => $TicketID, ArticleID=>$ArticleID, UserID =>1,%Param); #
#$phone-> _GetScreenElements(    Screen=> "Compose", ArticleID=>$ArticleID, UserID =>1); #


basetest::CreateCustomerUserObject($phone,\%Param);

 $phone-> _TicketPhoneNew(%Param);
 $phone-> _TicketCommonActions(%Param);

$Param{From}     = 'Some Agent <agentl@otrs.com>';

$phone-> _GetComposeDefaults(
#    ArticleID=>$ArticleID,
    TicketID => $TicketID,
    %Param
    );
