# --
# Kernel/System/ITSMChange.pm - all change functions
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: ITSMChange.pm,v 1.157 2009/11/18 13:30:01 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange;

use strict;
use warnings;

use Kernel::System::GeneralCatalog;
use Kernel::System::LinkObject;
use Kernel::System::User;
use Kernel::System::Group;
use Kernel::System::CustomerUser;
use Kernel::System::ITSMChange::ITSMWorkOrder;
use Kernel::System::HTMLUtils;

use base qw(Kernel::System::EventHandler);

use vars qw($VERSION);
$VERSION = qw($Revision: 1.157 $) [1];

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

    # set the debug flag
    $Self->{Debug} = $Param{Debug} || 0;

    # create additional objects
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
    $Self->{LinkObject}           = Kernel::System::LinkObject->new( %{$Self} );
    $Self->{UserObject}           = Kernel::System::User->new( %{$Self} );
    $Self->{GroupObject}          = Kernel::System::Group->new( %{$Self} );
    $Self->{CustomerUserObject}   = Kernel::System::CustomerUser->new( %{$Self} );
    $Self->{WorkOrderObject}      = Kernel::System::ITSMChange::ITSMWorkOrder->new( %{$Self} );
    $Self->{HTMLUtilsObject}      = Kernel::System::HTMLUtils->new( %{$Self} );

    # init of event handler
    $Self->EventHandlerInit(
        Config     => 'ITSMChange::EventModule',
        BaseObject => 'ChangeObject',
        Objects    => {
            %{$Self},
        },
    );

    return $Self;
}

=item ChangeAdd()

Add a new change. The UserId is the only required parameter.
Internally first a minimal change is created, then ChangeUpdate() is called.

    my $ChangeID = $ChangeObject->ChangeAdd(
        UserID => 1,
    );

or

    my $ChangeID = $ChangeObject->ChangeAdd(
        ChangeTitle     => 'Replacement of mail server',       # (optional)
        Description     => 'New mail server is faster',        # (optional)
        Justification   => 'Old mail server too slow',         # (optional)
        ChangeStateID   => 4,                                  # (optional) or ChangeState => 'accepted'
        ChangeState     => 'accepted',                         # (optional) or ChangeStateID => 4
        ChangeManagerID => 5,                                  # (optional)
        ChangeBuilderID => 6,                                  # (optional)
        CABAgents       => [ 1, 2, 4 ],     # UserIDs          # (optional)
        CABCustomers    => [ 'tt', 'mm' ],  # CustomerUserIDs  # (optional)
        RealizeTime     => '2006-01-19 23:59:59',              # (optional)
        UserID          => 1,
    );

=cut

sub ChangeAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    # check change parameters
    return if !$Self->_CheckChangeParams(%Param);

    # trigger ChangeAddPre-Event
    $Self->EventHandler(
        Event => 'ChangeAddPre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

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
            . 'create_time, create_by, change_time, change_by) '
            . 'VALUES (?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$ChangeNumber, \$ChangeStateID, \$Param{UserID},
            \$Param{UserID}, \$Param{UserID},
        ],
    );

    # get change id
    my $ChangeID = $Self->ChangeLookup(
        UserID       => $Param{UserID},
        ChangeNumber => $ChangeNumber,
    );

    return if !$ChangeID;

    # trigger ChangeAddPost-Event
    # (yes, we want do do this before the ChangeUpdate!)
    $Self->EventHandler(
        Event => 'ChangeAddPost',
        Data  => {
            ChangeID => $ChangeID,
            %Param,
        },
        UserID => $Param{UserID},
    );

    # update change with remaining parameters
    my $UpdateSuccess = $Self->ChangeUpdate(
        ChangeID => $ChangeID,
        %Param,
    );

    # check update error
    if ( !$UpdateSuccess ) {

        # delete change if it could not be updated
        $Self->ChangeDelete(
            ChangeID => $ChangeID,
            UserID   => $Param{UserID},
        );

        return;
    }

    return $ChangeID;
}

=item ChangeUpdate()

Update a change.
Leading and trailing whitespace is removed from ChangeTitle.

    my $Success = $ChangeObject->ChangeUpdate(
        ChangeID        => 123,
        ChangeTitle     => 'Replacement of slow mail server',  # (optional)
        Description     => 'New mail server is faster',        # (optional)
        Justification   => 'Old mail server too slow',         # (optional)
        ChangeStateID   => 4,                                  # (optional) or ChangeState => 'accepted'
        ChangeState     => 'accepted',                         # (optional) or ChangeStateID => 4
        ChangeManagerID => 5,                                  # (optional)
        ChangeBuilderID => 6,                                  # (optional)
        CABAgents       => [ 1, 2, 4 ],     # UserIDs          # (optional)
        CABCustomers    => [ 'tt', 'mm' ],  # CustomerUserIDs  # (optional)
        RealizeTime     => '2006-01-19 23:59:59',              # (optional)
        UserID          => 1,
    );

=cut

