#!/usr/bin/perl -w
# --
# bin/cgi-bin/public.pl - the global CGI handle file for OTRS
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: public.pl,v 1.10 2011/03/08 14:11:25 mb Exp $
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

# use ../../ as lib location
use FindBin qw($Bin);
use lib "$Bin/../..";
use lib "$Bin/../../Kernel/cpan-lib";
use lib "$Bin/../../Custom";

use vars qw($VERSION);
$VERSION = qw($Revision: 1.10 $) [1];

# 0=off;1=on;
my $Debug = 0;

# load agent web interface
use Kernel::System::Web::InterfacePublic();

# create new object
my $Interface = Kernel::System::Web::InterfacePublic->new( Debug => $Debug );

# execute object
$Interface->Run();
