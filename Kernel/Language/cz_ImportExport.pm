# --
# Kernel/Language/cz_ImportExport.pm - the czech translation of ImportExport
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2010 O2BS.com, s r.o. Jakub Hanus
# --
# $Id: cz_ImportExport.pm,v 1.11 2010/09/14 21:25:45 dz Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cz_ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.11 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Import/Export'}              = 'Import/Export';
    $Lang->{'Import/Export Management'}   = 'Import/Export Spr�va';
    $Lang->{'Add mapping template'}       = 'Nov� �ablona zobrazen�';
    $Lang->{'Start Import'}               = 'Zah�jit Import';
    $Lang->{'Start Export'}               = 'Zah�jit Export';
    $Lang->{'Step'}                       = 'Krok';
    $Lang->{'Edit common information'}    = 'Editace obecn�ch informac�';
    $Lang->{'Edit object information'}    = 'Editace informac� o objektu';
    $Lang->{'Edit format information'}    = 'Editace form�tu';
    $Lang->{'Edit mapping information'}   = 'Editace mapov�n�';
    $Lang->{'Edit search information'}    = 'Editace vyhled�v�n�';
    $Lang->{'Import information'}         = 'Informace o Importu';
    $Lang->{'Column'}                     = 'Sloupec';
    $Lang->{'Restrict export per search'} = 'Omezit Export vyhled�v�n�m';
    $Lang->{'Source File'}                = 'Zdrojov� Soubor';
    $Lang->{'Column Separator'}           = 'Odd�lova� Sloupc�';
    $Lang->{'Tabulator (TAB)'}            = 'Tabul�tor (TAB)';
    $Lang->{'Semicolon (;)'}              = 'St�edn�k (;)';
    $Lang->{'Colon (:)'}                  = 'Dvojte�ka (:)';
    $Lang->{'Dot (.)'}                    = 'Te�ka (.)';
    $Lang->{'Charset'}                    = 'Znakov� sada';
    $Lang->{'Frontend module registration for the agent interface.'} = '';
    $Lang->{'Format backend module registration for the import/export module.'} = '';
    $Lang->{'Import and export object information.'} = '';
    $Lang->{'Object is required!'} = '';
    $Lang->{'Format is required!'} = '';
    $Lang->{'Class is required!'} = '';
    $Lang->{'Column Separator is required!'} = '';
    $Lang->{'No map elements found.'} = '';

    return 1;
}

1;
