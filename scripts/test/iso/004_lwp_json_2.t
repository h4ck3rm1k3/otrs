use LWP::Simple;		
my $content = get("http://localhost:82/otrs/json.pl?User=cr&Password=123&Object=CustomObject&Method=ScreenActions&Data={%22Action%22:%22Phone%22,%22StateID%22:%224%22,%22CustomerID%22:%22otrs%22,%22PriorityID%22:%223%22,%22SLAID%22:%221%22,%22CustomerUserLogin%22:%22fer%22,%22TimeUnits%22:%22%22,%22Subject%22:%22Test%20for%20Mike%22,%22ServiceID%22:%221%22,%22Body%22:%22Body%22,%22OwnerID%22:%223%22,%22QueueID%22:%223%22,%22PendingDate%22:%22%22}");

warn $content;
