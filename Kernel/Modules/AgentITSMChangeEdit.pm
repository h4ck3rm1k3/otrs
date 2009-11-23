# --
# Kernel/Modules/AgentITSMChangeEdit.pm - the OTRS::ITSM::ChangeManagement change edit module
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: AgentITSMChangeEdit.pm,v 1.20 2009/11/23 13:55:06 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeEdit;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::System::ITSMChangeCIPAllocate;

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
    $Self->{ChangeObject}      = Kernel::System::ITSMChange->new(%Param);
    $Self->{CIPAllocateObject} = Kernel::System::ITSMChangeCIPAllocate->new(%Param);

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

    # error screen, don't show change edit mask
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
            Message => "Change $ChangeID not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # store needed parameters in %GetParam to make it reloadable
    my %GetParam;
    for my $ParamName (
        qw(
        ChangeTitle Description Justification TicketID
        OldCategoryID CategoryID OldImpactID ImpactID OldPriorityID PriorityID
        PriorityRC ElementChanged
        )
        )
    {
        $GetParam{$ParamName} = $Self->{ParamObject}->GetParam( Param => $ParamName );
    }

    # store time related fields in %GetParam
    for my $TimePart (qw(Year Month Day Hour Minute Used)) {
        my $ParamName = 'RealizeTime' . $TimePart;
        $GetParam{$ParamName} = $Self->{ParamObject}->GetParam( Param => $ParamName );
    }

    # set default values for category and impact
    $Param{CategoryID} = $Change->{CategoryID};
    $Param{ImpactID}   = $Change->{ImpactID};

    # keep ChangeStateID only if configured
    if ( $Self->{Config}->{State} ) {
        $GetParam{ChangeStateID} = $Self->{ParamObject}->GetParam( Param => 'ChangeStateID' );
    }

    # Remember the reason why saving was not attempted.
    # This entries are the names of the dtl validation error blocks.
    my @ValidationErrors;
    my %CIPErrors;

    # set Subaction to non-existent value when we
    # should recalculate priority
    if ( $GetParam{PriorityRC} && $Self->{Subaction} ne 'AJAXUpdate' ) {
        $Self->{Subaction} = '';
    }

    # update change
    if ( $Self->{Subaction} eq 'Save' ) {

        # check the title
        if ( !$GetParam{ChangeTitle} ) {
            push @ValidationErrors, 'InvalidTitle';
        }

        # check CIP
        for my $Type (qw(Category Impact Priority)) {
            if ( !$GetParam{"${Type}ID"} ) {
                push @ValidationErrors, 'Invalid' . $Type;
                $CIPErrors{$Type} = 1;
            }
            else {
                my $CIPIsValid = $Self->{ChangeObject}->ChangeCIPLookup(
                    ID   => $GetParam{"${Type}ID"},
                    Type => $Type,
                );

                if ( !$CIPIsValid ) {
                    push @ValidationErrors, 'Invalid' . $Type;
                    $CIPErrors{$Type} = 1;
                }
            }
        }

        # check the realize time
        if (
            $GetParam{RealizeTimeYear}
            && $GetParam{RealizeTimeMonth}
            && $GetParam{RealizeTimeDay}
            && $GetParam{RealizeTimeHour}
            && $GetParam{RealizeTimeMinute}
            && $GetParam{RealizeTimeUsed}
            )
        {

            # format as timestamp, when all required time param were passed
            $GetParam{RealizeTime} = sprintf '%04d-%02d-%02d %02d:%02d:00',
                $GetParam{RealizeTimeYear},
                $GetParam{RealizeTimeMonth},
                $GetParam{RealizeTimeDay},
                $GetParam{RealizeTimeHour},
                $GetParam{RealizeTimeMinute};

            # sanity check of the assembled timestamp
            my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
                String => $GetParam{RealizeTime},
            );

            # do not save when time is invalid
            if ( !$SystemTime ) {
                push @ValidationErrors, 'InvalidRealizeTime';
            }
        }
        elsif ( $GetParam{RealizeTimeUsed} ) {

            # it was indicated that the realize time should be set,
            # but at least one of the required time params is missing
            push @ValidationErrors, 'InvalidRealizeTime';
        }

        # update only when there are no validation errors
        if ( !@ValidationErrors ) {
            my %AdditionalParam;
            if ( $Self->{Config}->{State} ) {
                $AdditionalParam{ChangeStateID} = $GetParam{ChangeStateID};
            }
            my $CouldUpdateChange = $Self->{ChangeObject}->ChangeUpdate(
                ChangeID      => $ChangeID,
                Description   => $GetParam{Description},
                Justification => $GetParam{Justification},
                ChangeTitle   => $GetParam{ChangeTitle},
                CategoryID    => $GetParam{CategoryID},
                ImpactID      => $GetParam{ImpactID},
                PriorityID    => $GetParam{PriorityID},
                RealizeTime   => $GetParam{RealizeTime},
                UserID        => $Self->{UserID},
                %AdditionalParam,
            );

            if ($CouldUpdateChange) {

                # redirect to zoom mask
                return $Self->{LayoutObject}->Redirect(
                    OP => "Action=AgentITSMChangeZoom&ChangeID=$ChangeID",
                );
            }
            else {

                # show error message
                return $Self->{LayoutObject}->ErrorScreen(
                    Message => "Was not able to update Change $ChangeID!",
                    Comment => 'Please contact the admin.',
                );
            }
        }
    }

    # handle AJAXUpdate
    elsif ( $Self->{Subaction} eq 'AJAXUpdate' ) {

        # get priorities
        my $Priorities = $Self->{ChangeObject}->PossibleCIPGet(
            Type => 'Priority',
        );

        # get selected priority
        my $SelectedPriority = $Self->{CIPAllocateObject}->PriorityAllocationGet(
            CategoryID => $GetParam{CategoryID},
            ImpactID   => $GetParam{ImpactID},
        );

        # build json
        my $JSON = $Self->{LayoutObject}->BuildJSON(
            [
                {
                    Name        => 'PriorityID',
                    Data        => $Priorities,
                    SelectedID  => $SelectedPriority,
                    Translation => 1,
                    Max         => 100,
                },
            ],
        );

        # return json
        return $Self->{LayoutObject}->Attachment(
            ContentType => 'text/plain; charset=' . $Self->{LayoutObject}->{Charset},
            Content     => $JSON,
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # delete all keys from %GetParam when it is no Subaction
    else {
        %GetParam = ();

        if ( $Self->{Connfig}->{State} ) {
            $GetParam{ChangeStateID} = $Change->{ChangeStateID};
        }

        if ( $Change->{RealizeTime} ) {

            # get realize time from the change
            my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
                String => $Change->{RealizeTime},
            );

            my ( $Second, $Minute, $Hour, $Day, $Month, $Year )
                = $Self->{TimeObject}->SystemTime2Date(
                SystemTime => $SystemTime,
                );

            # set the parameter hash for BuildDateSelection()
            $GetParam{RealizeTimeUsed}   = 1;
            $GetParam{RealizeTimeMinute} = $Minute;
            $GetParam{RealizeTimeHour}   = $Hour;
            $GetParam{RealizeTimeDay}    = $Day;
            $GetParam{RealizeTimeMonth}  = $Month;
            $GetParam{RealizeTimeYear}   = $Year;
        }
    }

    if ( $Self->{Config}->{State} ) {

        # get change state list
        my $ChangePossibleStates = $Self->{ChangeObject}->ChangePossibleStatesGet(
            ChangeID => $ChangeID,
            UserID   => $Self->{UserID},
        );

        # build drop-down with change states
        my $StateSelectString = $Self->{LayoutObject}->BuildSelection(
            Data       => $ChangePossibleStates,
            Name       => 'ChangeStateID',
            SelectedID => $GetParam{ChangeStateID},
        );

        $Self->{LayoutObject}->Block(
            Name => 'State',
            Data => {
                StateSelectString => $StateSelectString,
            },
        );

    }

    # output header
    my $Output = $Self->{LayoutObject}->Header(
        Title => 'Edit',
    );
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # add rich text editor
    if ( $Self->{ConfigObject}->Get('Frontend::RichText') ) {
        $Self->{LayoutObject}->Block(
            Name => 'RichText',
        );
    }

    # time period that can be selected from the GUI
    my %TimePeriod = %{ $Self->{ConfigObject}->Get('ITSMWorkOrder::TimePeriod') };

    # add selection for the time
    my $TimeSelectionString = $Self->{LayoutObject}->BuildDateSelection(
        %GetParam,
        Format              => 'DateInputFormatLong',
        Prefix              => 'RealizeTime',
        RealizeTimeOptional => 1,
        %TimePeriod,
    );

    # show time fields
    $Self->{LayoutObject}->Block(
        Name => 'RealizeTime',
        Data => {
            'RealizeTimeString' => $TimeSelectionString,
        },
    );

    # get categories
    $Param{Categories} = $Self->{ChangeObject}->PossibleCIPGet(
        Type => 'Category',
    );

    # create impact string
    $Param{'CategoryStrg'} = $Self->{LayoutObject}->BuildSelection(
        Data       => $Param{Categories},
        Name       => 'CategoryID',
        SelectedID => $Param{CategoryID},
        OnChange   => "document.compose.PriorityRC.value='1'; "
            . "document.compose.submit(); return false;",
        Ajax => {
            Update => [
                'PriorityID',
            ],
            Depend => [
                'ChangeID',
                'CategoryID',
                'ImpactID',
            ],
            Subaction => 'AJAXUpdate',
        },
    );

    # show category dropdown
    $Self->{LayoutObject}->Block(
        Name => 'Category',
        Data => {
            %Param,
        },
    );

    # show error block
    if ( $CIPErrors{Category} ) {
        $Self->{LayoutObject}->Block( Name => 'InvalidCategory' );
    }

    # get impacts
    $Param{Impacts} = $Self->{ChangeObject}->PossibleCIPGet(
        Type => 'Impact',
    );

    # create impact string
    $Param{'ImpactStrg'} = $Self->{LayoutObject}->BuildSelection(
        Data       => $Param{Impacts},
        Name       => 'ImpactID',
        SelectedID => $Param{ImpactID},
        OnChange   => "document.compose.PriorityRC.value='1'; "
            . "document.compose.submit(); return false;",
        Ajax => {
            Update => [
                'PriorityID',
            ],
            Depend => [
                'ChangeID',
                'CategoryID',
                'ImpactID',
            ],
            Subaction => 'AJAXUpdate',
        },
    );

    # show impact dropdown
    $Self->{LayoutObject}->Block(
        Name => 'Impact',
        Data => {
            %Param,
        },
    );

    # show error block
    if ( $CIPErrors{Impact} ) {
        $Self->{LayoutObject}->Block( Name => 'InvalidImpact' );
    }

    # get priorities
    $Param{Priorities} = $Self->{ChangeObject}->PossibleCIPGet(
        Type => 'Priority',
    );

    # get selected priority
    my $SelectedPriority = $Change->{PriorityID};

    if ( $GetParam{PriorityID} && !$GetParam{PriorityRC} ) {
        $SelectedPriority = $GetParam{PriorityID};
    }

    # create impact string
    $Param{'PriorityStrg'} = $Self->{LayoutObject}->BuildSelection(
        Data       => $Param{Priorities},
        Name       => 'PriorityID',
        SelectedID => $SelectedPriority,
    );

    # show priority dropdown
    $Self->{LayoutObject}->Block(
        Name => 'Priority',
        Data => {
            %Param,
        },
    );

    # show error block
    if ( $CIPErrors{Priority} ) {
        $Self->{LayoutObject}->Block( Name => 'InvalidPriority' );
    }

    # Add the validation error messages as late as possible
    # as the enclosing blocks, e.g. 'RealizeTime' muss first be set.
    for my $BlockName (@ValidationErrors) {

        # show validation error message
        $Self->{LayoutObject}->Block(
            Name => $BlockName,
        );
    }

    # start template output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMChangeEdit',
        Data         => {
            %Param,
            %{$Change},
            %GetParam,
        },
    );

    # add footer
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