sub ChangeUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ChangeID UserID )) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check that not both ChangeState and ChangeStateID are given
    if ( $Param{ChangeState} && $Param{ChangeStateID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need either ChangeState OR ChangeStateID - not both!',
        );
        return;
    }

    # when the State is given, then look up the ID
    if ( $Param{ChangeState} ) {
        $Param{ChangeStateID} = $Self->ChangeStateLookup(
            State => $Param{ChangeState},
        );
    }

    # normalize the ChangeTitle, when it is given
    if ( $Param{ChangeTitle} && !ref $Param{ChangeTitle} ) {

        # remove leading whitespace
        $Param{ChangeTitle} =~ s{ \A \s+ }{}xms;

        # remove trailing whitespace
        $Param{ChangeTitle} =~ s{ \s+ \z }{}xms;
    }

    # check change parameters
    return if !$Self->_CheckChangeParams(%Param);

    # trigger ChangeUpdatePre-Event
    $Self->EventHandler(
        Event => 'ChangeUpdatePre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    # get old change data to be given to post event handler
    my $ChangeData = $Self->ChangeGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # update CAB
    if ( exists $Param{CABAgents} || exists $Param{CABCustomers} ) {
        return if !$Self->ChangeCABUpdate(%Param);
    }

    # get a plain ascii version of description
    if ( exists $Param{Description} ) {
        if ( defined $Param{Description} ) {
            $Param{DescriptionPlain} = $Self->{HTMLUtilsObject}->ToAscii(
                String => $Param{Description},
            );
        }
        else {
            $Param{DescriptionPlain} = undef;
        }
    }

    # get a plain ascii version of justification
    if ( exists $Param{Justification} ) {
        if ( defined $Param{Justification} ) {
            $Param{JustificationPlain} = $Self->{HTMLUtilsObject}->ToAscii(
                String => $Param{Justification},
            );
        }
        else {
            $Param{JustificationPlain} = undef;
        }
    }

    # map update attributes to column names
    my %Attribute = (
        ChangeTitle        => 'title',
        Description        => 'description',
        Justification      => 'justification',
        ChangeStateID      => 'change_state_id',
        ChangeManagerID    => 'change_manager_id',
        ChangeBuilderID    => 'change_builder_id',
        RealizeTime        => 'realize_time',
        DescriptionPlain   => 'description_plain',
        JustificationPlain => 'justification_plain',
    );

    # build SQL to update change
    my $SQL = 'UPDATE change_item SET ';
    my @Bind;

    CHANGEATTRIBUTE:
    for my $ChangeAttribute ( keys %Attribute ) {

        # do not use column if not in function parameters
        next CHANGEATTRIBUTE if !exists $Param{$ChangeAttribute};

        $SQL .= "$Attribute{$ChangeAttribute} = ?, ";
        push @Bind, \$Param{$ChangeAttribute};
    }

    push @Bind, \$Param{UserID}, \$Param{ChangeID};
    $SQL .= 'change_time = current_timestamp, change_by = ? ';
    $SQL .= 'WHERE id = ?';

    # add change to database
    return if !$Self->{DBObject}->Do(
        SQL  => $SQL,
        Bind => \@Bind,
    );

    # trigger ChangeUpdatePost-Event
    $Self->EventHandler(
        Event => 'ChangeUpdatePost',
        Data  => {
            OldChangeData => $ChangeData,
            %Param,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ChangeGet()

return a change as a hash reference

    my $ChangeRef = $ChangeObject->ChangeGet(
        ChangeID => 123,
        UserID   => 1,
    );

The returned hash reference contains following elements:

    $Change{ChangeID}
    $Change{ChangeNumber}
    $Change{ChangeStateID}
    $Change{ChangeState}
    $Change{ChangeStateSignal}  # fetched from SysConfig
    $Change{ChangeTitle}
    $Change{Description}
    $Change{Justification}
    $Change{ChangeManagerID}
    $Change{ChangeBuilderID}
    $Change{WorkOrderIDs}       # array reference with WorkOrderIDs
    $Change{CABAgents}          # array reference with CAB Agent UserIDs
    $Change{CABCustomers}       # array reference with CAB CustomerUserIDs
    $Change{PlannedStartTime}   # determined from the workorders
    $Change{PlannedEndTime}     # determined from the workorders
    $Change{ActualStartTime}    # determined from the workorders
    $Change{ActualEndTime}      # determined from the workorders
    $Change{RealizeTime}
    $Change{CreateTime}
    $Change{CreateBy}
    $Change{ChangeTime}
    $Change{ChangeBy}

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

    # get data from database
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT id, change_number, title, description, justification, '
            . 'change_state_id, change_manager_id, change_builder_id, '
            . 'create_time, create_by, change_time, change_by, realize_time '
            . 'FROM change_item '
            . 'WHERE id = ? ',
        Bind  => [ \$Param{ChangeID} ],
        Limit => 1,
    );

    # fetch the result
    my %ChangeData;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $ChangeData{ChangeID}          = $Row[0];
        $ChangeData{ChangeNumber}      = $Row[1];
        $ChangeData{ChangeTitle}       = defined( $Row[2] ) ? $Row[2] : '';
        $ChangeData{Description}       = defined( $Row[3] ) ? $Row[3] : '';
        $ChangeData{Justification}     = defined( $Row[4] ) ? $Row[4] : '';
        $ChangeData{ChangeStateID}     = $Row[5];
        $ChangeData{ChangeState}       = undef;
        $ChangeData{ChangeStateSignal} = undef;
        $ChangeData{ChangeManagerID}   = $Row[6];
        $ChangeData{ChangeBuilderID}   = $Row[7];
        $ChangeData{CreateTime}        = $Row[8];
        $ChangeData{CreateBy}          = $Row[9];
        $ChangeData{ChangeTime}        = $Row[10];
        $ChangeData{ChangeBy}          = $Row[11];
        $ChangeData{RealizeTime}       = $Row[12];
    }

    # check error
    if ( !%ChangeData ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Change with ID $Param{ChangeID} does not exist.",
        );
        return;
    }

    # set name of change state
    if ( $ChangeData{ChangeStateID} ) {
        $ChangeData{ChangeState} = $Self->ChangeStateLookup(
            StateID => $ChangeData{ChangeStateID},
        );
    }

    # set the change state signal
    if ( $ChangeData{ChangeState} ) {

        # get all change state signals
        my $StateSignal = $Self->{ConfigObject}->Get('ITSMChange::State::Signal');

        $ChangeData{ChangeStateSignal} = $StateSignal->{ $ChangeData{ChangeState} };
    }

    # get CAB data
    my $CAB = $Self->ChangeCABGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    ) || {};

    # add result to change data
    %ChangeData = ( %ChangeData, %{$CAB} );

    # get all workorder ids for this change
    my $WorkOrderIDsRef = $Self->{WorkOrderObject}->WorkOrderList(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # add result to change data
    $ChangeData{WorkOrderIDs} = $WorkOrderIDsRef || [];

    # get timestamps for the change
    my $ChangeTime = $Self->{WorkOrderObject}->WorkOrderChangeTimeGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # merge time hash with change hash
    if (
        $ChangeTime
        && ref $ChangeTime eq 'HASH'
        && %{$ChangeTime}
        )
    {
        %ChangeData = ( %ChangeData, %{$ChangeTime} );
    }

    return \%ChangeData;
}

