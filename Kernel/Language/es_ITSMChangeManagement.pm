# --
# Kernel/Language/es_ITSMChangeManagement.pm - the spanish translation of ITSMChangeManagement
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# Copyright (C) 2010 Leonardo Certuche <leonardo.certuche at itcon-ltda.com>
# --
# $Id: es_ITSMChangeManagement.pm,v 1.1 2010/02/10 17:03:17 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_ITSMChangeManagement;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    # misc
    $Lang->{'A change must have a title!'}          = 'Cada cambio debe tener un t�tulo';
    $Lang->{'as Template'}                          = 'como Plantilla';
    $Lang->{'Template Name'}                        = 'Nombre de la plantilla';
    $Lang->{'Templates'}                            = 'Plantillas';
    $Lang->{'A workorder must have a title!'}       = 'Cada Orden de Trabajo debe tener un t�tulo';
    $Lang->{'Clear'}                                = 'Limpiar campos';
    $Lang->{'Create a change from this ticket!'}    = 'Crear un cambio a partir de este ticket!';
    $Lang->{'Create Change'}                        = 'Crear un Cambio';
    $Lang->{'e.g.'}                                 = 'ej.';
    $Lang->{'Imperative::Save'}                     = 'Guardar';
    $Lang->{'New time'}                             = 'Nuevo intervalo de tiempo';
    $Lang->{'Requested (by customer) Date'}         = 'Fecha solicitada (por el cliente)';
    $Lang->{'The planned end time is invalid!'}     = 'La fecha de finalizaci�n planeada es inv�lida!';
    $Lang->{'The planned start time is invalid!'}   = 'La fecha de inicio planeada es inv�lida!';
    $Lang->{'The planned start time must be before the planned end time!'} = 'La fecha planeada de inicio debe ser anterior a la fecha planeada de finalizaci�n!';
    $Lang->{'The requested time is invalid!'}       = 'La fecha solicitada es inv�lida!';
    $Lang->{'Time type'}                            = 'Tipo de fecha';
    $Lang->{'Do you really want to delete this template?'} = 'Realmente desea eliminar esta plantilla?';
    $Lang->{'Change Advisory Board'}                = 'Comit�s de Cambio';
    $Lang->{'CAB'}                                  = 'XXCAB';

    # ITSM ChangeManagement icons
    $Lang->{'My Changes'}                           = 'Mis Cambios';
    $Lang->{'My Workorders'}                        = 'Mis �rdendes de Trabajo';
    $Lang->{'PIR (Post Implementation Review)'}     = 'Revisi�n Post Implementaci�n (PIR)';
    $Lang->{'PSA (Projected Service Availability)'} = 'Disponibilidad proyectada del servicio (PSA)';
    $Lang->{'My CABs'}                              = 'Mis Comit�s de Cambio (CABs)';
    $Lang->{'Change Overview'}                      = 'Vista de Cambios';
    $Lang->{'Template Overview'}                    = 'Vista de Plantillas';
    $Lang->{'Search Changes'}                       = 'Buscar Cambios';

    # Change menu
    $Lang->{'ITSM Change'}                           = 'Cambio';
    $Lang->{'ITSM Workorder'}                        = 'Orden de Trabajo';
    $Lang->{'ITSM Schedule'}                         = 'Agenda';
    $Lang->{'Involved Persons'}                      = 'Personas Involucradas';
    $Lang->{'Add Workorder'}                         = 'Adicionar Orden de Trabajo';
    $Lang->{'Template'}                              = 'Plantilla';
    $Lang->{'Move Time Slot'}                        = 'Mover periodo de tiempo';
    $Lang->{'Print the change'}                      = 'Imprimir el cambio';
    $Lang->{'Edit the change'}                       = 'Editar el cambio';
    $Lang->{'Change involved persons of the change'} = 'Cambiar las personas involucradas en el Cambio';
    $Lang->{'Add a workorder to the change'}         = 'Adicionar una Orden de Trabajo al Cambio';
    $Lang->{'Edit the conditions of the change'}     = 'Editar las condiciones del Cambio';
    $Lang->{'Link another object to the change'}     = 'Vincular un nuevo objeto al Cambio';
    $Lang->{'Save change as a template'}             = 'Guardar el Cambio como Plantilla';
    $Lang->{'Move all workorders in time'}           = 'Mover todas las Ordenes de Trabajo en el tiempo';
    $Lang->{'Current CAB'}                           = 'Comit� de Cambios Actual';
    $Lang->{'Add to CAB'}                            = 'Adicionar el Comit� de Cambios';
    $Lang->{'Add CAB Template'}                      = 'Adicionar Comit� a la Plantilla';
    $Lang->{'Add Workorder to'}                      = 'Adicionar Orden de Trabajo a';
    $Lang->{'Select Workorder Template'}             = 'Seleccionar Plantilla de Orden de Trabajo';
    $Lang->{'Select Change Template'}                = 'Seleccionar Plantilla de Cambio';
    $Lang->{'The planned time is invalid!'}          = 'El periodo de tiempo planeado es inv�lido!';

    # Workorder menu
    $Lang->{'Workorder'}                            = 'Orden de Trabajo';
    $Lang->{'Save workorder as a template'}         = 'Guardar Orden de Trabajo como Plantilla';
    $Lang->{'Link another object to the workorder'} = 'Vincular otro Objeto a la Orden de Trabajo';
    $Lang->{'Delete Workorder'}                     = 'Borrar Orden de Trabajo';
    $Lang->{'Edit the workorder'}                   = 'Editar la Orden de Trabajo';
    $Lang->{'Print the workorder'}                  = 'Imprimir la Orden de Trabajo';
    $Lang->{'Set the agent for the workorder'}      = 'Asignar Agente a la Orden de Trabajo';

    # Template menu
    $Lang->{'A template must have a name!'} = 'Toda plantilla debe tener un nombre!';

    # Change attributes as returned from ChangeGet(), or taken by ChangeUpdate()
    $Lang->{'ChangeAttribute::AccountedTime'}    = 'Tiempo Contabilizado';
    $Lang->{'ChangeAttribute::ActualEndTime'}    = 'Finalizaci�n Real';
    $Lang->{'ChangeAttribute::ActualStartTime'}  = 'Inicio Real';
    $Lang->{'ChangeAttribute::CABAgent'}         = 'Agente del CAB';
    $Lang->{'ChangeAttribute::CABAgents'}        = 'Agentes del CAB';
    $Lang->{'ChangeAttribute::CABCustomer'}      = 'Cliente del CAB';
    $Lang->{'ChangeAttribute::CABCustomers'}     = 'Clientes del CAB';
    $Lang->{'ChangeAttribute::Category'}         = 'Categoria';
    $Lang->{'ChangeAttribute::ChangeBuilder'}    = 'Constructor del Cambio';
    $Lang->{'ChangeAttribute::ChangeBy'}         = 'Modificado por';
    $Lang->{'ChangeAttribute::ChangeManager'}    = 'Administrador del Cambio';
    $Lang->{'ChangeAttribute::ChangeNumber'}     = 'Numero del Cambio';
    $Lang->{'ChangeAttribute::ChangeTime'}       = 'Fecha del Cambio';
    $Lang->{'ChangeAttribute::ChangeState'}      = 'Estado del Cambio';
    $Lang->{'ChangeAttribute::ChangeTitle'}      = 'Titulo del Cambio';
    $Lang->{'ChangeAttribute::CreateBy'}         = 'Creado por';
    $Lang->{'ChangeAttribute::CreateTime'}       = 'Fecha de Creaci�n';
    $Lang->{'ChangeAttribute::Description'}      = 'Descripci�n';
    $Lang->{'ChangeAttribute::Impact'}           = 'Impacto';
    $Lang->{'ChangeAttribute::Justification'}    = 'Justificaci�n';
    $Lang->{'ChangeAttribute::PlannedEffort'}    = 'Esfuerzo Planeado';
    $Lang->{'ChangeAttribute::PlannedEndTime'}   = 'Finalizaci�n Planeada';
    $Lang->{'ChangeAttribute::PlannedStartTime'} = 'Inicio Planeado';
    $Lang->{'ChangeAttribute::Priority'}         = 'Prioridad';
    $Lang->{'ChangeAttribute::RequestedTime'}    = 'Fecha Solicitada';

    # Workorder attributes as returned from WorkOrderGet(), or taken by WorkOrderUpdate()
    $Lang->{'WorkOrderAttribute::AccountedTime'}    = 'Tiempo Contabilizado';
    $Lang->{'WorkOrderAttribute::ActualEndTime'}    = 'Finalizaci�n Real';
    $Lang->{'WorkOrderAttribute::ActualStartTime'}  = 'Inicio Real';
    $Lang->{'WorkOrderAttribute::ChangeBy'}         = 'Modificada por';
    $Lang->{'WorkOrderAttribute::ChangeTime'}       = 'Fecha de la modificaci�n';
    $Lang->{'WorkOrderAttribute::CreateBy'}         = 'Creada por';
    $Lang->{'WorkOrderAttribute::CreateTime'}       = 'Fecha de Creaci�n';
    $Lang->{'WorkOrderAttribute::Instruction'}      = 'Instrucci�n';
    $Lang->{'WorkOrderAttribute::PlannedEffort'}    = 'Esfuerzo Planeado';
    $Lang->{'WorkOrderAttribute::PlannedEndTime'}   = 'Finalizaci�n Planeada';
    $Lang->{'WorkOrderAttribute::PlannedStartTime'} = 'Inicio Planeado';
    $Lang->{'WorkOrderAttribute::Report'}           = 'Reporte';
    $Lang->{'WorkOrderAttribute::WorkOrderAgent'}   = 'Agente de la Orden de Trabajo';
    $Lang->{'WorkOrderAttribute::WorkOrderNumber'}  = 'N�mero de la Orden de Trabajo';
    $Lang->{'WorkOrderAttribute::WorkOrderState'}   = 'Estado de la Orden de Trabajo';
    $Lang->{'WorkOrderAttribute::WorkOrderTitle'}   = 'T�tulo de la Orden de Trabajo';
    $Lang->{'WorkOrderAttribute::WorkOrderType'}    = 'Tipo de Orden de Trabajo';

    # Change history
    $Lang->{'ChangeHistory::ChangeAdd'}              = 'Nuevo Cambio (ID=%s)';
    $Lang->{'ChangeHistory::ChangeUpdate'}           = '%s: Nuevo: %s -> Antiguo: %s';
    $Lang->{'ChangeHistory::ChangeLinkAdd'}          = 'Vinculo a %s (ID=%s) adicionado';
    $Lang->{'ChangeHistory::ChangeLinkDelete'}       = 'Vinculo a %s (ID=%s) borrado';
    $Lang->{'ChangeHistory::ChangeCABUpdate'}        = '%s: Nuevo: %s -> Antiguo: %s';
    $Lang->{'ChangeHistory::ChangeCABDelete'}        = 'Comit� de Cambios Eliminado %s';
    $Lang->{'ChangeHistory::ChangeAttachmentAdd'}    = 'Nuevo Adjunto: %s';
    $Lang->{'ChangeHistory::ChangeAttachmentDelete'} = 'Borrar Adjunto %s';

    # workorder history
    $Lang->{'WorkOrderHistory::WorkOrderAdd'}              = 'Nueva Orden de Trabajo (ID=%s)';
    $Lang->{'WorkOrderHistory::WorkOrderUpdate'}           = '%s: Nueva: %s -> Antigua: %s';
    $Lang->{'WorkOrderHistory::WorkOrderLinkAdd'}          = 'Vinculo a %s (ID=%s) adicionado';
    $Lang->{'WorkOrderHistory::WorkOrderLinkDelete'}       = 'Vinculo a %s (ID=%s) borrado';
    $Lang->{'WorkOrderHistory::WorkOrderDelete'}           = 'Orden de Trabajo (ID=%s) borrada';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentAdd'}    = 'Nuevo adjunto para Orden de Trabajo: %s';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentDelete'} = 'Borrar adjunto de Orden de Trabajo: %s';

    # long workorder history
    $Lang->{'WorkOrderHistory::WorkOrderAddWithWorkOrderID'}              = 'Nueva Orden de Trabajo (ID=%s)';
    $Lang->{'WorkOrderHistory::WorkOrderUpdateWithWorkOrderID'}           = '(ID=%s) %s: Nueva: %s -> Antigua: %s';
    $Lang->{'WorkOrderHistory::WorkOrderLinkAddWithWorkOrderID'}          = '(ID=%s) Vinculo a %s (ID=%s) adicionado';
    $Lang->{'WorkOrderHistory::WorkOrderLinkDeleteWithWorkOrderID'}       = '(ID=%s) Vinculo a %s (ID=%s) borrado';
    $Lang->{'WorkOrderHistory::WorkOrderDeleteWithWorkOrderID'}           = 'Orden de Trabajo (ID=%s) borrada';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentAddWithWorkOrderID'}    = '(ID=%s) Nuevo adjunto para Orden de Trabajo: %s';
    $Lang->{'WorkOrderHistory::WorkOrderAttachmentDeleteWithWorkOrderID'} = '(ID=%s) Borrar adjunto de Orden de Trabajo: %s';

    # condition history
    $Lang->{'ChangeHistory::ConditionAdd'}       = '%s: %s';
    $Lang->{'ChangeHistory::ConditionAddID'}     = 'Nueva Condici�n (ID=%s)';
    $Lang->{'ChangeHistory::ConditionUpdate'}    = '%s (ID de la Condici�n=%s): Nuevo: %s -> Antiguo: %s';
    $Lang->{'ChangeHistory::ConditionDelete'}    = 'Codici�n (ID=%s) borrada';
    $Lang->{'ChangeHistory::ConditionDeleteAll'} = 'Todas las condiciones del cambio (ID=%s) borradas';

    # expression history
    $Lang->{'ChangeHistory::ExpressionAdd'}       = '%s: %s';
    $Lang->{'ChangeHistory::ExpressionAddID'}     = 'Nueva Expresi�n (ID=%s)';
    $Lang->{'ChangeHistory::ExpressionUpdate'}    = '%s (ID de la Expresi�n=%s): Nueva: %s -> Antigua: %s';
    $Lang->{'ChangeHistory::ExpressionDelete'}    = 'Expresi�n (ID=%s) borrada';
    $Lang->{'ChangeHistory::ExpressionDeleteAll'} = 'Todas las Expresiones de la Condici�n (ID=%s) borradas';

    # action history
    $Lang->{'ChangeHistory::ActionAdd'}       = '%s: %s';
    $Lang->{'ChangeHistory::ActionAddID'}     = 'Nueva Acci�n (ID=%s)';
    $Lang->{'ChangeHistory::ActionUpdate'}    = '%s (ID de la Acci�n=%s): Nueva: %s -> Antigua: %s';
    $Lang->{'ChangeHistory::ActionDelete'}    = 'Acci�n (ID=%s) borrada';
    $Lang->{'ChangeHistory::ActionDeleteAll'} = 'Todas las Acciones de la Condici�n (ID=%s) borradas';
    $Lang->{'ChangeHistory::ActionExecute'}   = 'Acci�n (ID=%s) ejecutada: %s';
    $Lang->{'ActionExecute::successfully'}    = 'Con �xito';
    $Lang->{'ActionExecute::unsuccessfully'}  = 'Sin �xito';

    # history for time events
    $Lang->{'ChangeHistory::ChangePlannedStartTimeReached'}                      = 'El Cambio (ID=%s) ha alcanzado su fecha de inicio planeada.';
    $Lang->{'ChangeHistory::ChangePlannedEndTimeReached'}                        = 'El Cambio (ID=%s) ha alcanzado su fecha de finalizaci�n planeada.';
    $Lang->{'ChangeHistory::ChangeActualStartTimeReached'}                       = 'El Cambio (ID=%s) ha alcanzado su fecha de inicio real planeada.';
    $Lang->{'ChangeHistory::ChangeActualEndTimeReached'}                         = 'El Cambio (ID=%s) ha alcanzado su fecha de finalizaci�n real planeada.';
    $Lang->{'ChangeHistory::ChangeRequestedTimeReached'}                         = 'El Cambio (ID=%s) ha alcanzado su fecha esperada de ocurrencia.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedStartTimeReached'}                = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de inicio planeada.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedEndTimeReached'}                  = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de finalizaci�n planeada.';
    $Lang->{'WorkOrderHistory::WorkOrderActualStartTimeReached'}                 = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de inicio real.';
    $Lang->{'WorkOrderHistory::WorkOrderActualEndTimeReached'}                   = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de finalizaci�n real.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedStartTimeReachedWithWorkOrderID'} = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de inicio planeada.';
    $Lang->{'WorkOrderHistory::WorkOrderPlannedEndTimeReachedWithWorkOrderID'}   = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de finalizaci�n planeada.';
    $Lang->{'WorkOrderHistory::WorkOrderActualStartTimeReachedWithWorkOrderID'}  = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de inicio real.';
    $Lang->{'WorkOrderHistory::WorkOrderActualEndTimeReachedWithWorkOrderID'}    = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de finalizaci�n real.';

    # change states
    $Lang->{'requested'}        = 'Solicitado';
    $Lang->{'pending approval'} = 'Pendiente por Aprobaci�n';
    $Lang->{'pending pir'}      = 'Pendiente de Revisi�n Post-Implementaci�n';
    $Lang->{'rejected'}         = 'Rechazado';
    $Lang->{'approved'}         = 'Aprobado';
    $Lang->{'in progress'}      = 'En Progreso';
    $Lang->{'successful'}       = 'Exitoso';
    $Lang->{'failed'}           = 'Fallido';
    $Lang->{'canceled'}         = 'Cancelado';
    $Lang->{'retracted'}        = 'Devuelto';

    # workorder states
    $Lang->{'created'}     = 'Creada';
    $Lang->{'accepted'}    = 'Aceptada';
    $Lang->{'ready'}       = 'Lista';
    $Lang->{'in progress'} = 'En Progreso';
    $Lang->{'closed'}      = 'Cerrada';
    $Lang->{'canceled'}    = 'Cancelada';

    # Admin Interface
    $Lang->{'Category <-> Impact <-> Priority'}      = 'Categoria <-> Impacto <-> Prioridad';
    $Lang->{'Notification (ITSM Change Management)'} = 'Notificaciones de Cambios';

    # Admin StateMachine
    $Lang->{'Add a state transition'}               = 'Adicionar un estado de transici�n';
    $Lang->{'Add a new state transition for'}       = 'Adicionar un nuevo estado de transici�n para';
    $Lang->{'Edit a state transition for'}          = 'Editar un estado de transici�n para';
    $Lang->{'Overview over state transitions for'}  = 'Vista de las transiciones de estado para';
    $Lang->{'Object Name'}                          = 'Nombre del Objeto';
    $Lang->{'Please select first a catalog class!'} = 'Por favor seleccione primero una clase de cat�logo';

    # workorder types
    $Lang->{'approval'}  = 'Aprobaci�n';
    $Lang->{'decision'}  = 'Decisi�n';
    $Lang->{'workorder'} = 'Orden de trabajo';
    $Lang->{'backout'}   = 'Plan de Vuelta Atr�s';
    $Lang->{'pir'}       = 'Revisi�n Post-Implementaci�n';

    # Template types
    $Lang->{'TemplateType::ITSMChange'}    = 'Cambio';
    $Lang->{'TemplateType::ITSMWorkOrder'} = 'Orden de Trabajo';
    $Lang->{'TemplateType::CAB'}           = 'Comit� de Aprobaci�n de Cambios';
    $Lang->{'TemplateType::ITSMCondition'} = 'Condici�n';

    # objects that can be used in condition expressions and actions
    $Lang->{'ITSMChange'}    = 'Cambio';
    $Lang->{'ITSMWorkOrder'} = 'Orden de Trabajo';

    # Overviews
    $Lang->{'Change Schedule'} = 'Cambiar Programaci�n';

    # Workorder delete
    $Lang->{'Do you really want to delete this workorder?'} = 'Realmente desea borrar esta orden de trabajo';
    $Lang->{'You can not delete this Workorder. It is used in at least one Condition!'} = 'No es posible borrar esta orden de trabajo pues est� siendo usada en al menos una Condici�n';
    $Lang->{'This Workorder is used in the following Condition(s)'} = 'Esta orden de trabajo es usada en las siguiente(s) condicion(es)';

    # Take workorder
    $Lang->{'Imperative::Take Workorder'}                 = 'Tomar Orden de Trabajo';
    $Lang->{'Take Workorder'}                             = 'Tomar Orden de Trabajo';
    $Lang->{'Take the workorder'}                         = 'Tomar La Orden de Trabajo';
    $Lang->{'Current Agent'}                              = 'Agente actual';
    $Lang->{'Do you really want to take this workorder?'} = 'Realmente quiere tomar esta Orden de Trabajo?';

    # Condition Overview and Edit
    $Lang->{'Condition'}                                = 'Condici�n';
    $Lang->{'Conditions'}                               = 'Condiciones';
    $Lang->{'Expression'}                               = 'Expresi�n';
    $Lang->{'Expressions'}                              = 'Expresiones';
    $Lang->{'Action'}                                   = 'Acci�n';
    $Lang->{'Actions'}                                  = 'Acciones';
    $Lang->{'Matching'}                                 = 'Coincidentes';
    $Lang->{'Conditions and Actions'}                   = 'Condiciones y Acciones';
    $Lang->{'Add new condition and action pair'}        = 'Adicionar nuevo par condici�n-acci�n';
    $Lang->{'A condition must have a name!'}            = 'Cada condici�n debe tener un nombre!';
    $Lang->{'Condition Edit'}                           = 'Editar Condici�n';
    $Lang->{'Add new expression'}                       = 'Adicionar nueva expresi�n';
    $Lang->{'Add new action'}                           = 'Adicionar nueva acci�n';
    $Lang->{'Any expression'}                           = 'Cualquier expresi�n';
    $Lang->{'All expressions'}                          = 'Todas las expresiones';
    $Lang->{'ITSMCondition::Selector::any'}             = 'Cualquiera';
    $Lang->{'ITSMCondition::Selector::all'}             = 'Todo';
    $Lang->{'ITSMCondition::Operator::is'}              = 'es';
    $Lang->{'ITSMCondition::Operator::is not'}          = 'no es';
    $Lang->{'ITSMCondition::Operator::is empty'}        = 'est� vac�a';
    $Lang->{'ITSMCondition::Operator::is not empty'}    = 'no est� vac�a';
    $Lang->{'ITSMCondition::Operator::is greater than'} = 'es m�s grande que';
    $Lang->{'ITSMCondition::Operator::is less than'}    = 'es menor que';
    $Lang->{'ITSMCondition::Operator::is before'}       = 'est� antes';
    $Lang->{'ITSMCondition::Operator::is after'}        = 'est� despu�s';
    $Lang->{'ITSMCondition::Operator::contains'}        = 'contiene';
    $Lang->{'ITSMCondition::Operator::not contains'}    = 'no contiene';
    $Lang->{'ITSMCondition::Operator::begins with'}     = 'comienza con';
    $Lang->{'ITSMCondition::Operator::ends with'}       = 'finaliza con';
    $Lang->{'ITSMCondition::Operator::set'}             = 'configurada';
    $Lang->{'ITSMCondition::Operator::lock'}            = 'bloqueada';

    # Change Zoom
    $Lang->{'Change Initiator(s)'} = 'Iniciador(es) del cambios';

    # AgentITSMChangePrint
    $Lang->{'Linked Objects'} = 'Objetos Vinculados';
    $Lang->{'Full-Text Search in Change and Workorder'} = 'B�squeda de texto completo en un Cambio o una Orden de Trabajo';

    # AgentITSMChangeSearch
    $Lang->{'No XXX settings'} = "No hay configuraciones '%s' ";

    return 1;
}

1;
