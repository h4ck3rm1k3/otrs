# --
# ITSMCore.pm - code to excecute during package installation
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: ITSMCore.pm,v 1.19 2011/01/14 10:38:28 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::ITSMCore;

use strict;
use warnings;

use Kernel::System::GeneralCatalog;
use Kernel::System::Group;
use Kernel::System::ITSMCIPAllocate;
use Kernel::System::Priority;
use Kernel::System::Valid;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.19 $) [1];

=head1 NAME

ITSMCore.pm - code to excecute during package installation

=head1 SYNOPSIS

All functions

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::Main;
    use Kernel::System::Time;
    use Kernel::System::DB;
    use Kernel::System::XML;
    use var::packagesetup::ITSMCore;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject    = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
    my $TimeObject = Kernel::System::Time->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $XMLObject = Kernel::System::XML->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        MainObject   => $MainObject,
    );
    my $CodeObject = var::packagesetup::ITSMCore->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
        TimeObject   => $TimeObject,
        DBObject     => $DBObject,
        XMLObject    => $XMLObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (
        qw(ConfigObject LogObject EncodeObject MainObject TimeObject DBObject XMLObject)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
    $Self->{GroupObject}          = Kernel::System::Group->new( %{$Self} );
    $Self->{CIPAllocateObject}    = Kernel::System::ITSMCIPAllocate->new( %{$Self} );
    $Self->{PriorityObject}       = Kernel::System::Priority->new( %{$Self} );
    $Self->{ValidObject}          = Kernel::System::Valid->new( %{$Self} );

    return $Self;
}

=item CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    # set default CIP matrix
    $Self->_CIPDefaultMatrixSet();

    # add the group itsm-service
    $Self->_GroupAdd(
        Name        => 'itsm-service',
        Description => 'Group for ITSM Service mask access in the agent interface.',
    );

    # fillup empty type_id rows in service table
    $Self->_FillupEmptyServiceTypeID();

    # fillup empty criticality_id rows in service table
    $Self->_FillupEmptyServiceCriticalityID();

    # fillup empty type_id rows in sla table
    $Self->_FillupEmptySLATypeID();

    # set preferences for some GeneralCatalog entries
    $Self->_SetPreferences();

    return 1;
}

=item CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    # set default CIP matrix
    $Self->_CIPDefaultMatrixSet();

    # add the group itsm-service
    $Self->_GroupAdd(
        Name        => 'itsm-service',
        Description => 'Group for ITSM Service mask access in the agent interface.',
    );

    # fillup empty type_id rows in service table
    $Self->_FillupEmptyServiceTypeID();

    # fillup empty criticality_id rows in service table
    $Self->_FillupEmptyServiceCriticalityID();

    # fillup empty type_id rows in sla table
    $Self->_FillupEmptySLATypeID();

    return 1;
}

=item CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    # set default CIP matrix
    $Self->_CIPDefaultMatrixSet();

    # fillup empty type_id rows in service table
    $Self->_FillupEmptyServiceTypeID();

    # fillup empty criticality_id rows in service table
    $Self->_FillupEmptyServiceCriticalityID();

    # fillup empty type_id rows in sla table
    $Self->_FillupEmptySLATypeID();

    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    # deactivate the group itsm-service
    $Self->_GroupDeactivate(
        Name => 'itsm-service',
    );

    return 1;
}

=item _SetPreferences()

    my $Result = $CodeObject->_SetPreferences()

=cut

sub _SetPreferences {
    my $Self = shift;

    my %Map = (
        Operational => 'operational',
        Warning     => 'warning',
        Incident    => 'incident',
    );

    NAME:
    for my $Name ( keys %Map ) {
        my $Item = $Self->{GeneralCatalogObject}->ItemGet(
            Name  => $Name,
            Class => 'ITSM::Core::IncidentState',
        );

        next NAME if !$Item;

        $Self->{GeneralCatalogObject}->GeneralCatalogPreferencesSet(
            ItemID => $Item->{ItemID},
            Key    => 'Functionality',
            Value  => $Map{$Name},
        );
    }
}

=item _CIPDefaultMatrixSet()

set the default CIP matrix

    my $Result = $CodeObject->_CIPDefaultMatrixSet();

=cut

