# --
# ITSMStateMachine.t - StateMachine tests
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: ITSMStateMachine.t,v 1.5 2009/12/23 15:16:47 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars qw($Self);

use Kernel::System::ITSMChange::ITSMStateMachine;
use Kernel::System::GeneralCatalog;

# ------------------------------------------------------------ #
# make preparations
# ------------------------------------------------------------ #

my $TestCount = 1;

# create common objects
$Self->{StateMachineObject}   = Kernel::System::ITSMChange::ITSMStateMachine->new( %{$Self} );
$Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );

# test if statemachine object was created successfully
$Self->True(
    $Self->{StateMachineObject},
    'Test ' . $TestCount++ . ' - construction of statemachine object',
);
$Self->Is(
    ref $Self->{StateMachineObject},
    'Kernel::System::ITSMChange::ITSMStateMachine',
    'Test ' . $TestCount++ . ' - class of statemachine object',
);

# ------------------------------------------------------------ #
# test StateMachine API
# ------------------------------------------------------------ #
{

    # define public interface (in alphabetical order)
    my @ObjectMethods = qw(
        StateList
        StateLookup
        StateTransitionAdd
        StateTransitionDelete
        StateTransitionDeleteAll
        StateTransitionGet
        StateTransitionList
        StateTransitionUpdate
    );

    # check if subs are available
    for my $ObjectMethod (@ObjectMethods) {
        $Self->True(
            $Self->{StateMachineObject}->can($ObjectMethod),
            'Test ' . $TestCount++ . " - check 'can $ObjectMethod'",
        );
    }
}

# ------------------------------------------------------------ #
# define default transitions for change states
# ------------------------------------------------------------ #

# get the change states from the general catalog
my %Name2ChangeStateID = reverse %{
    $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ChangeManagement::Change::State',
        )
    };

# add zero entry for the initial state
$Name2ChangeStateID{0} = 0;

# build reverse lookup hash
my %ChangeStateID2Name = reverse %Name2ChangeStateID;

# default ChangeState Transitions
my %DefaultChangeStateTransitions = (
    0 => ['requested'],
    'requested' => [ 'rejected', 'retracted', 'pending approval' ],
    'pending approval' => [ 'retracted', 'approved' ],
    'approved'         => [ 'retracted', 'in progress' ],
    'in progress'      => [ 'retracted', 'failed', 'successful', 'canceled' ],
    'rejected'   => [0],
    'retracted'  => [0],
    'failed'     => [0],
    'successful' => [0],
    'canceled'   => [0],
);

# ------------------------------------------------------------ #
# define default transitions for workorder states
# ------------------------------------------------------------ #

# get the workorder states from the general catalog
my %Name2WorkOrderStateID = reverse %{
    $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ChangeManagement::WorkOrder::State',
        )
    };

# add zero entry for the initial state
$Name2WorkOrderStateID{0} = 0;

# build reverse lookup hash
my %WorkOrderStateID2Name = reverse %Name2WorkOrderStateID;

# default WorkOrderState Transitions
my %DefaultWorkOrderStateTransitions = (
    0             => ['created'],
    'created'     => [ 'accepted', 'canceled' ],
    'accepted'    => [ 'ready', 'canceled' ],
    'ready'       => [ 'in progress', 'canceled' ],
    'in progress' => [ 'closed', 'canceled' ],
    'canceled'    => [0],
    'closed'      => [0],
);

# ------------------------------------------------------------ #
# state transistion add, update and delete tests
# ------------------------------------------------------------ #

