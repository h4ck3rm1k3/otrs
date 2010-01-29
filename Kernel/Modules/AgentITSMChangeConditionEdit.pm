# --
# Kernel/Modules/AgentITSMChangeConditionEdit.pm - the OTRS::ITSM::ChangeManagement condition edit module
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: AgentITSMChangeConditionEdit.pm,v 1.18 2010/01/29 16:54:37 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeConditionEdit;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMCondition;
use Kernel::System::Valid;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.18 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject ParamObject DBObject LayoutObject LogObject)) {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }

    # create needed objects
    $Self->{ChangeObject}    = Kernel::System::ITSMChange->new(%Param);
    $Self->{ConditionObject} = Kernel::System::ITSMChange::ITSMCondition->new(%Param);
    $Self->{ValidObject}     = Kernel::System::Valid->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMChange::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # store needed parameters in %GetParam
    my %GetParam;
    for my $ParamName (
        qw(
        ChangeID ConditionID Name Comment ExpressionConjunction ValidID
        Save AddAction AddExpression NewExpression NewAction ElementChanged UpdateDivName)
        )
    {
        $GetParam{$ParamName} = $Self->{ParamObject}->GetParam( Param => $ParamName );
    }

    # check needed stuff
    for my $Needed (qw(ChangeID ConditionID)) {
        if ( !$GetParam{$Needed} ) {
            $Self->{LayoutObject}->ErrorScreen(
                Message => "No $Needed is given!",
                Comment => 'Please contact the admin.',
            );
            return;
        }
    }

    # check permissions
    my $Access = $Self->{ChangeObject}->Permission(
        Type     => $Self->{Config}->{Permission},
        ChangeID => $GetParam{ChangeID},
        UserID   => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $Self->{LayoutObject}->NoPermission(
            Message    => "You need $Self->{Config}->{Permission} permissions!",
            WithHeader => 'yes',
        );
    }

    # get change data
    my $ChangeData = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $GetParam{ChangeID},
        UserID   => $Self->{UserID},
    );

    # check if change exists
    if ( !$ChangeData ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Change '$GetParam{ChangeID}' not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # get valid list
    my %ValidList = $Self->{ValidObject}->ValidList();

    # get all expression ids for the given condition id
    my $ExpressionIDsRef = $Self->{ConditionObject}->ExpressionList(
        ConditionID => $GetParam{ConditionID},
        UserID      => $Self->{UserID},
    );

    # get all action ids for the given condition id
    my $ActionIDsRef = $Self->{ConditionObject}->ActionList(
        ConditionID => $GetParam{ConditionID},
        UserID      => $Self->{UserID},
    );

    # ---------------------------------------------------------------- #
    # condition save (also add/delete expression and add/delete action)
    # ---------------------------------------------------------------- #
    if ( $Self->{Subaction} eq 'Save' ) {

        # add a new condition
        if ( $GetParam{ConditionID} eq 'NEW' ) {

            # create a new condition
            $GetParam{ConditionID} = $Self->{ConditionObject}->ConditionAdd(
                ChangeID              => $GetParam{ChangeID},
                Name                  => $GetParam{Name},
                ExpressionConjunction => $GetParam{ExpressionConjunction},
                Comment               => $GetParam{Comment},
                ValidID               => $GetParam{ValidID},
                UserID                => $Self->{UserID},
            );

            # check error
            if ( !$GetParam{ConditionID} ) {
                $Self->{LayoutObject}->ErrorScreen(
                    Message => 'Could not create new condition!',
                    Comment => 'Please contact the admin.',
                );
                return;
            }
        }

        # update an existing condition
        else {

            # update the condition
            my $Success = $Self->{ConditionObject}->ConditionUpdate(
                ConditionID           => $GetParam{ConditionID},
                Name                  => $GetParam{Name},
                ExpressionConjunction => $GetParam{ExpressionConjunction},
                Comment               => $GetParam{Comment},
                ValidID               => $GetParam{ValidID},
                UserID                => $Self->{UserID},
            );

            # check error
            if ( !$Success ) {
                $Self->{LayoutObject}->ErrorScreen(
                    Message => "Could not update ConditionID $GetParam{ConditionID}!",
                    Comment => 'Please contact the admin.',
                );
                return;
            }
        }

        # save all existing expression fields
        for my $ExpressionID ( @{$ExpressionIDsRef} ) {

            # get expression fields
            my %ExpressionData;
            for my $Field (qw(ObjectID Selector AttributeID OperatorID CompareValue)) {
                $ExpressionData{$Field} = $Self->{ParamObject}->GetParam(
                    Param => 'ExpressionID::' . $ExpressionID . '::' . $Field,
                );
            }

            # check if existing expression is complete
            # (all required fields must be filled, CompareValue can be empty)
            my $FieldsOk = 1;
            FIELD:
            for my $Field (qw(ObjectID Selector AttributeID OperatorID)) {

                # new expression is not complete
                if ( !$ExpressionData{$Field} ) {
                    $FieldsOk = 0;
                    last FIELD;
                }
            }

            # update existing expression only if all fields are complete
            if ($FieldsOk) {

                # update the expression
                my $Success = $Self->{ConditionObject}->ExpressionUpdate(
                    ExpressionID => $ExpressionID,
                    ObjectID     => $ExpressionData{ObjectID},
                    AttributeID  => $ExpressionData{AttributeID},
                    OperatorID   => $ExpressionData{OperatorID},
                    Selector     => $ExpressionData{Selector},
                    CompareValue => $ExpressionData{CompareValue} || '',
                    UserID       => $Self->{UserID},
                );

                # check error
                if ( !$Success ) {
                    return $Self->{LayoutObject}->ErrorScreen(
                        Message => "Could not update ExpressionID $ExpressionID!",
                        Comment => 'Please contact the admin.',
                    );
                }
            }
        }

        # get new expression fields
        my %ExpressionData;
        for my $Field (qw(ObjectID Selector AttributeID OperatorID CompareValue)) {
            $ExpressionData{$Field} = $Self->{ParamObject}->GetParam(
                Param => 'ExpressionID::NEW::' . $Field,
            );
        }

        # check if new expression is complete
        # (all required fields must be filled, CompareValue can be empty)
        my $FieldsOk = 1;
        FIELD:
        for my $Field (qw(ObjectID Selector AttributeID OperatorID)) {

            # new expression is not complete
            if ( !$ExpressionData{$Field} ) {
                $FieldsOk = 0;
                last FIELD;
            }
        }

        # add new expression
        if ($FieldsOk) {

            # add new expression
            my $ExpressionID = $Self->{ConditionObject}->ExpressionAdd(
                ConditionID  => $GetParam{ConditionID},
                ObjectID     => $ExpressionData{ObjectID},
                AttributeID  => $ExpressionData{AttributeID},
                OperatorID   => $ExpressionData{OperatorID},
                Selector     => $ExpressionData{Selector},
                CompareValue => $ExpressionData{CompareValue} || '',
                UserID       => $Self->{UserID},
            );

            # check error
            if ( !$ExpressionID ) {
                return $Self->{LayoutObject}->ErrorScreen(
                    Message => "Could not add new Expression!",
                    Comment => 'Please contact the admin.',
                );
            }
        }

        # TODO
        # save all existing action fields
        for my $ActionID ( @{$ActionIDsRef} ) {

        }

        # get new action fields
        my %ActionData;
        for my $Field (qw(ObjectID Selector AttributeID OperatorID ActionValue)) {
            $ActionData{$Field} = $Self->{ParamObject}->GetParam(
                Param => 'ActionID::NEW::' . $Field,
            );
        }

        # check if new action is complete
        # (all required fields must be filled, ActionValue can be empty)
        $FieldsOk = 1;
        FIELD:
        for my $Field (qw(ObjectID Selector AttributeID OperatorID)) {

            # new action is not complete
            if ( !$ActionData{$Field} ) {
                $FieldsOk = 0;
                last FIELD;
            }
        }

        # TODO
        # add new action
        if ($FieldsOk) {

            # add new action
            my $ActionID = $Self->{ConditionObject}->ActionAdd(
                ConditionID => $GetParam{ConditionID},
                ObjectID    => $ExpressionData{ObjectID},
                AttributeID => $ExpressionData{AttributeID},
                OperatorID  => $ExpressionData{OperatorID},
                Selector    => $ExpressionData{Selector},
                ActionValue => $ExpressionData{ActionValue} || '',
                UserID      => $Self->{UserID},
            );

            # check error
            if ( !$ActionID ) {
                return $Self->{LayoutObject}->ErrorScreen(
                    Message => "Could not add new Action!",
                    Comment => 'Please contact the admin.',
                );
            }
        }

        # just the save button was pressed, redirect to condition overview
        if ( $GetParam{Save} ) {
            return $Self->{LayoutObject}->Redirect(
                OP => "Action=AgentITSMChangeCondition;ChangeID=$GetParam{ChangeID}",
            );
        }

        # expression add button was pressed
        elsif ( $GetParam{AddExpression} ) {

            # show the edit view again, but now with a new empty expression line
            return $Self->{LayoutObject}->Redirect(
                OP => "Action=AgentITSMChangeConditionEdit;ChangeID=$GetParam{ChangeID};"
                    . "ConditionID=$GetParam{ConditionID};NewExpression=1",
            );
        }

        # action add button was pressed
        elsif ( $GetParam{AddAction} ) {

            # show the edit view again, but now with a new empty action line
            return $Self->{LayoutObject}->Redirect(
                OP => "Action=AgentITSMChangeConditionEdit;ChangeID=$GetParam{ChangeID};"
                    . "ConditionID=$GetParam{ConditionID};NewAction=1",
            );
        }

        # check if an expression should be deleted
        for my $ExpressionID ( @{$ExpressionIDsRef} ) {
            if ( $Self->{ParamObject}->GetParam( Param => 'DeleteExpressionID::' . $ExpressionID ) )
            {

                # delete the expression
                my $Success = $Self->{ConditionObject}->ExpressionDelete(
                    ExpressionID => $ExpressionID,
                    UserID       => $Self->{UserID},
                );

                # check error
                if ( !$Success ) {
                    return $Self->{LayoutObject}->ErrorScreen(
                        Message => "Could not delete ExpressionID $ExpressionID!",
                        Comment => 'Please contact the admin.',
                    );
                }

                # show the edit view again
                return $Self->{LayoutObject}->Redirect(
                    OP => "Action=AgentITSMChangeConditionEdit;ChangeID=$GetParam{ChangeID};"
                        . "ConditionID=$GetParam{ConditionID}",
                );
            }
        }

        # check if an action should be deleted
        for my $ActionID ( @{$ActionIDsRef} ) {

            # TODO
        }

        # show the edit view again
        return $Self->{LayoutObject}->Redirect(
            OP => "Action=AgentITSMChangeConditionEdit;ChangeID=$GetParam{ChangeID};"
                . "ConditionID=$GetParam{ConditionID}",
        );
    }

    # ------------------------------------------------------------ #
    # handle AJAXUpdate (change the content of dropdownlists)
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AJAXUpdate' ) {

        # to store the JSON output
        my $JSON;

        # any expression field was changed
        if ( $GetParam{ElementChanged} =~ m{ \A ExpressionID :: ( \d+ | NEW ) }xms ) {

            # get expression id
            my $ExpressionID = $1;

            # get expression fields
            for my $Field (qw(ObjectID Selector AttributeID OperatorID CompareValue)) {
                $GetParam{$Field} = $Self->{ParamObject}->GetParam(
                    Param => 'ExpressionID::' . $ExpressionID . '::' . $Field,
                );
            }

            # get object selection list
            my $ObjectList = $Self->_GetObjectSelection();

            # get selector selection list
            my $SelectorList = $Self->_GetSelectorSelection(
                ObjectID    => $GetParam{ObjectID},
                ConditionID => $GetParam{ConditionID},
            );

            # get attribute selection list
            my $AttributeList = $Self->_GetAttributeSelection(
                ObjectID => $GetParam{ObjectID},
                Selector => $GetParam{Selector},
            );

            # get operator selection list
            my $OperatorList = $Self->_GetOperatorSelection(
                ObjectID    => $GetParam{ObjectID},
                AttributeID => $GetParam{AttributeID},
            );

            # add an empty selector selection if no list is available or nothing is selected
            my $PossibleNoneSelector = 0;
            if (
                !$SelectorList
                || !ref $SelectorList eq 'HASH'
                || !%{$SelectorList}
                || $GetParam{ElementChanged} eq 'ExpressionID::' . $ExpressionID . '::ObjectID'
                )
            {
                $PossibleNoneSelector = 1;
            }

            # add an empty attribute selection if no list is available or nothing is selected
            my $PossibleNoneAttributeID = 0;
            if (
                !$AttributeList
                || !ref $AttributeList eq 'HASH'
                || !%{$AttributeList}
                || $GetParam{ElementChanged} eq 'ExpressionID::' . $ExpressionID . '::ObjectID'
                || $GetParam{ElementChanged} eq 'ExpressionID::' . $ExpressionID . '::Selector'
                )
            {
                $PossibleNoneAttributeID = 1;
            }

            # add an empty operator selection if no list is available or nothing is selected
            my $PossibleNoneOperatorID = 0;
            if (
                !$OperatorList
                || !ref $OperatorList eq 'HASH'
                || !%{$OperatorList}
                || $GetParam{ElementChanged} eq 'ExpressionID::' . $ExpressionID . '::ObjectID'
                || $GetParam{ElementChanged} eq 'ExpressionID::' . $ExpressionID . '::Selector'
                || $GetParam{ElementChanged} eq 'ExpressionID::' . $ExpressionID . '::AttributeID'
                )
            {
                $PossibleNoneOperatorID = 1;
            }

            # if object was changed, reset the attribute and operator list
            if ( $GetParam{ElementChanged} eq 'ExpressionID::' . $ExpressionID . '::ObjectID' ) {
                $AttributeList = {};
                $OperatorList  = {};
            }

            # build json
            $JSON = $Self->{LayoutObject}->BuildJSON(
                [
                    {
                        Name         => 'ExpressionID::' . $ExpressionID . '::ObjectID',
                        Data         => $ObjectList,
                        SelectedID   => $GetParam{ObjectID},
                        PossibleNone => 0,
                        Translation  => 1,
                        Max          => 100,
                    },
                    {
                        Name         => 'ExpressionID::' . $ExpressionID . '::Selector',
                        Data         => $SelectorList,
                        SelectedID   => $PossibleNoneSelector ? '' : $GetParam{Selector},
                        PossibleNone => $PossibleNoneSelector,
                        Translation  => 1,
                        Max          => 100,
                    },
                    {
                        Name         => 'ExpressionID::' . $ExpressionID . '::AttributeID',
                        Data         => $AttributeList,
                        SelectedID   => $GetParam{AttributeID} || '',
                        PossibleNone => $PossibleNoneAttributeID,
                        Translation  => 1,
                        Max          => 100,
                    },
                    {
                        Name => 'ExpressionID::' . $ExpressionID . '::OperatorID',
                        Data => $OperatorList,

                        #SelectedID   => $PossibleNoneOperatorID ? '' : $GetParam{OperatorID},
                        SelectedID => $GetParam{OperatorID} || '',
                        PossibleNone => $PossibleNoneOperatorID,
                        Translation  => 1,
                        Max          => 100,
                    },
                ],
            );
        }

        # any action field was changed
        elsif ( $GetParam{ElementChanged} =~ m{ \A ActionID :: ( \d+ | NEW ) }xms ) {

            # get action id
            my $ActionID = $1;

            # TODO Add AJAX stuff for actions here...

            $JSON = $Self->{LayoutObject}->BuildJSON(
                [

                   #                    {
                   #                        Name         => 'ActionID::' . $ActionID . '::ObjectID',
                   #                        Data         => $ObjectList,
                   #                        SelectedID   => $GetParam{ObjectID},
                   #                        PossibleNone => 0,
                   #                        Translation  => 1,
                   #                        Max          => 100,
                   #                    },
                ],
            );
        }

        # return json
        return $Self->{LayoutObject}->Attachment(
            ContentType => 'text/plain; charset=' . $Self->{LayoutObject}->{Charset},
            Content     => $JSON,
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # ------------------------------------------------------------------------------------- #
    # handle AJAXUpdate (replace the field type, e.g. replace a text field with a selection
    # ------------------------------------------------------------------------------------- #
    elsif ( $Self->{Subaction} eq 'AJAXContentUpdate' ) {

        # to store the HTML string which is returned to the browser
        my $HTMLString;

        #        # id name of the involved element
        #        # will be either 'ExpressionID' or 'ActionID'
        #        my $IDName;
        #
        #        # block names for the output layout block
        #        my $BlockNameText;
        #        my $BlockNameSelection;
        #        my $ValueFieldName;
        #
        #        # for expression elements
        #        if ( $Param{ExpressionID} ) {
        #            $IDName             = 'ExpressionID';
        #            $BlockNameText      = 'ExpressionOverviewRowElementCompareValueText';
        #            $BlockNameSelection = 'ExpressionOverviewRowElementCompareValueSelection';
        #            $ValueFieldName     = 'CompareValue';
        #        }
        #
        #        # for action elements
        #        elsif ( $Param{ActionID} ) {
        #            $IDName             = 'ActionID';
        #            $BlockNameText      = 'ActionOverviewRowElementActionValueText';
        #            $BlockNameSelection = 'ActionOverviewRowElementActionValueSelection';
        #            $ValueFieldName     = 'ActionValue';
        #        }

        # an expression field was changed
        if ( $GetParam{ElementChanged} =~ m{ \A ExpressionID :: ( \d+ | NEW ) }xms ) {

            # get expression id
            my $ExpressionID = $1;

            # get expression fields
            for my $Field (qw(ObjectID Selector AttributeID OperatorID CompareValue)) {
                $GetParam{$Field} = $Self->{ParamObject}->GetParam(
                    Param => 'ExpressionID::' . $ExpressionID . '::' . $Field,
                );
            }

            # get compare value field type
            my $FieldType = $Self->_GetCompareValueFieldType(%GetParam);

            # build CompareValue selection
            if ( $FieldType eq 'Selection' ) {

                # get compare value selection list
                my $CompareValueList = $Self->_GetCompareValueSelection(

                    #ExpressionID => $ExpressionID,
                    %GetParam,
                );

                # add an empty selection if no list is available or nothing is selected
                my $PossibleNone = 0;
                if (
                    $Param{PossibleNone}
                    || !$Param{CompareValue}
                    || !$CompareValueList
                    || ( ref $CompareValueList eq 'HASH'  && !%{$CompareValueList} )
                    || ( ref $CompareValueList eq 'ARRAY' && !@{$CompareValueList} )
                    )
                {
                    $PossibleNone = 1;
                }

                # generate CompareValueOptionString
                $HTMLString = $Self->{LayoutObject}->BuildSelection(
                    Data         => $CompareValueList,
                    Name         => 'ExpressionID::' . $ExpressionID . '::CompareValue',
                    SelectedID   => $GetParam{CompareValue},
                    PossibleNone => $PossibleNone,
                );

                # remove AJAX-Loading images in selection field to avoid jitter effect
                $HTMLString =~ s{ <a [ ] id="AJAXImage [^<>]+ "></a> }{}xmsg;
            }

            # build text input field
            elsif ( $FieldType eq 'Text' ) {

                # build an empty input field
                $HTMLString = ''
                    . '<input type="text" '
                    . 'id="ExpressionID::' . $ExpressionID . '::CompareValue" '
                    . 'name="ExpressionID::' . $ExpressionID . '::CompareValue" '
                    . 'value="" size="30" maxlength="250">';
            }
        }

        # return HTML
        return $Self->{LayoutObject}->Attachment(
            ContentType => 'text/html',
            Charset     => $Self->{LayoutObject}->{UserCharset},
            Content     => $HTMLString,
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # ------------------------------------------------------------ #
    # condition edit view
    # ------------------------------------------------------------ #
    elsif ( !$Self->{Subaction} ) {

        my %ConditionData;

        # get ConditionID
        $ConditionData{ConditionID} = $GetParam{ConditionID};

        # if this is an existing condition
        if ( $ConditionData{ConditionID} ne 'NEW' ) {

            # get condition data
            my $Condition = $Self->{ConditionObject}->ConditionGet(
                ConditionID => $ConditionData{ConditionID},
                UserID      => $Self->{UserID},
            );

            # check if the condition belongs to the given change
            if ( $Condition->{ChangeID} ne $GetParam{ChangeID} ) {
                return $Self->{LayoutObject}->ErrorScreen(
                    Message => "ConditionID $ConditionData{ConditionID} belongs to "
                        . " ChangeID $Condition->{ChangeID} and not to the given $GetParam{ChangeID}!",
                    Comment => 'Please contact the admin.',
                );
            }

            # add data from condition
            %ConditionData = ( %ConditionData, %{$Condition} );

            # show existing expressions
            $Self->_ExpressionOverview(
                %{$ChangeData},
                %ConditionData,
                ExpressionIDs => $ExpressionIDsRef,
                NewExpression => $GetParam{NewExpression},
            );

            # show existing actions
            $Self->_ActionOverview(
                %{$ChangeData},
                %ConditionData,
                ActionIDs => $ActionIDsRef,
                NewAction => $GetParam{NewAction},
            );
        }

        # get expression conjunction from condition
        if ( !$GetParam{ExpressionConjunction} ) {
            $GetParam{ExpressionConjunction} = $ConditionData{ExpressionConjunction} || '';
        }

        # set radio buttons for expression conjunction
        if ( $GetParam{ExpressionConjunction} eq 'all' ) {
            $ConditionData{allselected} = 'checked="checked"';
        }
        else {
            $ConditionData{anyselected} = 'checked="checked"';
        }

        # output header
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # generate ValidOptionString
        $ConditionData{ValidOptionString} = $Self->{LayoutObject}->BuildSelection(
            Data       => \%ValidList,
            Name       => 'ValidID',
            SelectedID => $ConditionData{ValidID} || ( $Self->{ValidObject}->ValidIDsGet() )[0],
            Sort       => 'NumericKey',
        );

        # generate output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AgentITSMChangeConditionEdit',
            Data         => {
                %Param,
                %{$ChangeData},
                %ConditionData,
            },
        );
        $Output .= $Self->{LayoutObject}->Footer();

        return $Output;
    }
}

# show existing expressions
sub _ExpressionOverview {
    my ( $Self, %Param ) = @_;

    return if !$Param{ExpressionIDs};
    return if ref $Param{ExpressionIDs} ne 'ARRAY';

    my @ExpressionIDs = @{ $Param{ExpressionIDs} };

    # also show a new empty expression line
    if ( $Param{NewExpression} ) {
        push @ExpressionIDs, 'NEW';
    }

    return if !@ExpressionIDs;

    EXPRESSIONID:
    for my $ExpressionID ( sort { $a cmp $b } @ExpressionIDs ) {

        # to store the date of an expression
        my $ExpressionData = {};

        # set expression id to 'NEW' for further function calls
        if ( $ExpressionID eq 'NEW' ) {
            $ExpressionData->{ExpressionID} = $ExpressionID;
        }

        # get data for an existing expression
        else {

            # get condition data
            $ExpressionData = $Self->{ConditionObject}->ExpressionGet(
                ExpressionID => $ExpressionID,
                UserID       => $Self->{UserID},
            );

            next EXPRESSIONID if !$ExpressionData;
        }

        # output overview row
        $Self->{LayoutObject}->Block(
            Name => 'ExpressionOverviewRow',
            Data => {
                %Param,
                %{$ExpressionData},
            },
        );

        # show object selection
        $Self->_ShowObjectSelection(
            %Param,
            %{$ExpressionData},
        );

        # show selecor selection
        $Self->_ShowSelectorSelection(
            %Param,
            %{$ExpressionData},
        );

        # show attribute selection
        $Self->_ShowAttributeSelection(
            %Param,
            %{$ExpressionData},
        );

        # show operator selection
        $Self->_ShowOperatorSelection(
            %Param,
            %{$ExpressionData},
        );

        # show compare value field
        $Self->_ShowCompareValueField(
            %Param,
            %{$ExpressionData},
        );
    }

    return 1;
}

# show existing actions
sub _ActionOverview {
    my ( $Self, %Param ) = @_;

    return if !$Param{ActionIDs};
    return if ref $Param{ActionIDs} ne 'ARRAY';

    my @ActionIDs = @{ $Param{ActionIDs} };

    # also show a new empty action line
    if ( $Param{NewAction} ) {
        push @ActionIDs, 'NEW';
    }

    return if !@ActionIDs;

    ActionID:
    for my $ActionID ( sort { $a cmp $b } @ActionIDs ) {

        # to store the date of an action
        my $ActionData = {};

        # set action id to 'NEW' for further function calls
        if ( $ActionID eq 'NEW' ) {
            $ActionData->{ActionID} = $ActionID;
        }

        # get data for an existing action
        else {

            # get condition data
            $ActionData = $Self->{ConditionObject}->ActionGet(
                ActionID => $ActionID,
                UserID   => $Self->{UserID},
            );

            next ActionID if !$ActionData;
        }

        # output overview row
        $Self->{LayoutObject}->Block(
            Name => 'ActionOverviewRow',
            Data => {
                %Param,
                %{$ActionData},
            },
        );

        # show object selection
        $Self->_ShowObjectSelection(
            %Param,
            %{$ActionData},
        );

        #        # show selecor selection
        #        $Self->_ShowSelectorSelection(
        #            %Param,
        #            %{$ActionData},
        #        );
        #
        #        # show attribute selection
        #        $Self->_ShowAttributeSelection(
        #            %Param,
        #            %{$ActionData},
        #        );
        #
        #        # show operator selection
        #        $Self->_ShowOperatorSelection(
        #            %Param,
        #            %{$ActionData},
        #        );

        #        # show compare value field
        #        $Self->_ShowCompareValueField(
        #            %Param,
        #            %{$ActionData},
        #        );
    }

    return 1;
}

# show object dropdown field
sub _ShowObjectSelection {
    my ( $Self, %Param ) = @_;

    # get object selection list
    my $ObjectList = $Self->_GetObjectSelection(%Param);

    # add an empty selection if no list is available or nothing is selected
    my $PossibleNone = 0;
    if (
        !$ObjectList
        || !ref $ObjectList eq 'HASH'
        || !%{$ObjectList}
        || !$Param{ObjectID}
        )
    {
        $PossibleNone = 1;
    }

    # name of the div that should be updated
    my $UpdateDivName;

    # id name of the involved element,
    # will be either 'ExpressionID' or 'ActionID'
    my $IDName;

    # block name for the output layout block
    my $BlockName;

    # for expression elements
    if ( $Param{ExpressionID} ) {
        $UpdateDivName = "ExpressionID::$Param{ExpressionID}::CompareValue::Div";
        $IDName        = 'ExpressionID';
        $BlockName     = 'ExpressionOverviewRowElementObject';
    }

    # for action elements
    elsif ( $Param{ActionID} ) {
        $UpdateDivName = "ActionID::$Param{ActionID}::ActionValue::Div";
        $IDName        = 'ActionID';
        $BlockName     = 'ActionOverviewRowElementObject';
    }

    # build OnChange string
    my $OnChangeString = ''
        . "AJAXContentUpdate('$UpdateDivName', '"
        . '$Env{"Baselink"}'
        . "Action=$Self->{Action}"
        . '&Subaction=AJAXContentUpdate'
        . "&UpdateDivName=$UpdateDivName"
        . '&ChangeID=$QData{"ChangeID"}'
        . '&ConditionID=$QData{"ConditionID"}'

        . "&" . $IDName . "::" . $Param{$IDName} . "::ObjectID=' + "
        . "document.getElementById('" . $IDName . "::" . $Param{$IDName} . "::ObjectID').value + '"

        . "&ElementChanged=" . $IDName . "::" . $Param{$IDName} . "::ObjectID"
        . "'); "

        . "AJAXUpdate('AJAXUpdate', '" . $IDName . "::" . $Param{$IDName} . "::ObjectID', "
        . "[ "
        . "'ChangeID', "
        . "'ConditionID', "
        . "'" . $IDName . "::" . $Param{$IDName} . "::ObjectID', "
        . "], "
        . "[ "
        . "'" . $IDName . "::" . $Param{$IDName} . "::ObjectID', "
        . "'" . $IDName . "::" . $Param{$IDName} . "::Selector', "
        . "'" . $IDName . "::" . $Param{$IDName} . "::AttributeID', "
        . "'" . $IDName . "::" . $Param{$IDName} . "::OperatorID', "
        . "]); "
        . 'return false;';

    # generate ObjectOptionString
    my $ObjectOptionString = $Self->{LayoutObject}->BuildSelection(
        Data         => $ObjectList,
        Name         => $IDName . '::' . $Param{$IDName} . '::ObjectID',
        SelectedID   => $Param{ObjectID},
        PossibleNone => $PossibleNone,
        OnChange     => $OnChangeString,
    );

    # remove AJAX-Loading images in selection field to avoid jitter effect
    $ObjectOptionString =~ s{ <a [ ] id="AJAXImage [^<>]+ "></a> }{}xmsg;

    # output object selection
    $Self->{LayoutObject}->Block(
        Name => $BlockName,
        Data => {
            %Param,
            ObjectOptionString => $ObjectOptionString,
        },
    );

    return 1;
}

# show selector dropdown field
sub _ShowSelectorSelection {
    my ( $Self, %Param ) = @_;

    # get selector selection list
    my $SelectorList = $Self->_GetSelectorSelection(%Param);

    # add an empty selection if no list is available or nothing is selected
    my $PossibleNone = 0;
    if (
        !$SelectorList
        || !ref $SelectorList eq 'HASH'
        || !%{$SelectorList}
        || !$Param{Selector}
        )
    {
        $PossibleNone = 1;
    }

    # id name of the involved element
    # will be either 'ExpressionID' or 'ActionID'
    my $IDName;

    # block name for the output layout block
    my $BlockName;

    # for expression elements
    if ( $Param{ExpressionID} ) {
        $IDName    = 'ExpressionID';
        $BlockName = 'ExpressionOverviewRowElementSelector';
    }

    # for action elements
    elsif ( $Param{ActionID} ) {
        $IDName    = 'ActionID';
        $BlockName = 'ActionOverviewRowElementSelector';
    }

    # generate SelectorOptionString
    my $SelectorOptionString = $Self->{LayoutObject}->BuildSelection(
        Data         => $SelectorList,
        Name         => $IDName . '::' . $Param{$IDName} . '::Selector',
        SelectedID   => $Param{Selector},
        PossibleNone => $PossibleNone,
        Ajax         => {
            Update => [
                $IDName . '::' . $Param{$IDName} . '::Selector',
                $IDName . '::' . $Param{$IDName} . '::AttributeID',
                $IDName . '::' . $Param{$IDName} . '::OperatorID',
            ],
            Depend => [
                'ChangeID',
                'ConditionID',
                $IDName . '::' . $Param{$IDName} . '::ObjectID',
                $IDName . '::' . $Param{$IDName} . '::Selector',
            ],
            Subaction => 'AJAXUpdate',
        },
    );

    # remove AJAX-Loading images in selection field to avoid jitter effect
    $SelectorOptionString =~ s{ <a [ ] id="AJAXImage [^<>]+ "></a> }{}xmsg;

    # output selector selection
    $Self->{LayoutObject}->Block(
        Name => $BlockName,
        Data => {
            %Param,
            SelectorOptionString => $SelectorOptionString,
        },
    );

    return 1;
}

# show attribute dropdown field
sub _ShowAttributeSelection {
    my ( $Self, %Param ) = @_;

    # get attribute selection list
    my $AttributeList = $Self->_GetAttributeSelection(%Param);

    # add an empty selection if no list is available or nothing is selected
    my $PossibleNone = 0;
    if (
        !$AttributeList
        || !ref $AttributeList eq 'HASH'
        || !%{$AttributeList}
        || !$Param{AttributeID}
        )
    {
        $PossibleNone = 1;
    }

    # name of the div that should be updated
    my $UpdateDivName;

    # id name of the involved element,
    # will be either 'ExpressionID' or 'ActionID'
    my $IDName;

    # block name for the output layout block
    my $BlockName;

    # for expression elements
    if ( $Param{ExpressionID} ) {
        $UpdateDivName = "ExpressionID::$Param{ExpressionID}::CompareValue::Div";
        $IDName        = 'ExpressionID';
        $BlockName     = 'ExpressionOverviewRowElementAttribute';
    }

    # for action elements
    elsif ( $Param{ActionID} ) {
        $UpdateDivName = "ActionID::$Param{ActionID}::ActionValue::Div";
        $IDName        = 'ActionID';
        $BlockName     = 'ActionOverviewRowElementAttribute';
    }

    # build OnChange string
    my $OnChangeString = ''
        . "AJAXContentUpdate('$UpdateDivName', '"
        . '$Env{"Baselink"}'
        . "Action=$Self->{Action}"
        . '&Subaction=AJAXContentUpdate'
        . "&UpdateDivName=$UpdateDivName"
        . '&ChangeID=$QData{"ChangeID"}'
        . '&ConditionID=$QData{"ConditionID"}'

        . "&" . $IDName . "::" . $Param{$IDName} . "::ObjectID=' + "
        . "document.getElementById('" . $IDName . "::" . $Param{$IDName} . "::ObjectID').value + '"

        . "&" . $IDName . "::" . $Param{$IDName} . "::Selector=' + "
        . "document.getElementById('" . $IDName . "::" . $Param{$IDName} . "::Selector').value + '"

        . "&" . $IDName . "::" . $Param{$IDName} . "::AttributeID=' "
        . "+ document.getElementById('"
        . $IDName . "::"
        . $Param{$IDName}
        . "::AttributeID').value + '"

        . "&" . $IDName . "::" . $Param{$IDName} . "::OperatorID=' + "
        . "document.getElementById('"
        . $IDName . "::"
        . $Param{$IDName}
        . "::OperatorID').value + '"

        . "&" . $IDName . "::" . $Param{$IDName} . "::CompareValue=' + "
        . "document.getElementById('"
        . $IDName . "::"
        . $Param{$IDName}
        . "::CompareValue').value + '"

        . "&ElementChanged=" . $IDName . "::" . $Param{$IDName} . "::AttributeID"
        . "'); "

        . "AJAXUpdate('AJAXUpdate', '" . $IDName . "::" . $Param{$IDName} . "::AttributeID', "
        . "[ "
        . "'ChangeID', "
        . "'ConditionID', "
        . "'" . $IDName . "::" . $Param{$IDName} . "::ObjectID', "
        . "'" . $IDName . "::" . $Param{$IDName} . "::Selector', "
        . "'" . $IDName . "::" . $Param{$IDName} . "::AttributeID' "
        . "], "
        . "[ "
        . "'" . $IDName . "::" . $Param{$IDName} . "::AttributeID', "
        . "'" . $IDName . "::" . $Param{$IDName} . "::OperatorID', "
        . "]); "
        . 'return false;';

    # generate AttributeOptionString
    my $AttributeOptionString = $Self->{LayoutObject}->BuildSelection(
        Data         => $AttributeList,
        Name         => $IDName . '::' . $Param{$IDName} . '::AttributeID',
        SelectedID   => $Param{AttributeID},
        PossibleNone => $PossibleNone,
        OnChange     => $OnChangeString,
    );

    # remove AJAX-Loading images in date selection fields to avoid jitter effect
    $AttributeOptionString =~ s{ <a [ ] id="AJAXImage [^<>]+ "></a> }{}xmsg;

    # output attribute selection
    $Self->{LayoutObject}->Block(
        Name => $BlockName,
        Data => {
            %Param,
            AttributeOptionString => $AttributeOptionString,
        },
    );

    return 1;
}

# show operator dropdown field
sub _ShowOperatorSelection {
    my ( $Self, %Param ) = @_;

    # get operator selection list
    my $OperatorList = $Self->_GetOperatorSelection(%Param);

    # add an empty selection if no list is available or nothing is selected
    my $PossibleNone = 0;
    if (
        !$OperatorList
        || !ref $OperatorList eq 'HASH'
        || !%{$OperatorList}
        || !$Param{OperatorID}
        )
    {
        $PossibleNone = 1;
    }

    # id name of the involved element
    # will be either 'ExpressionID' or 'ActionID'
    my $IDName;

    # block name for the output layout block
    my $BlockName;

    # for expression elements
    if ( $Param{ExpressionID} ) {
        $IDName    = 'ExpressionID';
        $BlockName = 'ExpressionOverviewRowElementOperator';
    }

    # for action elements
    elsif ( $Param{ActionID} ) {
        $IDName    = 'ActionID';
        $BlockName = 'ActionOverviewRowElementOperator';
    }

    # generate OperatorOptionString
    my $OperatorOptionString = $Self->{LayoutObject}->BuildSelection(
        Data         => $OperatorList,
        Name         => $IDName . '::' . $Param{$IDName} . '::OperatorID',
        SelectedID   => $Param{OperatorID},
        PossibleNone => $PossibleNone,
        Ajax         => {
            Update => [
                $IDName . '::' . $Param{$IDName} . '::OperatorID',
            ],
            Depend => [
                'ChangeID',
                'ConditionID',
                $IDName . '::' . $Param{$IDName} . '::ObjectID',
                $IDName . '::' . $Param{$IDName} . '::Selector',
                $IDName . '::' . $Param{$IDName} . '::AttributeID',
                $IDName . '::' . $Param{$IDName} . '::OperatorID',
            ],
            Subaction => 'AJAXUpdate',
        },
    );

    # remove AJAX-Loading images in selection field to avoid jitter effect
    $OperatorOptionString =~ s{ <a [ ] id="AJAXImage [^<>]+ "></a> }{}xmsg;

    # output operator selection
    $Self->{LayoutObject}->Block(
        Name => $BlockName,
        Data => {
            %Param,
            OperatorOptionString => $OperatorOptionString,
        },
    );

    return 1;
}

# show compare value field
sub _ShowCompareValueField {
    my ( $Self, %Param ) = @_;

    # get compare value field type
    my $FieldType = $Self->_GetCompareValueFieldType(%Param);

    # id name of the involved element
    # will be either 'ExpressionID' or 'ActionID'
    my $IDName;

    # block names for the output layout block
    my $BlockNameText;
    my $BlockNameSelection;
    my $ValueFieldName;

    # for expression elements
    if ( $Param{ExpressionID} ) {
        $IDName             = 'ExpressionID';
        $BlockNameText      = 'ExpressionOverviewRowElementCompareValueText';
        $BlockNameSelection = 'ExpressionOverviewRowElementCompareValueSelection';
        $ValueFieldName     = 'CompareValue';
    }

    # for action elements
    elsif ( $Param{ActionID} ) {
        $IDName             = 'ActionID';
        $BlockNameText      = 'ActionOverviewRowElementActionValueText';
        $BlockNameSelection = 'ActionOverviewRowElementActionValueSelection';
        $ValueFieldName     = 'ActionValue';
    }

    # compare value is a text field
    if ( $FieldType eq 'Text' ) {
        $Self->{LayoutObject}->Block(
            Name => $BlockNameText,
            Data => {
                %Param,
            },
        );
    }

    # compare value is a selection field
    elsif ( $FieldType eq 'Selection' ) {

        # get compare value selection list
        my $CompareValueList = $Self->_GetCompareValueSelection(%Param);

        # add an empty selection if no list is available or nothing is selected
        my $PossibleNone = 0;
        if (
            $Param{PossibleNone}
            || !$Param{$ValueFieldName}
            || !$CompareValueList
            || ( ref $CompareValueList eq 'HASH'  && !%{$CompareValueList} )
            || ( ref $CompareValueList eq 'ARRAY' && !@{$CompareValueList} )
            )
        {
            $PossibleNone = 1;
        }

        # generate CompareValueOptionString
        my $CompareValueOptionString = $Self->{LayoutObject}->BuildSelection(
            Data         => $CompareValueList,
            Name         => $IDName . '::' . $Param{$IDName} . '::' . $ValueFieldName,
            SelectedID   => $Param{$ValueFieldName},
            PossibleNone => $PossibleNone,
        );

        # remove AJAX-Loading images in selection field to avoid jitter effect
        $CompareValueOptionString =~ s{ <a [ ] id="AJAXImage [^<>]+ "></a> }{}xmsg;

        # output selection
        $Self->{LayoutObject}->Block(
            Name => $BlockNameSelection,
            Data => {
                %Param,
                CompareValueOptionString => $CompareValueOptionString,
            },
        );
    }

    # compare value is a date field
    elsif ( $FieldType eq 'Date' ) {

        # TODO : Implement date selection later!
    }

    # compare value is an autocomplete field
    elsif ( $FieldType eq 'Autocomplete' ) {

        # TODO : Implement autocomplete selection later!
    }

    # error if field type is unknown
    else {

        # TODO : Error message
        return;
    }

    return 1;
}

# get compare value field type
sub _GetCompareValueFieldType {
    my ( $Self, %Param ) = @_;

    # set default field type
    my $FieldType = 'Selection';

    # if an attribute is set
    if ( $Param{AttributeID} ) {

        # lookup attribute name
        my $AttributeName = $Self->{ConditionObject}->AttributeLookup(
            AttributeID => $Param{AttributeID},
        );

        # check error
        if ( !$AttributeName ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "AttributeID $Param{AttributeID} does not exist!",
            );
            return;
        }

        # get the field type
        $FieldType = $Self->{ConditionObject}->ConditionCompareValueFieldType(
            ObjectID    => $Param{ObjectID},
            AttributeID => $Param{AttributeID},
            UserID      => $Self->{UserID},
        );

        return if !$FieldType;
    }

    # Workaround for not yet implemented field types
    # TODO: implement these field types
    if ( $FieldType eq 'Date' ) {
        $FieldType = 'Text';
    }
    elsif ( $FieldType eq 'Autocomplete' ) {
        $FieldType = 'Selection'
    }

    return $FieldType;
}

# get object dropdown field data
sub _GetObjectSelection {
    my ( $Self, %Param ) = @_;

    # get object list
    my $ObjectList = $Self->{ConditionObject}->ObjectList(
        UserID => $Self->{UserID},
    );

    return $ObjectList;
}

# get selector dropdown field data
sub _GetSelectorSelection {
    my ( $Self, %Param ) = @_;

    my $SelectorList = {};

    # if an object is set
    if ( $Param{ObjectID} ) {

        # get selector list
        $SelectorList = $Self->{ConditionObject}->ObjectSelectorList(
            ObjectID    => $Param{ObjectID},
            ConditionID => $Param{ConditionID},
            UserID      => $Self->{UserID},
        );
    }

    return $SelectorList;
}

# get attribute selection list data
sub _GetAttributeSelection {
    my ( $Self, %Param ) = @_;

    # to store the attriutes
    my %Attributes;

    # if a selector is set
    if ( $Param{Selector} ) {

        # get list of all attribute
        my $AllAttributes = $Self->{ConditionObject}->AttributeList(
            UserID => $Self->{UserID},
        );

        # lookup object name
        my $ObjectName = $Self->{ConditionObject}->ObjectLookup(
            ObjectID => $Param{ObjectID},
        );

        # check error
        if ( !$ObjectName ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "ObjectID $Param{ObjectID} does not exist!",
            );
            return;
        }

        # get object attribute mapping from sysconfig
        my $ObjectAttributeMapping
            = $Self->{ConfigObject}->Get( $ObjectName . '::Mapping::Object::Attribute' );

        # get the valid attributes for the given object
        ATTRIBUTEID:
        for my $AttributeID ( keys %{$AllAttributes} ) {
            next ATTRIBUTEID if !$ObjectAttributeMapping->{ $AllAttributes->{$AttributeID} };
            $Attributes{$AttributeID} = $AllAttributes->{$AttributeID};
        }

        # remove 'ID' at the end of the attribute name for nicer display
        for my $Attribute ( values %Attributes ) {
            $Attribute =~ s{ ID \z }{}xms;
        }
    }

    return \%Attributes;
}

