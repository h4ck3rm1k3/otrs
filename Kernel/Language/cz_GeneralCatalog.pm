# --
# Kernel/Language/cz_GeneralCatalog.pm - the czech translation of GeneralCatalog
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2007-2008 Milen Koutev
# --
# $Id: cz_GeneralCatalog.pm,v 1.10 2009/07/20 12:19:07 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cz_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.10 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'General Catalog'}            = 'V�eobecn� katalog';
    $Lang->{'General Catalog Management'} = '��zen� v�eobecn�ho katalogu';
    $Lang->{'Catalog Class'}              = 'T��dy v katalogu';
    $Lang->{'Add a new Catalog Class.'}   = 'P�idat novou t��du do katalogu.';
    $Lang->{'Add Catalog Item'}           = 'P�idat prvek do katalogu';
    $Lang->{'Add Catalog Class'}          = 'P�idat t��du do katalogu';
    $Lang->{'Functionality'}              = 'Funkcionalita';

    return 1;
}

1;
