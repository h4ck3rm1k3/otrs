open IN, "tests.txt";

my $count=100;

while (<IN>)
{
#    warn $_;
    if (/\$phone-\>(\w+)/)	
    {
	my $testline=$_;
	my $name= $1;
	my $file = sprintf("%3.0d_%s.t",$count,$name);
	$count++;
#	warn $file;
	if (!-f $file)
	{
	    open OUT, ">$file";

print OUT 	 qq!package Test${name};

#  scripts/test/iso/${file} - all iPhone tests
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# \$Id: ${file},v 1.68 2012/02/01 18:51:07 md Exp \$
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use vars qw(\@ISA \$VERSION);
\$VERSION = qw(\$Revision: 1.68 \$) [1];

use strict;
use warnings;
use YAML;
use basetest;
my \$phone = basetest::NewPhone();
my \%param = basetest::NewParam(\"$name\");

my \$ret=$testline;
warn Dump(\$ret);

!;

1;

	    close OUT;
	}
    }

}
