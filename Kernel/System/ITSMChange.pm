# --
# Kernel/System/ITSMChange.pm - all change functions
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: ITSMChange.pm,v 1.36 2009/10/13 12:13:30 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange;

use strict;
use warnings;

use Kernel::System::Valid;
use Kernel::System::GeneralCatalog;
use Kernel::System::LinkObject;
use Kernel::System::ITSMChange::WorkOrder;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.36 $) [1];

=head1 NAME

Kernel::System::ITSMChange - change lib

=head1 SYNOPSIS

All functions for changes in ITSMChangeManagement.

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
    use Kernel::System::ITSMChange;

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
    my $ChangeObject = Kernel::System::ITSMChange->new(
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

    $Self->{ValidObject}          = Kernel::System::Valid->new( %{$Self} );
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
    $Self->{LinkObject}           = Kernel::System::LinkObject->new( %{$Self} );
    $Self->{UserObject}           = Kernel::System::User->new( %{$Self} );
    $Self->{CustomerUserObject}   = Kernel::System::CustomerUser->new( %{$Self} );
    $Self->{WorkOrderObject}      = Kernel::System::ITSMChange::WorkOrder->new( %{$Self} );

    return $Self;
}

=item ChangeAdd()

add a new change

    my $ChangeID = $ChangeObject->ChangeAdd(
        UserID => 1,
    );
or
    my $ChangeID = $ChangeObject->ChangeAdd(
        Title           => 'Replacement of mail server',       # (optional)
        Description     => 'New mail server is faster',        # (optional)
        Justification   => 'Old mail server too slow',         # (optional)
        ChangeStateID   => 4,                                  # (optional)
        ChangeManagerID => 5,                                  # (optional)
        ChangeBuilderID => 6,                                  # (optional)
        CABAgents       => [ 1, 2, 4 ],     # UserIDs          # (optional)
        CABCustomers    => [ 'tt', 'mm' ],  # CustomerUserIDs  # (optional)
        UserID          => 1,
    );

=cut

sub ChangeAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );
        return;
    }

    # check change parameters
    return if !$Self->_CheckChangeParams(%Param);

    # create a new change number
    my $ChangeNumber = $Self->_ChangeNumberCreate();

    # TODO: replace this later with State-Condition-Action logic
    # get initial change state id
    my $ItemDataRef = $Self->{GeneralCatalogObject}->ItemGet(
        Class => 'ITSM::ChangeManagement::Change::State',
        Name  => 'requested',
    );
    my $ChangeStateID = $ItemDataRef->{ItemID};

    # add change to database
    return if !$Self->{DBObject}->Do(
        SQL => 'INSERT INTO change_item '
            . '(change_number, change_state_id, change_builder_id, '
            . ' create_time, create_by, change_time, change_by) '
            . 'VALUES (?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$ChangeNumber, \$ChangeStateID, \$Param{UserID},
            \$Param{UserID}, \$Param{UserID},
        ],
    );

    # get change id
    my $ChangeID = $Self->ChangeNumberLookup(
        UserID       => $Param{UserID},
        ChangeNumber => $ChangeNumber,
    );

    return if !$ChangeID;

    # TODO: trigger ChangeAdd-Event

    # update change with remaining parameters
    return if !$Self->ChangeUpdate(
        ChangeID => $ChangeID,
        %Param,
    );

    return $ChangeID;
}

=item ChangeUpdate()

update a change

    my $Success = $ChangeObject->ChangeUpdate(
        ChangeID        => 123,
        Title           => 'Replacement of slow mail server',  # (optional)
        Description     => 'New mail server is faster',        # (optional)
        Justification   => 'Old mail server too slow',         # (optional)
        ChangeStateID   => 4,                                  # (optional)
        ChangeManagerID => 5,                                  # (optional)
        ChangeBuilderID => 6,                                  # (optional)
        CABAgents       => [ 1, 2, 4 ],     # UserIDs          # (optional)
        CABCustomers    => [ 'tt', 'mm' ],  # CustomerUserIDs  # (optional)
        UserID          => 1,
    );

=cut

