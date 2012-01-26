# --
# Kernel/Language/de_Support.pm - translation file
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: de_Support.pm,v 1.1 2012/01/26 15:36:53 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_Support;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminSupport
    $Self->{Translation}->{''} = '';

    # SysConfig
    $Self->{Translation}->{'Frontend module registration for the AdminSystemStatus object in the admin area.'} = 'Frontendmodul-Registration des AdminSystemStatus-Objekts im Admin-Bereich.';
    $Self->{Translation}->{'The used sender mail address.'} = 'Die verwendete Absenderadresse.';
    $Self->{Translation}->{'Definition of the database checks for the DB2 database.'} = 'Definition der Datenbank-Checks für die DB2 Datenbank.';
    $Self->{Translation}->{'Definition of the database checks for the MSSQL database.'} = 'Definition der Datenbank-Checks für die MSSQL Datenbank.';
    $Self->{Translation}->{'Definition of the database checks for the MySQL database.'} = 'Definition der Datenbank-Checks für die MySQL Datenbank.';
    $Self->{Translation}->{'Definition of the database checks for the Oracle database.'} = 'Definition der Datenbank-Checks für die Oracle Datenbank.';
    $Self->{Translation}->{'Definition of the database checks for the PostgreSQL database.'} = 'Definition der Datenbank-Checks für die PostgreSQL Datenbank.';
    $Self->{Translation}->{'Definition of the Operating System checks.'} = 'Definition der Betriebssystem-Checks.';
    $Self->{Translation}->{'Definition of the OTRS checks.'} = 'Definition der OTRS-Checks.';
    $Self->{Translation}->{'Definition of the webserver checks for the Apache webserver.'} = 'Definition der Webserver-Checks für den Apache Webserver.';
    $Self->{Translation}->{'Definition of the webserver checks for the IIS webserver.'} = 'Definition der Webserver-Checks für den IIS Webserver.';
    $Self->{Translation}->{'Definition of the Cron checks.'} = 'Definition der Cron-Checks.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