sub _CIPDefaultMatrixSet {
    my ( $Self, %Param ) = @_;

    # get current allocation list
    my $List = $Self->{CIPAllocateObject}->AllocateList(
        UserID => 1,
    );

    return if !$List;
    return if ref $List ne 'HASH';

    # set no matrix if already defined
    return if %{$List};

    # define the allocations
    my %Allocation;
    $Allocation{'1 very low'}->{'1 very low'}   = '1 very low';
    $Allocation{'1 very low'}->{'2 low'}        = '1 very low';
    $Allocation{'1 very low'}->{'3 normal'}     = '2 low';
    $Allocation{'1 very low'}->{'4 high'}       = '2 low';
    $Allocation{'1 very low'}->{'5 very high'}  = '3 normal';
    $Allocation{'2 low'}->{'1 very low'}        = '1 very low';
    $Allocation{'2 low'}->{'2 low'}             = '2 low';
    $Allocation{'2 low'}->{'3 normal'}          = '2 low';
    $Allocation{'2 low'}->{'4 high'}            = '3 normal';
    $Allocation{'2 low'}->{'5 very high'}       = '4 high';
    $Allocation{'3 normal'}->{'1 very low'}     = '2 low';
    $Allocation{'3 normal'}->{'2 low'}          = '2 low';
    $Allocation{'3 normal'}->{'3 normal'}       = '3 normal';
    $Allocation{'3 normal'}->{'4 high'}         = '4 high';
    $Allocation{'3 normal'}->{'5 very high'}    = '4 high';
    $Allocation{'4 high'}->{'1 very low'}       = '2 low';
    $Allocation{'4 high'}->{'2 low'}            = '3 normal';
    $Allocation{'4 high'}->{'3 normal'}         = '4 high';
    $Allocation{'4 high'}->{'4 high'}           = '4 high';
    $Allocation{'4 high'}->{'5 very high'}      = '5 very high';
    $Allocation{'5 very high'}->{'1 very low'}  = '3 normal';
    $Allocation{'5 very high'}->{'2 low'}       = '4 high';
    $Allocation{'5 very high'}->{'3 normal'}    = '4 high';
    $Allocation{'5 very high'}->{'4 high'}      = '5 very high';
    $Allocation{'5 very high'}->{'5 very high'} = '5 very high';

    # get impact list
    my $ImpactList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::Core::Impact',
    );
    my %ImpactListReverse = reverse %{$ImpactList};

    # get criticality list
    my $CriticalityList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::Core::Criticality',
    );
    my %CriticalityListReverse = reverse %{$CriticalityList};

    # get priority list
    my %PriorityList = $Self->{PriorityObject}->PriorityList(
        UserID => 1,
    );
    my %PriorityListReverse = reverse %PriorityList;

    # create the allocation matrix
    my %AllocationMatrix;
    IMPACT:
    for my $Impact ( keys %Allocation ) {

        next IMPACT if !$ImpactListReverse{$Impact};

        # extract impact id
        my $ImpactID = $ImpactListReverse{$Impact};

        CRITICALITY:
        for my $Criticality ( keys %{ $Allocation{$Impact} } ) {

            next CRITICALITY if !$CriticalityListReverse{$Criticality};

            # extract priority
            my $Priority = $Allocation{$Impact}->{$Criticality};

            next CRITICALITY if !$PriorityListReverse{$Priority};

            # extract criticality id and priority id
            my $CriticalityID = $CriticalityListReverse{$Criticality};
            my $PriorityID    = $PriorityListReverse{$Priority};

            $AllocationMatrix{$ImpactID}->{$CriticalityID} = $PriorityID;
        }
    }

    # save the matrix
    $Self->{CIPAllocateObject}->AllocateUpdate(
        AllocateData => \%AllocationMatrix,
        UserID       => 1,
    );

    return 1;
}

=item _GroupAdd()

add a group

    my $Result = $CodeObject->_GroupAdd(
        Name        => 'the-group-name',
        Description => 'The group description.',
    );

=cut

sub _GroupAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Name Description)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get valid list
    my %ValidList = $Self->{ValidObject}->ValidList(
        UserID => 1,
    );
    my %ValidListReverse = reverse %ValidList;

    # get list of all groups
    my %GroupList = $Self->{GroupObject}->GroupList();

    # reverse the group list for easier lookup
    my %GroupListReverse = reverse %GroupList;

    # check if group already exists
    my $GroupID = $GroupListReverse{ $Param{Name} };

    # reactivate the group
    if ($GroupID) {

        # get current group data
        my %GroupData = $Self->{GroupObject}->GroupGet(
            ID     => $GroupID,
            UserID => 1,
        );

        # reactivate group
        $Self->{GroupObject}->GroupUpdate(
            %GroupData,
            ValidID => $ValidListReverse{valid},
            UserID  => 1,
        );

        return 1;
    }

    # add the group
    else {
        return if !$Self->{GroupObject}->GroupAdd(
            Name    => $Param{Name},
            Comment => $Param{Description},
            ValidID => $ValidListReverse{valid},
            UserID  => 1,
        );
    }

    # lookup the new group id
    my $NewGroupID = $Self->{GroupObject}->GroupLookup(
        Group  => $Param{Name},
        UserID => 1,
    );

    # add user root to the group
    $Self->{GroupObject}->GroupMemberAdd(
        GID        => $NewGroupID,
        UID        => 1,
        Permission => {
            ro        => 1,
            move_into => 1,
            create    => 1,
            owner     => 1,
            priority  => 1,
            rw        => 1,
        },
        UserID => 1,
    );

    return 1;
}

