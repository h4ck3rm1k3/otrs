# --
# Kernel/Language/de_GeneralCatalog.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: de_GeneralCatalog.pm,v 1.18 2011/03/03 18:39:46 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_GeneralCatalog;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Funktionalit�t';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'General-Katalog-Verwaltung';
    $Self->{Translation}->{'Add Catalog Item'} = 'Katalog-Eintrag hinzuf�gen';
    $Self->{Translation}->{'Add Catalog Class'} = 'Katalog-Klasse hinzuf�gen';
    $Self->{Translation}->{'Catalog Class'} = 'Katalog-Klasse';

    # SysConfig
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'General-Katalog erstellen und verwalten.';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} = 'Frontendmodul-Registration der AdminGeneralCatalog Konfiguration im Admin-Bereich.';
    $Self->{Translation}->{'General Catalog'} = 'General-Katalog';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} = 'Parameter f�r den Beispiel-Kommentar 2 der General-Katalog-Attribute.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} = 'Parameter f�r die zugriffsberechtigte Gruppe der General-Katalog-Attribute.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'A Catalog Class should have a Name!'} = 'Eine Katalog-Klasse ben�tigt einen Namen!';
    $Self->{Translation}->{'A Catalog Class should have a description!'} = 'Eine General-Katalog-Klasse ben�tigt eine Beschereibung!';
    $Self->{Translation}->{'Catalog Class is required.'} = 'Katalog-Klasse ist erforderlich.';
    $Self->{Translation}->{'Name is required.'} = 'Der Name ist erforderlich.';

}

1;
