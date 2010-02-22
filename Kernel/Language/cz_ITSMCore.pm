# --
# Kernel/Language/cz_ITSMCore.pm - the czech translation of ITSMCore
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2007-2008 Milen Koutev
# Copyright (C) 2010 O2BS.com, s r.o. Jakub Hanus
# --
# $Id: cz_ITSMCore.pm,v 1.15 2010/02/22 12:12:45 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cz_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.15 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = 'Kriti�nost';
    $Lang->{'Impact'}                              = 'Vliv';
    $Lang->{'Criticality <-> Impact <-> Priority'} = 'Kriti�nost<->Vliv<->Priorita';
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

    return 1;
}

1;