sub ChangeUpdate {
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

    # check change parameters
    return if !$Self->_CheckChangeParams(%Param);

    # map update attributes to column names
    my %Attribute = (
        Title           => 'title',
        Description     => 'description',
        Justification   => 'justification',
        ChangeStateID   => 'change_state_id',
        ChangeManagerID => 'change_manager_id',
        ChangeBuilderID => 'change_builder_id',
    );

    # update CAB
    if ( exists $Param{CABAgents} || exists $Param{CABCustomers} ) {
        return if !$Self->ChangeCABUpdate(%Param);
    }

    # build SQL to update change
    my $SQL = 'UPDATE change_item SET ';
    my @Bind;
    ATTRIBUTE:
    for my $Key ( keys %Attribute ) {

        # do not use column if not in function parameters
        next ATTRIBUTE if !exists $Param{$Key};

        $SQL .= "$Attribute{$Key} = ?, ";
        push @Bind, \$Param{$Key};
    }
    push @Bind, \$Param{UserID}, \$Param{ChangeID};
    $SQL .= 'change_time = current_timestamp, change_by = ? ';
    $SQL .= 'WHERE id = ? ';

    # add change to database
    return if !$Self->{DBObject}->Do(
        SQL  => $SQL,
        Bind => \@Bind,
    );

    # TODO: trigger ChangeUpdate-Event

    return 1;
}

=item ChangeGet()

return a change as a hash reference

Return
    $Change{ChangeID}
    $Change{ChangeNumber}
    $Change{Title}
    $Change{Description}
    $Change{Justification}
    $Change{ChangeManagerID}
    $Change{ChangeBuilderID}
    $Change{WorkOrderIDs}     # array reference with WorkOrderIDs
    $Change{CABAgents}        # array reference with CAB Agent UserIDs
    $Change{CABCustomers}     # array reference with CAB CustomerUserIDs
    $Change{PlannedStartTime}
    $Change{PlannedEndTime}
    $Change{ActualStartTime}
    $Change{ActualEndTime}
    $Change{CreateTime}
    $Change{CreateBy}
    $Change{ChangeTime}
    $Change{ChangeBy}

    my $ChangeRef = $ChangeObject->ChangeGet(
        ChangeID => 123,
        UserID   => 1,
    );

=cut

sub ChangeGet {
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

    # build SQL
    my $SQL = 'SELECT id, change_number, title, description, justification, '
        . 'change_state_id, change_manager_id, change_builder_id, '
        . 'create_time, create_by, change_time, change_by '
        . 'FROM change_item '
        . 'WHERE id = ? ';

    # get change data from database
    return if !$Self->{DBObject}->Prepare(
        SQL   => $SQL,
        Bind  => [ \$Param{ChangeID} ],
        Limit => 1,
    );

    # fetch the result
    my %ChangeData;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $ChangeData{ChangeID}        = $Row[0];
        $ChangeData{ChangeNumber}    = $Row[1];
        $ChangeData{Title}           = $Row[2] || '';
        $ChangeData{Description}     = $Row[3] || '';
        $ChangeData{Justification}   = $Row[4] || '';
        $ChangeData{ChangeStateID}   = $Row[5];
        $ChangeData{ChangeManagerID} = $Row[6];
        $ChangeData{ChangeBuilderID} = $Row[7];
        $ChangeData{CreateTime}      = $Row[8];
        $ChangeData{CreateBy}        = $Row[9];
        $ChangeData{ChangeTime}      = $Row[10];
        $ChangeData{ChangeBy}        = $Row[11];
    }

    # get CAB data
    my $CAB = $Self->ChangeCABGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # add result to change data
    %ChangeData = ( %ChangeData, %{$CAB} );

    # get all workorder ids for this change
    my $WorkOrderIDsRef = $Self->{WorkOrderObject}->WorkOrderList(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # add result to change data
    $ChangeData{WorkOrderIDs} = $WorkOrderIDsRef || [];

    # get PlannedStartTime
    $ChangeData{PlannedStartTime} = $Self->{WorkOrderObject}->WorkOrderChangeStartGet(
        ChangeID => $Param{ChangeID},
        Type     => 'planned',
        UserID   => $Param{UserID},
    );

    # get PlannedEndTime
    $ChangeData{PlannedEndTime} = $Self->{WorkOrderObject}->WorkOrderChangeEndGet(
        ChangeID => $Param{ChangeID},
        Type     => 'planned',
        UserID   => $Param{UserID},
    );

    # get PlannedStartTime
    $ChangeData{ActualStartTime} = $Self->{WorkOrderObject}->WorkOrderChangeStartGet(
        ChangeID => $Param{ChangeID},
        Type     => 'actual',
        UserID   => $Param{UserID},
    );

    # get ActualStartTime
    $ChangeData{ActualEndTime} = $Self->{WorkOrderObject}->WorkOrderChangeEndGet(
        ChangeID => $Param{ChangeID},
        Type     => 'actual',
        UserID   => $Param{UserID},
    );

    return \%ChangeData;
}

