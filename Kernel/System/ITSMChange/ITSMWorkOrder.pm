# --
# Kernel/System/ITSMChange/ITSMWorkOrder.pm - all workorder functions
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: ITSMWorkOrder.pm,v 1.53 2009/12/16 20:45:44 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMWorkOrder;

use strict;
use warnings;

use Kernel::System::GeneralCatalog;
use Kernel::System::LinkObject;
use Kernel::System::User;
use Kernel::System::Group;
use Kernel::System::ITSMChange::ITSMStateMachine;
use Kernel::System::VirtualFS;
use Kernel::System::HTMLUtils;

use base qw(Kernel::System::EventHandler);

use vars qw($VERSION);
$VERSION = qw($Revision: 1.53 $) [1];

=head1 NAME

Kernel::System::ITSMChange::ITSMWorkOrder - workorder lib

=head1 SYNOPSIS

All functions for workorders in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::DB;
    use Kernel::System::Main;
    use Kernel::System::Time;
    use Kernel::System::ITSMChange::ITSMWorkOrder;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
    my $TimeObject = Kernel::System::Time->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $WorkOrderObject = Kernel::System::ITSMChange::ITSMWorkOrder->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        TimeObject   => $TimeObject,
        MainObject   => $MainObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(DBObject ConfigObject EncodeObject LogObject MainObject TimeObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    # set the debug flag
    $Self->{Debug} = $Param{Debug} || 0;

    # create additional objects
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
    $Self->{LinkObject}           = Kernel::System::LinkObject->new( %{$Self} );
    $Self->{UserObject}           = Kernel::System::User->new( %{$Self} );
    $Self->{GroupObject}          = Kernel::System::Group->new( %{$Self} );
    $Self->{StateMachineObject}   = Kernel::System::ITSMChange::ITSMStateMachine->new( %{$Self} );
    $Self->{HTMLUtilsObject}      = Kernel::System::HTMLUtils->new( %{$Self} );
    $Self->{VirtualFSObject}      = Kernel::System::VirtualFS->new( %{$Self} );

    # init of event handler
    $Self->EventHandlerInit(
        Config     => 'ITSMWorkOrder::EventModule',
        BaseObject => 'WorkOrderObject',
        Objects    => {
            %{$Self},
        },
    );

    return $Self;
}

=item WorkOrderAdd()

Add a new workorder.
Internally first a minimal workorder is created, then WorkOrderUpdate() is called.

    my $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
        ChangeID => 123,
        UserID   => 1,
    );

or

    my $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
        ChangeID         => 123,
        WorkOrderNumber  => 5,                                         # (optional)
        WorkOrderTitle   => 'Replacement of mail server',              # (optional)
        Instruction      => 'Install the the new server',              # (optional)
        Report           => 'Installed new server without problems',   # (optional)
        WorkOrderStateID => 157,                                       # (optional) or WorkOrderState => 'ready'
        WorkOrderState   => 'ready',                                   # (optional) or WorkOrderStateID => 157
        WorkOrderTypeID  => 161,                                       # (optional) or WorkOrderType => 'pir'
        WorkOrderType    => 'ready',                                   # (optional) or WorkOrderTypeID => 161
        WorkOrderAgentID => 8,                                         # (optional)
        PlannedStartTime => '2009-10-12 00:00:01',                     # (optional)
        PlannedEndTime   => '2009-10-15 15:00:00',                     # (optional)
        ActualStartTime  => '2009-10-14 00:00:01',                     # (optional)
        ActualEndTime    => '2009-01-20 00:00:01',                     # (optional)
        UserID           => 1,
    );

=cut

sub WorkOrderAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ChangeID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check that not both WorkOrderState and WorkOrderStateID are given
    if ( $Param{WorkOrderState} && $Param{WorkOrderStateID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need either WorkOrderState OR WorkOrderStateID - not both!',
        );
        return;
    }

    # if a State is given, then look up the ID
    if ( $Param{WorkOrderState} ) {
        $Param{WorkOrderStateID} = $Self->WorkOrderStateLookup(
            WorkOrderState => $Param{WorkOrderState},
        );

        # delete the workorder state otherwise the update fails
        # as both WorkOrderState and WorkOrderStateID exists then
        delete $Param{WorkOrderState};
    }

    # check that not both WorkOrderType and WorkOrderTypeID are given
    if ( $Param{WorkOrderType} && $Param{WorkOrderTypeID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need either WorkOrderType OR WorkOrderTypeID - not both!',
        );
        return;
    }

    # if Type is given, then look up the ID
    if ( $Param{WorkOrderType} ) {
        $Param{WorkOrderTypeID} = $Self->WorkOrderTypeLookup(
            WorkOrderType => $Param{WorkOrderType},
        );

        # delete the workorder type otherwise the update fails
        # as both WorkOrderType and WorkOrderTypeID exists then
        delete $Param{WorkOrderType};
    }

    # get a plain text version of arguments which might contain HTML markup
    ARGUMENT:
    for my $Argument (qw(Instruction Report)) {

        next ARGUMENT if !exists $Param{$Argument};

        $Param{"${Argument}Plain"} = $Self->{HTMLUtilsObject}->ToAscii(
            String => $Param{$Argument},
        );

    }

    # check the parameters
    return if !$Self->_CheckWorkOrderParams(%Param);

    # trigger WorkOrderAddPre-Event
    $Self->EventHandler(
        Event => 'WorkOrderAddPre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    # set initial WorkOrderStateID
    my $WorkOrderStateID = $Param{WorkOrderStateID};
    if ( !$Param{WorkOrderStateID} ) {

        # get initial workorder state id
        my $NextStateIDs = $Self->{StateMachineObject}->StateTransitionGet(
            StateID => 0,
            Class   => 'ITSM::ChangeManagement::WorkOrder::State',
        );
        $WorkOrderStateID = $NextStateIDs->[0];

    }

    # set default WorkOrderTypeID
    my $WorkOrderTypeID = $Param{WorkOrderTypeID};
    if ( !$Param{WorkOrderTypeID} ) {

        # set config option
        my $ConfigOption = 'ITSMWorkOrder::Type::Default';

        # get default workorder type from config
        my $DefaultType = $Self->{ConfigObject}->Get($ConfigOption);

        # check if default type exists in general catalog
        my $ItemDataRef = $Self->{GeneralCatalogObject}->ItemGet(
            Class => 'ITSM::ChangeManagement::WorkOrder::Type',
            Name  => $DefaultType,
        );

        # error handling because of invalid config setting
        if ( !$ItemDataRef || ref $ItemDataRef ne 'HASH' || !%{$ItemDataRef} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The default WorkOrderType '$DefaultType' "
                    . "in sysconfig option '$ConfigOption' is invalid! Check the general catalog!",
            );
            return;
        }

        # set default
        $WorkOrderTypeID = $ItemDataRef->{ItemID};
    }

    # get default workorder number if not given
    my $WorkOrderNumber = $Param{WorkOrderNumber} || $Self->_GetWorkOrderNumber(%Param);

    # add WorkOrder to database
    return if !$Self->{DBObject}->Do(
        SQL => 'INSERT INTO change_workorder '
            . '(change_id, workorder_number, workorder_state_id, workorder_type_id, '
            . 'create_time, create_by, change_time, change_by) '
            . 'VALUES (?, ?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{ChangeID}, \$WorkOrderNumber, \$WorkOrderStateID, \$WorkOrderTypeID,
            \$Param{UserID}, \$Param{UserID},
        ],
    );

    # get WorkOrderID
    return if !$Self->{DBObject}->Prepare(
        SQL   => 'SELECT id FROM change_workorder WHERE change_id = ? AND workorder_number = ?',
        Bind  => [ \$Param{ChangeID}, \$WorkOrderNumber ],
        Limit => 1,
    );

    # fetch the result
    my $WorkOrderID;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $WorkOrderID = $Row[0];
    }

    # check error
    if ( !$WorkOrderID ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "WorkOrderAdd() failed!",
        );
        return;
    }

    # trigger WorkOrderAddPost-Event
    # (yes, we want do do this before the WorkOrderUpdate!)
    $Self->EventHandler(
        Event => 'WorkOrderAddPost',
        Data  => {
            WorkOrderID => $WorkOrderID,
            %Param,
        },
        UserID => $Param{UserID},
    );

    # update WorkOrder with remaining parameters
    my $UpdateSuccess = $Self->WorkOrderUpdate(
        WorkOrderID => $WorkOrderID,
        %Param,
    );

    # check update error
    if ( !$UpdateSuccess ) {

        # delete workorder if it could not be updated
        $Self->WorkOrderDelete(
            WorkOrderID => $WorkOrderID,
            UserID      => $Param{UserID},
        );

        return;
    }

    return $WorkOrderID;
}

