# --
# Kernel/Modules/AdminGenericInterfaceMappingSolMan.pm - provides a Mapping SolMan view for admins
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: AdminGenericInterfaceMappingSolMan.pm,v 1.11 2011/10/21 05:03:02 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminGenericInterfaceMappingSolMan;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.11 $) [1];

use Kernel::System::VariableCheck qw(:all);
use Kernel::System::GenericInterface::Webservice;
use Kernel::System::Valid;
use YAML;

use Kernel::System::VariableCheck qw(:all);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    for (qw(ParamObject LayoutObject LogObject ConfigObject)) {
        if ( !$Self->{$_} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        }
    }

    # create additional objects
    $Self->{ValidObject} = Kernel::System::Valid->new( %{$Self} );
    $Self->{WebserviceObject} =
        Kernel::System::GenericInterface::Webservice->new( %{$Self} );

    $Self->{EmptyString} = '_GenericInterface_Mapping_SolMan_EmptyString_Dont_Use_It_String_Please';

    $Self->{DuplicateString}
        = '_GenericInterface_Mapping_SolMan_DuplicatedString_Dont_Use_It_String_Please';

    $Self->{DeletedString}
        = '_GenericInterface_Mapping_SolMan_DeletedString_Dont_Use_It_String_Please';

    return $Self;

}

