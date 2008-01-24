# --
# Kernel/Language/de_ImportExport.pm - the german translation of ImportExport
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: de_ImportExport.pm,v 1.3 2008/01/24 16:33:56 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::de_ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub Data {
    my ($Self) = @_;

    $Self->{Translation}->{'Import/Export'}            = 'Import/Export';
    $Self->{Translation}->{'Import/Export Management'} = 'Import/Export Verwaltung';
    $Self->{Translation}->{'Add mapping template'}     = 'Zuordnungstemplate hinzuf�gen';
    $Self->{Translation}->{''}                         = '';
    $Self->{Translation}->{''}                         = '';

    return 1;
}

1;
