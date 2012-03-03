# --
# Kernel/System/SysConfig/Search.pm - all system config tool functions
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: SysConfig.pm,v 1.32 2011/12/21 09:52:28 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::SysConfig::Search;

use strict;
use warnings;
use YAML;

sub _AddMatchingGroupResult
{
    my ($SubGroups,$Group,$SubGroup)=@_;
    return {
	SubGroup      => $SubGroup,
	SubGroupCount => "Some extra infos $SubGroups->{$SubGroup}",
	Group         => $Group,
    },
}

sub _ConfigItemSearch1
{
    my ($Self,$Used,$Group,$SubGroup,$Config,$Param,$SubGroups)=@_;
    my @List;
    if ( !$Used->{ $Group . '::' . $SubGroup } ) {
	
	#does it match the search?
	if ( $_ && 
	     $Self->_SearchArray($Config,$_,$Param->{Search})
	    )
	{
	    push(
		@List,_AddMatchingGroupResult($SubGroups,$Group,$SubGroup)
		);
	    $Used->{ $Group . '::' . $SubGroup } = 1;
	}
    }
    return @List;
}

sub _Blah
{ 
    my ($Self,$Used,$Group,$SubGroup,$Config,$Param,$SubGroups)=@_;
    my @List;
    if ( $Self->_SearchArray($Config,$Param->{Search})) {
    push(
	@List,
	_AddMatchingGroupResult($SubGroups,$Group,$SubGroup)
	);
    $Used->{ $Group . '::' . $SubGroup } = 1;
    }
    return @List;
}
sub _ConfigItemSearchHash {
    my ($Self,$Used,$Group,$SubGroup,$Config,$Param,$SubGroups)=@_;
    my @List;
    for my $Key ( keys %{$Config} ) {
	if ( !$Used->{ $Group . '::' . $SubGroup } ) {
	    #does it match the search
	    
	    if ( $Config->{$Key} && 
		 $Self->_SearchConfigKey($Config,$Key,$Param->{Search})) {
		push(
		    @List,
		    _AddMatchingGroupResult($SubGroups,$Group,$SubGroup)

		    );
		$Used->{ $Group . '::' . $SubGroup } = 1;
	    }
	}
    }
    return @List;
}

sub _Blah3 {
    my ($Self,$Used,$Group,$SubGroup,$Config,$Param,$SubGroups,$Item)=@_;
    my @List;
    my %ItemHash = $Self->ConfigItemGet( Name => $Item );
    for my $Index ( 1 .. $#{ $ItemHash{Description} } ) {
	if ( !$Used->{ $Group . '::' . $SubGroup } ) {
	    my $Description = $ItemHash{Description}[$Index]{Content};
	    
	    # compare with the English description and also with the translated sentence
	    
	    if (
		( $Self->_SearchArray($Description,$Param->{Search}))
		|| (
		    $Self->_SearchArray($Self->{LanguageObject}->Get($Description),$Param->{Search})
		)
		)
	    {
		push(
		    @List,
		    _AddMatchingGroupResult($SubGroups,$Group,$SubGroup)
		    );
		$Used->{ $Group . '::' . $SubGroup } = 1;
	    }
	}
    }
    return @List;
}


#$_ =~ /\Q$Param{Search}\E/i
sub _SearchItem
{
    my ($Self,$Used,$Group,$SubGroup,$Config,$Param,$SubGroups,$Item)=@_;
    if ( $Config && !$Used->{ $Group . '::' . $SubGroup } ) {
	if ( ref $Config eq 'ARRAY' ) {
	    for ( @{$Config} ) {                  
		$Self->_ConfigItemSearch1();
	    }
	}
	elsif ( ref $Config eq 'HASH' ) {
	    $Self->_ConfigItemSearchHash();
	}
	else {
	    $Self->_Blah();
	}
    }
    
    if ( $Self->_SearchArray($Item,$Param->{Search})) {
	$Self->_Blah2();
    }
    else {
	$Self->_Blah3();
    }
    
}


sub _AddItemToResults {
    my ($Self,$Used,$SubGroups,$Group,$SubGroup)=@_;
    my @List;
    if ( !$Used->{ $Group . '::' . $SubGroup } ) {
	push(
	    @List,
	    _AddMatchingGroupResult($SubGroups,$Group,$SubGroup)
	    );
	$Used->{ $Group . '::' . $SubGroup } = 1;
    }
    return @List;
}

sub ConfigItemSearch {
    my ( $Self,%Param) = @_;
    my $Param = \%Param;
    #$Group,$SubGroup, $Config,$Param
#    warn Dump($Group);
#    warn Dump($SubGroup);
#    warn Dump($Config);

    my @List;
    my %Used;

    # check needed stuff
    for (qw(Search)) {
        if ( !$Param->{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    $Param->{Search} =~ s/\*//;
    my %Groups = $Self->ConfigGroupList(); 
    for my $Group ( sort keys(%Groups) ) {
        my %SubGroups = $Self->ConfigSubGroupList( Name => $Group );
        for my $SubGroup ( sort keys %SubGroups ) {
	    # for all the itens
            my @Items = $Self->ConfigSubGroupConfigItemList(
                Group    => $Group,
                SubGroup => $SubGroup,
		);
            for my $Item (@Items) {
                my $Config = $Self->_ModGet( ConfigName => $Item );
		
		my $YAML = Dump($Config);
		if ($YAML =~/$Param{Search}/i)
		{
		    push @List, Kernel::System::SysConfig::Search::_AddItemToResults($Self,\%Used,\%SubGroups,$Group,$SubGroup);
		}

#		push(
#		    @List,
#		    _AddMatchingGroupResult($SubGroups,$Group,$SubGroup)
#		    );


            } ## items
        } ## subgroups
    } ## groups
    return @List;
}

1;