{

    # add a second start transition ( must fail )
    my $TransitionID = $Self->{StateMachineObject}->StateTransitionAdd(
        StateID     => 0,
        NextStateID => $Name2ChangeStateID{approved},
        Class       => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->False(
        $TransitionID,
        'Test ' . $TestCount++ . ": StateTransitionAdd() - Add another start state transition.",
    );

    # add a new change state transition
    $TransitionID = $Self->{StateMachineObject}->StateTransitionAdd(
        StateID     => $Name2ChangeStateID{approved},
        NextStateID => $Name2ChangeStateID{approved},
        Class       => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->True(
        $TransitionID,
        'Test ' . $TestCount++ . ": StateTransitionAdd() - Add a new change state transition.",
    );

    # try to set the state to be an end state (must fail, because other following states exist)
    $TransitionID = $Self->{StateMachineObject}->StateTransitionAdd(
        StateID     => $Name2ChangeStateID{approved},
        NextStateID => 0,
        Class       => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->False(
        $TransitionID,
        'Test '
            . $TestCount++
            . ": StateTransitionAdd() - Add a new change state transition must fail, because of existing following states.",
    );

    # update a state transition
    my $Success = $Self->{StateMachineObject}->StateTransitionUpdate(
        StateID        => $Name2ChangeStateID{approved},
        NextStateID    => $Name2ChangeStateID{approved},
        NewNextStateID => $Name2ChangeStateID{failed},
        Class          => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->True(
        $Success,
        'Test ' . $TestCount++ . ": StateTransitionUpdate() - Update change state transition.",
    );

    # get the updated state transition
    my $NextStateIDsRef = $Self->{StateMachineObject}->StateTransitionGet(
        StateID => $Name2ChangeStateID{approved},
        Class   => 'ITSM::ChangeManagement::Change::State',
    );
    my %NextStateLookup = map { $_ => 1 } @{$NextStateIDsRef};
    $Self->True(
        $NextStateLookup{ $Name2ChangeStateID{failed} },
        'Test '
            . $TestCount++
            . ": StateTransitionGet() - Get the updated change state transition.",
    );

    # update a state transition
    # (must fail, because new next state is an end state and other following states already exists)
    $Success = $Self->{StateMachineObject}->StateTransitionUpdate(
        StateID        => $Name2ChangeStateID{requested},
        NextStateID    => $Name2ChangeStateID{rejected},
        NewNextStateID => 0,
        Class          => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->False(
        $Success,
        'Test '
            . $TestCount++
            . ": StateTransitionUpdate() - Update change state transition (set end state must fail).",
    );

    # update a state transition (must fail, because both states are zero)
    $Success = $Self->{StateMachineObject}->StateTransitionUpdate(
        StateID        => 0,
        NextStateID    => 0,
        NewNextStateID => 0,
        Class          => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->False(
        $Success,
        'Test '
            . $TestCount++
            . ": StateTransitionUpdate() - Update change state transition (both states zero test).",
    );

    # delete the transition that was added before
    my $DeleteSuccess = $Self->{StateMachineObject}->StateTransitionDelete(
        StateID     => $Name2ChangeStateID{approved},
        NextStateID => $Name2ChangeStateID{failed},
    );
    $Self->True(
        $DeleteSuccess,
        'Test ' . $TestCount++ . ": StateTransitionDelete() - Delete a change state transition.",
    );
}

# ------------------------------------------------------------ #
# check the default StateMachine transitions for change states
# ------------------------------------------------------------ #

# get default change state transitions from database
my $ChangeStateTransitions = $Self->{StateMachineObject}->StateTransitionList(
    Class => 'ITSM::ChangeManagement::Change::State',
);

# check StateTransitionList for change states
$Self->Is(
    scalar keys %{$ChangeStateTransitions} || 0,
    scalar keys %DefaultChangeStateTransitions,
    'Test '
        . $TestCount++
        . ": StateTransitionList() - number of default start states for change states.",
);

for my $DefaultState ( keys %DefaultChangeStateTransitions ) {

    # convert the default state to a stateID
    my $DefaultStateID = $Name2ChangeStateID{$DefaultState};

    # check if all start states are the same as the default
    # and have the same number of next states
    $Self->Is(
        scalar @{ $ChangeStateTransitions->{ $Name2ChangeStateID{$DefaultState} } },
        scalar @{ $DefaultChangeStateTransitions{$DefaultState} },
        'Test '
            . $TestCount++
            . ": StateTransitionList() - number of default next states for change state '$DefaultState'.",
    );

    # get lookup hash of actual next states
    my @NextStates
        = sort map { $ChangeStateID2Name{$_} } @{ $ChangeStateTransitions->{$DefaultStateID} };

    my $Index = 0;
    for my $DefaultNextState ( sort @{ $DefaultChangeStateTransitions{$DefaultState} } ) {

        # check if next state is the the same as the default
        $Self->Is(
            $NextStates[ $Index++ ],
            $DefaultNextState,
            'Test '
                . $TestCount
                . ": StateTransitionList() - default next state for change state '$DefaultState'.",
        );
    }

    # test the state lookup function for the state
    my $LookedUpStateID = $Self->{StateMachineObject}->StateLookup(
        State => $DefaultState,
        Class => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->Is(
        $LookedUpStateID,
        $DefaultStateID,
        "Test $TestCount: StateLookup() for change state '$DefaultState'.",
    );

    # test the state lookup function for the state id
    my $LookedUpState = $Self->{StateMachineObject}->StateLookup(
        StateID => $DefaultStateID,
        Class   => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->Is(
        $LookedUpState,
        $DefaultState,
        "Test $TestCount: StateLookup() for change state id '$DefaultStateID'.",
    );
}

# ------------------------------------------------------------ #
# check the default StateMachine transitions for workorder states
# ------------------------------------------------------------ #

# get default workorder state transitions from database
my $WorkOrderStateTransitions = $Self->{StateMachineObject}->StateTransitionList(
    Class => 'ITSM::ChangeManagement::WorkOrder::State',
);

# check StateTransitionList for workorder states
$Self->Is(
    scalar keys %{$WorkOrderStateTransitions} || 0,
    scalar keys %DefaultWorkOrderStateTransitions,
    'Test '
        . $TestCount++
        . ": StateTransitionList() - Number of default start states for workorder states.",
);

for my $DefaultState ( keys %DefaultWorkOrderStateTransitions ) {

    # convert the default state to a stateID
    my $DefaultStateID = $Name2WorkOrderStateID{$DefaultState};

    # check if all start states are the same as the default
    # and have the same number of next states
    $Self->Is(
        scalar @{ $WorkOrderStateTransitions->{ $Name2WorkOrderStateID{$DefaultState} } },
        scalar @{ $DefaultWorkOrderStateTransitions{$DefaultState} },
        'Test '
            . $TestCount++
            . ": StateTransitionList() - Number of default next states for workorder state '$DefaultState'.",
    );

    # get lookup hash of actual next states
    my @NextStates = sort map { $WorkOrderStateID2Name{$_} }
        @{ $WorkOrderStateTransitions->{$DefaultStateID} };

    my $Index = 0;
    for my $DefaultNextState ( sort @{ $DefaultWorkOrderStateTransitions{$DefaultState} } ) {

        # check if next state is the the same as the default
        $Self->Is(
            $NextStates[ $Index++ ],
            $DefaultNextState,
            'Test '
                . $TestCount
                . ": StateTransitionList() - Default next state for workorder state '$DefaultState'.",
        );
    }

    # test the state lookup function for the state
    my $LookedUpStateID = $Self->{StateMachineObject}->StateLookup(
        State => $DefaultState,
        Class => 'ITSM::ChangeManagement::WorkOrder::State',
    );
    $Self->Is(
        $LookedUpStateID,
        $DefaultStateID,
        "Test $TestCount: StateLookup() for workorder state '$DefaultState'.",
    );

    # test the state lookup function for the state id
    my $LookedUpState = $Self->{StateMachineObject}->StateLookup(
        StateID => $DefaultStateID,
        Class   => 'ITSM::ChangeManagement::WorkOrder::State',
    );
    $Self->Is(
        $LookedUpState,
        $DefaultState,
        "Test $TestCount: StateLookup() for workorder state id '$DefaultStateID'.",
    );
}

# ------------------------------------------------------------ #
# state transition get tests
# ------------------------------------------------------------ #

# compare the results from StateTransitionList() and StateTransitionGet()
for my $StateID ( keys %{$ChangeStateTransitions} ) {

    # get the next state ids from StateTransitionList()
    my @NextStateIDsFromList = sort @{ $ChangeStateTransitions->{$StateID} };

    # get the next state ids from StateTransitionGet()
    my $NextStateIDsRef = $Self->{StateMachineObject}->StateTransitionGet(
        StateID => $StateID,
        Class   => 'ITSM::ChangeManagement::Change::State',
    );
    my @NextStateIDsFromGet = sort @{$NextStateIDsRef};

    # check if the number of next states is the same
    $Self->Is(
        scalar @NextStateIDsFromGet,
        scalar @NextStateIDsFromList,
        'Test '
            . $TestCount++
            . ": StateTransitionGet() - Number of next states for change state '$ChangeStateID2Name{$StateID}'.",
    );

    my $Index = 0;
    for my $NextState (@NextStateIDsFromGet) {

        # check if the next states are all the same
        $Self->Is(
            $ChangeStateID2Name{$NextState},
            $ChangeStateID2Name{ $NextStateIDsFromList[ $Index++ ] },
            'Test '
                . $TestCount++
                . ": StateTransitionGet() - Next state for change state '$ChangeStateID2Name{$StateID}'.",
        );
    }
}

# ------------------------------------------------------------ #
# check StateList() for change states
# ------------------------------------------------------------ #

{
    my $StateList = $Self->{StateMachineObject}->StateList(
        Class  => 'ITSM::ChangeManagement::Change::State',
        UserID => 1,
    ) || [];

    # Check the number of change states. The start state is not returned by StateList().
    $Self->Is(
        scalar( @{$StateList} ),
        scalar( keys %DefaultChangeStateTransitions ) - 1,
        'StateList() - Change - number of states',
    );

    # check whether the default states are in the StateList
    DEFAULT_STATE:
    for my $DefaultState ( keys %DefaultChangeStateTransitions ) {

        # skip the default state '0'
        next DEFAULT_STATE if !$DefaultState;

        my @Matches = grep { $_->{Value} eq $DefaultState } @{$StateList};
        $Self->Is(
            scalar(@Matches),
            1,
            "StateList() - Change - found $DefaultState",
        );
    }
}

# ------------------------------------------------------------ #
# check StateList() for workorder states
# ------------------------------------------------------------ #

{
    my $StateList = $Self->{StateMachineObject}->StateList(
        Class  => 'ITSM::ChangeManagement::WorkOrder::State',
        UserID => 1,
    ) || [];

    # Check the number of states. The start state is not returned by StateList().
    $Self->Is(
        scalar( @{$StateList} ),
        scalar( keys %DefaultWorkOrderStateTransitions ) - 1,
        'StateList() - WorkOrder - number of states',
    );

    # check whether the default states are in the StateList
    DEFAULT_STATE:
    for my $DefaultState ( keys %DefaultWorkOrderStateTransitions ) {

        # skip the default state '0'
        next DEFAULT_STATE if !$DefaultState;

        my @Matches = grep { $_->{Value} eq $DefaultState } @{$StateList};
        $Self->Is(
            scalar(@Matches),
            1,
            "StateList() - WorkOrder - found $DefaultState",
        );
    }
}

1;
