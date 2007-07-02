# --
# Kernel/Language/de_GeneralCatalog.pm - the german translation of GeneralCatalog
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: de_GeneralCatalog.pm,v 1.6 2007/07/02 12:06:44 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::Language::de_GeneralCatalog;

use strict;
use warnings;

sub Data {
    my $Self = shift;

    $Self->{Translation}->{'General Catalog'} = 'Allgemeiner Katalog';
    $Self->{Translation}->{'General Catalog Management'} = 'Allgemeiner Katalog Verwaltung';
    $Self->{Translation}->{'Catalog Class'} = 'Katalog Klasse';
    $Self->{Translation}->{'Add a new Catalog Class.'} = 'Eine neue Katalog Klasse hinzuf�gen.';
    $Self->{Translation}->{'Add Catalog Item'} = 'Katalog Eintrag hinzuf�gen';
    $Self->{Translation}->{'Add Catalog Class'} = 'Katalog Klasse hinzuf�gen';
    $Self->{Translation}->{'Functionality'} = 'Funktionalit�t';

    return 1;
}

1;