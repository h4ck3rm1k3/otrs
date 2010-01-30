# --
# Kernel/Language/de_ITSMChangeManagement.pm - the german translation of ITSMChangeManagement
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: de_ITSMChangeManagement.pm,v 1.38 2010/01/30 21:50:59 mae Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMChangeManagement;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.38 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'A change must have a title!'}        = 'Ein Change ben�tigt einen Titel!';
    $Lang->{'A workorder must have a title!'}     = 'Eine Workorder ben�tigt einen Titel!';
    $Lang->{'Add Change'}                         = 'Change hinzuf�gen';
    $Lang->{'New time'}                           = 'Neuer Zeitpunkt';
    $Lang->{'The planned start time is invalid!'} = 'Der geplante Startzeitpunk ist ung�ltig!';
    $Lang->{'The planned end time is invalid!'}   = 'Der geplante Endzeitpunkt ist ung�ltig!';
    $Lang->{'The planned start time must be before the planned end time!'}
        = 'Der geplante Start muss vor dem geplanten Ende liegen!';
    $Lang->{'Time type'}                          = 'Art des Zeitpunktes';
    $Lang->{'Requested (by customer) Date'}       = 'Wunschtermin (des Kunden)';
    $Lang->{'Imperative::Save'}                   = 'Speichere';
    $Lang->{'as Template'}                        = 'als Vorlage';

    # Change menu
    $Lang->{'ITSM Change'}    = 'Change';
    $Lang->{'ITSM Workorder'} = 'Workorder';

    # Change attributes as returned from ChangeGet(), or taken by ChangeUpdate()
    $Lang->{'ChangeAttribute::AccountedTime'}    = 'Ben�tigte Zeit';
    $Lang->{'ChangeAttribute::ActualStartTime'}  = 'Tats�chlicher Start';
    $Lang->{'ChangeAttribute::ActualEndTime'}    = 'Tats�chliches Ende';
    $Lang->{'ChangeAttribute::CABAgents'}        = 'CAB Agents';
    $Lang->{'ChangeAttribute::CABCustomers'}     = 'CAB Customers';
    $Lang->{'ChangeAttribute::ChangeBuilder'}    = 'Change Builder';
    $Lang->{'ChangeAttribute::ChangeManager'}    = 'Change Manager';
    $Lang->{'ChangeAttribute::ChangeNumber'}     = 'Change Nummer';
    $Lang->{'ChangeAttribute::ChangeState'}      = 'Change State';
    $Lang->{'ChangeAttribute::ChangeTitle'}      = 'Change Titel';
    $Lang->{'ChangeAttribute::PlannedEffort'}    = 'Geplanter Aufwand';
    $Lang->{'ChangeAttribute::PlannedStartTime'} = 'Geplanter Start';
    $Lang->{'ChangeAttribute::PlannedEndTime'}   = 'Geplantes Ende';
    $Lang->{'ChangeAttribute::RequestedTime'}    = 'Wunschtermin';

    # Workorder attributes as returned from WorkOrderGet(), or taken by WorkOrderUpdate()
    $Lang->{'WorkOrderAttribute::WorkOrderAgent'}  = 'Workorder Agent';
    $Lang->{'WorkOrderAttribute::WorkOrderNumber'} = 'Workorder Nummer';
    $Lang->{'WorkOrderAttribute::WorkOrderState'}  = 'Workorder Status';
    $Lang->{'WorkOrderAttribute::WorkOrderType'}   = 'Workorder Typ';

    # Change history
    $Lang->{'ChangeHistory::ChangeAdd'}              = 'Neuer Change (ID=%s)';
    $Lang->{'ChangeHistory::ChangeUpdate'}           = '%s: Neu: %s -> Alt: %s';
    $Lang->{'ChangeHistory::ChangeLinkAdd'}          = 'Link zu %s (ID=%s) hinzugef�gt';
    $Lang->{'ChangeHistory::ChangeLinkDelete'}       = 'Link zu %s (ID=%s) gel�scht';
    $Lang->{'ChangeHistory::ChangeCABUpdate'}        = '%s: Neu: %s -> Alt: %s';
    $Lang->{'ChangeHistory::ChangeCABDelete'}        = 'CAB gel�scht %s';
    $Lang->{'ChangeHistory::ChangeAttachmentAdd'}    = 'Neuer Anhang: %s';
    $Lang->{'ChangeHistory::ChangeAttachmentDelete'} = 'Anhang gel�scht: %s';

    # workorder history
    $Lang->{'WorkOrderHistory::WorkOrderAdd'}              = 'Neue Workorder (ID=%s)';
    $Lang->{'WorkOrderHistory::WorkOrderUpdate'}           = '%s: Neu: %s -> Alt: %s';
    $Lang->{'WorkOrderHistory::WorkOrderLinkAdd'}          = 'Link zu %s (ID=%s) hinzugef�gt';
    $Lang->{'WorkOrderHistory::WorkOrderLinkDelete'}       = 'Link to %s (ID=%s) gel�scht';
    $Lang->{'WorkOrderHistory::WorkOrderDelete'}           = 'Workorder (ID=%s) gel�scht';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentAdd'}    = 'Neuer Anhang f�r Workorder: %s';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentDelete'} = 'Anhang von Workorder gel�scht: %s';

    # long workorder history
    $Lang->{'WorkOrderHistory::WorkOrderAddWithWorkOrderID'}              = 'Neue Workorder (ID=%s)';
    $Lang->{'WorkOrderHistory::WorkOrderUpdateWithWorkOrderID'}           = '(ID=%s) %s: Neu: %s -> Alt: %s';
    $Lang->{'WorkOrderHistory::WorkOrderLinkAddWithWorkOrderID'}          = '(ID=%s) Link zu %s (ID=%s) hinzugef�gt';
    $Lang->{'WorkOrderHistory::WorkOrderLinkDeleteWithWorkOrderID'}       = '(ID=%s) Link to %s (ID=%s) gel�scht';
    $Lang->{'WorkOrderHistory::WorkOrderDeleteWithWorkOrderID'}           = 'Workorder (ID=%s) gel�scht';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentAddWithWorkOrderID'}    = '(ID=%s) Neuer Anhang f�r Workorder: %s';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentDeleteWithWorkOrderID'} = '(ID=%s) Anhang von Workorder gel�scht: %s';

    # condition history
    $Lang->{'ChangeHistory::ConditionAdd'}       = '%s: %s';
    $Lang->{'ChangeHistory::ConditionAddID'}     = 'Neue Condition (ID=%s)';
    $Lang->{'ChangeHistory::ConditionUpdate'}    = '%s: Neu: %s -> Old: %s';
    $Lang->{'ChangeHistory::ConditionDelete'}    = 'Condition (ID=%s) gel�scht';
    $Lang->{'ChangeHistory::ConditionDeleteAll'} = 'Alle Conditions gel�scht';

    # expression history
    $Lang->{'ChangeHistory::ExpressionAdd'}       = '%s: %s';
    $Lang->{'ChangeHistory::ExpressionAddID'}     = 'Neue Expression (ID=%s)';
    $Lang->{'ChangeHistory::ExpressionUpdate'}    = '%s: Neu: %s -> Old: %s';

    # history for time events
    $Lang->{'ChangeHistory::ChangePlannedStartTimeReached'} = 'Change (ID=%s) hat geplante Startzeit erreicht.';
    $Lang->{'ChangeHistory::ChangePlannedEndTimeReached'}   = 'Change (ID=%s) hat geplante Endzeit erreicht.';
    $Lang->{'ChangeHistory::ChangeActualStartTimeReached'}  = 'Change (ID=%s) hat begonnen.';
    $Lang->{'ChangeHistory::ChangeActualEndTimeReached'}    = 'Change (ID=%s) wurde beendet.';
    $Lang->{'ChangeHistory::ChangeRequestedTimeReached'}    = 'Change (ID=%s) hat gew�nschte Endzeit erreicht.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedStartTimeReached'} = 'Workorder (ID=%s) hat geplante Startzeit erreicht.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedEndTimeReached'}   = 'Workorder (ID=%s) hat geplante Endzeit erreicht.';
    $Lang->{'WorkOrderHistory::WorkOrderActualStartTimeReached'}  = 'Workorder (ID=%s) hat begonnen.';
    $Lang->{'WorkOrderHistory::WorkOrderActualEndTimeReached'}    = 'Workorder (ID=%s) wurde beendet.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedStartTimeReachedWithWorkOrderID'} = 'Workorder (ID=%s) hat geplante Startzeit erreicht.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedEndTimeReachedWithWorkOrderID'}   = 'Workorder (ID=%s) hat geplante Endzeit erreicht.';
    $Lang->{'WorkOrderHistory::WorkOrderActualStartTimeReachedWithWorkOrderID'}  = 'Workorder (ID=%s) hat begonnen.';
    $Lang->{'WorkOrderHistory::WorkOrderActualEndTimeReachedWithWorkOrderID'}    = 'Workorder (ID=%s) wurde beendet.';

    # change states
    $Lang->{'requested'}        = 'Requested';
    $Lang->{'pending approval'} = 'Pending Approval';
    $Lang->{'rejected'}         = 'Rejected';
    $Lang->{'approved'}         = 'Approved';
    $Lang->{'in progress'}      = 'In Progress';
    $Lang->{'successful'}       = 'Successful';
    $Lang->{'failed'}           = 'Failed';
    $Lang->{'canceled'}         = 'Canceled';
    $Lang->{'retracted'}        = 'Retracted';

    # workorder states
    $Lang->{'created'}     = 'Created';
    $Lang->{'accepted'}    = 'Accepted';
    $Lang->{'ready'}       = 'Ready';
    $Lang->{'in progress'} = 'In Progress';
    $Lang->{'closed'}      = 'Closed';
    $Lang->{'canceled'}    = 'Canceled';

    # CIP matrix
    $Lang->{'Category'}                         = 'Kategorie';
    $Lang->{'Category <-> Impact <-> Priority'} = 'Kategorie <-> Auswirkung <-> Priorit�t';

    # workorder types
    $Lang->{'approval'}  = 'Genehmigung';
    $Lang->{'decision'}  = 'Entscheidung';
    $Lang->{'workorder'} = 'Workorder';
    $Lang->{'backout'}   = 'Backout Plan';
    $Lang->{'pir'}       = 'PIR (Post Implementation Review)';

    # Template types
    $Lang->{'TemplateType::ITSMChange'}      = 'Change';
    $Lang->{'TemplateType::ITSMWorkOrder'}   = 'Workorder';
    $Lang->{'TemplateType::CAB'}             = 'CAB';
    $Lang->{'TemplateType::ITSMCondition'}   = 'Condition';

    # objects that can be used in condition expressions and actions
    $Lang->{'ITSMChange'}    = 'Change';
    $Lang->{'ITSMWorkOrder'} = 'Workorder';

    # Overviews
    $Lang->{'Change Schedule'} = 'Change Schedule';

    return 1;
}

1;
