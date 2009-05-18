# --
# Kernel/Language/pl_ImportExport.pm - the polish translation of ImportExport
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Maciej Loszajc
# --
# $Id: pl_ImportExport.pm,v 1.4 2009/05/18 09:42:52 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pl_ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Import/Export'}              = 'Import/Export';
    $Lang->{'Import/Export Management'}   = 'Zarz1dzanie Importem/Exportem';
    $Lang->{'Add mapping template'}       = '';
    $Lang->{'Start Import'}               = 'Rozpocznij Import';
    $Lang->{'Start Export'}               = 'Rozpocznij Export';
    $Lang->{'Step'}                       = '';
    $Lang->{'Edit common information'}    = '';
    $Lang->{'Edit object information'}    = '';
    $Lang->{'Edit format information'}    = '';
    $Lang->{'Edit mapping information'}   = '';
    $Lang->{'Edit search information'}    = '';
    $Lang->{'Import information'}         = '';
    $Lang->{'Column'}                     = 'Kolumna';
    $Lang->{'Restrict export per search'} = '';
    $Lang->{'Source File'}                = 'Plik Yr�d3owy';
    $Lang->{'Column Seperator'}           = 'Separator kolumny';
    $Lang->{'Tabulator (TAB)'}            = 'Tabulator (TAB)';
    $Lang->{'Semicolon (;)'}              = 'Orednik (;)';
    $Lang->{'Colon (:)'}                  = 'Dwukropek (:)';
    $Lang->{'Dot (.)'}                    = 'Kropka (.)';
    $Lang->{'Charset'}                    = 'Kodowanie';

    return 1;
}

1;
