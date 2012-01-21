# --
# Kernel/Language/cs_GeneralCatalog.pm - translation file
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: cs_GeneralCatalog.pm,v 1.3 2012/01/21 21:04:11 sb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cs_GeneralCatalog;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Funkcionalita';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Správa Hlavního Katalogu';
    $Self->{Translation}->{'Add Catalog Item'} = 'Pøidat PoloŸku Katalogu';
    $Self->{Translation}->{'Add Catalog Class'} = 'Pøidat Tøídu Katalogu';
    $Self->{Translation}->{'Catalog Class'} = 'Tøídy Katalogu';

    # SysConfig
    $Self->{Translation}->{'Create and manage the General Catalog.'} = '';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} = '';
    $Self->{Translation}->{'General Catalog'} = 'Hlavní Katalog';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} = '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} = '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
