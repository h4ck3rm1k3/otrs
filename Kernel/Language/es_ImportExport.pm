# --
# Kernel/Language/es_ImportExport.pm - the spanish translation of ImportExport
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Aquiles Cohen
# --
# $Id: es_ImportExport.pm,v 1.8 2010/09/08 16:16:31 dz Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.8 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Import/Export'}              = 'Importar/Exportar';
    $Lang->{'Import/Export Management'}   = 'Gesti�n de Importaci�n/Exportaci�n';
    $Lang->{'Add mapping template'}       = 'A�adir mapeado de plantilla';
    $Lang->{'Start Import'}               = 'Iniciar Importaci�n';
    $Lang->{'Start Export'}               = 'Iniciar Exportaci�n';
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
    $Lang->{'Column Separator'}           = 'Separador de Columna';
    $Lang->{'Tabulator (TAB)'}            = 'Tabulador (TAB)';
    $Lang->{'Semicolon (;)'}              = 'Punto y Coma (;)';
    $Lang->{'Colon (:)'}                  = 'Dos puntos (:)';
    $Lang->{'Dot (.)'}                    = 'Punto (.)';
    $Lang->{'Charset'}                    = '';
    $Lang->{'Frontend module registration for the AdminImportExport in the admin area.'} = 'Registro de m�dulo frontend AdminImportExport en el �rea de admin';
    $Lang->{'Format backend module registration for the import/export module.'} = 'Formato backend para el m�dulo import/export.';
    $Lang->{'Import and export object information.'} = 'Importar o exportar informaci�n de objetos';
    return 1;
}

1;
