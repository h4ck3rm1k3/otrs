# --
# Kernel/Language/cs_ITSMCore.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: cs_ITSMCore.pm,v 1.1 2011/01/24 18:34:25 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cs_ITSMCore;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAITSMCore
    $Self->{Translation}->{'Alternative to'} = 'Alternativn� k';
    $Self->{Translation}->{'Availability'} = 'Dostupnost';
    $Self->{Translation}->{'Back End'} = 'Z�kladn� rozhran�/Backend';
    $Self->{Translation}->{'Connected to'} = 'Spojen s';
    $Self->{Translation}->{'Current State'} = 'Sou�asn� Stav';
    $Self->{Translation}->{'Demonstration'} = 'Uk�zka';
    $Self->{Translation}->{'Depends on'} = 'Zale�� na';
    $Self->{Translation}->{'End User Service'} = 'Slu�by koncov�m u�ivatel�m';
    $Self->{Translation}->{'Errors'} = 'Chyby';
    $Self->{Translation}->{'Front End'} = 'Z�kaznick� rozhran�/Frontend';
    $Self->{Translation}->{'IT Management'} = '��zen� IT';
    $Self->{Translation}->{'IT Operational'} = 'IT Operace';
    $Self->{Translation}->{'Impact'} = 'Vliv';
    $Self->{Translation}->{'Incident State'} = 'Stav Incidentu';
    $Self->{Translation}->{'Includes'} = 'Zahrnuje';
    $Self->{Translation}->{'Other'} = 'Dal��';
    $Self->{Translation}->{'Part of'} = '��st z';
    $Self->{Translation}->{'Project'} = 'Projekt';
    $Self->{Translation}->{'Recovery Time'} = '�as Obnovy';
    $Self->{Translation}->{'Relevant to'} = 'Relevantn� k';
    $Self->{Translation}->{'Reporting'} = 'Reporting';
    $Self->{Translation}->{'Required for'} = 'Po�adovan� pro';
    $Self->{Translation}->{'Resolution Rate'} = '�as �e�en�';
    $Self->{Translation}->{'Response Time'} = '�as Odpov�di';
    $Self->{Translation}->{'SLA Overview'} = 'SLA P�ehled';
    $Self->{Translation}->{'Service Overview'} = 'P�ehled Slu�by';
    $Self->{Translation}->{'Service-Area'} = 'Prostor �dr�by';
    $Self->{Translation}->{'Training'} = '�kolen�';
    $Self->{Translation}->{'Transactions'} = 'Transakce';
    $Self->{Translation}->{'Underpinning Contract'} = 'Z�kladn� smlouva';
    $Self->{Translation}->{'allocation'} = 'p�id�lit';

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'Kriti�nost<->Vliv<->Priorita';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality <-> Impact.'} = '';
    $Self->{Translation}->{'Priority allocation'} = '';

    # Template: AdminNotification

    # Template: AdminSLA
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'Minim�ln� �as mezi incidenty';

    # Template: AdminService
    $Self->{Translation}->{'Criticality'} = 'Kriti�nost';

    # Template: AgentITSMCustomerSearch

    # Template: AgentITSMSLA

    # Template: AgentITSMSLAPrint
    $Self->{Translation}->{'SLA-Info'} = '';
    $Self->{Translation}->{'Last changed'} = '';
    $Self->{Translation}->{'Last changed by'} = '';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = '';
    $Self->{Translation}->{'Show or hide the content.'} = '';
    $Self->{Translation}->{'Associated Services'} = 'P�i�azen� Slu�by';

    # Template: AgentITSMService

    # Template: AgentITSMServicePrint
    $Self->{Translation}->{'Service-Info'} = '';
    $Self->{Translation}->{'Current Incident State'} = 'Sou�asn� Stav Incidentu';
    $Self->{Translation}->{'Associated SLAs'} = 'P�i�azen� SLA smlouvy';

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
