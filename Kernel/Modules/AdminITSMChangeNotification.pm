# --
# Kernel/Modules/AdminITSMChangeNotification.pm - to add/update/delete
# notification rules for ITSM change management
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: AdminITSMChangeNotification.pm,v 1.2 2009/12/31 08:45:45 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminITSMChangeNotification;

use strict;
use warnings;

use Kernel::System::ITSMChange::History;
use Kernel::System::ITSMChange::Notification;
use Kernel::System::Valid;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check all needed objects
    for my $NeededObject (qw(ParamObject DBObject LayoutObject ConfigObject LogObject)) {
        if ( !$Self->{$NeededObject} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $NeededObject!" );
        }
    }

    # create needed objects
    $Self->{HistoryObject}      = Kernel::System::ITSMChange::History->new(%Param);
    $Self->{NotificationObject} = Kernel::System::ITSMChange::Notification->new(%Param);
    $Self->{ValidObject}        = Kernel::System::Valid->new(%Param);

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my %Notification;

    # ------------------------------------------------------------ #
    # change
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'Change' ) {
        my $ID = $Self->{ParamObject}->GetParam( Param => 'ID' ) || '';
        my $Data = $Self->{NotificationObject}->NotificationRuleGet( ID => $ID, );

        $Self->_Edit(
            Action => 'Change',
            %{$Data},
        );
    }

    # ------------------------------------------------------------ #
    # change action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ChangeAction' ) {

        # challenge token check for write action
        $Self->{LayoutObject}->ChallengeTokenCheck();

        my $Note = '';
        my %GetParam;
        for my $Param (qw(ID Name TypeID Comment ValidID)) {
            $GetParam{$Param} = $Self->{ParamObject}->GetParam( Param => $Param ) || '';
        }

        # update group
        if (
            $Self->{NotificationObject}
            ->NotificationRuleUpdate( %GetParam, UserID => $Self->{UserID} )
            )
        {
            $Self->_Overview();

            # notification was updated
            %Notification = ( Priority => 'Notification updated!' );
        }
        else {

            # an error occured -> show notification
            %Notification = ( Priority => 'Error' );

            $Self->_Edit(
                Action => "Change",
                %GetParam,
            );
        }
    }

    # ------------------------------------------------------------ #
    # add
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Add' ) {
        my %GetParam = ();
        for my $Param (qw(Name)) {
            $GetParam{$Param} = $Self->{ParamObject}->GetParam( Param => $Param );
        }

        $Self->_Edit(
            Action => "Add",
            %GetParam,
        );
    }

    # ------------------------------------------------------------ #
    # add action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AddAction' ) {

        # challenge token check for write action
        $Self->{LayoutObject}->ChallengeTokenCheck();

        my $Note = '';
        my %GetParam;
        for my $Param (qw(ID TypeID Name Comment ValidID)) {
            $GetParam{$Param} = $Self->{ParamObject}->GetParam( Param => $Param ) || '';
        }

        # add notification rule
        if (
            my $StateID = $Self->{NotificationObject}->NotificationRuleAdd(
                %GetParam,
                UserID => $Self->{UserID},
            )
            )
        {
            $Self->_Overview();

            # notification was added
            %Notification = ( Info => 'Notification added!' );
        }
        else {

            # an error occured -> show notification
            %Notification = ( Priority => 'Error' );

            $Self->_Edit(
                Action => "Add",
                %GetParam,
            );
        }
    }

    # ------------------------------------------------------------
    # overview
    # ------------------------------------------------------------
    else {
        $Self->_Overview();
    }

    my $Output = $Self->{LayoutObject}->Header();
    $Output .= $Self->{LayoutObject}->NavigationBar();

    if (%Notification) {
        $Output .= $Self->{LayoutObject}->Notify(%Notification);
    }
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AdminITSMChangeNotification',
        Data         => \%Param,
    );
    $Output .= $Self->{LayoutObject}->Footer();

}

sub _Edit {
    my ( $Self, %Param ) = @_;

    $Self->{LayoutObject}->Block(
        Name => 'Overview',
        Data => \%Param,
    );
    $Param{'ValidOption'} = $Self->{LayoutObject}->BuildSelection(
        Data       => { $Self->{ValidObject}->ValidList(), },
        Name       => 'ValidID',
        SelectedID => $Param{ValidID},
    );
    $Param{EventOption} = $Self->{LayoutObject}->BuildSelection(
        Data => $Self->{HistoryObject}->HistoryTypeList( UserID => 1 ) || [],
        Name => 'EventID',
        SelectedID => $Param{EventID},
    );
    $Param{RecipientOption} = $Self->{LayoutObject}->BuildSelection(
        Data => $Self->{NotificationObject}->RecipientList( UserID => 1 ) || [],
        Name => 'RecipientIDs',
        Multiple    => 1,
        Size        => 5,
        SelectedIDs => [ $Param{RecipientIDs} ],
    );
    $Self->{LayoutObject}->Block(
        Name => 'OverviewUpdate',
        Data => \%Param,
    );
    return 1;
}

sub _Overview {
    my ( $Self, %Param ) = @_;

    my $Output = '';

    $Self->{LayoutObject}->Block(
        Name => 'Overview',
        Data => \%Param,
    );
    $Self->{LayoutObject}->Block(
        Name => 'OverviewResult',
        Data => \%Param,
    );
    my $List = $Self->{NotificationObject}->NotificationRuleList();

    # get valid list
    my %ValidList = $Self->{ValidObject}->ValidList();
    my $CssClass  = '';
    for my $RuleID ( sort @{$List} ) {

        # set output class
        if ( $CssClass && $CssClass eq 'searchactive' ) {
            $CssClass = 'searchpassive';
        }
        else {
            $CssClass = 'searchactive';
        }

        my $Data = $Self->{NotificationObject}->NotificationRuleGet( ID => $RuleID, );
        my $Recipients = join ', ', @{ $Data->{Recipients} || [] };

        $Self->{LayoutObject}->Block(
            Name => 'OverviewResultRow',
            Data => {
                Valid    => $ValidList{ $Data->{ValidID} },
                CssClass => $CssClass,
                %{$Data},
                Recipients => $Recipients,
            },
        );
    }
    return 1;
}

1;
