# --
# Kernel/Modules/AgentITSMChangeHistory.pm - the OTRS::ITSM::ChangeManagement change history module
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: AgentITSMChangeHistory.pm,v 1.30 2010/01/14 10:22:00 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeHistory;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMWorkOrder;
use Kernel::System::ITSMChange::History;
use Kernel::System::HTMLUtils;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.30 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ParamObject DBObject LayoutObject LogObject UserObject ConfigObject)) {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }

    # create needed objects
    $Self->{ChangeObject}    = Kernel::System::ITSMChange->new(%Param);
    $Self->{WorkOrderObject} = Kernel::System::ITSMChange::ITSMWorkOrder->new(%Param);
    $Self->{HistoryObject}   = Kernel::System::ITSMChange::History->new(%Param);
    $Self->{HTMLUtilsObject} = Kernel::System::HTMLUtils->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMChange::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get needed change id
    my $ChangeID = $Self->{ParamObject}->GetParam( Param => 'ChangeID' );

    # check needed stuff
    if ( !$ChangeID ) {

        # error page
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Can't show history, no ChangeID is given!",
            Comment => 'Please contact the admin.',
        );
    }

    # check permissions
    my $Access = $Self->{ChangeObject}->Permission(
        Type     => $Self->{Config}->{Permission},
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $Self->{LayoutObject}->NoPermission(
            Message    => "You need $Self->{Config}->{Permission} permissions!",
            WithHeader => 'yes',
        );
    }

    # get change information
    my $Change = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # check error
    if ( !$Change ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Change $ChangeID not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # Store LastScreenHistory, for backlinks in HistoryZoom
    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenHistory',
        Value     => $Self->{RequestedURL},
    );

    # get history entries
    my $HistoryEntriesRef = $Self->{HistoryObject}->ChangeHistoryGet(
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    ) || [];

    # get order direction
    my @HistoryLines = @{$HistoryEntriesRef};
    if ( $Self->{ConfigObject}->Get('ITSMChange::Frontend::HistoryOrder') eq 'reverse' ) {
        @HistoryLines = reverse @{$HistoryEntriesRef};
    }

    # max length of strings
    my $MaxLength = 30;

    # create table
    my $Counter = 1;
    for my $HistoryEntry (@HistoryLines) {
        $Counter++;

        # data for a single row, will be passed to the dtl
        my %Data = %{$HistoryEntry};

        # determine what should be shown
        my $HistoryType = $HistoryEntry->{HistoryType};
        if ( $HistoryType =~ m{ Update \z }xms ) {

            # The displayed fieldname might be changed in the following loop
            my $DisplayedFieldname = $HistoryEntry->{Fieldname};

            # set default values for some keys
            for my $ContentNewOrOld (qw(ContentNew ContentOld)) {
                if ( !defined $HistoryEntry->{$ContentNewOrOld} ) {
                    $HistoryEntry->{$ContentNewOrOld} = '-';
                }
                else {

                    # for the ID fields, we replace ID with its textual value
                    if (
                        my ($Type) = $HistoryEntry->{Fieldname} =~ m{ \A # string start
                            ( # start capture of $Type
                                Category | Impact | Priority
                                | ChangeState
                                | WorkOrderState | WorkOrderType
                                | WorkOrderAgent | ChangeBuilder | ChangeManager
                            ) # end capture of $Type
                            ID
                            }xms
                        )
                    {
                        my $Value;
                        if ( $Type eq 'WorkOrderState' ) {
                            $Value = $Self->{WorkOrderObject}->WorkOrderStateLookup(
                                WorkOrderStateID => $HistoryEntry->{$ContentNewOrOld},
                            );
                        }
                        elsif ( $Type eq 'WorkOrderType' ) {
                            $Value = $Self->{WorkOrderObject}->WorkOrderTypeLookup(
                                WorkOrderTypeID => $HistoryEntry->{$ContentNewOrOld},
                            );
                        }
                        elsif ( $Type eq 'ChangeState' ) {
                            $Value = $Self->{ChangeObject}->ChangeStateLookup(
                                ChangeStateID => $HistoryEntry->{$ContentNewOrOld},
                            );
                        }
                        elsif (
                            $Type    eq 'WorkOrderAgent'
                            || $Type eq 'ChangeBuilder'
                            || $Type eq 'ChangeManager'
                            )
                        {
                            $Value = $Self->{UserObject}->UserLookup(
                                UserID => $HistoryEntry->{$ContentNewOrOld},
                            );
                        }
                        elsif ( $Type eq 'Category' || $Type eq 'Impact' || $Type eq 'Priority' ) {
                            $Value = $Self->{ChangeObject}->ChangeCIPLookup(
                                ID   => $HistoryEntry->{$ContentNewOrOld},
                                Type => $Type,
                            );
                        }
                        else {
                            return $Self->{LayoutObject}->ErrorScreen(
                                Message => "Unknown type '$Type' encountered!",
                                Comment => 'Please contact the admin.',
                            );
                        }

                        my $TranslatedValue = $Self->{LayoutObject}->{LanguageObject}->Get(
                            $Value,
                        );
                        $HistoryEntry->{$ContentNewOrOld} = $TranslatedValue . ' (ID='
                            . $HistoryEntry->{$ContentNewOrOld} . ')';

                        # The content has changed, so change the displayed fieldname as well
                        $DisplayedFieldname = $Type;
                    }

                    # replace HTML breaks with single space
                    $HistoryEntry->{$ContentNewOrOld} =~ s{ < br \s*? /? > }{ }xmsg;
                }
            }

            # tranlate fieldname for display
            $DisplayedFieldname = $Self->{LayoutObject}->{LanguageObject}->Get(
                $DisplayedFieldname,
            );

            # trim strings to a max length of $MaxLength
            my $ContentNew = $Self->{HTMLUtilsObject}->ToAscii(
                String => $HistoryEntry->{ContentNew} || '-',
            );
            my $ContentOld = $Self->{HTMLUtilsObject}->ToAscii(
                String => $HistoryEntry->{ContentOld} || '-',
            );

            # show [...] for too long strings
            for my $Content ( $ContentNew, $ContentOld ) {
                if ( $Content && ( length $Content > $MaxLength ) ) {
                    $Content = substr( $Content, 0, $MaxLength ) . '[...]';
                }
            }

            # set description
            $Data{Content} = join '%%', $DisplayedFieldname,
                $ContentNew,
                $ContentOld;
        }
        else {
            $Data{Content} = $HistoryEntry->{ContentNew};
        }

        # replace text
        if ( $Data{Content} ) {

            # remove leading %%
            $Data{Content} =~ s{ \A %% }{}xmsg;

            # split the content by %%
            my @Values = split( /%%/, $Data{Content} );

            $Data{Content} = '';

            # clean the values
            for my $Value (@Values) {
                if ( $Data{Content} ) {
                    $Data{Content} .= "\", ";
                }

                $Data{Content} .= "\"$Value";
            }

            # we need at least a double quote
            if ( !$Data{Content} ) {
                $Data{Content} = '" ';
            }

            # for what item type is this history entry
            my $HistoryItemType = 'Change';
            if ( $HistoryType =~ m{ \A WorkOrder }xms ) {
                $HistoryItemType = 'WorkOrder';
            }

            # for workorder entries that still exists, show workorderid
            my $HistoryEntryType = $Data{HistoryType};
            if ( $HistoryEntry->{WorkOrderID} ) {
                $HistoryEntryType .= 'WithWorkorderID';
                $Data{Content} = '"' . $HistoryEntry->{WorkOrderID} . '", ' . $Data{Content};
            }

            # show 'nice' output
            $Data{Content} = $Self->{LayoutObject}->{LanguageObject}->Get(
                $HistoryItemType . 'History::' . $HistoryEntryType . '", ' . $Data{Content},
            );

            # remove not needed place holder
            $Data{Content} =~ s{ % s }{}xmsg;
        }

        # separate each searchresult line by using several css
        $Data{css} = $Counter % 2 ? 'searchpassive' : 'searchactive';

        $Self->{LayoutObject}->Block(
            Name => 'Row',
            Data => {%Data},
        );

        # show a 'more info' link
        if (
            ( $HistoryEntry->{ContentNew} && length( $HistoryEntry->{ContentNew} ) > $MaxLength )
            || ( $HistoryEntry->{ContentOld} && length( $HistoryEntry->{ContentOld} ) > $MaxLength )
            )
        {

            # is it a ChangeHistoryZoom or a WorkOrderHistoryZoom?
            my $ZoomType = 'Change';

            if ( $HistoryType =~ m{ \A WorkOrder }xms && $HistoryEntry->{WorkOrderID} ) {
                $ZoomType = 'WorkOrder';
            }

            # show historyzoom block
            $Self->{LayoutObject}->Block(
                Name => 'HistoryZoom',
                Data => {
                    %Data,
                    ZoomType => $ZoomType,
                },
            );
        }

        # don't show a link
        else {
            $Self->{LayoutObject}->Block(
                Name => 'HistoryZoomDash',
            );
        }

        # show link to workorder for WorkOrderAdd event - if the workorder still exists
        if ( $HistoryEntry->{HistoryType} =~ m{ \A WorkOrder }xms && $HistoryEntry->{WorkOrderID} )
        {
            my $WorkOrder = $Self->{WorkOrderObject}->WorkOrderGet(
                WorkOrderID => $HistoryEntry->{WorkOrderID},
                UserID      => $Self->{UserID},
                LogNo       => 1,
            );

            # show link
            if ($WorkOrder) {
                $Self->{LayoutObject}->Block(
                    Name => 'WorkOrderZoom',
                    Data => {%Data},
                );
            }
        }

        # don't show any link
        else {
            $Self->{LayoutObject}->Block(
                Name => 'Dash',
            );
        }
    }

    # output header
    my $Output = $Self->{LayoutObject}->Header(
        Title => 'ChangeHistory',
    );
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # start template output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMChangeHistory',
        Data         => {
            %Param,
            %{$Change},
        },
    );

    # add footer
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
