# --
# Kernel/Output/HTML/ITSMConfigItemMenuVersions.pm
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItemMenuVersions.pm,v 1.5 2010/08/18 15:19:23 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMConfigItemMenuVersions;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.5 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (
        qw(ConfigObject EncodeObject LogObject DBObject LayoutObject ConfigItemObject UserID)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ConfigItem} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need ConfigItem!' );
        return;
    }

    $Self->{LayoutObject}->Block( Name => 'Menu' );
    if ( $Param{ShowVersions} ) {
        $Self->{LayoutObject}->Block(
            Name => 'MenuItem',
            Data => {
                %Param,
                %{ $Param{ConfigItem} },
                %{ $Param{Config} },
                Name        => 'Hide Versions',
                Description => 'Hide Versions',
                Link =>
                    'Action=AgentITSMConfigItemZoom;ConfigItemID=$QData{"ConfigItemID"};ShowVersions=0',
            },
        );
    }
    else {
        $Self->{LayoutObject}->Block(
            Name => 'MenuItem',
            Data => {
                %Param,
                %{ $Param{ConfigItem} },
                %{ $Param{Config} },
                Name        => 'Show Versions',
                Description => 'Show Versions',
                Link =>
                    'Action=AgentITSMConfigItemZoom;ConfigItemID=$QData{"ConfigItemID"};ShowVersions=1',
            },
        );
    }
    $Param{Counter}++;

    return $Param{Counter};
}

1;
