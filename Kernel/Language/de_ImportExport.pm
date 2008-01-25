# --
# Kernel/Language/de_ImportExport.pm - the german translation of ImportExport
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: de_ImportExport.pm,v 1.4 2008/01/25 17:50:43 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::de_ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub Data {
    my ($Self) = @_;

    $Self->{Translation}->{'Import/Export'}            = 'Import/Export';
    $Self->{Translation}->{'Import/Export Management'} = 'Import/Export Verwaltung';
    $Self->{Translation}->{'Add mapping template'}     = 'Zuordnungstemplate hinzuf�gen';
    $Self->{Translation}->{'Step'}                     = 'Schritt';
    $Self->{Translation}->{'Edit common information'}  = 'Allgemeine Informationen bearbeiten';
    $Self->{Translation}->{'Edit object information'}  = 'Objekt Informationen bearbeiten';
    $Self->{Translation}->{'Edit format information'}  = 'Format Informationen bearbeiten';
    $Self->{Translation}->{''}                         = '';
    $Self->{Translation}->{''}                         = '';
    $Self->{Translation}->{''}                         = '';
    $Self->{Translation}->{''}                         = '';
    $Self->{Translation}->{''}                         = '';
    $Self->{Translation}->{''}                         = '';

    return 1;
}

1;
