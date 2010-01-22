# --
# Kernel/System/ITSMChange/ITSMCondition/Operator.pm - all condition operator functions
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: Operator.pm,v 1.16 2010/01/22 08:34:45 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMCondition::Operator;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.16 $) [1];

=head1 NAME

Kernel::System::ITSMChange::ITSMCondition::Operator - condition operator lib

=head1 SYNOPSIS

All functions for condition operators in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=item OperatorAdd()

Add a new condition operator.

    my $OperatorID = $ConditionObject->OperatorAdd(
        Name   => 'OperatorName',
        UserID => 1,
    );

=cut

sub OperatorAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Name UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # make lookup with given name for checks
    my $OperatorID = $Self->OperatorLookup(
        Name   => $Param{Name},
        UserID => $Param{UserID},
    );

    # check if operator name already exists
    if ($OperatorID) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Condition operator ($Param{Name}) already exists!",
        );
        return;
    }

    # add new operator name to database
    return if !$Self->{DBObject}->Do(
        SQL => 'INSERT INTO condition_operator '
            . '(name) '
            . 'VALUES (?)',
        Bind => [ \$Param{Name} ],
    );

    # get id of created operator
    $OperatorID = $Self->OperatorLookup(
        Name   => $Param{Name},
        UserID => $Param{UserID},
    );

    # check if operator could be added
    if ( !$OperatorID ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "OperatorAdd() failed!",
        );
        return;
    }

    return $OperatorID;
}

=item OperatorUpdate()

Update a condition operator.

    my $Success = $ConditionObject->OperatorUpdate(
        OperatorID => 1234,
        Name       => 'NewOperatorName',
        UserID     => 1,
    );

=cut

sub OperatorUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(OperatorID Name UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get operator data
    my $OperatorData = $Self->OperatorGet(
        OperatorID => $Param{OperatorID},
        UserID     => $Param{UserID},
    );

    # check operator data
    if ( !$OperatorData ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "OperatorUpdate of $Param{OperatorID} failed!",
        );
        return;
    }

    # update operator in database
    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE condition_operator '
            . 'SET name = ? '
            . 'WHERE id = ?',
        Bind => [
            \$Param{Name},
            \$Param{OperatorID},
        ],
    );

    return 1;
}

=item OperatorGet()

Get a condition operator for a given operator id.
Returns a hash reference of the operator data.

    my $ConditionOperatorRef = $ConditionObject->OperatorGet(
        OperatorID => 1234,
        UserID     => 1,
    );

The returned hash reference contains following elements:

    $ConditionOperator{OperatorID}
    $ConditionOperator{Name}

=cut

sub OperatorGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(OperatorID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # prepare SQL statement
    return if !$Self->{DBObject}->Prepare(
        SQL   => 'SELECT id, name FROM condition_operator WHERE id = ?',
        Bind  => [ \$Param{OperatorID} ],
        Limit => 1,
    );

    # fetch the result
    my %OperatorData;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $OperatorData{OperatorID} = $Row[0];
        $OperatorData{Name}       = $Row[1];
    }

    # check error
    if ( !%OperatorData ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "OperatorID $Param{OperatorID} does not exist!",
        );
        return;
    }

    return \%OperatorData;
}

=item OperatorLookup()

This method does a lookup for a condition operator. If an operator
id is given, it returns the name of the operator. If the name of the
operator is given, the appropriate id is returned.

    my $OperatorName = $ConditionObject->OperatorLookup(
        OperatorID => 4321,
        UserID     => 1,
    );

    my $OperatorID = $ConditionObject->OperatorLookup(
        Name   => 'OperatorName',
        UserID => 1,
    );

=cut