=item WorkOrderUpdate()

Update a workorder.
Leading and trailing whitespace is removed from C<WorkOrderTitle>.
Passing undefined values is generally not allowed. An exception
are the parameters C<PlannedStartTime>, C<PlannedEndTime>, C<ActualStartTime>, and C<ActualEndTime>.
There passing C<undef> indicates that the workorder time should be cleared.

    my $Success = $WorkOrderObject->WorkOrderUpdate(
        WorkOrderID      => 4,
        ChangeID         => 123,                                       # (optional)
        WorkOrderNumber  => 5,                                         # (optional)
        WorkOrderTitle   => 'Replacement of mail server',              # (optional)
        Instruction      => 'Install the the new server',              # (optional)
        Report           => 'Installed new server without problems',   # (optional)
        WorkOrderStateID => 157,                                       # (optional) or WorkOrder => 'ready'
        WorkOrderState   => 'ready',                                   # (optional) or WorkOrderStateID => 157
        WorkOrderTypeID  => 161,                                       # (optional) or WorkOrderType => 'pir'
        WorkOrderType    => 'pir',                                     # (optional) or WorkOrderStateID => 161
        WorkOrderAgentID => 8,                                         # (optional)
        PlannedStartTime => '2009-10-12 00:00:01',                     # (optional) 'undef' indicates clearing
        PlannedEndTime   => '2009-10-15 15:00:00',                     # (optional) 'undef' indicates clearing
        ActualStartTime  => '2009-10-14 00:00:01',                     # (optional) 'undef' indicates clearing
        ActualEndTime    => '2009-01-20 00:00:01',                     # (optional) 'undef' indicates clearing
        UserID           => 1,
    );

constraints:

xxxStartTime has to be before xxxEndTime. If just one of these parameters is passed
the other time is retrieved from database.

=cut

