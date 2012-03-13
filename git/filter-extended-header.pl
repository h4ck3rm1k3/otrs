use strict;
use warnings;
sub _HeaderlineCheck {
    my $File = shift;
    my $Counter = 0;
    $File =~ /([\w_-]+\.(\w+))$/;
    my $Filename = $1;
    my $FileExtension = $2;

    if ($Filename !~ /(ZZZAuto.pm|ZZZAAuto.pm|Copyright.dtl|AAA.*.dtl)/) {
        warn "Going to open File";
        open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
        open my $Out, '>', $File . ".new" or die "FILTER: Can't open out $File: $!\n";
        while (my $Line = <$In>) {
            $Counter++;
            if ((($FileExtension eq 'pm' || $FileExtension eq 't' || $FileExtension eq 'dtl') && $Counter == 2) || ($FileExtension eq 'pl' && $Counter == 3)){
                if ($Line =~ /^\#\s([\w\/\.]+)\s*(.+)?/) {
                    my $OldFilename=$1;
                    my $Comment=$2;

                    if ($OldFilename ne $File) {
                        print "ERROR: File $File \n";
                        print "ERROR: Line $Line\n";
                        $Line =~s /$OldFilename/$File/; #replace
                    }
                    else
                    {
                        warn "OK $Line";
                    }
#                    close $In;
                    
                    #return;
                }
                else
                {
                    die "ERROR :$Line";
                }
            }
            $Line =~ s/\t/    /g; # replace the spaces
            print $Out $Line;
        }
        close $In;
        close $Out;
        rename ($File,$File .".old" );
        rename ($File . ".new",$File );

    }
    print "NOTICE: _HeaderlineCheck() ok\n";
    return 1;
}

_HeaderlineCheck @ARGV;
