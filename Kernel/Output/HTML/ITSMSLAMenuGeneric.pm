# --
# Kernel/Output/HTML/ITSMSLAMenuGeneric.pm
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: ITSMSLAMenuGeneric.pm,v 1.3 2010/08/19 00:09:31 dz Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMSLAMenuGeneric;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject LogObject DBObject LayoutObject SLAObject UserID)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{SLA} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need SLA!' );
        return;
    }

    # get groups
    my $GroupsRo
        = $Self->{ConfigObject}->Get('Frontend::Module')->{ $Param{Config}->{Action} }->{GroupRo}
        || [];
    my $GroupsRw
        = $Self->{ConfigObject}->Get('Frontend::Module')->{ $Param{Config}->{Action} }->{Group}
        || [];

    # set access
    my $Access = 1;

    # check permission
    if ( $Param{Config}->{Action} && ( @{$GroupsRo} || @{$GroupsRw} ) ) {

        # set access
        $Access = 0;

        # find read only groups
        ROGROUP:
        for my $RoGroup ( @{$GroupsRo} ) {

            next ROGROUP if !$Self->{LayoutObject}->{"UserIsGroupRo[$RoGroup]"};
            next ROGROUP if $Self->{LayoutObject}->{"UserIsGroupRo[$RoGroup]"} ne 'Yes';

            # set access
            $Access = 1;
            last ROGROUP;
        }

        # find read write groups
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
            %{ $Param{SLA} },
            %{ $Param{Config} },
        },
    );
    $Param{Counter}++;

    return $Param{Counter};
}

1;
