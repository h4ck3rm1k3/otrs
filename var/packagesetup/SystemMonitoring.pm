# --
# SystemMonitoring.pm - code to excecute during package installation
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: SystemMonitoring.pm,v 1.2 2012/01/30 16:10:42 md Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::SystemMonitoring;

use strict;
use warnings;

use Kernel::Config;
use Kernel::System::SysConfig;
use Kernel::System::Type;

use Kernel::System::Valid;
use Kernel::System::DynamicField;

#see Kernel::System::PostMaster::Filter::SystemMonitoring and make sure it is in sync
use constant DynamicFieldTextPrefix => 'TicketFreeText';

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

=head1 NAME

SystemMonitoring.pm - code to excecute during package installation

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
    use var::packagesetup::SystemMonitoring;

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
    my $CodeObject = var::packagesetup::SystemMonitoring->new(
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
        qw(ConfigObject EncodeObject LogObject MainObject TimeObject DBObject XMLObject)
        )
    {
        $Self->{$Object} = $Param{$Object} ||
            $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Missing parameter for $Object!"
            );
    }

    # create needed sysconfig object
    $Self->{SysConfigObject} = Kernel::System::SysConfig->new( %{$Self} );

    # rebuild ZZZ* files
    $Self->{SysConfigObject}->WriteDefault();

    # define the ZZZ files
    my @ZZZFiles = (
        'ZZZAAuto.pm',
        'ZZZAuto.pm',
    );

    # reload the ZZZ files (mod_perl workaround)
    for my $ZZZFile (@ZZZFiles) {

        PREFIX:
        for my $Prefix (@INC) {
            my $File = $Prefix . '/Kernel/Config/Files/' . $ZZZFile;
            next PREFIX if !-f $File;
            do $File;
            last PREFIX;
        }
    }

    # create needed objects
    $Self->{ConfigObject}       = Kernel::Config->new();
    $Self->{TypeObject}         = Kernel::System::Type->new( %{$Self} );
    $Self->{ValidObject}        = Kernel::System::Valid->new( %{$Self} );
    $Self->{DynamicFieldObject} = Kernel::System::DynamicField->new( %{$Self} );

    return $Self;
}

=item CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    $Self->_CreateDynamicFields();

    return 1;
}

=item CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeUpgradeFromLowerThan_3_0_93()

This function is only executed if the installed module version is smaller than 3.0.93.

my $Result = $CodeObject->CodeUpgradeFromLowerThan_3_0_93();

=cut

sub CodeUpgradeFromLowerThan_3_0_93 {
    my ( $Self, %Param ) = @_;

    # get the definition for all dynamic fields for SystemMonitoring
    my @DynamicFields = $Self->_GetDynamicFieldsDefinition();

    # clean up the migrated freetext and freetime fields
    # e.g. delete the possible values for fields that use the general catalog
    DYNAMICFIELD:
    for my $DynamicFieldNew (@DynamicFields) {

        # get existing dynamic field data
        my $DynamicFieldOld = $Self->{DynamicFieldObject}->DynamicFieldGet(
            Name => $DynamicFieldNew->{Name},
        );

        # update the dynamic field
        my $Success = $Self->{DynamicFieldObject}->DynamicFieldUpdate(
            ID         => $DynamicFieldOld->{ID},
            FieldOrder => $DynamicFieldOld->{FieldOrder},
            Name       => $DynamicFieldNew->{Name},
            Label      => $DynamicFieldNew->{Label},
            FieldType  => $DynamicFieldNew->{FieldType},
            ObjectType => $DynamicFieldNew->{ObjectType},
            Config     => $DynamicFieldNew->{Config},
            ValidID    => 1,
            Reorder    => 0,
            UserID     => 1,
        );
    }

    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item _CreateDynamicFields()

creates all dynamic fields that are necessary for SystemMonitoring

    my $Result = $CodeObject->_CreateDynamicFields();

=cut

sub _CreateDynamicFields {
    my ( $Self, %Param ) = @_;

    my $ValidID = $Self->{ValidObject}->ValidLookup(
        Valid => 'valid',
    );

    # get all current dynamic fields
    my $DynamicFieldList = $Self->{DynamicFieldObject}->DynamicFieldListGet(
        Valid => 0,
    );

    # get the list of order numbers (is already sorted).
    my @DynamicfieldOrderList;
    for my $Dynamicfield ( @{$DynamicFieldList} ) {
        push @DynamicfieldOrderList, $Dynamicfield->{FieldOrder};
    }

    # get the last element from the order list and add 1
    my $NextOrderNumber = 1;
    if (@DynamicfieldOrderList) {
        $NextOrderNumber = $DynamicfieldOrderList[-1] + 1;
    }

    # get the definition for all dynamic fields for
    my @DynamicFields = $Self->_GetDynamicFieldsDefinition();

    # create dynamic fields
    DYNAMICFIELD:
    for my $DynamicField (@DynamicFields) {

        # create a new field
        my $OldDynamicField = $Self->{DynamicFieldObject}->DynamicFieldGet(
            Name => $DynamicField->{Name},
        );

        if ( $OldDynamicField->{Label} eq $DynamicField->{Label} )
        {
            $Self->{LogObject}->Log(
                Priority => 'info',
                Message  => "Field already exists Label:$DynamicField->{Label}, skipping."
            );
        }
        else
        {
            my $FieldID = $Self->{DynamicFieldObject}->DynamicFieldAdd(
                Name       => $DynamicField->{Name},
                Label      => $DynamicField->{Label},
                FieldOrder => $NextOrderNumber,
                FieldType  => $DynamicField->{FieldType},
                ObjectType => $DynamicField->{ObjectType},
                Config     => $DynamicField->{Config},
                ValidID    => $ValidID,
                UserID     => 1,
            );
            next DYNAMICFIELD if !$FieldID;

            # increase the order number
            $NextOrderNumber++;
        }
    }

    return 1;
}

=item _GetDynamicFieldsDefinition()

returns the definition for System Monitoring related dynamic fields

    my $Result = $CodeObject->_GetDynamicFieldsDefinition();

=cut

sub _GetDynamicFieldsDefinition {
    my ( $Self, %Param ) = @_;

    my $ConfigFreeTextHost = $Self->{Config}->{'FreeTextHost'};
    if ( !$ConfigFreeTextHost )
    {
        $ConfigFreeTextHost = 1;
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Missing CI Config FreeTextHost, using value 1!"
        );
    }

    my $ConfigFreeTextService = $Self->{Config}->{'FreeTextService'};
    if ( !$ConfigFreeTextService )
    {
        $ConfigFreeTextService = 2;
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Missing CI Config FreeTextService, using value 2!"
        );
    }

    my $FieldNameHost    = DynamicFieldTextPrefix . $ConfigFreeTextHost;
    my $FieldNameService = DynamicFieldTextPrefix . $ConfigFreeTextService;

# define all dynamic fields for System Montitoring, these need to be changed as well if the config changes
    my @DynamicFields = (
        {
            Name       => $FieldNameHost,
            Label      => 'SystemMonitoring HostName',
            FieldType  => 'Text',
            ObjectType => 'Ticket',
            Config     => {
                TranslatableValues => 1,
            },
        },
        {
            Name       => $FieldNameService,
            Label      => 'SystemMonitoring ServiceName',
            FieldType  => 'Text',
            ObjectType => 'Ticket',
            Config     => {
                TranslatableValues => 1,
            },
        },
    );

    return @DynamicFields;
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

$Revision: 1.2 $ $Date: 2012/01/30 16:10:42 $

=cut
