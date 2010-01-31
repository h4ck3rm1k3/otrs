# --
# Kernel/Modules/AgentITSMChangeEdit.pm - the OTRS::ITSM::ChangeManagement change edit module
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: AgentITSMChangeEdit.pm,v 1.44 2010/01/31 05:22:03 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeEdit;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMChangeCIPAllocate;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.44 $) [1];

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
    $Self->{CIPAllocateObject} = Kernel::System::ITSMChange::ITSMChangeCIPAllocate->new(%Param);

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
            Message => "Change '$ChangeID' not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # store needed parameters in %GetParam to make this page reloadable
    my %GetParam;
    for my $ParamName (
        qw(
        ChangeTitle Description Justification TicketID
        OldCategoryID CategoryID OldImpactID ImpactID OldPriorityID PriorityID
        ElementChanged SaveAttachment FileID
        )
        )
    {
        $GetParam{$ParamName} = $Self->{ParamObject}->GetParam( Param => $ParamName );
    }

    # store time related fields in %GetParam
    if ( $Self->{Config}->{RequestedTime} ) {
        for my $TimePart (qw(Year Month Day Hour Minute Used)) {
            my $ParamName = 'RequestedTime' . $TimePart;
            $GetParam{$ParamName} = $Self->{ParamObject}->GetParam( Param => $ParamName );
        }
    }

    # Remember the reason why perfoming the subaction was not attempted.
    # The entries are the names of the dtl validation error blocks.
    my @ValidationErrors;

    # if attachment upload is requested
    if ( $GetParam{SaveAttachment} ) {
        $Self->{Subaction} = 'SaveAttachment';
    }

    # get all attachments meta data
    my %Attachments = $Self->{ChangeObject}->ChangeAttachmentList(
        ChangeID => $ChangeID,
    );

    # check if attachment should be deleted
    for my $AttachmentID ( keys %Attachments ) {
        if ( $Self->{ParamObject}->GetParam( Param => 'DeleteAttachment' . $AttachmentID ) ) {
            $Self->{Subaction} = 'DeleteAttachment';
        }
    }

    # keep ChangeStateID only if configured
    if ( $Self->{Config}->{ChangeState} ) {
        $GetParam{ChangeStateID} = $Self->{ParamObject}->GetParam( Param => 'ChangeStateID' );
    }

    # update change
    if ( $Self->{Subaction} eq 'Save' ) {

        # check the title
        if ( !$GetParam{ChangeTitle} ) {
            push @ValidationErrors, 'InvalidTitle';
        }

        # check CIP
        for my $Type (qw(Category Impact Priority)) {
            if ( !$GetParam{"${Type}ID"} || $GetParam{"${Type}ID"} !~ m{ \A \d+ \z }xms ) {
                push @ValidationErrors, 'Invalid' . $Type;
            }
            else {
                my $CIPIsValid = $Self->{ChangeObject}->ChangeCIPLookup(
                    ID   => $GetParam{"${Type}ID"},
                    Type => $Type,
                );

                if ( !$CIPIsValid ) {
                    push @ValidationErrors, 'Invalid' . $Type;
                }
            }
        }

        # check the requested time
        if ( $Self->{Config}->{RequestedTime} && $GetParam{RequestedTimeUsed} ) {

            if (
                $GetParam{RequestedTimeYear}
                && $GetParam{RequestedTimeMonth}
                && $GetParam{RequestedTimeDay}
                && defined $GetParam{RequestedTimeHour}
                && defined $GetParam{RequestedTimeMinute}
                )
            {

                # format as timestamp, when all required time params were passed
                $GetParam{RequestedTime} = sprintf '%04d-%02d-%02d %02d:%02d:00',
                    $GetParam{RequestedTimeYear},
                    $GetParam{RequestedTimeMonth},
                    $GetParam{RequestedTimeDay},
                    $GetParam{RequestedTimeHour},
                    $GetParam{RequestedTimeMinute};

                # sanity check of the assembled timestamp
                my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
                    String => $GetParam{RequestedTime},
                );

                # do not save when time is invalid
                if ( !$SystemTime ) {
                    push @ValidationErrors, 'InvalidRequestedTime';
                }
            }
            else {

                # it was indicated that the requested time should be set,
                # but at least one of the required time params is missing
                push @ValidationErrors, 'InvalidRequestedTime';
            }
        }

        # update only when there are no input validation errors
        if ( !@ValidationErrors ) {

            # setting of change state and requested time is configurable
            my %AdditionalParam;
            if ( $Self->{Config}->{ChangeState} ) {
                $AdditionalParam{ChangeStateID} = $GetParam{ChangeStateID};
            }
            if ( $Self->{Config}->{RequestedTime} ) {
                $AdditionalParam{RequestedTime} = $GetParam{RequestedTime};
            }

            my $CouldUpdateChange = $Self->{ChangeObject}->ChangeUpdate(
                ChangeID      => $ChangeID,
                Description   => $GetParam{Description},
                Justification => $GetParam{Justification},
                ChangeTitle   => $GetParam{ChangeTitle},
                CategoryID    => $GetParam{CategoryID},
                ImpactID      => $GetParam{ImpactID},
                PriorityID    => $GetParam{PriorityID},
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

    # handle AJAXUpdate, only for setting the priority
    elsif ( $Self->{Subaction} eq 'AJAXUpdate' ) {

        # get all possible priorities
        my $Priorities = $Self->{ChangeObject}->ChangePossibleCIPGet(
            Type   => 'Priority',
            UserID => $Self->{UserID},
        );

        # propose a priority, based on the category and the impact the proposed p selected priority
        my $ProposedPriority = $Self->{CIPAllocateObject}->PriorityAllocationGet(
            CategoryID => $GetParam{CategoryID},
            ImpactID   => $GetParam{ImpactID},
        );

        # build json
        my $JSON = $Self->{LayoutObject}->BuildJSON(
            [
                {
                    Name        => 'PriorityID',
                    Data        => $Priorities,
                    SelectedID  => $ProposedPriority,
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

    # handle attachment actions
    elsif ( $Self->{Subaction} eq 'SaveAttachment' ) {
        my %UploadStuff = $Self->{ParamObject}->GetUploadAll(
            Param  => "AttachmentNew",
            Source => 'string',
        );

        # check if file was already uploaded
        my $FileAlreadyUploaded = $Self->{ChangeObject}->ChangeAttachmentExists(
            Filename => $UploadStuff{Filename},
            UserID   => $Self->{UserID},
            ChangeID => $ChangeID,
        );

        # write to virtual fs
        if ( $UploadStuff{Filename} && !$FileAlreadyUploaded ) {

            my $Success = $Self->{ChangeObject}->ChangeAttachmentAdd(
                %UploadStuff,
                ChangeID => $ChangeID,
                UserID   => $Self->{UserID},
            );

            # check for error
            if ( !$Success ) {
                push @ValidationErrors, 'FileAlreadyUploaded';
            }

            # reload attachment list
            %Attachments = $Self->{ChangeObject}->ChangeAttachmentList(
                ChangeID => $ChangeID,
            );
        }
        else {
            push @ValidationErrors, 'FileAlreadyUploaded';
        }
    }
    elsif ( $Self->{Subaction} eq 'DeleteAttachment' ) {
        for my $AttachmentID ( keys %Attachments ) {
            if ( $Self->{ParamObject}->GetParam( Param => 'DeleteAttachment' . $AttachmentID ) ) {

                # delete attachment
                $Self->{ChangeObject}->ChangeAttachmentDelete(
                    FileID   => $AttachmentID,
                    UserID   => $Self->{UserID},
                    ChangeID => $Change->{ChangeID},
                );

                # reload attachment list
                %Attachments = $Self->{ChangeObject}->ChangeAttachmentList(
                    ChangeID => $ChangeID,
                );

                $Self->{Subaction} = 'DeleteAttachment';
            }
        }
    }

    # handle attachment downloads
    elsif ( $Self->{Subaction} eq 'DownloadAttachment' ) {

        # get data for attachment
        my $AttachmentData = $Self->{ChangeObject}->ChangeAttachmentGet(
            FileID => $GetParam{FileID},
        );

        # return error if file does not exist
        if ( !$AttachmentData ) {
            $Self->{LogObject}->Log(
                Message  => "No such attachment ($GetParam{FileID})! May be an attack!!!",
                Priority => 'error',
            );
            return $Self->{LayoutObject}->ErrorScreen();
        }

        return $Self->{LayoutObject}->Attachment(
            %{$AttachmentData},
            Type => 'attachment',
        );
    }

    # delete all keys from %GetParam when it is no Subaction
    else {
        %GetParam = ();

        if ( $Self->{Config}->{ChangeState} ) {
            $GetParam{ChangeStateID} = $Change->{ChangeStateID};
        }

        if ( $Self->{Config}->{RequestedTime} && $Change->{RequestedTime} ) {

            # get requested time from the change
            my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
                String => $Change->{RequestedTime},
            );

            my ( $Second, $Minute, $Hour, $Day, $Month, $Year )
                = $Self->{TimeObject}->SystemTime2Date( SystemTime => $SystemTime );

            # set the parameter hash for BuildDateSelection()
            $GetParam{RequestedTimeUsed}   = 1;
            $GetParam{RequestedTimeMinute} = $Minute;
            $GetParam{RequestedTimeHour}   = $Hour;
            $GetParam{RequestedTimeDay}    = $Day;
            $GetParam{RequestedTimeMonth}  = $Month;
            $GetParam{RequestedTimeYear}   = $Year;
        }
    }

    if ( $Self->{Config}->{ChangeState} ) {

        # get change state list
        my $ChangePossibleStates = $Self->{ChangeObject}->ChangePossibleStatesGet(
            ChangeID => $ChangeID,
            UserID   => $Self->{UserID},
        );

        # build drop-down with change states
        my $StateSelectionString = $Self->{LayoutObject}->BuildSelection(
            Data       => $ChangePossibleStates,
            Name       => 'ChangeStateID',
            SelectedID => $GetParam{ChangeStateID},
        );

        # show state dropdown
        $Self->{LayoutObject}->Block(
            Name => 'State',
            Data => {
                StateSelectionString => $StateSelectionString,
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

    if ( $Self->{Config}->{RequestedTime} ) {

        # time period that can be selected from the GUI
        my %TimePeriod = %{ $Self->{ConfigObject}->Get('ITSMWorkOrder::TimePeriod') };

        # add selection for the time
        my $TimeSelectionString = $Self->{LayoutObject}->BuildDateSelection(
            %GetParam,
            Format                => 'DateInputFormatLong',
            Prefix                => 'RequestedTime',
            RequestedTimeOptional => 1,
            %TimePeriod,
        );

        # show time fields
        $Self->{LayoutObject}->Block(
            Name => 'RequestedTime',
            Data => {
                'RequestedTimeString' => $TimeSelectionString,
            },
        );
    }

    # create dropdown for the category
    # all categories are selectable
    # when the category is changed, a new priority is proposed
    my $Categories = $Self->{ChangeObject}->ChangePossibleCIPGet(
        Type   => 'Category',
        UserID => $Self->{UserID},
    );
    $Param{CategorySelectionString} = $Self->{LayoutObject}->BuildSelection(
        Data       => $Categories,
        Name       => 'CategoryID',
        SelectedID => $GetParam{CategoryID} || $Change->{CategoryID},
        Ajax       => {
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

    # create dropdown for the impact
    # all impacts are selectable
    # when the impact is changed, a new priority is proposed
    my $Impacts = $Self->{ChangeObject}->ChangePossibleCIPGet(
        Type   => 'Impact',
        UserID => $Self->{UserID},
    );
    $Param{ImpactSelectionString} = $Self->{LayoutObject}->BuildSelection(
        Data       => $Impacts,
        Name       => 'ImpactID',
        SelectedID => $GetParam{ImpactID} || $Change->{ImpactID},
        Ajax       => {
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

    # create dropdown for priority,
    # all priorities are selectable
    my $Priorities = $Self->{ChangeObject}->ChangePossibleCIPGet(
        Type   => 'Priority',
        UserID => $Self->{UserID},
    );
    $Param{PrioritySelectionString} = $Self->{LayoutObject}->BuildSelection(
        Data       => $Priorities,
        Name       => 'PriorityID',
        SelectedID => $GetParam{PriorityID} || $Change->{PriorityID},
    );

    # add the validation error messages
    for my $BlockName (@ValidationErrors) {
        $Self->{LayoutObject}->Block( Name => $BlockName );
    }

    # show attachments
    ATTACHMENTID:
    for my $AttachmentID ( keys %Attachments ) {

        # get info about file
        my $AttachmentData = $Self->{ChangeObject}->ChangeAttachmentGet(
            FileID => $AttachmentID,
        );

        # check for attachment information
        next ATTACHMENTID if !$AttachmentData;

        # show block
        $Self->{LayoutObject}->Block(
            Name => 'AttachmentRow',
            Data => {
                %{$Change},
                %{$AttachmentData},
            },
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
