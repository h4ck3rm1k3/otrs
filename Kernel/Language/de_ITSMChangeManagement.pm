# --
# Kernel/Language/de_ITSMChangeManagement.pm - the german translation of ITSMChangeManagement
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: de_ITSMChangeManagement.pm,v 1.4 2009/11/12 09:00:56 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMChangeManagement;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'A change must have a title!'}        = '�nderungen brauchen einen Titel!';
    $Lang->{'A workorder must have a title!'}     = 'Arbeitsauftr�ge brauchen einen Titel!';
    $Lang->{'Add Change'}                         = 'Neue �nderung';
    $Lang->{'The planned start time is invalid!'} = 'Der geplante Startzeitpunk ist ung�ltig!';
    $Lang->{'The planned end time is invalid!'}   = 'Der geplante Endzeitpunkt ist ung�ltig!';
    $Lang->{'The planned start time must be before the planned end time!'}
        = 'Der geplante Start muss vor dem geplanten Ende liegen!';

    return 1;
}

1;
