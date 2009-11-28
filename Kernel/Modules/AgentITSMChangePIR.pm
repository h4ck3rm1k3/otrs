# --
# Kernel/Modules/AgentITSMChangePIR.pm - the OTRS::ITSM::ChangeManagement PIR overview module
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: AgentITSMChangePIR.pm,v 1.3 2009/11/28 09:36:23 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangePIR;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMWorkOrder;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ParamObject DBObject LayoutObject LogObject ConfigObject UserObject)) {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }

    # create needed objects
    $Self->{ChangeObject}    = Kernel::System::ITSMChange->new(%Param);
    $Self->{WorkOrderObject} = Kernel::System::ITSMChange::ITSMWorkOrder->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMChange::Frontend::$Self->{Action}");

    # get filter and view params
    $Self->{Filter} = $Self->{ParamObject}->GetParam( Param => 'Filter' ) || 'All';
    $Self->{View}   = $Self->{ParamObject}->GetParam( Param => 'View' )   || '';

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check permissions
    my $Access = $Self->{ChangeObject}->Permission(
        Type   => $Self->{Config}->{Permission},
        UserID => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $Self->{LayoutObject}->NoPermission(
            Message    => "You need $Self->{Config}->{Permission} permissions!",
            WithHeader => 'yes',
        );
    }

    # store last screen, used for backlinks
    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenChanges',
        Value     => $Self->{RequestedURL},
    );

    # get sorting parameters
    my $SortBy = $Self->{ParamObject}->GetParam( Param => 'SortBy' )
        || $Self->{Config}->{'SortBy::Default'}
        || 'PlannedStartTime';

    # get ordering parameters
    my $OrderBy = $Self->{ParamObject}->GetParam( Param => 'OrderBy' )
        || $Self->{Config}->{'Order::Default'}
        || 'Up';

    my @SortByArray  = ($SortBy);
    my @OrderByArray = ($OrderBy);

    # sort by change number first if user wants to sort by workorder number
    if ( $SortBy eq 'WorkOrderNumber' ) {
        @SortByArray = ( 'ChangeNumber', 'WorkOrderNumber' );
        @OrderByArray = ( $OrderBy, $OrderBy );
    }

    # investigate refresh
    my $Refresh = $Self->{UserRefreshTime} ? 60 * $Self->{UserRefreshTime} : undef;

    # starting with page ...
    my $Output = $Self->{LayoutObject}->Header( Refresh => $Refresh );
    $Output .= $Self->{LayoutObject}->NavigationBar();
    $Self->{LayoutObject}->Print( Output => \$Output );
    $Output = '';

    # find out which columns should be shown
    my @ShowColumns;
    if ( $Self->{Config}->{ShowColumns} ) {

        # get all possible columns from config
        my %PossibleColumn = %{ $Self->{Config}->{ShowColumns} };

        # get the column names that should be shown
        COLUMNNAME:
        for my $Name ( keys %PossibleColumn ) {
            next COLUMNNAME if !$PossibleColumn{$Name};
            push @ShowColumns, $Name;
        }
    }

    # find out which workorder types should be used to show PIR
    my @WorkOrderTypes;
    if ( $Self->{Config}->{WorkOrderTypes} ) {
        WORKORDERTYPE:
        for my $WorkOrderType ( @{ $Self->{Config}->{WorkOrderTypes} } ) {

            # check if workorder type is valid by looking up the type id
            my $WorkOrderTypeID = $Self->{WorkOrderObject}->WorkOrderTypeLookup(
                WorkOrderType => $WorkOrderType,
            );

            # do not use invalid workorder types
            next WORKORDERTYPE if !$WorkOrderTypeID;

            push @WorkOrderTypes, $WorkOrderType;
        }
    }

    # set default search filter
    my %Filters = (
        All => {
            Name   => 'All',
            Prio   => 1000,
            Search => {
                WorkOrderTypes   => \@WorkOrderTypes,
                OrderBy          => \@SortByArray,
                OrderByDirection => \@OrderByArray,
                Limit            => 1000,
                UserID           => $Self->{UserID},
            },
        },
    );

    # set other filters based on workorder state
    if ( $Self->{Config}->{'Filter::WorkOrderStates'} ) {

        # define position of the filter in the frontend
        my $PrioCounter = 1000;

        # get all workorder states that should be used as filters
        WORKORDERSTATE:
        for my $WorkOrderState ( @{ $Self->{Config}->{'Filter::WorkOrderStates'} } ) {

            # do not use empty workorder states
            next WORKORDERSTATE if !$WorkOrderState;

            # check if state is valid by looking up the state id
            my $WorkOrderStateID = $Self->{WorkOrderObject}->WorkOrderStateLookup(
                WorkOrderState => $WorkOrderState,
            );

            # do not use invalid workorder states
            next WORKORDERSTATE if !$WorkOrderStateID;

            # increase the PrioCounter
            $PrioCounter++;

            # add filter for the current workorder state
            $Filters{$WorkOrderState} = {
                Name   => $WorkOrderState,
                Prio   => $PrioCounter,
                Search => {
                    WorkOrderTypes   => \@WorkOrderTypes,
                    WorkOrderStates  => [$WorkOrderState],
                    OrderBy          => \@SortByArray,
                    OrderByDirection => \@OrderByArray,
                    Limit            => 1000,
                    UserID           => $Self->{UserID},
                },
            };
        }
    }

    # check if filter is valid
    if ( !$Filters{ $Self->{Filter} } ) {
        $Self->{LayoutObject}->FatalError( Message => "Invalid Filter: $Self->{Filter}!" );
    }

    # search workorders which match the selected filter
    my $WorkOrderIDsRef = $Self->{WorkOrderObject}->WorkOrderSearch(
        %{ $Filters{ $Self->{Filter} }->{Search} },
    );

    # display all navbar filters
    my %NavBarFilter;
    for my $Filter ( keys %Filters ) {

        # count the number of workorders for each filter
        my $Count = $Self->{WorkOrderObject}->WorkOrderSearch(
            %{ $Filters{$Filter}->{Search} },
            Result => 'COUNT',
        );

        # display the navbar filter
        $NavBarFilter{ $Filters{$Filter}->{Prio} } = {
            Count  => $Count,
            Filter => $Filter,
            %{ $Filters{$Filter} },
        };
    }

    # show changes
    my $LinkPage = 'Filter='
        . $Self->{LayoutObject}->Ascii2Html( Text => $Self->{Filter} )
        . '&View=' . $Self->{LayoutObject}->Ascii2Html( Text => $Self->{View} )
        . '&SortBy=' . $Self->{LayoutObject}->Ascii2Html( Text => $SortBy )
        . '&OrderBy=' . $Self->{LayoutObject}->Ascii2Html( Text => $OrderBy )
        . '&';
    my $LinkSort = 'Filter='
        . $Self->{LayoutObject}->Ascii2Html( Text => $Self->{Filter} )
        . '&View=' . $Self->{LayoutObject}->Ascii2Html( Text => $Self->{View} )
        . '&';
    my $LinkFilter = 'SortBy=' . $Self->{LayoutObject}->Ascii2Html( Text => $SortBy )
        . '&OrderBy=' . $Self->{LayoutObject}->Ascii2Html( Text => $OrderBy )
        . '&View=' . $Self->{LayoutObject}->Ascii2Html( Text => $Self->{View} )
        . '&';
    $Output .= $Self->{LayoutObject}->ITSMChangeListShow(

        WorkOrderIDs => $WorkOrderIDsRef,
        Total        => scalar @{$WorkOrderIDsRef},

        View => $Self->{View},

        Filter     => $Self->{Filter},
        Filters    => \%NavBarFilter,
        FilterLink => $LinkFilter,

        TitleName  => 'Overview: PIR',
        TitleValue => $Self->{Filter},

        Env      => $Self,
        LinkPage => $LinkPage,
        LinkSort => $LinkSort,

        ShowColumns => \@ShowColumns,
    );

    $Output .= $Self->{LayoutObject}->Footer();
    return $Output;
}

1;