sub Run {
    my ( $Self, %Param ) = @_;

    my $WebserviceID = $Self->{ParamObject}->GetParam( Param => 'WebserviceID' )
        || '';
    my $Operation = $Self->{ParamObject}->GetParam( Param => 'Operation' )
        || '';
    my $Invoker = $Self->{ParamObject}->GetParam( Param => 'Invoker' )
        || '';
    my $Direction = $Self->{ParamObject}->GetParam( Param => 'Direction' )
        || '';

    my $CommunicationType = IsStringWithData($Operation) ? 'Provider'  : 'Requester';
    my $ActionType        = IsStringWithData($Operation) ? 'Operation' : 'Invoker';
    my $Action = $Operation || $Invoker;

    # set mapping direction for display
    my $MappingDirection
        = $Direction eq 'MappingOutbound'
        ? 'SolMan Mapping for Outgoing Data'
        : 'SolMan Mapping for Incoming Data';

    # get configured Actions
    my $ActionsConfig
        = $Self->{ConfigObject}->Get( 'GenericInterface::' . $ActionType . '::Module' );

    # check for valid action backend
    if ( !IsHashRefWithData($ActionsConfig) ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Could not get registered configuration for action type $ActionType",
        );
    }

    # check for WebserviceID
    if ( !$WebserviceID ) {
        return $Self->{LayoutObject}
            ->ErrorScreen( Message => "Need WebserviceID!", );
    }

    # get web service configuration
    my $WebserviceData =
        $Self->{WebserviceObject}->WebserviceGet( ID => $WebserviceID );

    # check for valid web service configuration
    if ( !IsHashRefWithData($WebserviceData) ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Could not get data for WebserviceID $WebserviceID",
        );
    }

    # get the action type (back-end)
    my $ActionBackend = $WebserviceData->{Config}->{$CommunicationType}->{$ActionType}
        ->{$Action}->{'Type'};

    # check for valid action backend
    if ( !$ActionBackend ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Could not get backend for $ActionType $Action",
        );
    }

    # get the configuration dialog for the action
    my $ActionFrontendModule = $ActionsConfig->{$ActionBackend}->{'ConfigDialog'};

    # ------------------------------------------------------------ #
    # subaction Change: load web service and show edit screen
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'Add' || $Self->{Subaction} eq 'Change' ) {

        return $Self->_ShowEdit(
            %Param,
            WebserviceID         => $WebserviceID,
            WebserviceData       => $WebserviceData,
            Operation            => $Operation,
            Invoker              => $Invoker,
            Direction            => $Direction,
            MappingDirection     => $MappingDirection,
            CommunicationType    => $CommunicationType,
            ActionType           => $ActionType,
            Action               => $Action,
            ActionFrontendModule => $ActionFrontendModule,
            Subaction            => 'Change',
        );
    }

    # ------------------------------------------------------------ #
    # subaction ChangeAction: write config and return to overview
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ChangeAction' ) {

        # get parameters from web browser
        my $GetParam = $Self->_GetParams;

        # currently $GetParam contains exactly the information we need for the new mapping
        # leave the assignation here for further changes in $GetParam, possible parse is needed
        my %NewMapping;
        if ( IsHashRefWithData($GetParam) ) {
            %NewMapping = %{$GetParam};
        }

        # check required parameters
        my %Error;

        MAPPINGTYPE:
        for my $MappingType ( keys %NewMapping ) {
            next MAPPINGTYPE if !$MappingType;
            next MAPPINGTYPE if !IsHashRefWithData( $NewMapping{$MappingType} );
            VALUENAME:
            for my $ValueName ( keys %{ $NewMapping{$MappingType} } ) {

                # check for empty original values
                if ( $ValueName =~ m{\A $Self->{EmptyString} (?: \d+)}smx ) {

                    # set a true entry in OrigValueEmptyError
                    $Error{$MappingType}->{'OrigValueEmptyError'}->{$ValueName} = 1;
                }

                # otherwise check for duplicate original values
                elsif ( $ValueName =~ m{\A (.+) - $Self->{DuplicateString} (?: \d+)}smx ) {

                    # set an entry in OrigValueDuplicateError with the duplicate key as value
                    $Error{$MappingType}->{'OrigValueDuplicateError'}->{$ValueName} = $1;
                }

                # check for empty new values
                if ( !$NewMapping{$MappingType}->{$ValueName} ) {

                    # set a true entry in NewValueEmptyError
                    $Error{$MappingType}->{'NewValueEmptyError'}->{$ValueName} = 1;
                }
            }
        }

        # set new mapping
        $WebserviceData->{Config}->{$CommunicationType}->{$ActionType}->{$Action}->{$Direction}
            ->{Config}
            = \%NewMapping;

        # if there is an error return to edit screen
        if ( IsHashRefWithData( \%Error ) ) {
            return $Self->_ShowEdit(
                Error                => \%Error,
                WebserviceID         => $WebserviceID,
                WebserviceData       => $WebserviceData,
                Operation            => $Operation,
                Invoker              => $Invoker,
                Direction            => $Direction,
                MappingDirection     => $MappingDirection,
                CommunicationType    => $CommunicationType,
                ActionType           => $ActionType,
                Action               => $Action,
                ActionFrontendModule => $ActionFrontendModule,
                Subaction            => 'Change',
            );
        }

        # otherwise save configuration and return to overview screen
        my $Success = $Self->{WebserviceObject}->WebserviceUpdate(
            ID      => $WebserviceID,
            Name    => $WebserviceData->{Name},
            Config  => $WebserviceData->{Config},
            ValidID => $WebserviceData->{ValidID},
            UserID  => $Self->{UserID},
        );

        # check for successful web service update
        if ( !$Success ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => "Could not update configuration data for WebserviceID $WebserviceID",
            );
        }

        # Save and finish button: go to Webservice.
        if ( $Self->{ParamObject}->GetParam( Param => 'ReturnToAction' ) ) {
            my $RedirectURL
                = "Action=$ActionFrontendModule;Subaction=Change;$ActionType=$Action;"
                . "WebserviceID=$WebserviceID;";

            return $Self->{LayoutObject}->Redirect(
                OP => $RedirectURL,
            );
        }

        # otherwise return to edit screen.
        return $Self->_ShowEdit(
            %Param,
            WebserviceID         => $WebserviceID,
            WebserviceData       => $WebserviceData,
            Operation            => $Operation,
            Invoker              => $Invoker,
            Direction            => $Direction,
            MappingDirection     => $MappingDirection,
            CommunicationType    => $CommunicationType,
            ActionType           => $ActionType,
            Action               => $Action,
            ActionFrontendModule => $ActionFrontendModule,
            Subaction            => 'Change',
        );
    }

}

