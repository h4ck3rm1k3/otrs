# --
# Kernel/Modules/AgentITSMService.pm - the OTRS::ITSM Service module
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMService.pm,v 1.1 2008/07/02 15:26:56 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Modules::AgentITSMService;

use strict;
use warnings;

use Kernel::System::GeneralCatalog;
use Kernel::System::Service;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

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
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new(%Param);
    $Self->{ServiceObject}        = Kernel::System::Service->new(%Param);

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # output overview
    $Self->{LayoutObject}->Block(
        Name => 'Overview',
        Data => {%Param},
    );

    # get type list
    my $TypeList = $Self->{GeneralCatalogObject}->ItemList( Class => 'ITSM::Service::Type' );

    # get criticality list
    my $CriticalityList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::Core::Criticality',
    );

    # get service list
    my %ServiceList = $Self->{ServiceObject}->ServiceList(
        UserID => $Self->{UserID},
    );

    # add suffix for correct sorting
    for my $Service ( values %ServiceList ) {
        $Service .= '::';
    }

    # set incident signal
    my %InciSignals = (
        operational => 'greenled',
        warning     => 'yellowled',
        incident    => 'redled',
    );

    my $CssClass = '';
    for my $ServiceID ( sort { $ServiceList{$a} cmp $ServiceList{$b} } keys %ServiceList ) {

        # set output object
        $CssClass = $CssClass eq 'searchpassive' ? 'searchactive' : 'searchpassive';

        # get service data
        my %Service = $Self->{ServiceObject}->ServiceGet(
            ServiceID => $ServiceID,
            UserID    => $Self->{UserID},
        );

        # output row
        if ( $Self->{ConfigObject}->Get('Ticket::Frontend::ListType') eq 'tree' ) {

            # output overview row
            $Self->{LayoutObject}->Block(
                Name => 'OverviewRow',
                Data => {
                    %Service,
                    Name          => $Service{NameShort},
                    Type          => $TypeList->{ $Service{TypeID} },
                    Criticality   => $CriticalityList->{ $Service{CriticalityID} },
                    CurInciSignal => $InciSignals{ $Service{CurInciStateType} },
                    CssClass      => $CssClass,
                },
            );

            my @Fragment = split '::', $Service{Name};
            pop @Fragment;

            for (@Fragment) {

                # output overview row space
                $Self->{LayoutObject}->Block(
                    Name => 'OverviewRowSpace',
                );
            }
        }
        else {

            # output overview row
            $Self->{LayoutObject}->Block(
                Name => 'OverviewRow',
                Data => {
                    %Service,
                    Name          => $Service{NameShort},
                    Type          => $TypeList->{ $Service{TypeID} },
                    Criticality   => $CriticalityList->{ $Service{CriticalityID} },
                    CurInciSignal => $InciSignals{ $Service{CurInciStateType} },
                    CssClass      => $CssClass,
                },
            );
        }
    }

    # set last screen view
    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'ITSMServiceLastScreenOverview',
        Value     => "Action=$Self->{Action}",
    );

    # output header
    my $Output = $Self->{LayoutObject}->Header();
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # generate output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMService',
        Data         => \%Param,
    );
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
