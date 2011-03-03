# --
# Kernel/Language/es_GeneralCatalog.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: es_GeneralCatalog.pm,v 1.10 2011/03/03 18:39:46 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_GeneralCatalog;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Funcionalidad';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Gesti�n del Cat�logo General';
    $Self->{Translation}->{'Add Catalog Item'} = 'A�adir Elemento al Cat�logo';
    $Self->{Translation}->{'Add Catalog Class'} = 'A�adir Clase al Cat�logo';
    $Self->{Translation}->{'Catalog Class'} = 'Clase de Cat�logo';

    # SysConfig
    $Self->{Translation}->{'Create and manage the General Catalog.'} = '';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} = '';
    $Self->{Translation}->{'General Catalog'} = 'Cat�logo General';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} = 'Par�metros para el ejemplo comentario 2 de los atributos del cat�logo general.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} = 'Par�metros para los permisos de ejemplo de los atributos del cat�logo general.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
