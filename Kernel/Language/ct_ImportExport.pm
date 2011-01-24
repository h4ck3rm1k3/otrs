# --
# Kernel/Language/ct_ImportExport.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: ct_ImportExport.pm,v 1.8 2011/01/24 20:49:14 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ct_ImportExport;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Afegir plantilla de mapatge';
    $Self->{Translation}->{'Charset'} = 'Conjunt de car�cters';
    $Self->{Translation}->{'Colon (:)'} = 'Dos punts (:)';
    $Self->{Translation}->{'Column'} = 'Columna';
    $Self->{Translation}->{'Column Separator'} = 'Separador de columna';
    $Self->{Translation}->{'Dot (.)'} = 'Punt (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Punt i coma (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulador (TAB)';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Gesti� de Importar/Exportar';
    $Self->{Translation}->{'Add template'} = '';
    $Self->{Translation}->{'Create a template to import and export object information.'} = '';
    $Self->{Translation}->{'Start Import'} = 'Comen�ar importaci�';
    $Self->{Translation}->{'Start Export'} = 'Comen�ar exportaci�';
    $Self->{Translation}->{'Delete Template'} = '';
    $Self->{Translation}->{'Step'} = 'Pas';
    $Self->{Translation}->{'Edit common information'} = 'Editar informaci� comuna';
    $Self->{Translation}->{'Object is required!'} = '';
    $Self->{Translation}->{'Format is required!'} = '';
    $Self->{Translation}->{'Edit object information'} = 'Editar informaci� d\'objecte';
    $Self->{Translation}->{'Edit format information'} = 'Editar informaci� de format';
    $Self->{Translation}->{' is required!'} = '';
    $Self->{Translation}->{'Edit mapping information'} = 'Editar informaci� de mapatge';
    $Self->{Translation}->{'No map elements found.'} = '';
    $Self->{Translation}->{'Add Mapping Element'} = '';
    $Self->{Translation}->{'Edit search information'} = 'Editar informaci� de recerca';
    $Self->{Translation}->{'Restrict export per search'} = 'Restringir exportaci� per recerca';
    $Self->{Translation}->{'Import information'} = 'Importar informaci�';
    $Self->{Translation}->{'Source File'} = 'Fitxer font';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} = '';
    $Self->{Translation}->{'Import and export object information.'} = '';
    $Self->{Translation}->{'Import/Export'} = 'Importar/Exportar';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