sub WorkOrderUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(WorkOrderID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check that not both State and StateID are given
    if ( $Param{WorkOrderState} && $Param{WorkOrderStateID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need either WorkOrderState OR WorkOrderStateID - not both!',
        );
        return;
    }

    # when the State is given, then look up the ID
    if ( $Param{WorkOrderState} ) {
        $Param{WorkOrderStateID} = $Self->WorkOrderStateLookup(
            WorkOrderState => $Param{WorkOrderState},
        );
    }

    # check that not both Type and TypeID are given
    if ( $Param{WorkOrderType} && $Param{WorkOrderTypeID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need either WorkOrderType OR WorkOrderTypeID - not both!',
        );
        return;
    }

    # if Type is given, then look up the ID
    if ( $Param{WorkOrderType} ) {
        $Param{WorkOrderTypeID} = $Self->WorkOrderTypeLookup(
            WorkOrderType => $Param{WorkOrderType},
        );
    }

    # normalize the Title, when it is given
    if ( $Param{WorkOrderTitle} && !ref $Param{WorkOrderTitle} ) {

        # remove leading whitespace
        $Param{WorkOrderTitle} =~ s{ \A \s+ }{}xms;

        # remove trailing whitespace
        $Param{WorkOrderTitle} =~ s{ \s+ \z }{}xms;
    }

    # get a plain text version of arguments which might contain HTML markup
    ARGUMENT:
    for my $Argument (qw(Instruction Report)) {

        next ARGUMENT if !exists $Param{$Argument};

        $Param{"${Argument}Plain"} = $Self->{HTMLUtilsObject}->ToAscii(
            String => $Param{$Argument},
        );
    }

    # check the given parameters
    return if !$Self->_CheckWorkOrderParams(%Param);

    # get old data to be given to _CheckWorkOrderParams() and the post event handler
    my $WorkOrderData = $Self->WorkOrderGet(
        WorkOrderID => $Param{WorkOrderID},
        UserID      => $Param{UserID},
    );

    # check if the timestamps are correct
    return if !$Self->_CheckTimestamps(
        %Param,
        WorkOrderData => $WorkOrderData,
    );

    # trigger WorkOrderUpdatePre-Event
    $Self->EventHandler(
        Event => 'WorkOrderUpdatePre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    # Handle the special cases for the time
    my $DefaultTimeStamp = '9999-01-01 00:00:00';
    for my $TimeType (qw(ActualStartTime ActualEndTime PlannedStartTime PlannedEndTime)) {
        if ( exists $Param{$TimeType} && !defined $Param{$TimeType} ) {
            $Param{$TimeType} = $DefaultTimeStamp;
        }
    }

    # map update attributes to column names
    my %Attribute = (
        WorkOrderTitle   => 'title',
        WorkOrderNumber  => 'workorder_number',
        Instruction      => 'instruction',
        Report           => 'report',
        ChangeID         => 'change_id',
        WorkOrderStateID => 'workorder_state_id',
        WorkOrderTypeID  => 'workorder_type_id',
        WorkOrderAgentID => 'workorder_agent_id',
        PlannedStartTime => 'planned_start_time',
        PlannedEndTime   => 'planned_end_time',
        ActualStartTime  => 'actual_start_time',
        ActualEndTime    => 'actual_end_time',
        InstructionPlain => 'instruction_plain',
        ReportPlain      => 'report_plain',
    );

    # build SQL to update workorder
    my $SQL = 'UPDATE change_workorder SET ';
    my @Bind;

    ATTRIBUTE:
    for my $Attribute ( keys %Attribute ) {

        # preserve the old value, when the column isn't in function parameters
        next ATTRIBUTE if !exists $Param{$Attribute};

        # param checking has already been done, so this is safe
        $SQL .= "$Attribute{$Attribute} = ?, ";
        push @Bind, \$Param{$Attribute};
    }

    $SQL .= 'change_time = current_timestamp, change_by = ? ';
    $SQL .= 'WHERE id = ?';
    push @Bind, \$Param{UserID}, \$Param{WorkOrderID};

    # update workorder
    return if !$Self->{DBObject}->Do(
        SQL  => $SQL,
        Bind => \@Bind,
    );

    # trigger WorkOrderUpdatePost-Event
    $Self->EventHandler(
        Event => 'WorkOrderUpdatePost',
        Data  => {
            OldWorkOrderData => $WorkOrderData,
            %Param,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item WorkOrderGet()

Return a WorkOrder as hash reference.

    my $WorkOrderRef = $WorkOrderObject->WorkOrderGet(
        WorkOrderID => 123,
        UserID      => 1,
    );

The returned hash reference contains following elements:

    $WorkOrder{WorkOrderID}
    $WorkOrder{ChangeID}
    $WorkOrder{WorkOrderNumber}
    $WorkOrder{WorkOrderTitle}
    $WorkOrder{Instruction}
    $WorkOrder{InstructionPlain}
    $WorkOrder{Report}
    $WorkOrder{ReportPlain}
    $WorkOrder{WorkOrderStateID}
    $WorkOrder{WorkOrderState}              # fetched from the general catalog
    $WorkOrder{WorkOrderStateSignal}        # fetched from SysConfig
    $WorkOrder{WorkOrderTypeID}
    $WorkOrder{WorkOrderType}               # fetched from the general catalog
    $WorkOrder{WorkOrderAgentID}
    $WorkOrder{PlannedStartTime}
    $WorkOrder{PlannedEndTime}
    $WorkOrder{ActualStartTime}
    $WorkOrder{ActualEndTime}
    $WorkOrder{CreateTime}
    $WorkOrder{CreateBy}
    $WorkOrder{ChangeTime}
    $WorkOrder{ChangeBy}

=cut

sub WorkOrderGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Attribute (qw(WorkOrderID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # get data from database
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT id, change_id, workorder_number, title, '
            . 'instruction, instruction_plain, '
            . 'report, report_plain, '
            . 'workorder_state_id, workorder_type_id, workorder_agent_id, '
            . 'planned_start_time, planned_end_time, actual_start_time, actual_end_time, '
            . 'create_time, create_by, '
            . 'change_time, change_by '
            . 'FROM change_workorder '
            . 'WHERE id = ?',
        Bind  => [ \$Param{WorkOrderID} ],
        Limit => 1,
    );

    # fetch the result
    my %WorkOrderData;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $WorkOrderData{WorkOrderID}      = $Row[0];
        $WorkOrderData{ChangeID}         = $Row[1];
        $WorkOrderData{WorkOrderNumber}  = $Row[2];
        $WorkOrderData{WorkOrderTitle}   = defined $Row[3] ? $Row[3] : '';
        $WorkOrderData{Instruction}      = defined $Row[4] ? $Row[4] : '';
        $WorkOrderData{InstructionPlain} = defined $Row[5] ? $Row[5] : '';
        $WorkOrderData{Report}           = defined $Row[6] ? $Row[6] : '';
        $WorkOrderData{ReportPlain}      = defined $Row[7] ? $Row[7] : '';
        $WorkOrderData{WorkOrderStateID} = $Row[8];
        $WorkOrderData{WorkOrderTypeID}  = $Row[9];
        $WorkOrderData{WorkOrderAgentID} = $Row[10];
        $WorkOrderData{PlannedStartTime} = $Row[11];
        $WorkOrderData{PlannedEndTime}   = $Row[12];
        $WorkOrderData{ActualStartTime}  = $Row[13];
        $WorkOrderData{ActualEndTime}    = $Row[14];
        $WorkOrderData{CreateTime}       = $Row[15];
        $WorkOrderData{CreateBy}         = $Row[16];
        $WorkOrderData{ChangeTime}       = $Row[17];
        $WorkOrderData{ChangeBy}         = $Row[18];
    }

    # check error
    if ( !%WorkOrderData ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "WorkOrderID $Param{WorkOrderID} does not exist!",
        );
        return;
    }

    # replace default time values with empty string
    for my $Time (qw(PlannedStartTime PlannedEndTime ActualStartTime ActualEndTime)) {
        if ( $WorkOrderData{$Time} eq '9999-01-01 00:00:00' ) {
            $WorkOrderData{$Time} = '';
        }
    }

    # add the name of the workorder state
    if ( $WorkOrderData{WorkOrderStateID} ) {
        $WorkOrderData{WorkOrderState} = $Self->WorkOrderStateLookup(
            WorkOrderStateID => $WorkOrderData{WorkOrderStateID},
        );
    }

    # add the workorder state signal
    if ( $WorkOrderData{WorkOrderState} ) {

        # get all change state signals
        my $StateSignal = $Self->{ConfigObject}->Get('ITSMWorkOrder::State::Signal');

        $WorkOrderData{WorkOrderStateSignal} = $StateSignal->{ $WorkOrderData{WorkOrderState} };
    }

    # add the name of the workorder type
    if ( $WorkOrderData{WorkOrderTypeID} ) {
        $WorkOrderData{WorkOrderType} = $Self->WorkOrderTypeLookup(
            WorkOrderTypeID => $WorkOrderData{WorkOrderTypeID},
        );
    }

    return \%WorkOrderData;
}

=item WorkOrderList()

return a list of all workorder ids of a given change id as array reference

    my $WorkOrderIDsRef = $WorkOrderObject->WorkOrderList(
        ChangeID => 5,
        UserID   => 1,
    );

=cut

sub WorkOrderList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Attribute (qw(ChangeID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # get workorder ids
    return if !$Self->{DBObject}->Prepare(
        SQL  => 'SELECT id FROM change_workorder WHERE change_id = ?',
        Bind => [ \$Param{ChangeID} ],
    );

    # fetch the result
    my @WorkOrderIDs;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @WorkOrderIDs, $Row[0];
    }

    return \@WorkOrderIDs;
}

=item WorkOrderSearch()

Returns either a list, as an arrayref, or a count of found workorder ids.
The count of results is returned when the parameter C<Result = 'COUNT'> is passed.

The search criteria are logically AND connected.
When a list is passed as criterium, the individual members are OR connected.
When an undef or a reference to an empty array is passed, then the search criterium
is ignored.

    my $WorkOrderIDsRef = $WorkOrderObject->WorkOrderSearch(
        ChangeIDs         => [ 123, 122 ]                              # (optional)
        WorkOrderNumber   => 12,                                       # (optional)

        WorkOrderTitle    => 'Replacement of mail server',             # (optional)
        Instruction       => 'Install the the new server',             # (optional)
        Report            => 'Installed new server without problems',  # (optional)

        WorkOrderStateIDs => [ 11, 12 ],                               # (optional)
        WorkOrderStates   => [ 'closed', 'canceled' ],                 # (optional)
        WorkOrderTypeIDs  => [ 21, 22 ],                               # (optional)
        WorkOrderTypes    => [ 'approval', 'workorder' ],              # (optional)
        WorkOrderAgentIDs => [ 1, 2, 3 ],                              # (optional)
        CreateBy          => [ 5, 2, 3 ],                              # (optional)
        ChangeBy          => [ 3, 2, 1 ],                              # (optional)

        # search in text fields of change object
        ChangeNumber        => 'Number of change',                     # (optional)
        ChangeTitle         => 'Title of change',                      # (optional)
        ChangeDescription   => 'Description of change',                # (optional)
        ChangeJustification => 'Justification of change',              # (optional)

        # changes with planned start time after ...
        PlannedStartTimeNewerDate => '2006-01-09 00:00:01',            # (optional)
        # changes with planned start time before then ....
        PlannedStartTimeOlderDate => '2006-01-19 23:59:59',            # (optional)

        # changes with planned end time after ...
        PlannedEndTimeNewerDate   => '2006-01-09 00:00:01',            # (optional)
        # changes with planned end time before then ....
        PlannedEndTimeOlderDate   => '2006-01-19 23:59:59',            # (optional)

        # changes with actual start time after ...
        ActualStartTimeNewerDate  => '2006-01-09 00:00:01',            # (optional)
        # changes with actual start time before then ....
        ActualStartTimeOlderDate  => '2006-01-19 23:59:59',            # (optional)

        # changes with actual end time after ...
        ActualEndTimeNewerDate    => '2006-01-09 00:00:01',            # (optional)
        # changes with actual end time before then ....
        ActualEndTimeOlderDate    => '2006-01-19 23:59:59',            # (optional)

        # changes with created time after ...
        CreateTimeNewerDate       => '2006-01-09 00:00:01',            # (optional)
        # changes with created time before then ....
        CreateTimeOlderDate       => '2006-01-19 23:59:59',            # (optional)

        # changes with changed time after ...
        ChangeTimeNewerDate       => '2006-01-09 00:00:01',            # (optional)
        # changes with changed time before then ....
        ChangeTimeOlderDate       => '2006-01-19 23:59:59',            # (optional)

        OrderBy => [ 'ChangeID', 'WorkOrderNumber' ],                  # (optional)
        # ignored when the result type is 'COUNT'
        # default: [ 'WorkOrderID' ],
        # (WorkOrderID, ChangeID, WorkOrderNumber, WorkOrderTitle
        # WorkOrderStateID, WorkOrderTypeID, WorkOrderAgentID,
        # PlannedStartTime, PlannedEndTime,
        # ActualStartTime, ActualEndTime,
        # CreateTime, CreateBy, ChangeTime, ChangeBy)

        # Additional information for OrderBy:
        # The OrderByDirection can be specified for each OrderBy attribute.
        # The pairing is made by the array indices.

        OrderByDirection => [ 'Down', 'Up' ],                          # (optional)
        # ignored when the result type is 'COUNT'
        # default: [ 'Down' ]
        # (Down | Up)

        UsingWildcards => 1,                                           # (optional)
        # (0 | 1) default 1

        Result => 'ARRAY' || 'COUNT',                                  # (optional)
        # default: ARRAY, returns an array of workorder ids
        # COUNT returns a scalar with the number of found workorders

        Limit => 100,                                                  # (optional)
        # ignored when the result type is 'COUNT'

        UserID => 1,
    );

=cut

sub WorkOrderSearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    # verify that all passed array parameters contain an arrayref
    ARGUMENT:
    for my $Argument (
        qw(
        OrderBy
        OrderByDirection
        WorkOrderStateIDs
        WorkOrderStates
        WorkOrderTypes
        WorkOrderTypeIDs
        ChangeIDs
        WorkOrderAgentIDs
        CreateBy
        ChangeBy
        )
        )
    {
        if ( !defined $Param{$Argument} ) {
            $Param{$Argument} ||= [];

            next ARGUMENT;
        }

        if ( ref $Param{$Argument} ne 'ARRAY' ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "$Argument must be an array reference!",
            );
            return;
        }
    }

    my @SQLWhere;           # assemble the conditions used in the WHERE clause
    my @InnerJoinTables;    # keep track of the tables that need to be inner joined

    # define order table
    my %OrderByTable = (

        # workorder attributes
        ChangeID         => 'wo.change_id',
        WorkOrderID      => 'wo.id',
        WorkOrderNumber  => 'wo.workorder_number',
        WorkOrderTitle   => 'wo.title',
        WorkOrderStateID => 'wo.workorder_state_id',
        WorkOrderTypeID  => 'wo.workorder_type_id',
        WorkOrderAgentID => 'wo.workorder_agent_id',
        PlannedStartTime => 'wo.planned_start_time',
        PlannedEndTime   => 'wo.planned_end_time',
        ActualStartTime  => 'wo.actual_start_time',
        ActualEndTime    => 'wo.actual_end_time',
        CreateTime       => 'wo.create_time',
        CreateBy         => 'wo.create_by',
        ChangeTime       => 'wo.change_time',
        ChangeBy         => 'wo.change_by',

        # change attributes
        ChangeNumber    => 'c.change_number',
        ChangeTitle     => 'c.title',
        ChangeStateID   => 'c.change_state_id',
        ChangeManagerID => 'c.change_manager_id',
        ChangeBuilderID => 'c.change_builder_id',
        CategoryID      => 'c.category_id',
        ImpactID        => 'c.impact_id',
        PriorityID      => 'c.priority_id',
        RequestedTime   => 'c.requested_time',
    );

    # check if OrderBy contains only unique valid values
    my %OrderBySeen;
    for my $OrderBy ( @{ $Param{OrderBy} } ) {

        if ( !$OrderBy || !$OrderByTable{$OrderBy} || $OrderBySeen{$OrderBy} ) {

            # found an error
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "OrderBy contains invalid value '$OrderBy' "
                    . 'or the value is used more than once!',
            );
            return;
        }

        # remember the value to check if it appears more than once
        $OrderBySeen{$OrderBy} = 1;

        # join the change table, when it is needed in the for the OrderBy clause
        if ( $OrderByTable{$OrderBy} =~ m{ \A c[.] }xms ) {
            push @InnerJoinTables, 'c';
        }
    }

    # check if OrderByDirection array contains only 'Up' or 'Down'
    DIRECTION:
    for my $Direction ( @{ $Param{OrderByDirection} } ) {

        # only 'Up' or 'Down' allowed
        next DIRECTION if $Direction eq 'Up';
        next DIRECTION if $Direction eq 'Down';

        # found an error
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "OrderByDirection can only contain 'Up' or 'Down'!",
        );
        return;
    }

    # set default values
    if ( !defined $Param{UsingWildcards} ) {
        $Param{UsingWildcards} = 1;
    }

    # set the default behaviour for the return type
    my $Result = $Param{Result} || 'ARRAY';

    # check whether all of the given WorkOrderStateIDs are valid
    return if !$Self->WorkOrderStateIDsCheck( WorkOrderStateIDs => $Param{WorkOrderStateIDs} );

    # look up and thus check the States
    for my $WorkOrderState ( @{ $Param{WorkOrderStates} } ) {

        # look up the ID for the name
        my $WorkOrderStateID = $Self->WorkOrderStateLookup(
            WorkOrderState => $WorkOrderState,
        );

        # check whether the ID was found, whether the name exists
        if ( !$WorkOrderStateID ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The workorder state $WorkOrderState is not known!",
            );

            return;
        }

        push @{ $Param{WorkOrderStateIDs} }, $WorkOrderStateID;
    }

    # check whether the given WorkOrderTypeIDs are all valid
    return if !$Self->_CheckWorkOrderTypeIDs( WorkOrderTypeIDs => $Param{WorkOrderTypeIDs} );

    # look up and thus check the WorkOrderTypes
    for my $WorkOrderType ( @{ $Param{WorkOrderTypes} } ) {

        # get the ID for the name
        my $WorkOrderTypeID = $Self->WorkOrderTypeLookup(
            WorkOrderType => $WorkOrderType,
        );

        # check whether the ID was found, whether the name exists
        if ( !$WorkOrderTypeID ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The workorder type $WorkOrderType is not known!",
            );
            return;
        }

        push @{ $Param{WorkOrderTypeIDs} }, $WorkOrderTypeID;
    }

    # add string params to the WHERE clause
    my %StringParams = (

        # in workorder table
        WorkOrderNumber => 'wo.workorder_number',
        WorkOrderTitle  => 'wo.title',
        Instruction     => 'wo.instruction_plain',
        Report          => 'wo.report_plain',

        # in change table
        ChangeNumber        => 'c.change_number',
        ChangeTitle         => 'c.title',
        ChangeDescription   => 'c.description_plain',
        ChangeJustification => 'c.justification_plain',
    );

    # add string params to sql-where-array
    STRINGPARAM:
    for my $StringParam ( keys %StringParams ) {

        # check string params for useful values, the string '0' is allowed
        next STRINGPARAM if !exists $Param{$StringParam};
        next STRINGPARAM if !defined $Param{$StringParam};
        next STRINGPARAM if $Param{$StringParam} eq '';

        # quote
        $Param{$StringParam} = $Self->{DBObject}->Quote( $Param{$StringParam} );

        # wildcards are used
        if ( $Param{UsingWildcards} ) {

            # Quote
            $Param{$StringParam} = $Self->{DBObject}->Quote( $Param{$StringParam}, 'Like' );

            # replace * with %
            $Param{$StringParam} =~ s{ \*+ }{%}xmsg;

            # do not use string params which contain only %
            next STRINGPARAM if $Param{$StringParam} =~ m{ \A %* \z }xms;

            push @SQLWhere,
                "LOWER($StringParams{$StringParam}) LIKE LOWER('$Param{$StringParam}')";
        }

        # no wildcards are used
        else {
            push @SQLWhere,
                "LOWER($StringParams{$StringParam}) = LOWER('$Param{$StringParam}')";
        }

        # join the change table, when it is needed in the WHERE clause
        if ( $StringParams{$StringParam} =~ m{ \A c[.] }xms ) {
            push @InnerJoinTables, 'c';
        }
    }

    # set array params
    my %ArrayParams = (
        ChangeIDs         => 'wo.change_id',
        WorkOrderStateIDs => 'wo.workorder_state_id',
        WorkOrderTypeIDs  => 'wo.workorder_type_id',
        WorkOrderAgentIDs => 'wo.workorder_agent_id',
        CreateBy          => 'wo.create_by',
        ChangeBy          => 'wo.change_by',
    );

    # add array params to sql-where-array
    ARRAYPARAM:
    for my $ArrayParam ( keys %ArrayParams ) {

        # ignore empty lists
        next ARRAYPARAM if !@{ $Param{$ArrayParam} };

        # quote
        for my $OneParam ( @{ $Param{$ArrayParam} } ) {
            $OneParam = $Self->{DBObject}->Quote($OneParam);
        }

        # create string
        my $InString = join ', ', @{ $Param{$ArrayParam} };

        push @SQLWhere, "$ArrayParams{$ArrayParam} IN ($InString)";
    }

    # check the time params and add them to the WHERE clause of the SELECT-Statement
    my %TimeParams = (
        CreateTimeNewerDate       => 'wo.create_time >=',
        CreateTimeOlderDate       => 'wo.create_time <=',
        ChangeTimeNewerDate       => 'wo.change_time >=',
        ChangeTimeOlderDate       => 'wo.change_time <=',
        PlannedStartTimeNewerDate => 'wo.planned_start_time >=',
        PlannedStartTimeOlderDate => 'wo.planned_start_time <=',
        PlannedEndTimeNewerDate   => 'wo.planned_end_time >=',
        PlannedEndTimeOlderDate   => 'wo.planned_end_time <=',
        ActualStartTimeNewerDate  => 'wo.actual_start_time >=',
        ActualStartTimeOlderDate  => 'wo.actual_start_time <=',
        ActualEndTimeNewerDate    => 'wo.actual_end_time >=',
        ActualEndTimeOlderDate    => 'wo.actual_end_time <=',
    );
    TIMEPARAM:
    for my $TimeParam ( keys %TimeParams ) {

        next TIMEPARAM if !$Param{$TimeParam};

        if ( $Param{$TimeParam} !~ m{ \A \d\d\d\d-\d\d-\d\d \s \d\d:\d\d:\d\d \z }xms ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter $TimeParam has an invalid date format!",
            );
            return;
        }

        # quote
        $Param{$TimeParam} = $Self->{DBObject}->Quote( $Param{$TimeParam} );

        push @SQLWhere, "$TimeParams{$TimeParam} '$Param{$TimeParam}'";
    }

    # delete the OrderBy parameter when the result type is 'COUNT'
    if ( $Result eq 'COUNT' ) {
        $Param{OrderBy} = [];
    }

    # assemble the ORDER BY clause
    my @SQLOrderBy;
    my $Count = 0;
    for my $OrderBy ( @{ $Param{OrderBy} } ) {

        # set the default order direction
        my $Direction = 'DESC';

        # add the given order direction
        if ( $Param{OrderByDirection}->[$Count] ) {
            if ( $Param{OrderByDirection}->[$Count] eq 'Up' ) {
                $Direction = 'ASC';
            }
            elsif ( $Param{OrderByDirection}->[$Count] eq 'Down' ) {
                $Direction = 'DESC';
            }
        }

        # add SQL
        push @SQLOrderBy, "$OrderByTable{$OrderBy} $Direction";
    }
    continue {
        $Count++;
    }

    # if there is a possibility that the ordering is not determined
    # we add an descending ordering by id
    if ( !grep { $_ eq 'WorkOrderID' } ( @{ $Param{OrderBy} } ) ) {
        push @SQLOrderBy, "$OrderByTable{WorkOrderID} DESC";
    }

    # assemble the SQL query
    my $SQL = 'SELECT wo.id FROM change_workorder wo ';

    # modify SQL when the result type is 'COUNT'.
    # There is no 'GROUP BY' SQL-clause, therefore COUNT(c.id) always give the wanted count
    if ( $Result eq 'COUNT' ) {
        $SQL        = 'SELECT COUNT(wo.id) FROM change_workorder wo ';
        @SQLOrderBy = ();
    }

    # add the joins
    my %LongTableName = (
        c => 'change_item',
    );
    my %TableSeen;

    INNER_JOIN_TABLE:
    for my $Table (@InnerJoinTables) {

        # do not join a table twice
        next INNER_JOIN_TABLE if $TableSeen{$Table};

        $TableSeen{$Table} = 1;

        if ( !$LongTableName{$Table} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Encountered invalid inner join table '$Table'!",
            );
            return;
        }

        $SQL .= "INNER JOIN $LongTableName{$Table} $Table ON $Table.id = wo.change_id ";
    }

    # add the WHERE clause
    if (@SQLWhere) {
        $SQL .= 'WHERE ';
        $SQL .= join ' AND ', map {"( $_ )"} @SQLWhere;
        $SQL .= ' ';
    }

    # add the ORDER BY clause
    if (@SQLOrderBy) {
        $SQL .= 'ORDER BY ';
        $SQL .= join ', ', @SQLOrderBy;
        $SQL .= ' ';
    }

    # ignore the parameter 'Limit' when result type is 'COUNT'
    if ( $Result eq 'COUNT' ) {
        $Param{Limit} = 1;
    }

    # ask database
    return if !$Self->{DBObject}->Prepare(
        SQL   => $SQL,
        Limit => $Param{Limit},
    );

    # fetch the result
    my @IDs;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @IDs, $Row[0];
    }

    # return the count as scalar
    return $IDs[0] if $Result eq 'COUNT';

    return \@IDs;
}