=item ChangeCABUpdate()

Add or update the CAB of a change.
One or both of CABAgents and CABCustomers must be passed.
Passing a reference to an empty array deletes the part of the CAB (CABAgents or CABCustomers)
When agents or customers are passed multiple times, they will be inserted only once.

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

    # check if CABAgents and CABCustomers exist in the agents and customer databases
    return if !$Self->_CheckChangeParams(%Param);

    # trigger ChangeCABUpdatePre-Event
    $Self->EventHandler(
        Event => 'ChangeCABUpdatePre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    # get old CAB data to be given to post event handler
    my $ChangeCABData = $Self->ChangeCABGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # enter the CAB Agents
    if ( $Param{CABAgents} ) {

        # remove all current users from cab table
        return if !$Self->{DBObject}->Do(
            SQL => 'DELETE FROM change_cab '
                . 'WHERE change_id = ? '
                . 'AND user_id IS NOT NULL',
            Bind => [ \$Param{ChangeID} ],
        );

        # filter out unique users
        my %UniqueUsers = map { $_ => 1 } @{ $Param{CABAgents} };

        # add user to cab table
        for my $UserID ( keys %UniqueUsers ) {
            return if !$Self->{DBObject}->Do(
                SQL => 'INSERT INTO change_cab ( change_id, user_id ) VALUES ( ?, ? )',
                Bind => [ \$Param{ChangeID}, \$UserID ],
            );
        }
    }

    # enter the CAB Customers
    if ( $Param{CABCustomers} ) {

        # remove all current customer users from cab table
        return if !$Self->{DBObject}->Do(
            SQL => 'DELETE FROM change_cab '
                . 'WHERE change_id = ? '
                . 'AND customer_user_id IS NOT NULL',
            Bind => [ \$Param{ChangeID} ],
        );

        # filter out unique customer users
        my %UniqueCustomerUsers = map { $_ => 1 } @{ $Param{CABCustomers} };

        # add user to cab table
        for my $CustomerUserID ( keys %UniqueCustomerUsers ) {
            return if !$Self->{DBObject}->Do(
                SQL => 'INSERT INTO change_cab ( change_id, customer_user_id ) VALUES ( ?, ? )',
                Bind => [ \$Param{ChangeID}, \$CustomerUserID ],
            );
        }
    }

    # trigger ChangeCABUpdatePost-Event
    $Self->EventHandler(
        Event => 'ChangeCABUpdatePost',
        Data  => {
            OldChangeCABData => $ChangeCABData,
            %Param,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ChangeCABGet()

Return the CAB of a change as a hashref, where the values are arrayrefs.
The returned array references are sorted.

    my $ChangeCAB = $ChangeObject->ChangeCABGet(
        ChangeID => 123,
        UserID   => 1,
    );

Returns:

    $ChangeCAB = {
        CABAgents    => [ 1, 2, 4 ],
        CABCustomers => [ 'aa', 'bb' ],
    }

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
        my $CABID          = $Row[0];
        my $ChangeID       = $Row[1];
        my $UserID         = $Row[2];
        my $CustomerUserID = $Row[3];

        # error check if both columns are filled
        if ( $UserID && $CustomerUserID ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message =>
                    "CAB table entry with ID $CABID contains UserID and CustomerUserID! "
                    . 'Only one at a time is allowed!',
            );
            return;
        }

        # add data to CAB
        if ($UserID) {
            push @{ $CAB{CABAgents} }, $UserID;
        }
        elsif ($CustomerUserID) {
            push @{ $CAB{CABCustomers} }, $CustomerUserID;
        }
    }

    # sort the results
    @{ $CAB{CABAgents} }    = sort @{ $CAB{CABAgents} };
    @{ $CAB{CABCustomers} } = sort @{ $CAB{CABCustomers} };

    return \%CAB;
}

