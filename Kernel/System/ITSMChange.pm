# --
# Kernel/System/ITSMChange.pm - all change functions
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: ITSMChange.pm,v 1.3 2009/10/02 17:01:17 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange;

use strict;
use warnings;

use Kernel::System::Valid;
use Kernel::System::GeneralCatalog;
use Kernel::System::LinkObject;
use Kernel::System::ITSMChange::WorkOrder;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

=head1 NAME

Kernel::System::ITSMChange - change lib

=head1 SYNOPSIS

All config item functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::DB;
    use Kernel::System::Main;
    use Kernel::System::ITSMChange;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $ChangeObject = Kernel::System::ITSMChange->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        MainObject   => $MainObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(DBObject ConfigObject EncodeObject LogObject MainObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    $Self->{ValidObject}          = Kernel::System::Valid->new( %{$Self} );
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
    $Self->{LinkObject}           = Kernel::System::LinkObject->new( %{$Self} );
    $Self->{WorkOrderObject}      = Kernel::System::ITSMChange::WorkOrder->new( %{$Self} );

    return $Self;
}

=item ChangeAdd()

add a new change

    my $ChangeID = $ChangeObject->ChangeAdd();
or
    my $ChangeID = $ChangeObject->ChangeAdd(
        Title           => 'Replacement of mail server',       # (optional)
        Description     => 'New mail server is faster',        # (optional)
        Justification   => 'Old mail server too slow',         # (optional)
        ChangeStateID   => 4,                                  # (optional)
        ChangeManagerID => 5,                                  # (optional)
        ChangeBuilderID => 6,                                  # (optional)
        CABAgents       => [ 1, 2, 4 ],     # UserIDs          # (optional)
        CABCustomers    => [ 'tt', 'mm' ],  # CustomerUserIDs  # (optional)
    );

=cut

sub ChangeAdd {
    my ( $Self, %Param ) = @_;

    # check if given ChangeStateID is listed in general catalog

    return $ChangeID;
}

=item ChangeUpdate()

update a change

    my $Success = $ChangeObject->ChangeUpdate(
        ChangeID        => 123,
        Title           => 'Replacement of slow mail server',  # (optional)
        Description     => 'New mail server is faster',        # (optional)
        Justification   => 'Old mail server too slow',         # (optional)
        ChangeStateID   => 4,                                  # (optional)
        ChangeManagerID => 5,                                  # (optional)
        ChangeBuilderID => 6,                                  # (optional)
        CABAgents       => [ 1, 2, 4 ],     # UserIDs          # (optional)
        CABCustomers    => [ 'tt', 'mm' ],  # CustomerUserIDs  # (optional)
    );

=cut

sub ChangeUpdate {
    my ( $Self, %Param ) = @_;

    # check if given ChangeStateID is listed in general catalog

    return 1;
}

=item ChangeGet()

return a change as hash reference

Return
    $Change{ChangeID}
    $Change{ChangeNumber}
    $Change{Title}
    $Change{Description}
    $Change{Justification}
    $Change{ChangeManagerID}
    $Change{ChangeBuilderID}
    $Change{WorkOrderIDs}     # array reference with WorkOrderIDs
    $Change{CAB}              # hasharray reference with CAB member ids, look at ChangeCABGet()
    $Change{PlannedStart}
    $Change{PlannedEnd}
    $Change{ActualStart}
    $Change{ActualEnd}
    $Change{CreateTime}
    $Change{CreateBy}
    $Change{ChangeTime}
    $Change{ChangeBy}

    my $ChangeRef = $ChangeObject->ChangeGet(
        ChangeID => 123,
    );

=cut

sub ChangeGet {
    my ( $Self, %Param ) = @_;

    return;
}

=item ChangeCABUpdate()

add or update the CAB of a change

    my $Success = $ChangeObject->ChangeCABUpdate(
        ChangeID     => 123,
        CABAgents    => [ 1, 2, 4 ],     # UserIDs          (optional)
        CABCustomers => [ 'tt', 'mm' ],  # CustomerUserIDs  (optional)
    );

=cut

sub ChangeCABUpdate {
    my ( $Self, %Param ) = @_;

    return;
}

=item ChangeCABGet()

return the CAB of a change as hasharray reference

# NOTE: Maybe make this function internal, as it will be used in ChangeGet()

Return
    $ChangeCAB = {
        CABAgents    => [ 1, 2, 4 ],
        CABCustomers => [ 'tt', 'mm' ],
    }

    my $ChangeCAB = $ChangeObject->ChangeCABGet(
        ChangeID => 123,
    );

=cut

sub ChangeCABGet {
    my ( $Self, %Param ) = @_;

    return;
}

=item ChangeCABDelete()

delete the CAB of a change

    my $Success = $ChangeObject->ChangeCABDelete(
        ChangeID => 123,
    );

=cut

sub ChangeCABDelete {
    my ( $Self, %Param ) = @_;

    return;
}

=item ChangeList()

return a change id list of all changes as array reference

    my $ChangeIDsRef = $ChangeObject->ChangeList();

=cut

