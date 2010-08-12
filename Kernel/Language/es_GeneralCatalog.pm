# --
# Kernel/Language/es_GeneralCatalog.pm - the spanish translation of GeneralCatalog
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Aquiles Cohen
# --
# $Id: es_GeneralCatalog.pm,v 1.7 2010/08/12 22:50:38 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'General Catalog'}            = 'Catalogo General';
    $Lang->{'General Catalog Management'} = 'Gesti�n del Catalogo General';
    $Lang->{'Catalog Class'}              = 'Clase de Catalogo';
    $Lang->{'Add a new Catalog Class.'}   = 'A�adir una nueva Clase al Catalogo';
    $Lang->{'Add Catalog Item'}           = 'A�adir Elemento al Catalogo';
    $Lang->{'Add Catalog Class'}          = 'A�adir Clase al Catalogo';
    $Lang->{'Functionality'}              = 'Funcionalidad';
    $Lang->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'}
        = 'Registro para la configuraci�n del m�dulo AdminGeneralCatalog dentro el �rea de administraci�n';
    $Lang->{'Parameters for the example comment 2 of general catalog attributes.'}
        = 'Par�metros para el ejemplo comentario 2 de los atributos del cat�logo general';
    $Lang->{'Parameters for the example permission groups of general catalog attributes.'}
        = 'Par�metros para el ejemplo grupos de permisos de los atributos del cat�logo general';

    return 1;
}

1;
