# --
# Kernel/Output/HTML/LayoutITSMChange.pm - provides generic HTML output for ITSMChange
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: LayoutITSMChange.pm,v 1.9 2009/11/16 10:14:55 mae Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::LayoutITSMChange;

use strict;
use warnings;

use POSIX qw(ceil);

use Kernel::Output::HTML::Layout;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.9 $) [1];

=item ITSMChangeBuildWorkOrderGraph()

returns a output string for WorkOrder graph

    my $String = $LayoutObject->ITSMChangeBuildWorkOrderGraph(
        Change => $ChangeRef,
        WorkOrderObject => $WorkOrderObject,
    );

=cut

sub ITSMChangeBuildWorkOrderGraph {
    my ( $Self, %Param ) = @_;

    # check needed objects
    for my $Object (qw(TimeObject)) {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }

    # check change
    my $Change = $Param{Change};
    if ( !$Change ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Change!',
        );
        return;
    }

    # check work order object
    if ( !$Param{WorkOrderObject} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need WorkOrderObject!',
        );
        return;
    }
    $Self->{WorkOrderObject} = $Param{WorkOrderObject};

    # check if work orders are available
    return if !$Change->{WorkOrderIDs};

    # check for ARRAY-ref and empty ARRAY-ref
    return if ref $Change->{WorkOrderIDs} ne 'ARRAY' || !@{ $Change->{WorkOrderIDs} };

    # get smallest start time
    my $StartTime;

    if ( !$Change->{ActualStartTime} ) {

        # translate to timestamp
        $StartTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Change->{PlannedStartTime},
        );
    }
    else {

        # translate to timestamp for equation
        my $PlannedStartTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Change->{PlannedStartTime},
        );
        my $ActualStartTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Change->{ActualStartTime},
        );

        $StartTime = ( $PlannedStartTime > $ActualStartTime )
            ? $ActualStartTime
            : $PlannedStartTime
            ;
    }

    # get highest end time
    my $EndTime;

    if ( !$Change->{ActualEndTime} ) {

        # translate to timestamp
        $EndTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Change->{PlannedEndTime},
        );
    }
    else {

        # translate to timestamp for equation
        my $PlannedEndTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Change->{PlannedEndTime},
        );
        my $ActualEndTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Change->{ActualEndTime},
        );

        $EndTime = ( $PlannedEndTime < $ActualEndTime )
            ? $ActualEndTime
            : $PlannedEndTime
            ;
    }

    # calculate ticks for change
    my $ChangeTicks = $Self->_ITSMChangeGetChangeTicks(
        Start => $StartTime,
        End   => $EndTime,
    );

    # check for valid ticks
    if ( !$ChangeTicks ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Unable to calculate time scale.'
        );

        return;
    }

    # get work orders of change
    my @WorkOrders;
    WORKORDERID:
    for my $WorkOrderID ( @{ $Change->{WorkOrderIDs} } ) {
        my $WorkOrder = $Self->{WorkOrderObject}->WorkOrderGet(
            WorkOrderID => $WorkOrderID,
            UserID      => $Self->{UserID},
        );
        next WORKORDERID if !$WorkOrder;

        push @WorkOrders, $WorkOrder;
    }

    # sort work order ascending to WorkOrderNumber
    @WorkOrders = sort { $a->{WorkOrderNumber} <=> $b->{WorkOrderNumber} } @WorkOrders;

    # load graph sceleton
    $Self->Block(
        Name => 'WorkOrderGraph',
        Data => {
        },
    );

    # build graph of each work order
    WORKORDER:
    for my $WorkOrder (@WorkOrders) {
        next WORKORDER if !$WorkOrder;

        $Self->_ITSMChangeGetWorkOrderGraph(
            WorkOrder => $WorkOrder,
            StartTime => $StartTime,
            EndTime   => $EndTime,
            Ticks     => $ChangeTicks,
        );
    }

    # build scale of graph
    $Self->_ITSMChangeGetChangeScale(
        StartTime => $StartTime,
        EndTime   => $EndTime,
        Ticks     => $ChangeTicks,
    );

    # render graph and return HTML
    return $Self->Output(
        TemplateFile => 'ITSMChange',
    );
}

