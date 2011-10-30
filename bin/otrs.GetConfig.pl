#!/usr/bin/perl -w
# --
# bin/otrs.GetConfig.pl - get OTRS config vars
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: otrs.GetConfig.pl,v 1.3 2011/03/25 13:53:58 ep Exp $
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
$VERSION = qw($Revision: 1.3 $) [1];

use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::Main;

# common objects
my %CommonObject = ();
$CommonObject{ConfigObject} = Kernel::Config->new();
$CommonObject{EncodeObject} = Kernel::System::Encode->new(%CommonObject);
$CommonObject{LogObject}    = Kernel::System::Log->new(
    LogPrefix => 'OTRS-otrs.GetConfig',
    %CommonObject,
);
$CommonObject{MainObject} = Kernel::System::Main->new(%CommonObject);

# print wanted var
my $Key = shift || '';
if ($Key) {
    chomp $Key;
    if ( ref( $CommonObject{ConfigObject}->{$Key} ) eq 'ARRAY' ) {
        for ( @{ $CommonObject{ConfigObject}->{$Key} } ) {
            print "$_;";
        }
        print "\n";
    }
    elsif ( ref( $CommonObject{ConfigObject}->{$Key} ) eq 'HASH' ) {
        for my $SubKey ( sort keys %{ $CommonObject{ConfigObject}->{$Key} } ) {
            print "$SubKey=$CommonObject{ConfigObject}->{$Key}->{$SubKey};";
        }
        print "\n";
    }
    else {
        print $CommonObject{ConfigObject}->{$Key} . "\n";
    }
}
else {

    # print all vars
    for ( sort keys %{ $CommonObject{ConfigObject} } ) {
        print $_. ":";
        if ( ref( $CommonObject{ConfigObject}->{$_} ) eq 'ARRAY' ) {
            for ( @{ $CommonObject{ConfigObject}->{$_} } ) {
                print "$_;";
            }
            print "\n";
        }
        elsif ( ref( $CommonObject{ConfigObject}->{$_} ) eq 'HASH' ) {
            for my $Key ( sort keys %{ $CommonObject{ConfigObject}->{$_} } ) {
                print "$Key=$CommonObject{ConfigObject}->{$_}->{$Key};";
            }
            print "\n";
        }
        else {
            print $CommonObject{ConfigObject}->{$_} . "\n";
        }
    }
}
