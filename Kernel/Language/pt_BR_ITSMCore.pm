# --
# Kernel/Language/pt_BR_ITSMCore.pm - the Brazilian translation of ITSMCore
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2010 Cristiano Kornd�rfer, http://www.dorfer.com.br/
# --
# $Id: pt_BR_ITSMCore.pm,v 1.1 2010/03/01 09:50:45 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = 'Criticalidade';
    $Lang->{'Impact'}                              = 'Impacto';
    $Lang->{'Criticality <-> Impact <-> Priority'} = 'Criticalidade <-> Impacto <-> Prioridade';
    $Lang->{'allocate'}                            = 'Alocar';
    $Lang->{'Relevant to'}                         = 'Relevante a';
    $Lang->{'Includes'}                            = 'Inclui';
    $Lang->{'Part of'}                             = 'Parte de';
    $Lang->{'Depends on'}                          = 'Depende de';
    $Lang->{'Required for'}                        = 'Requisitado por';
    $Lang->{'Connected to'}                        = 'Conectado a';
    $Lang->{'Alternative to'}                      = 'Alternativa a';
    $Lang->{'Incident State'}                      = 'Situa��o de Incidentes';
    $Lang->{'Current Incident State'}              = 'Situa��o Atual de Incidentes';
    $Lang->{'Current State'}                       = 'Situa��o Atual';
    $Lang->{'Service-Area'}                        = 'Servi�o-�rea';
    $Lang->{'Minimum Time Between Incidents'}      = 'Tempo M�nimo entre Incidentes';
    $Lang->{'Service Overview'}                    = 'Resumo do Servi�o';
    $Lang->{'SLA Overview'}                        = 'Resumo da SLA';
    $Lang->{'Associated Services'}                 = 'Servi�os Associados';
    $Lang->{'Associated SLAs'}                     = 'SLAs Associadas';
    $Lang->{'Back End'}                            = '';
    $Lang->{'Demonstration'}                       = 'Demonstra��o';
    $Lang->{'End User Service'}                    = 'Servi�o a Usu�rio Final';
    $Lang->{'Front End'}                           = '';
    $Lang->{'IT Management'}                       = 'Gerenciamento de TI';
    $Lang->{'IT Operational'}                      = 'Opera��es de TI';
    $Lang->{'Other'}                               = 'Outro';
    $Lang->{'Project'}                             = 'Projeto';
    $Lang->{'Reporting'}                           = 'Relat�rio';
    $Lang->{'Training'}                            = 'Treinamento';
    $Lang->{'Underpinning Contract'}               = 'Contrato com Terceiros (UC)';
    $Lang->{'Availability'}                        = 'Avaliabilidade';
    $Lang->{'Errors'}                              = 'Erros';
    $Lang->{'Other'}                               = 'Outro';
    $Lang->{'Recovery Time'}                       = 'Tempo de Recupera��o';
    $Lang->{'Resolution Rate'}                     = 'Taxa de Resolu��o';
    $Lang->{'Response Time'}                       = 'Tempo de Resposta';
    $Lang->{'Transactions'}                        = 'Transa��es';

    return 1;
}

1;
