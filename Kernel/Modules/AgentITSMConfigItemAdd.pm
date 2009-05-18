# --
# Kernel/Modules/AgentITSMConfigItemAdd.pm - the OTRS::ITSM config item add module
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItemAdd.pm,v 1.3 2009/05/18 09:57:05 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItemAdd;

use strict;
use warnings;

use Kernel::System::GeneralCatalog;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

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
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new(%Param);

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # ------------------------------------------------------------ #
    # redirect
    # ------------------------------------------------------------ #

    if ( $Self->{Subaction} eq 'Redirect' ) {

        # get class id
        my $ClassID = $Self->{ParamObject}->GetParam( Param => 'ClassID' );

        return $Self->{LayoutObject}->Redirect( OP => "Action=$Self->{Action}" ) if !$ClassID;

        return $Self->{LayoutObject}->Redirect(
            OP => "Action=AgentITSMConfigItemEdit&ClassID=$ClassID",
        );
    }

    # ------------------------------------------------------------ #
    # overview
    # ------------------------------------------------------------ #
    else {

        # get class list
        my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );

        # generate ClassOptionStrg
        my $ClassOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            Translation  => 0,
            OnChange     => 'document.configitemclass.submit(); return false;',
        );

        # output header
        my $Output = $Self->{LayoutObject}->Header( Title => 'Add' );
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # output overview
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AgentITSMConfigItemAdd',
            Data         => {
                %Param,
                ClassOptionStrg => $ClassOptionStrg,
            },
        );

        # output footer
        $Output .= $Self->{LayoutObject}->Footer();

        return $Output;
    }
}

1;
