#!/usr/bin/perl -w
# --
# bin/otrs.DeleteCache.pl - delete all caches
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: otrs.DeleteCache.pl,v 1.5 2011/06/14 20:31:11 mb Exp $
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

# use ../ as lib location
use File::Basename;
use FindBin qw($RealBin);
use lib dirname($RealBin);

use vars qw($VERSION);
$VERSION = qw($Revision: 1.5 $) [1];

use Getopt::Long;
use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Time;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::DB;
use Kernel::System::Cache;

# get options
Getopt::Long::Configure('no_ignore_case');
my %Opts = ();
GetOptions(
    'expired|e' => \$Opts{e},
    'all|a'     => \$Opts{a},
    'help|h'    => \$Opts{h},
);

if ( $Opts{h} ) {
    print "otrs.DeleteCache.pl <Revision $VERSION> - delete OTRS cache\n";
    print "Copyright (C) 2001-2011 OTRS AG, http://otrs.org/\n";
    print "usage: otrs.DeleteCache.pl [--expired]\n";
    exit 1;
}
my %Options;
if ( $Opts{e} ) {
    $Options{Expired} = 1;
}

# ---
# common objects
# ---
my %CommonObject;
$CommonObject{ConfigObject} = Kernel::Config->new();
$CommonObject{EncodeObject} = Kernel::System::Encode->new(%CommonObject);
$CommonObject{LogObject}    = Kernel::System::Log->new(
    LogPrefix => 'OTRS-otrs.DeleteCache.pl',
    %CommonObject,
);
$CommonObject{TimeObject}  = Kernel::System::Time->new(%CommonObject);
$CommonObject{MainObject}  = Kernel::System::Main->new(%CommonObject);
$CommonObject{DBObject}    = Kernel::System::DB->new(%CommonObject);
$CommonObject{CacheObject} = Kernel::System::Cache->new(%CommonObject);

# ---
# cleanup
# ---
if ( !$CommonObject{CacheObject}->CleanUp(%Options) ) {
    exit 1;
}
exit;