# get operator list data
sub _GetOperatorSelection {
    my ( $Self, %Param ) = @_;

    # to store the operators
    my %Operators;

    # if an atribute is set
    if ( $Param{AttributeID} ) {

        # lookup object name
        my $ObjectName = $Self->{ConditionObject}->ObjectLookup(
            ObjectID => $Param{ObjectID},
        );

        # check error
        if ( !$ObjectName ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "ObjectID $Param{ObjectID} does not exist!",
            );
            return;
        }

        # lookup attribute name
        my $AttributeName = $Self->{ConditionObject}->AttributeLookup(
            AttributeID => $Param{AttributeID},
        );

        # check error
        if ( !$AttributeName ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "AttributeID $Param{AttributeID} does not exist!",
            );
            return;
        }

        # get list of all operators
        my $AllOperators = $Self->{ConditionObject}->OperatorList(
            UserID => $Self->{UserID},
        );

        # get attribute operator mapping from sysconfig
        my $AttributeOperatorMapping;
        if ( $Self->{ConfigObject}->Get( $ObjectName . '::Mapping::Attribute::Operator' ) ) {
            $AttributeOperatorMapping
                = $Self->{ConfigObject}->Get( $ObjectName . '::Mapping::Attribute::Operator' )
                ->{$AttributeName} || {};
        }

        # get allowed operators for the given attribute
        OPERATORID:
        for my $OperatorID ( keys %{$AllOperators} ) {

            # get operator name
            my $OperatorName = $AllOperators->{$OperatorID};

            # check if operator is allowed for this attribute
            next OPERATORID if !$AttributeOperatorMapping->{$OperatorName};

            # remember the operator
            $Operators{$OperatorID} = $OperatorName;
        }
    }

    return \%Operators;
}

# get compare value list
sub _GetCompareValueSelection {
    my ( $Self, %Param ) = @_;

    # to store the compare value list
    my $CompareValueList = {};

    # if an attribute is set
    if ( $Param{AttributeID} ) {

        # lookup attribute name
        my $AttributeName = $Self->{ConditionObject}->AttributeLookup(
            AttributeID => $Param{AttributeID},
        );

        # check error
        if ( !$AttributeName ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "AttributeID $Param{AttributeID} does not exist!",
            );
            return;
        }

        # get compare value list
        $CompareValueList = $Self->{ConditionObject}->ObjectCompareValueList(
            ObjectID      => $Param{ObjectID},
            AttributeName => $AttributeName,
            UserID        => $Self->{UserID},
        );
    }

    return $CompareValueList;
}

1;
