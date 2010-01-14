# --
# Kernel/Language/de_ITSMChangeManagement.pm - the german translation of ITSMChangeManagement
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: de_ITSMChangeManagement.pm,v 1.16 2010/01/14 15:23:55 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMChangeManagement;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.16 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'A change must have a title!'}        = 'Ein Change ben�tigt einen Titel!';
    $Lang->{'A workorder must have a title!'}     = 'Eine Workorder ben�tigt einen Titel!';
    $Lang->{'Add Change'}                         = 'Change hinzuf�gen';
    $Lang->{'The planned start time is invalid!'} = 'Der geplante Startzeitpunk ist ung�ltig!';
    $Lang->{'The planned end time is invalid!'}   = 'Der geplante Endzeitpunkt ist ung�ltig!';
    $Lang->{'The planned start time must be before the planned end time!'}
        = 'Der geplante Start muss vor dem geplanten Ende liegen!';
    $Lang->{'Requested (by customer) Date'}       = 'Wunschtermin (des Kunden)';

    # Change menu
    $Lang->{'ITSM Change'} = 'Change';

    # Change history
    $Lang->{'ChangeHistory::ChangeAdd'}              = 'Neuer Change (ID=%s)';
    $Lang->{'ChangeHistory::ChangeUpdate'}           = '%s: Neu: %s -> Alt: %s';
    $Lang->{'ChangeHistory::ChangeLinkAdd'}          = 'Link zu %s (ID=%s) hinzugef�gt';
    $Lang->{'ChangeHistory::ChangeLinkDelete'}       = 'Link zu %s (ID=%s) gel�scht';
    $Lang->{'ChangeHistory::ChangeCABUpdate'}        = 'CAB %s';
    $Lang->{'ChangeHistory::ChangeCABDelete'}        = 'CAB gel�scht %s';
    $Lang->{'ChangeHistory::ChangeAttachmentAdd'}    = 'Neuer Anhang: %s';
    $Lang->{'ChangeHistory::ChangeAttachmentDelete'} = 'Anhang gel�scht: %s';

    # WorkOrder history
    $Lang->{'WorkOrderHistory::WorkOrderAdd'}              = 'Neue Workorder (ID=%s)';
    $Lang->{'WorkOrderHistory::WorkOrderUpdate'}           = '%s: Neu: %s -> Alt: %s';
    $Lang->{'WorkOrderHistory::WorkOrderLinkAdd'}          = 'Link zu %s (ID=%s) hinzugef�gt';
    $Lang->{'WorkOrderHistory::WorkOrderLinkDelete'}       = 'Link to %s (ID=%s) gel�scht';
    $Lang->{'WorkOrderHistory::WorkOrderDelete'}           = 'Workorder (ID=%s) gel�scht';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentAdd'}    = 'Neuer Anhang f�r Workorder: %s';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentDelete'} = 'Anhang von Workorder gel�scht: %s';

    # long WorkOrder history
    $Lang->{'WorkOrderHistory::WorkOrderAddWithWorkorderID'}              = 'Neue Workorder (ID=%s)';
    $Lang->{'WorkOrderHistory::WorkOrderUpdateWithWorkorderID'}           = '(ID=%s) %s: Neu: %s -> Alt: %s';
    $Lang->{'WorkOrderHistory::WorkOrderLinkAddWithWorkorderID'}          = '(ID=%s) Link zu %s (ID=%s) hinzugef�gt';
    $Lang->{'WorkOrderHistory::WorkOrderLinkDeleteWithWorkorderID'}       = '(ID=%s) Link to %s (ID=%s) gel�scht';
    $Lang->{'WorkOrderHistory::WorkOrderDeleteWithWorkorderID'}           = 'Workorder (ID=%s) gel�scht';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentAddWithWorkorderID'}    = '(ID=%s) Neuer Anhang f�r Workorder: %s';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentDeleteWithWorkorderID'} = '(ID=%s) Anhang von Workorder gel�scht: %s';

    # CIP matrix
    $Lang->{'Category'}                         = 'Kategorie';
    $Lang->{'Category <-> Impact <-> Priority'} = 'Kategorie <-> Auswirkung <-> Priorit�t';

    # WorkOrder types
    $Lang->{'approval'}  = 'Genehmigung';
    $Lang->{'decision'}  = 'Entscheidung';
    $Lang->{'workorder'} = 'Arbeitsanweisung';
    $Lang->{'backout'}   = 'Alternative Arbeitsanweisung';
    $Lang->{'pir'}       = 'PIR (nachgelagerte QS)';

    # Change overviews
    $Lang->{'Small'}   = 'Klein';
    $Lang->{'Medium'}  = 'Mittel';
    $Lang->{'Preview'} = 'Vorschau';

    return 1;
}

1;
