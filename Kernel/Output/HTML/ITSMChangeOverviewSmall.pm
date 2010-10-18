# --
# Kernel/Output/HTML/ITSMChangeOverviewSmall.pm.pm
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: ITSMChangeOverviewSmall.pm,v 1.13 2010/10/18 20:25:48 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMChangeOverviewSmall;

use strict;
use warnings;

use Kernel::System::User;
use Kernel::System::LinkObject;
use Kernel::System::Service;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.13 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # get needed objects
    for my $Object (
        qw(ConfigObject LogObject DBObject LayoutObject UserID UserObject MainObject)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    # create needed objects
    $Self->{LinkObject}    = Kernel::System::LinkObject->new(%Param);
    $Self->{ServiceObject} = Kernel::System::Service->new(%Param);

    # when called from the customer interface
    if ( !$Self->{UserObject}->can('GetUserData') ) {

        # workaround for customer interface
        # in the customer interface the UserObject is in fact the CustomerUserObject
        # so we need to correct this here by creating a new UserObject
        $Self->{CustomerUserObject} = $Self->{UserObject};
        $Self->{UserObject}         = Kernel::System::User->new(%Param);
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(PageShown StartHit)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # need ChangeIDs or WorkOrderIDs
    if ( !$Param{ChangeIDs} && !$Param{WorkOrderIDs} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need the ChangeIDs or the WorkOrderIDs!',
        );
        return;
    }

    # only one of ChangeIDs or WorkOrderIDs can be used
    if ( $Param{ChangeIDs} && $Param{WorkOrderIDs} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need either the ChangeIDs or the WorkOrderIDs, not both!',
        );
        return;
    }

    # in the customer frontend
    my %CustomerUserServices;
    if ( $Param{Frontend} eq 'Customer' && $Self->{Config}->{ShowOnlyChangesWithAllowedServices} ) {

        # get all services the customer user is allowed to use
        %CustomerUserServices = $Self->{ServiceObject}->CustomerUserServiceMemberList(
            CustomerUserLogin => $Self->{UserID},
            Result            => 'HASH',
            DefaultServices   => 1,
        );
    }

    # define incident signals, needed for services
    my %InciSignals = (
        operational => 'greenled',
        warning     => 'yellowled',
        incident    => 'redled',
    );

    # store either the ChangeIDs or the WorkOrderIDs
    my @IDs;
    if ( $Param{ChangeIDs} && ref $Param{ChangeIDs} eq 'ARRAY' ) {
        @IDs = @{ $Param{ChangeIDs} };
    }
    elsif ( $Param{WorkOrderIDs} && ref $Param{WorkOrderIDs} eq 'ARRAY' ) {
        @IDs = @{ $Param{WorkOrderIDs} };
    }

    # check ShowColumns parameter
    my @ShowColumns;
    if ( $Param{ShowColumns} && ref $Param{ShowColumns} eq 'ARRAY' ) {
        @ShowColumns = @{ $Param{ShowColumns} };
    }

    # build column header blocks
    if (@ShowColumns) {
        for my $Column (@ShowColumns) {

            # create needed veriables
            my $CSS = '';
            my $OrderBy;

            # remove ID if necesary
            if ( $Param{SortBy} ) {
                $Param{SortBy} = ( $Param{SortBy} eq 'PriorityID' )
                    ? 'Priority'
                    : ( $Param{SortBy} eq 'CategoryID' )       ? 'Category'
                    : ( $Param{SortBy} eq 'ChangeBuilderID' )  ? 'ChangeBuilder'
                    : ( $Param{SortBy} eq 'ChangeManagerID' )  ? 'ChangeManager'
                    : ( $Param{SortBy} eq 'ChangeStateID' )    ? 'ChangeState'
                    : ( $Param{SortBy} eq 'ImpactID' )         ? 'Impact'
                    : ( $Param{SortBy} eq 'WorkOrderAgentID' ) ? 'WorkOrderAgent'
                    : ( $Param{SortBy} eq 'WorkOrderStateID' ) ? 'WorkOrderState'
                    : ( $Param{SortBy} eq 'WorkOrderTypeID' )  ? 'WorkOrderType'
                    :                                            $Param{SortBy};
            }

            # set the correct Set CSS class and order by link
            if ( $Param{SortBy} && ( $Param{SortBy} eq $Column ) ) {
                if ( $Param{OrderBy} && ( $Param{OrderBy} eq 'Up' ) ) {
                    $OrderBy = 'Down';
                    $CSS .= ' SortDescending';
                }
                else {
                    $OrderBy = 'Up';
                    $CSS .= ' SortAscending';
                }
            }

            $Self->{LayoutObject}->Block(
                Name => 'Record' . $Column . 'Header',
                Data => {
                    %Param,
                    CSS     => $CSS,
                    OrderBy => $OrderBy,
                },
            );
        }
    }

    my $Output   = '';
    my $Counter  = 0;
    my $CssClass = '';
    ID:
    for my $ID (@IDs) {
        $Counter++;
        if ( $Counter >= $Param{StartHit} && $Counter < ( $Param{PageShown} + $Param{StartHit} ) ) {

            # to store all data
            my %Data;

            # to store data of sub-elements
            my %SubElementData;

            my $ChangeID;
            if ( $Param{ChangeIDs} ) {

                # set change id
                $ChangeID = $ID;
            }
            elsif ( $Param{WorkOrderIDs} ) {

                # get workorder data
                my $WorkOrder = $Self->{WorkOrderObject}->WorkOrderGet(
                    WorkOrderID => $ID,
                    UserID      => $Self->{UserID},
                );

                next ID if !$WorkOrder;

                # add workorder data
                %Data = ( %Data, %{$WorkOrder} );

                # set change id from workorder data
                $ChangeID = $WorkOrder->{ChangeID};
            }

            # get change data
            my $Change = $Self->{ChangeObject}->ChangeGet(
                UserID   => $Self->{UserID},
                ChangeID => $ChangeID,
            );

            next ID if !$Change;

            # add change data,
            # ( let workorder data overwrite
            # some change attributes, i.e. PlannedStartTime, etc... )
            %Data = ( %{$Change}, %Data );

            # get user data for needed user types
            USER_TYPE:
            for my $UserType (qw(ChangeBuilder ChangeManager WorkOrderAgent)) {

                # check if UserType attribute exists either in change or workorder
                if ( !$Change->{ $UserType . 'ID' } && !$Data{ $UserType . 'ID' } ) {
                    next USER_TYPE;
                }

                # get user data
                my %User = $Self->{UserObject}->GetUserData(
                    UserID => $Change->{ $UserType . 'ID' } || $Data{ $UserType . 'ID' },
                    Cached => 1,
                );

                # set user data
                $Data{ $UserType . 'UserLogin' }        = $User{UserLogin};
                $Data{ $UserType . 'UserFirstname' }    = $User{UserFirstname};
                $Data{ $UserType . 'UserLastname' }     = $User{UserLastname};
                $Data{ $UserType . 'LeftParenthesis' }  = '(';
                $Data{ $UserType . 'RightParenthesis' } = ')';
            }

            # to store the linked service data
            my $LinkListWithData = {};

            my @WorkOrderIDs;

            # store the combined linked services data from all workorders of this change
            if ( $Param{ChangeIDs} ) {
                @WorkOrderIDs = @{ $Change->{WorkOrderIDs} };
            }

            # store only the linked services for this workorder
            elsif ( $Param{WorkOrderIDs} ) {
                @WorkOrderIDs = ($ID);
            }

            # store the combined linked services data
            for my $WorkOrderID (@WorkOrderIDs) {

                # get linked objects of this workorder
                my $LinkListWithDataWorkOrder = $Self->{LinkObject}->LinkListWithData(
                    Object => 'ITSMWorkOrder',
                    Key    => $WorkOrderID,
                    State  => 'Valid',
                    UserID => $Self->{UserID},
                );

                OBJECT:
                for my $Object ( keys %{$LinkListWithDataWorkOrder} ) {

                    # only show linked services of workorder
                    if ( $Object ne 'Service' ) {
                        next OBJECT;
                    }

                    LINKTYPE:
                    for my $LinkType ( keys %{ $LinkListWithDataWorkOrder->{$Object} } ) {

                        DIRECTION:
                        for my $Direction (
                            keys %{ $LinkListWithDataWorkOrder->{$Object}->{$LinkType} }
                            )
                        {

                            ID:
                            for my $ID (
                                keys %{
                                    $LinkListWithDataWorkOrder->{$Object}->{$LinkType}->{$Direction}
                                }
                                )
                            {

                                # combine the linked object data from all workorders
                                $LinkListWithData->{$Object}->{$LinkType}->{$Direction}->{$ID}
                                    = $LinkListWithDataWorkOrder->{$Object}->{$LinkType}
                                    ->{$Direction}->{$ID};
                            }
                        }
                    }
                }
            }

            # get unique service ids
            my %UniqueServiceIDs;
            my $ServicesRef = $LinkListWithData->{Service} || {};
            for my $LinkType ( keys %{$ServicesRef} ) {

                # extract link type List
                my $LinkTypeList = $ServicesRef->{$LinkType};

                for my $Direction ( keys %{$LinkTypeList} ) {

                    # extract direction list
                    my $DirectionList = $ServicesRef->{$LinkType}->{$Direction};

                    # collect unique service ids
                    for my $ServiceID ( keys %{$DirectionList} ) {
                        $UniqueServiceIDs{$ServiceID}++;
                    }
                }
            }

            # get the data for each service
            my @ServicesData;
            SERVICEID:
            for my $ServiceID ( keys %UniqueServiceIDs ) {

                # in the customer frontend
                if (
                    $Param{Frontend} eq 'Customer'
                    && $Self->{Config}->{ShowOnlyChangesWithAllowedServices}
                    )
                {

                    # do not show this service if customer is not allowed to use it
                    next SERVICEID if !$CustomerUserServices{$ServiceID};
                }

                # get service data
                my %ServiceData = $Self->{ServiceObject}->ServiceGet(
                    ServiceID => $ServiceID,
                    UserID    => $Self->{UserID},
                );

                # add current incident signal
                $ServiceData{CurInciSignal} = $InciSignals{ $ServiceData{CurInciStateType} };

                # store service data
                push @ServicesData, \%ServiceData;
            }

            # sort services data by service name
            @ServicesData = sort { $a->{Name} cmp $b->{Name} } @ServicesData;

            # in the customer frontend
            if (
                $Param{Frontend} eq 'Customer'
                && $Self->{Config}->{ShowOnlyChangesWithAllowedServices}
                )
            {

                # do not show the change if it has no services
                next ID if !@ServicesData;
            }

            # store services data
            $SubElementData{Services} = \@ServicesData;

            # set css class of the row
            $CssClass = $CssClass eq 'searchpassive' ? 'searchactive' : 'searchpassive';

            # build record block
            $Self->{LayoutObject}->Block(
                Name => 'Record',
                Data => {
                    %Param,
                    %Data,
                    CssClass => $CssClass,
                },
            );

            # build column record blocks
            if (@ShowColumns) {
                COLUMN:
                for my $Column (@ShowColumns) {
                    $Self->{LayoutObject}->Block(
                        Name => 'Record' . $Column,
                        Data => {
                            %Param,
                            %Data,
                            CssClass => $CssClass,
                        },
                    );

                    # check if this column contains sub-elements
                    if ( $SubElementData{$Column} && ref $SubElementData{$Column} eq 'ARRAY' ) {

                        for my $SubElement ( @{ $SubElementData{$Column} } ) {

                            # show sub-elements of column
                            $Self->{LayoutObject}->Block(
                                Name => 'Record' . $Column . 'SubElement',
                                Data => {
                                    %Param,
                                    %Data,
                                    %{$SubElement},
                                    CssClass => $CssClass,
                                },
                            );
                        }
                    }

                    # do not display columns as links in the customer frontend
                    next COLUMN if $Param{Frontend} eq 'Customer';

                    # show links if available
                    $Self->{LayoutObject}->Block(
                        Name => 'Record' . $Column . 'LinkStart',
                        Data => {
                            %Param,
                            %Data,
                            CssClass => $CssClass,
                        },
                    );
                    $Self->{LayoutObject}->Block(
                        Name => 'Record' . $Column . 'LinkEnd',
                        Data => {
                            %Param,
                            %Data,
                            CssClass => $CssClass,
                        },
                    );
                }
            }
        }
    }

    # use template
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMChangeOverviewSmall',
        Data         => {
            %Param,
            Type        => $Self->{ViewType},
            ColumnCount => scalar @ShowColumns,
        },
    );

    return $Output;
}

1;
