# --
# Kernel/Output/HTML/FAQMenuGeneric.pm
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: FAQMenuGeneric.pm,v 1.1 2010/11/05 04:40:56 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::FAQMenuGeneric;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (
        qw(ConfigObject EncodeObject LogObject DBObject LayoutObject FAQObject UserID)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{FAQItem} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need FAQItem!',
        );
        return;
    }

    # grant access by default
    my $Access = 1;

    # get groups
    my $Action = $Param{Config}->{Action};
    if ( $Action eq 'AgentLinkObject' ) {

        # The Link-link is a special case, as it is not specific to FAQ.
        # As a workaround we hardcode that AgentLinkObject is treated like AgentFAQEdit
        $Action = 'AgentFAQEdit';
    }
    my $GroupsRo = $Self->{ConfigObject}->Get('Frontend::Module')->{$Action}->{GroupRo} || [];
    my $GroupsRw = $Self->{ConfigObject}->Get('Frontend::Module')->{$Action}->{Group}   || [];

    # check permission
    if ( $Action && ( @{$GroupsRo} || @{$GroupsRw} ) ) {

        # deny access by default, when there are groups to check
        $Access = 0;

        # check read only groups
        ROGROUP:
        for my $RoGroup ( @{$GroupsRo} ) {

            next ROGROUP if !$Self->{LayoutObject}->{"UserIsGroupRo[$RoGroup]"};
            next ROGROUP if $Self->{LayoutObject}->{"UserIsGroupRo[$RoGroup]"} ne 'Yes';

            # set access
            $Access = 1;
            last ROGROUP;
        }

        # check read write groups
        RWGROUP:
        for my $RwGroup ( @{$GroupsRw} ) {

            next RWGROUP if !$Self->{LayoutObject}->{"UserIsGroup[$RwGroup]"};
            next RWGROUP if $Self->{LayoutObject}->{"UserIsGroup[$RwGroup]"} ne 'Yes';

            # set access
            $Access = 1;
            last RWGROUP;
        }
    }

    return $Param{Counter} if !$Access;

    # output menu item
    $Self->{LayoutObject}->Block(
        Name => 'MenuItem',
        Data => {
            %Param,
            %{ $Param{FAQItem} },
            %{ $Param{Config} },
        },
    );
    $Param{Counter}++;
}

1;