# --
# Kernel/Modules/AgentITSMChangeZoom.pm - the OTRS::ITSM::ChangeManagement change zoom module
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: AgentITSMChangeZoom.pm,v 1.44 2009/12/30 13:43:34 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeZoom;

use strict;
use warnings;

use Kernel::System::LinkObject;
use Kernel::System::CustomerUser;
use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMWorkOrder;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.44 $) [1];

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

    # create needed objects
    $Self->{LinkObject}         = Kernel::System::LinkObject->new(%Param);
    $Self->{CustomerUserObject} = Kernel::System::CustomerUser->new(%Param);
    $Self->{ChangeObject}       = Kernel::System::ITSMChange->new(%Param);
    $Self->{WorkOrderObject}    = Kernel::System::ITSMChange::ITSMWorkOrder->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMChange::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get params
    my $ChangeID = $Self->{ParamObject}->GetParam( Param => "ChangeID" );

    # check needed stuff
    if ( !$ChangeID ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'No ChangeID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # check permissions
    my $Access = $Self->{ChangeObject}->Permission(
        Type     => $Self->{Config}->{Permission},
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # error screen, don't show change zoom
    if ( !$Access ) {
        return $Self->{LayoutObject}->NoPermission(
            Message    => "You need $Self->{Config}->{Permission} permissions!",
            WithHeader => 'yes',
        );
    }

    # get Change
    my $Change = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # check error
    if ( !$Change ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Change $ChangeID not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # handle DownloadAttachment
    if ( $Self->{Subaction} eq 'DownloadAttachment' ) {

        # get data for attachment
        my $FileID = $Self->{ParamObject}->GetParam( Param => 'FileID' );
        my $AttachmentData = $Self->{ChangeObject}->ChangeAttachmentGet(
            FileID => $FileID,
        );

        # return error if file does not exist
        if ( !$AttachmentData ) {
            $Self->{LogObject}->Log(
                Message  => "No such attachment ($FileID)! May be an attack!!!",
                Priority => 'error',
            );
            return $Self->{LayoutObject}->ErrorScreen();
        }

        return $Self->{LayoutObject}->Attachment(
            %{$AttachmentData},
            Type => 'attachment',
        );
    }

    # Store LastScreenView, for backlinks from change specific pages
    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenView',
        Value     => $Self->{RequestedURL},
    );

    # Store LastScreenOverview, for backlinks from linked tickets
    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenOverview',
        Value     => $Self->{RequestedURL},
    );

    # Store LastScreenWorkOrders, for backlinks from ITSMWorkOrderZoom
    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenWorkOrders',
        Value     => $Self->{RequestedURL},
    );

    # run change menu modules
    if ( ref $Self->{ConfigObject}->Get('ITSMChange::Frontend::MenuModule') eq 'HASH' ) {

        # get items for menu
        my %Menus   = %{ $Self->{ConfigObject}->Get('ITSMChange::Frontend::MenuModule') };
        my $Counter = 0;

        for my $Menu ( sort keys %Menus ) {

            # load module
            if ( $Self->{MainObject}->Require( $Menus{$Menu}->{Module} ) ) {
                my $Object = $Menus{$Menu}->{Module}->new(
                    %{$Self},
                    ChangeID => $Self->{ChangeID},
                );

                # run module
                $Counter = $Object->Run(
                    %Param,
                    Change  => $Change,
                    Counter => $Counter,
                    Config  => $Menus{$Menu},
                );
            }
            else {
                return $Self->{LayoutObject}->FatalError();
            }
        }
    }

    # break Description after 80 chars
    if ( $Change->{Description} ) {
        $Change->{Description} =~ s{ ( \S{80} ) }{$1\n}xmsg;
    }

    # break Justification after 80 chars
    if ( $Change->{Justification} ) {
        $Change->{Justification} =~ s{ ( \S{80} ) }{$1\n}xmsg;
    }

    # output header
    my $Output = $Self->{LayoutObject}->Header(
        Value => $Change->{ChangeTitle},
    );
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # build workorder graph in layout object
    my $WorkOrderGraph = $Self->{LayoutObject}->ITSMChangeBuildWorkOrderGraph(
        Change          => $Change,
        WorkOrderObject => $Self->{WorkOrderObject},
    );

    # display graph within an own block
    $Self->{LayoutObject}->Block(
        Name => 'WorkOrderGraph',
        Data => {
            WorkOrderGraph => $WorkOrderGraph,
        },
    );

    # get change builder data
    my %ChangeBuilderUser = $Self->{UserObject}->GetUserData(
        UserID => $Change->{ChangeBuilderID},
        Cached => 1,
    );

    # get create user data
    my %CreateUser = $Self->{UserObject}->GetUserData(
        UserID => $Change->{CreateBy},
        Cached => 1,
    );

    # get change user data
    my %ChangeUser = $Self->{UserObject}->GetUserData(
        UserID => $Change->{ChangeBy},
        Cached => 1,
    );

    # all postfixes needed for user information
    my @Postfixes = qw(UserLogin UserFirstname UserLastname);

    # get user information for ChangeBuilder, CreateBy, ChangeBy
    for my $Postfix (@Postfixes) {
        $Change->{ 'ChangeBuilder' . $Postfix } = $ChangeBuilderUser{$Postfix};
        $Change->{ 'Create' . $Postfix }        = $CreateUser{$Postfix};
        $Change->{ 'Change' . $Postfix }        = $ChangeUser{$Postfix};
    }

    # output meta block
    $Self->{LayoutObject}->Block(
        Name => 'Meta',
        Data => {
            %{$Change},
        },
    );

    # show values or dash ('-')
    my @AdditionalBlockNames;
    if ( $Self->{Config}->{RequestedTime} ) {
        push @AdditionalBlockNames, 'RequestedTime';
    }
    for my $BlockName (
        @AdditionalBlockNames, qw(PlannedStartTime PlannedEndTime ActualStartTime
        ActualEndTime PlannedEffort AccountedTime)
        )
    {
        if ( $Change->{$BlockName} ) {
            $Self->{LayoutObject}->Block(
                Name => $BlockName,
                Data => {
                    $BlockName => $Change->{$BlockName},
                },
            );
        }
        else {
            $Self->{LayoutObject}->Block(
                Name => 'Empty' . $BlockName,
            );
        }
    }

    # show CIP
    for my $Type (qw(Category Impact Priority)) {
        $Self->{LayoutObject}->Block(
            Name => $Type,
            Data => { %{$Change} },
        );
    }

    # get change manager data
    my %ChangeManagerUser;
    if ( $Change->{ChangeManagerID} ) {

        # get change manager data
        %ChangeManagerUser = $Self->{UserObject}->GetUserData(
            UserID => $Change->{ChangeManagerID},
            Cached => 1,
        );
    }

    # get change manager information
    for my $Postfix (qw(UserLogin UserFirstname UserLastname)) {
        $Change->{ 'ChangeManager' . $Postfix } = $ChangeManagerUser{$Postfix} || '';
    }

    # output change manager block
    if (%ChangeManagerUser) {

        # show name and mail address if user exists
        $Self->{LayoutObject}->Block(
            Name => 'ChangeManager',
            Data => {
                %{$Change},
            },
        );
    }
    else {

        # show dash if no change manager exists
        $Self->{LayoutObject}->Block(
            Name => 'EmptyChangeManager',
            Data => {},
        );
    }

    # show CAB block when there is a CAB
    if ( @{ $Change->{CABAgents} } || @{ $Change->{CABCustomers} } ) {

        # output CAB block
        $Self->{LayoutObject}->Block(
            Name => 'CAB',
            Data => {
                %{$Change},
            },
        );

        # build and output CAB agents
        CABAGENT:
        for my $CABAgent ( @{ $Change->{CABAgents} } ) {
            next CABAGENT if !$CABAgent;

            my %CABAgentUserData = $Self->{UserObject}->GetUserData(
                UserID => $CABAgent,
                Cache  => 1,
            );

            next CABAGENT if !%CABAgentUserData;

            # build content for agent block
            my %CABAgentData;
            for my $Postfix (@Postfixes) {
                $CABAgentData{ 'CABAgent' . $Postfix } = $CABAgentUserData{$Postfix};
            }

            # output agent block
            $Self->{LayoutObject}->Block(
                Name => 'CABAgent',
                Data => {
                    %CABAgentData,
                },
            );
        }

        #build and output CAB customers
        CABCUSTOMER:
        for my $CABCustomer ( @{ $Change->{CABCustomers} } ) {
            next CABCUSTOMER if !$CABCustomer;

            my %CABCustomerUserData = $Self->{CustomerUserObject}->CustomerUserDataGet(
                User => $CABCustomer,
            );

            next CABCUSTOMER if !%CABCustomerUserData;

            # build content for CAB customer block
            my %CABCustomerData;
            for my $Postfix (@Postfixes) {
                $CABCustomerData{ 'CABCustomer' . $Postfix } = $CABCustomerUserData{$Postfix};
            }

            # output CAB customer block
            $Self->{LayoutObject}->Block(
                Name => 'CABCustomer',
                Data => {
                    %CABCustomerData,
                },
            );
        }
    }

    # show dash when no CAB exists
    else {
        $Self->{LayoutObject}->Block(
            Name => 'EmptyCAB',
        );
    }

    # get linked objects which are directly linked with this change object
    my $LinkListWithData = $Self->{LinkObject}->LinkListWithData(
        Object => 'ITSMChange',
        Key    => $ChangeID,
        State  => 'Valid',
        UserID => $Self->{UserID},
    );

    # get change initiators (customer users of linked tickets)
    my $TicketsRef = $LinkListWithData->{Ticket} || {};
    my %ChangeInitiatorsID;
    for my $LinkType ( keys %{$TicketsRef} ) {

        my $TicketRef = $TicketsRef->{$LinkType}->{Source};
        for my $TicketID ( keys %{$TicketRef} ) {

            # get id of customer user
            my $CustomerUserID = $TicketRef->{$TicketID}->{CustomerUserID};

            # if a customer
            if ($CustomerUserID) {
                $ChangeInitiatorsID{$CustomerUserID} = 'CustomerUser';
            }
            else {
                my $OwnerID = $TicketRef->{$TicketID}->{OwnerID};
                $ChangeInitiatorsID{$OwnerID} = 'User';
            }
        }
    }

    # get change initiators info
    if ( keys %ChangeInitiatorsID ) {
        $Self->{LayoutObject}->Block(
            Name => 'ChangeInitiatorExists',
        );
    }

    my $ChangeInitiators = '';
    for my $UserID ( keys %ChangeInitiatorsID ) {
        my %User;

        # get customer user info if CI is a customer user
        if ( $ChangeInitiatorsID{$UserID} eq 'CustomerUser' ) {
            %User = $Self->{CustomerUserObject}->CustomerUserDataGet(
                User => $UserID,
            );
        }

        # otherwise get user info
        else {
            %User = $Self->{UserObject}->GetUserData(
                UserID => $UserID,
            );
        }

        # if user info exist
        if (%User) {
            $Self->{LayoutObject}->Block(
                Name => 'ChangeInitiator',
                Data => {%User},
            );

            $ChangeInitiators .= sprintf "%s (%s %s)",
                $User{UserLogin},
                $User{UserFirstname},
                $User{UserLastname};
        }
    }

    # show dash if no change initiator exists
    if ( !$ChangeInitiators ) {
        $Self->{LayoutObject}->Block(
            Name => 'EmptyChangeInitiators',
        );
    }

    # display a string with all changeinitiators
    $Change->{'Change Initators'} = $ChangeInitiators;

    # store the combined linked objects from all workorders of this change
    my $LinkListWithDataCombinedWorkOrders = {};
    for my $WorkOrderID ( @{ $Change->{WorkOrderIDs} } ) {

        # get linked objects of this workorder
        my $LinkListWithDataWorkOrder = $Self->{LinkObject}->LinkListWithData(
            Object => 'ITSMWorkOrder',
            Key    => $WorkOrderID,
            State  => 'Valid',
            UserID => $Self->{UserID},
        );

        OBJECT:
        for my $Object ( keys %{$LinkListWithDataWorkOrder} ) {

            # only show linked services and config items of workorder
            next OBJECT if ( $Object ne 'Service' && $Object ne 'ITSMConfigItem' );

            LINKTYPE:
            for my $LinkType ( keys %{ $LinkListWithDataWorkOrder->{$Object} } ) {

                DIRECTION:
                for my $Direction ( keys %{ $LinkListWithDataWorkOrder->{$Object}->{$LinkType} } ) {

                    ID:
                    for my $ID (
                        keys %{ $LinkListWithDataWorkOrder->{$Object}->{$LinkType}->{$Direction} }
                        )
                    {

                        # combine the linked object data from all workorders
                        $LinkListWithDataCombinedWorkOrders->{$Object}->{$LinkType}->{$Direction}
                            ->{$ID}
                            = $LinkListWithDataWorkOrder->{$Object}->{$LinkType}->{$Direction}
                            ->{$ID};
                    }
                }
            }
        }
    }

    # add combined linked objects from workorder to linked objects from change object
    $LinkListWithData = {
        %{$LinkListWithData},
        %{$LinkListWithDataCombinedWorkOrders},
    };

    # get link table view mode
    my $LinkTableViewMode = $Self->{ConfigObject}->Get('LinkObject::ViewMode');

    # create the link table
    my $LinkTableStrg = $Self->{LayoutObject}->LinkObjectTableCreate(
        LinkListWithData => $LinkListWithData,
        ViewMode         => $LinkTableViewMode,
    );

    # output the link table
    if ($LinkTableStrg) {
        $Self->{LayoutObject}->Block(
            Name => 'LinkTable' . $LinkTableViewMode,
            Data => {
                LinkTableStrg => $LinkTableStrg,
            },
        );
    }

    # show attachments
    my %Attachments = $Self->{ChangeObject}->ChangeAttachmentList(
        ChangeID => $Change->{ChangeID},
    );

    # show attachments
    ATTACHMENTID:
    for my $AttachmentID ( keys %Attachments ) {

        # get info about file
        my $AttachmentData = $Self->{ChangeObject}->ChangeAttachmentGet(
            FileID => $AttachmentID,
        );

        # check for attachment information
        next ATTACHMENTID if !$AttachmentData;

        # show block
        $Self->{LayoutObject}->Block(
            Name => 'AttachmentRow',
            Data => {
                %{$Change},
                %{$AttachmentData},
            },
        );
    }

    # start template output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMChangeZoom',
        Data         => {
            %{$Change},
        },
    );

    # add footer
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
