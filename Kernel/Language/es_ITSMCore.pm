# --
# Kernel/Language/es_ITSMCore.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: es_ITSMCore.pm,v 1.18 2011/03/03 18:41:54 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_ITSMCore;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAITSMCore
    $Self->{Translation}->{'Alternative to'} = 'Alterantiva a';
    $Self->{Translation}->{'Availability'} = 'Disponibilidad';
    $Self->{Translation}->{'Back End'} = 'Backend';
    $Self->{Translation}->{'Connected to'} = 'Conectado a';
    $Self->{Translation}->{'Current State'} = 'Estado Actual';
    $Self->{Translation}->{'Demonstration'} = 'Demostraci�n';
    $Self->{Translation}->{'Depends on'} = 'Depende en';
    $Self->{Translation}->{'End User Service'} = 'Servicio de Usuario Final';
    $Self->{Translation}->{'Errors'} = 'Errores';
    $Self->{Translation}->{'Front End'} = 'Frontend';
    $Self->{Translation}->{'IT Management'} = 'Administraci�n de TI';
    $Self->{Translation}->{'IT Operational'} = 'Operaci�n de TI';
    $Self->{Translation}->{'Impact'} = 'Impacto';
    $Self->{Translation}->{'Incident State'} = 'Estado del Incidente';
    $Self->{Translation}->{'Includes'} = 'Incluye';
    $Self->{Translation}->{'Other'} = 'Otro';
    $Self->{Translation}->{'Part of'} = 'Parte de';
    $Self->{Translation}->{'Project'} = 'Proyecto';
    $Self->{Translation}->{'Recovery Time'} = 'Tiempo de Recuperaci�n';
    $Self->{Translation}->{'Relevant to'} = 'Relevante a';
    $Self->{Translation}->{'Reporting'} = 'Informes';
    $Self->{Translation}->{'Required for'} = 'Requerido para';
    $Self->{Translation}->{'Resolution Rate'} = 'Tasa de Resoluci�n';
    $Self->{Translation}->{'Response Time'} = 'Tiempo de Respuesta';
    $Self->{Translation}->{'SLA Overview'} = 'Descripci�n de SLA';
    $Self->{Translation}->{'Service Overview'} = 'Descripci�n de Servicios';
    $Self->{Translation}->{'Service-Area'} = 'Area-Servicio';
    $Self->{Translation}->{'Training'} = 'Entrenamiento';
    $Self->{Translation}->{'Transactions'} = 'Transacciones';
    $Self->{Translation}->{'Underpinning Contract'} = '';
    $Self->{Translation}->{'allocation'} = 'Asignar';

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'Urgencia <-> Impacto <-> Prioridad';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality <-> Impact.'} = 'Administrar la prioridad resultante al combinar Urgencia <-> Impacto.';
    $Self->{Translation}->{'Priority allocation'} = 'Asignar prioridad';

    # Template: AdminSLA
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'Tiempo M�nimo entre Incidentes';

    # Template: AdminService
    $Self->{Translation}->{'Criticality'} = 'Urgencia';

    # Template: AgentITSMCustomerSearch

    # Template: AgentITSMSLA

    # Template: AgentITSMSLAPrint
    $Self->{Translation}->{'SLA-Info'} = '';
    $Self->{Translation}->{'Last changed'} = '';
    $Self->{Translation}->{'Last changed by'} = '';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = '';
    $Self->{Translation}->{'Show or hide the content.'} = '';
    $Self->{Translation}->{'Associated Services'} = 'Servicios Asociados';

    # Template: AgentITSMService

    # Template: AgentITSMServicePrint
    $Self->{Translation}->{'Service-Info'} = '';
    $Self->{Translation}->{'Current Incident State'} = 'Estado de Incidente Actual';
    $Self->{Translation}->{'Associated SLAs'} = 'SLAs Asociados';

    # Template: AgentITSMServiceZoom
    $Self->{Translation}->{'Service Information'} = '';
    $Self->{Translation}->{'Current incident state'} = 'Estado ctual del incidente';

    # SysConfig
    $Self->{Translation}->{'Frontend module registration for the AdminITSMCIPAllocate configuration in the admin area.'} = 'Registro del m�dulo frontend para la configuraci�n de AdminITSMCIPAllocate en el �rea de administrar.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} = 'Registro del m�dulo frontend para el objeto AgentITSMSLA en la interfaz del agente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} = 'Registro del m�dulo frontend para el objeto AgentITSMSLAPrint en la interfaz del agente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} = 'Registro del m�dulo frontend para el objeto AgentITSMSLAZoom en la interfaz del agente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMService object in the agent interface.'} = 'Registro del m�dulo frontend para el objeto AgentITSMService en la interfaz del agente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} = 'Registro del m�dulo frontend para el objeto AgentITSMServicePrint en la interfaz del agente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} = 'Registro del m�dulo frontend para el objeto AgentITSMServiceZoom en la interfaz del agente.';
    $Self->{Translation}->{'Manage priority matrix.'} = 'Administrar la matr�z de prioridades.';
    $Self->{Translation}->{'Module to show back link in service menu.'} = 'M�dulo para mostar un v�nculo para regresar en el men� de servicio.';
    $Self->{Translation}->{'Module to show back link in sla menu.'} = 'M�dulo para mostar un v�nculo para regresar en el men� de SLA.';
    $Self->{Translation}->{'Module to show print link in service menu.'} = 'M�dulo para mostar un v�nculo para imprimir en el men� de servicio.';
    $Self->{Translation}->{'Module to show print link in sla menu.'} = 'M�dulo para mostar un v�nculo para imprimir en el men� de SLA.';
    $Self->{Translation}->{'Module to show the link link in service menu.'} = 'M�dulo para mostar el v�nculo "Vincular" en el men� de servicio.';
    $Self->{Translation}->{'Parameters for the incident states in the preference view.'} = 'Par�metros para los estados de los incidentes en la vista de preferencias.';
    $Self->{Translation}->{'Set the type of link to be used to calculate the incident state.'} = 'Define el tipo de v�nculo usado para calcular el estado del incidente.';
    $Self->{Translation}->{'This setting defines that a \'ITSMChange\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} = 'Define que un objeto \'ITSMChange\' puede ser vinculado con objetos \'Ticket\' usando el v�nculo de tipo \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con objetos \'FAQ\' usando el v�nculo de tipo \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con objetos \'FAQ\' usando el v�nculo de tipo \'ParentChild\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con objetos \'FAQ\' usando el v�nculo de tipo \'RelevantTo\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'AlternativeTo\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con objetos \'Service\' usando el v�nculo de tipo \'AlternativeTo\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con objetos \'Service\' usando el v�nculo de tipo \'DependsOn\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'RelevantTo\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con objetos \'Service\' usando el v�nculo de tipo \'RelevantTo\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'AlternativeTo\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con objetos \'Ticket\' usando el v�nculo de tipo \'AlternativeTo\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'DependsOn\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con objetos \'Ticket\' usando el v�nculo de tipo \'AlternativeTo\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'RelevantTo\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con objetos \'Ticket\' usando el v�nculo de tipo \'RelevantTo\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'AlternativeTo\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con otros objetos \'ITSMConfigItem\' usando el v�nculo de tipo \'AlternativeTo\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'ConnectedTo\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con otros objetos \'ITSMConfigItem\' usando el v�nculo de tipo \'ConnectedTo\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con otros objetos \'ITSMConfigItem\' usando el v�nculo de tipo \'DependsOn\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'Includes\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con otros objetos \'ITSMConfigItem\' usando el v�nculo de tipo \'Includes\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'RelevantTo\' link type.'} = 'Define que un objeto \'ITSMConfigItem\' puede ser vinculado con otros objetos \'ITSMConfigItem\' usando el v�nculo \'RelevantTo\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} = 'Define que un objeto \'ITSMWorkOrder\' puede ser vinculado con objetos \'ITSMConfigItem\' usando el v�nculo de tipo \'DependsOn\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'Normal\' link type.'} = 'Define que un objeto \'ITSMWorkOrder\' puede ser vinculado con objetos \'ITSMConfigItem\' usando el v�nculo de tipo \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} = 'Define que un objeto \'ITSMWorkOrder\' puede ser vinculado con objetos \'Service\' usando el v�nculo de tipo \'DependsOn\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'Normal\' link type.'} = 'Define que un objeto \'ITSMWorkOrder\' puede ser vinculado con objetos \'Service\' usando el v�nculo de tipo \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} = 'Define que un objeto \'ITSMWorkOrder\' puede ser vinculado con objetos \'Ticket\' usando el v�nculo de tipo \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} = 'Define que un objeto \'Service\' puede ser vinculado con objetos \'FAQ\' usando el v�nculo de tipo \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} = 'Define que un objeto \'Service\' puede ser vinculado con objetos \'FAQ\' usando el v�nculo de tipo \'ParentChild\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} = 'Define que un objeto \'Service\' puede ser vinculado con objetos \'FAQ\' usando el v�nculo de tipo \'RelevantTo\'.';
    $Self->{Translation}->{'This setting defines the link type \'AlternativeTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = 'Define el tipo de v�nculo \'AlternativeTo\'. Si el SourceName y el TargetName contienen el mismo valor, el resultado es un v�nculo no direccionado. Si los valores son diferentes, el resultado es un v�nculo direccionado.';
    $Self->{Translation}->{'This setting defines the link type \'ConnectedTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = 'Define el tipo de v�nculo \'ConnectedTo\'. Si el SourceName y el TargetName contienen el mismo valor, el resultado es un v�nculo no direccionado. Si los valores son diferentes, el resultado es un v�nculo direccionado.';
    $Self->{Translation}->{'This setting defines the link type \'DependsOn\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = 'Define el tipo de v�nculo \'DependsOn\'. Si el SourceName y el TargetName contienen el mismo valor, el resultado es un v�nculo no direccionado. Si los valores son diferentes, el resultado es un v�nculo direccionado.';
    $Self->{Translation}->{'This setting defines the link type \'Includes\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = 'Define el tipo de v�nculo \'Includes\'. Si el SourceName y el TargetName contienen el mismo valor, el resultado es un v�nculo no direccionado. Si los valores son diferentes, el resultado es un v�nculo direccionado.';
    $Self->{Translation}->{'This setting defines the link type \'RelevantTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = 'Define el tipo de v�nculo \'RelevantTo\'. Si el SourceName y el TargetName contienen el mismo valor, el resultado es un v�nculo no direccionado. Si los valores son diferentes, el resultado es un v�nculo direccionado.';
    $Self->{Translation}->{'Width of ITSM textareas.'} = 'Define el ancho de las textareas del ITSM.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
