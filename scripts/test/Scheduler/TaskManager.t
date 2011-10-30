# --
# TaskManager.t - TaskManager tests
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: TaskManager.t,v 1.11 2011/04/28 15:44:00 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.
# --

use strict;
use warnings;
use utf8;
use vars (qw($Self));

use Kernel::System::Scheduler::TaskManager;

my $TaskManagerObject = Kernel::System::Scheduler::TaskManager->new( %{$Self} );

my $Home = $Self->{ConfigObject}->Get('Home');

my $Scheduler = $Home . '/bin/otrs.Scheduler.pl';
if ( $^O =~ /^mswin/i ) {
    $Scheduler = "\"$^X\" " . $Home . '/bin/otrs.Scheduler4win.pl';
    $Scheduler =~ s{/}{\\}g
}

# get scheduler status
my $PreviousSchedulerStatus = `$Scheduler -a status`;

# stop scheduler if it was already running before this test
if ( $PreviousSchedulerStatus =~ /^running/i ) {
    `$Scheduler -a stop`;

    # wait to get scheduler fully stoped before test continues
    my $SleepTime = 1;
    if ( $^O =~ /^mswin/i ) {
        $SleepTime = 5;
    }

    print "A running Scheduler was detected and need to be stopped...\n";
    print 'Sleeping ' . $SleepTime . "s\n";
    sleep $SleepTime;
}

$Self->Is(
    ref $TaskManagerObject,
    'Kernel::System::Scheduler::TaskManager',
    "Kernel::System::Scheduler::TaskManager->new()",
);

# get task list
my @TaskList = $TaskManagerObject->TaskList();

# check if there is a remaining task from prior tests (look for type Test)
TASK:
for my $Task (@TaskList) {
    next TASK if $Task->{Type} ne 'Test';

    # delete all remaning Tests tasks
    # this is needed because if prior tests left tasks un proceces this test will also fail
    my $TaskDelete = $TaskManagerObject->TaskDelete( ID => $Task->{ID} );

    $Self->True(
        $TaskDelete,
        "Warning: Task deleted from a prior failed test Task ID $Task->{ID}"
    );
}

$Self->Is(
    scalar $TaskManagerObject->TaskList(),
    0,
    "Initial task list is empty",
);

my $CurrentTime = $Self->{TimeObject}->CurrentTimestamp();

my @Tests = (
    {
        Name    => 'test 1',
        Success => 1,
        Data    => {
            Name        => 'Nagios',
            Description => 'Connector to send and receive date from Nagios.',
            Provider    => {
                Module => 'Kernel::GenericInterface::Transport::HTTP::SOAP',
                Config => {},
            },
        },
        Type => 'SomeType',
    },
    {
        Name    => 'test 2',
        Success => 1,
        Data    => {
            Name        => 'Nagios',
            Description => 'Connector to send and receive date from Nagios 2.',
            Provider    => {
                Config => {
                    NameSpace  => '!"§$%&/()=?Ü*ÄÖL:L@,.-',
                    SOAPAction => '',
                    Encoding   => '',
                    Endpoint =>
                        'iojfoiwjeofjweoj ojerojgv oiaejroitjvaioejhtioja viorjhiojgijairogj aiovtq348tu 08qrujtio juortu oquejrtwoiajdoifhaois hnaeruoigbo eghjiob jaer89ztuio45u603u4i9tj340856u903 jvipojziopeji',
                },
            },
        },
        Type => 'SomeType',
    },
    {
        Name    => 'test 3',
        Success => 1,
        Data    => {},
        Type    => 'SomeType',
    },
    {
        Name    => 'test 4',
        Success => 1,
        Data    => {
            Name        => 'Nagios',
            Description => 'Connector to send and receive date from Nagios 2.'
                . "\nasdkaosdkoa\tsada\n",
            Provider => {},
        },
        Type => 'SomeType',
    },
    {
        Name    => 'test 5',
        Success => 0,
        Data    => undef,
        Type    => 'SomeType',
    },
    {
        Name    => 'test 6',
        Success => 1,
        Data    => {},
        Type    => 'SomeType',
        DueTime => $CurrentTime,
    },
    {
        Name    => 'test 7',
        Success => 0,
        Data    => {},
        Type    => 'SomeType',
        DueTime => 'today',
    },
    {
        Name    => 'test 8',
        Success => 1,
        Data    => {},
        Type    => 'SomeType',
        DueTime => undef,
    },
);

my @TaskIDs;

TEST:
for my $Test (@Tests) {

    # add config
    my $TaskID = $TaskManagerObject->TaskAdd(
        Data    => $Test->{Data},
        Type    => $Test->{Type},
        DueTime => $Test->{DueTime},
    );
    if ( !$Test->{Success} ) {
        $Self->False(
            $TaskID,
            "$Test->{Name} - TaskAdd() success",
        );
        next TEST;
    }
    else {
        $Self->True(
            $TaskID,
            "$Test->{Name} - TaskAdd() failure",
        );
    }

    # remember id to delete it later
    push @TaskIDs, $TaskID;

    # get config
    my %Task = $TaskManagerObject->TaskGet(
        ID => $TaskID,
    );

    # verify config
    $Self->Is(
        $Test->{Type},
        $Task{Type},
        "$Test->{Name} - TaskGet() - Type",
    );
    $Self->IsDeeply(
        $Test->{Data},
        $Task{Data},
        "$Test->{Name} - TaskGet() - Data",
    );

    if ( $Test->{DueTime} ) {
        $Self->Is(
            $Test->{DueTime},
            $Task{DueTime},
            "$Test->{Name} - TaskGet() - DueTime set",
        );
    }
    else {
        $Self->True(
            $Task{DueTime},
            "$Test->{Name} - TaskGet() - DueTime default",
        );
    }
}

# list check
my @List  = $TaskManagerObject->TaskList();
my $Count = 0;
for my $TaskIDFromList (@List) {
    $Self->Is(
        $TaskIDFromList->{ID},
        $TaskIDs[$Count],
        "TaskList() entry",
    );
    $Count++;
}

$Self->Is(
    scalar @List,
    scalar @TaskIDs,
    "TaskList() size",
);

# delete config
for my $TaskID (@TaskIDs) {
    my $Success = $TaskManagerObject->TaskDelete(
        ID => $TaskID,
    );
    $Self->True(
        $Success,
        'TaskDelete() success',
    );
    $Success = $TaskManagerObject->TaskDelete(
        ID => $TaskID,
    );
    $Self->False(
        $Success,
        'TaskDelete() failure',
    );
}

$Self->Is(
    scalar $TaskManagerObject->TaskList(),
    0,
    "TaskList() empty",
);

# start scheduler if it was already running before this test
if ( $PreviousSchedulerStatus =~ /^running/i ) {
    `$Scheduler -a start`;
}

1;