sub OperatorLookup {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );
        return;
    }

    # check if both parameters are given
    if ( $Param{OperatorID} && $Param{Name} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need OperatorID or Name - not both!',
        );
        return;
    }

    # check if both parameters are not given
    if ( !$Param{OperatorID} && !$Param{Name} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need OperatorID or Name - none is given!',
        );
        return;
    }

    # prepare SQL statements
    if ( $Param{OperatorID} ) {
        return if !$Self->{DBObject}->Prepare(
            SQL   => 'SELECT name FROM condition_operator WHERE id = ?',
            Bind  => [ \$Param{OperatorID} ],
            Limit => 1,
        );
    }
    elsif ( $Param{Name} ) {
        return if !$Self->{DBObject}->Prepare(
            SQL   => 'SELECT id FROM condition_operator WHERE name = ?',
            Bind  => [ \$Param{Name} ],
            Limit => 1,
        );
    }

    # fetch the result
    my $Lookup;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Lookup = $Row[0];
    }

    return $Lookup;
}

=item OperatorList()

Returns a list of all condition operators as hash reference

    my $ConditionOperatorsRef = $ConditionObject->OperatorList(
        UserID => 1,
    );

The returned hash reference contains entries like this:

    $ConditionOperator{ObjectID} = 'ObjectName'

=cut

sub OperatorList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );
        return;
    }

    # prepare SQL statement
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT id, name FROM condition_operator',
    );

    # fetch the result
    my %OperatorList;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $OperatorList{ $Row[0] } = $Row[1];
    }

    return \%OperatorList;
}

=item OperatorDelete()

Deletes a condition operator.

    my $Success = $ConditionObject->OperatorDelete(
        OperatorID => 123,
        UserID      => 1,
    );

=cut

sub OperatorDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(OperatorID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # delete condition operator from database
    return if !$Self->{DBObject}->Do(
        SQL => 'DELETE FROM condition_operator '
            . 'WHERE id = ?',
        Bind => [ \$Param{OperatorID} ],
    );

    return 1;
}

=item OperatorExecute()

Returns true or false (1/undef) if given values are equal.

    my $Result = $ConditionObject->OperatorExecute(
        OperatorName => 'is',
        Attribute    => 'WorkOrderStateID',
        Selector     => '1234,                                 #  ( ObjectKey | any | all )
        ObjectData   => [ $WorkOrderData1, $WorkOrderData2 ],
        CompareValue => 'SomeValue',
        UserID       => 1234,
    );

=cut

sub OperatorExecute {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(OperatorName Attribute Selector ObjectData UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # handle 'CompareValue' in a special way
    if ( !exists $Param{CompareValue} || !defined $Param{CompareValue} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need CompareValue!',
        );
        return;
    }

    # get object data
    my $ObjectData = $Param{ObjectData};

    # check ObjectData
    if ( ref $ObjectData ne 'ARRAY' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'ObjectData is not an array reference!',
        );
        return;
    }

    # return false if no object data is given
    return if !@{$ObjectData};

    # execute operator for each object
    my @OperatorExecuteResult;
    for my $Object ( @{$ObjectData} ) {

        # get equation result for object
        my $Result = $Self->_OperatorExecute(
            OperatorName => $Param{OperatorName},
            Value1       => $Object->{ $Param{Attribute} },
            Value2       => $Param{CompareValue},
            UserID       => $Param{UserID},
        ) || 0;

        # return true if result is positive and 'any' is requested
        if ( $Param{Selector} eq 'any' && $Result ) {
            return 1;
        }

        # return false if result is negative and 'all' is requested
        if ( $Param{Selector} eq 'all' && !$Result ) {
            return;
        }

        # save current result for coming checks
        push @OperatorExecuteResult, $Result;
    }

    # count all results which have a true value
    my $TrueCount = scalar grep { $_ == 1 } @OperatorExecuteResult;

    # return false if not all results are true
    return if $TrueCount != scalar @{$ObjectData};

    return 1;
}

=item _OperatorExecute()

Returns true or false (1/undef) if given values are equal.

    my $Result = $ConditionObject->_OperatorExecute(
        OperatorName => 'is',
        Value1       => 'SomeValue',
        Value2       => 'SomeOtherValue',
        UserID       => 1234,
    );

=cut