=item WorkOrderDelete()

Delete a workorder.

This function first removes all links to the WorkOrder with the passed workorder id.

    my $Success = $WorkOrderObject->WorkOrderDelete(
        WorkOrderID => 123,
        UserID      => 1,
    );

=cut

sub WorkOrderDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Attribute (qw(WorkOrderID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # trigger WorkOrderDeletePre-Event
    $Self->EventHandler(
        Event => 'WorkOrderDeletePre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    # get old workorder data to be given to post event handler
    my $WorkOrderData = $Self->WorkOrderGet(
        WorkOrderID => $Param{WorkOrderID},
        UserID      => $Param{UserID},
    );

    # delete all links to this workorder
    return if !$Self->{LinkObject}->LinkDeleteAll(
        Object => 'ITSMWorkOrder',
        Key    => $Param{WorkOrderID},
        UserID => 1,
    );

    # delete the workorder
    return if !$Self->{DBObject}->Do(
        SQL  => 'DELETE FROM change_workorder WHERE id = ? ',
        Bind => [ \$Param{WorkOrderID} ],
    );

    # trigger WorkOrderDeletePost-Event
    $Self->EventHandler(
        Event => 'WorkOrderDeletePost',
        Data  => {
            OldWorkOrderData => $WorkOrderData,
            %Param,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item WorkOrderChangeTimeGet()

Returns a list of PlannedStartTime | PlannedEndTime | ActualStartTime | ActualEndTime
of a change, which would be the respective time of the earliest starting
workorder (for start times) or the latest ending workorder (for end times).

For PlannedStartTime | PlannedEndTime | ActualEndTime an empty string is returned
if any of the workorders of a change has the respective time not defined.

The ActualStartTime is defined when any of the workorders of a change has
a defined ActualStartTime.

Return

    $Time{PlannedStartTime}
    $Time{PlannedEndTime}
    $Time{ActualStartTime}
    $Time{ActualEndTime}

    my $TimeRef = $WorkOrderObject->WorkOrderChangeTimeGet(
        ChangeID => 123,
        UserID   => 1,

        # ---------------------------------------------------- #

        # TODO: (decide this later!)
        Maybe add this new attribute:

        # These are WorkOrderTypes (Types, not States!)
        # which would be excluded from the calculation
        # of the change start time.

        ExcludeWorkOrderTypes => [ 'approval', 'pir' ],   # (optional)

        # ---------------------------------------------------- #
    );

=cut

sub WorkOrderChangeTimeGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Attribute (qw(ChangeID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # build sql, using min and max functions
    my $SQL = 'SELECT '
        . 'MIN( planned_start_time ), '
        . 'MAX( planned_end_time ), '
        . 'MIN( actual_start_time ), '
        . 'MAX( actual_end_time ) '
        . 'FROM change_workorder '
        . 'WHERE change_id = ?';

    # retrieve the requested time
    return if !$Self->{DBObject}->Prepare(
        SQL   => $SQL,
        Bind  => [ \$Param{ChangeID} ],
        Limit => 1,
    );

    # initialize the return time hash
    my %TimeReturn;

    # fetch the result
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $TimeReturn{PlannedStartTime} = $Row[0] || '';
        $TimeReturn{PlannedEndTime}   = $Row[1] || '';
        $TimeReturn{ActualStartTime}  = $Row[2] || '';
        $TimeReturn{ActualEndTime}    = $Row[3] || '';
    }

    # set empty string if the default time was found
    for my $Time ( keys %TimeReturn ) {
        if ( $TimeReturn{$Time} eq '9999-01-01 00:00:00' ) {
            $TimeReturn{$Time} = '';
        }
    }

    # check if change has workorders with not yet defined planned_start_time entries
    if ( $TimeReturn{PlannedStartTime} ) {

        # build SQL
        my $SQL = 'SELECT count(*) '
            . 'FROM change_workorder '
            . "WHERE planned_start_time = '9999-01-01 00:00:00' "
            . 'AND change_id = ?';

        # retrieve number of not defined entries
        return if !$Self->{DBObject}->Prepare(
            SQL   => $SQL,
            Bind  => [ \$Param{ChangeID} ],
            Limit => 1,
        );

        # fetch the result
        my $Count;
        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            $Count = $Row[0];
        }

        # reset PlannedStartTime
        if ($Count) {
            $TimeReturn{PlannedStartTime} = '';
        }
    }

    return \%TimeReturn;
}

=item WorkOrderStateLookup()

This method does a lookup for a workorder state. If a workorder state id is given,
it returns the name of the workorder state. If a workorder state name is given,
the appropriate id is returned.

    my $WorkOrderState = $WorkOrderObject->WorkOrderStateLookup(
        WorkOrderStateID => 157,
    );

    my $WorkOrderStateID = $WorkOrderObject->WorkOrderStateLookup(
        WorkOrderState => 'ready',
    );

=cut

sub WorkOrderStateLookup {
    my ( $Self, %Param ) = @_;

    # either WorkOrderStateID or WorkOrderState must be passed
    if ( !$Param{WorkOrderStateID} && !$Param{WorkOrderState} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need WorkOrderStateID or WorkOrderState!',
        );
        return;
    }

    if ( $Param{WorkOrderStateID} && $Param{WorkOrderState} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need WorkOrderStateID OR WorkOrderState - not both!',
        );
        return;
    }

    # get the workorder states from the general catalog
    my %StateID2Name = %{
        $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::ChangeManagement::WorkOrder::State',
            )
        };

    # check the state hash
    if ( !%StateID2Name ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Could not retrieve workorder states from the general catalog.',
        );

        return;
    }

    if ( $Param{WorkOrderStateID} ) {
        return $StateID2Name{ $Param{WorkOrderStateID} };
    }
    else {

        # reverse key - value pairs to have the name as keys
        my %StateName2ID = reverse %StateID2Name;

        return $StateName2ID{ $Param{WorkOrderState} };
    }
}

