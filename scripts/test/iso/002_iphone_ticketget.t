use strict;
use warnings;
use basetest;
my $phone = basetest::NewPhone();
 
use Data::Dumper;
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
);

my %Ticket = $phone->TicketGet(UserID=>1, TicketID => $TicketID);
warn Dumper(\%Ticket);


my $Delete = $phone->{TicketObject}->TicketDelete(
    UserID   => 1,
    TicketID => $TicketID,
);
