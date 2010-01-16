# --
# Kernel/Modules/AgentITSMChangeTimeSlot.pm - the OTRS::ITSM::ChangeManagement move time slot module
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: AgentITSMChangeTimeSlot.pm,v 1.20 2010/01/16 10:45:49 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeTimeSlot;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMWorkOrder;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.20 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ParamObject DBObject LayoutObject LogObject ConfigObject)) {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }

    # create needed objects
    $Self->{ChangeObject}    = Kernel::System::ITSMChange->new(%Param);
    $Self->{WorkOrderObject} = Kernel::System::ITSMChange::ITSMWorkOrder->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMChange::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get needed ChangeID
    my $ChangeID = $Self->{ParamObject}->GetParam( Param => 'ChangeID' );

    # check needed stuff
    if ( !$ChangeID ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'No ChangeID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # check permissions
    my $Access = $Self->{ChangeObject}->Permission(
        Type     => $Self->{Config}->{Permission},
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $Self->{LayoutObject}->NoPermission(
            Message    => "You need $Self->{Config}->{Permission} permissions!",
            WithHeader => 'yes',
        );
    }

    # get change data
    my $Change = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # check if change is found
    if ( !$Change ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Change $ChangeID was not found in the database!",
            Comment => 'Please contact the admin.',
        );
    }

    # Moving is possible only when there are workorders.
    if ( !$Change->{WorkOrderCount} ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "The change can't be moved, as it has no workorders.",
            Comment => 'Add a workorder first.',
        );
    }

    # Moving is allowed only when there the change has not started yet.
    if ( $Change->{ActualStartTime} ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Can't move a change which already has started!",
            Comment => 'Please move the individual workorders instead.',
        );
    }

    # store needed parameters in %GetParam to make it reloadable
    my %GetParam;
    $GetParam{MoveTimeType} = $Self->{ParamObject}->GetParam(
        Param => 'MoveTimeType',
    ) || 'PlannedStartTime';

    # store time related fields in %GetParam
    for my $TimePart (qw(Year Month Day Hour Minute)) {
        my $ParamName = 'MoveTime' . $TimePart;
        $GetParam{$ParamName} = $Self->{ParamObject}->GetParam(
            Param => $ParamName,
        );
    }

    # Remember the reason why saving was not attempted.
    # The items are the names of the dtl validation error blocks.
    my @ValidationErrors;

    # move time slot of change
    if ( $Self->{Subaction} eq 'MoveTimeSlot' ) {

        # check validity of the time type
        my $MoveTimeType = $GetParam{MoveTimeType};
        if (
            !defined $MoveTimeType
            || ( $MoveTimeType ne 'PlannedStartTime' && $MoveTimeType ne 'PlannedEndTime' )
            )
        {
            push @ValidationErrors, 'InvalidTimeType';
        }

        # check the completeness of the time parameter list,
        # only hour and minute are allowed to be '0'
        if (
            !$GetParam{MoveTimeYear}
            || !$GetParam{MoveTimeMonth}
            || !$GetParam{MoveTimeDay}
            || !defined $GetParam{MoveTimeHour}
            || !defined $GetParam{MoveTimeMinute}
            )
        {
            push @ValidationErrors, 'InvalidMoveTime';
        }

        # get the system time from the input, if it can't be determined we have a validation error
        my $PlannedSystemTime;
        if ( !@ValidationErrors ) {

            # format as timestamp
            my $PlannedTime = sprintf '%04d-%02d-%02d %02d:%02d:00',
                $GetParam{MoveTimeYear},
                $GetParam{MoveTimeMonth},
                $GetParam{MoveTimeDay},
                $GetParam{MoveTimeHour},
                $GetParam{MoveTimeMinute};

            # sanity check of the assembled timestamp
            $PlannedSystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
                String => $PlannedTime,
            );

            if ( !$PlannedSystemTime ) {
                push @ValidationErrors, 'InvalidMoveTime';
            }
        }

        # move time slot only when there are no validation errors
        if ( !@ValidationErrors ) {

            # Determine the difference in seconds
            my $CurrentPlannedTime = $Change->{$MoveTimeType};

            # Even when there are workorders, a change might still miss a planned time.
            # In that case moving the time slot is not possible.
            if ( !$CurrentPlannedTime ) {

                # show error message
                return $Self->{LayoutObject}->ErrorScreen(
                    Message => "The current $MoveTimeType could not be determined.",
                    Comment => "The $MoveTimeType of all workorders has to be defined.",
                );
            }

            my $CurrentPlannedSystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
                String => $CurrentPlannedTime,
            );
            my $DiffSeconds = $PlannedSystemTime - $CurrentPlannedSystemTime;

            # TODO: think about locking
            my @CollectedUpdateParams;    # an array of params for WorkOrderUpdate()
            my %WorkOrderID2Number;       # Used only for error messages.
            WORKORDERID:
            for my $WorkOrderID ( @{ $Change->{WorkOrderIDs} } ) {
                my $WorkOrder = $Self->{WorkOrderObject}->WorkOrderGet(
                    WorkOrderID => $WorkOrderID,
                    UserID      => $Self->{UserID},
                );

                next WORKORDERID if !$WorkOrder;
                next WORKORDERID if ref $WorkOrder ne 'HASH';
                next WORKORDERID if !%{$WorkOrder};

                $WorkOrderID2Number{$WorkOrderID} = $WorkOrder->{WorkOrderNumber};
                my %UpdateParams;
                TYPE:
                for my $Type (qw(PlannedStartTime PlannedEndTime)) {

                    next TYPE if !$WorkOrder->{$Type};

                    my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
                        String => $WorkOrder->{$Type},
                    );
                    next TYPE if !$SystemTime;

                    # add the number of seconds that the time slot should be moved
                    $SystemTime += $DiffSeconds;
                    $UpdateParams{$Type} = $Self->{TimeObject}->SystemTime2TimeStamp(
                        SystemTime => $SystemTime,
                    );
                }

                next WORKORDERID if !%UpdateParams;

                # remember the workorder that should be moved
                $UpdateParams{WorkOrderID} = $WorkOrderID;

                push @CollectedUpdateParams, \%UpdateParams;
            }

            UPDATEPARAMS:
            for my $UpdateParams (@CollectedUpdateParams) {
                my $UpdateOk = $Self->{WorkOrderObject}->WorkOrderUpdate(
                    %{$UpdateParams},
                    UserID => $Self->{UserID},
                );

                if ( !$UpdateOk ) {

                    # show error message
                    my $Number = $Change->{ChangeNumber}
                        . '-'
                        . $WorkOrderID2Number{ $UpdateParams->{WorkOrderID} };

                    return $Self->{LayoutObject}->ErrorScreen(
                        Message => "Was not able to move time slot for workorder #$Number!",
                        Comment => 'Please contact the admin.',
                    );
                }
            }

            # everything went well, redirect to zoom mask
            return $Self->{LayoutObject}->Redirect(
                OP => "Action=AgentITSMChangeZoom&ChangeID=$ChangeID",
            );
        }
    }
    elsif ( $Self->{Subaction} eq 'AJAXUpdateMoveTime' ) {

        # get planned start time or planned end time from the change
        my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Change->{ $GetParam{MoveTimeType} },
        );

        # set the parameter hash for the answers
        # the seconds are ignored
        my ( $Second, $Minute, $Hour, $Day, $Month, $Year ) = $Self->{TimeObject}->SystemTime2Date(
            SystemTime => $SystemTime,
        );

        # get config for the number of years which should be selectable
        my $TimePeriod = $Self->{ConfigObject}->Get('ITSMWorkOrder::TimePeriod');
        my $StartYear  = $Year - $TimePeriod->{YearPeriodPast};
        my $EndYear    = $Year + $TimePeriod->{YearPeriodFuture};

        # assemble the data that will be returned
        my $JSON = $Self->{LayoutObject}->BuildJSON(
            [
                {
                    Name       => 'MoveTimeMinute',
                    Data       => [ map { sprintf '%02d', $_ } ( 0 .. 59 ) ],
                    SelectedID => $Minute,
                },
                {
                    Name       => 'MoveTimeHour',
                    Data       => [ map { sprintf '%02d', $_ } ( 0 .. 23 ) ],
                    SelectedID => $Hour,
                },
                {
                    Name       => 'MoveTimeDay',
                    Data       => [ map { sprintf '%02d', $_ } ( 1 .. 31 ) ],
                    SelectedID => $Day,
                },
                {
                    Name       => 'MoveTimeMonth',
                    Data       => [ map { sprintf '%02d', $_ } ( 1 .. 12 ) ],
                    SelectedID => $Month,
                },
                {
                    Name       => 'MoveTimeYear',
                    Data       => [ $StartYear .. $EndYear ],
                    SelectedID => $GetParam{MoveTimeYear},
                },
            ],
        );

        return $Self->{LayoutObject}->Attachment(
            ContentType => 'text/plain; charset=' . $Self->{LayoutObject}->{Charset},
            Content     => $JSON,
            Type        => 'inline',
            NoCache     => 1,
        );
    }
    else {

        # no subaction,
        # get planned start time or planned end time from the change
        my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Change->{ $GetParam{MoveTimeType} },
        );

        # set the parameter hash for BuildDateSelection()
        # the seconds are ignored
        my ( $Second, $Minute, $Hour, $Day, $Month, $Year ) = $Self->{TimeObject}->SystemTime2Date(
            SystemTime => $SystemTime,
        );
        $GetParam{MoveTimeMinute} = $Minute;
        $GetParam{MoveTimeHour}   = $Hour;
        $GetParam{MoveTimeDay}    = $Day;
        $GetParam{MoveTimeMonth}  = $Month;
        $GetParam{MoveTimeYear}   = $Year;
    }

    # build drop-down with time types
    my $MoveTimeTypeSelectionString = $Self->{LayoutObject}->BuildSelection(
        Data => [
            { Key => 'PlannedStartTime', Value => 'Planned start time' },
            { Key => 'PlannedEndTime',   Value => 'Planned end time' },
        ],
        Name       => 'MoveTimeType',
        SelectedID => $GetParam{MoveTimeType},
        Ajax       => {
            Update => [
                qw(MoveTimeMinute MoveTimeHour MoveTimeDay MoveTimeMonth MoveTimeYear),
            ],
            Depend => [
                qw(ChangeID MoveTimeType),
            ],
            Subaction => 'AJAXUpdateMoveTime',
        },
    );

    # time period that can be selected from the GUI
    my %TimePeriod = %{ $Self->{ConfigObject}->Get('ITSMWorkOrder::TimePeriod') };

    # add selection for the time
    my $MoveTimeSelectionString = $Self->{LayoutObject}->BuildDateSelection(
        %GetParam,
        Format => 'DateInputFormatLong',
        Prefix => 'MoveTime',
        %TimePeriod,
    );

    # remove AJAX-Loading images in date selection fields to avoid jitter effect
    $MoveTimeSelectionString =~ s{ <a [ ] id="AJAXImage [^<>]+ "></a> }{}xmsg;

    # output header
    my $Output = $Self->{LayoutObject}->Header(
        Title => 'Move Time Slot',
    );
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # Add the validation error messages.
    for my $BlockName (@ValidationErrors) {

        # show validation error message
        $Self->{LayoutObject}->Block( Name => $BlockName );
    }

    # start template output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMChangeTimeSlot',
        Data         => {
            %{$Change},
            MoveTimeTypeSelectionString => $MoveTimeTypeSelectionString,
            MoveTimeSelectionString     => $MoveTimeSelectionString,
        },
    );

    # add footer
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