=item ChangeCABUpdate()

add or update the CAB of a change.
One of CABAgents and CABCustomers must be passed.
Passing a reference to an empty array deletes the CAB.
When an agents or customer is passed multiple time, he will
be inserted only once.

    my $Success = $ChangeObject->ChangeCABUpdate(
        ChangeID     => 123,
        CABAgents    => [ 1, 2, 4 ],     # UserIDs          (optional)
        CABCustomers => [ 'tt', 'mm' ],  # CustomerUserIDs  (optional)
        UserID       => 1,
    );

=cut

sub ChangeCABUpdate {
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

    # either CABAgents of CABCustomers or both must be passed
    if ( !$Param{CABAgents} && !$Param{CABCustomers} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need parameter CABAgents or CABCustomers!",
        );
        return;
    }

    # CABAgents and CABCustomers must be array references
    for my $Attribute (qw(CABAgents CABCustomers)) {
        if ( $Param{$Attribute} && ref $Param{$Attribute} ne 'ARRAY' ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter $Attribute is not an arrray reference!",
            );
            return;
        }
    }

    # enter the CAB Agents
    if ( $Param{CABAgents} ) {

        # remove old list
        return if !$Self->{DBObject}->Do(
            SQL => 'DELETE FROM change_cab '
                . 'WHERE change_id = ? '
                . 'AND user_id IS NOT NULL',
            Bind => [ \$Param{ChangeID} ],
        );

        # Insert an user only once
        my %Seen;
        USER_ID:
        for my $UserID ( @{ $Param{CABAgents} } ) {
            next USER_ID if $Seen{$UserID};
            $Seen{$UserID} = 1;

            return if !$Self->{DBObject}->Do(
                SQL => 'INSERT INTO change_cab ( change_id, user_id ) '
                    . 'VALUES ( ?, ? )',
                Bind => [ \$Param{ChangeID}, \$UserID ],
            );
        }
    }

    # enter the CAB Customers
    if ( $Param{CABCustomers} ) {

        # remove old list
        return if !$Self->{DBObject}->Do(
            SQL => 'DELETE FROM change_cab '
                . 'WHERE change_id = ? '
                . 'AND customer_user_id IS NOT NULL',
            Bind => [ \$Param{ChangeID} ],
        );

        # Insert an customer only once
        my %Seen;
        CUSTOMER_USER_ID:
        for my $CustomerUserID ( @{ $Param{CABCustomers} } ) {
            next CUSTOMER_USER_ID if $Seen{$CustomerUserID};
            $Seen{$CustomerUserID} = 1;

            return if !$Self->{DBObject}->Do(
                SQL => 'INSERT INTO change_cab ( change_id, customer_user_id ) '
                    . 'VALUES ( ?, ? )',
                Bind => [ \$Param{ChangeID}, \$CustomerUserID ],
            );
        }
    }

    # TODO: trigger ChangeCABUpdate-Event

    return 1;
}

=item ChangeCABGet()

return the CAB of a change as hasharray reference

Return
    $ChangeCAB = {
        CABAgents    => [ 1, 2, 4 ],
        CABCustomers => [ 'tt', 'mm' ],
    }

    my $ChangeCAB = $ChangeObject->ChangeCABGet(
        ChangeID => 123,
        UserID   => 1,
    );

=cut