=item ChangeCABDelete()

Delete the CAB of a change.

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

    # trigger ChangeCABDeletePre-Event
    $Self->EventHandler(
        Event => 'ChangeCABDeletePre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    # get old CAB data to be given to post event handler
    my $ChangeCABData = $Self->ChangeCABGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # delete CAB
    return if !$Self->{DBObject}->Do(
        SQL  => 'DELETE FROM change_cab WHERE change_id = ?',
        Bind => [ \$Param{ChangeID} ],
    );

    # trigger ChangeCABDeletePost-Event
    $Self->EventHandler(
        Event => 'ChangeCABDeletePost',
        Data  => {
            OldChangeCABData => $ChangeCABData,
            %Param,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ChangeLookup()

Return the change id when the change number is passed.
Return the change number when the change id is passed.
When no change id or change number is found, then the undefined value is returned.

    my $ChangeID = $ChangeObject->ChangeLookup(
        ChangeNumber => '2009091742000465',
        UserID => 1,
    );

    my $ChangeNumber = $ChangeObject->ChangeLookup(
        ChangeID => 42,
        UserID => 1,
    );

=cut

sub ChangeLookup {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    # the change id or the change number must be passed
    if ( !$Param{ChangeID} && !$Param{ChangeNumber} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need the ChangeID or the ChangeNumber!',
        );
        return;
    }

    # only one of change id and change number can be passed
    if ( $Param{ChangeID} && $Param{ChangeNummber} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need either the ChangeID or the ChangeNumber, not both!',
        );
        return;
    }

    # get change id
    if ( $Param{ChangeNumber} ) {
        return if !$Self->{DBObject}->Prepare(
            SQL   => 'SELECT id FROM change_item WHERE change_number = ?',
            Bind  => [ \$Param{ChangeNumber} ],
            Limit => 1,
        );

        my $ChangeID;
        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            $ChangeID = $Row[0];
        }

        return $ChangeID;
    }

    # get change number
    elsif ( $Param{ChangeID} ) {

        return if !$Self->{DBObject}->Prepare(
            SQL   => 'SELECT change_number FROM change_item WHERE id = ?',
            Bind  => [ \$Param{ChangeID} ],
            Limit => 1,
        );

        my $ChangeNumber;
        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            $ChangeNumber = $Row[0];
        }

        return $ChangeNumber;
    }

    return;
}

=item ChangeList()

Return a change id list of all changes as an array reference.

    my $ChangeIDsRef = $ChangeObject->ChangeList(
        UserID => 1,
    );

=cut

sub ChangeList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
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

Return a list of the found change ids as an array reference.
The search criteria are logically AND connected.
When a list is passed as criterium, the individual members are OR connected.
When an undef or a reference to an empty array is passed, then the search criterium
is ignored.

    my $ChangeIDsRef = $ChangeObject->ChangeSearch(
        ChangeNumber      => '2009100112345778',                       # (optional)

        ChangeTitle       => 'Replacement of slow mail server',        # (optional)
        Description       => 'New mail server is faster',              # (optional)
        Justification     => 'Old mail server too slow',               # (optional)

        # array parameters are used with logical OR operator
        ChangeStateIDs    => [ 11, 12, 13 ],                           # (optional)
        ChangeStates      => [ 'requested','failed' ],                 # (optional)
        ChangeManagerIDs  => [ 1, 2, 3 ],                              # (optional)
        ChangeBuilderIDs  => [ 5, 7, 4 ],                              # (optional)
        CreateBy          => [ 5, 2, 3 ],                              # (optional)
        ChangeBy          => [ 3, 2, 1 ],                              # (optional)
        WorkOrderAgentIDs => [ 6, 2 ],                                 # (optional)
        CABAgents         => [ 9, 13 ],                                # (optional)
        CABCustomers      => [ 'tt', 'xx' ],                           # (optional)

        # search in text fields of workorder object
        WorkOrderTitle            => 'Boot Mailserver',
        WorkOrderInstruction      => 'Press the button.',
        WorkOrderReport           => 'Mailserver has booted.',

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

        # changes with realize time after ...
        RealizeTimeNewerDate      => '2006-01-09 00:00:01',            # (optional)
        # changes with realize time before then ....
        RealizeTimeOlderDate      => '2006-01-19 23:59:59',            # (optional)

        OrderBy => [ 'ChangeID', 'ChangeManagerID' ],                  # (optional)
        # default: [ 'ChangeID' ]
        # (ChangeID, ChangeNumber, ChangeStateID,
        # ChangeManagerID, ChangeBuilderID,
        # PlannedStartTime, PlannedEndTime,
        # ActualStartTime, ActualEndTime,
        # CreateTime, CreateBy, ChangeTime, ChangeBy)

        # Additional information for OrderBy:
        # The OrderByDirection can be specified for each OrderBy attribute.
        # The pairing is made by the array indices.

        OrderByDirection => [ 'Down', 'Up' ],                          # (optional)
        # default: [ 'Down' ]
        # (Down | Up)

        UsingWildcards => 1,                                           # (optional)
        # (0 | 1) default 1

        Limit => 100,                                                  # (optional)

        UserID => 1,
    );

