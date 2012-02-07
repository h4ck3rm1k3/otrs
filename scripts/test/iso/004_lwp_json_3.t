use LWP::Simple;		

my @parts;
for my $f (1 .. 16)
{
	push @parts, qq["TicketFreeText$f":"SomeText$f"];
	push @parts, qq["TicketFreeKey$f":"SomeTextKey$f"];
}

for my $f (1 .. 3)
{
	push @parts, qq["ArticleFreeText$f":"SomeText$f"];
	push @parts, qq["ArticleFreeKey$f":"SomeTextKey$f"];
}

for my $f (1 .. 6)
{
	push @parts, qq["TicketFreeTime$f":"2011-01-01 12:00:00"];
}

my $content = get(q[http://localhost:82/otrs/json.pl?User=cr&Password=123&Object=CustomObject&Method=ScreenActions&Data={"Action":"Phone","StateID":"4","CustomerID":"otrs","PriorityID":"3","SLAID":"","CustomerUserLogin":"fer","TimeUnits":"","Subject":"Test","ServiceID":"","Body":"Body","OwnerID":"","QueueID":"3",]
   . 	    
   join (",", @parts)
   .  
   q[,"PendingDate":""}]);

warn $content;