=item WorkOrderPossibleStatesGet()

This method returns a list of possible workorder states.
If WorkOrderID is omitted, the complete list of change states is returned.
If WorkOrderID is given, the list of possible change states for this
workorder is returned.

    my $WorkOrderStateList = $WorkOrderObject->WorkOrderPossibleStatesGet(
        WorkOrderID => 123, # optional
        UserID      => 1,
    );

The return value is a reference to an array of hashrefs. The element 'Key' is then
the StateID and the element 'Value' is the name of the state. The array elements
are sorted by state id.

    my $WorkOrderStateList = [
        {
            Key   => 156,
            Value => 'accepted',
        },
        {
            Key   => 157,
            Value => 'in progress',
        },
    ];

=cut

sub WorkOrderPossibleStatesGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Attribute (qw(UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # get workorder state list
    my $StateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ChangeManagement::WorkOrder::State',
    ) || {};

    # to store an array of hash refs
    my @ArrayHashRef;

    # if WorkOrderID is given, only use possible next states as defined in state machine
    if ( $Param{WorkOrderID} ) {

        # get workorder data
        my $WorkOrder = $Self->WorkOrderGet(
            WorkOrderID => $Param{WorkOrderID},
            UserID      => $Param{UserID},
        );

        # get the possible next state ids
        my $NextStateIDsRef = $Self->{StateMachineObject}->StateTransitionGet(
            StateID => $WorkOrder->{WorkOrderStateID},
            Class   => 'ITSM::ChangeManagement::WorkOrder::State',
        );

        # add current workorder state id to list
        my @NextStateIDs = sort ( @{$NextStateIDsRef}, $WorkOrder->{WorkOrderStateID} );

        # assemble the array of hash refs with only possible next states
        STATEID:
        for my $StateID (@NextStateIDs) {

            next STATEID if !$StateID;

            push @ArrayHashRef, {
                Key   => $StateID,
                Value => $StateList->{$StateID},
            };
        }
    }
    else {

        # assemble the array of hash refs with all next states
        for my $StateID ( sort keys %{$StateList} ) {
            push @ArrayHashRef, {
                Key   => $StateID,
                Value => $StateList->{$StateID},
            };
        }
    }

    return \@ArrayHashRef;
}

