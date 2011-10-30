#!/usr/bin/perl -w
# --
# bin/otrs.AddGroup.pl - add new system groups
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: otrs.AddGroup.pl,v 1.4 2010/08/06 17:48:09 cr Exp $
# --
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU AFFERO General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# or see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;

use File::Basename;
use FindBin qw($RealBin);
use lib dirname($RealBin);

use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::DB;
use Kernel::System::Group;
use Kernel::System::Main;

my %opts;

use Getopt::Std;
getopts( 'c:n:h', \%opts );

if ( $opts{h} ) {
    print STDERR "Usage: bin/otrs.AddGroup [-c <comment>] -n <groupname>\n";
    exit;
}

if ( !$opts{n} ) {
    print STDERR "ERROR: Need -n groupname\n";
    exit 1;
}

# create common objects
my %CommonObject;
$CommonObject{ConfigObject} = Kernel::Config->new();
$CommonObject{EncodeObject} = Kernel::System::Encode->new(%CommonObject);
$CommonObject{LogObject}    = Kernel::System::Log->new(
    LogPrefix => 'OTRS-otrs.AddGroup.pl',
    %CommonObject,
);
$CommonObject{MainObject}  = Kernel::System::Main->new(%CommonObject);
$CommonObject{DBObject}    = Kernel::System::DB->new(%CommonObject);
$CommonObject{GroupObject} = Kernel::System::Group->new(%CommonObject);

# user id of the person adding the record
my %Param;
$Param{UserID} = '1';

# Validrecord
$Param{ValidID} = '1';
$Param{Comment} = $opts{c} || '';
$Param{Name}    = $opts{n} || '';

if ( my $GID = $CommonObject{GroupObject}->GroupAdd(%Param) ) {
    print "Group '$opts{n}' added. Group id is '$GID'\n";
}
else {
    print STDERR "ERROR: Can't add group\n";
}

exit(0);
