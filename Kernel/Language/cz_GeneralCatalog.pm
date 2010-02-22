# --
# Kernel/Language/cz_GeneralCatalog.pm - the czech translation of GeneralCatalog
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2007-2008 Milen Koutev
# Copyright (C) 2010 O2BS.com, s r.o. Jakub Hanus
# --
# $Id: cz_GeneralCatalog.pm,v 1.11 2010/02/22 12:01:52 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cz_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.11 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'General Catalog'}            = 'Hlavn� Katalog';
    $Lang->{'General Catalog Management'} = 'Spr�va Hlavn�ho Katalogu';
    $Lang->{'Catalog Class'}              = 'T��dy Katalogu';
    $Lang->{'Add a new Catalog Class.'}   = 'P�idat Novou T��du Katalogu.';
    $Lang->{'Add Catalog Item'}           = 'P�idat Polo�ku Katalogu';
    $Lang->{'Add Catalog Class'}          = 'P�idat T��du Katalogu';
    $Lang->{'Functionality'}              = 'Funkcionalita';

    return 1;
}

1;
