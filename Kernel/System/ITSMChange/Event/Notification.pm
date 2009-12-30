# --
# Kernel/System/ITSMChange/Event/Notification.pm - a event module to send notifications
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: Notification.pm,v 1.3 2009/12/30 11:04:46 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::Event::Notification;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMWorkOrder;
use Kernel::System::ITSMChange::Notification;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

=head1 NAME

Kernel::System::ITSMChange::Event::Notification - ITSM change management notification lib

=head1 SYNOPSIS

Event handler module for notifications for changes and workorders.

=head1 PUBLIC INTERFACE

=over 4

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::DB;
    use Kernel::System::Main;
    use Kernel::System::Time;
    use Kernel::System::ITSMChange::Event::Notification;

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
    my $NotificationEventObject = Kernel::System::ITSMChange::Event::Notification->new(
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

    # get needed objects
    for my $Object (
        qw(DBObject ConfigObject EncodeObject LogObject MainObject TimeObject)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    # create additional objects
    $Self->{ChangeObject}             = Kernel::System::ITSMChange->new( %{$Self} );
    $Self->{WorkOrderObject}          = Kernel::System::ITSMChange::ITSMWorkOrder->new( %{$Self} );
    $Self->{ChangeNotificationObject} = Kernel::System::ITSMChange::Notification->new( %{$Self} );

    return $Self;
}

=item Run()

The C<Run()> method handles the events and sends notifications about
the given change or workorder object.

It returns 1 on success, C<undef> otherwise.

    my $Success = $NotificationEventObject->Run(
        Event => 'ChangeUpdatePost',
        Data => {
            ChangeID    => 123,
            ChangeTitle => 'test',
        },
        Config => {
            Event       => '(ChangeAddPost|ChangeUpdatePost|ChangeCABUpdatePost|ChangeCABDeletePost|ChangeDeletePost)',
            Module      => 'Kernel::System::ITSMChange::Event::NotificationEvent',
            Transaction => '0',
        },
        UserID => 1,
    );

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Data Event Config UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # in notification event handling we use Event name without 'Post'
    my $Event = $Param{Event};
    $Event =~ s{ Post \z }{}xms;

    # TODO: determine list of agents and customers from SysConfig and Change- or WorkOrder-Object
    # TODO: for development, send notification to the logged in user
    my @AgentIDs = ( $Param{UserID} );
    my @CustomerIDs;

    # distinguish between Change and WorkOrder events
    # TODO: this still needs to be worked out. e.g. AttachmentAddPost
    my $Type;
    if ( $Event =~ m{ \A Change }xms ) {
        $Type = 'Change';
    }
    elsif ( $Event =~ m{ \A WorkOrder }xms ) {
        $Type = 'WorkOrder';
    }
    else {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Could not determine the object type for the event '$Event'!"
        );
        return;
    }

    $Self->{ChangeNotificationObject}->NotificationSend(
        AgentIDs    => \@AgentIDs,
        CustomerIDs => \@CustomerIDs,
        Type        => $Type,
        Event       => $Event,
        UserID      => $Param{UserID},
        Data        => $Param{Data},
    );

    return 1;
}

1;

=begin Internal:

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=cut

=head1 VERSION

$Revision: 1.3 $ $Date: 2009/12/30 11:04:46 $

=cut
