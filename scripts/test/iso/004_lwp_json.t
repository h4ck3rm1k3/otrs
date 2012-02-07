use LWP::Simple;		
my $content = get(q[http://localhost:82/otrs/json.pl?User=cr&Password=123&Object=CustomObject&Method=ScreenActions&Data={"Action":"Phone","StateID":"4","CustomerID":"otrs","PriorityID":"3","SLAID":"","CustomerUserLogin":"fer","TimeUnits":"","Subject":"Test","ServiceID":"","Body":"Body","OwnerID":"","QueueID":"3","TicketFreeText1":"Notebook","PendingDate":""}]);

warn $content;
