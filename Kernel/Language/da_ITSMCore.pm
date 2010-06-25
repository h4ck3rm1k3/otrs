# --
# Kernel/Language/da_ITSMCore.pm - provides da (Danish) language translation
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: da_ITSMCore.pm,v 1.1 2010/06/25 08:56:57 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::da_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = 'Kritikalitet';
    $Lang->{'Impact'}                              = 'P�virkning';
    $Lang->{'Criticality <-> Impact <-> Priority'} = 'Kritikalitet <-> P�virkning <-> Prioritet';
    $Lang->{'allocate'}                            = 'tildele';
    $Lang->{'Relevant to'}                         = 'Relevant for';
    $Lang->{'Includes'}                            = 'Indkludere';
    $Lang->{'Part of'}                             = 'Del af';
    $Lang->{'Depends on'}                          = 'Afh�nger af';
    $Lang->{'Required for'}                        = 'Kr�ves for';
    $Lang->{'Connected to'}                        = 'Forbundet til';
    $Lang->{'Alternative to'}                      = 'Alternativ til';
    $Lang->{'Incident State'}                      = 'Incident tilstand';
    $Lang->{'Current Incident State'}              = 'Nuv�rende Incident tilstand';
    $Lang->{'Current State'}                       = 'Nuv�rende tilstand';
    $Lang->{'Service-Area'}                        = 'Service omr�de';
    $Lang->{'Minimum Time Between Incidents'}      = 'Minimumstid mellem Incidents';
    $Lang->{'Service Overview'}                    = 'Service oversigt';
    $Lang->{'SLA Overview'}                        = 'SLA oversigt';
    $Lang->{'Associated Services'}                 = 'Tilknyttede services';
    $Lang->{'Associated SLAs'}                     = 'Tilknyttede SLAs';
    $Lang->{'Back End'}                            = 'Backend';
    $Lang->{'Demonstration'}                       = 'Demonstration';
    $Lang->{'End User Service'}                    = 'Kundeservice';
    $Lang->{'Front End'}                           = 'Frontend';
    $Lang->{'IT Management'}                       = 'IT Management';
    $Lang->{'IT Operational'}                      = 'IT operationel';
    $Lang->{'Other'}                               = 'Andre';
    $Lang->{'Project'}                             = 'Projekt';
    $Lang->{'Reporting'}                           = 'Reportering';
    $Lang->{'Training'}                            = 'Tr�ning';
    $Lang->{'Underpinning Contract'}               = 'Underliggende kontrakt';
    $Lang->{'Availability'}                        = 'Tilg�ngelighed';
    $Lang->{'Errors'}                              = 'Fejl';
    $Lang->{'Other'}                               = 'Andre';
    $Lang->{'Recovery Time'}                       = 'Genetableringstid';
    $Lang->{'Resolution Rate'}                     = 'L�sningsrate';
    $Lang->{'Response Time'}                       = 'Reaktionstid';
    $Lang->{'Transactions'}                        = 'Transaktioner';

    return 1;
}

1;
