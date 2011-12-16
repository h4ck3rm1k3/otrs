# --
# Kernel/Config.pm - Config file for OTRS kernel
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: Config.pm.dist,v 1.25 2011/09/16 10:58:28 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
#  Note:
#
#  -->> OTRS does have a lot of config settings. For more settings
#       (Notifications, Ticket::ViewAccelerator, Ticket::NumberGenerator,
#       LDAP, PostMaster, Session, Preferences, ...) see
#       Kernel/Config/Defaults.pm and copy your wanted lines into "this"
#       config file. This file will not be changed on update!
#
# --

package Kernel::Config;

use utf8;

sub DOBEGIN {
    if (-f '/etc/otrs/database.pm') {
      require '/etc/otrs/database.pm';
      if ($dbtype eq 'pgsql') {
          $dbport ||= '5432';
          our $dsn = "DBI:Pg:dbname";
      }
      else {
          $dbport ||= '3306';
          our $dsn = "DBI:mysql:database";
      }
    }
}

BEGIN
{
$dbport = '3306';
our $dsn = "DBI:sqllite:database";
}


sub Load {
    my $Self = shift;
    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
    #                                                      #
    #         Start of your own config options!!!          #
    #                                                      #
    # ---------------------------------------------------- #
    # ---------------------------------------------------- #

    # ---------------------------------------------------- #
    # database settings                                    #
    # ---------------------------------------------------- #
    # DatabaseHost
    # (The database host.)
    $Self->{DatabaseHost} = $dbserver || 'localhost';
    # Database
    # (The database name.)
    $Self->{Database} = $dbname || 'otrs';
    # DatabaseUser
    # (The database user.)
    $Self->{DatabaseUser} = $dbuser || 'otrs';
    # DatabasePw
    # (The password of database user. You also can use bin/otrs.CryptPassword.pl
    # for crypted passwords.)
    $Self->{DatabasePw} = $dbpass;
    # DatabaseDSN
    # (The database DSN for MySQL ==> more: "man DBD::mysql")
    $Self->{DatabaseDSN} =  "$dsn=$Self->{Database};host=$Self->{DatabaseHost};port=$dbport;";

    # (The database DSN for PostgreSQL ==> more: "man DBD::Pg")
    # if you want to use a local socket connection
#    $Self->{DatabaseDSN} = "DBI:Pg:dbname=$Self->{Database};";
    # if you want to use a tcpip connection
#    $Self->{DatabaseDSN} = "DBI:Pg:dbname=$Self->{Database};host=$Self->{DatabaseHost};";
    # if you have PostgresSQL 8.1 or earlier, activate the legacy driver with this line:
#    $Self->{DatabasePostgresqlBefore82} = 1;

    # ---------------------------------------------------- #
    # fs root directory
    # ---------------------------------------------------- #
    #$Self->{Home} = 'usr/share/otrs';
    $Self->{Home} = './scripts/test/jmd_tests/test_config';

    $Self->{ConfigObject}->Set('SeleniumTestsActive',1);
    # ---------------------------------------------------- #
    # insert your own config settings "here"               #
    # config settings taken from Kernel/Config/Defaults.pm #
    # ---------------------------------------------------- #
    # $Self->{SessionUseCookie} = 0;
    # $Self->{CheckMXRecord} = 0;

    # ---------------------------------------------------- #
    # switch off the web based installer for the Debian package
    $Self->{SecureMode} = 1;

    # ---------------------------------------------------- #
    # data inserted by installer                           #
    # ---------------------------------------------------- #
    # $DIBI$

    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
    #                                                      #
    #           End of your own config options!!!          #
    #                                                      #
    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
}

# ---------------------------------------------------- #
# needed system stuff (don't edit this)                #
# ---------------------------------------------------- #
use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.25 $)[1];

use Kernel::Config::Defaults;
push (@ISA, 'Kernel::Config::Defaults');

# -----------------------------------------------------#

1;
