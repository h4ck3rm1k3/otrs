# --
# Kernel/Language/nl_GeneralCatalog.pm - the Dutch translation of GeneralCatalog
# Copyright (C) 2009 Michiel Beijen <michiel 'at' beefreeit.nl>
# --
# $Id: nl_GeneralCatalog.pm,v 1.2 2009/07/20 13:48:30 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nl_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'General Catalog'}            = 'General Catalog';
    $Lang->{'General Catalog Management'} = 'General Catalog Beheer';
    $Lang->{'Catalog Class'}              = 'Catalog Klasse';
    $Lang->{'Add a new Catalog Class.'}   = 'Een nieuwe Catalog Klasse toevoegen';
    $Lang->{'Add Catalog Item'}           = 'Catalog Item toevoegen';
    $Lang->{'Add Catalog Class'}          = 'Catalog Klasse toevoegen';
    $Lang->{'Functionality'}              = 'Functionaliteit';

    return 1;
}

1;
