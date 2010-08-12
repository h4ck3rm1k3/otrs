# --
# Kernel/Language/nl_ITSMCore.pm - the Dutch translation of ITSMCore
# Copyright (C) 2009 Michiel Beijen <michiel 'at' beefreeit.nl>
# --
# $Id: nl_ITSMCore.pm,v 1.5 2010/08/12 22:33:56 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nl_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.5 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = 'Urgentie';
    $Lang->{'Impact'}                              = 'Impact';
    $Lang->{'Criticality <-> Impact <-> Priority'} = 'Urgentie <-> Impact <-> Prioriteit';
    $Lang->{'allocation'}                          = 'toekennen';
    $Lang->{'Priority allocation'}                 = 'Prioriteit toekennen';
    $Lang->{'Relevant to'}                         = 'Van belang voor';
    $Lang->{'Includes'}                            = 'Bevat';
    $Lang->{'Part of'}                             = 'Onderdeel van';
    $Lang->{'Depends on'}                          = 'Afhankelijk van';
    $Lang->{'Required for'}                        = 'Benodigd voor';
    $Lang->{'Connected to'}                        = 'Verbonden met';
    $Lang->{'Alternative to'}                      = 'Alternatief voor';
    $Lang->{'Incident State'}                      = 'Incident status';
    $Lang->{'Current Incident State'}              = 'Huidige incident status';
    $Lang->{'Current State'}                       = 'Huidige status';
    $Lang->{'Service-Area'}                        = 'Service-Area';
    $Lang->{'Minimum Time Between Incidents'}      = 'Minimumtijd tussen incidenten';
    $Lang->{'Service Overview'}                    = 'Service-overzicht';
    $Lang->{'SLA Overview'}                        = 'SLA-overzicht';
    $Lang->{'Associated Services'}                 = 'Bijbehorende Services';
    $Lang->{'Associated SLAs'}                     = 'Bijbehorende SLAs';
    $Lang->{'Back End'}                            = 'Backend';
    $Lang->{'Demonstration'}                       = 'Demonstration';
    $Lang->{'End User Service'}                    = 'Eindgebruiker service';
    $Lang->{'Front End'}                           = 'Frontend';
    $Lang->{'IT Management'}                       = 'IT Management';
    $Lang->{'IT Operational'}                      = 'IT Operations';
    $Lang->{'Other'}                               = 'Overig';
    $Lang->{'Project'}                             = 'Project';
    $Lang->{'Reporting'}                           = 'Rapportage';
    $Lang->{'Training'}                            = 'Training';
    $Lang->{'Underpinning Contract'}               = 'Underpinning Contract';
    $Lang->{'Availability'}                        = 'Beschikbaarheid';
    $Lang->{'Errors'}                              = 'Fouten';
    $Lang->{'Recovery Time'}                       = 'Hersteltijd';
    $Lang->{'Resolution Rate'}                     = 'Oplostijd';
    $Lang->{'Response Time'}                       = 'Responsietijd';
    $Lang->{'Transactions'}                        = 'Transacties';
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
