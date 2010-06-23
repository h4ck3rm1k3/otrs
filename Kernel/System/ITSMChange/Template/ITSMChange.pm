# --
# Kernel/System/ITSMChange/Template/ITSMChange.pm - all template functions for changes
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: ITSMChange.pm,v 1.5 2010/06/23 08:05:08 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::Template::ITSMChange;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::Template::ITSMWorkOrder;
use Kernel::System::ITSMChange::Template::ITSMCondition;
use Kernel::System::LinkObject;
use Kernel::System::Valid;
use Data::Dumper;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.5 $) [1];

=head1 NAME

Kernel::System::ITSMChange::Template::ITSMChange - all template functions for changes

=head1 SYNOPSIS

All functions for change templates in ITSMChangeManagement.

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
    use Kernel::System::ITSMChange::Template::ITSMChange;

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
    my $TemplateObject = Kernel::System::ITSMChange::Template::ITSMChange->new(
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
    $Self->{LinkObject}      = Kernel::System::LinkObject->new( %{$Self} );
    $Self->{ValidObject}     = Kernel::System::Valid->new( %{$Self} );
    $Self->{ConditionObject} = Kernel::System::ITSMChange::ITSMCondition->new( %{$Self} );

    $Self->{WorkOrderTemplateObject}
        = Kernel::System::ITSMChange::Template::ITSMWorkOrder->new( %{$Self} );
    $Self->{ConditionTemplateObject}
        = Kernel::System::ITSMChange::Template::ITSMCondition->new( %{$Self} );

    return $Self;
}

=item Serialize()

Serialize a change. This is done with Data::Dumper. It returns
a serialized string of the datastructure. The change actions
are "wrapped" within an arrayreference...

    my $TemplateString = $TemplateObject->Serialize(
        ChangeID => 1,
        UserID   => 1,
        Return   => 'HASH', # (optional) HASH|STRING default 'STRING'
    );

returns

    '{ChangeAdd => {Title => 'title', ...}}, {WorkOrderAdd => { ChangeID => 123, ... }}'

If parameter C<Return> is set to C<HASH>, the Perl datastructure
is returned

    {
        ChangeAdd => { ... },
        Children  => [
            {
                WorkOrderAdd => { ... },
                Children     => [ ... ],
            },
            {
                WorkOrderAdd => { ... },
                Children     => [ ... ],
            },
        ],
    }

=cut

