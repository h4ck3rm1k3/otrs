#!/usr/bin/perl -w
# --
# bin/cgi-bin/index.pl - the global CGI handle file (incl. auth) for OTRS
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: index.pl,v 1.90 2011/03/08 14:11:25 mb Exp $
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
##/usr/share/otrs/bin/cgi-bin/index.pl from here
use strict;
use warnings;

# use ../../ as lib location
use FindBin qw($Bin);
use lib "$Bin/../..";
use lib "$Bin/../../Kernel/cpan-lib";
use lib "$Bin/../../Custom";
use Hack; # load hacked files
use vars qw($VERSION);
$VERSION = qw($Revision: 1.90 $) [1];

# 0=off;1=on;
my $Debug = 1;

# load agent web interface
use Kernel::System::Web::InterfaceAgent();

# create new object
$ENV{'REQUEST_METHOD'}="POST";
$ENV{'REQUEST_URI'}="http://localhost/otrs/index.pl?Action=AgentTicketPhone;;&Session=10a6197e4399d7d3a89543a9b2aafe2fa4";
$ENV{'CONTENT_TYPE'}="multipart/form-data; boundary=----WebKitFormBoundarySHJOklNMX27fyAb9";


$ENV{QUERY_STRING}="Action=AgentTicketPhone;;&Session=10a6197e4399d7d3a89543a9b2aafe2fa4";

my $Interface = Kernel::System::Web::InterfaceAgent->new( 
    Debug => $Debug ,
#    WebRequest =>{
#	Action => "AgentTicketPhone",
#	User => "mdupont\@localhost",
#	Password => "mdupont",
#	RequestedURL => "http://localhost/otrs/index.pl",
 #   }
);

# execute object
$Interface->Run();