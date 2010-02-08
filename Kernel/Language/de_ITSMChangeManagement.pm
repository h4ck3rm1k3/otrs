# --
# Kernel/Language/de_ITSMChangeManagement.pm - the german translation of ITSMChangeManagement
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: de_ITSMChangeManagement.pm,v 1.65 2010/02/08 11:45:09 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMChangeManagement;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.65 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    # misc
    $Lang->{'A change must have a title!'}          = 'Ein Change ben�tigt einen Titel!';
    $Lang->{'A workorder must have a title!'}       = 'Eine Workorder ben�tigt einen Titel!';
    $Lang->{'Create Change'}                        = 'Change erstellen';
    $Lang->{'Create a change from this ticket!'}    = 'Einen Change aus diesem Ticket erstellen!';
    $Lang->{'The planned start time is invalid!'}   = 'Die geplante Startzeit ist ung�ltig!';
    $Lang->{'The planned end time is invalid!'}     = 'Die geplante Endzeit ist ung�ltig!';
    $Lang->{'The planned start time must be before the planned end time!'}
        = 'Der geplante Start muss vor dem geplanten Ende liegen!';
    $Lang->{'The requested time is invalid!'}       = 'Die angegebene Zeit ist ung�ltig!';
    $Lang->{'New time'}                             = 'Neue Zeit';
    $Lang->{'Time type'}                            = 'Zeit-Typ';
    $Lang->{'Requested (by customer) Date'}         = 'Wunschtermin (des Kunden)';
    $Lang->{'Imperative::Save'}                     = 'Speichere';
    $Lang->{'as Template'}                          = 'als Vorlage';
    $Lang->{'e.g.'}                                 = 'z. B.';

    # ITSM ChangeManagement icons
    $Lang->{'My Changes'}                           = 'Meine Changes';
    $Lang->{'My Workorders'}                        = 'Meine Workorders';
    $Lang->{'PIR (Post Implementation Review)'}     = 'PIR (Post Implementation Review)';
    $Lang->{'PSA (Projected Service Availability)'} = 'PSA (Projected Service Availability)';
    $Lang->{'My CABs'}                              = 'Meine CABs';
    $Lang->{'Change Overview'}                      = 'Change �bersicht';
    $Lang->{'Template Overview'}                    = 'Template �bersicht';
    $Lang->{'Search Changes'}                       = 'Suche Changes';

    # Change menu
    $Lang->{'ITSM Change'}                           = 'Change';
    $Lang->{'ITSM Workorder'}                        = 'Workorder';
    $Lang->{'ITSM Schedule'}                         = 'Schedule';
    $Lang->{'Involved Persons'}                      = 'Beteiligte Personen';
    $Lang->{'Add Workorder'}                         = 'Workorder hinzuf�gen';
    $Lang->{'Move Time Slot'}                        = 'Verschiebe Timeslot';
    $Lang->{'Print the change'}                      = 'Diesen Change drucken';
    $Lang->{'Edit the change'}                       = 'Diesen Change bearbeiten';
    $Lang->{'Change involved persons of the change'} = 'Bearbeite beteiligte Personen dieses Changes';
    $Lang->{'Add a workorder to the change'}         = 'F�ge eine Workorder zu diesem Change hinzu';
    $Lang->{'Edit the conditions of the change'}     = 'Bearbeite die Conditions dieses Changes';
    $Lang->{'Link another object to the change'}     = 'Verkn�pfe ein anderes Objekt mit diesem Change';
    $Lang->{'Save change as a template'}             = 'Speichere diesen Change als Template';
    $Lang->{'Move all workorders in time'}           = 'Verschiebe alle Workorders um eine neue zeitliche Differenz';
    $Lang->{'Current CAB'}                           = 'Aktuelles CAB';
    $Lang->{'Add to CAB'}                            = 'Zum CAB hinzuf�gen';
    $Lang->{'Add CAB Template'}                      = 'Ein CAB-Template hinzuf�gen';
    $Lang->{'Add Workorder to'}                      = 'Workorder hinzuf�gen zu';
    $Lang->{'Select Workorder Template'}             = 'Workorder-Template ausw�hlen';
    $Lang->{'Select Change Template'}                = 'Change-Template ausw�hlen';
    $Lang->{'The planned time is invalid!'}          = 'Der geplante Zeitraum ist ung�ltig!';

    # Workorder menu
    $Lang->{'Save workorder as a template'}         = 'Speichere diese Workorder als Template';
    $Lang->{'Link another object to the workorder'} = 'Verkn�pfe ein anderes Objekt mit dieser Workorder';
    $Lang->{'Delete Workorder'}                     = 'Diese Workorder l�schen';
    $Lang->{'Edit the workorder'}                   = 'Diese Workorder bearbeiten';
    $Lang->{'Print the workorder'}                  = 'Diese Workorder drucken';
    $Lang->{'Set the agent for the workorder'}      = 'Einen Agenten f�r diese Workorder ausw�hlen';

    # Template menu
    $Lang->{'A template must have a name!'} = 'Ein Template ben�tigt einen Namen!';

    # Change attributes as returned from ChangeGet(), or taken by ChangeUpdate()
    $Lang->{'ChangeAttribute::AccountedTime'}    = 'Ben�tigte Zeit';
    $Lang->{'ChangeAttribute::ActualEndTime'}    = 'Tats�chliches Ende';
    $Lang->{'ChangeAttribute::ActualStartTime'}  = 'Tats�chlicher Start';
    $Lang->{'ChangeAttribute::CABAgent'}         = 'CAB Agent';
    $Lang->{'ChangeAttribute::CABAgents'}        = 'CAB Agents';
    $Lang->{'ChangeAttribute::CABCustomer'}      = 'CAB Kunde';
    $Lang->{'ChangeAttribute::CABCustomers'}     = 'CAB Kunden';
    $Lang->{'ChangeAttribute::Category'}         = 'Kategorie';
    $Lang->{'ChangeAttribute::ChangeBuilder'}    = 'Change Builder';
    $Lang->{'ChangeAttribute::ChangeBy'}         = 'Ge�ndert von';
    $Lang->{'ChangeAttribute::ChangeManager'}    = 'Change Manager';
    $Lang->{'ChangeAttribute::ChangeNumber'}     = 'Change Nummer';
    $Lang->{'ChangeAttribute::ChangeTime'}       = 'Ge�ndert';
    $Lang->{'ChangeAttribute::ChangeState'}      = 'Change Status';
    $Lang->{'ChangeAttribute::ChangeTitle'}      = 'Change Titel';
    $Lang->{'ChangeAttribute::CreateBy'}         = 'Erstellt von';
    $Lang->{'ChangeAttribute::CreateTime'}       = 'Erstellt';
    $Lang->{'ChangeAttribute::Description'}      = 'Beschreibung';
    $Lang->{'ChangeAttribute::Impact'}           = 'Auswirkung';
    $Lang->{'ChangeAttribute::Justification'}    = 'Begr�ndung';
    $Lang->{'ChangeAttribute::PlannedEffort'}    = 'Geplanter Aufwand';
    $Lang->{'ChangeAttribute::PlannedEndTime'}   = 'Geplantes Ende';
    $Lang->{'ChangeAttribute::PlannedStartTime'} = 'Geplanter Start';
    $Lang->{'ChangeAttribute::Priority'}         = 'Priorit�t';
    $Lang->{'ChangeAttribute::RequestedTime'}    = 'Wunschtermin';

    # Workorder attributes as returned from WorkOrderGet(), or taken by WorkOrderUpdate()
    $Lang->{'WorkOrderAttribute::AccountedTime'}    = 'Ben�tigte Zeit';
    $Lang->{'WorkOrderAttribute::ActualEndTime'}    = 'Tats�chliches Ende';
    $Lang->{'WorkOrderAttribute::ActualStartTime'}  = 'Tats�chlicher Start';
    $Lang->{'WorkOrderAttribute::ChangeBy'}         = 'Ge�ndert von';
    $Lang->{'WorkOrderAttribute::ChangeTime'}       = 'Ge�ndert von';
    $Lang->{'WorkOrderAttribute::CreateBy'}         = 'Erstellt von';
    $Lang->{'WorkOrderAttribute::CreateTime'}       = 'Erstellt';
    $Lang->{'WorkOrderAttribute::Instruction'}      = 'Anweisung';
    $Lang->{'WorkOrderAttribute::PlannedEffort'}    = 'Geplanter Aufwand';
    $Lang->{'WorkOrderAttribute::PlannedEndTime'}   = 'Geplantes Ende';
    $Lang->{'WorkOrderAttribute::PlannedStartTime'} = 'Geplanter Start';
    $Lang->{'WorkOrderAttribute::Report'}           = 'Bericht';
    $Lang->{'WorkOrderAttribute::WorkOrderAgent'}   = 'Workorder Agent';
    $Lang->{'WorkOrderAttribute::WorkOrderNumber'}  = 'Workorder Nummer';
    $Lang->{'WorkOrderAttribute::WorkOrderState'}   = 'Workorder Status';
    $Lang->{'WorkOrderAttribute::WorkOrderTitle'}   = 'Workorder Titel';
    $Lang->{'WorkOrderAttribute::WorkOrderType'}    = 'Workorder Typ';

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
    $Lang->{'ChangeHistory::ConditionUpdate'}    = '%s (Condition ID=%s): Neu: %s -> Old: %s';
    $Lang->{'ChangeHistory::ConditionDelete'}    = 'Condition (ID=%s) gel�scht';
    $Lang->{'ChangeHistory::ConditionDeleteAll'} = 'Alle Conditions von Change (ID=%s) gel�scht';

    # expression history
    $Lang->{'ChangeHistory::ExpressionAdd'}       = '%s: %s';
    $Lang->{'ChangeHistory::ExpressionAddID'}     = 'Neue Expression (ID=%s)';
    $Lang->{'ChangeHistory::ExpressionUpdate'}    = '%s (Expression ID=%s): Neu: %s -> Old: %s';
    $Lang->{'ChangeHistory::ExpressionDelete'}    = 'Expression (ID=%s) gel�scht';
    $Lang->{'ChangeHistory::ExpressionDeleteAll'} = 'Alle Expressions von Condition (ID=%s) gel�scht';

    # action history
    $Lang->{'ChangeHistory::ActionAdd'}       = '%s: %s';
    $Lang->{'ChangeHistory::ActionAddID'}     = 'Neue Action (ID=%s)';
    $Lang->{'ChangeHistory::ActionUpdate'}    = '%s (Action ID=%s): Neu: %s -> Old: %s';
    $Lang->{'ChangeHistory::ActionDelete'}    = 'Action (ID=%s) gel�scht';
    $Lang->{'ChangeHistory::ActionDeleteAll'} = 'Alle Actions von Condition (ID=%s) gel�scht';
    $Lang->{'ChangeHistory::ActionExecute'}   = 'Action (ID=%s) ausgef�hrt: %s';
    $Lang->{'ActionExecute::successfully'}    = 'erfolgreich';
    $Lang->{'ActionExecute::unsuccessfully'}  = 'nicht erfolgreich';

    # history for time events
    $Lang->{'ChangeHistory::ChangePlannedStartTimeReached'}                      = 'Change (ID=%s) hat geplante Startzeit erreicht.';
    $Lang->{'ChangeHistory::ChangePlannedEndTimeReached'}                        = 'Change (ID=%s) hat geplante Endzeit erreicht.';
    $Lang->{'ChangeHistory::ChangeActualStartTimeReached'}                       = 'Change (ID=%s) hat begonnen.';
    $Lang->{'ChangeHistory::ChangeActualEndTimeReached'}                         = 'Change (ID=%s) wurde beendet.';
    $Lang->{'ChangeHistory::ChangeRequestedTimeReached'}                         = 'Change (ID=%s) hat gew�nschte Endzeit erreicht.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedStartTimeReached'}                = 'Workorder (ID=%s) hat geplante Startzeit erreicht.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedEndTimeReached'}                  = 'Workorder (ID=%s) hat geplante Endzeit erreicht.';
    $Lang->{'WorkOrderHistory::WorkOrderActualStartTimeReached'}                 = 'Workorder (ID=%s) hat begonnen.';
    $Lang->{'WorkOrderHistory::WorkOrderActualEndTimeReached'}                   = 'Workorder (ID=%s) wurde beendet.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedStartTimeReachedWithWorkOrderID'} = 'Workorder (ID=%s) hat geplante Startzeit erreicht.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedEndTimeReachedWithWorkOrderID'}   = 'Workorder (ID=%s) hat geplante Endzeit erreicht.';
    $Lang->{'WorkOrderHistory::WorkOrderActualStartTimeReachedWithWorkOrderID'}  = 'Workorder (ID=%s) hat begonnen.';
    $Lang->{'WorkOrderHistory::WorkOrderActualEndTimeReachedWithWorkOrderID'}    = 'Workorder (ID=%s) wurde beendet.';

    # change states
    $Lang->{'requested'}        = 'Requested';
    $Lang->{'pending approval'} = 'Pending Approval';
    $Lang->{'pending pir'}      = 'Pending PIR';
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

    # Admin Interface
    $Lang->{'Category <-> Impact <-> Priority'}      = 'Kategorie <-> Auswirkung <-> Priorit�t';
    $Lang->{'Notification (ITSM Change Management)'} = 'Benachrichtigung (ITSM Change Management)';

    # Admin StateMachine
    $Lang->{'Add a state transition'}               = 'Hinzuf�gen eines Status-�bergangs';
    $Lang->{'Add a new state transition for'}       = 'Hinzuf�gen eines neuen Status-�bergangs f�r';
    $Lang->{'Edit a state transition for'}          = 'Bearbeiten eines Status-�bergangs f�r';
    $Lang->{'Overview over state transitions for'}  = '�bersicht �ber Status-�berg�nge f�r';
    $Lang->{'Object Name'}                          = 'Objekt Name';
    $Lang->{'Please select first a catalog class!'} = 'Bitte w�hlen Sie zuerst eine Katalog Klasse aus!';

    # workorder types
    $Lang->{'approval'}  = 'Genehmigung';
    $Lang->{'decision'}  = 'Entscheidung';
    $Lang->{'workorder'} = 'Workorder';
    $Lang->{'backout'}   = 'Backout Plan';
    $Lang->{'pir'}       = 'PIR (Post Implementation Review)';

    # Template types
    $Lang->{'TemplateType::ITSMChange'}    = 'Change';
    $Lang->{'TemplateType::ITSMWorkOrder'} = 'Workorder';
    $Lang->{'TemplateType::CAB'}           = 'CAB';
    $Lang->{'TemplateType::ITSMCondition'} = 'Condition';

    # objects that can be used in condition expressions and actions
    $Lang->{'ITSMChange'}    = 'Change';
    $Lang->{'ITSMWorkOrder'} = 'Workorder';

    # Overviews
    $Lang->{'Change Schedule'} = 'Change Schedule';

    # Workorder delete
    $Lang->{'Do you really want to delete this workorder?'} = 'M�chten Sie diese Workorder wirklich l�schen?';
    $Lang->{'You can not delete this Workorder. It is used in at least one Condition!'} = 'Sie k�nnen diese Workorder nicht l�schen. Sie wird in mindestens einer Condition verwendet!';
    $Lang->{'This Workorder is used in the following Condition(s)'} = 'Diese Workorder findet Verwendung in den folgenden Condition(s)';

    # take workorder
    $Lang->{'Imperative::Take Workorder'}                 = '�bernehmen von Workorder';
    $Lang->{'Take Workorder'}                             = 'Workorder �bernehmen';
    $Lang->{'Take the workorder'}                         = 'Diese Workorder �bernehmen';
    $Lang->{'Current Agent'}                              = 'Aktueller Agent';
    $Lang->{'Do you really want to take this workorder?'} = 'Wollen sie diese Workorder wirklich �bernehmen?';

    # Condition Overview
    $Lang->{'Conditions and Actions'}            = 'Conditions und Actions';
    $Lang->{'Add new condition and action pair'} = 'F�ge ein neues Condition und Action Paar hinzu';

    # Condition Edit
    $Lang->{'A condition must have a name!'} = 'Eine Condition ben�tigt einen Namen!';
    $Lang->{'Condition Edit'}                = 'Condition bearbeiten';
    $Lang->{'Add new expression'}            = 'F�ge eine neue Expression hinzu';
    $Lang->{'Add new action'}                = 'F�ge eine neue Action hinzu';
    $Lang->{'Any expression'}                = 'Beliebige Expression';
    $Lang->{'All expressions'}               = 'Alle Expressions';
    $Lang->{'ITSMCondition::Selector::any'}  = 'beliebige';
    $Lang->{'ITSMCondition::Selector::all'}  = 'alle';

    # Change Zoom
    $Lang->{'Change Initiator(s)'} = 'Change Initiator(s)';

    # AgentITSMChangePrint
    $Lang->{'Linked Objects'} = 'Verkn�pfte Objekte';
    $Lang->{'Full-Text Search in Change and Workorder'} =
        'Volltextsuche in Change and Workorder';

    # AgentITSMChangeSearch
    $Lang->{'No XXX settings'} = q{Keine '%s' Auswahl};

    return 1;
}

1;
