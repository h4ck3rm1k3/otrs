use strict;
use warnings;
use MIME::Parser;
use MIME::Tools;
### Create a new parser object
my $parser = new MIME::Parser;

$parser->decode_headers(1);

my $Content= q[Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.502 (Entity 5.502)
From: nagios@example.com
To: you@yourhost.com
Subject: ** PROBLEM alert 1 - delphin host is DOWN **

***** Nagios  *****

Notification Type: PROBLEM
Host: delphin
State: DOWN for 0d 0h 0m 0s
Address: 127.1.1.1
Info:

CRITICAL - Time to live exceeded (127.1.1.1)

Date/Time: Sun Mar 18 00:18:30 CET 2007

ACK by: 
Comment:

];

MIME::Tools->debugging(1);

        # check if Email is an array ref

my @Content = split /\n/, $Content;
for my $Line (@Content) {    $Line .= "\n";}
my $EmailC = \@Content;

#$entity = $parser->parse_data($Content);

my $EmailO = Mail::Internet->new( \@Content,Modify => 0 );
#warn $EmailO->as_string();
#warn $EmailO->as_mbox_string();

my $HeaderObject = $EmailO->head();
#$HeaderObject->unfold();
use YAML;
warn Dump($HeaderObject);
#
#foreach my $What qw(From)
#{    $HeaderObject->combine($What);
#    my $Line = $HeaderObject->get($What) || '';
#    warn $Line;
#}

### Congratulations: you now have a (possibly multipart) MIME entity!
#$entity->dump_skeleton;          # for debugging
