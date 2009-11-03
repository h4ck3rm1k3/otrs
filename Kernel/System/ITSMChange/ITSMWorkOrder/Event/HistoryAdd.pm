# --
# Kernel/System/ITSMChange/ITSMWorkOrder/Event/HistoryAdd.pm - HistoryAdd event module for WorkOrder
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: HistoryAdd.pm,v 1.3 2009/11/03 14:19:07 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMWorkOrder::Event::HistoryAdd;

use strict;
use warnings;

use Kernel::System::ITSMChange::History;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

=head1 NAME

Kernel::System::ITSMChange::ITSMWorkOrder::HistoryAdd - WorkOrder history add lib

=head1 SYNOPSIS

Event handler module for history add in WorkOrder.

=head1 PUBLIC INTERFACE

=over 4

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
    for (qw(DBObject ConfigObject EncodeObject LogObject MainObject TimeObject WorkOrderObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    # create additional objects
    $Self->{HistoryObject} = Kernel::System::ITSMChange::History->new( %{$Self} );

    return $Self;
}

=item Run()

The C<Run()> method handles the events and adds/deletes the history entries for
the given workorder object.

It returns 1 on success, C<undef> otherwise.

    my $Success = $HistoryObject->Run(
        WorkOrderID => 123,
        Data     => {
            ChangeID => 123,
            ChangeTitle => 'test',
        },
        UserID => 1,
        Config => ...,
    );

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(WorkOrderID Event Config)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # in history we use Event name without 'Post'
    $Param{Event} =~ s/Post$//;

    # do history stuff
    if ( $Param{Event} eq 'WorkOrderAdd' ) {

        # tell history that a change was added
        $Self->{HistoryObject}->HistoryAdd(
            HistoryType => $Param{Event},
            WorkOrderID => $Param{Data}->{WorkOrderID},
            UserID      => $Param{Data}->{UserID},
            ContentNew  => $Param{Data}->{WorkOrderID},
            ChangeID    => $Param{Data}->{ChangeID},
        );
    }
    elsif ( $Param{Event} eq 'WorkOrderUpdate' ) {

        # get old data
        my $OldData = delete $Param{Data}->{OldWorkOrderData};

        FIELD:
        for my $Field ( keys %{ $Param{Data} } ) {

            # we do not track the user id
            next FIELD if $Field eq 'UserID';

            # check if field has changed
            my $FieldHasChanged = $Self->HasFieldChanged(
                New => $Param{Data}->{$Field},
                Old => $OldData->{$Field},
            );

            # save history if field changed
            if ($FieldHasChanged) {
                $Self->{HistoryObject}->HistoryAdd(
                    WorkOrderID => $Param{Data}->{WorkOrderID},
                    Field       => $Field,
                    ContentNew  => $Param{Data}->{$Field},
                    ContentOld  => $OldData->{$Field},
                    UserID      => $Param{Data}->{UserID},
                    HistoryType => $Param{Event},
                    ChangeID    => $Param{Data}->{ChangeID},
                );
            }
        }
    }
    elsif ( $Param{Event} eq 'WorkOrderDelete' ) {

        # delete history of change
        $Self->{HistoryObject}->WorkOrderHistoryDelete(
            WorkOrderID => $Param{Data}->{WorkOrderID},
            UserID      => $Param{Data}->{UserID},
        );
    }

    # error
    else {

        # a non-known event
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "$Param{Event} is a non-known event!",
        );
    }

    return 1;
}

=item HasFieldChanged()

This method checks whether a field was changed or not. It returns 1 when field
was changed, 0 otherwise

    my $FieldHasChanged = $HistoryObject->HasFieldChanged(
        Old => 'old value', # can be array reference or hash reference as well
        New => 'new value', # can be array reference or hash reference as well
    );

=cut

sub HasFieldChanged {
    my ( $Self, %Param ) = @_;

    # field has changed when either 'new' or 'old is not set
    return 1 if !( $Param{New} && $Param{Old} ) && ( $Param{New} || $Param{Old} );

    # return result of 'eq' when both params are scalars
    return $Param{New} ne $Param{Old} if !ref( $Param{New} ) && !ref( $Param{Old} );

    # a field has changed when 'ref' is different
    return 1 if ref( $Param{New} ) ne ref( $Param{Old} );

    # check hashes
    if ( 'HASH' eq ref $Param{New} ) {

        #field has changed when number of keys are different
        return 1 if scalar keys %{ $Param{New} } != scalar keys %{ $Param{Old} };

        # check the values for each key
        for my $Key ( keys %{ $Param{New} } ) {
            return 1 if $Param{New}->{$Key} ne $Param{Old}->{$Key};
        }
    }

    # check arrays
    if ( 'ARRAY' eq ref $Param{New} ) {

        # changed when number of elements differ
        return 1 if scalar @{ $Param{New} } != scalar @{ $Param{Old} };

        # check each element
        for my $Index ( 0 .. $#{ $Param{New} } ) {
            return 1 if $Param{New}->[$Index] ne $Param{Old}->[$Index];
        }
    }

    # field has not been changed
    return 0;
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

$Revision: 1.3 $ $Date: 2009/11/03 14:19:07 $

=cut
