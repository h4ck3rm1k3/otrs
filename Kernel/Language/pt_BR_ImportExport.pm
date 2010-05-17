# --
# Kernel/Language/pt_BR_ImportExport.pm - the Brazilian translation of ImportExport
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2010 Cristiano Kornd�rfer, http://www.dorfer.com.br/
# --
# $Id: pt_BR_ImportExport.pm,v 1.2 2010/05/17 13:49:43 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Import/Export'}              = 'Importa��o/Exporta��o';
    $Lang->{'Import/Export Management'}   = 'Gerenciamento de Importa��o/Exporta��o';
    $Lang->{'Add mapping template'}       = 'Adicionar Modelo de Mapeamento';
    $Lang->{'Start Import'}               = 'Iniciar Importa��o';
    $Lang->{'Start Export'}               = 'Iniciar Exporta��o';
    $Lang->{'Step'}                       = 'Passo';
    $Lang->{'Edit common information'}    = 'Editar informa��es comuns';
    $Lang->{'Edit object information'}    = 'Editar informa��es do objeto';
    $Lang->{'Edit format information'}    = 'Editar informa��es do formato';
    $Lang->{'Edit mapping information'}   = 'Editar informa��es do mapeamento';
    $Lang->{'Edit search information'}    = 'Editar informa��es de pesquisa';
    $Lang->{'Import information'}         = 'Informa��es de importa��o';
    $Lang->{'Column'}                     = 'Coluna';
    $Lang->{'Restrict export per search'} = 'Restringir exporta��o por pesquisa';
    $Lang->{'Source File'}                = 'Arquivo de Origem';
    $Lang->{'Column Separator'}           = 'Separador de Colunas';
    $Lang->{'Tabulator (TAB)'}            = 'Tabula��o (TAB)';
    $Lang->{'Semicolon (;)'}              = 'Ponto e V�rgula (;)';
    $Lang->{'Colon (:)'}                  = 'Dois Pontos (:)';
    $Lang->{'Dot (.)'}                    = 'Ponto (.)';
    $Lang->{'Charset'}                    = 'Codifica��o de Caracteres';

    return 1;
}

1;
