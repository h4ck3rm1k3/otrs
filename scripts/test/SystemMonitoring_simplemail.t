use MIME::Entity;
use YAML;

my $Content= q[
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

my @data = map { $_ . "\n" } split ("\n",$Content);

### Create the top-level, and set up the mail headers:
#Return-Path: <nagios@example.com>
#To: otrs@example.com
#Subject:
#Message-Id: <20070317231546.0DFD55DC00F@h53795.example.com>
#Date: Sun, 18 Mar 2007 00:15:46 +0100 (CET)
#From: 
#Mime-Version: 1.0


$top = MIME::Entity->build(
    From    => "nagios\@example.com",
    To      => "you\@yourhost.com",
    Subject => "\*\* PROBLEM alert 1 - delphin host is DOWN \*\*",
    Data => \@data
    );


#$top->print(*STDOUT);

$top->print();