sub ChangeCABGet {
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

    # cab data
    my %CAB = (
        CABAgents    => [],
        CABCustomers => [],
    );

    # get data
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT id, change_id, user_id, customer_user_id '
            . 'FROM change_cab WHERE change_id = ?',
        Bind => [ \$Param{ChangeID} ],
    );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        my %Data;
        $Data{CABID}          = $Row[0];
        $Data{ChangeID}       = $Row[1];
        $Data{UserID}         = $Row[2];
        $Data{CustomerUserID} = $Row[3];

        # error check
        if ( $Data{UserID} && $Data{CustomerUserID} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message =>
                    "CAB table entry with ID $Data{CABID} contains UserID and CustomerUserID! "
                    . 'Only one at a time is allowed!',
            );
            return;
        }

        # add data to CAB
        if ( $Data{UserID} ) {
            push @{ $CAB{CABAgents} }, $Data{UserID};
        }
        elsif ( $Data{CustomerUserID} ) {
            push @{ $CAB{CABCustomers} }, $Data{CustomerUserID};
        }
    }

    return \%CAB;
}

=item ChangeCABDelete()

delete the CAB of a change

    my $Success = $ChangeObject->ChangeCABDelete(
        ChangeID => 123,
        UserID   => 1,
    );

=cut

sub ChangeCABDelete {
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

    # delete CAB
    return if !$Self->{DBObject}->Do(
        SQL  => 'DELETE FROM change_cab WHERE change_id = ?',
        Bind => [ \$Param{ChangeID} ],
    );

    return 1;
}

=item ChangeNumberLookup()

Return the change id when the passed change number.
Return the change number when the change id is passed.
When no change id or change number is found, the undefined value is returned.

    my $ChangeID = $ChangeObject->ChangeNumberLookup(
        ChangeNumber => '2009091742000465',
        UserID => 1,
    );

    my $ChangeNumber = $ChangeObject->ChangeNumberLookup(
        ChangeID => 42,
        UserID => 1,
    );

=cut

sub ChangeNumberLookup {
    my ( $Self, %Param ) = @_;

    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );
        return;
    }

    # the change id or the change number must be passed
    if ( !$Param{ChangeID} && !$Param{ChangeNummber} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need the ChangeId or the ChangeNumber!",
        );
        return;
    }

    # only one of change id abd change number can be passed
    if ( $Param{ChangeID} && $Param{ChangeNummber} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need either the ChangeId or the ChangeNumber, not both!",
        );
        return;
    }

    # get change id
    if ( $Param{ChangeNumber} ) {
        return if !$Self->{DBObject}->Prepare(
            SQL => 'SELECT id FROM change_item '
                . 'WHERE change_number = ?',
            Bind  => [ \$Param{ChangeNumber} ],
            Limit => 1,
        );

        my $ChangeID;
        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            $ChangeID = $Row[0];
        }

        return $ChangeID;
    }

    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT change_number FROM change_item '
            . 'WHERE id = ?',
        Bind  => [ \$Param{ChangeID} ],
        Limit => 1,
    );

    my $ChangeNumber;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $ChangeNumber = $Row[0];
    }

    return $ChangeNumber;
}

=item ChangeList()

return a change id list of all changes as array reference

    my $ChangeIDsRef = $ChangeObject->ChangeList(
        UserID => 1,
    );

=cut

sub ChangeList {
    my ( $Self, %Param ) = @_;

    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );
        return;
    }

    # get change id
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT id FROM change_item',
    );

    my @ChangeIDs;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @ChangeIDs, $Row[0];
    }

    return \@ChangeIDs;
}

=item ChangeSearch()

