# --
# Kernel/Language/pt_BR_ITSMCore.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: pt_BR_ITSMCore.pm,v 1.12 2011/05/12 11:48:48 ub Exp $
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
    $Self->{Translation}->{'Availability'} = 'Disponibilidade';
    $Self->{Translation}->{'Back End'} = '';
    $Self->{Translation}->{'Connected to'} = 'Conectado a';
    $Self->{Translation}->{'Current State'} = 'Estado Atual';
    $Self->{Translation}->{'Demonstration'} = 'Demonstra��o';
    $Self->{Translation}->{'Depends on'} = 'Depende de';
    $Self->{Translation}->{'End User Service'} = 'Servi�o a Usu�rio Final';
    $Self->{Translation}->{'Errors'} = 'Erros';
    $Self->{Translation}->{'Front End'} = '';
    $Self->{Translation}->{'IT Management'} = 'Gerenciamento de TI';
    $Self->{Translation}->{'IT Operational'} = 'Opera��es de TI';
    $Self->{Translation}->{'Impact'} = 'Impacto';
    $Self->{Translation}->{'Incident State'} = 'Estado de Incidente';
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
    $Self->{Translation}->{'SLA Overview'} = 'Vis�o Geral de SLA';
    $Self->{Translation}->{'Service Overview'} = 'Vis�o Geral de Servi�o';
    $Self->{Translation}->{'Service-Area'} = '�rea Servi�o';
    $Self->{Translation}->{'Training'} = 'Treinamento';
    $Self->{Translation}->{'Transactions'} = 'Transa��es';
    $Self->{Translation}->{'Underpinning Contract'} = 'Contrato com Terceiros';
    $Self->{Translation}->{'allocation'} = 'atribui��o';

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'Criticalidade <-> Impacto <-> Prioridade';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality <-> Impact.'} = 'Gerenciar a prioridade resultante da combina��o Criticalidade <-> Impacto.';
    $Self->{Translation}->{'Priority allocation'} = 'Atribui��o de prioridade';

    # Template: AdminSLA
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'Tempo M�nimo entre Incidentes';

    # Template: AdminService
    $Self->{Translation}->{'Criticality'} = 'Criticalidade';

    # Template: AgentITSMCustomerSearch

    # Template: AgentITSMSLA

    # Template: AgentITSMSLAPrint
    $Self->{Translation}->{'SLA-Info'} = 'Informa��o do SLA';
    $Self->{Translation}->{'Last changed'} = '�ltima altera��o';
    $Self->{Translation}->{'Last changed by'} = '�ltima altera��o por';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = 'Informa��o de SLA';
    $Self->{Translation}->{'Show or hide the content.'} = 'Mostrar ou ocultar o conte�do.';
    $Self->{Translation}->{'Associated Services'} = 'Servi�os Associados';

    # Template: AgentITSMService

    # Template: AgentITSMServicePrint
    $Self->{Translation}->{'Service-Info'} = 'Informa��o de servi�o';
    $Self->{Translation}->{'Current Incident State'} = 'Estado Atual de Incidente';
    $Self->{Translation}->{'Associated SLAs'} = 'SLAs Associados';

    # Template: AgentITSMServiceZoom
    $Self->{Translation}->{'Service Information'} = 'Informa��o de servi�o';
    $Self->{Translation}->{'Current incident state'} = 'Estado Atual de Incidente';

    # SysConfig
    $Self->{Translation}->{'Frontend module registration for the AdminITSMCIPAllocate configuration in the admin area.'} = 'Registro de m�dulo de interface para a configura��o AdminITSMCIPAllocate na �rea administrativa.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} = 'Registro de m�dulo de interface para o objeto AgentITSMSLA na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} = 'Registro de m�dulo de interface para o objeto AgentITSMSLAPrint na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} = 'Registro de m�dulo de interface para o objeto AgentITSMSLAZoom na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMService object in the agent interface.'} = 'Registro de m�dulo de interface para o objeto AgentITSMService na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} = 'Registro de m�dulo de interface para o objeto AgentITSMServicePrint na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} = 'Registro de m�dulo de interface para o objeto AgentITSMServiceZoom na interface de atendente.';
    $Self->{Translation}->{'Manage priority matrix.'} = 'Gerenciar matriz de prioridade';
    $Self->{Translation}->{'Module to show back link in service menu.'} = 'M�dulo para mostrar o link voltar no menu servi�o.';
    $Self->{Translation}->{'Module to show back link in sla menu.'} = 'M�dulo para mostrar o link voltar no menu SLA.';
    $Self->{Translation}->{'Module to show print link in service menu.'} = 'M�dulo para mostrar o link imprimir no menu servi�o.';
    $Self->{Translation}->{'Module to show print link in sla menu.'} = 'M�dulo para mostrar o link imprimir no menu SLA.';
    $Self->{Translation}->{'Module to show the link link in service menu.'} = 'M�dulo para mostrar o link associar no menu servi�o.';
    $Self->{Translation}->{'Parameters for the incident states in the preference view.'} = 'Par�metros para os estados de incidente na vis�o de prefer�ncias.';
    $Self->{Translation}->{'Set the type of link to be used to calculate the incident state.'} = 'Definir o tipo de link a ser utilizado para calcular o estado de incidente.';
    $Self->{Translation}->{'This setting defines that a \'ITSMChange\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} = 'Essa configura��o define que um objeto \'Mudan�aITSM\' pode ser associado com objetos \'Chamado\' usando o tipo de associa��o \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'FAQ\' usando o tipo de associa��o \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'FAQ\' usando o tipo de associa��o \'PaiFilho\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'FAQ\' usando o tipo de associa��o \'Relevante a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'AlternativeTo\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Servi�o\' usando o tipo de associa��o \'Alternativa a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Servi�o\' usando o tipo de associa��o \'Depende de\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'RelevantTo\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Servi�o\' usando o tipo de associa��o \'Relevante a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'AlternativeTo\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Chamado\' usando o tipo de associa��o \'Alternativa a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'DependsOn\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Chamado\' usando o tipo de associa��o \'Depende de\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'RelevantTo\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Chamado\' usando o tipo de associa��o \'Relevante a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'AlternativeTo\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com outros objetos \'ItemConfigITSM\' usando o tipo de associa��o \'Alternativa a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'ConnectedTo\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com outros objetos \'ItemConfigITSM\' usando o tipo de associa��o \'Conectado a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com outros objetos \'ItemConfigITSM\' usando o tipo de associa��o \'Depende de\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'Includes\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com outros objetos \'ItemConfigITSM\' usando o tipo de associa��o \'Inclui\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'RelevantTo\' link type.'} = 'Essa configura��o define que um objeto \'ItemConfigITSM\' pode ser associado com outros objetos \'ItemConfigITSM\' usando o tipo de associa��o \'Relevante a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} = 'Essa configura��o define que um objeto \'OrdemServi�oITSM\' pode ser associado com objetos \'ItemConfigITSM\' usando o tipo de associa��o \'Depende de\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'Normal\' link type.'} = 'Essa configura��o define que um objeto \'OrdemServi�oITSM\' pode ser associado com objetos \'ItemConfigITSM\' usando o tipo de associa��o \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} = 'Essa configura��o define que um objeto \'OrdemServi�oITSM\' pode ser associado com objetos \'Servi�o\' usando o tipo de associa��o \'Depende de\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'Normal\' link type.'} = 'Essa configura��o define que um objeto \'OrdemServi�oITSM\' pode ser associado com objetos \'Servi�o\' usando o tipo de associa��o \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} = 'Essa configura��o define que um objeto \'OrdemServi�oITSM\' pode ser associado com objetos \'Chamado\' usando o tipo de associa��o \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} = 'Essa configura��o define que um objeto \'Servi�o\' pode ser associado com objetos \'FAQ\' usando o tipo de associa��o \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} = 'Essa configura��o define que um objeto \'Servi�o\' pode ser associado com objetos \'FAQ\' usando o tipo de associa��o \'PaiFilho\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} = 'Essa configura��o define que um objeto \'Servi�o\' pode ser associado com objetos \'FAQ\' usando o tipo de associa��o \'Relevante a\'.';
    $Self->{Translation}->{'This setting defines the link type \'AlternativeTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = 'Esta configura��o define o tipo de link \'Alternativa a\'. Se o nome da fonte e o nome do alvo cont�m o mesmo valor, a associa��o resultante � n�o-direcional. Se os valores s�o diferentes, a associa��o resultante � um link direcional.';
    $Self->{Translation}->{'This setting defines the link type \'ConnectedTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = 'Esta configura��o define o tipo de link \'Conectado a\'. Se o nome da fonte e o nome do alvo cont�m o mesmo valor, a associa��o resultante � n�o-direcional. Se os valores s�o diferentes, a associa��o resultante � um link direcional.';
    $Self->{Translation}->{'This setting defines the link type \'DependsOn\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = 'Esta configura��o define o tipo de link \'Depende de\'. Se o nome da fonte e o nome do alvo cont�m o mesmo valor, a associa��o resultante � n�o-direcional. Se os valores s�o diferentes, a associa��o resultante � um link direcional.';
    $Self->{Translation}->{'This setting defines the link type \'Includes\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = 'Esta configura��o define o tipo de link \'Inclui\'. Se o nome da fonte e o nome do alvo cont�m o mesmo valor, a associa��o resultante � n�o-direcional. Se os valores s�o diferentes, a associa��o resultante � um link direcional.';
    $Self->{Translation}->{'This setting defines the link type \'RelevantTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} = 'Esta configura��o define o tipo de link \'Relevante a\'. Se o nome da fonte e o nome do alvo cont�m o mesmo valor, a associa��o resultante � n�o-direcional. Se os valores s�o diferentes, a associa��o resultante � um link direcional.';
    $Self->{Translation}->{'Width of ITSM textareas.'} = 'N�mero de caracteres por linha em �reas de texto ITSM.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
