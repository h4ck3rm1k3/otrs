# --
# Kernel/Language/cz_ITSMCore.pm - the czech translation of ITSMCore
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2007-2008 Milen Koutev
# --
# $Id: cz_ITSMCore.pm,v 1.13 2009/07/20 12:21:17 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cz_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.13 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = 'Kriti�nost';
    $Lang->{'Impact'}                              = 'Vliv';
    $Lang->{'Criticality <-> Impact <-> Priority'} = 'Kriti�nost<->Vliv<->Priorita';
    $Lang->{'allocate'}                            = 'Ur�en';
    $Lang->{'Relevant to'}                         = 'Relevantn�';
    $Lang->{'Includes'}                            = 'zahrnut�';
    $Lang->{'Part of'}                             = '��st';
    $Lang->{'Depends on'}                          = 'Zale��';
    $Lang->{'Required for'}                        = ' Po�adovan�';
    $Lang->{'Connected to'}                        = 'Spojen s';
    $Lang->{'Alternative to'}                      = 'Alternativn�';
    $Lang->{'Incident State'}                      = '';
    $Lang->{'Current Incident State'}              = '';
    $Lang->{'Current State'}                       = '';
    $Lang->{'Service-Area'}                        = '';
    $Lang->{'Minimum Time Between Incidents'}      = 'Minim�ln� �as mezi incidenty';
    $Lang->{'Service Overview'}                    = '';
    $Lang->{'SLA Overview'}                        = '';
    $Lang->{'Associated Services'}                 = '';
    $Lang->{'Associated SLAs'}                     = 'P�idru�en� SLA smliuvy';
    $Lang->{'Back End'}                            = 'Z�kladn� sch�ma/BackEnd';
    $Lang->{'Demonstration'}                       = 'Demonstrace';
    $Lang->{'End User Service'}                    = 'Slu�by koncov�ch u�ivatel�';
    $Lang->{'Front End'}                           = 'Z�kaznick� syst�m/FrontEnd';
    $Lang->{'IT Management'}                       = '��zen� IT';
    $Lang->{'IT Operational'}                      = 'IT Operace';
    $Lang->{'Other'}                               = 'Dal��';
    $Lang->{'Project'}                             = 'Projekt';
    $Lang->{'Reporting'}                           = 'Zpravodajstv�';
    $Lang->{'Training'}                            = '�kolen�';
    $Lang->{'Underpinning Contract'}               = 'Z�kladn� smlouva';
    $Lang->{'Availability'}                        = 'Dostupnost';
    $Lang->{'Errors'}                              = 'Chyby';
    $Lang->{'Other'}                               = 'Dal��';
    $Lang->{'Recovery Time'}                       = 'Doba obnoven�';
    $Lang->{'Resolution Rate'}                     = 'Doba �e�en�';
    $Lang->{'Response Time'}                       = 'Doba odpov�di';
    $Lang->{'Transactions'}                        = 'Obchody/transakce';

    return 1;
}

1;