sub _ShowEdit {
    my ( $Self, %Param ) = @_;

    # set action for go back button
    $Param{LowerCaseActionType} = lc $Param{ActionType};

    my $Output = $Self->{LayoutObject}->Header();
    $Output .= $Self->{LayoutObject}->NavigationBar();

    my $MappingConfig = $Param{WebserviceData}->{Config}->{ $Param{CommunicationType} }->
        { $Param{ActionType} }->{ $Param{Action} }->{ $Param{Direction} }->{Config};
    $Param{WebserviceName} = $Param{WebserviceData}->{Name};

    $Param{DeletedString} = $Self->{DeletedString};

    my %RegisteredMappingConfig = (
        ArticleTypeMap    => 'Article Type',
        PriorityMap       => 'Priority',
        StateMap          => 'State',
        TicketFreeTextMap => 'Ticket Free Text',
    );

    # create a sorted list of mapping key types
    my @RegisteredMappingKeys = keys(%RegisteredMappingConfig);
    @RegisteredMappingKeys = sort @RegisteredMappingKeys;

    # strip all mapping key types that already exists in the configuration
    my %MappingKeys;
    MAPPINGTYPE:
    for my $MappingKey (@RegisteredMappingKeys) {
        next MAPPINGTYPE if $MappingConfig->{$MappingKey};
        $MappingKeys{$MappingKey} = $RegisteredMappingConfig{$MappingKey};
    }

    # parse the mapping config as JSON structure
    $Param{MappingConfig} = $Self->{LayoutObject}->JSONEncode(
        Data => \%RegisteredMappingConfig,
    );

    # create full mapping key types select
    $Param{MappingKeysStrgOrig} = $Self->{LayoutObject}->BuildSelection(
        Data          => \%RegisteredMappingConfig,
        Name          => 'KeyMapTypeOrig',
        Class         => 'GenericInterfaceSpace',
        Sort          => 'AlphanumericValue',
        SelectedValue => '-',
        PossibleNone  => 1,
        Translate     => 0,
    );

    # create a mapping key types select only for non set mapping key types
    $Param{MappingKeysStrg} = $Self->{LayoutObject}->BuildSelection(
        Data          => \%MappingKeys,
        Name          => 'KeyMapType',
        Class         => 'GenericInterfaceSpace',
        Sort          => 'AlphanumericValue',
        SelectedValue => '-',
        PossibleNone  => 1,
        Translate     => 0,
    );

    # create the template for mapping keys
    $Self->{LayoutObject}->Block(
        Name => 'KeyTemplate',
        Data => {
            Classes => 'KeyTemplate Hidden',
            KeyName => 'Template',
            %Param,
        },
    );

    # set value index
    $Self->{LayoutObject}->Block(
        Name => 'ValueTemplateRowIndex',
        Data => {
            KeyIndex   => '',
            ValueIndex => '0',
        },
    );

    # add saved values
    my $KeyIndex = 0;

    MAPPINGTYPE:
    for my $MappingKeyType (@RegisteredMappingKeys) {

        # check if mapping key type exist on the current configuration
        next MAPPINGTYPE if !$MappingConfig->{$MappingKeyType};
        $KeyIndex++;

        # get the name for display
        my $KeyDisplayName = $RegisteredMappingConfig{$MappingKeyType};

        # create the key map section
        $Self->{LayoutObject}->Block(
            Name => 'KeyTemplate',
            Data => {
                KeyName         => $MappingKeyType,
                KeyDisplayName  => $KeyDisplayName,
                ValueMapDefault => $MappingConfig->{ $MappingKeyType . 'Default' },
            },
        );

        my $ValueIndex = 0;
        for my $NewVal ( sort keys %{ $MappingConfig->{$MappingKeyType} } ) {

            $ValueIndex++;

            # needed for server side validation
            my $ValueNameError;
            my $ValueNameTooltip;
            my $ValueMapNewError;

            # to set the correct original value
            my $NewValClone = $NewVal;

            # check for errors
            if ( $Param{Error} ) {

                # check for errors on original value (empty)
                if ( $Param{Error}->{$MappingKeyType}->{'OrigValueEmptyError'}->{$NewVal} ) {

                 # if the original value was empty it has been changed in _GetParams to a predefined
                 # string and need to be set to empty again
                    $NewValClone = '';

                    # set the error class
                    $ValueNameError   = 'ServerError';
                    $ValueNameTooltip = 'This field is required.'
                }

                # check for errors on original value (duplicate)
                elsif ( $Param{Error}->{$MappingKeyType}->{'OrigValueDuplicateError'}->{$NewVal} ) {

                 # if the original value was empty it has been changed in _GetParams to a predefined
                 # string and need to be set to the original value again
                    $NewValClone
                        = $Param{Error}->{$MappingKeyType}->{'OrigValueDuplicateError'}->{$NewVal};

                    # set the error class
                    $ValueNameError   = 'ServerError';
                    $ValueNameTooltip = 'This field value is duplicated.'

                }

                # check for error on new value
                if ( $Param{Error}->{$MappingKeyType}->{'NewValueEmptyError'}->{$NewVal} ) {

                    # set the error class
                    $ValueMapNewError = 'ServerError';
                }
            }

            # create a value map row
            $Self->{LayoutObject}->Block(
                Name => 'ValueTemplateRow',
                Data => {
                    KeyName          => $MappingKeyType,
                    ValueNameError   => $ValueNameError,
                    ValueNameTooltip => $ValueNameTooltip || 'This field is required.',
                    ValueName        => $NewValClone,
                    ValueIndex       => $ValueIndex,
                    ValueMapNew      => $MappingConfig->{$MappingKeyType}->{$NewVal},
                    ValueMapNewError => $ValueMapNewError,
                },
            );
        }

        # set value index
        $Self->{LayoutObject}->Block(
            Name => 'ValueTemplateRowIndex',
            Data => {
                KeyName    => $MappingKeyType,
                ValueIndex => $ValueIndex,
            },
        );
    }

    # create the value template
    $Self->{LayoutObject}->Block(
        Name => 'ValueTemplate',
        Data => { %Param, },
    );

    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AdminGenericInterfaceMappingSolMan',
        Data         => { %Param, },
    );

    $Output .= $Self->{LayoutObject}->Footer();
    return $Output;
}

