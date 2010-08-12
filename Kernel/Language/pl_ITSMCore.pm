# --
# Kernel/Language/pl_ITSMCore.pm - the polish translation of ITSMCore
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Maciej Loszajc
# --
# $Id: pl_ITSMCore.pm,v 1.7 2010/08/12 21:08:43 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pl_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = '';
    $Lang->{'Impact'}                              = '';
    $Lang->{'Criticality <-> Impact <-> Priority'} = '';
    $Lang->{'allocation'}                          = '';
    $Lang->{'Priority allocation'}                 = '';
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
    $Lang->{'This setting controls the name of the application as is shown in the web interface as well as the tabs and title bar of your web browser.'} = '';
    $Lang->{'Determines the way the linked objects are displayed in each zoom mask.'} = '';
    $Lang->{'List of online repositories (for example you also can use other installations as repositoriy by using Key="http://example.com/otrs/public.pl?Action=PublicRepository&File=" and Content="Some Name").'} = '';

    return 1;
}

1;
