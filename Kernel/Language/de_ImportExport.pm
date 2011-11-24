# --
# Kernel/Language/de_ImportExport.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: de_ImportExport.pm,v 1.28 2011/11/24 15:42:26 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ImportExport;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Mapping-Template hinzufügen';
    $Self->{Translation}->{'Charset'} = 'Zeichensatz';
    $Self->{Translation}->{'Colon (:)'} = 'Doppelpunkt (:)';
    $Self->{Translation}->{'Column'} = 'Spalte';
    $Self->{Translation}->{'Column Separator'} = 'Spaltentrenner';
    $Self->{Translation}->{'Dot (.)'} = 'Punkt (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Semicolon (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulator (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Mit Spaltenüberschriften';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Import/Export-Verwaltung';
    $Self->{Translation}->{'Add template'} = 'Template hinzufügen';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Erstellen einer Vorlage zum Importieren und Exportieren von Objekt-Informationen.';
    $Self->{Translation}->{'Start Import'} = 'Import starten';
    $Self->{Translation}->{'Start Export'} = 'Export starten';
    $Self->{Translation}->{'Delete Template'} = 'Template löschen';
    $Self->{Translation}->{'Step'} = 'Schritt';
    $Self->{Translation}->{'Edit common information'} = 'Allgemeine Informationen bearbeiten';
    $Self->{Translation}->{'Object is required!'} = 'Objekt ist erforderlich!';
    $Self->{Translation}->{'Format is required!'} = 'Format ist erforderlich!';
    $Self->{Translation}->{'Edit object information'} = 'Objekt-Informationen bearbeiten';
    $Self->{Translation}->{'Edit format information'} = 'Format-Informationen bearbeiten';
    $Self->{Translation}->{' is required!'} = ' wird benötigt!';
    $Self->{Translation}->{'Edit mapping information'} = 'Mapping-Informationen bearbeiten';
    $Self->{Translation}->{'No map elements found.'} = 'Keine Mapping-Elemente gefunden.';
    $Self->{Translation}->{'Add Mapping Element'} = 'Mapping-Element hinzufügen';
    $Self->{Translation}->{'Edit search information'} = 'Such-Informationen bearbeiten';
    $Self->{Translation}->{'Restrict export per search'} = 'Export per Suche einschränken';
    $Self->{Translation}->{'Import information'} = 'Import-Informationen';
    $Self->{Translation}->{'Source File'} = 'Quell-Datei';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} = 'Format-Backend Modul-Registration des Import/Export Moduls.';
    $Self->{Translation}->{'Import and export object information.'} = 'Impotieren und Exportieren von Objekt-Informationen.';
    $Self->{Translation}->{'Import/Export'} = 'Import/Export';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
