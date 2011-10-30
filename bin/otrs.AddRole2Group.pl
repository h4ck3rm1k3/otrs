#!/usr/bin/perl -w
# --
# bin/otrs.AddRole2Group.pl - Assign Roles to Groups from CLI
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: otrs.AddRole2Group.pl,v 1.4 2010/08/06 17:49:20 cr Exp $
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
$VERSION = qw($Revision: 1.4 $) [1];

use Getopt::Std;
use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Time;
use Kernel::System::DB;
use Kernel::System::Log;
use Kernel::System::Queue;
use Kernel::System::Group;
use Kernel::System::Main;

# get options
my %Opts = ();
getopts( 'hg:r:R:M:C:N:O:P:W:', \%Opts );
if ( $Opts{h} ) {
    print "otrs.AddRole2Group.pl <Revision $VERSION> - assign Roles to Groups\n";
    print "Copyright (C) 2001-2010 OTRS AG, http://otrs.org/\n";
    print
        "usage: otrs.AddRole2Group.pl -g <GROUP> -r <ROLE> [-R<READ> -M<MOVE_INTO> -C<CREATE> -N<NOTE> -O<OWNER> -P<PRIORITY> -W<RW>] \n";
    print "For Options: R,M,C,N,O,P,W setting to 0 or 1 is expected \n";
    exit 1;
}

if ( !$Opts{r} ) {
    print STDERR "ERROR: Need -r <ROLE>\n";
    exit 1;
}
if ( !$Opts{g} ) {
    print STDERR "ERROR: Need -g <GROUP>\n";
    exit 1;
}

# create common objects
my %CommonObject = ();
$CommonObject{ConfigObject} = Kernel::Config->new(%CommonObject);
$CommonObject{EncodeObject} = Kernel::System::Encode->new(%CommonObject);
$CommonObject{LogObject}    = Kernel::System::Log->new(
    LogPrefix => 'OTRS-otrs.AddRole2Group.pl',
    %CommonObject,
);
$CommonObject{MainObject}  = Kernel::System::Main->new(%CommonObject);
$CommonObject{DBObject}    = Kernel::System::DB->new(%CommonObject);
$CommonObject{GroupObject} = Kernel::System::Group->new(%CommonObject);

# check group
my $GroupID = $CommonObject{GroupObject}->GroupLookup( Group => $Opts{g} );
if ( !$GroupID ) {
    print STDERR "ERROR: Found no GroupID for $Opts{g}\n";
    exit 1;
}

# check Role
my $RoleID = $CommonObject{GroupObject}->RoleLookup( Role => $Opts{r} );
if ( !$RoleID ) {
    print STDERR "ERROR: Found no RoleID for $Opts{r}\n";
    exit 1;
}

# add queue
if (
    !$CommonObject{GroupObject}->GroupRoleMemberAdd(
        GID        => $GroupID,
        RID        => $RoleID,
        Permission => {
            ro        => $Opts{R} || 0,
            move_into => $Opts{M} || 0,
            create    => $Opts{C} || 0,
            note      => $Opts{N} || 0,
            owner     => $Opts{O} || 0,
            priority  => $Opts{P} || 0,
            rw        => $Opts{W} || 0,
        },
        UserID => 1,
    )
    )
{
    print STDERR "ERROR: Can't set permissions!\n";
    exit 1;
}
else {
    print "Added Group '$Opts{g} to Role '$Opts{r}'.'\n";
    exit(0);
}
