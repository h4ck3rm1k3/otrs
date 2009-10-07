# --
# Kernel/Modules/AgentITSMConfigItemEdit.pm - the OTRS::ITSM config item edit module
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItemEdit.pm,v 1.5 2009/10/07 14:25:22 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItemEdit;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;
use Kernel::System::GeneralCatalog;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.5 $) [1];

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
    $Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new(%Param);
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ConfigItem::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get configitem id and class id
    my $ConfigItem = {};
    $ConfigItem->{ConfigItemID} = $Self->{ParamObject}->GetParam( Param => 'ConfigItemID' ) || 0;
    $ConfigItem->{ClassID}      = $Self->{ParamObject}->GetParam( Param => 'ClassID' )      || 0;
    my $DuplicateID = $Self->{ParamObject}->GetParam( Param => 'DuplicateID' ) || 0;

    my $HasAccess;

    # get needed data
    if ( $ConfigItem->{ConfigItemID} && $ConfigItem->{ConfigItemID} ne 'NEW' ) {

        # check access for config item
        $HasAccess = $Self->{ConfigItemObject}->Permission(
            Scope  => 'Item',
            ItemID => $ConfigItem->{ConfigItemID},
            UserID => $Self->{UserID},
            Type   => $Self->{Config}->{Permission},
        );

        # get config item
        $ConfigItem = $Self->{ConfigItemObject}->ConfigItemGet(
            ConfigItemID => $ConfigItem->{ConfigItemID},
        );
    }
    elsif ($DuplicateID) {

        # get config item to duplicate
        $ConfigItem = $Self->{ConfigItemObject}->ConfigItemGet(
            ConfigItemID => $DuplicateID,
        );

        # check access for config item
        $HasAccess = $Self->{ConfigItemObject}->Permission(
            Scope  => 'Item',
            ItemID => $ConfigItem->{ConfigItemID},
            UserID => $Self->{UserID},
            Type   => $Self->{Config}->{Permission},
        );

        # set config item id and number
        $ConfigItem->{ConfigItemID} = 'NEW';
        $ConfigItem->{Number}       = 'NEW';
    }
    elsif ( $ConfigItem->{ClassID} ) {

        # set config item id and number
        $ConfigItem->{ConfigItemID} = 'NEW';
        $ConfigItem->{Number}       = 'NEW';

        # check access for config item
        $HasAccess = $Self->{ConfigItemObject}->Permission(
            Scope   => 'Class',
            ClassID => $ConfigItem->{ClassID},
            UserID  => $Self->{UserID},
            Type    => $Self->{Config}->{Permission},
        );

        # get class list
        my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );
        $ConfigItem->{Class} = $ClassList->{ $ConfigItem->{ClassID} };
    }
    else {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'No ConfigItemID, DuplicateID or ClassID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # if user has no access rights show error page
    if ( !$HasAccess ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'No access is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # get definition
    my $XMLDefinition = $Self->{ConfigItemObject}->DefinitionGet(
        ClassID => $ConfigItem->{ClassID},
    );

    # abort, if no definition is defined
    if ( !$XMLDefinition->{DefinitionID} ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "No Definition was definied for class $ConfigItem->{Class}!",
            Comment => 'Please contact the admin.',
        );
    }

    # get submit save
    my $SubmitSave = $Self->{ParamObject}->GetParam( Param => 'SubmitSave' );

    # get xml data
    my $Version = {};
    if ( $Self->{Subaction} eq 'VersionSave' ) {
        my $AllRequired = 1;

        # get general form data
        for my $FormParam (qw(Name DeplStateID InciStateID)) {
            $Version->{$FormParam} = $Self->{ParamObject}->GetParam( Param => $FormParam );
            if ( !$Version->{$FormParam} ) {
                $AllRequired = 0;
            }
        }

        # get xml form data
        $Version->{XMLData}->[1]->{Version}->[1] = $Self->_XMLFormGet(
            XMLDefinition => $XMLDefinition->{DefinitionRef},
            AllRequired   => \$AllRequired,
            ConfigItemID  => $ConfigItem->{ConfigItemID},
        );

        # save version to database
        if ( $SubmitSave && $AllRequired ) {
            if ( $ConfigItem->{ConfigItemID} eq 'NEW' ) {
                $ConfigItem->{ConfigItemID} = $Self->{ConfigItemObject}->ConfigItemAdd(
                    ClassID => $ConfigItem->{ClassID},
                    UserID  => $Self->{UserID},
                );
            }

            # add version
            $Self->{ConfigItemObject}->VersionAdd(
                %{$Version},
                ConfigItemID => $ConfigItem->{ConfigItemID},
                DefinitionID => $XMLDefinition->{DefinitionID},
                UserID       => $Self->{UserID},
            );

            # redirect to zoom mask
            return $Self->{LayoutObject}->Redirect(
                OP => "Action=AgentITSMConfigItemZoom&ConfigItemID=$ConfigItem->{ConfigItemID}",
            );
        }
    }
    elsif ($DuplicateID) {
        my $VersionID = $Self->{ParamObject}->GetParam( Param => "VersionID" );
        if ($VersionID) {

            # get version data to duplicate config item
            $Version = $Self->{ConfigItemObject}->VersionGet(
                VersionID => $VersionID,
            );
        }
        else {

            # get last version data to duplicate config item
            $Version = $Self->{ConfigItemObject}->VersionGet(
                ConfigItemID => $DuplicateID,
            );
        }
    }
    elsif ( $ConfigItem->{ConfigItemID} ne 'NEW' ) {

        # get last version data
        $Version = $Self->{ConfigItemObject}->VersionGet(
            ConfigItemID => $ConfigItem->{ConfigItemID},
        );
    }

    my %XMLFormOutputParam;
    if ( $Version->{XMLData}->[1]->{Version}->[1] ) {
        $XMLFormOutputParam{XMLData} = $Version->{XMLData}->[1]->{Version}->[1];
    }

    # output name block
    $Self->{LayoutObject}->Block(
        Name => 'RowName',
        Data => {
            %{$Version},
        },
    );

    # output name invalid block
    if ( !$Version->{Name} && $Self->{Subaction} eq 'VersionSave' ) {
        $Self->{LayoutObject}->Block( Name => 'RowNameInvalid' );
    }

    # get deployment state list
    my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    # generate DeplStateOptionStrg
    my $DeplStateOptionStrg = $Self->{LayoutObject}->BuildSelection(
        Data         => $DeplStateList,
        Name         => 'DeplStateID',
        PossibleNone => 1,
        SelectedID   => $Version->{DeplStateID},
    );

    # output deployment state block
    $Self->{LayoutObject}->Block(
        Name => 'RowDeplState',
        Data => {
            DeplStateOptionStrg => $DeplStateOptionStrg,
        },
    );

    # output deployment state invalid block
    if ( !$Version->{DeplStateID} && $Self->{Subaction} eq 'VersionSave' ) {
        $Self->{LayoutObject}->Block(
            Name => 'RowDeplStateInvalid',
        );
    }

    # get incident state list
    my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class       => 'ITSM::Core::IncidentState',
        Preferences => {
            Functionality => [ 'operational', 'incident' ],
        },
    );

    # generate InciStateOptionStrg
    my $InciStateOptionStrg = $Self->{LayoutObject}->BuildSelection(
        Data         => $InciStateList,
        Name         => 'InciStateID',
        PossibleNone => 1,
        SelectedID   => $Version->{InciStateID},
    );

    # output incident state block
    $Self->{LayoutObject}->Block(
        Name => 'RowInciState',
        Data => {
            InciStateOptionStrg => $InciStateOptionStrg,
        },
    );

    # output deployment state invalid block
    if ( !$Version->{InciStateID} && $Self->{Subaction} eq 'VersionSave' ) {
        $Self->{LayoutObject}->Block( Name => 'RowInciStateInvalid' );
    }

    # output xml form
    if ( $XMLDefinition->{Definition} ) {
        $Self->_XMLFormOutput(
            XMLDefinition => $XMLDefinition->{DefinitionRef},
            %XMLFormOutputParam,
        );
    }

    # output header
    my $Output = $Self->{LayoutObject}->Header( Title => 'Edit' );
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # start template output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMConfigItemEdit',
        Data         => {
            %Param,
            %{$ConfigItem},
        },
    );
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