=item WorkOrderTypeLookup()

This method does a lookup for a workorder type. If a workorder type id is given,
it returns the name of the workorder type. If a workorder type name is given,
the appropriate id is returned.

    my $WorkOrderType = $WorkOrderObject->WorkOrderTypeLookup(
        WorkOrderTypeID => 157,
    );

    my $WorkOrderTypeID = $WorkOrderObject->WorkOrderTypeLookup(
        WorkOrderType => 'ready',
    );

=cut

sub WorkOrderTypeLookup {
    my ( $Self, %Param ) = @_;

    # either WorkOrderTypeID or WorkOrderType must be passed
    if ( !$Param{WorkOrderTypeID} && !$Param{WorkOrderType} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need WorkOrderTypeID or WorkOrderType!',
        );
        return;
    }

    if ( $Param{WorkOrderTypeID} && $Param{WorkOrderType} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need WorkOrderTypeID OR WorkOrderType - not both!',
        );
        return;
    }

    # get workorder type from general catalog
    # mapping of the id to the name
    my %WorkOrderType = %{
        $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::ChangeManagement::WorkOrder::Type',
            )
        };

    # check the workorder types hash
    if ( !%WorkOrderType ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Could not retrieve workorder types from the general catalog.',
        );

        return;
    }

    if ( $Param{WorkOrderTypeID} ) {
        return $WorkOrderType{ $Param{WorkOrderTypeID} };
    }
    else {

        # reverse key - value pairs to have the name as keys
        my %ReversedWorkOrderType = reverse %WorkOrderType;

        return $ReversedWorkOrderType{ $Param{WorkOrderType} };
    }
}

=item WorkOrderTypeList()

This method returns a list of all workorder types.

    my $WorkOrderTypeList = $WorkOrderObject->WorkOrderTypeList(
        UserID      => 1,
        Default     => 1,   # optional - the default type is selected type (default: 0)
        SelectedID  => 123, # optional - this id is selected
    );

The return value is a reference to an array of hashrefs. The Element 'Key' is then
the TypeID and die Element 'Value' is the name of the type. The array elements
are sorted by type id.

    my $WorkOrderTypeList = [
        {
            Key   => 171,
            Value => 'workorder',
        },
        {
            Key   => 172,
            Value => 'backout',
        },
    ];

=cut

sub WorkOrderTypeList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Attribute (qw(UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # what type is selected
    my $SelectedID = $Param{Selected} || 0;

    if ( $Param{Default} ) {

        # set config option
        my $ConfigOption = 'ITSMWorkOrder::Type::Default';

        # get default workorder type from config
        my $DefaultType = $Self->{ConfigObject}->Get($ConfigOption);

        # check if default type exists in general catalog
        my $ItemDataRef = $Self->{GeneralCatalogObject}->ItemGet(
            Class => 'ITSM::ChangeManagement::WorkOrder::Type',
            Name  => $DefaultType,
        );

        # error handling because of invalid config setting
        if ( !$ItemDataRef || ref $ItemDataRef ne 'HASH' || !%{$ItemDataRef} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The default WorkOrderType '$DefaultType' "
                    . "in sysconfig option '$ConfigOption' is invalid! Check the general catalog!",
            );
            return;
        }

        # set default
        $SelectedID = $ItemDataRef->{ItemID};
    }

    # get workorder type list
    my $WorkOrderTypeList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ChangeManagement::WorkOrder::Type',
    ) || {};

    # assemble a an array of hash refs
    my @ArrayHashRef;
    for my $TypeID ( sort keys %{$WorkOrderTypeList} ) {
        my %SelectedInfo;

        if ( $SelectedID && $SelectedID == $TypeID ) {
            $SelectedInfo{Selected} = 1;
        }

        push @ArrayHashRef, {
            Key   => $TypeID,
            Value => $WorkOrderTypeList->{$TypeID},
            %SelectedInfo,
        };
    }

    return \@ArrayHashRef;
}

=item Permission()

Returns whether the agent C<UserID> has permissions of the type C<Type>
on the workorder C<WorkOrderID>. The parameters are passed on to
the permission modules that were registered under B<ITSMChange::Permission>.

The optional option C<LogNo> turns off logging when access was denied.
This is useful when the method is used for checking whether a link or an action should be shown.

    my $Access = $WorkOrderObject->Permission(
        UserID      => 123,
        Type        => 'ro',   # 'ro' and 'rw' are supported
        WorkOrderID => 4444,
        Cached      => 0,      # optional with default 1,
                               # passing the value 0 is useful in test scripts
        LogNo       => 1,      # optional, turns off logging when access is denied
    );

=cut

sub Permission {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Type UserID WorkOrderID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # run the relevant permission modules
    if ( ref $Self->{ConfigObject}->Get('ITSMWorkOrder::Permission') eq 'HASH' ) {
        my %Modules = %{ $Self->{ConfigObject}->Get('ITSMWorkOrder::Permission') };
        for my $Module ( sort keys %Modules ) {

            # log try of load module
            if ( $Self->{Debug} > 1 ) {
                $Self->{LogObject}->Log(
                    Priority => 'debug',
                    Message  => "Try to load module: $Modules{$Module}->{Module}!",
                );
            }

            # load module
            next if !$Self->{MainObject}->Require( $Modules{$Module}->{Module} );

            # create object
            my $ModuleObject = $Modules{$Module}->{Module}->new(
                ConfigObject    => $Self->{ConfigObject},
                EncodeObject    => $Self->{EncodeObject},
                LogObject       => $Self->{LogObject},
                MainObject      => $Self->{MainObject},
                TimeObject      => $Self->{TimeObject},
                DBObject        => $Self->{DBObject},
                UserObject      => $Self->{UserObject},
                GroupObject     => $Self->{GroupObject},
                WorkOrderObject => $Self,
                Debug           => $Self->{Debug},
            );

            # ask for the opinion of the Permission module
            my $Access = $ModuleObject->Run(%Param);

            # Grant overall permission,
            # when the module granted a sufficient permission.
            if ( $Access && $Modules{$Module}->{Granted} ) {
                if ( $Self->{Debug} > 0 ) {
                    $Self->{LogObject}->Log(
                        Priority => 'debug',
                        Message  => "Granted '$Param{Type}' access for "
                            . "UserID: $Param{UserID} on "
                            . "WorkOrderID '$Param{WorkOrderID}' "
                            . "through $Modules{$Module}->{Module} (no more checks)!",
                    );
                }

                # grant permission
                return 1;
            }

            # Deny overall permission,
            # when the module denied a required permission.
            if ( !$Access && $Modules{$Module}->{Required} ) {
                if ( !$Param{LogNo} ) {
                    $Self->{LogObject}->Log(
                        Priority => 'notice',
                        Message  => "Denied '$Param{Type}' access for "
                            . "UserID: $Param{UserID} on "
                            . "WorkOrderID '$Param{WorkOrderID}' "
                            . "because $Modules{$Module}->{Module} is required!",
                    );
                }

                # deny permission
                return;
            }
        }
    }

    # Deny access when neither a 'Granted'-Check nor a 'Required'-Check has reached a conclusion.
    if ( !$Param{LogNo} ) {
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "Permission denied (UserID: $Param{UserID} '$Param{Type}' "
                . "on WorkOrderID: $Param{WorkOrderID})!",
        );
    }

    return;
}