sub Serialize {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID ChangeID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # set default value for 'Return'
    $Param{Return} ||= 'STRING';

    # get change
    my $Change = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    return if !$Change;

    # keep only wanted attributes
    my $CleanChange;
    for my $Attribute (
        qw(
        ChangeID ChangeNumber ChangeStateID ChangeTitle Description DescriptionPlain
        Justification JustificationPlain ChangeManagerID ChangeBuilderID
        CategoryID ImpactID PriorityID CABAgents CABCustomers RequestedTime
        CreateTime CreateBy ChangeTime ChangeBy PlannedStartTime PlannedEndTime)
        )
    {
        $CleanChange->{$Attribute} = $Change->{$Attribute};
    }

    # add change freekey and freetext fields to list of wanted attributes
    ATTRIBUTE:
    for my $Attribute ( keys %{$Change} ) {

        # find the change freekey and freetext attributes
        if ( $Attribute =~ m{ \A ( ChangeFreeKey | ChangeFreeText ) }xms ) {

            $CleanChange->{$Attribute} = $Change->{$Attribute};
        }
    }

    my $OriginalData = { ChangeAdd => $CleanChange };

    # get attachments
    my %ChangeAttachments = $Self->{ChangeObject}->ChangeAttachmentList(
        ChangeID => $Change->{ChangeID},
    );
    for my $FileID ( keys %ChangeAttachments ) {

        # save attachments to this template
        push @{ $OriginalData->{Children} }, { AttachmentAdd => { FileID => $FileID } };
    }

    # get workorders
    WORKORDERID:
    for my $WorkOrderID ( @{ $Change->{WorkOrderIDs} } ) {
        my $WorkOrder = $Self->{WorkOrderTemplateObject}->Serialize(
            WorkOrderID => $WorkOrderID,
            UserID      => $Param{UserID},
            Return      => 'HASH',
        );

        next WORKORDERID if !$WorkOrder;

        push @{ $OriginalData->{Children} }, $WorkOrder;
    }

    # get condition list for the change
    my $ConditionList = $Self->{ConditionObject}->ConditionList(
        ChangeID => $Param{ChangeID},
        Valid    => 0,
        UserID   => $Param{UserID},
    ) || [];

    # get each condition
    CONDITIONID:
    for my $ConditionID ( @{$ConditionList} ) {
        my $Condition = $Self->{ConditionTemplateObject}->Serialize(
            ConditionID => $ConditionID,
            UserID      => $Param{UserID},
            Return      => 'HASH',
        );

        next CONDITIONID if !$Condition;

        push @{ $OriginalData->{Children} }, $Condition;
    }

    # get links to other object
    my $LinkListWithData = $Self->{LinkObject}->LinkListWithData(
        Object => 'ITSMChange',
        Key    => $Change->{ChangeID},
        State  => 'Valid',
        UserID => $Param{UserID},
    );

    for my $TargetObject ( keys %{$LinkListWithData} ) {
        for my $Type ( keys %{ $LinkListWithData->{$TargetObject} } ) {
            for my $Key ( keys %{ $LinkListWithData->{$TargetObject}->{$Type} } ) {
                for my $TargetID ( keys %{ $LinkListWithData->{$TargetObject}->{$Type}->{$Key} } ) {
                    my $LinkInfo = {
                        SourceObject => 'ITSMChange',
                        SourceKey    => $Change->{ChangeID},
                        TargetObject => $TargetObject,
                        TargetKey    => $TargetID,
                        Type         => $Type,
                        State        => 'Valid',
                        UserID       => $Param{UserID},
                    };
                    push @{ $OriginalData->{Children} }, { LinkAdd => $LinkInfo };
                }
            }
        }
    }

    if ( $Param{Return} eq 'HASH' ) {
        return $OriginalData;
    }

    # no indentation (saves space)
    local $Data::Dumper::Indent = 0;

    # do not use cross-referencing
    local $Data::Dumper::Deepcopy = 1;

    # serialize the data (do not use $VAR1, but $TemplateData for Dumper output)
    my $SerializedData = $Self->{MainObject}->Dump( $OriginalData, 'binary' );

    return $SerializedData;
}

=item DeSerialize()

DeSerialize() is a wrapper for all the _XXXAdd methods.

    my %Info = $TemplateObject->DeSerialize(
        Data => {
            # ... Params for ChangeAdd
        },
        ChangeID => 1,
        UserID   => 1,
        Method   => 'ChangeAdd',
    );

=cut

sub DeSerialize {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID Method Data)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # dispatch table
    my %Method2Sub = (
        ChangeAdd     => '_ChangeAdd',
        AttachmentAdd => '_AttachmentAdd',
        LinkAdd       => '_LinkAdd',
    );

    my $Sub = $Method2Sub{ $Param{Method} };

    if ( !$Sub ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Invalid Methodname!',
        );
        return;
    }

    return $Self->$Sub(%Param);
}

=begin Internal:

=item _ChangeAdd()

Creates a new change based on a template. It returns a hash with additional
info like ChangeID.

    my %Return = $TemplateObject->_ChangeAdd(
        Data => {
            ChangeTitle => 'test',
        },
        # other change attributes
        ChangeID => 0,
        UserID   => 1,
    );

=cut