sub _XMLFormGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{AllRequired};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{AllRequired} ne 'SCALAR';
    return if !$Param{ConfigItemID};

    my $FormData = {};

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {
        my $CounterInsert = 1;

        COUNTER:
        for my $Counter ( 1 .. $Item->{CountMax} ) {

            # create inputkey and addkey
            my $InputKey = $Item->{Key} . '::' . $Counter;
            my $AddKey   = $Item->{Key} . '::Add';
            if ( $Param{Prefix} ) {
                $InputKey = $Param{Prefix} . '::' . $InputKey;
                $AddKey   = $Param{Prefix} . '::' . $AddKey;
            }

            # get param
            my $FormValues = $Self->{LayoutObject}->ITSMConfigItemFormDataGet(
                Key          => $InputKey,
                Item         => $Item,
                ConfigItemID => $Param{ConfigItemID},
            );

            if ( defined $FormValues->{Value} ) {

                # check required value
                if ( $FormValues->{Invalid} ) {
                    ${ $Param{AllRequired} } = 0;
                }

                # check delete button
                next COUNTER if $Self->{ParamObject}->GetParam( Param => $InputKey . '::Delete' );

                # start recursion, if "Sub" was found
                if ( $Item->{Sub} ) {
                    my $SubFormData = $Self->_XMLFormGet(
                        XMLDefinition => $Item->{Sub},
                        Prefix        => $InputKey,
                        AllRequired   => $Param{AllRequired},
                    );
                    $FormData->{ $Item->{Key} }->[$CounterInsert] = $SubFormData;
                }
                $FormData->{ $Item->{Key} }->[$CounterInsert]->{Content} = $FormValues->{Value};
                $CounterInsert++;
            }
            else {

                # check add button
                if ( $Self->{ParamObject}->GetParam( Param => $AddKey ) ) {
                    if ( $Item->{Sub} ) {
                        $FormData->{ $Item->{Key} }->[$CounterInsert] = $Self->_XMLDefaultSet(
                            XMLDefinition => $Item->{Sub},
                        );
                    }
                    $FormData->{ $Item->{Key} }->[$CounterInsert]->{Content} = '';
                }
                last COUNTER;
            }
        }
    }

    return $FormData;
}

