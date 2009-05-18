# --
# Kernel/Modules/AgentITSMServiceZoom.pm - the OTRS::ITSM Service zoom module
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMServiceZoom.pm,v 1.5 2009/05/18 09:48:35 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMServiceZoom;

use strict;
use warnings;

use Kernel::System::LinkObject;
use Kernel::System::Service;
use Kernel::System::SLA;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.5 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject ParamObject DBObject LayoutObject LogObject)) {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }
    $Self->{LinkObject}    = Kernel::System::LinkObject->new(%Param);
    $Self->{ServiceObject} = Kernel::System::Service->new(%Param);
    $Self->{SLAObject}     = Kernel::System::SLA->new(%Param);

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get params
    my $ServiceID = $Self->{ParamObject}->GetParam( Param => 'ServiceID' );

    # check needed stuff
    if ( !$ServiceID ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'No ServiceID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # get service
    my %Service = $Self->{ServiceObject}->ServiceGet(
        ServiceID => $ServiceID,
        UserID    => $Self->{UserID},
    );
    if ( !$Service{ServiceID} ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "ServiceID $ServiceID not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # run config item menu modules
    if ( ref $Self->{ConfigObject}->Get('ITSMService::Frontend::MenuModule') eq 'HASH' ) {
        my %Menus   = %{ $Self->{ConfigObject}->Get('ITSMService::Frontend::MenuModule') };
        my $Counter = 0;
        for my $Menu ( sort keys %Menus ) {

            # load module
            if ( $Self->{MainObject}->Require( $Menus{$Menu}->{Module} ) ) {
                my $Object = $Menus{$Menu}->{Module}->new(
                    %{$Self},
                    ServiceID => $Self->{ServiceID},
                );

                # run module
                $Counter = $Object->Run(
                    %Param,
                    Service => \%Service,
                    Counter => $Counter,
                    Config  => $Menus{$Menu},
                );
            }
            else {
                return $Self->{LayoutObject}->FatalError();
            }
        }
    }

    my $OutputHorizontalRuler = 0;

    # get sla list
    my %SLAList = $Self->{SLAObject}->SLAList(
        ServiceID => $ServiceID,
        UserID    => $Self->{UserID},
    );
    if (%SLAList) {
        $OutputHorizontalRuler = 1;

        # output row
        $Self->{LayoutObject}->Block(
            Name => 'SLA',
        );

        my $CssClass = '';
        for my $SLAID ( sort { $SLAList{$a} cmp $SLAList{$b} } keys %SLAList ) {

            # set output object
            $CssClass = $CssClass eq 'searchpassive' ? 'searchactive' : 'searchpassive';

            # get service data
            my %SLA = $Self->{SLAObject}->SLAGet(
                SLAID  => $SLAID,
                UserID => $Self->{UserID},
            );

            # output row
            $Self->{LayoutObject}->Block(
                Name => 'SLARow',
                Data => {
                    %SLA,
                    CssClass => $CssClass,
                },
            );
        }
    }

    # get linked objects
    my $LinkListWithData = $Self->{LinkObject}->LinkListWithData(
        Object => 'Service',
        Key    => $ServiceID,
        State  => 'Valid',
        UserID => $Self->{UserID},
    );

    # get link table view mode
    my $LinkTableViewMode = $Self->{ConfigObject}->Get('LinkObject::ViewMode');

    # create the link table
    my $LinkTableStrg = $Self->{LayoutObject}->LinkObjectTableCreate(
        LinkListWithData => $LinkListWithData,
        ViewMode         => $LinkTableViewMode,
    );

    # output the link table
    if ($LinkTableStrg) {
        $Self->{LayoutObject}->Block(
            Name => 'LinkTable' . $LinkTableViewMode,
            Data => {
                LinkTableStrg => $LinkTableStrg,
            },
        );

        $OutputHorizontalRuler = 1;
    }

    # output horizontal ruler
    if ($OutputHorizontalRuler) {
        $Self->{LayoutObject}->Block(
            Name => 'HorizontalRuler',
        );
    }

    # set incident signal
    my %InciSignals = (
        operational => 'greenled',
        warning     => 'yellowled',
        incident    => 'redled',
    );

    # get create user data
    my %CreateUser = $Self->{UserObject}->GetUserData(
        UserID => $Service{CreateBy},
        Cached => 1,
    );
    for my $Postfix (qw(UserLogin UserFirstname UserLastname)) {
        $Service{ 'Create' . $Postfix } = $CreateUser{$Postfix};
    }

    # get change user data
    my %ChangeUser = $Self->{UserObject}->GetUserData(
        UserID => $Service{ChangeBy},
        Cached => 1,
    );
    for my $Postfix (qw(UserLogin UserFirstname UserLastname)) {
        $Service{ 'Change' . $Postfix } = $ChangeUser{$Postfix};
    }

    # output header
    my $Output = $Self->{LayoutObject}->Header();
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # generate output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMServiceZoom',
        Data         => {
            %Param,
            %Service,
            CurInciSignal => $InciSignals{ $Service{CurInciStateType} },
        },
    );
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
