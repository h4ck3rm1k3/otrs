# --
# Kernel/System/ITSMConfigItem/Number.pm - sub module of ITSMConfigItem.pm with number functions
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: Number.pm,v 1.4 2009/08/19 22:48:14 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::Number;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

=head1 NAME

Kernel::System::ITSMConfigItem::Number - sub module of Kernel::System::ITSMConfigItem

=head1 SYNOPSIS

All config item number functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item ConfigItemNumberLookup()

return config item id or config item number

    my $ConfigItemNumber = $ConfigItemObject->ConfigItemNumberLookup(
        ConfigItemID => 123,
    );

    or

    my $ConfigItemID = $ConfigItemObject->ConfigItemNumberLookup(
        ConfigItemNumber => '123454321',
    );

=cut

sub ConfigItemNumberLookup {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ConfigItemID} && !$Param{ConfigItemNumber} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ConfigItemID or ConfigItemNumber!',
        );
        return;
    }

    if ( $Param{ConfigItemID} ) {

        # check if result is already cached
        return $Self->{Cache}->{ConfigItemNumberLookup}->{ID}->{ $Param{ConfigItemID} }
            if $Self->{Cache}->{ConfigItemNumberLookup}->{ID}->{ $Param{ConfigItemID} };

        # ask database
        $Self->{DBObject}->Prepare(
            SQL   => 'SELECT configitem_number FROM configitem WHERE id = ?',
            Bind  => [ \$Param{ConfigItemID} ],
            Limit => 1,
        );

        # fetch the result
        my $ConfigItemNumber;
        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            $ConfigItemNumber = $Row[0];
        }

        # cache the result
        $Self->{Cache}->{ConfigItemNumberLookup}->{ID}->{ $Param{ConfigItemID} }
            = $ConfigItemNumber;

        return $ConfigItemNumber;
    }

    # check if result is already cached
    return $Self->{Cache}->{ConfigItemNumberLookup}->{Number}->{ $Param{ConfigItemNumber} }
        if $Self->{Cache}->{ConfigItemNumberLookup}->{Number}->{ $Param{ConfigItemNumber} };

    # quote
    $Param{ConfigItemNumber} = $Self->{DBObject}->Quote( $Param{ConfigItemNumber} );

    # ask database
    $Self->{DBObject}->Prepare(
        SQL   => 'SELECT id FROM configitem WHERE configitem_number = ?',
        Bind  => [ \$Param{ConfigItemNumber} ],
        Limit => 1,
    );

    # fetch the result
    my $ConfigItemID;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $ConfigItemID = $Row[0];
    }

    # cache the result
    $Self->{Cache}->{ConfigItemNumberLookup}->{Number}->{ $Param{ConfigItemNumber} }
        = $ConfigItemID;

    return $ConfigItemID;
}

=item ConfigItemNumberCreate()

create a new config item number

    my $Number = $ConfigItemObject->ConfigItemNumberCreate(
        Type    => 'AutoIncrement',
        ClassID => 123,
    );

=cut

sub ConfigItemNumberCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Type ClassID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # load backend
    if ( !$Self->{MainObject}->Require( $Param{Type} ) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't load config item number generator backend module $Param{Type}! $@",
        );
        return;
    }

    # load backend
    push @ISA, $Param{Type};

    # create number
    my $Number = $Self->_ConfigItemNumberCreate(%Param);

    return $Number;
}

=item CurrentCounterGet()

return the current counter of a class

    my $Counter = $ConfigItemObject->CurrentCounterGet(
        ClassID => 123,
        Type    => 'AutoIncrement',
    );

=cut

sub CurrentCounterGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ClassID Type)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # ask the database
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT counter FROM configitem_counter WHERE '
            . 'class_id = ? AND counter_type = ?',
        Bind => [ \$Param{ClassID}, \$Param{Type} ],
        Limit => 1,
    );

    # fetch the result
    my $Number;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Number = $Row[0];
    }

    return $Number;
}

=item CurrentCounterSet()

set the current counter of a class

    my $True = $ConfigItemObject->CurrentCounterSet(
        ClassID => 123,
        Type    => 'AutoIncrement',
        Counter => '12',
    );

=cut

sub CurrentCounterSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ClassID Type Counter)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # delete old counter
    $Self->{DBObject}->Do(
        SQL  => 'DELETE FROM configitem_counter WHERE class_id = ?',
        Bind => [ \$Param{ClassID} ],
    );

    # set new counter
    $Self->{DBObject}->Do(
        SQL => 'INSERT INTO configitem_counter '
            . '(class_id, counter_type, counter) VALUES (?, ?, ?)',
        Bind => [ \$Param{ClassID}, \$Param{Type}, \$Param{Counter} ],
    );

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

$Revision: 1.4 $ $Date: 2009/08/19 22:48:14 $

=cut
