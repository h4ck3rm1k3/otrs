# --
# Kernel/Language/pt_BR_ITSMCore.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: pt_BR_ITSMCore.pm,v 1.10 2011/01/24 18:29:49 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_ITSMCore;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAITSMCore
    $Self->{Translation}->{'Alternative to'} = 'Alternativa a';
    $Self->{Translation}->{'Availability'} = 'Avaliabilidade';
    $Self->{Translation}->{'Back End'} = '';
    $Self->{Translation}->{'Connected to'} = 'Conectado a';
    $Self->{Translation}->{'Current State'} = 'Situa��o Atual';
    $Self->{Translation}->{'Demonstration'} = 'Demonstra��o';
    $Self->{Translation}->{'Depends on'} = 'Depende de';
    $Self->{Translation}->{'End User Service'} = 'Servi�o a Usu�rio Final';
    $Self->{Translation}->{'Errors'} = 'Erros';
    $Self->{Translation}->{'Front End'} = '';
    $Self->{Translation}->{'IT Management'} = 'Gerenciamento de TI';
    $Self->{Translation}->{'IT Operational'} = 'Opera��es de TI';
    $Self->{Translation}->{'Impact'} = 'Impacto';
    $Self->{Translation}->{'Incident State'} = 'Situa��o de Incidentes';
    $Self->{Translation}->{'Includes'} = 'Inclui';
    $Self->{Translation}->{'Other'} = 'Outro';
    $Self->{Translation}->{'Part of'} = 'Parte de';
    $Self->{Translation}->{'Project'} = 'Projeto';
    $Self->{Translation}->{'Recovery Time'} = 'Tempo de Recupera��o';
    $Self->{Translation}->{'Relevant to'} = 'Relevante a';
    $Self->{Translation}->{'Reporting'} = 'Relat�rio';
    $Self->{Translation}->{'Required for'} = 'Requisitado por';
    $Self->{Translation}->{'Resolution Rate'} = 'Taxa de Resolu��o';
    $Self->{Translation}->{'Response Time'} = 'Tempo de Resposta';
    $Self->{Translation}->{'SLA Overview'} = 'Resumo da SLA';
    $Self->{Translation}->{'Service Overview'} = 'Resumo do Servi�o';
    $Self->{Translation}->{'Service-Area'} = 'Servi�o-�rea';
    $Self->{Translation}->{'Training'} = 'Treinamento';
    $Self->{Translation}->{'Transactions'} = 'Transa��es';
    $Self->{Translation}->{'Underpinning Contract'} = 'Contrato com Terceiros (UC)';
    $Self->{Translation}->{'allocation'} = '';

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'Criticalidade <-> Impacto <-> Prioridade';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality <-> Impact.'} = '';
    $Self->{Translation}->{'Priority allocation'} = 'Alocar prioridade';

    # Template: AdminNotification

    # Template: AdminSLA
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'Tempo M�nimo entre Incidentes';

    # Template: AdminService
    $Self->{Translation}->{'Criticality'} = 'Criticalidade';

    # Template: AgentITSMCustomerSearch

    # Template: AgentITSMSLA

    # Template: AgentITSMSLAPrint
    $Self->{Translation}->{'SLA-Info'} = '';
    $Self->{Translation}->{'Last changed'} = '';
    $Self->{Translation}->{'Last changed by'} = '';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = '';
    $Self->{Translation}->{'Show or hide the content.'} = '';
    $Self->{Translation}->{'Associated Services'} = 'Servi�os Associados';

    # Template: AgentITSMService

    # Template: AgentITSMServicePrint
    $Self->{Translation}->{'Service-Info'} = '';
    $Self->{Translation}->{'Current Incident State'} = 'Situa��o Atual de Incidentes';
    $Self->{Translation}->{'Associated SLAs'} = 'SLAs Associadas';

    # Template: AgentITSMServiceZoom
    $Self->{Translation}->{'Service Information'} = '';
    $Self->{Translation}->{'Current incident state'} = '';

    # SysConfig
    $Self->{Translation}->{'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).'} = '';
    $Self->{Translation}->{'Frontend module registration for the AdminITSMCIPAllocate configuration in the admin area.'} = '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} = '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} = '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} = '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMService object in the agent interface.'} = '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} = '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} = '';
    $Self->{Translation}->{'Manage priority matrix.'} = '';
    $Self->{Translation}->{'Module to show back link in service menu.'} = '';
    $Self->{Translation}->{'Module to show back link in sla menu.'} = '';
    $Self->{Translation}->{'Module to show print link in service menu.'} = '';
    $Self->{Translation}->{'Module to show print link in sla menu.'} = '';
    $Self->{Translation}->{'Module to show the link link in service menu.'} = '';
    $Self->{Translation}->{'Parameters for the incident states in the preference view.'} = '';
    $Self->{Translation}->{'Set the type of link to be used to calculate the incident state.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMChange\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'AlternativeTo\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'RelevantTo\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'AlternativeTo\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'DependsOn\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'RelevantTo\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'AlternativeTo\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'ConnectedTo\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'Includes\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'RelevantTo\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'Normal\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'Normal\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} = '';
    $Self->{Translation}->{'This setting defines the link type \'AlternativeTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = '';
    $Self->{Translation}->{'This setting defines the link type \'ConnectedTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = '';
    $Self->{Translation}->{'This setting defines the link type \'DependsOn\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = '';
    $Self->{Translation}->{'This setting defines the link type \'Includes\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = '';
    $Self->{Translation}->{'This setting defines the link type \'RelevantTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = '';
    $Self->{Translation}->{'Width of ITSM textareas.'} = '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