sub _OperatorExecute {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(OperatorName UserID)) {
        if ( !exists $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # map for operator action
    my %OperatorAction = (

        # common matching
        'is'           => '_OperatorEqual',
        'is not'       => '_OperatorNotEqual',
        'is empty'     => '_OperatorIsEmpty',
        'is not empty' => '_OperatorIsNotEmpty',

        # digit matching
        'is greater than' => '_OperatorIsGreaterThan',
        'is less than'    => '_OperatorIsLessThan',

        # date matching
        'is before' => '_OperatorIsBefore',
        'is after'  => '_OperatorIsAfter',

        # string matching
        'contains'     => '_OperatorContains',
        'not contains' => '_OperatorNotContains',
        'begins with'  => '_OperatorBeginsWith',
        'ends with'    => '_OperatorEndsWith',

        # action operators
        'set'  => '_OperatorIsEmpty',
        'lock' => '_OperatorIsEmpty',
    );

    # get operator name
    my $OperatorName = $Param{OperatorName};

    # check for matching operator
    if ( !exists $OperatorAction{$OperatorName} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No matching operator for '$OperatorName' found!",
        );
        return;
    }

    # extract operator sub
    my $Sub = $OperatorAction{$OperatorName};

    # check for available function
    if ( !$Self->can($Sub) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No function '$Sub' available for '$OperatorName'!",
        );
        return;
    }

    # execute extracted match
    my $Result = $Self->$Sub(
        Value1 => $Param{Value1},
        Value2 => $Param{Value2},
    );

    return $Result;
}

=item _OperatorEqual()

Returns true or false (1/undef) if given values are equal.

    my $Result = $ConditionObject->_OperatorEqual(
        Value1 => 'SomeValue',
        Value2 => 'SomeOtherValue',
    );

=cut

sub _OperatorEqual {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # return result of equation
    return $Param{Value1} eq $Param{Value2};
}

=item _OperatorNotEqual()

Returns true or false (1/undef) if given values are not equal.

    my $Result = $ConditionObject->_OperatorNotEqual(
        Value1 => 'SomeValue',
        Value2 => 'SomeOtherValue',
    );

=cut

sub _OperatorNotEqual {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # return result of negated equation
    return !$Self->_OperatorEqual(%Param);
}

=item _OperatorIsEmpty()

Returns true or false (1/undef) if given value is empty.

    my $Result = $ConditionObject->_OperatorIsEmpty(
        Value1 => '',
    );

=cut

sub _OperatorIsEmpty {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check length of value
    my $ValueLength = length $Param{Value1};

    # return result of length check
    return $ValueLength == 0;
}

=item _OperatorIsNotEmpty()

Returns true or false (1/undef) if given value is not empty.

    my $Result = $ConditionObject->_OperatorIsNotEmpty(
        Value1 => 'SomeValue',
    );

=cut

sub _OperatorIsNotEmpty {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # return result of negated equation
    return !$Self->_OperatorIsEmpty(%Param);
}

=item _OperatorIsGreaterThan()

Returns true or false (1/undef) if Value1 is greater than
the compare Value2.

    my $Result = $ConditionObject->_OperatorIsGreaterThan(
        Value1 => 2345,
        Value2 => 1234,
    );

=cut

sub _OperatorIsGreaterThan {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check for digits
    return if $Param{Value1} !~ m{ \A \d+ \z }xms;
    return if $Param{Value2} !~ m{ \A \d+ \z }xms;

    # return result of greater than check
    return $Param{Value1} > $Param{Value2};
}

=item _OperatorIsLessThan()

Returns true or false (1/undef) if Value1 is less than
the compare Value2.

    my $Result = $ConditionObject->_OperatorIsLessThan(
        Value1 => 2345,
        Value2 => 1234,
    );

=cut

sub _OperatorIsLessThan {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check for digits
    return if $Param{Value1} !~ m{ \A \d+ \z }xms;
    return if $Param{Value2} !~ m{ \A \d+ \z }xms;

    # return result of negated equation
    return !$Self->_OperatorIsGreaterThan(%Param);
}

=item _OperatorIsBefore()

