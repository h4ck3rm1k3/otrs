# --
# Kernel/Modules/AgentITSMWorkOrderAdd.pm - the OTRS::ITSM::ChangeManagement workorder add module
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: AgentITSMWorkOrderAdd.pm,v 1.51 2010/02/02 11:05:58 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMWorkOrderAdd;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMWorkOrder;
use Kernel::System::ITSMChange::Template;
use Kernel::System::Web::UploadCache;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.51 $) [1];

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
    $Self->{WorkOrderObject}   = Kernel::System::ITSMChange::ITSMWorkOrder->new(%Param);
    $Self->{UploadCacheObject} = Kernel::System::Web::UploadCache->new(%Param);
    $Self->{TemplateObject}    = Kernel::System::ITSMChange::Template->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMChange::Frontend::$Self->{Action}");

    # get form id
    $Self->{FormID} = $Self->{ParamObject}->GetParam( Param => 'FormID' );

    # create form id
    if ( !$Self->{FormID} ) {
        $Self->{FormID} = $Self->{UploadCacheObject}->FormIDCreate();
    }

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

    # error screen, don't show the add mask
    if ( !$Access ) {
        return $Self->{LayoutObject}->NoPermission(
            Message    => "You need $Self->{Config}->{Permission} permissions on the change!",
            WithHeader => 'yes',
        );
    }

    # get change data
    my $Change = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # check error
    if ( !$Change ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Change '$ChangeID' not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # store needed parameters in %GetParam to make it reloadable
    my %GetParam;
    for my $ParamName (
        qw(
        WorkOrderTitle Instruction WorkOrderTypeID
        PlannedEffort
        SaveAttachment FileID
        MoveTimeType MoveTimeYear MoveTimeMonth MoveTimeDay MoveTimeHour
        MoveTimeMinute MoveTimeUsed TemplateID
        )
        )
    {
        $GetParam{$ParamName} = $Self->{ParamObject}->GetParam( Param => $ParamName );
    }

    # store time related fields in %GetParam
    for my $TimeType (qw(PlannedStartTime PlannedEndTime MoveTime)) {
        for my $TimePart (qw(Used Year Month Day Hour Minute)) {
            my $ParamName = $TimeType . $TimePart;
            $GetParam{$ParamName} = $Self->{ParamObject}->GetParam( Param => $ParamName );
        }
    }

    # Remember the reason why saving was not attempted.
    # The entries are the names of the dtl validation error blocks.
    my @ValidationErrors;

    # get meta data for all already uploaded files
    my @Attachments = $Self->{UploadCacheObject}->FormIDGetAllFilesMeta(
        FormID => $Self->{FormID},
    );

    # reset subaction
    # if attachment upload is requested
    if ( $GetParam{SaveAttachment} ) {

        # get upload data
        my %UploadStuff = $Self->{ParamObject}->GetUploadAll(
            Param  => 'AttachmentNew',
            Source => 'string',
        );

        # check if file was already uploaded
        my $FileAlreadyUploaded = 0;
        for my $FileMetaData (@Attachments) {
            if ( $FileMetaData->{Filename} eq $UploadStuff{Filename} ) {
                $FileAlreadyUploaded = 1;

                # show error message
                push @ValidationErrors, 'FileAlreadyUploaded';
            }
        }

        if ( !$FileAlreadyUploaded ) {
            $Self->{UploadCacheObject}->FormIDAddFile(
                FormID => $Self->{FormID},
                %UploadStuff,
            );

            # reload attachment list, as an attachment was added
            @Attachments = $Self->{UploadCacheObject}->FormIDGetAllFilesMeta(
                FormID => $Self->{FormID},
            );
        }

        $Self->{Subaction} = 'SaveAttachment';
    }

    # reset subaction
    # if attachment should be deleted
    for my $Attachment (@Attachments) {
        if ( $Self->{ParamObject}->GetParam( Param => 'DeleteAttachment' . $Attachment->{FileID} ) )
        {

            # delete attachment
            $Self->{UploadCacheObject}->FormIDRemoveFile(
                FormID => $Self->{FormID},
                FileID => $Attachment->{FileID},
            );

            # set marker that the attachment list needs to be reloaded
            $Self->{Subaction} = 'DeleteAttachment';
        }
    }

    # perform the adding
    if ( $Self->{Subaction} eq 'Save' ) {

        # the title is required
        if ( !$GetParam{WorkOrderTitle} ) {
            push @ValidationErrors, 'InvalidTitle';
        }

        # check WorkOrderTypeID
        my $WorkOrderType = $Self->{WorkOrderObject}->WorkOrderTypeLookup(
            UserID          => $Self->{UserID},
            WorkOrderTypeID => $GetParam{WorkOrderTypeID},
        );

        if ( !$WorkOrderType ) {
            push @ValidationErrors, 'InvalidType';
        }

        # check whether complete times are passed and build the time stamps
        my %SystemTime;
        TIMETYPE:
        for my $TimeType (qw(PlannedStartTime PlannedEndTime)) {
            for my $TimePart (qw(Year Month Day Hour Minute)) {
                my $ParamName = $TimeType . $TimePart;
                if ( !defined $GetParam{$ParamName} ) {
                    $Self->{LogObject}->Log(
                        Priority => 'error',
                        Message  => "Need $ParamName!",
                    );
                    next TIMETYPE;
                }
            }

            # format as timestamp
            $GetParam{$TimeType} = sprintf '%04d-%02d-%02d %02d:%02d:00',
                $GetParam{ $TimeType . 'Year' },
                $GetParam{ $TimeType . 'Month' },
                $GetParam{ $TimeType . 'Day' },
                $GetParam{ $TimeType . 'Hour' },
                $GetParam{ $TimeType . 'Minute' };

            # sanity check the assembled timestamp
            $SystemTime{$TimeType} = $Self->{TimeObject}->TimeStamp2SystemTime(
                String => $GetParam{$TimeType},
            );

            # if time format is invalid
            if ( !$SystemTime{$TimeType} ) {
                push @ValidationErrors, "Invalid$TimeType";
            }
        }

        # check the ordering of the times
        if (
            $SystemTime{PlannedStartTime}
            && $SystemTime{PlannedEndTime}
            && $SystemTime{PlannedStartTime} >= $SystemTime{PlannedEndTime}
            )
        {
            push @ValidationErrors, 'InvalidPlannedEndTime';
        }

        # check format of planned effort, empty is allowed
        if ( $GetParam{PlannedEffort} !~ m{ \A \d* (?: [.] \d{1,2} )? \z }xms ) {
            push @ValidationErrors, 'InvalidPlannedEffort';
        }

        # add only when there are no input validation errors
        if ( !@ValidationErrors ) {
            my $WorkOrderID = $Self->{WorkOrderObject}->WorkOrderAdd(
                ChangeID         => $ChangeID,
                WorkOrderTitle   => $GetParam{WorkOrderTitle},
                Instruction      => $GetParam{Instruction},
                PlannedStartTime => $GetParam{PlannedStartTime},
                PlannedEndTime   => $GetParam{PlannedEndTime},
                WorkOrderTypeID  => $GetParam{WorkOrderTypeID},
                PlannedEffort    => $GetParam{PlannedEffort},
                UserID           => $Self->{UserID},
            );

            # adding was successful
            if ($WorkOrderID) {

                # move attachments from cache to virtual fs
                my @CachedAttachments = $Self->{UploadCacheObject}->FormIDGetAllFilesData(
                    FormID => $Self->{FormID},
                );

                for my $CachedAttachment (@CachedAttachments) {
                    my $Success = $Self->{WorkOrderObject}->WorkOrderAttachmentAdd(
                        %{$CachedAttachment},
                        WorkOrderID => $WorkOrderID,
                        ChangeID    => $ChangeID,
                        UserID      => $Self->{UserID},
                    );

                    # delete file from cache if move was successful
                    if ($Success) {
                        $Self->{UploadCacheObject}->FormIDRemoveFile(
                            FormID => $Self->{FormID},
                            FileID => $CachedAttachment->{FileID},
                        );
                    }
                    else {
                        $Self->{LogObject}->Log(
                            Priority => 'error',
                            Message  => 'Cannot move File from Cache to VirtualFS'
                                . "(${$CachedAttachment}{Filename})",
                        );
                    }
                }

                # redirect to zoom mask of the new workorder, when adding was successful
                return $Self->{LayoutObject}->Redirect(
                    OP => "Action=AgentITSMWorkOrderZoom&WorkOrderID=$WorkOrderID",
                );
            }
            else {

                # show error message, when adding failed
                return $Self->{LayoutObject}->ErrorScreen(
                    Message => 'Was not able to add workorder!',
                    Comment => 'Please contact the admin.',
                );
            }
        }
    }

    # create workorder from template
    elsif ( $Self->{Subaction} eq 'CreateFromTemplate' ) {

        my $NewTime;

        if ( $GetParam{MoveTimeUsed} ) {

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
            if ( !@ValidationErrors ) {

                # format as timestamp
                my $PlannedTime = sprintf '%04d-%02d-%02d %02d:%02d:00',
                    $GetParam{MoveTimeYear},
                    $GetParam{MoveTimeMonth},
                    $GetParam{MoveTimeDay},
                    $GetParam{MoveTimeHour},
                    $GetParam{MoveTimeMinute};

                # sanity check of the assembled timestamp
                $NewTime = $Self->{TimeObject}->TimeStamp2SystemTime(
                    String => $PlannedTime,
                );

                if ( !$NewTime ) {
                    push @ValidationErrors, 'InvalidMoveTime';
                }
            }
        }

        # check whether a template was selected
        if ( !$GetParam{TemplateID} ) {
            push @ValidationErrors, 'InvalidTemplate';
        }

        if ( !@ValidationErrors ) {

            # create template based on the template
            my $WorkOrderID = $Self->{TemplateObject}->TemplateDeSerialize(
                ChangeID        => $ChangeID,
                TemplateID      => $Self->{ParamObject}->GetParam( Param => 'TemplateID' ),
                UserID          => $Self->{UserID},
                NewTimeInEpoche => $NewTime,
                MoveTimeType    => $GetParam{MoveTimeType},
            );

            # change could not be created
            if ( !$WorkOrderID ) {

                # show error message, when adding failed
                return $Self->{LayoutObject}->ErrorScreen(
                    Message => 'Was not able to create workorder from template!',
                    Comment => 'Please contact the admin.',
                );
            }

            # redirect to zoom mask of the new workorder, when adding was successful
            return $Self->{LayoutObject}->Redirect(
                OP => "Action=AgentITSMWorkOrderZoom&WorkOrderID=$WorkOrderID",
            );
        }
    }

    # handle saaveattachment subaction
    elsif ( $Self->{Subaction} eq 'SaveAttachment' ) {

        # nothing to do
        # attachments were already saved above
    }

    # handle attachment deletion
    elsif ( $Self->{Subaction} eq 'DeleteAttachment' ) {

        # reload the attachment list,
        # as at least one attachment was deleted above
        @Attachments = $Self->{UploadCacheObject}->FormIDGetAllFilesMeta(
            FormID => $Self->{FormID},
        );
    }

    # handle attachment downloads
    elsif ( $Self->{Subaction} eq 'DownloadAttachment' ) {

        # get meta-data and content of the cached attachments
        my @CachedAttachments = $Self->{UploadCacheObject}->FormIDGetAllFilesData(
            FormID => $Self->{FormID},
        );

        # get data for requested attachment
        my ($AttachmentData) = grep { $_->{FileID} == $GetParam{FileID} } @CachedAttachments;

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

    # build template dropdown
    my $TemplateList = $Self->{TemplateObject}->TemplateList(
        UserID        => $Self->{UserID},
        CommentLength => 15,
        TemplateType  => 'ITSMWorkOrder',
    );
    my $TemplateSelectionString = $Self->{LayoutObject}->BuildSelection(
        Name         => 'TemplateID',
        Data         => $TemplateList,
        PossibleNone => 1,
    );

    # build drop-down with time types
    my $MoveTimeTypeSelectionString = $Self->{LayoutObject}->BuildSelection(
        Data => [
            { Key => 'PlannedStartTime', Value => 'Planned Start Time' },
            { Key => 'PlannedEndTime',   Value => 'Planned End Time' },
        ],
        Name => 'MoveTimeType',
        SelectedID => $GetParam{MoveTimeType} || 'PlannedStartTime',
    );

    # time period that can be selected from the GUI
    my %TimePeriod = %{ $Self->{ConfigObject}->Get('ITSMWorkOrder::TimePeriod') };

    # add selection for the time
    my $MoveTimeSelectionString = $Self->{LayoutObject}->BuildDateSelection(
        %GetParam,
        Format           => 'DateInputFormatLong',
        Prefix           => 'MoveTime',
        MoveTimeOptional => 1,
        %TimePeriod,
    );

    # remove AJAX-Loading images in date selection fields to avoid jitter effect
    $MoveTimeSelectionString =~ s{ <a [ ] id="AJAXImage [^<>]+ "></a> }{}xmsg;

    # show block with template dropdown
    $Self->{LayoutObject}->Block(
        Name => 'WorkOrderTemplate',
        Data => {
            ChangeID                    => $ChangeID,
            TemplateSelectionString     => $TemplateSelectionString,
            MoveTimeTypeSelectionString => $MoveTimeTypeSelectionString,
            MoveTimeSelectionString     => $MoveTimeSelectionString,
        },
    );

    # show validation errors in WorkOrderTemplate block
    my %ValidationErrorNames;
    @ValidationErrorNames{@ValidationErrors} = (1) x @ValidationErrors;
    for my $ChangeTemplateValidationError (qw(InvalidMoveTimeType InvalidMoveTime InvalidTemplate))
    {
        if ( $ValidationErrorNames{$ChangeTemplateValidationError} ) {
            $Self->{LayoutObject}->Block(
                Name => $ChangeTemplateValidationError,
            );
        }
    }

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

    # set selected type
    my %SelectedInfo = (
        Default => 1,
    );

    if ( $GetParam{WorkOrderTypeID} ) {
        %SelectedInfo = ( Selected => $GetParam{WorkOrderTypeID}, )
    }

    # get WorkOrderType list
    my $WorkOrderTypeList = $Self->{WorkOrderObject}->WorkOrderTypeList(
        UserID => $Self->{UserID},
        %SelectedInfo,
    ) || [];

    # build the dropdown
    my $WorkOrderTypeDropDown = $Self->{LayoutObject}->BuildSelection(
        Name => 'WorkOrderTypeID',
        Data => $WorkOrderTypeList,
    );

    # show block with WorkOrderType dropdown
    $Self->{LayoutObject}->Block(
        Name => 'WorkOrderType',
        Data => {
            TypeStrg => $WorkOrderTypeDropDown,
        },
    );

    # set the time selections
    for my $TimeType (qw(PlannedStartTime PlannedEndTime)) {

        # set default value for $DiffTime
        # When no time is given yet, then use the current time plus the difftime
        # When an explicit time was retrieved, $DiffTime is not used
        my $DiffTime = $TimeType eq 'PlannedStartTime' ? 0 : 60 * 60;

        # add selection for the time
        $GetParam{ $TimeType . 'String' } = $Self->{LayoutObject}->BuildDateSelection(
            %GetParam,
            Format   => 'DateInputFormatLong',
            Prefix   => $TimeType,
            DiffTime => $DiffTime,
            %TimePeriod,
        );
    }

    # show planned effort if it is configured
    if ( $Self->{Config}->{PlannedEffort} ) {
        $Self->{LayoutObject}->Block(
            Name => 'ShowPlannedEffort',
            Data => {
                PlannedEffort => $GetParam{PlannedEffort},
            },
        );
    }

    # add the validation error messages
    for my $BlockName (@ValidationErrors) {
        $Self->{LayoutObject}->Block( Name => $BlockName );
    }

    # show attachments
    for my $Attachment (@Attachments) {
        $Self->{LayoutObject}->Block(
            Name => 'AttachmentRow',
            Data => {
                %{$Attachment},
                FormID   => $Self->{FormID},
                ChangeID => $ChangeID,
            },
        );
    }

    # start template output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMWorkOrderAdd',
        Data         => {
            %Param,
            %{$Change},
            %GetParam,
            FormID => $Self->{FormID},
        },
    );

    # add footer
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
