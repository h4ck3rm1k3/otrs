# --
# Kernel/Modules/AgentITSMConfigItem.pm - the OTRS::ITSM config item module
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItem.pm,v 1.16 2011/03/28 17:23:47 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItem;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;
use Kernel::System::GeneralCatalog;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.16 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ParamObject DBObject LayoutObject LogObject ConfigObject)) {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new(%Param);
    $Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMConfigItem::Frontend::$Self->{Action}");

    # get default parameters
    $Self->{Filter} = $Self->{ParamObject}->GetParam( Param => 'Filter' ) || '';
    $Self->{View}   = $Self->{ParamObject}->GetParam( Param => 'View' )   || '';

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # store last screen, used for backlinks
    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenView',
        Value     => $Self->{RequestedURL},
    );

    # get sorting parameters
    my $SortBy = $Self->{ParamObject}->GetParam( Param => 'SortBy' )
        || $Self->{Config}->{'SortBy::Default'}
        || 'Number';

    # get ordering parameters
    my $OrderBy = $Self->{ParamObject}->GetParam( Param => 'OrderBy' )
        || $Self->{Config}->{'Order::Default'}
        || 'Down';

    # set Sort and Order by as Arrays
    my @SortByArray  = ($SortBy);
    my @OrderByArray = ($OrderBy);

    # investigate refresh
    my $Refresh = $Self->{UserRefreshTime} ? 60 * $Self->{UserRefreshTime} : undef;

    # output header
    my $Output = $Self->{LayoutObject}->Header(
        Title   => 'Overview',
        Refresh => $Refresh,
    );
    $Output .= $Self->{LayoutObject}->NavigationBar();
    $Self->{LayoutObject}->Print( Output => \$Output );
    $Output = '';

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # get possible deployment state list for config items to be shown
    my $StateList = $Self->{GeneralCatalogObject}->ItemList(
        Class       => 'ITSM::ConfigItem::DeploymentState',
        Preferences => {
            Functionality => [ 'preproductive', 'productive' ],
        },
    );

    # set the deployment state IDs parameter for the search
    my $DelpStateIDs;
    for my $DeplStateKey ( keys %{$StateList} ) {
        push @{$DelpStateIDs}, $DeplStateKey;
    }

    # to store the default class
    my $ClassIDAuto = '';

    # to store the NavBar filters
    my %Filters;

    # define position of the filter in the frontend
    my $PrioCounter = 1000;

    # to store the total number of config items in all classes that the user has access
    my $TotalCount;

    # to store all the clases that the user has access, used in search for filter 'All'
    my $AccessClassList;

    CLASSID:
    for my $ClassID ( sort { ${$ClassList}{$a} cmp ${$ClassList}{$b} } keys %{$ClassList} ) {

        # show menu link only if user has access rights
        my $HasAccess = $Self->{ConfigItemObject}->Permission(
            Scope   => 'Class',
            ClassID => $ClassID,
            UserID  => $Self->{UserID},
            Type    => $Self->{Config}->{Permission},
        );

        next CLASSID if !$HasAccess;

        # insert this class to be passed as searh paramter for filter 'All'
        push @{$AccessClassList}, $ClassID;

        # count all records of this class
        my $ClassCount = $Self->{ConfigItemObject}->ConfigItemCount(
            ClassID => $ClassID,
        );

        # add the config items number in this class to the total
        $TotalCount += $ClassCount;

        # increase the PrioCounter
        $PrioCounter++;

        # add filter with params for the search method
        $Filters{$ClassID} = {
            Name   => $ClassList->{$ClassID},
            Prio   => $PrioCounter,
            Count  => $ClassCount,
            Search => {
                ClassIDs         => [$ClassID],
                DeplStateIDs     => $DelpStateIDs,
                OrderBy          => \@SortByArray,
                OrderByDirection => \@OrderByArray,
                Limit            => 1000,
            },
        };

        # remember the first class id to show this in the overview
        # if no class id was given
        if ( !$ClassIDAuto ) {
            $ClassIDAuto = $ClassID;
        }
    }

    # if only one filter exists
    if ( scalar keys %Filters == 1 ) {

        # get the name of the only filter
        my ($FilterName) = keys %Filters;

        # activate this filter
        $Self->{Filter} = $FilterName;
    }
    else {

        # add default filter, which shows all items
        $Filters{All} = {
            Name   => 'All',
            Prio   => 1000,
            Count  => $TotalCount,
            Search => {
                ClassIDs         => $AccessClassList,
                DeplStateIDs     => $DelpStateIDs,
                OrderBy          => \@SortByArray,
                OrderByDirection => \@OrderByArray,
                Limit            => 1000,
            },
        };

        # if no filter was selected activate the filter for the default class
        if ( !$Self->{Filter} ) {
            $Self->{Filter} = $ClassIDAuto;
        }
    }

    # check if filter is valid
    if ( !$Filters{ $Self->{Filter} } ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'No access to Class is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # display all navbar filters
    my %NavBarFilter;
    for my $Filter ( keys %Filters ) {

        # display the navbar filter
        $NavBarFilter{ $Filters{$Filter}->{Prio} } = {
            Filter => $Filter,
            %{ $Filters{$Filter} },
        };
    }

    # search config items which match the selected filter
    my $ConfigItemIDs = $Self->{ConfigItemObject}->ConfigItemSearchExtended(
        %{ $Filters{ $Self->{Filter} }->{Search} },
    );

    # find out which columns should be shown
    my @ShowColumns;
    if ( $Self->{Config}->{ShowColumns} ) {

        # get all possible columns from config
        my %PossibleColumn = %{ $Self->{Config}->{ShowColumns} };

        # show column "Class" if filter 'All' is selected
        if ( $Self->{Filter} eq 'All' ) {
            $PossibleColumn{Class} = '1';
        }

        # get the column names that should be shown
        COLUMNNAME:
        for my $Name ( keys %PossibleColumn ) {
            next COLUMNNAME if !$PossibleColumn{$Name};
            push @ShowColumns, $Name;
        }
    }

    # show the list
    my $LinkPage =
        'Filter=' . $Self->{LayoutObject}->Ascii2Html( Text => $Self->{Filter} )
        . ';View=' . $Self->{LayoutObject}->Ascii2Html( Text => $Self->{View} )
        . ';SortBy=' . $Self->{LayoutObject}->Ascii2Html( Text => $SortBy )
        . ';OrderBy=' . $Self->{LayoutObject}->Ascii2Html( Text => $OrderBy )
        . ';';
    my $LinkSort =
        'Filter=' . $Self->{LayoutObject}->Ascii2Html( Text => $Self->{Filter} )
        . ';View=' . $Self->{LayoutObject}->Ascii2Html( Text => $Self->{View} )
        . ';';
    my $LinkFilter =
        'SortBy=' . $Self->{LayoutObject}->Ascii2Html( Text => $SortBy )
        . ';OrderBy=' . $Self->{LayoutObject}->Ascii2Html( Text => $OrderBy )
        . ';View=' . $Self->{LayoutObject}->Ascii2Html( Text => $Self->{View} )
        . ';';

    # show config item list
    $Output .= $Self->{LayoutObject}->ITSMConfigItemListShow(
        ConfigItemIDs => $ConfigItemIDs,
        Total         => scalar @{$ConfigItemIDs},

        View => $Self->{View},

        Filter     => $Self->{Filter},
        Filters    => \%NavBarFilter,
        FilterLink => $LinkFilter,

        TitleName => $Self->{LayoutObject}->{LanguageObject}->Get('Overview')
            . ': ' . $Self->{LayoutObject}->{LanguageObject}->Get('ITSM ConfigItem'),

        TitleValue => $Filters{ $Self->{Filter} }->{Name},

        Env      => $Self,
        LinkPage => $LinkPage,
        LinkSort => $LinkSort,

        ShowColumns => \@ShowColumns,
        SortBy      => $Self->{LayoutObject}->Ascii2Html( Text => $SortBy ),
        OrderBy     => $Self->{LayoutObject}->Ascii2Html( Text => $OrderBy ),
    );

    # add footer
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