=cut

sub ChangeSearch {
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
        ChangeStateIDs
        ChangeStates
        ChangeManagerIDs
        ChangeBuilderIDs
        CABAgents
        CABCustomers
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

    # define order table
    my %OrderByTable = (
        ChangeID         => 'c.id',
        ChangeNumber     => 'c.change_number',
        ChangeStateID    => 'c.change_state_id',
        ChangeManagerID  => 'c.change_manager_id',
        ChangeBuilderID  => 'c.change_builder_id',
        CreateTime       => 'c.create_time',
        CreateBy         => 'c.create_by',
        ChangeTime       => 'c.change_time',
        ChangeBy         => 'c.change_by',
        PlannedStartTime => 'MIN(wo1.planned_start_time)',
        PlannedEndTime   => 'MAX(wo1.planned_end_time)',
        ActualStartTime  => 'MIN(wo1.actual_start_time)',
        ActualEndTime    => 'MAX(wo1.actual_end_time)',
    );

    # check if OrderBy contains only unique valid values
    my %OrderBySeen;
    for my $OrderBy ( @{ $Param{OrderBy} } ) {

        if ( !$OrderBy || !$OrderByTable{$OrderBy} || $OrderBySeen{$OrderBy} ) {

            # found an error
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "OrderBy contains invalid value '$OrderBy' "
                    . "or the value is used more than once!",
            );
            return;
        }

        # remember the value to check if it appears more than once
        $OrderBySeen{$OrderBy} = 1;
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

    # check whether all of the given ChangeStateIDs are valid
    return if !$Self->_CheckChangeStateIDs( ChangeStateIDs => $Param{ChangeStateIDs} );

    # look up and thus check the States
    for my $ChangeState ( @{ $Param{ChangeStates} } ) {

        # look up the ID for the name
        my $ChangeStateID = $Self->ChangeStateLookup(
            State => $ChangeState,
        );

        # check whether the ID was found, whether the name exists
        if ( !$ChangeStateID ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The change state $ChangeState is not known!",
            );

            return;
        }

        push @{ $Param{ChangeStateIDs} }, $ChangeStateID;
    }

    my @SQLWhere;           # assemble the conditions used in the WHERE clause
    my @SQLHaving;          # assemble the conditions used in the HAVING clause
    my @InnerJoinTables;    # keep track of the tables that need to be inner joined
    my @OuterJoinTables;    # keep track of the tables that need to be outer joined

    # add string params to the WHERE clause
    my %StringParams = (

        # strings in change_item
        ChangeNumber  => 'c.change_number',
        ChangeTitle   => 'c.title',
        Description   => 'c.description_plain',
        Justification => 'c.justification_plain',

        # strings in change_workorder
        WorkOrderTitle       => 'wo2.title',
        WorkOrderInstruction => 'wo2.instruction_plain',
        WorkOrderReport      => 'wo2.report_plain',
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

        if ( $StringParams{$StringParam} =~ m{ wo2 }xms ) {

            # the change_workorder table needs to be joined, when it occurs in the WHERE clause
            push @InnerJoinTables, 'wo2';
        }
    }

    # set array params
    my %ArrayParams = (
        ChangeStateIDs   => 'c.change_state_id',
        ChangeManagerIDs => 'c.change_manager_id',
        ChangeBuilderIDs => 'c.change_builder_id',
        CreateBy         => 'c.create_by',
        ChangeBy         => 'c.change_by',
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
        my $InString = join q{, }, @{ $Param{$ArrayParam} };

        push @SQLWhere, "$ArrayParams{$ArrayParam} IN ($InString)";
    }

    # set time params
    my %TimeParams = (

        # times in change_item
        CreateTimeNewerDate  => 'c.create_time >=',
        CreateTimeOlderDate  => 'c.create_time <=',
        ChangeTimeNewerDate  => 'c.change_time >=',
        ChangeTimeOlderDate  => 'c.change_time <=',
        RealizeTimeNewerDate => 'c.realize_time >=',
        RealizeTimeOlderDate => 'c.realize_time <=',

        # times in change_workorder
        PlannedStartTimeNewerDate => 'min(wo1.planned_start_time) >=',
        PlannedStartTimeOlderDate => 'min(wo1.planned_start_time) <=',
        PlannedEndTimeNewerDate   => 'max(wo1.planned_end_time) >=',
        PlannedEndTimeOlderDate   => 'max(wo1.planned_end_time) <=',
        ActualStartTimeNewerDate  => 'min(wo1.actual_start_time) >=',
        ActualStartTimeOlderDate  => 'min(wo1.actual_start_time) <=',
        ActualEndTimeNewerDate    => 'max(wo1.actual_end_time) >=',
        ActualEndTimeOlderDate    => 'max(wo1.actual_end_time) <=',
    );

    # check and add time params to WHERE or HAVING clause
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

        $Param{$TimeParam} = $Self->{DBObject}->Quote( $Param{$TimeParam} );

        if ( $TimeParams{$TimeParam} =~ m{ wo1 }xms ) {

            # the change_workorder table needs to be joined, when it occurs in the HAVING clause
            push @SQLHaving,       "$TimeParams{$TimeParam} '$Param{$TimeParam}'";
            push @OuterJoinTables, 'wo1';
        }
        else {

            # the time attributes of change_item show up in the WHERE clause
            push @SQLWhere, "$TimeParams{$TimeParam} '$Param{$TimeParam}'";
        }
    }

    # conditions for CAB searches
    my %CABParams = (
        CABAgents    => 'cab1.user_id',
        CABCustomers => 'cab2.customer_user_id',
    );

    # add cab params to sql-where-array
    CABPARAM:
    for my $CABParam ( keys %CABParams ) {
        next CABPARAM if !@{ $Param{$CABParam} };

        # quote
        for my $OneParam ( @{ $Param{$CABParam} } ) {
            $OneParam = $Self->{DBObject}->Quote($OneParam);
        }

        if ( $CABParam eq 'CABAgents' ) {

            # CABAgent is a integer, so no quotes are needed
            my $InString = join q{, }, @{ $Param{$CABParam} };
            push @SQLWhere,        "$CABParams{$CABParam} IN ($InString)";
            push @InnerJoinTables, 'cab1';
        }
        elsif ( $CABParam eq 'CABCustomers' ) {

            # CABCustomer is a string, so the single quotes are needed
            my $InString = join q{, }, map {"'$_'"} @{ $Param{$CABParam} };
            push @SQLWhere,        "$CABParams{$CABParam} IN ($InString)";
            push @InnerJoinTables, 'cab2';
        }
    }

    # add workorder agent id params to sql-where-array
    if ( @{ $Param{WorkOrderAgentIDs} } ) {

        # quote
        for my $OneParam ( @{ $Param{WorkOrderAgentIDs} } ) {
            $OneParam = $Self->{DBObject}->Quote($OneParam);
        }

        # create string
        my $InString = join q{, }, @{ $Param{WorkOrderAgentIDs} };

        push @SQLWhere,        "wo2.workorder_agent_id IN ( $InString )";
        push @InnerJoinTables, 'wo2';
    }

    # define which parameter require a join with workorder table
    my %TableRequiresJoin = (
        PlannedStartTime => 1,
        PlannedEndTime   => 1,
        ActualStartTime  => 1,
        ActualEndTime    => 1,
    );

    # assemble the ORDER BY clause
    my @SQLOrderBy;
    my @SQLAliases;    # order by aliases, be on the save side with MySQL
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
        if ( $OrderByTable{$OrderBy} =~ m{ wo1 }xms ) {
            push @SQLAliases, "$OrderByTable{$OrderBy} as alias_$OrderBy";
            push @SQLOrderBy, "alias_$OrderBy $Direction";
        }
        else {
            push @SQLOrderBy, "$OrderByTable{$OrderBy} $Direction";
        }

        # for some order fields, we need to make sure, that the wo1 table is joined
        if ( $TableRequiresJoin{$OrderBy} ) {
            push @OuterJoinTables, 'wo1';
        }
    }
    continue {
        $Count++;
    }

    # if there is a possibility that the ordering is not determined
    # we add an descending ordering by id
    if ( !grep { $_ eq 'ChangeID' } ( @{ $Param{OrderBy} } ) ) {
        push @SQLOrderBy, "$OrderByTable{ChangeID} DESC";
    }

    # assemble the SQL query
    my $SQL = 'SELECT ' . join( ', ', ( 'c.id', @SQLAliases ) ) . ' FROM change_item c ';

    # add the joins
    my %LongTableName = (
        wo1  => 'change_workorder',
        wo2  => 'change_workorder',
        cab1 => 'change_cab',
        cab2 => 'change_cab',
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

        $SQL .= "INNER JOIN $LongTableName{$Table} $Table ON $Table.change_id = c.id ";
    }

    OUTER_JOIN_TABLE:
    for my $Table (@OuterJoinTables) {

        # do not join a table twice, when a table has been inner joined, no outer join is necessary
        next OUTER_JOIN_TABLE if $TableSeen{$Table};

        # remember that this table is joined already
        $TableSeen{$Table} = 1;

        # check error
        if ( !$LongTableName{$Table} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Encountered invalid outer join table '$Table'!",
            );
            return;
        }

        $SQL .= "LEFT OUTER JOIN $LongTableName{$Table} $Table ON $Table.change_id = c.id ";
    }

    # add the WHERE clause
    if (@SQLWhere) {
        $SQL .= 'WHERE ';
        $SQL .= join ' AND ', map {"( $_ )"} @SQLWhere;
        $SQL .= ' ';
    }

    # we need to group whenever there is a join
    if ( scalar @InnerJoinTables || scalar @OuterJoinTables ) {
        $SQL .= 'GROUP BY c.id ';
    }

    # add the HAVING clause
    if (@SQLHaving) {
        $SQL .= 'HAVING ';
        $SQL .= join ' AND ', map {"( $_ )"} @SQLHaving;
        $SQL .= ' ';
    }

    # add the ORDER BY clause
    if (@SQLOrderBy) {
        $SQL .= 'ORDER BY ';
        $SQL .= join q{, }, @SQLOrderBy;
        $SQL .= ' ';
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

    return \@IDs;
}

