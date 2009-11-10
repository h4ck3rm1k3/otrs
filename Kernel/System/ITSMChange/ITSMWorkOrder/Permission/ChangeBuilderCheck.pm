# --
# Kernel/System/ITSMChange/ITSMWorkOrder/Permission/ChangeBuilderCheck.pm - change builder based permission check
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: ChangeBuilderCheck.pm,v 1.6 2009/11/10 12:47:07 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMWorkOrder::Permission::ChangeBuilderCheck;

use strict;
use warnings;

use Kernel::System::ITSMChange;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

=head1 NAME

Kernel::System::ITSMChange::ITSMWorkOrder::Permission::ChangeBuilderCheck - change builder based permission check

=head1 SYNOPSIS

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::Main;
    use Kernel::System::Time;
    use Kernel::System::DB;
    use Kernel::System::ITSMChange::ITSMWorkOrder;
    use Kernel::System::User;
    use Kernel::System::Group;
    use Kernel::System::ITSMChange::ITSMWorkOrder::Permission::ChangeBuilderCheck;

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
    my $WorkOrderObject = Kernel::System::ITSMChange::ITSMWorkOrder->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        TimeObject   => $TimeObject,
        MainObject   => $MainObject,
    );
    my $UserObject = Kernel::System::User->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
        TimeObject   => $TimeObject,
        DBObject     => $DBObject,
        EncodeObject => $EncodeObject,
    );
    my $GroupObject = Kernel::System::Group->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
    );
    my $CheckObject = Kernel::System::ITSMChange::ITSMWorkOrder::Permission::ChangeBuilderCheck->new(
        ConfigObject         => $ConfigObject,
        EncodeObject         => $EncodeObject,
        LogObject            => $LogObject,
        DBObject             => $DBObject,
        MainObject           => $MainObject,
        TimeObject           => $TimeObject,
        WorkOrderObject      => $WorkOrderObject,
        UserObject           => $UserObject,
        GroupObject          => $GroupObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
    for (
        qw(ConfigObject EncodeObject LogObject DBObject MainObject TimeObject WorkOrderObject UserObject GroupObject)
        )
    {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    # create additional objects
    $Self->{ChangeObject} = Kernel::System::ITSMChange->new( %{$Self} );

    return $Self;
}

=item Run()

This method does the check. 'ro' and 'rw' access is granted
when the agent has the priv in the 'itsm-change-builder' group and
when the agent is the changebuilder of the change.

    my $HasAccess = $CheckObject->Run(
        UserID      => 123,
        Type        => 'rw',     # 'ro' or 'rw'
        WorkOrderID => 4444,     # optional for WorkOrderAdd
    );

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(UserID Type WorkOrderID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $_!",
            );

            return;
        }
    }

    # the check is based upon the change builder
    my $GroupID = $Self->{GroupObject}->GroupLookup( Group => 'itsm-change-builder' );

    # deny access, when the group is not found
    return if !$GroupID;

    # get user groups, where the user has the appropriate privilege
    my %Groups = $Self->{GroupObject}->GroupMemberList(
        UserID => $Param{UserID},
        Type   => $Param{Type},
        Result => 'HASH',
        Cached => 1,
    );

    # deny access if the agent doens't have the appropriate type in the appropriate group
    return if !$Groups{$GroupID};

    # there already is a workorder. e.g. AgentITSMWorkOrderEdit
    my $WorkOrder = $Self->{WorkOrderObject}->WorkOrderGet(
        UserID      => $Param{UserID},
        WorkOrderID => $Param{WorkOrderID},
    );

    # deny access, when no workorder was found
    return if !$WorkOrder || !%{$WorkOrder} || !$WorkOrder->{ChangeID};

    # for checking the change builder, we need information on the change
    my $Change = $Self->{ChangeObject}->ChangeGet(
        UserID   => $Param{UserID},
        ChangeID => $WorkOrder->{ChangeID},
    );

    # deny access, when no change was found
    return if !$Change || !%{$Change} || !$Change->{ChangeBuilderID};

    # allow access, when the agent is the change builder of the change
    return 1 if $Change->{ChangeBuilderID} == $Param{UserID};

    # deny access otherwise
    return;
}

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=head1 VERSION

$Id: ChangeBuilderCheck.pm,v 1.6 2009/11/10 12:47:07 bes Exp $

=cut

1;
