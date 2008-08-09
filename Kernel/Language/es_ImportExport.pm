# --
# Kernel/Language/es_ImportExport.pm - the spanish translation of ImportExport
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: es_ImportExport.pm,v 1.1 2008/08/09 13:46:12 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::es_ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Import/Export'}              = 'Importar/Exportar';
    $Lang->{'Import/Export Management'}   = 'Administraci�n de Importaci�n/Exportaci�n';
    $Lang->{'Add mapping template'}       = 'A�adir mapeado de plantilla';
    $Lang->{'Start Import'}               = 'Iniciar Importar';
    $Lang->{'Start Export'}               = 'Iniciar Exportar';
    $Lang->{'Step'}                       = 'Paso';
    $Lang->{'Edit common information'}    = 'Editar informaci�n com�n';
    $Lang->{'Edit object information'}    = 'Editar informaci�n de objeto';
    $Lang->{'Edit format information'}    = 'Editar formato de informaci�n';
    $Lang->{'Edit mapping information'}   = 'Editar mapeado de informaci�n';
    $Lang->{'Edit search information'}    = 'Editar informaci�n de busqueda';
    $Lang->{'Import information'}         = 'Importar informaci�n';
    $Lang->{'Column'}                     = 'Columna';
    $Lang->{'Restrict export per search'} = 'Restringir exportaci�n por consulta';
    $Lang->{'Source File'}                = 'Archivo origen';
    $Lang->{'Column Seperator'}           = 'Separador de Columna';
    $Lang->{'Tabulator (TAB)'}            = 'Tabulador (TAB)';
    $Lang->{'Semicolon (;)'}              = 'Punto y Coma (;)';
    $Lang->{'Colon (:)'}                  = 'Dos puntos (:)';
    $Lang->{'Dot (.)'}                    = 'Punto (.)';
    $Lang->{'Charset'}                    = '';

    return 1;
}

1;
