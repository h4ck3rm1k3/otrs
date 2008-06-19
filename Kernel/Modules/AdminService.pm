# --
# Kernel/Modules/AdminService.pm - admin frontend to manage services
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: AdminService.pm,v 1.1 2008/06/19 14:46:30 ub Exp $
# $OldId: AdminService.pm,v 1.12 2008/05/08 09:36:36 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Modules::AdminService;

use strict;
use warnings;

use Kernel::System::Service;
use Kernel::System::Valid;
# ---
# ITSM
# ---
use Kernel::System::GeneralCatalog;
# ---

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check all needed objects
    for (qw(ParamObject DBObject LayoutObject ConfigObject LogObject)) {
        if ( !$Self->{$_} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        }
    }
    $Self->{ServiceObject} = Kernel::System::Service->new(%Param);
    $Self->{ValidObject}   = Kernel::System::Valid->new(%Param);
# ---
# ITSM
# ---
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new(%Param);
# ---

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # ------------------------------------------------------------ #
    # service edit
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'ServiceEdit' ) {
        my %ServiceData;

        # get params
        $ServiceData{ServiceID} = $Self->{ParamObject}->GetParam( Param => "ServiceID" );
        if ( $ServiceData{ServiceID} ne 'NEW' ) {
            %ServiceData = $Self->{ServiceObject}->ServiceGet(
                ServiceID => $ServiceData{ServiceID},
                UserID    => $Self->{UserID},
            );
        }

        # output header
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # output overview
        $Self->{LayoutObject}->Block(
            Name => 'Overview',
            Data => { %Param, },
        );

        # generate ParentOptionStrg
        my $TreeView = 0;
        if ( $Self->{ConfigObject}->Get('Ticket::Frontend::ListType') eq 'tree' ) {
            $TreeView = 1;
        }
        my %ServiceList = $Self->{ServiceObject}->ServiceList(
            Valid  => 0,
            UserID => $Self->{UserID},
        );
        $ServiceData{ParentOptionStrg} = $Self->{LayoutObject}->BuildSelection(
            Data           => \%ServiceList,
            Name           => 'ParentID',
            SelectedID     => $ServiceData{ParentID},
            PossibleNone   => 1,
            TreeView       => $TreeView,
            Sort           => 'TreeView',
            DisabledBranch => $ServiceData{Name},
            Translation    => 0,
            Max            => 200,
        );
# ---
# ITSM
# ---
        # generate TypeOptionStrg
        my $TypeList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::Service::Type',
        );
        $ServiceData{TypeOptionStrg} = $Self->{LayoutObject}->BuildSelection(
            Data => $TypeList,
            Name => 'TypeID',
            SelectedID => $ServiceData{TypeID},
        );
        # generate CriticalityOptionStrg
        my $CriticalityList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::Core::Criticality',
        );
        $ServiceData{CriticalityOptionStrg} = $Self->{LayoutObject}->BuildSelection(
            Data => $CriticalityList,
            Name => 'CriticalityID',
            SelectedID => $ServiceData{CriticalityID},
        );
# ---

        # generate ValidOptionStrg
        my %ValidList = $Self->{ValidObject}->ValidList();
        $ServiceData{ValidOptionStrg} = $Self->{LayoutObject}->BuildSelection(
            Data       => \%ValidList,
            Name       => 'ValidID',
            SelectedID => $ServiceData{ValidID} || 1,
        );

        # output service edit
        $Self->{LayoutObject}->Block(
            Name => 'ServiceEdit',
            Data => { %Param, %ServiceData, },
        );

        # generate output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminService',
            Data         => \%Param,
        );
        $Output .= $Self->{LayoutObject}->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # service save
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ServiceSave' ) {
        my %ServiceData;

        # get params
# ---
# ITSM
# ---
#        for (qw(ServiceID ParentID Name ValidID Comment)) {
        for (qw(ServiceID ParentID Name ValidID Comment TypeID CriticalityID)) {
# ---
            $ServiceData{$_} = $Self->{ParamObject}->GetParam( Param => "$_" ) || '';
        }

        # save to database
        if ( $ServiceData{ServiceID} eq 'NEW' ) {
            my $Success
                = $Self->{ServiceObject}->ServiceAdd( %ServiceData, UserID => $Self->{UserID}, );
            if ( !$Success ) {
                return $Self->{LayoutObject}->ErrorScreen();
            }
        }
        else {
            my $Success
                = $Self->{ServiceObject}->ServiceUpdate( %ServiceData, UserID => $Self->{UserID}, );
            if ( !$Success ) {
                return $Self->{LayoutObject}->ErrorScreen();
            }
        }

        # redirect to overview
        return $Self->{LayoutObject}->Redirect( OP => "Action=$Self->{Action}" );
    }

    # ------------------------------------------------------------ #
    # service overview
    # ------------------------------------------------------------ #
    else {

        # output header
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # check if service is enabled to use it here
        if ( !$Self->{ConfigObject}->Get('Ticket::Service') ) {
            $Output .= $Self->{LayoutObject}->Notify(
                Priority => 'Error',
                Data     => '$Text{"You need to activate %s first to use it!", "Service"}',
                Link =>
                    '$Env{"Baselink"}Action=AdminSysConfig&Subaction=Edit&SysConfigGroup=Ticket&SysConfigSubGroup=Core::Ticket#Ticket::Service"',
            );
        }

        # output overview
        $Self->{LayoutObject}->Block(
            Name => 'Overview',
            Data => { %Param, },
        );

        # output overview result
        $Self->{LayoutObject}->Block(
            Name => 'OverviewList',
            Data => { %Param, },
        );

        # get service list
        my %ServiceList = $Self->{ServiceObject}->ServiceList(
            Valid  => 0,
            UserID => $Self->{UserID},
        );

        # get valid list
        my %ValidList = $Self->{ValidObject}->ValidList();

        # add suffix for correct sorting
        for ( keys %ServiceList ) {
            $ServiceList{$_} .= '::';
        }
        my $CssClass;
        for my $ServiceID ( sort { $ServiceList{$a} cmp $ServiceList{$b} } keys %ServiceList ) {

            # set output class
            if ( $CssClass && $CssClass eq 'searchactive' ) {
                $CssClass = 'searchpassive';
            }
            else {
                $CssClass = 'searchactive';
            }

            # get service data
            my %ServiceData = $Self->{ServiceObject}->ServiceGet(
                ServiceID => $ServiceID,
                UserID    => $Self->{UserID},
            );

            # output row
            if ( $Self->{ConfigObject}->Get('Ticket::Frontend::ListType') eq 'tree' ) {
                $Self->{LayoutObject}->Block(
                    Name => 'OverviewListRow',
                    Data => {
                        %ServiceData,
                        Name     => $ServiceData{NameShort},
                        CssClass => $CssClass,
                        Valid    => $ValidList{ $ServiceData{ValidID} },
                    },
                );
                my @Fragment = split( '::', $ServiceData{Name} );
                pop(@Fragment);
                for (@Fragment) {
                    $Self->{LayoutObject}->Block( Name => 'OverviewListRowSpace', );
                }
            }
            else {
                $Self->{LayoutObject}->Block(
                    Name => 'OverviewListRow',
                    Data => {
                        %ServiceData,
                        CssClass => $CssClass,
                        Valid    => $ValidList{ $ServiceData{ValidID} },
                    },
                );
            }
        }

        # generate output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminService',
            Data         => \%Param,
        );
        $Output .= $Self->{LayoutObject}->Footer();

        return $Output;
    }
}

1;
