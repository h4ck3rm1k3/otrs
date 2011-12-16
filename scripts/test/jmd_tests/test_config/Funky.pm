package Funky;
use YAML;
sub new
{
    my $class=shift;
    open OUT ,">/tmp/test.yml";
    print OUT Dump(\@_);
    close OUT;
    my $self={
	funky => 1
    };
    return bless $self,$class;
}
1;
