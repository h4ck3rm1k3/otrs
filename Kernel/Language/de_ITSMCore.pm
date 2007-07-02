# --
# Kernel/Language/de_ITSMCore.pm - the german translation of ITSMCore
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: de_ITSMCore.pm,v 1.6 2007/07/02 13:29:20 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::Language::de_ITSMCore;

use strict;
use warnings;

sub Data {
    my $Self = shift;

    $Self->{Translation}->{'Priority Management'} = 'Priorit�t Verwaltung';
    $Self->{Translation}->{'Add a new Priority.'} = 'Eine neue Priorit�t hinzuf�gen.';
    $Self->{Translation}->{'Add Priority'} = 'Priorit�t hinzuf�gen';

    $Self->{Translation}->{'Criticality'} = 'Kritikalit�t';
    $Self->{Translation}->{'Impact'} = 'Auswirkung';
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'Kritikalit�t <-> Auswirkung <-> Priorit�t';
    $Self->{Translation}->{'allocate'} = 'zuordnen';

    $Self->{Translation}->{'Relevant to'} = 'Relevant f�r';
    $Self->{Translation}->{'Includes'} = 'Beinhaltet';
    $Self->{Translation}->{'Part of'} = 'Teil von';
    $Self->{Translation}->{'Depends on'} = 'H�ngt ab von';
    $Self->{Translation}->{'Required for'} = 'Ben�tigt f�r';
    $Self->{Translation}->{'Connected to'} = 'Verbunden mit';
    $Self->{Translation}->{'Alternative to'} = 'Alternativ zu';

    return 1;
}

1;