=item WorkOrderStateIDsCheck()

Check whether all of the given workorder state ids are valid.

    my $Ok = $WorkOrderObject->WorkOrderStateIDsCheck(
        WorkOrderStateIDs => [ 25 ],
    );

=cut

sub WorkOrderStateIDsCheck {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{WorkOrderStateIDs} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need WorkOrderStateID!',
        );
        return;
    }

    if ( ref $Param{WorkOrderStateIDs} ne 'ARRAY' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'The param WorkOrderStateIDs must be an ARRAY reference!',
        );
        return;
    }

    # check if WorkOrderStateIDs belongs to correct general catalog class
    for my $StateID ( @{ $Param{WorkOrderStateIDs} } ) {
        my $State = $Self->WorkOrderStateLookup(
            WorkOrderStateID => $StateID,
        );

        if ( !$State ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The state id $StateID is not valid!",
            );

            return;
        }
    }

    return 1;
}

=item WorkOrderAttachmentAdd()

Add an attachment to a given change

    my $Success = $WorkOrderObject->WorkOrderAttachmentAdd(
        WorkOrderID    => 123,
        Filename    => 'filename,
        Content     => 'content',
        ContentID   => 'some_content@id',
        ContentType => 'text/plain',
        UserID      => 1,
    );

=cut

sub WorkOrderAttachmentAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(WorkOrderID Filename Content ContentType UserID ChangeID WorkOrderID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );

            return;
        }
    }

    # write to virtual fs
    my $Success = $Self->{VirtualFSObject}->Write(
        Filename    => "WorkOrder/$Param{WorkOrderID}/" . $Param{Filename},
        Mode        => 'binary',
        Content     => \$Param{Content},
        Preferences => {
            ContentID   => $Param{ContentID},
            ContentType => $Param{ContentType},
            WorkOrderID => $Param{WorkOrderID},
            UserID      => $Param{UserID},
        },
    );

    # check for error
    if ($Success) {

        # trigger AttachmentAdd-Event
        $Self->EventHandler(
            Event => 'AttachmentAddPost',
            Data  => {
                %Param,
            },
            UserID => $Param{UserID},
        );
    }
    else {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Cannot add attachment for workorder $Param{WorkOrderID}",
        );

        return;
    }

    return 1;
}

=item WorkOrderAttachmentDelete()

Delete a given file from virtual fs.

    my $Success = $WorkOrderObject->WorkOrderAttachmentDelete(
        FileID => 1234,
        UserID => 1,
    );

=cut

sub WorkOrderAttachmentDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(FileID UserID ChangeID WorkOrderID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );

            return;
        }
    }

    # search for attachments
    my %Attachments = $Self->{VirtualFSObject}->Search(
        FileID => $Param{FileID},
    );

    # get filename
    my $Filename = $Attachments{ $Param{FileID} };

    # delete file
    my $Success = $Self->{VirtualFSObject}->Delete(
        Filename => $Filename,
    );

    $Filename =~ s{ \A WorkOrder / \d+ / }{}xms;

    # check for error
    if ($Success) {

        # trigger AttachmentDeletePost-Event
        $Self->EventHandler(
            Event => 'AttachmentDeletePost',
            Data  => {
                %Param,
                Filename => $Filename,
            },
            UserID => $Param{UserID},
        );
    }
    else {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Cannot delete attachment $Param{FileID}!",
        );

        return;
    }

    return $Success;
}

=item WorkOrderAttachmentGet()

This method returns information about one specific attachment.

    my $Attachment = $WorkOrderObject->WorkOrderAttachmentGet(
        FileID => 123,
    );

returns

    {
        Preferences => {
            AllPreferences => 'test',
        },
        Filename    => 'test.txt',
        Content     => 'hallo',
        ContentType => 'text/plain',
        Filesize    => '123 KBytes',
        Type        => 'attachment',
    }

=cut

sub WorkOrderAttachmentGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{FileID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need FileID!',
        );

        return;
    }

    # search for attachments
    my %Attachments = $Self->{VirtualFSObject}->Search(
        FileID => $Param{FileID},
    );

    # get filename
    my $Filename = $Attachments{ $Param{FileID} };

    # return error if file does not exist
    if ( !$Filename ) {
        $Self->{LogObject}->Log(
            Message  => "No such attachment ($Param{FileID})! May be an attack!!!",
            Priority => 'error',
        );
        return;
    }

    # get data for attachment
    my %AttachmentData = $Self->{VirtualFSObject}->Read(
        Filename => $Filename,
        Mode     => 'binary',
    );

    # remove extra information from filename
    ( my $NameDisplayed = $Filename ) =~ s{ \A WorkOrder / \d+ / }{}xms;

    my $AttachmentInfo = {
        %AttachmentData,
        Filename    => $NameDisplayed,
        Content     => ${ $AttachmentData{Content} },
        ContentType => $AttachmentData{Preferences}->{ContentType},
        Type        => 'attachment',
        FileID      => $Param{FileID},
        Filesize    => $AttachmentData{Preferences}->{Filesize},
    };

    return $AttachmentInfo;
}

=item WorkOrderAttachmentList()

returns a hash with all attachments of a given change. The file id is the key
and the filename is the value

    my %Attachments = $WorkOrderObject->WorkOrderAttachmentList(
        WorkOrderID => 123,
    );

returns

    123 => 'filename.txt',
    435 => 'other_file.pdf',

=cut

sub WorkOrderAttachmentList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{WorkOrderID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need WorkOrderID!',
        );

        return;
    }

    # search for attachments
    my %Attachments = $Self->{VirtualFSObject}->Search(
        Preferences => {
            WorkOrderID => $Param{WorkOrderID},
        },
    );

    for my $FileID ( keys %Attachments ) {

        # remove extra information from filename
        $Attachments{$FileID} =~ s{ \A WorkOrder / \d+ / }{}xms;
    }

    return %Attachments;
}

=begin Internal:

=item _CheckWorkOrderTypeIDs()

check whether the given workorder type ids are all valid

    my $Ok = $WorkOrderObject->_CheckWorkOrderTypeIDs(
        WorkOrderTypeIDs => [ 2, 500 ],
    );

=cut

sub _CheckWorkOrderTypeIDs {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{WorkOrderTypeIDs} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need WorkOrderTypeIDs!',
        );

        return;
    }

    if ( ref $Param{WorkOrderTypeIDs} ne 'ARRAY' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'The param WorkOrderTypeIDs must be an ARRAY reference!',
        );

        return;
    }

    # check if WorkOrderTypeIDs belongs to correct general catalog class
    for my $TypeID ( @{ $Param{WorkOrderTypeIDs} } ) {
        my $Type = $Self->WorkOrderTypeLookup(
            WorkOrderTypeID => $TypeID,
        );

        if ( !$Type ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The type id $TypeID is not valid!",
            );

            return;
        }
    }

    return 1;
}

=item _GetWorkOrderNumber()

Get a new unused workorder number for a given ChangeID.
The highest current workorder number for a given change is
looked up and increased by one.

    my $WorkOrderNumber = $WorkOrderObject->_GetWorkOrderNumber(
        ChangeID => 2,
    );

=cut

sub _GetWorkOrderNumber {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ChangeID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ChangeID!',
        );
        return;
    }

    # get max workorder number
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT MAX(workorder_number) '
            . 'FROM change_workorder '
            . 'WHERE change_id = ?',
        Bind  => [ \$Param{ChangeID} ],
        Limit => 1,
    );

    # fetch the result
    my $WorkOrderNumber;
    while ( my @Row = $Self->{DBObject}->FetchrowArray ) {
        $WorkOrderNumber = $Row[0];
    }

    # increment number to get a non-existent workorder number
    $WorkOrderNumber++;

    return $WorkOrderNumber;
}

