# --
# Kernel/Output/HTML/NavBarMyWorkOrders.pm
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: NavBarMyWorkOrders.pm,v 1.1 2009/12/01 01:02:21 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::NavBarMyWorkOrders;

use strict;
use warnings;

use Kernel::System::ITSMChange::ITSMWorkOrder;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
    for (qw(ConfigObject LogObject DBObject TicketObject GroupObject LayoutObject UserID)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    # create needed objects
    $Self->{WorkOrderObject} = Kernel::System::ITSMChange::ITSMWorkOrder->new(%Param);

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # define action
    my $Action = 'AgentITSMChangeMyWorkOrders';
    my $Group  = 'itsm-change';
    my $Label  = 'My Workorders';
    my $Image  = 'new-message.png';
    my $Prio   = '0994000';

    # get config of frontend module
    my $Config = $Self->{ConfigObject}->Get("ITSMChange::Frontend::$Action");

    # get the group id
    my $GroupID = $Self->{GroupObject}->GroupLookup( Group => $Group );

    # deny access, when the group is not found
    return if !$GroupID;

    # get user groups, where the user has the appropriate privilege
    my %Groups = $Self->{GroupObject}->GroupMemberList(
        UserID => $Self->{UserID},
        Type   => $Config->{Permission},
        Result => 'HASH',
        Cached => 1,
    );

    # deny access if the agent doesn't have the appropriate type in the appropriate group
    return if !$Groups{$GroupID};

    # do not show icon if frontend module is not registered
    return if !$Self->{ConfigObject}->Get('Frontend::Module')->{$Action};

    # get the number of viewable changes
    my $Count = 0;
    if ( $Config->{'Filter::WorkOrderStates'} && @{ $Config->{'Filter::WorkOrderStates'} } ) {

        # count the number of viewable workorders
        $Count = $Self->{WorkOrderObject}->WorkOrderSearch(
            WorkOrderAgentIDs => [ $Self->{UserID} ],
            WorkOrderStates   => $Config->{'Filter::WorkOrderStates'},
            Limit             => 1000,
            Result            => 'COUNT',
            UserID            => $Self->{UserID},
        );
    }

    # build icon label
    my $Text = $Self->{LayoutObject}->{LanguageObject}->Get($Label) . " ($Count)";

    # build icon data
    my %Icon = (
        $Prio => {
            Block       => 'ItemPersonal',
            Description => $Text,
            Name        => $Text,
            Image       => $Image,
            Link        => 'Action=' . $Action,
            AccessKey   => '',
        },
    );

    return %Icon;
}

1;