sub _ITSMChangeGetChangeTicks {
    my ( $Self, %Param ) = @_;

    # check for start and end
    return if !$Param{Start} || !$Param{End};

    # make sure we got integers
    return if $Param{Start} !~ m{ \A \d+ \z }smx;
    return if $Param{End} !~ m{ \A \d+ \z }smx;

    # calculate time span in sec
    my $Ticks;
    $Ticks = $Param{End} - $Param{Start};

    # check for computing error
    return if $Ticks <= 0;

    # get seconds per percent and round down
    $Ticks = ceil( $Ticks / 100 );

    return $Ticks;
}

sub _ITSMChangeGetChangeScale {
    my ( $Self, %Param ) = @_;

    # calculate scale naming
    my %ScaleName = (
        Scale20 => ( $Param{StartTime} + 20 * $Param{Ticks} ),
        Scale40 => ( $Param{StartTime} + 40 * $Param{Ticks} ),
        Scale60 => ( $Param{StartTime} + 60 * $Param{Ticks} ),
        Scale80 => ( $Param{StartTime} + 80 * $Param{Ticks} ),
    );

    # create scale block
    $Self->Block(
        Name => 'Scale',
        Data => {
            %ScaleName,
        },
    );

    for my $Interval ( sort keys %ScaleName ) {

        # translate timestamps in date format
        $ScaleName{$Interval} = $Self->{TimeObject}->SystemTime2TimeStamp(
            SystemTime => $ScaleName{$Interval},
        );

        # build scale label block
        $Self->Block(
            Name => 'ScaleLabel',
            Data => {
                ScaleLabel => $ScaleName{$Interval},
            },
        );
    }
}

sub _ITSMChangeGetWorkOrderGraph {
    my ( $Self, %Param ) = @_;

    return if !$Param{WorkOrder};

    # extract work order
    my $WorkOrder = $Param{WorkOrder};

    # translate planned start time
    my $PlannedStartTime = $Self->{TimeObject}->TimeStamp2SystemTime(
        String => $WorkOrder->{PlannedStartTime},
    );

    # translate planned end time
    my $PlannedEndTime = $Self->{TimeObject}->TimeStamp2SystemTime(
        String => $WorkOrder->{PlannedEndTime},
    );

    # set planned if no actual time is set
    $WorkOrder->{ActualStartTime} = $WorkOrder->{PlannedStartTime}
        if !$WorkOrder->{ActualStartTime};
    $WorkOrder->{ActualEndTime} = $WorkOrder->{PlannedEndTime}
        if !$WorkOrder->{ActualEndTime};

    # translate planned start time
    my $ActualStartTime = $Self->{TimeObject}->TimeStamp2SystemTime(
        String => $WorkOrder->{ActualStartTime},
    );

    # translate planned end time
    my $ActualEndTime = $Self->{TimeObject}->TimeStamp2SystemTime(
        String => $WorkOrder->{ActualEndTime},
    );

    # determine length of work order
    my %TickValue;

    # get values for planned span
    $TickValue{PlannedPadding} = ceil( ( $PlannedStartTime - $Param{StartTime} ) / $Param{Ticks} );
    $TickValue{PlannedTicks} = ceil( ( $PlannedEndTime - $PlannedStartTime ) / $Param{Ticks} ) || 1;

    # get at least 1 percent
    $TickValue{PlannedPadding}
        = ( $TickValue{PlannedTicks} == 1 && $TickValue{PlannedPadding} == 100 )
        ? 99
        : $TickValue{PlannedPadding}
        ;

    # get trailing space
    $TickValue{PlannedTrailing} = 100 - ( $TickValue{PlannedPadding} + $TickValue{PlannedTicks} );

    # get values for actual span
    $TickValue{ActualPadding} = ceil( ( $ActualStartTime - $Param{StartTime} ) / $Param{Ticks} );
    $TickValue{ActualTicks} = ceil( ( $ActualEndTime - $ActualStartTime ) / $Param{Ticks} ) || 1;

    # get at least 1 percent
    $TickValue{ActualPadding} = ( $TickValue{ActualTicks} == 1 && $TickValue{ActualPadding} == 100 )
        ? 99
        : $TickValue{ActualPadding}
        ;

    # get trailing space
    $TickValue{ActualTrailing} = 100 - ( $TickValue{ActualPadding} + $TickValue{ActualTicks} );

    # create work order item
    $Self->Block(
        Name => 'WorkOrderItem',
        Data => {
            %{$WorkOrder},
            %TickValue,
        },
    );
}

1;
