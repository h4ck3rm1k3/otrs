# --
# Kernel/Language/pt_BR_ImportExport.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: pt_BR_ImportExport.pm,v 1.8 2011/05/12 11:48:36 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_ImportExport;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Adicionar modelo de mapeamento';
    $Self->{Translation}->{'Charset'} = 'Codifica��o de Caracteres';
    $Self->{Translation}->{'Colon (:)'} = 'Dois Pontos (:)';
    $Self->{Translation}->{'Column'} = 'Coluna';
    $Self->{Translation}->{'Column Separator'} = 'Separador de Colunas';
    $Self->{Translation}->{'Dot (.)'} = 'Ponto (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Ponto e V�rgula (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabula��o (TAB)';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Gerenciamento de Importa��o/Exporta��o';
    $Self->{Translation}->{'Add template'} = 'Adicionar modelo';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Criar um modelo para importar e exportar informa��es de objeto.';
    $Self->{Translation}->{'Start Import'} = 'Iniciar Importa��o';
    $Self->{Translation}->{'Start Export'} = 'Iniciar Exporta��o';
    $Self->{Translation}->{'Delete Template'} = 'Excluir Modelo';
    $Self->{Translation}->{'Step'} = 'Passo';
    $Self->{Translation}->{'Edit common information'} = 'Editar informa��es comuns';
    $Self->{Translation}->{'Object is required!'} = 'Objeto � necess�rio!';
    $Self->{Translation}->{'Format is required!'} = 'O formato � necess�rio!';
    $Self->{Translation}->{'Edit object information'} = 'Editar informa��es do objeto';
    $Self->{Translation}->{'Edit format information'} = 'Editar informa��es do formato';
    $Self->{Translation}->{' is required!'} = ' � necess�rio!';
    $Self->{Translation}->{'Edit mapping information'} = 'Editar informa��es do mapeamento';
    $Self->{Translation}->{'No map elements found.'} = 'N�o h� elementos mapa encontrado.';
    $Self->{Translation}->{'Add Mapping Element'} = 'Adicionar elemento de mapeamento';
    $Self->{Translation}->{'Edit search information'} = 'Editar informa��es de pesquisa';
    $Self->{Translation}->{'Restrict export per search'} = 'Restringir exporta��o por pesquisa';
    $Self->{Translation}->{'Import information'} = 'Informa��es de importa��o';
    $Self->{Translation}->{'Source File'} = 'Arquivo de Origem';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} = 'Formato de registro backend do m�dulo de importa��o / exporta��o m�dulo.';
    $Self->{Translation}->{'Import and export object information.'} = 'Importar e exportar informa��es de objeto.';
    $Self->{Translation}->{'Import/Export'} = 'Importa��o/Exporta��o';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
