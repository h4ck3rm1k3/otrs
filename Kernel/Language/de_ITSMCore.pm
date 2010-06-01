# --
# Kernel/Language/de_ITSMCore.pm - the german translation of ITSMCore
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: de_ITSMCore.pm,v 1.17 2010/06/01 19:25:22 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.17 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = 'Kritikalit�t';
    $Lang->{'Impact'}                              = 'Auswirkung';
    $Lang->{'Criticality <-> Impact <-> Priority'} = 'Kritikalit�t <-> Auswirkung <-> Priorit�t';
    $Lang->{'allocation'}                          = 'zuordnen';
    $Lang->{'Priority allocation'}                 = 'Priorit�t zuordnen';
    $Lang->{'Relevant to'}                         = 'Relevant f�r';
    $Lang->{'Includes'}                            = 'Beinhaltet';
    $Lang->{'Part of'}                             = 'Teil von';
    $Lang->{'Depends on'}                          = 'H�ngt ab von';
    $Lang->{'Required for'}                        = 'Ben�tigt f�r';
    $Lang->{'Connected to'}                        = 'Verbunden mit';
    $Lang->{'Alternative to'}                      = 'Alternativ zu';
    $Lang->{'Incident State'}                      = 'Vorfallsstatus';
    $Lang->{'Current Incident State'}              = 'Aktueller Vorfallsstatus';
    $Lang->{'Current State'}                       = 'Aktueller Status';
    $Lang->{'Service-Area'}                        = 'Service-Bereich';
    $Lang->{'Minimum Time Between Incidents'}      = 'Mindestzeit zwischen Incidents';
    $Lang->{'Service Overview'}                    = 'Service �bersicht';
    $Lang->{'SLA Overview'}                        = 'SLA �bersicht';
    $Lang->{'Associated Services'}                 = 'Zugeh�rige Services';
    $Lang->{'Associated SLAs'}                     = 'Zugeh�rige SLAs';
    $Lang->{'Back End'}                            = 'Backend';
    $Lang->{'Demonstration'}                       = 'Demonstration';
    $Lang->{'End User Service'}                    = 'Anwender-Service';
    $Lang->{'Front End'}                           = 'Frontend';
    $Lang->{'IT Management'}                       = 'IT Management';
    $Lang->{'IT Operational'}                      = 'IT Betrieb';
    $Lang->{'Other'}                               = 'Sonstiges';
    $Lang->{'Project'}                             = 'Projekt';
    $Lang->{'Reporting'}                           = 'Reporting';
    $Lang->{'Training'}                            = 'Training';
    $Lang->{'Underpinning Contract'}               = 'Underpinning Contract';
    $Lang->{'Availability'}                        = 'Verf�gbarkeit';
    $Lang->{'Errors'}                              = 'Fehler';
    $Lang->{'Other'}                               = 'Sonstiges';
    $Lang->{'Recovery Time'}                       = 'Wiederherstellungszeit';
    $Lang->{'Resolution Rate'}                     = 'L�sungszeit';
    $Lang->{'Response Time'}                       = 'Reaktionszeit';
    $Lang->{'Transactions'}                        = 'Transaktionen';

    return 1;
}

1;