sub _XMLDefaultSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLDefinition} ne 'ARRAY';

    my $DefaultData = {};

    for my $Item ( @{ $Param{XMLDefinition} } ) {
        for my $Counter ( 1 .. $Item->{CountDefault} ) {

            # start recursion, if "Sub" was found
            if ( $Item->{Sub} ) {
                $DefaultData->{ $Item->{Key} }->[$Counter] = $Self->_XMLDefaultSet(
                    XMLDefinition => $Item->{Sub}
                );
            }

            $DefaultData->{ $Item->{Key} }->[$Counter]->{Content} = '';
        }
    }

    return $DefaultData;
}

sub _XMLFormOutput {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLDefinition} ne 'ARRAY';

    $Param{Level} ||= 0;

    # set data present mode
    my $DataPresentMode = 0;
    if ( $Param{XMLData} && ref $Param{XMLData} eq 'HASH' ) {
        $DataPresentMode = 1;
    }

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # output row block
        $Self->{LayoutObject}->Block( Name => 'XMLRow' );

        # set loop
        my $Loop = $Item->{CountDefault};
        if ($DataPresentMode) {
            $Loop = 0;

            # search the last content
            COUNTER:
            for my $Counter ( 1 .. $Item->{CountMax} ) {
                last COUNTER if !defined $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content};
                $Loop = $Counter;
            }

            # set absolut minimum
            if ( $Loop < $Item->{CountMin} ) {
                $Loop = $Item->{CountMin};
            }
        }

        # set delete
        my $Delete = 0;
        if ( $Loop > $Item->{CountMin} ) {
            $Delete = 1;
        }

        # output content rows
        for my $Counter ( 1 .. $Loop ) {

            # create inputkey and addkey
            my $InputKey = $Item->{Key} . '::' . $Counter;
            if ( $Param{Prefix} ) {
                $InputKey = $Param{Prefix} . '::' . $InputKey;
            }

            # output row value block
            $Self->{LayoutObject}->Block( Name => 'XMLRowValue' );

            # create input element
            my $InputString = $Self->{LayoutObject}->ITSMConfigItemInputCreate(
                Key   => $InputKey,
                Item  => $Item,
                Value => $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content},
            );

            # output row value content block
            $Self->{LayoutObject}->Block(
                Name => 'XMLRowValueContent',
                Data => {
                    Name        => $Item->{Name},
                    Description => $Item->{Description} || $Item->{Name},
                    Colspan     => 4 - $Param{Level},
                    InputString => $InputString,
                },
            );

            # output blue required star
            if ( $Item->{Input}->{Required} ) {
                $Self->{LayoutObject}->Block( Name => 'XMLRowValueContentRequired' );
            }

            # output red invalid star
            if ( $Item->{Form}->{$InputKey}->{Invalid} ) {
                $Self->{LayoutObject}->Block( Name => 'XMLRowValueContentInvalid' );
            }

            # output row value content space, if level was given
            if ( $Param{Level} ) {
                $Self->{LayoutObject}->Block(
                    Name => 'XMLRowValueContentSpace',
                    Data => {
                        Colspan => $Param{Level},
                    },
                );
            }

            # output delete button
            if ($Delete) {
                $Self->{LayoutObject}->Block(
                    Name => 'XMLRowValueContentDelete',
                    Data => {
                        InputKey => $InputKey,
                    },
                );
            }
            else {
                $Self->{LayoutObject}->Block( Name => 'XMLRowValueContentDeleteDummy' );
            }

            # output row rule block
            $Self->{LayoutObject}->Block(
                Name => 'XMLRowValueRule',
                Data => {
                    Colspan => 6 - $Param{Level},
                },
            );

            # output row rule space, if level was given
            if ( $Param{Level} ) {
                $Self->{LayoutObject}->Block(
                    Name => 'XMLRowValueRuleSpace',
                    Data => {
                        Colspan => $Param{Level},
                    },
                );
            }

            # start recursion, if "Sub" was found
            if ( $Item->{Sub} ) {
                my %XMLFormOutputParam;
                if (
                    $DataPresentMode
                    && defined $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content}
                    )
                {
                    $XMLFormOutputParam{XMLData} = $Param{XMLData}->{ $Item->{Key} }->[$Counter];
                }

                $Self->_XMLFormOutput(
                    XMLDefinition => $Item->{Sub},
                    %XMLFormOutputParam,
                    Level  => $Param{Level} + 1,
                    Prefix => $InputKey,
                );
            }

            # output row to sort rows correctly
            $Self->{LayoutObject}->Block( Name => 'XMLRow' );
        }

        # output add button
        if ( $Loop < $Item->{CountMax} ) {

            # set prefix
            my $InputKey = $Item->{Key};
            if ( $Param{Prefix} ) {
                $InputKey = $Param{Prefix} . '::' . $InputKey;
            }

            # output row add block
            $Self->{LayoutObject}->Block( Name => 'XMLRowAdd' );

            # output row add content block
            $Self->{LayoutObject}->Block(
                Name => 'XMLRowAddContent',
                Data => {
                    Name        => $Item->{Name},
                    Description => $Item->{Description} || $Item->{Name},
                    Colspan     => 4 - $Param{Level},
                    InputKey    => $InputKey,
                },
            );

            # output row add content space, if level was given
            if ( $Param{Level} ) {
                $Self->{LayoutObject}->Block(
                    Name => 'XMLRowAddContentSpace',
                    Data => {
                        Colspan => $Param{Level},
                    },
                );
            }

            # output row add rule block
            $Self->{LayoutObject}->Block(
                Name => 'XMLRowAddRule',
                Data => {
                    Colspan => 6 - $Param{Level},
                },
            );

            # output row add rule space, if level was given
            if ( $Param{Level} ) {
                $Self->{LayoutObject}->Block(
                    Name => 'XMLRowAddRuleSpace',
                    Data => {
                        Colspan => $Param{Level},
                    },
                );
            }
        }
    }

    return 1;
}

1;
