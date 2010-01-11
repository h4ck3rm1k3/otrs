# --
# Kernel/System/ITSMChange/ITSMCondition.pm - all condition functions
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: ITSMCondition.pm,v 1.11 2010/01/11 15:55:22 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMCondition;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMWorkOrder;
use Kernel::System::Valid;

use base qw(Kernel::System::EventHandler);
use base qw(Kernel::System::ITSMChange::ITSMCondition::Object);
use base qw(Kernel::System::ITSMChange::ITSMCondition::Attribute);
use base qw(Kernel::System::ITSMChange::ITSMCondition::Operator);
use base qw(Kernel::System::ITSMChange::ITSMCondition::Expression);

use vars qw($VERSION);
$VERSION = qw($Revision: 1.11 $) [1];

=head1 NAME

Kernel::System::ITSMChange::ITSMCondition - condition lib

=head1 SYNOPSIS

All functions for conditions in ITSMChangeManagement.

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
    use Kernel::System::ITSMChange::ITSMCondition;

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
    my $ConditionObject = Kernel::System::ITSMChange::ITSMCondition->new(
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
    $Self->{ChangeObject}    = Kernel::System::ITSMChange->new( %{$Self} );
    $Self->{WorkOrderObject} = Kernel::System::ITSMChange::ITSMWorkOrder->new( %{$Self} );
    $Self->{ValidObject}     = Kernel::System::Valid->new( %{$Self} );

    # init of event handler
    $Self->EventHandlerInit(
        Config     => 'ITSMCondition::EventModule',
        BaseObject => 'ConditionObject',
        Objects    => {
            %{$Self},
        },
    );

    return $Self;
}

=item ConditionAdd()

Add a new condition.

    my $ConditionID = $ConditionObject->ConditionAdd(
        ChangeID              => 123,
        Name                  => 'The condition name',
        ExpressionConjunction => 'any',                 # (any|all)
        Comments              => 'A comment',           # (optional)
        ValidID               => 1,
        UserID                => 1,
    );

=cut

sub ConditionAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ChangeID Name ExpressionConjunction ValidID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check if a condition with this name and change id exist already
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT id FROM change_condition '
            . 'WHERE change_id = ? AND name = ?',
        Bind => [
            \$Param{ChangeID}, \$Param{Name},
        ],
        Limit => 1,
    );

    # TODO: execute ConditionAddPre Event

    # TODO: execute ConditionAddPost Event

    return $ExpressionID;

    my $ConditionID;
    return $ConditionID;
}

=item ConditionUpdate()

=cut

sub ConditionUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ConditionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    return 1;
}

=item ConditionGet()

Returns a hash reference of the condition data for a given ConditionID.

    my $ConditionData = $ConditionObject->ConditionGet(
        ConditionID => 123,
        UserID      => 1,
    );

The returned hash reference contains following elements:

    $ConditionData{ConditionID}
    $ConditionData{ChangeID}
    $ConditionData{Name}
    $ConditionData{ExpressionConjunction}
    $ConditionData{Comments}
    $ConditionData{ValidID}
    $ConditionData{CreateTime}
    $ConditionData{CreateBy}
    $ConditionData{ChangeTime}
    $ConditionData{ChangeBy}

=cut

sub ConditionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ConditionID UserID)) {
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
        SQL => 'SELECT id, change_id, name, expression_conjunction, comments, '
            . 'valid_id, create_time, create_by, change_time, change_by '
            . 'FROM change_condition '
            . 'WHERE id = ?',
        Bind  => [ \$Param{ConditionID} ],
        Limit => 1,
    );

    # fetch the result
    my %ConditionData;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $ConditionData{ConditionID}           = $Row[0];
        $ConditionData{ChangeID}              = $Row[1];
        $ConditionData{Name}                  = $Row[2];
        $ConditionData{ExpressionConjunction} = $Row[3];
        $ConditionData{Comments}              = $Row[4];
        $ConditionData{ValidID}               = $Row[5];
        $ConditionData{CreateTime}            = $Row[6];
        $ConditionData{CreateBy}              = $Row[7];
        $ConditionData{ChangeTime}            = $Row[8];
        $ConditionData{ChangeBy}              = $Row[9];
    }

    # check error
    if ( !%ConditionData ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "ConditionID $Param{ConditionID} does not exist!",
        );
        return;
    }

    return \%ConditionData;
}

=item ConditionList()

return a list of all conditions ids of a given change id as array reference

    my $ConditionIDsRef = $ConditionObject->ConditionList(
        ChangeID => 5,
        Valid    => 0,   # (optional) default 1 (0|1)
        UserID   => 1,
    );

=cut

sub ConditionList {
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

    # check valid param
    if ( !defined $Param{Valid} ) {
        $Param{Valid} = 1;
    }

    # define SQL statement
    my $SQL = 'SELECT id '
        . 'FROM change_condition '
        . 'WHERE change_id = ? ';

    # get only valid condition ids
    if ( $Param{Valid} ) {

        my @ValidIDs = $Self->{ValidObject}->ValidIDsGet();
        my $ValidIDString = join ', ', @ValidIDs;

        $SQL .= "AND valid_id IN ( $ValidIDString )";
    }

    # prepare SQL statement
    return if !$Self->{DBObject}->Prepare(
        SQL  => $SQL,
        Bind => [ \$Param{ChangeID} ],
    );

    # fetch the result
    my @ConditionIDs;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @ConditionIDs, $Row[0];
    }

    return \@ConditionIDs;
}

=item ConditionDelete()

Delete a condition.

    my $Success = $ConditionObject->ConditionDelete(
        ConditionID => 123,
        UserID      => 1,
    );

=cut

sub ConditionDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ConditionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # delete condition from database
    return if !$Self->{DBObject}->Do(
        SQL => 'DELETE FROM change_condition '
            . 'WHERE id = ?',
        Bind => [ \$Param{ConditionID} ],
    );

    return 1;
}

=item ConditionMatchExecuteAll()

This functions finds all conditions for a given ChangeID, and in case a condition matches,
all defined actions will be executed.

    my $Success = $ConditionObject->ConditionMatchExecuteAll(
        ChangeID          => 123,
        AttributesChanged => [ 'ChangeTitle', 'ChangeStateID' ],  # (optional)
        UserID            => 1,
    );

=cut

sub ConditionMatchExecuteAll {
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

    return 1;
}

=item ConditionMatchExecute()

This function matches the given condition and executes all defined actions.
The optional parameter 'AttributesChanged' defines a list of attributes that were changed
during e.g. a ChangeUpdate-Event. If a condition matches an expression, the attribute of the expression
must be listed in 'AttributesChanged'.

    my $Success = $ConditionObject->ConditionMatchExecute(
        ConditionID       => 123,
        AttributesChanged => [ 'ChangeTitle', 'ChangeStateID' ],  # (optional)
        UserID            => 1,
    );

=cut

sub ConditionMatchExecute {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ConditionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
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

$Revision: 1.11 $ $Date: 2010/01/11 15:55:22 $

=cut
