# --
# Kernel/Language/de_ITSMCore.pm - the german translation of ITSMCore
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: de_ITSMCore.pm,v 1.4 2007/05/22 07:52:58 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::Language::de_ITSMCore;

use strict;

sub Data {
    my $Self = shift;

    # AdminTicketPriority
    $Self->{Translation}->{'Priority Management'} = 'Priorit�t Verwaltung';
    $Self->{Translation}->{'Add a new Priority.'} = 'Eine neue Priorit�t hinzuf�gen.';
    $Self->{Translation}->{'Add Priority'} = 'Priorit�t hinzuf�gen';

    # AdminCIPAllocate
    $Self->{Translation}->{'Criticality'} = 'Kritikalit�t';
    $Self->{Translation}->{'Impact'} = 'Auswirkung';
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'Kritikalit�t <-> Auswirkung <-> Priorit�t';
    $Self->{Translation}->{'allocate'} = 'zuordnen';
}

1;