=item ChangeDelete()

Delete a change.

This function first removes all links to this ChangeObject.
Then it gets a list of all WorkOrderObjects of this change and
calls WorkorderDelete for each WorkOrder (which will itself delete
all links to the WorkOrder).
Then it deletes the CAB.
The history of this ChangeObject will be deleted by the calling the
ChangeDeletePostEvent.

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

    # trigger ChangeDeletePre-Event
    $Self->EventHandler(
        Event => 'ChangeDeletePre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    # the change does not exist, when it can't be looked up
    return if !$Self->ChangeLookup(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # delete all links to this change
    return if !$Self->{LinkObject}->LinkDeleteAll(
        Object => 'ITSMChange',
        Key    => $Param{ChangeID},
        UserID => 1,
    );

    # get change data to get the workorder ids
    my $ChangeData = $Self->ChangeGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # check if change contains workorders
    if (
        $ChangeData
        && ref $ChangeData eq 'HASH'
        && $ChangeData->{WorkOrderIDs}
        && ref $ChangeData->{WorkOrderIDs} eq 'ARRAY'
        )
    {

        # delete the workorders
        for my $WorkOrderID ( @{ $ChangeData->{WorkOrderIDs} } ) {
            return if !$Self->{WorkOrderObject}->WorkOrderDelete(
                WorkOrderID => $WorkOrderID,
                UserID      => $Param{UserID},
            );
        }
    }

    # delete the CAB
    return if !$Self->ChangeCABDelete(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # trigger ChangeDeletePost-Event
    # this must be done before deleting the change from the database,
    # because of a foreign key constraint in the change_history table
    $Self->EventHandler(
        Event => 'ChangeDeletePost',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    # delete the change
    return if !$Self->{DBObject}->Do(
        SQL  => 'DELETE FROM change_item WHERE id = ? ',
        Bind => [ \$Param{ChangeID} ],
    );

    return 1;
}

=item ChangeWorkflowEdit()

Edit the workflow of a change.

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

List the workflows of a change.

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

=item ChangeStateLookup()

This method does a lookup for a change state. If a change state id is given,
it returns the name of the change state. If a change state name is given,
the appropriate id is returned.

    my $Name = $ChangeObject->ChangeStateLookup(
        StateID => 1234,
    );

    my $ID = $ChangeObject->ChangeStateLookup(
        State => 'accepted',
    );

=cut

sub ChangeStateLookup {
    my ( $Self, %Param ) = @_;

    # either StateID or State must be passed
    if ( !$Param{StateID} && !$Param{State} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need StateID or State!',
        );
        return;
    }

    if ( $Param{StateID} && $Param{State} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need StateID OR State - not both!',
        );
        return;
    }

    # get change state from general catalog
    # mapping of the id to the name
    my %ChangeState = %{
        $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::ChangeManagement::Change::State',
            ) || {}
        };

    if ( $Param{StateID} ) {
        return $ChangeState{ $Param{StateID} };
    }
    else {

        # reverse key - value pairs to have the name as keys
        my %ReversedChangeState = reverse %ChangeState;

        return $ReversedChangeState{ $Param{State} };
    }
}

