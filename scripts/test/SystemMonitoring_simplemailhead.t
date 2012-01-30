use strict;
use warnings;
use Mail::Header;
use YAML;

my $Content= q[Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.502 (Entity 5.502)
From: nagios@example.com
To: you@yourhost.com
Subject: ** PROBLEM alert 1 - delphin host is DOWN **
];

my @Content = split /\n/, $Content;
for my $Line (@Content) {    $Line .= "\n";}
my $EmailC = \@Content;
my $HeaderObject = Mail::Header->new();
my $h = $HeaderObject->header(\@Content);
warn Dump($HeaderObject);
warn Dump($h);
