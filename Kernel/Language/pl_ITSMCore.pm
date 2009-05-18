# --
# Kernel/Language/pl_ITSMCore.pm - the polish translation of ITSMCore
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Maciej Loszajc
# --
# $Id: pl_ITSMCore.pm,v 1.4 2009/05/18 09:48:24 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pl_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = '';
    $Lang->{'Impact'}                              = '';
    $Lang->{'Criticality <-> Impact <-> Priority'} = '';
    $Lang->{'allocate'}                            = '';
    $Lang->{'Relevant to'}                         = '';
    $Lang->{'Includes'}                            = 'Zawiera';
    $Lang->{'Part of'}                             = '';
    $Lang->{'Depends on'}                          = 'Zale�ne od';
    $Lang->{'Required for'}                        = 'Potrzebne do';
    $Lang->{'Connected to'}                        = 'Pod��czone do';
    $Lang->{'Alternative to'}                      = '';
    $Lang->{'Incident State'}                      = 'Stan zdarzenia';
    $Lang->{'Current Incident State'}              = 'Aktualny stan zdarzenia';
    $Lang->{'Current State'}                       = 'Aktualny stan';
    $Lang->{'Service-Area'}                        = 'Sekcja serwisowa';
    $Lang->{'Minimum Time Between Incidents'}      = 'Minimalny czas mi�dzy zdarzeniami';
    $Lang->{'Service Overview'}                    = '';
    $Lang->{'SLA Overview'}                        = '';
    $Lang->{'Associated Services'}                 = 'Po��czone us�ugi';
    $Lang->{'Associated SLAs'}                     = 'Po��czone SLA';
    $Lang->{'Back End'}                            = '';
    $Lang->{'Demonstration'}                       = 'Demonstracja';
    $Lang->{'End User Service'}                    = '';
    $Lang->{'Front End'}                           = '';
    $Lang->{'IT Management'}                       = '';
    $Lang->{'IT Operational'}                      = '';
    $Lang->{'Other'}                               = 'Inne';
    $Lang->{'Project'}                             = 'Projekt';
    $Lang->{'Reporting'}                           = 'Raportowanie';
    $Lang->{'Training'}                            = 'Trening';
    $Lang->{'Underpinning Contract'}               = '';
    $Lang->{'Availability'}                        = 'Dost�pno��';
    $Lang->{'Errors'}                              = 'B��dy';
    $Lang->{'Other'}                               = 'Inne';
    $Lang->{'Recovery Time'}                       = 'Czas odzyskania';
    $Lang->{'Resolution Rate'}                     = 'Czas rozwi�zania';
    $Lang->{'Response Time'}                       = 'Czas odpowiedzi';
    $Lang->{'Transactions'}                        = 'Transakcje';

    return 1;
}

1;