return list of change ids as an array reference

    my $ChangeIDsRef = $ChangeObject->ChangeSearch(
        ChangeNumber     => '2009100112345778',                 # (optional)
        Title            => 'Replacement of slow mail server',  # (optional)
        Description      => 'New mail server is faster',        # (optional)
        Justification    => 'Old mail server too slow',         # (optional)
        ChangeStateID    => 4,                                  # (optional)

        ChangeManagerID  => 5,                                  # (optional)
        ChangeBuilderID  => 6,                                  # (optional)
        WorkOrderAgentID => 7,                                  # (optional)
        CABAgent         => 9,                                  # (optional)
        CABCustomer      => 'tt',                               # (optional)

        # changes with planned start time after ...
        PlannedStartTimeNewerDate => '2006-01-09 00:00:01',     # (optional)
        # changes with planned start time before then ....
        PlannedStartTimeOlderDate => '2006-01-19 23:59:59',     # (optional)

        # changes with planned end time after ...
        PlannedEndTimeNewerDate => '2006-01-09 00:00:01',       # (optional)
        # changes with planned end time before then ....
        PlannedEndTimeOlderDate => '2006-01-19 23:59:59',       # (optional)

        # changes with actual start time after ...
        ActualStartTimeNewerDate => '2006-01-09 00:00:01',      # (optional)
        # changes with actual start time before then ....
        ActualStartTimeOlderDate => '2006-01-19 23:59:59',      # (optional)

        # changes with actual end time after ...
        ActualEndTimeNewerDate => '2006-01-09 00:00:01',        # (optional)
        # changes with actual end time before then ....
        ActualEndTimeOlderDate => '2006-01-19 23:59:59',        # (optional)

        # changes with created time after ...
        CreateTimeNewerDate => '2006-01-09 00:00:01',           # (optional)
        # changes with created time before then ....
        CreateTimeOlderDate => '2006-01-19 23:59:59',           # (optional)

        # changes with changed time after ...
        ChangeTimeNewerDate => '2006-01-09 00:00:01',           # (optional)
        # changes with changed time before then ....
        ChangeTimeOlderDate => '2006-01-19 23:59:59',           # (optional)

        OrderBy => 'ChangeID',  # default                       # (optional)
        # (ChangeID, ChangeNumber, ChangeStateID,
        # ChangeManagerID, ChangeBuilderID,
        # PlannedStartTime, PlannedEndTime,
        # ActualStartTime, ActualEndTime,
        # CreateTime, CreateBy, ChangeTime, ChangeBy)

        Limit => 100,                                           # (optional)

        UserID => 1,
    );

=cut

sub ChangeSearch {
    my ( $Self, %Param ) = @_;

    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );
        return;
    }

    return;
}

=item ChangeDelete()

delete a change

NOTE: This function must first remove all links to this ChangeObject,
      delete the history of this ChangeObject, delete the CAB,
      then get a list of all WorkOrderObjects of this change and
      call WorkorderDelete for each WorkOrder (which will itself delete
      all links to the WorkOrder).

    my $Success = $ChangeObject->ChangeDelete(
        ChangeID => 123,
        UserID   => 1,
    );

=cut

sub ChangeDelete {
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

    # TODO: delete the links to the change

    # TODO: delete the history

    # delete the work orders
    my %Change = $Self->ChangeGet(%Param);
    return if !%Change;
    return if !$Change{WorkOrderIDs};
    for my $WorkOrderID ( @{ $Change{WorkOrderIDs} } ) {
        $Self->{WorkOrderObject}->WorkOrderDelete(
            UserID      => $Param{UserID},
            WorkOrderID => $WorkOrderID
        );
    }

    # delete the CAB
    return if !$Self->ChangeCABDelete(%Param);

    # delete the change
    return if !$Self->{DBObject}->Do(
        SQL => 'DELETE FROM change_item '
            . 'WHERE id = ? ',
        Bind => [ \$Param{ChangeID} ],
    );

    return 1;
}

=item ChangeWorkflowEdit()

edit the workflow of a change

NOTE: To be defined in more detail!

    my $Success = $ChangeObject->ChangeWorkflowEdit(
        ChangeID  => 123,
        UserID    => 1,
    );

=cut

sub ChangeWorkflowEdit {
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

    return;
}

=item ChangeWorkflowList()

list the workflow of a change

NOTE: To be defined in more detail!

    my $ChangeWorkflow = $ChangeObject->ChangeWorkflowList(
        ChangeID => 123,
        UserID   => 1,
    );

=cut

sub ChangeWorkflowList {
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

    return;
}

=item _CheckChangeStateID()

check if a given change state id is valid

    my $Ok = $ChangeObject->_CheckChangeStateID(
        ChangeStateID => 25,
    );

=cut

sub _CheckChangeStateID {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ChangeStateID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need ChangeStateID!",
        );
        return;
    }

    # get change state list
    my $ChangeStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ChangeManagement::Change::State',
    );

    if (
        !$ChangeStateList
        || ref $ChangeStateList ne 'HASH'
        || !$ChangeStateList->{ $Param{ChangeStateID} }
        )
    {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No valid change state id given!",
        );
        return;
    }

    return 1;
}

=item _ChangeNumberCreateOld()

create a new change number

    my $ChangeNumber= $ChangeObject->_ChangeNumberCreateOld();