sub _ChangeAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID Data)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # make a local copy
    my %Data = %{ $Param{Data} };

    # we need the old change id for expressions
    my $OldChangeID = $Data{ChangeID};

    # these attributes are generated automatically, so don't pass them to ChangeAdd()
    delete @Data{qw(ChangeID ChangeNumber CreateTime CreateBy ChangeTime ChangeBy)};
    delete @Data{qw(DescriptionPlain JustificationPlain)};

    # if user set a new time, calculate difference
    my $Difference;
    if ( $Param{NewTimeInEpoche} ) {
        my $OldTime = $Data{ $Param{MoveTimeType} };

        if ($OldTime) {
            $Difference = $Self->_GetTimeDifference(
                CurrentTime     => $OldTime,
                NewTimeInEpoche => $Param{NewTimeInEpoche},
            );
        }
    }

    # PlannedXXXTime was saved just for "move time" purposes
    delete $Data{PlannedEndTime};
    delete $Data{PlannedStartTime};

    # RequestedTime should not be set
    delete $Data{RequestedTime};

    # delete all parameters whose values are 'undef'
    # _CheckChangeParams throws an error otherwise
    for my $Parameter ( keys %Data ) {
        delete $Data{$Parameter} if !defined $Data{$Parameter};
    }

    # replace the ChangeBuilderID from the saved template with the current user id
    $Data{ChangeBuilderID} = $Param{UserID};

    # add the change
    my $ChangeID = $Self->{ChangeObject}->ChangeAdd(
        %Data,
        UserID => $Param{UserID},
    );

    my %Info = (
        ID             => $ChangeID,
        ChangeID       => $ChangeID,
        TimeDifference => $Difference,
        OldChangeID    => $OldChangeID,
    );

    return %Info;
}

=item _GetTimeDifference()

If a new planned start/end time was given, the difference is needed
to move all time values

    my $DiffInSeconds = $TemplateObject->_GetTimeDifference(
        CurrentTime     => '2010-01-12 00:00:00',
        NewTimeInEpoche => 1234567890,
    );

=cut

sub _GetTimeDifference {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(CurrentTime NewTimeInEpoche)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get current time as timestamp
    my $CurrentSystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
        String => $Param{CurrentTime},
    );

    my $DiffSeconds = $Param{NewTimeInEpoche} - $CurrentSystemTime;

    return $DiffSeconds;
}

=item _AttachmentAdd()

Creates new attachments for a change or a workorder based on the given template. It
returns a hash of information (with just one key - "Success")

    my %Info = $TemplateObject->_AttachmentAdd(
        Data => {
            # ... Params for AttachmentAdd
        },
        ChangeID => 1,
        UserID   => 1,
    );

=cut

sub _AttachmentAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID ChangeID Data)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my $Attachment = $Self->{ChangeObject}->ChangeAttachmentGet(
        FileID => $Param{Data}->{FileID},
    );

    my $Success = $Self->{ChangeObject}->ChangeAttachmentAdd(
        %{$Attachment},
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    my %Info = (
        Success => $Success,
    );

    return %Info;
}

=item _LinkAdd()

Creates new links for a change or a workorder based on the given template. It
returns a hash of information (with just one key - "Success")

    my %Info = $TemplateObject->_LinkAdd(
        Data => {
            # ... Params for LinkAdd
        },
        ChangeID    => 1,
        WorkOrderID => 123, # optional
        UserID      => 1,
    );

=cut

sub _LinkAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID Data)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my $SourceKey;

    if ( $Param{Data}->{SourceObject} eq 'ITSMChange' ) {
        $SourceKey = $Param{ChangeID};
    }
    elsif ( $Param{Data}->{SourceObject} eq 'ITSMWorkOrder' ) {
        $SourceKey = $Param{WorkOrderID};
    }

    if ( !$SourceKey ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need WorkOrderID or ChangeID!',
        );
        return;
    }

    my $Success = $Self->{LinkObject}->LinkAdd(
        %{ $Param{Data} },
        SourceKey => $SourceKey,
        UserID    => $Param{UserID},
    );

    my %Info = (
        Success => $Success,
    );

    return %Info;
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut

=head1 VERSION

$Revision: 1.5 $ $Date: 2010/06/23 08:05:08 $

=cut