=item ChangePossibleStatesGet()

This method returns a list of possible change states.
For now the required parameter ChangeID is checked,
but not yet used for producing the list.

    my $ChangeStateList = $ChangeObject->ChangePossibleStatesGet(
        ChangeID => 123,
        UserID      => 1,
    );

The return value is a reference to an array of hashrefs. The Element 'Key' is then
the StateID and die Element 'Value' is the name of the state. The array elements
are sorted by state id.

    my $ChangeStateList = [
        {
            Key   => 156,
            Value => 'approved',
        },
        {
            Key   => 157,
            Value => 'in progress',
        },
    ];

=cut

sub ChangePossibleStatesGet {
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

    # get workorder state list
    my $StateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ChangeManagement::Change::State',
    ) || {};

    # assemble a an array of hash refs
    my @ArrayHashRef;
    for my $StateID ( sort keys %{$StateList} ) {
        push @ArrayHashRef, {
            Key   => $StateID,
            Value => $StateList->{$StateID},
        };
    }

    return \@ArrayHashRef;
}

=item Permission()

Returns whether the agent C<UserID> has permissions of the type C<Type>
on the change C<ChangeID>. The parameters are passed on to
the permission modules that were registered under B<ITSMWorkOrder::Permission>.

The optional option C<LogNo> turns off logging when access was denied.
This is useful when the method is used for checking whether a link or an action should be shown.

    my $Access = $ChangeObject->Permission(
        UserID      => 123,
        Type        => 'ro',   # 'ro' and 'rw' are supported
        ChangeID    => 3333,   # optional, do not pass for 'ChangeAdd'
        Cached      => 0,      # optional with default 1,
                               # passing the value 0 is useful in test scripts
        LogNo       => 1,      # optional, turns off logging when access is denied
    );

=cut