sub _GetParams {
    my ( $Self, %Param ) = @_;

    my $GetParam;

    # get parameters from web browser
    # get mapping keys
    MAPPINGKEY:
    for my $MappingKey (
        qw(
        ArticleTypeMap PriorityMap StateMap TicketFreeTextMap
        )
        )
    {
        my $MappingKeyValue = $Self->{ParamObject}->GetParam( Param => $MappingKey ) || '';
        next MAPPINGKEY if !$MappingKeyValue;

        # get mapping defaults
        $GetParam->{ $MappingKey . 'Default' }
            = $Self->{ParamObject}->GetParam( Param => $MappingKey . 'Default' ) || '';

        # check if MappingKey has a default value
        if ( $GetParam->{ $MappingKey . 'Default' } ) {

            # create MappingKey basic structure so that the MappingKeyDefault can be displayed
            # even if there are no configured mapping values for the MappingKey
            $GetParam->{$MappingKey} = {};
        }

        # get ValueCounters
        my $ValueCounter = $Self->{ParamObject}->GetParam( Param => 'ValueCounter' . $MappingKey )
            || '';
        next MAPPINGKEY if !$ValueCounter;

        my $EmptyValueCounter     = 0;
        my $DuplicateValueCounter = 0;

        # get mapping values for each mapping key
        my $Values;
        VALUEINDEX:
        for my $ValueIndex ( 1 .. $ValueCounter ) {
            my $ValueName = $Self->{ParamObject}
                ->GetParam( Param => 'ValueName' . $MappingKey . '_' . $ValueIndex ) || '';

            # check if value was deleted by the user and skip it
            next VALUEINDEX if $ValueName eq $Self->{DeletedString};

            # check if the original value is empty
            if ( $ValueName eq '' ) {

                # change the empty value to a predefined string
                $ValueName = $Self->{EmptyString} . int $EmptyValueCounter;
                $EmptyValueCounter++;
            }

            # otherwise check for duplicate
            elsif ( exists $GetParam->{$MappingKey}->{$ValueName} ) {

                # append a predefined unique string to make this value unique
                $ValueName .= '-' . $Self->{DuplicateString} . $DuplicateValueCounter;
                $DuplicateValueCounter++;
            }

            my $ValueMap = $Self->{ParamObject}
                ->GetParam( Param => 'ValueMapNew' . $MappingKey . '_' . $ValueIndex ) || '';
            $GetParam->{$MappingKey}->{$ValueName} = $ValueMap;
        }
    }
    return $GetParam;
}
1;
