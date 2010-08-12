# --
# Kernel/Language/cz_ITSMCore.pm - the czech translation of ITSMCore
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2007-2008 Milen Koutev
# Copyright (C) 2010 O2BS.com, s r.o. Jakub Hanus
# --
# $Id: cz_ITSMCore.pm,v 1.18 2010/08/12 22:33:56 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cz_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.18 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = 'Kriti�nost';
    $Lang->{'Impact'}                              = 'Vliv';
    $Lang->{'Criticality <-> Impact <-> Priority'} = 'Kriti�nost<->Vliv<->Priorita';
    $Lang->{'Priority allocation'}                 = '';
    $Lang->{'allocation'}                          = 'p�id�lit';
    $Lang->{'Relevant to'}                         = 'Relevantn� k';
    $Lang->{'Includes'}                            = 'Zahrnuje';
    $Lang->{'Part of'}                             = '��st z';
    $Lang->{'Depends on'}                          = 'Zale�� na';
    $Lang->{'Required for'}                        = 'Po�adovan� pro';
    $Lang->{'Connected to'}                        = 'Spojen s';
    $Lang->{'Alternative to'}                      = 'Alternativn� k';
    $Lang->{'Incident State'}                      = 'Stav Incidentu';
    $Lang->{'Current Incident State'}              = 'Sou�asn� Stav Incidentu';
    $Lang->{'Current State'}                       = 'Sou�asn� Stav';
    $Lang->{'Service-Area'}                        = 'Prostor �dr�by';
    $Lang->{'Minimum Time Between Incidents'}      = 'Minim�ln� �as mezi incidenty';
    $Lang->{'Service Overview'}                    = 'P�ehled Slu�by';
    $Lang->{'SLA Overview'}                        = 'SLA P�ehled';
    $Lang->{'Associated Services'}                 = 'P�i�azen� Slu�by';
    $Lang->{'Associated SLAs'}                     = 'P�i�azen� SLA smlouvy';
    $Lang->{'Back End'}                            = 'Z�kladn� rozhran�/BackEnd';
    $Lang->{'Demonstration'}                       = 'Uk�zka';
    $Lang->{'End User Service'}                    = 'Slu�by koncov�m u�ivatel�m';
    $Lang->{'Front End'}                           = 'Z�kaznick� rozhran�/FrontEnd';
    $Lang->{'IT Management'}                       = '��zen� IT';
    $Lang->{'IT Operational'}                      = 'IT Operace';
    $Lang->{'Other'}                               = 'Dal��';
    $Lang->{'Project'}                             = 'Projekt';
    $Lang->{'Reporting'}                           = 'Reporting';
    $Lang->{'Training'}                            = '�kolen�';
    $Lang->{'Underpinning Contract'}               = 'Z�kladn� smlouva';
    $Lang->{'Availability'}                        = 'Dostupnost';
    $Lang->{'Errors'}                              = 'Chyby';
    $Lang->{'Other'}                               = 'Dal��';
    $Lang->{'Recovery Time'}                       = '�as Obnovy';
    $Lang->{'Resolution Rate'}                     = '�as �e�en�';
    $Lang->{'Response Time'}                       = '�as Odpov�di';
    $Lang->{'Transactions'}                        = 'Transakce';
    $Lang->{'This setting controls the name of the application as is shown in the web interface as well as the tabs and title bar of your web browser.'} = '';
    $Lang->{'Determines the way the linked objects are displayed in each zoom mask.'} = '';
    $Lang->{'List of online repositories (for example you also can use other installations as repositoriy by using Key="http://example.com/otrs/public.pl?Action=PublicRepository&File=" and Content="Some Name").'} = '';
    $Lang->{'Frontend module registration for the AgentITSMService object in the agent interface.'} = '';
    $Lang->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} = '';
    $Lang->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} = '';
    $Lang->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} = '';
    $Lang->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} = '';
    $Lang->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} = '';
    $Lang->{'Module to show back link in service menu.'} = '';
    $Lang->{'Module to show print link in service menu.'} = '';
    $Lang->{'Module to show link link in service menu.'} = '';
    $Lang->{'Module to show back link in sla menu.'} = '';
    $Lang->{'Module to show print link in sla menu.'} = '';

    return 1;
}

1;
