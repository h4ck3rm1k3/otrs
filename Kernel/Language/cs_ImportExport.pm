# --
# Kernel/Language/cs_ImportExport.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: cs_ImportExport.pm,v 1.2 2011/01/24 20:49:14 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cs_ImportExport;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Nov� �ablona zobrazen�';
    $Self->{Translation}->{'Charset'} = 'Znakov� sada';
    $Self->{Translation}->{'Colon (:)'} = 'Dvojte�ka (:)';
    $Self->{Translation}->{'Column'} = 'Sloupec';
    $Self->{Translation}->{'Column Separator'} = 'Odd�lova� Sloupc�';
    $Self->{Translation}->{'Dot (.)'} = 'Te�ka (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'St�edn�k (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabul�tor (TAB)';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Import/Export Spr�va';
    $Self->{Translation}->{'Add template'} = '';
    $Self->{Translation}->{'Create a template to import and export object information.'} = '';
    $Self->{Translation}->{'Start Import'} = 'Zah�jit Import';
    $Self->{Translation}->{'Start Export'} = 'Zah�jit Export';
    $Self->{Translation}->{'Delete Template'} = '';
    $Self->{Translation}->{'Step'} = 'Krok';
    $Self->{Translation}->{'Edit common information'} = 'Editace obecn�ch informac�';
    $Self->{Translation}->{'Object is required!'} = '';
    $Self->{Translation}->{'Format is required!'} = '';
    $Self->{Translation}->{'Edit object information'} = 'Editace informac� o objektu';
    $Self->{Translation}->{'Edit format information'} = 'Editace form�tu';
    $Self->{Translation}->{' is required!'} = '';
    $Self->{Translation}->{'Edit mapping information'} = 'Editace mapov�n�';
    $Self->{Translation}->{'No map elements found.'} = '';
    $Self->{Translation}->{'Add Mapping Element'} = '';
    $Self->{Translation}->{'Edit search information'} = 'Editace vyhled�v�n�';
    $Self->{Translation}->{'Restrict export per search'} = 'Omezit Export vyhled�v�n�m';
    $Self->{Translation}->{'Import information'} = 'Informace o Importu';
    $Self->{Translation}->{'Source File'} = 'Zdrojov� Soubor';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} = '';
    $Self->{Translation}->{'Import and export object information.'} = '';
    $Self->{Translation}->{'Import/Export'} = 'Import/Export';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