=item _GroupDeactivate()

deactivate a group

    my $Result = $CodeObject->_GroupDeactivate(
        Name => 'the-group-name',
    );

=cut

sub _GroupDeactivate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Name} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Name!',
        );
        return;
    }

    # lookup group id
    my $GroupID = $Self->{GroupObject}->GroupLookup(
        Group => $Param{Name},
    );

    return if !$GroupID;

    # get valid list
    my %ValidList = $Self->{ValidObject}->ValidList(
        UserID => 1,
    );
    my %ValidListReverse = reverse %ValidList;

    # get current group data
    my %GroupData = $Self->{GroupObject}->GroupGet(
        ID     => $GroupID,
        UserID => 1,
    );

    # deactivate group
    $Self->{GroupObject}->GroupUpdate(
        %GroupData,
        ValidID => $ValidListReverse{invalid},
        UserID  => 1,
    );

    return 1;
}

=item _FillupEmptyServiceTypeID()

fillup empty entries in the type_id column of the service table

    my $Result = $CodeObject->_FillupEmptyServiceTypeID();

=cut

sub _FillupEmptyServiceTypeID {
    my ( $Self, %Param ) = @_;

    # get service type list
    my $ServiceTypeList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::Service::Type',
    );

    # error handling
    if ( !$ServiceTypeList || ref $ServiceTypeList ne 'HASH' || !%{$ServiceTypeList} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't find any item in general catalog class ITSM::Service::Type!",
        );
        return;
    }

    # sort ids
    my @ServiceTypeKeyList = sort keys %{$ServiceTypeList};

    # update type_id
    return $Self->{DBObject}->Do(
        SQL => "UPDATE service "
            . "SET type_id = $ServiceTypeKeyList[0] "
            . "WHERE type_id = 0 OR type_id IS NULL",
    );
}

=item _FillupEmptyServiceCriticalityID()

fillup empty entries in the criticality_id column of the service table

    my $Result = $CodeObject->_FillupEmptyServiceCriticalityID();

=cut

sub _FillupEmptyServiceCriticalityID {
    my ( $Self, %Param ) = @_;

    # get criticality list
    my $CriticalityList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::Core::Criticality',
    );

    # error handling
    if ( !$CriticalityList || ref $CriticalityList ne 'HASH' || !%{$CriticalityList} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't find any item in general catalog class ITSM::Core::Criticality!",
        );
        return;
    }

    # sort ids
    my @CriticalityKeyList = sort keys %{$CriticalityList};

    # update criticality_id
    return $Self->{DBObject}->Do(
        SQL => "UPDATE service "
            . "SET criticality_id = $CriticalityKeyList[0] "
            . "WHERE criticality_id = 0 OR criticality_id IS NULL",
    );
}

=item _FillupEmptySLATypeID()

fillup empty entries in the type_id column of the sla table

    my $Result = $CodeObject->_FillupEmptySLATypeID();

=cut

sub _FillupEmptySLATypeID {
    my ( $Self, %Param ) = @_;

    # get sla type list
    my $SLATypeList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::SLA::Type',
    );

    # error handling
    if ( !$SLATypeList || ref $SLATypeList ne 'HASH' || !%{$SLATypeList} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't find any item in general catalog class ITSM::SLA::Type!",
        );
        return;
    }

    # sort ids
    my @SLATypeKeyList = sort keys %{$SLATypeList};

    # update type_id
    return $Self->{DBObject}->Do(
        SQL => "UPDATE sla "
            . "SET type_id = $SLATypeKeyList[0] "
            . "WHERE type_id = 0 OR type_id IS NULL",
    );
}

1;

=back

=head1 TERMS AND CONDITIONS

This Software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/gpl-2.0.txt>.

=cut

=head1 VERSION

$Revision: 1.19 $ $Date: 2011/01/14 10:38:28 $

=cut
