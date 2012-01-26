# --
# Kernel/Config.pm - Config file for OTRS kernel
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: Config.pm.dist,v 1.23 2010/01/13 22:25:00 martin Exp $
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

BEGIN {
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

    # ---------------------------------------------------- #
    # fs root directory
    # ---------------------------------------------------- #
    $Self->{Home} = '/usr/share/otrs';

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
$VERSION = qw($Revision: 1.23 $)[1];

use Kernel::Config::Defaults;
push (@ISA, 'Kernel::Config::Defaults');

# -----------------------------------------------------#

1;