sub ChangeList {
    my ( $Self, %Param ) = @_;

    return;
}

=item ChangeSearch()

return a change id list as an array reference

    my $ChangeIDsRef = $ChangeObject->ChangeSearch(
        ChangeNumber      => '2009100112345778',                 # (optional)
        Title             => 'Replacement of slow mail server',  # (optional)
        Description       => 'New mail server is faster',        # (optional)
        Justification     => 'Old mail server too slow',         # (optional)
        ChangeStateID     => 4,                                  # (optional)

        ChangeManagerID   => 5,                                  # (optional)
        ChangeBuilderID   => 6,                                  # (optional)
        WorkOrderAgentID  => 7,                                  # (optional)
        CABAgent          => 9,                                  # (optional)
        CABCustomer       => 'tt',                               # (optional)

        # changes with planned start time after ...
        PlannedStartTimeNewerDate => '2006-01-09 00:00:01',      # (optional)
        # changes with planned start time before then ....
        PlannedStartTimeOlderDate => '2006-01-19 23:59:59',      # (optional)

        # changes with planned end time after ...
        PlannedEndTimeNewerDate => '2006-01-09 00:00:01',        # (optional)
        # changes with planned end time before then ....
        PlannedEndTimeOlderDate => '2006-01-19 23:59:59',        # (optional)

        # changes with actual start time after ...
        ActualStartTimeNewerDate => '2006-01-09 00:00:01',       # (optional)
        # changes with actual start time before then ....
        ActualStartTimeOlderDate => '2006-01-19 23:59:59',       # (optional)

        # changes with actual end time after ...
        ActualEndTimeNewerDate => '2006-01-09 00:00:01',         # (optional)
        # changes with actual end time before then ....
        ActualEndTimeOlderDate => '2006-01-19 23:59:59',         # (optional)

        # changes with created time after ...
        CreateTimeNewerDate => '2006-01-09 00:00:01',            # (optional)
        # changes with created time before then ....
        CreateTimeOlderDate => '2006-01-19 23:59:59',            # (optional)

        # changes with changed time after ...
        ChangeTimeNewerDate => '2006-01-09 00:00:01',            # (optional)
        # changes with changed time before then ....
        ChangeTimeOlderDate => '2006-01-19 23:59:59',            # (optional)

        OrderBy => 'ChangeNumber',                               # (optional) default ChangeID
        # (ChangeID, ChangeNumber, ChangeStateID,
        # ChangeManagerID, ChangeBuilderID,
        # PlannedStart, PlannedEnd, ActualStart, ActualEnd,
        # CreateTime, CreateBy, ChangeTime, ChangeBy)

        Limit => 100,                                            # (optional)
    );

=cut

sub ChangeSearch {
    my ( $Self, %Param ) = @_;

    return;
}

=item ChangeDelete()

delete a change

NOTE: This function must first remove all links to this ChangeObject,
      delete the history of this ChangeObject, delete the CAB,
      then get a list of all WorkOrderObjects of this change and
      call WorkorderDelete for each WorkOrder (which will itself delete
      all links to the WorkOrder).

    my $Success = $ChangeObject->ChangeDelete(
        ChangeID => 123,
    );

=cut

sub ChangeDelete {
    my ( $Self, %Param ) = @_;

    return;
}

=item ChangeEditWorkflow()

edit the workflow of a change

NOTE: To be defined in more detail!

    my $Success = $ChangeObject->ChangeEditWorkflow(
        ChangeID  => 123,
    );

=cut

sub ChangeEditWorkflow {
    my ( $Self, %Param ) = @_;

    return;
}

=item ChangeListWorkflow()

list the workflow of a change

NOTE: To be defined in more detail!

    my $ChangeWorkflow = $ChangeObject->ChangeListWorkflow(
        ChangeID  => 123,
    );

=cut

sub ChangeListWorkflow {
    my ( $Self, %Param ) = @_;

    return;
}

=item _ChangeGetStart()

get the start date of a change, calculated from the start of the first work order

    my $ChangeStartTime = $ChangeObject->_ChangeGetStart(
        ChangeID => 123,
        Type     => 'planned' || 'actual',
    );

=cut

sub _ChangeGetStart {
    my ( $Self, %Param ) = @_;

    return;
}

=item _ChangeGetEnd()

get the end date of a change, calculated from the start of the first work order

    my $ChangeEndTime = $ChangeObject->_ChangeGetEnd(
        ChangeID => 123,
        Type     => 'planned' || 'actual',
    );

=cut

sub _ChangeGetEnd {
    my ( $Self, %Param ) = @_;

    return;
}

=item _ChangeGetTicks()

NOTE: Maybe this function better belongs to Kernel/Output/HTML/LayoutITSMChange.pm

short description of _ChangeGetTicks

    my $Result = $ChangeObject->_ChangeGetTicks(
        ChangeID => 123,
    );

=cut

sub _ChangeGetTicks {
    my ( $Self, %Param ) = @_;

    return;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=cut

=head1 VERSION

$Revision: 1.3 $ $Date: 2009/10/02 17:01:17 $

=cut
