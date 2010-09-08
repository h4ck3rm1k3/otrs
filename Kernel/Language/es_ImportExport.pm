# --
# Kernel/Language/es_ImportExport.pm - the spanish translation of ImportExport
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Aquiles Cohen
# --
# $Id: es_ImportExport.pm,v 1.9 2010/09/08 18:02:53 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.9 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Import/Export'}              = 'Importar/Exportar';
    $Lang->{'Import/Export Management'}   = 'Gesti�n de Importaci�n/Exportaci�n';
    $Lang->{'Add mapping template'}       = 'A�adir plantilla de mapeo';
    $Lang->{'Start Import'}               = 'Iniciar Importaci�n';
    $Lang->{'Start Export'}               = 'Iniciar Exportaci�n';
    $Lang->{'Step'}                       = 'Paso';
    $Lang->{'Edit common information'}    = 'Editar informaci�n com�n';
    $Lang->{'Edit object information'}    = 'Editar informaci�n de objeto';
    $Lang->{'Edit format information'}    = 'Editar informaci�n del formato';
    $Lang->{'Edit mapping information'}   = 'Editar informaci�n de mapeo';
    $Lang->{'Edit search information'}    = 'Editar informaci�n de b�squeda';
    $Lang->{'Import information'}         = 'Importar informaci�n';
    $Lang->{'Column'}                     = 'Columna';
    $Lang->{'Restrict export per search'} = 'Restringir exportaci�n por b�squeda';
    $Lang->{'Source File'}                = 'Archivo origen';
    $Lang->{'Column Separator'}           = 'Separador de Columna';
    $Lang->{'Tabulator (TAB)'}            = 'Tabulador (TAB)';
    $Lang->{'Semicolon (;)'}              = 'Punto y Coma (;)';
    $Lang->{'Colon (:)'}                  = 'Dos puntos (:)';
    $Lang->{'Dot (.)'}                    = 'Punto (.)';
    $Lang->{'Charset'}                    = 'Juego de caracteres';
    $Lang->{'Frontend module registration for the agent interface.'} = 'Registro de m�dulo frontend para la interfaz del agente.';
    $Lang->{'Format backend module registration for the import/export module.'} = 'Registro de m�dulo de formato backend para el m�dulo import/export.';
    $Lang->{'Import and export object information.'} = 'Importar y exportar informaci�n de objetos.';
    return 1;
}

1;