=cut

sub _ChangeNumberCreateOld {
    my ( $Self, %Param ) = @_;

    # TODO : Replace this function with the similar code as in DateChecksum in OTRS!!!!

    # get needed config options
    my $SystemID = $Self->{ConfigObject}->Get('SystemID');

    # get current time
    my ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = $Self->{TimeObject}->SystemTime2Date(
        SystemTime => $Self->{TimeObject}->SystemTime(),
    );

    # create random number
    my $RandomNumber = int( rand(100000) );

    # create new change number
    my $ChangeNumber = $Year . $Month . $Day . $SystemID . $RandomNumber;

    return $ChangeNumber;
}

=item _ChangeNumberCreate()

create a new change number

    my $ChangeNumber= $ChangeObject->_ChangeNumberCreate();

=cut

sub _ChangeNumberCreate {

    my ( $Self, %Param ) = @_;

    # get needed config options
    my $CounterLog = $Self->{ConfigObject}->Get('ITSMChange::CounterLog');
    my $SystemID   = $Self->{ConfigObject}->Get('SystemID');

    # define number of maximum loops if created change number exists
    my $MaxRetryNumber        = 16000;
    my $LoopProtectionCounter = 0;

    # try to create a unique change number for up to $MaxRetryNumber times
    while ( $LoopProtectionCounter <= $MaxRetryNumber ) {

        # get current time
        my ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = $Self->{TimeObject}->SystemTime2Date(
            SystemTime => $Self->{TimeObject}->SystemTime(),
        );

        # read count
        my $Count      = 0;
        my $LastModify = '';
        if ( -f $CounterLog ) {
            my $ContentSCALARRef = $Self->{MainObject}->FileRead(
                Location => $CounterLog,
            );
            if ( $ContentSCALARRef && ${$ContentSCALARRef} ) {
                ( $Count, $LastModify ) = split( /;/, ${$ContentSCALARRef} );

                # just debug
                if ( $Self->{Debug} > 0 ) {
                    $Self->{LogObject}->Log(
                        Priority => 'debug',
                        Message  => "Read counter from $CounterLog: $Count",
                    );
                }
            }
        }

        # check if we need to reset the counter
        if ( !$LastModify || $LastModify ne "$Year-$Month-$Day" ) {
            $Count = 0;
        }

        # count auto increment ($Count++)
        $Count++;

        # increase the the counter faster if we are in loop pretection mode
        $Count += $LoopProtectionCounter;

        my $Content = $Count . ";$Year-$Month-$Day;";

        # write new count
        my $Write = $Self->{MainObject}->FileWrite(
            Location => $CounterLog,
            Content  => \$Content,
        );
        if ($Write) {
            if ( $Self->{Debug} > 0 ) {
                $Self->{LogObject}->Log(
                    Priority => 'debug',
                    Message  => "Write counter: $Count",
                );
            }
        }

        # pad ticket number with leading '0' to length 5
        while ( length($Count) < 5 ) {
            $Count = '0' . $Count;
        }

        # create new change number
        my $ChangeNumber = $Year . $Month . $Day . $SystemID . $Count;

        # calculate a checksum
        my $ChkSum = 0;
        my $Mult   = 1;
        for ( my $i = 0; $i < length($ChangeNumber); ++$i ) {
            my $Digit = substr( $ChangeNumber, $i, 1 );
            $ChkSum = $ChkSum + ( $Mult * $Digit );
            $Mult += 1;
            if ( $Mult == 3 ) {
                $Mult = 1;
            }
        }
        $ChkSum %= 10;
        $ChkSum = 10 - $ChkSum;
        if ( $ChkSum == 10 ) {
            $ChkSum = 1;
        }

        # add checksum to change number
        $ChangeNumber .= $ChkSum;

        # lookup if change number exists already
        my $ChangeID = $Self->ChangeNumberLookup(
            ChangeNumber => $ChangeNumber,
            UserID       => $Param{UserID},
        );

        # now we have a new unused change number and return it
        return $ChangeNumber if !$ChangeID;

        # start loop protection mode
        $LoopProtectionCounter++;

        # create new change number again
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "ChangeNumber ($ChangeNumber) exists! Creating a new one.",
        );
    }

    # loop was running too long
    $Self->{LogObject}->Log(
        Priority => 'error',
        Message  => "LoopProtectionCounter is now $LoopProtectionCounter!"
            . " Stopped ChangeNumberCreate()!",
    );
    return;
}

