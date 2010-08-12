# --
# Kernel/Language/ct_ITSMCore.pm - the catalan translation of ITSMCore
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Sistemes OTIC (ibsalut) - Antonio Linde
# --
# $Id: ct_ITSMCore.pm,v 1.6 2010/08/12 21:08:44 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ct_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = 'Estat cr�tic';
    $Lang->{'Impact'}                              = 'Impacte';
    $Lang->{'Criticality <-> Impact <-> Priority'} = 'Estat cr�tic <-> Impacte <-> Prioritat';
    $Lang->{'allocation'}                          = 'assignar';
    $Lang->{'Priority allocation'}                 = '';
    $Lang->{'Relevant to'}                         = 'Relevant per';
    $Lang->{'Includes'}                            = 'Inclou';
    $Lang->{'Part of'}                             = 'Part de';
    $Lang->{'Depends on'}                          = 'Dep�n de';
    $Lang->{'Required for'}                        = 'Requerit per';
    $Lang->{'Connected to'}                        = 'Connectat a';
    $Lang->{'Alternative to'}                      = 'Alternativa a';
    $Lang->{'Incident State'}                      = 'Estat de l\'incident';
    $Lang->{'Current Incident State'}              = 'Estat actual de l\'incident';
    $Lang->{'Current State'}                       = 'Estat actual';
    $Lang->{'Service-Area'}                        = 'Servei-�rea';
    $Lang->{'Minimum Time Between Incidents'}      = 'Temps m�nim entre incidents';
    $Lang->{'Service Overview'}                    = 'Visi� general del servei';
    $Lang->{'SLA Overview'}                        = 'Visi� general de SLA';
    $Lang->{'Associated Services'}                 = 'Serveis associats';
    $Lang->{'Associated SLAs'}                     = 'SLAs associats';
    $Lang->{'Back End'}                            = 'Servidor';
    $Lang->{'Demonstration'}                       = 'Demostraci�';
    $Lang->{'End User Service'}                    = 'Servei usuari final';
    $Lang->{'Front End'}                           = 'Client';
    $Lang->{'IT Management'}                       = 'Gesti� IT';
    $Lang->{'IT Operational'}                      = 'Operaci� IT';
    $Lang->{'Other'}                               = 'Altres';
    $Lang->{'Project'}                             = 'Projecte';
    $Lang->{'Reporting'}                           = 'Informes';
    $Lang->{'Training'}                            = 'Formaci�';
    $Lang->{'Underpinning Contract'}               = 'Contracte de suport';
    $Lang->{'Availability'}                        = 'Disponibilitat';
    $Lang->{'Errors'}                              = 'Errors';
    $Lang->{'Other'}                               = 'Altres';
    $Lang->{'Recovery Time'}                       = 'Temps de recuperaci�';
    $Lang->{'Resolution Rate'}                     = 'Percentatge de resoluci�';
    $Lang->{'Response Time'}                       = 'Temps de resposta';
    $Lang->{'Transactions'}                        = 'Transaccions';
    $Lang->{'This setting controls the name of the application as is shown in the web interface as well as the tabs and title bar of your web browser.'} = '';
    $Lang->{'Determines the way the linked objects are displayed in each zoom mask.'} = '';
    $Lang->{'List of online repositories (for example you also can use other installations as repositoriy by using Key="http://example.com/otrs/public.pl?Action=PublicRepository&File=" and Content="Some Name").'} = '';

    return 1;
}

1;
