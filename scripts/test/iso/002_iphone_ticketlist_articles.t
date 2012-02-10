use strict;
use warnings;
use basetest;
my $phone = basetest::NewPhone();

use Data::Dumper;
# create a new ticket
my %param;

basetest::CreateTestArticle($phone,\%param);

my %Ticket = $phone->TicketList(
   UserID => 1, 
   TicketID => $param{TicketID},
   ArticleID => $param{ArticleID}
   );
warn Dumper(\%Ticket);