Returns true or false (1/undef) if Value1 is before the compare Value2.

    my $Result = $ConditionObject->_OperatorIsBefore(
        Value1 => '2010-01-01 01:01:01',
        Value2 => '2010-01-01 10:01:01',
    );

=cut

sub _OperatorIsBefore {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check for date format
    return if $Param{Value1} !~ m{ \A \d{4}-\d{2}-\d{2} \s \d{2}:\d{2}:\d{2} \z }xms;
    return if $Param{Value2} !~ m{ \A \d{4}-\d{2}-\d{2} \s \d{2}:\d{2}:\d{2} \z }xms;

    # get timestamps
    my %Timestamp;
    for my $Date (qw(Value1 Value2)) {

        # convert time
        $Timestamp{$Date} = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Param{$Date},
        );

        # check for time
        return if !$Timestamp{$Date};
    }

    # return result of lower than check
    return $Timestamp{Value1} < $Timestamp{Value2};
}

=item _OperatorIsAfter()

Returns true or false (1/undef) if Value1 is after the compare Value2.

    my $Result = $ConditionObject->_OperatorIsAfter(
        Value1 => '2010-01-01 10:01:01',
        Value2 => '2010-01-01 01:01:01',
    );

=cut

sub _OperatorIsAfter {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check for date format
    return if $Param{Value1} !~ m{ \A \d{4}-\d{2}-\d{2} \s \d{2}:\d{2}:\d{2}  \z }xms;
    return if $Param{Value2} !~ m{ \A \d{4}-\d{2}-\d{2} \s \d{2}:\d{2}:\d{2}  \z }xms;

    # return result of negated equation
    return !$Self->_OperatorIsBefore(%Param);
}

=item _OperatorContains()

Returns true or false (1/undef) if value1 contains value2.

    my $Result = $ConditionObject->_OperatorContains(
        Value1 => 'SomeValue',
        Value2 => 'Value',
    );

=cut

sub _OperatorContains {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get lower case, for performance issues
    my $LowerValue1 = lc $Param{Value1};
    my $LowerValue2 = lc $Param{Value2};

    # check embedded string
    my $Contains = $LowerValue1 =~ m{ \A .* $LowerValue2 .* \z }xms;

    # return result of equation
    return $Contains;
}

=item _OperatorNotContains()

Returns true or false (1/undef) if value1 not contains value2.

    my $Result = $ConditionObject->_OperatorNotContains(
        Value1 => 'SomeValue',
        Value2 => 'SomeOtherValue',
    );

=cut

sub _OperatorNotContains {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # return result of negated equation
    return !$Self->_OperatorContains(%Param);
}

=item _OperatorBeginsWith()

Returns true or false (1/undef) if value1 begins with value2.

    my $Result = $ConditionObject->_OperatorBeginsWith(
        Value1 => 'SomeValue',
        Value2 => 'Some',
    );

=cut

sub _OperatorBeginsWith {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get lower case, for performance issues
    my $LowerValue1 = lc $Param{Value1};
    my $LowerValue2 = lc $Param{Value2};

    # check embedded string
    my $BeginsWith = $LowerValue1 =~ m{ \A $LowerValue2 .* \z }xms;

    # return result of equation
    return $BeginsWith;
}

=item _OperatorEndsWith()

Returns true or false (1/undef) if value1 ends with value2.

    my $Result = $ConditionObject->_OperatorEndsWith(
        Value1 => 'SomeValue',
        Value2 => 'Value',
    );

=cut

sub _OperatorEndsWith {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get lower case, for performance issues
    my $LowerValue1 = lc $Param{Value1};
    my $LowerValue2 = lc $Param{Value2};

    # check embedded string
    my $EndsWith = $LowerValue1 =~ m{ \A .* $LowerValue2 \z }xms;

    # return result of equation
    return $EndsWith;
}

# TODO: add 'set' operator
# TODO: add 'lock' operator

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=cut

=head1 VERSION

$Revision: 1.16 $ $Date: 2010/01/22 08:34:45 $

=cut
