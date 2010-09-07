# --
# Kernel/Language/es_GeneralCatalog.pm - the spanish translation of GeneralCatalog
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Aquiles Cohen
# --
# $Id: es_GeneralCatalog.pm,v 1.8 2010/09/07 14:28:07 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.8 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'General Catalog'}            = 'Cat�logo General';
    $Lang->{'General Catalog Management'} = 'Gesti�n del Cat�logo General';
    $Lang->{'Catalog Class'}              = 'Clase de Cat�logo';
    $Lang->{'Add a new Catalog Class.'}   = 'A�adir una nueva Clase al Cat�logo';
    $Lang->{'Add Catalog Item'}           = 'A�adir Elemento al Cat�logo';
    $Lang->{'Add Catalog Class'}          = 'A�adir Clase al Cat�logo';
    $Lang->{'Functionality'}              = 'Funcionalidad';
    $Lang->{'Parameters for the example comment 2 of the general catalog attributes.'}
        = 'Par�metros para el ejemplo comentario 2 de los atributos del cat�logo general.';
    $Lang->{'Parameters for the example permission groups of the general catalog attributes.'}
        = 'Par�metros para los permisos de ejemplo de los atributos del cat�logo general.';

    return 1;
}

1;
