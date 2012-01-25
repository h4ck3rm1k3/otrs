use strict;
use warnings;
use TextPatch;

my $debug=0;

sub extract_version_number
{
    my $version=shift;
    if ($version =~ /v ([\d\.]+) /)
    {
	return $1;
    }

    if ($version =~ /\.pm ([\d\.]+) /)
    {
	return $1;
    }
    
    die "cannot extract version from $version";

}

sub extract_version_date
{
    my $version=shift;

    if ($version =~ /(\d+\/\d+\/\d+ \d+\:\d+\:\d+)/)
    {
	return $1;
    }
    die "cannot extract version from $version";

}


sub extract_ids
{
    my $branch=shift;
    open IN,$branch;
    my $oldid;
    my $newid;
    while(<IN>)
    {
	if (/OldId:(.+)/)
	{
	    $oldid=$1;
	}	
	if (/Id:(.+)/)
	{
	    $newid=$1;
	}
    }
    close IN;
    return $oldid,$newid;
}

sub do_system
{
    my $cmd =shift;
    system $cmd or die "failed to exec $cmd with error $@";
}

#use Text::Patch;


sub apply_patch
{
    my $hash=shift;
    my $outdir=shift;
    my $branch=shift;

  # see also http://gitready.com/intermediate/2009/03/04/pick-out-individual-commits.html
#    system "git format-patch -1 -o $outdir $hash" ; ## produce a patch file for review   
    open PATCH,  "git format-patch -1 --stdout $hash|" ; ## produce a patch file for review
    my $patch="";
    my $found =0;
    while (<PATCH>)
    {	

#diff --git a/Kernel/Modules/CustomerTicketAttachment.pm b/Kernel/Modules/CustomerTicketAttachment.pm
	if (/diff \-\-git a\/([\w\-\.\/]+)/)
	{
	    my $filename =$1;
	    if ("${outdir}/${filename}" eq $branch)
	    {
		$found=1;
		warn "FOUND: ${outdir}/${filename} ne $branch";
	    }
	    else
	    {
		$found=0;
	#	warn "SKIP:${outdir}/${filename} ne $branch";
	    }
	}
	
	if ($found==1)
	{
	    $patch .=$_;	
	}

    }
    close PATCH;

    open OUT, ">testpatch.txt";
#    warn "patch is now  ${patch} ";
    print OUT ${patch};
    close OUT;


    open DATA,  "$branch" ; ## produce a patch file for review
    my $source="";
    while (<DATA>)    {	
	$source .=$_;	
    }
    close DATA;

    warn "going to process $branch and patch of length :"  . length($patch);
    my $output = patch( $source, $patch, STYLE => "Unified" );
    
    warn $output;
    # now we can filter the patch   
#    open APPLY, "|git apply --verbose --directory=${outdir} - --include=$branch";
#    print APPLY $patch;
#    close APPLY;

    die "check results for $outdir and $branch ";
}

sub extract_revisions_from_log
{
    my $fromdate=shift;
    my $todate  =shift;
    my $master  =shift;
    my $branch  =shift;
    my $outdir  =shift;


    my $cmd = "git log --pretty=format:\"%H\"  --since=\"$fromdate\" --until=\"$todate\" $master";
    warn "going to check $cmd";
    open CMD,"$cmd|" or die "cannot run $cmd $@";

    my $count=0;    
    while(<CMD>)
    {
	chomp;
	my $hash =$_;
	$count++; # add one!
	next if $count ==0; # skip the first commit 	

	print "Going to apply hash $hash to $branch\n";
	#$outdir
	apply_patch($hash,$outdir,$branch);

    }
    close CMD; 

}

sub process_merge
{
    my $master=shift;
    my $branch=shift;
    my $outdir=shift;

    ##
    my ($oldid,$newid) = extract_ids($branch);
    my ($master_oldid,$master_newid) = extract_ids($master);

    if ($master_oldid)
    {
	die "why does $master have $master_oldid";
    }
    if (!$master_newid)
    {
#	warn "missing newid in $master";
	return ;
    }
   
    if ($newid)
    {
	if (!$oldid)
	{
#	    warn "MISSING OldId:, newid $newid in Branch:$branch\n" unless $oldid;
	}
	else
	{
	    my $fromdate= extract_version_date $oldid;


	    my $todate= extract_version_date $master_newid;
	    warn "check the diff from $oldid to $master_newid" if $debug;
	    extract_revisions_from_log $fromdate,$todate,$master, $branch,$outdir;

#	    warn " diff -kk -u -r $oldv -r $newv  $master";
	    
	}	
    }

}
sub check
{
    my $packdir=shift;
    my $packname=shift;
    my $perm    =shift;
    my $source_location=shift;
#    warn  "$packdir ne $packname in :$_" unless $packdir eq $packname;

#    warn "Going to look at $packdir and $packname with perm $perm in loc: $source_location\n";

    if (-f $source_location)
    {
#	warn "Found $source_location";
	
	my $srcdir="../git/${packdir}";
	my $src="${srcdir}/${source_location}";
	if ( -f $src)
	{
	    process_merge($source_location,$src,$srcdir); #merge this 
	}
	else
	{
	    die "mising $src";
	}
    }
    else
    {
#	warn "Missing $source_location";
    }
}

while (<>)
{
    next if /\<!--/;

    if (/\.\.\/([-\w]+)\/([-\w]+).sopm:\s+\<File Permission="(\d+)" Location=\"([\w\-\.\/]+)\"/)
    {
	my $packdir=$1;
	my $packname=$2;
	my $perm    =$3;
	my $source_location=$4;


	check $packdir, $packname, $perm , $source_location;
    }

    #example ../git/Astaro-EscalationNotify/Astaro-EscalationNotify.sopm:        <File Location="Kernel/Output/HTML/NotificationAgentTicketEscalation.pm" Permission="644" Encode="Base64"/>
    elsif (/\.\.\/([-\w]+)\/([-\w]+).sopm:\s+\<File Location=\"([\w\-\.\/]+)\" Permission="(\d+)"\s*(?:Encode="Base64")?/)
    {
	my $packdir=$1;
	my $packname=$2;

	my $source_location=$4;
	my $perm    =$3;
	check $packdir, $packname, $perm , $source_location;
    }

    else
    {
	die  "cannot parse : $_";
    }
}
