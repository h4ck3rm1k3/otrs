#!/usr/bin/perl
use CGI;
my $q = CGI->new;
print $q->header();
print q!<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
<script type="text/javascript" src="/js/introspector.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
	    $("#msgid").html("This is Hello World by JQuery");
	});

$("#createexec").live("click", function(){ 
	$('#inputjson').val(     "User=cr&" +
				 "Password=123&" +
				 "Object=CustomObject&" +
				 "Method=ScreenActions&" + 
				 'Data={"Action":"Phone","StateID":"4","CustomerID":"otrs","PriorityID":"3","SLAID":"","CustomerUserLogin":"fer","TimeUnits":"","Subject":"Test","ServiceID":"","Body":"Body","OwnerID":"","QueueID":"3","TicketFreeText1":"Notebook","PendingDate":""}');
    });
    
    $("#createquery").live("click", function(){ 
	    $('#inputjson').val(     "User=cr&" +
				     "Password=123&" +
				     "Object=CustomObject&" +
				     "Method=ScreenConfig&" + 
				     'Data={"Screen":"Phone","Language":"en"}'
				     );
	});
	

$("#exec").live("click", function(){ 
	args=      $('#inputjson').val();    
	testurl = 'http://localhost:82/otrs/json.pl?' + args;
	$.ajax({
		url: testurl,
		    context: document.body,
		    success: function(data,text,jq)
		    {
			
			// the test url to check this yourself
			$("#testurl").html("<a href='"+
					   testurl+ "'>" 
					   + testurl 
					   + "'</a>");
				       
			$("#msgid").html("ajax returned." 
					  + text 
					 + "|" 
					 + jq);
			
			$('#outputjson').val(data);    
			
			
		    }
	    } // ajax
	    ); // ajax)
    }// function
    );// live 


$("#format").live("click", function(){ 
	// now lets loop over the names in the fieldsd

	var data= $('#outputjson').val();    
	// format the data
	var obj = jQuery.parseJSON(data);
	var text = "<ul>";
	for (e in obj.Data[0].Elements)
	    {		
		text = text + "<li>" + obj.Data[0].Elements[e].Name +  "</li>" ;
	    }
	text = text + "</ul>";
	$("#formatout").html( text );

    });


</script>
<title>json test environment</title>
</head>
<body>
<div id="msgid"></div>
<div id="testurl"></div>
<div id="introspector">Click here to query request types</div>
<div id="createexec">  Click here to prepare a create request</div>
<div id="createquery">  Click here to prepare a query request</div>
<div id="exec">  Click here to exec the request</div>
<div id="format">  Click here to extract the names from the request</div>
<div id="formatout">The formatted output goes here</div>

<form>
<textarea id="inputjson"  rows="20" cols="50"></textarea>
<textarea id="outputjson"  rows="20" cols="50"></textarea>
</form>

</body>
</html>!;

1;
