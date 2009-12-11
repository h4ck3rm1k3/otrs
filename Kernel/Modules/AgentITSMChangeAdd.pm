# --
# Kernel/Modules/AgentITSMChangeAdd.pm - the OTRS::ITSM::ChangeManagement change add module
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: AgentITSMChangeAdd.pm,v 1.27 2009/12/11 11:18:34 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeAdd;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMChangeCIPAllocate;
use Kernel::System::LinkObject;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.27 $) [1];

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
    $Self->{LinkObject}        = Kernel::System::LinkObject->new(%Param);
    $Self->{CIPAllocateObject} = Kernel::System::ITSMChange::ITSMChangeCIPAllocate->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMChange::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check permissions
    my $Access = $Self->{ChangeObject}->Permission(
        Type   => $Self->{Config}->{Permission},
        UserID => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $Self->{LayoutObject}->NoPermission(
            Message    => "You need $Self->{Config}->{Permission} permissions!",
            WithHeader => 'yes',
        );
    }

    # store needed parameters in %GetParam to make it reloadable
    my %GetParam;
    for my $ParamName (
        qw(
        ChangeTitle Description Justification TicketID
        OldCategoryID CategoryID OldImpactID ImpactID OldPriorityID PriorityID
        ElementChanged
        )
        )
    {
        $GetParam{$ParamName} = $Self->{ParamObject}->GetParam( Param => $ParamName );
    }

    # store time related fields in %GetParam
    if ( $Self->{Config}->{RealizeTime} ) {
        for my $TimePart (qw(Year Month Day Hour Minute Used)) {
            my $ParamName = 'RealizeTime' . $TimePart;
            $GetParam{$ParamName} = $Self->{ParamObject}->GetParam( Param => $ParamName );
        }
    }

    # set default values for category and impact
    my $DefaultCategory = $Self->{ConfigObject}->Get('ITSMChange::Category::Default');
    $Param{CategoryID} = $GetParam{CategoryID} || $Self->{ChangeObject}->ChangeCIPLookup(
        CIP  => $DefaultCategory,
        Type => 'Category',
    );

    my $DefaultImpact = $Self->{ConfigObject}->Get('ITSMChange::Impact::Default');
    $Param{ImpactID} = $GetParam{ImpactID} || $Self->{ChangeObject}->ChangeCIPLookup(
        CIP  => $DefaultImpact,
        Type => 'Impact',
    );

    # the TicketID can be validated even without the Subaction 'Save',
    # as it is passed as GET-param or in a hidden field.
    if ( $GetParam{TicketID} ) {

        # get ticket data
        my %Ticket = $Self->{TicketObject}->TicketGet(
            TicketID => $GetParam{TicketID},
        );

        # check if ticket exists
        if ( !%Ticket ) {

            # show error message
            return $Self->{LayoutObject}->ErrorScreen(
                Message => "Ticket with TicketID $GetParam{TicketID} does not exist!",
                Comment => 'Please contact the admin.',
            );
        }

        # get list of relevant ticket types
        my $AddChangeLinkTicketTypes
            = $Self->{ConfigObject}->Get('ITSMChange::AddChangeLinkTicketTypes');

        # check the list of relevant ticket types
        if (
            !$AddChangeLinkTicketTypes
            || ref $AddChangeLinkTicketTypes ne 'ARRAY'
            || !@{$AddChangeLinkTicketTypes}
            )
        {

            # set error message
            my $Message = "Missing sysconfig option 'ITSMChange::AddChangeLinkTicketTypes'!";

            # log error
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => $Message,
            );

            # show error message
            return $Self->{LayoutObject}->ErrorScreen(
                Message => $Message,
                Comment => 'Please contact the admin.',
            );
        }

        # get relevant ticket types
        my %IsRelevant = map { $_ => 1 } @{$AddChangeLinkTicketTypes};

        # check whether the ticket's type is relevant
        if ( !$IsRelevant{ $Ticket{Type} } ) {

            # set error message
            my $Message
                = "Invalid ticket type '$Ticket{Type}' for directly linking a ticket with a change. "
                . 'Only the following ticket type(s) are allowed for this operation: '
                . join ',', @{$AddChangeLinkTicketTypes};

            # log error
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => $Message,
            );

            # show error message
            return $Self->{LayoutObject}->ErrorScreen(
                Message => $Message,
                Comment => 'Please contact the admin.',
            );
        }
    }

    # Remember the reason why saving was not attempted.
    # The entries are the names of the dtl validation error blocks.
    my @ValidationErrors;
    my %CIPErrors;

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
        if ( $Self->{Config}->{RealizeTime} && $GetParam{RealizeTimeUsed} ) {

            if (
                $GetParam{RealizeTimeYear}
                && $GetParam{RealizeTimeMonth}
                && $GetParam{RealizeTimeDay}
                && $GetParam{RealizeTimeHour}
                && $GetParam{RealizeTimeMinute}
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
            else {

                # it was indicated that the realize time should be set,
                # but at least one of the required time params is missing
                push @ValidationErrors, 'InvalidRealizeTime';
            }
        }

        # add only when there are no input validation errors
        if ( !@ValidationErrors ) {
            my %AdditionalParam;

            if ( $Self->{Config}->{RealizeTime} ) {
                $AdditionalParam{RealizeTime} = $GetParam{RealizeTime};
            }

            my $ChangeID = $Self->{ChangeObject}->ChangeAdd(
                Description   => $GetParam{Description},
                Justification => $GetParam{Justification},
                ChangeTitle   => $GetParam{ChangeTitle},
                CategoryID    => $GetParam{CategoryID},
                ImpactID      => $GetParam{ImpactID},
                PriorityID    => $GetParam{PriorityID},
                UserID        => $Self->{UserID},
                %AdditionalParam,
            );

            # change could be added successfully
            if ($ChangeID) {

                # if the change add mask was called from the ticket zoom
                if ( $GetParam{TicketID} ) {

                    # link ticket with newly created change
                    my $LinkSuccess = $Self->{LinkObject}->LinkAdd(
                        SourceObject => 'Ticket',
                        SourceKey    => $GetParam{TicketID},
                        TargetObject => 'ITSMChange',
                        TargetKey    => $ChangeID,
                        Type         => 'Normal',
                        State        => 'Valid',
                        UserID       => $Self->{UserID},
                    );

                    # link could not be added
                    if ( !$LinkSuccess ) {

                        # set error message
                        my $Message = "Change with ChangeID $ChangeID was successfully added, "
                            . "but a link to Ticket with TicketID $GetParam{TicketID} could not be created!";

                        # log error
                        $Self->{LogObject}->Log(
                            Priority => 'error',
                            Message  => $Message,
                        );

                        # show error message
                        return $Self->{LayoutObject}->ErrorScreen(
                            Message => $Message,
                            Comment => 'Please contact the admin.',
                        );
                    }
                }

                # redirect to zoom mask
                return $Self->{LayoutObject}->Redirect(
                    OP => "Action=AgentITSMChangeZoom&ChangeID=$ChangeID",
                );
            }
            else {

                # show error message
                return $Self->{LayoutObject}->ErrorScreen(
                    Message => 'Was not able to add Change!',
                    Comment => 'Please contact the admin.',
                );
            }
        }
    }

    # handle AJAXUpdate
    elsif ( $Self->{Subaction} eq 'AJAXUpdate' ) {

        # get priorities
        my $Priorities = $Self->{ChangeObject}->ChangePossibleCIPGet(
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

    # build template dropdown
    # TODO: fill dropdown with data
    my $TemplateDropDown = $Self->{LayoutObject}->BuildSelection(
        Name => 'ChangeTemplate',
        Data => {},
    );

    # show block with template dropdown
    $Self->{LayoutObject}->Block(
        Name => 'ChangeTemplate',
        Data => {
            TemplatesStrg => $TemplateDropDown,
        },
    );

    # output header
    my $Output = $Self->{LayoutObject}->Header(
        Title => 'Add',
    );
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # add rich text editor
    if ( $Self->{ConfigObject}->Get('Frontend::RichText') ) {
        $Self->{LayoutObject}->Block(
            Name => 'RichText',
        );
    }

    if ( $Self->{Config}->{RealizeTime} ) {

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
    }

    # get categories
    $Param{Categories} = $Self->{ChangeObject}->ChangePossibleCIPGet(
        Type => 'Category',
    );

    # create category selection string
    $Param{'CategoryStrg'} = $Self->{LayoutObject}->BuildSelection(
        Data       => $Param{Categories},
        Name       => 'CategoryID',
        SelectedID => $Param{CategoryID},
        Ajax       => {
            Update => [
                'PriorityID',
            ],
            Depend => [
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
    $Param{Impacts} = $Self->{ChangeObject}->ChangePossibleCIPGet(
        Type => 'Impact',
    );

    # create impact string
    $Param{'ImpactStrg'} = $Self->{LayoutObject}->BuildSelection(
        Data       => $Param{Impacts},
        Name       => 'ImpactID',
        SelectedID => $Param{ImpactID},
        Ajax       => {
            Update => [
                'PriorityID',
            ],
            Depend => [
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
    $Param{Priorities} = $Self->{ChangeObject}->ChangePossibleCIPGet(
        Type => 'Priority',
    );

    # get selected priority, or the default value
    my $SelectedPriority = $GetParam{PriorityID};
    $SelectedPriority ||= $Self->{CIPAllocateObject}->PriorityAllocationGet(
        CategoryID => $Param{CategoryID},
        ImpactID   => $Param{ImpactID},
    );

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
        TemplateFile => 'AgentITSMChangeAdd',
        Data         => {
            %Param,
            %GetParam,
        },
    );

    # add footer
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
