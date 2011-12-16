# --
# Queue.t - Queue tests
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: Queue.t,v 1.13 2010/10/29 22:16:59 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use vars (qw($Self));
use utf8;

use Kernel::System::Queue;

my $QueueObject = Kernel::System::Queue->new( %{$Self} );

my $QueueRand = 'Some::Queue' . int( rand(1000000) );
my $QueueID   = $QueueObject->QueueAdd(
    Name                => $QueueRand,
    ValidID             => 1,
    GroupID             => 1,
    FirstResponseTime   => 30,
    FirstResponseNotify => 70,
    UpdateTime          => 240,
    UpdateNotify        => 80,
    SolutionTime        => 2440,
    SolutionNotify      => 90,
    SystemAddressID     => 1,
    SalutationID        => 1,
    SignatureID         => 1,
    UserID              => 1,
    Comment             => 'Some Comment',
);

$Self->True(
    $QueueID,
    'QueueAdd()',
);

my %QueueGet = $QueueObject->QueueGet( ID => $QueueID );

$Self->True(
    $QueueGet{Name} eq $QueueRand,
    'QueueGet() - Name',
);
$Self->True(
    $QueueGet{ValidID} eq 1,
    'QueueGet() - ValidID',
);
$Self->True(
    $QueueGet{Calendar} eq '',
    'QueueGet() - Calendar',
);
$Self->True(
    $QueueGet{Comment} eq 'Some Comment',
    'QueueGet() - Comment',
);
$Self->True(
    $QueueGet{FirstResponseTime} eq 30,
    'QueueGet() - FirstResponseTime',
);
$Self->True(
    $QueueGet{FirstResponseNotify} eq 70,
    'QueueGet() - FirstResponseNotify',
);

$Self->True(
    $QueueGet{UpdateTime} eq 240,
    'QueueGet() - UpdateTime',
);
$Self->True(
    $QueueGet{UpdateNotify} eq 80,
    'QueueGet() - UpdateNotify',
);

$Self->True(
    $QueueGet{SolutionTime} eq 2440,
    'QueueGet() - SolutionTime',
);
$Self->True(
    $QueueGet{SolutionNotify} eq 90,
    'QueueGet() - SolutionNotify',
);

my $Queue = $QueueObject->QueueLookup( QueueID => $QueueID );

$Self->True(
    $Queue eq $QueueRand,
    'QueueLookup() by ID',
);

my $QueueIDLookup = $QueueObject->QueueLookup( Queue => $Queue );

$Self->True(
    $QueueID eq $QueueIDLookup,
    'QueueLookup() by Name',
);

# a real szenario from AdminQueue.pm
# for more information see 3139
my $QueueUpdate2 = $QueueObject->QueueUpdate(
    QueueID             => $QueueID,
    Name                => $QueueRand . "2",
    ValidID             => 1,
    GroupID             => 1,
    Calendar            => '',
    FirstResponseTime   => '',
    FirstResponseNotify => '',
    UpdateTime          => '',
    UpdateNotify        => '',
    SolutionTime        => '',
    SolutionNotify      => '',
    SystemAddressID     => 1,
    SalutationID        => 1,
    SignatureID         => 1,
    FollowUpID          => 1,
    UserID              => 1,
    Comment             => 'Some Comment2',
    DefaultSignKey      => '',
    UnlockTimeOut       => '',
    FollowUpLock        => 1,
    ParentQueueID       => '',
);

$Self->True(
    $QueueUpdate2,
    'QueueUpdate() - a real szenario from AdminQueue.pm',
);

my $QueueUpdate1 = $QueueObject->QueueUpdate(
    QueueID             => $QueueID,
    Name                => $QueueRand . '1',
    ValidID             => 2,
    GroupID             => 1,
    Calendar            => '1',
    FirstResponseTime   => 60,
    FirstResponseNotify => 60,
    UpdateTime          => 480,
    UpdateNotify        => 70,
    SolutionTime        => 4880,
    SolutionNotify      => 80,
    SystemAddressID     => 1,
    SalutationID        => 1,
    SignatureID         => 1,
    FollowUpID          => 1,
    UserID              => 1,
    Comment             => 'Some Comment1',
);

$Self->True(
    $QueueUpdate1,
    'QueueUpdate()',
);

# lookup the queue name for $QueueID
my $LookupQueueName = $QueueObject->QueueLookup( QueueID => $QueueID );

$Self->Is(
    $LookupQueueName,
    $QueueRand . '1',
    "QueueLookup() - lookup the queue name for ID $QueueID",
);

# lookup the queue id for $QueueRand . '1'
my $LookupQueueID = $QueueObject->QueueLookup( Queue => $QueueRand . '1' );

$Self->Is(
    $LookupQueueID,
    $QueueID,
    "QueueLookup() - lookup the queue ID for queue name " . $QueueRand . '1',
);

# lookup the queue id for $QueueRand, this should be undef, because this queue was renamed meanwhile!
$LookupQueueID = $QueueObject->QueueLookup( Queue => $QueueRand );

$Self->Is(
    $LookupQueueID,
    undef,
    "QueueLookup() - lookup the queue ID for queue name " . $QueueRand,
);

%QueueGet = $QueueObject->QueueGet( ID => $QueueID );

$Self->True(
    $QueueGet{Name} eq $QueueRand . "1",
    'QueueGet() - Name',
);
$Self->True(
    $QueueGet{ValidID} eq 2,
    'QueueGet() - ValidID',
);
$Self->True(
    $QueueGet{Calendar} eq 1,
    'QueueGet() - Calendar',
);
$Self->True(
    $QueueGet{Comment} eq 'Some Comment1',
    'QueueGet() - Comment',
);

$Self->True(
    $QueueGet{FirstResponseTime} eq 60,
    'QueueGet() - FirstResponseTime',
);
$Self->True(
    $QueueGet{FirstResponseNotify} eq 60,
    'QueueGet() - FirstResponseNotify',
);

$Self->True(
    $QueueGet{UpdateTime} eq 480,
    'QueueGet() - UpdateTime',
);
$Self->True(
    $QueueGet{UpdateNotify} eq 70,
    'QueueGet() - UpdateNotify',
);

$Self->True(
    $QueueGet{SolutionTime} eq 4880,
    'QueueGet() - SolutionTime',
);
$Self->True(
    $QueueGet{SolutionNotify} eq 80,
    'QueueGet() - SolutionNotify',
);

$Queue = $QueueObject->QueueLookup( QueueID => $QueueID );

$Self->True(
    $Queue eq $QueueRand . "1",
    'QueueLookup() by ID',
);

$QueueIDLookup = $QueueObject->QueueLookup( Queue => $Queue );

$Self->True(
    $QueueID eq $QueueIDLookup,
    'QueueLookup() by Name',
);

1;
