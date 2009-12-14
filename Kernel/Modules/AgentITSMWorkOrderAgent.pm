# --
# Kernel/Modules/AgentITSMWorkOrderAgent.pm - the OTRS::ITSM::ChangeManagement workorder agent edit module
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: AgentITSMWorkOrderAgent.pm,v 1.27 2009/12/14 20:42:26 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMWorkOrderAgent;

use strict;
use warnings;

use Kernel::System::Group;
use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMWorkOrder;
use Kernel::System::User;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.27 $) [1];

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
    $Self->{ChangeObject}    = Kernel::System::ITSMChange->new(%Param);
    $Self->{WorkOrderObject} = Kernel::System::ITSMChange::ITSMWorkOrder->new(%Param);
    $Self->{UserObject}      = Kernel::System::User->new(%Param);
    $Self->{GroupObject}     = Kernel::System::Group->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMWorkOrder::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get needed WorkOrderID
    my $WorkOrderID = $Self->{ParamObject}->GetParam( Param => 'WorkOrderID' );

    # check needed stuff
    if ( !$WorkOrderID ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'No WorkOrderID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # get workorder data
    my $WorkOrder = $Self->{WorkOrderObject}->WorkOrderGet(
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # check error
    if ( !$WorkOrder ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "WorkOrder $WorkOrderID not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # check permissions
    my $Access = $Self->{ChangeObject}->Permission(
        Type     => $Self->{Config}->{Permission},
        ChangeID => $WorkOrder->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $Self->{LayoutObject}->NoPermission(
            Message    => "You need $Self->{Config}->{Permission} permissions on the change!",
            WithHeader => 'yes',
        );
    }

    # store all needed parameters in %GetParam to make it reloadable
    # ExpandUserName1: find out whether 'Search User' was clicked
    # ExpandUserName2: find out whether 'Take this User' was clicked
    # ClearUser: find out whether 'Clear User' was clicked
    my %GetParam;
    for my $ParamName (qw(User ExpandUserName1 ExpandUserName2 SelectedUser ClearUser)) {
        $GetParam{$ParamName} = $Self->{ParamObject}->GetParam( Param => $ParamName );
    }

    # the autocompleter seems to add an extra space, the button version does not
    if ( $GetParam{User} ) {
        $GetParam{User} =~ s{ \s+ \z }{}xms;
    }

    # $DoNotSave implies that the user should not be saved as workorder agent
    my $DoNotSave = $GetParam{ExpandUserName1}
        || $GetParam{ExpandUserName2}
        || $GetParam{ClearUser}
        || 0;

    # handle the 'Save' subaction
    if ( $Self->{Subaction} eq 'Save' ) {

        # if a workorder agent is selected and no button but the 'Save' button is clicked
        if ( $GetParam{SelectedUser} && !$DoNotSave ) {

            # workorder agent is required for an update
            my %ErrorAllRequired = $Self->_CheckWorkOrderAgent(
                %GetParam,
            );

            # if everything is fine
            if ( !%ErrorAllRequired ) {

                my $CouldUpdateWorkOrder = $Self->{WorkOrderObject}->WorkOrderUpdate(
                    WorkOrderID      => $WorkOrder->{WorkOrderID},
                    WorkOrderAgentID => $GetParam{SelectedUser},
                    UserID           => $Self->{UserID},
                );

                if ($CouldUpdateWorkOrder) {

                    # redirect to zoom mask
                    return $Self->{LayoutObject}->Redirect(
                        OP => "Action=AgentITSMWorkOrderZoom&WorkOrderID=$WorkOrder->{WorkOrderID}",
                    );
                }
                else {

                    # show error message
                    return $Self->{LayoutObject}->ErrorScreen(
                        Message => "Was not able to update WorkOrder $WorkOrder->{WorkOrderID}!",
                        Comment => 'Please contact the admin.',
                    );
                }
            }
            else {
                if ( $ErrorAllRequired{User} ) {
                    $Self->{LayoutObject}->Block(
                        Name => 'InvalidUser',
                    );
                }
            }
        }
        elsif ( !$GetParam{SelectedUser} && !$DoNotSave ) {

            # if no user is given and it is clicked 'Save'
            $Self->{LayoutObject}->Block(
                Name => 'InvalidUser',
            );
        }

        # one of the buttons 'take this user', 'search user', 'clear user' is clicked
        elsif ($DoNotSave) {

            # if 'search user' is clicked
            if ( $GetParam{ExpandUserName1} ) {

                # search agents
                my $Search = $Self->{ParamObject}->GetParam( Param => 'User' ) . '*';
                my %UserFound = $Self->{UserObject}->UserSearch(
                    Search => $Search,
                    Valid  => 1,
                );

                # UserSearch() returns values with a trailing space, get rid of it
                for my $Name ( values %UserFound ) {
                    $Name =~ s/ \s+ $//xms;
                }

                # get group of group itsm-change
                my $GroupID = $Self->{GroupObject}->GroupLookup(
                    Group => 'itsm-change',
                );

                # get members of group
                my %ITSMChangeUsers = $Self->{GroupObject}->GroupMemberList(
                    GroupID => $GroupID,
                    Type    => 'ro',
                    Result  => 'HASH',
                    Cached  => 1,
                );

                # filter the itsm-change users in found users
                my %FilteredUserList;
                CHANGEUSERID:
                for my $ChangeUserID ( keys %ITSMChangeUsers ) {
                    next CHANGEUSERID if !$UserFound{$ChangeUserID};

                    $FilteredUserList{$ChangeUserID} = $UserFound{$ChangeUserID};
                }

                # check if just one customer user exists
                # if just one, fillup CustomerUserID and CustomerID
                my @KeysUserList = keys %FilteredUserList;
                if ( scalar @KeysUserList == 1 ) {
                    $Param{User} = $FilteredUserList{ $KeysUserList[0] };

                    my %UserData = $Self->{UserObject}->GetUserData(
                        UserID => $KeysUserList[0],
                    );

                    if ( $UserData{UserID} ) {
                        $Param{UserID} = $UserData{UserID};
                    }
                }

                # if more the one user exists, show list
                # and clean UserID
                else {

                    $Param{UserID} = '';

                    $Param{UserStrg} = $Self->{LayoutObject}->BuildSelection(
                        Name => 'UserID',
                        Data => \%FilteredUserList,
                    );

                    $Self->{LayoutObject}->Block(
                        Name => 'TakeUser',
                    );

                    # clear to if there is no customer found
                    if ( !%FilteredUserList ) {
                        $Param{User}   = '';
                        $Param{UserID} = '';
                    }
                }
            }

            # 'take this user' button is clicked
            elsif ( $GetParam{ExpandUserName2} ) {

                # show user data
                my $UserID = $Self->{ParamObject}->GetParam( Param => 'UserID' );
                my %UserData = $Self->{UserObject}->GetUserData(
                    UserID => $UserID,
                );

                # an appropriate user is found fill the textfield
                if (%UserData) {
                    $Param{UserID} = $UserID;
                    $Param{User}   = sprintf '%s %s %s',
                        $UserData{UserLogin},
                        $UserData{UserFirstname},
                        $UserData{UserLastname};
                }
            }
        }
    }

    # show current workorder agent
    if ( !$DoNotSave && $WorkOrder->{WorkOrderAgentID} ) {
        my %UserData = $Self->{UserObject}->GetUserData(
            UserID => $WorkOrder->{WorkOrderAgentID},
        );

        $Param{UserID} = $UserData{UserID};
        $Param{User}   = sprintf '%s %s %s',
            $UserData{UserLogin},
            $UserData{UserFirstname},
            $UserData{UserLastname};
    }

    # get change that workorder belongs to
    my $Change = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $WorkOrder->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # check error
    if ( !$Change ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Could not find Change for WorkOrder $WorkOrderID!",
            Comment => 'Please contact the admin.',
        );
    }

    # build user search autocomplete field
    my $AutoCompleteConfig
        = $Self->{ConfigObject}->Get('ITSMChange::Frontend::UserSearchAutoComplete');

    # if autocompletion is turned on
    if ( $AutoCompleteConfig->{Active} ) {

        # show javascript parts for autocompletion
        $Self->{LayoutObject}->Block(
            Name => 'UserSearchAutoComplete',
        );
        $Self->{LayoutObject}->Block(
            Name => 'UserSearchAutoCompleteCode',
            Data => {
                minQueryLength      => $AutoCompleteConfig->{MinQueryLength}      || 2,
                queryDelay          => $AutoCompleteConfig->{QueryDelay}          || 0.1,
                typeAhead           => $AutoCompleteConfig->{TypeAhead}           || 'false',
                maxResultsDisplayed => $AutoCompleteConfig->{MaxResultsDisplayed} || 20,
            },
        );
        $Self->{LayoutObject}->Block(
            Name => 'UserSearchAutoCompleteReturnElements',
            Data => {},
        );

        # show html part for autocompletion
        $Self->{LayoutObject}->Block(
            Name => 'UserSearchAutoCompleteDivStart',
        );
        $Self->{LayoutObject}->Block(
            Name => 'UserSearchAutoCompleteDivEnd',
        );
    }
    else {

        # show buttons when autocompletion is turned off
        $Self->{LayoutObject}->Block(
            Name => 'SearchUserButton',
        );
    }

    # output header
    my $Output = $Self->{LayoutObject}->Header(
        Title => $WorkOrder->{WorkOrderTitle},
    );
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # start template output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMWorkOrderAgent',
        Data         => {
            %Param,
            %{$Change},
            %{$WorkOrder},
        },
    );

    # add footer
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

sub _CheckWorkOrderAgent {
    my ( $Self, %Param ) = @_;

    # hash for error info
    my %Errors;

    # check change manager
    if ( !$Param{User} || !$Param{SelectedUser} ) {
        $Errors{User} = 1;
    }
    else {

        # get changemanager data
        my %User = $Self->{UserObject}->GetUserData(
            UserID => $Param{SelectedUser},
        );

        # show error if user not exists
        if ( !%User ) {
            $Errors{User} = 1;
        }
        else {

            # compare input value with user data
            my $CheckString = sprintf '%s %s %s',
                $User{UserLogin},
                $User{UserFirstname},
                $User{UserLastname};

            # show error
            if ( $CheckString ne $Param{User} ) {
                $Errors{User} = 1;
            }
        }
    }

    return %Errors
}

1;