sub Permission {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Type UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $Argument!" );
            return;
        }
    }

    # There are valid cases when no ChangeID is passed.
    # E.g. for ChangeAdd() or ChangeSearch().
    $Param{ChangeID} ||= '';

    # run the relevant permission modules
    if ( ref $Self->{ConfigObject}->Get('ITSMChange::Permission') eq 'HASH' ) {
        my %Modules = %{ $Self->{ConfigObject}->Get('ITSMChange::Permission') };
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
                ConfigObject => $Self->{ConfigObject},
                EncodeObject => $Self->{EncodeObject},
                LogObject    => $Self->{LogObject},
                MainObject   => $Self->{MainObject},
                TimeObject   => $Self->{TimeObject},
                DBObject     => $Self->{DBObject},
                UserObject   => $Self->{UserObject},
                GroupObject  => $Self->{GroupObject},
                ChangeObject => $Self,
                Debug        => $Self->{Debug},
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
                            . "ChangeID '$Param{ChangeID}' "
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
                            . "ChangeID '$Param{ChangeID}' "
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
                . "on ChangeID: $Param{ChangeID})!",
        );
    }

    return;
}

=back

=head1 INTERNAL METHODS

=over 4

=cut

=item _CheckChangeStateIDs()

Check whether all of the given change state ids are valid.

    my $Ok = $ChangeObject->_CheckChangeStateIDs(
        ChangeStateIDs => [ 25, 26 ],
    );

=cut

sub _CheckChangeStateIDs {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ChangeStateIDs} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ChangeStateIDs!',
        );
        return;
    }

    if ( ref $Param{ChangeStateIDs} ne 'ARRAY' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'The param ChangeStateIDs must be an array reference!',
        );
        return;
    }

    # check if ChangeStateIDs belongs to correct general catalog class
    for my $StateID ( @{ $Param{ChangeStateIDs} } ) {
        my $State = $Self->ChangeStateLookup(
            StateID => $StateID,
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

=item _ChangeNumberCreate()

Create a new unique change number. Used in ChangeAdd().

    my $ChangeNumber = $ChangeObject->_ChangeNumberCreate();

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

        # count auto increment
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

        # pad change number with leading '0' to length 5
        $Count = sprintf "%05d", $Count;

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
        my $ChangeID = $Self->ChangeLookup(
            ChangeNumber => $ChangeNumber,
            UserID       => 1,
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

=item _CheckChangeParams()

Checks the params to ChangeAdd() and ChangeUpdate().
There are no required parameters.

    my $Ok = $ChangeObject->_CheckChangeParams(
        ChangeTitle     => 'Replacement of mail server',       # (optional)
        Description     => 'New mail server is faster',        # (optional)
        Justification   => 'Old mail server too slow',         # (optional)
        ChangeStateID   => 4,                                  # (optional)
        ChangeManagerID => 5,                                  # (optional)
        ChangeBuilderID => 6,                                  # (optional)
        RealizeTime     => '2009-10-23 08:57:12',              # (optional)
        CABAgents       => [ 1, 2, 4 ],     # UserIDs          # (optional)
        CABCustomers    => [ 'tt', 'mm' ],  # CustomerUserIDs  # (optional)
    );

The ChangeStateID is checked for existence in the general catalog.
The string parameters have length constraints:

    Parameter      | max. length
    ---------------+-----------------
    ChangeTitle    |  250 characters
    Description    | 3800 characters
    Justification  | 3800 characters

=cut

sub _CheckChangeParams {
    my ( $Self, %Param ) = @_;

    # check the string and id parameters
    ARGUMENT:
    for my $Argument (
        qw(
        ChangeTitle
        Description
        Justification
        ChangeManagerID
        ChangeBuilderID
        ChangeStateID
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
        if ( $Argument eq 'ChangeTitle' && length( $Param{$Argument} ) > 250 ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter '$Argument' must be shorter than 250 characters!",
            );
            return;
        }

        # check the maximum length of description and justification
        if ( $Argument eq 'Description' || $Argument eq 'Justification' ) {
            if ( length( $Param{$Argument} ) > 3800 ) {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "The parameter '$Argument' must be shorter than 3800 characters!",
                );
                return;
            }
        }
    }

    # check if realize_time has correct format
    if (
        defined $Param{RealizeTime}
        && $Param{RealizeTime} !~ m{ \A \d\d\d\d-\d\d-\d\d \s \d\d:\d\d:\d\d \z }xms
        )
    {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Invalid format for RealizeTime!',
        );
        return;
    }

    # check if given ChangeStateID is valid
    if ( $Param{ChangeStateID} ) {
        return if !$Self->_CheckChangeStateIDs(
            ChangeStateIDs => [ $Param{ChangeStateID} ],
        );
    }

    # change manager and change builder must be agents
    ARGUMENT:
    for my $Argument (qw( ChangeManagerID ChangeBuilderID )) {

        # params are not required
        next ARGUMENT if !exists $Param{$Argument};

        # get user data
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
                Message  => 'The parameter CABAgents is not an ARRAY reference!',
            );
            return;
        }

        # check users
        for my $UserID ( @{ $Param{CABAgents} } ) {

            # get user data
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
                Message  => 'The parameter CABCustomers is not an ARRAY reference!',
            );
            return;
        }

        # check customer users
        for my $CustomerUser ( @{ $Param{CABCustomers} } ) {

            # get customer user data
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

sub DESTROY {
    my $Self = shift;

    # TODO (ub: this must be commented out until further investigation!)
    #    # execute all transaction events
    #    $Self->EventHandlerTransaction();

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

$Revision: 1.157 $ $Date: 2009/11/18 13:30:01 $

=cut