=item _CheckWorkOrderParams()

Checks the params to WorkORderAdd() and WorkORderUpdate().
There are no required parameters.

    my $Ok = $WorkOrderObject->_CheckWorkOrderParams(
        ChangeID         => 123,                                             # (optional)
        WorkOrderNumber  => 5,                                               # (optional)
        WorkOrderTitle   => 'Replacement of mail server',                    # (optional)
        Instruction      => 'Install the <b>new</b> server',                 # (optional)
        InstructionPlain => 'Install the new server',                        # (optional)
        Report           => 'Installed new server <b>without</b> problems',  # (optional)
        ReportPlain      => 'Installed new server without problems',         # (optional)
        WorkOrderStateID => 4,                                               # (optional)
        WorkOrderTypeID  => 12,                                              # (optional)
        WorkOrderAgentID => 8,                                               # (optional)
        PlannedStartTime => '2009-10-01 10:33:00',                           # (optional)
        ActualStartTime  => '2009-10-01 10:33:00',                           # (optional)
        PlannedEndTime   => '2009-10-01 10:33:00',                           # (optional)
        ActualEndTime    => '2009-10-01 10:33:00',                           # (optional)
    );

These string parameters have length constraints:

    Parameter        | max. length
    -----------------+-----------------
    WorkOrderTitle   |  250 characters
    Instruction      | 3800 characters
    InstructionPlain | 3800 characters
    Report           | 3800 characters
    ReportPlain      | 3800 characters

=cut

sub _CheckWorkOrderParams {
    my ( $Self, %Param ) = @_;

    # check the string and id parameters
    ARGUMENT:
    for my $Argument (
        qw(
        WorkOrderTitle
        Instruction
        InstructionPlain
        Report
        ReportPlain
        WorkOrderAgentID
        WorkOrderStateID
        WorkOrderTypeID
        WorkOrderNumber
        ChangeID
        )
        )
    {

        # params are not required
        next ARGUMENT if !exists $Param{$Argument};

        # check if param is not defined
        if ( !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter '$Argument' must be defined!",
            );
            return;
        }

        # check if param is not a reference
        if ( ref $Param{$Argument} ne '' ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter '$Argument' mustn't be a reference!",
            );
            return;
        }

        # check the maximum length of title
        if ( $Argument eq 'WorkOrderTitle' && length( $Param{$Argument} ) > 250 ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter '$Argument' must be shorter than 250 characters!",
            );
            return;
        }

        # check the maximum length of description and justification
        if (
            $Argument    eq 'Instruction'
            || $Argument eq 'InstructionPlain'
            || $Argument eq 'Report'
            || $Argument eq 'ReportPlain'
            )
        {
            if ( length( $Param{$Argument} ) > 3800 ) {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "The parameter '$Argument' must be shorter than 3800 characters!",
                );
                return;
            }
        }
    }

    # check time formats
    OPTION:
    for my $Option (qw(PlannedStartTime PlannedEndTime ActualStartTime ActualEndTime)) {
        next OPTION if !$Param{$Option};

        return if $Param{$Option} !~ m{ \A \d\d\d\d-\d\d-\d\d \s \d\d:\d\d:\d\d \z }xms;
    }

    # check workorder agent
    if ( exists $Param{WorkOrderAgentID} && defined $Param{WorkOrderAgentID} ) {

        # WorkOrderAgent must be an agent
        my %UserData = $Self->{UserObject}->GetUserData(
            UserID => $Param{WorkOrderAgentID},
            Valid  => 1,
        );

        if ( !$UserData{UserID} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The WorkOrderAgent $Param{WorkOrderAgentID} is not a valid user id!",
            );
            return;
        }
    }

    # check if given WorkOrderStateID is valid
    if ( exists $Param{WorkOrderStateID} ) {
        return if !$Self->WorkOrderStateIDsCheck(
            WorkOrderStateIDs => [ $Param{WorkOrderStateID} ],
        );
    }

    # check if given WorkOrderTypeID is valid
    if ( exists $Param{WorkOrderTypeID} ) {
        return if !$Self->_CheckWorkOrderTypeIDs(
            WorkOrderTypeIDs => [ $Param{WorkOrderTypeID} ],
        );
    }

    return 1;
}

=item _CheckTimestamps()

Checks the constraints of timestamps: xxxStartTime must be before xxxEndTime

    my $Ok = $WorkOrderObject->_CheckTimestamps(
        WorkOrderData    => $WorkOrderData,
        PlannedStartTime => '2009-10-12 00:00:01',     # (optional) or undef
        PlannedEndTime   => '2009-10-15 15:00:00',     # (optional) or undef
        ActualStartTime  => '2009-10-14 00:00:01',     # (optional) or undef
        ActualEndTime    => '2009-01-20 00:00:01',     # (optional) or undef
    );

If PlannedStartTime is given, PlannedEndTime has to be given, too - and vice versa.
If ActualStartTime is given ActualEndTime is optional.
But if ActualEndTime is given then ActualStartTime has to be given, too.
WorkOrderData is only passed for improving the performance.

=cut

sub _CheckTimestamps {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(WorkOrderData)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my $DefaultTimeStamp = '9999-01-01 00:00:00';

    # check times
    TYPE:
    for my $Type (qw(Actual Planned)) {

        # at least one of the start or end times is needed
        next TYPE if !exists $Param{ $Type . 'StartTime' } && !exists $Param{ $Type . 'EndTime' };

        # for the log messages
        my $TypeLc = lc $Type;

        my $StartTime;
        if ( !exists $Param{ $Type . 'StartTime' } ) {

            # if a time is not given, get it from the workorder
            $StartTime = $Param{WorkOrderData}->{ $Type . 'StartTime' };
        }
        elsif ( !defined $Param{ $Type . 'StartTime' } ) {

            # special case for clearing the time
            $StartTime = $DefaultTimeStamp;
        }
        elsif ( !$Param{ $Type . 'StartTime' } ) {

            # if a time is not given, get it from the workorder
            $StartTime = $Param{WorkOrderData}->{ $Type . 'StartTime' };
        }
        elsif ( $Param{ $Type . 'StartTime' } eq $DefaultTimeStamp ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The value $StartTime is invalid for the $TypeLc start time!",
            );
            return;
        }
        else {
            $StartTime = $Param{ $Type . 'StartTime' };
        }

        my $EndTime;
        if ( !exists $Param{ $Type . 'EndTime' } ) {

            # if a time is not given, get it from the workorder
            $EndTime = $Param{WorkOrderData}->{ $Type . 'EndTime' };
        }
        elsif ( !defined $Param{ $Type . 'EndTime' } ) {

            # special case for clearing the time
            $EndTime = $DefaultTimeStamp;
        }
        elsif ( !$Param{ $Type . 'EndTime' } ) {

            # if a time is not given, get it from the workorder
            $EndTime = $Param{WorkOrderData}->{ $Type . 'EndTime' };
        }
        elsif ( $Param{ $Type . 'EndTime' } eq $DefaultTimeStamp ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The value $EndTime is invalid for the $TypeLc end time!",
            );
            return;
        }
        else {
            $EndTime = $Param{ $Type . 'EndTime' };
        }

        # don't check actual start time when change has not ended yet
        next TYPE if $Type eq 'Actual' && $StartTime && !$EndTime;

        # the check fails if not both (start and end) times are present
        if ( !$StartTime || !$EndTime ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "$Type start time and $TypeLc end time must be given!",
            );
            return;
        }

        # check the ordering of the times, only in the non-default-case
        if ( $StartTime ne $DefaultTimeStamp && $EndTime ne $DefaultTimeStamp ) {

            # remove all non-digit characters
            $StartTime =~ s{ \D }{}xmsg;
            $EndTime   =~ s{ \D }{}xmsg;

            # start time must be smaller than end time
            if ( $StartTime >= $EndTime ) {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message =>
                        "The $TypeLc start time '$StartTime' must be before the $TypeLc end time '$EndTime'!",
                );
                return;
            }
        }
    }

    return 1;
}

sub DESTROY {
    my $Self = shift;

    # TODO (ub: this must be commented out until further investigation!)
    #    # execute all transaction events
    #    $Self->EventHandlerTransaction();

    return 1;
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=cut

=head1 VERSION

$Revision: 1.53 $ $Date: 2009/12/16 20:45:44 $

=cut