=item _ChangeTicksGet()

NOTE: Maybe this function better belongs to Kernel/Output/HTML/LayoutITSMChange.pm

short description of _ChangeTicksGet

    my $Result = $ChangeObject->_ChangeTicksGet(
        ChangeID => 123,
    );

=cut

sub _ChangeTicksGet {
    my ( $Self, %Param ) = @_;

    return;
}

=item _CheckChangeParams()

checks the params to ChangeAdd() and ChangeUpdate().
There are no required parameters.

    my $Ok = $ChangeObject->_CheckChangeParams(
        Title           => 'Replacement of mail server',       # (optional)
        Description     => 'New mail server is faster',        # (optional)
        Justification   => 'Old mail server too slow',         # (optional)
        ChangeStateID   => 4,                                  # (optional)
        ChangeManagerID => 5,                                  # (optional)
        ChangeBuilderID => 6,                                  # (optional)
        CABAgents       => [ 1, 2, 4 ],     # UserIDs          # (optional)
        CABCustomers    => [ 'tt', 'mm' ],  # CustomerUserIDs  # (optional)
    );

=cut

sub _CheckChangeParams {
    my ( $Self, %Param ) = @_;

    # check the string and id parameters
    ARGUMENT:
    for my $Argument (
        qw( Title Description Justification ChangeManagerID ChangeBuilderID ChangeStateID )
        )
    {

        next ARGUMENT if !exists $Param{$Argument};    # params are not required

        if ( !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter $Argument must be defined!",
            );
            return;
        }

        if ( ref $Param{$Argument} ne '' ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter $Argument mustn't be a reference!",
            );
            return;
        }

        # check the maximum length of title
        if ( $Argument eq 'Title' && length( $Param{$Argument} ) > 250 ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter $Argument must be shorter than 250 characters!",
            );
            return;
        }

        # check the maximum length of description and justification
        if ( $Argument eq 'Description' || $Argument eq 'Justification' ) {
            if ( length( $Param{$Argument} ) > 3800 ) {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "The parameter $Argument must be shorter than 3800 characters!",
                );
                return;
            }
        }
    }

    # check if given ChangeStateID is valid
    return if $Param{ChangeStateID} && !$Self->_CheckChangeStateID(
        ChangeStateID => $Param{ChangeStateID},
    );

    # change manager and change builder must be agents
    ARGUMENT:
    for my $Argument (qw( ChangeManagerID ChangeBuilderID )) {

        next ARGUMENT if !exists $Param{$Argument};    # params are not required

        my %UserData = $Self->{UserObject}->GetUserData(
            UserID => $Param{$Argument},
            Valid  => 1,
        );

        if ( !$UserData{UserID} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The $Argument $Param{$Argument} is not a valid user id!",
            );
            return;
        }
    }

    # CAB agents must be agents
    if ( exists $Param{CABAgents} ) {
        if ( ref $Param{CABAgents} ne 'ARRAY' ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter CABAgents is not an ARRAY reference!",
            );
            return;
        }

        # check users
        for my $UserID ( @{ $Param{CABAgents} } ) {
            my %UserData = $Self->{UserObject}->GetUserData(
                UserID => $UserID,
                Valid  => 1,
            );
            if ( !$UserData{UserID} ) {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "The CABAgent $UserID is not a valid user id!",
                );
                return;
            }
        }
    }

    # CAB customers must be customers
    if ( exists $Param{CABCustomers} ) {
        if ( ref $Param{CABCustomers} ne 'ARRAY' ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter CABCustomers is not an ARRAY reference!",
            );
            return;
        }

        # check customer users
        for my $CustomerUser ( @{ $Param{CABCustomers} } ) {
            my %CustomerUserData = $Self->{CustomerUserObject}->CustomerUserDataGet(
                User  => $CustomerUser,
                Valid => 1,
            );
            if ( !%CustomerUserData ) {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "The CABCustomer $CustomerUser is not a valid customer!",
                );
                return;
            }
        }
    }

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=cut

=head1 VERSION

$Revision: 1.36 $ $Date: 2009/10/13 12:13:30 $

=cut
