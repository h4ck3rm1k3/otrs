#!/usr/bin/perl -w
# --
# xml2docbook.pl - config xml to docbook
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: xml2docbook.pl,v 1.26 2011/08/12 09:06:16 mg Exp $
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

# use ../ as lib location
use File::Basename;
use FindBin qw($RealBin);
use lib dirname($RealBin) . "/../";
use lib dirname($RealBin) . "/../Kernel/cpan-lib";

use strict;
use warnings;

use Getopt::Std;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.26 $) [1];

use Kernel::Config;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::Time;
use Kernel::System::DB;
use Kernel::System::SysConfig;

# create common objects
my %CommonObject = ();
$CommonObject{ConfigObject} = Kernel::Config->new();
$CommonObject{LogObject}    = Kernel::System::Log->new(
    LogPrefix => 'OTRS-xml2docbook',
    %CommonObject,
);
$CommonObject{MainObject}      = Kernel::System::Main->new(%CommonObject);
$CommonObject{TimeObject}      = Kernel::System::Time->new(%CommonObject);
$CommonObject{EncodeObject}    = Kernel::System::Encode->new(%CommonObject);
$CommonObject{DBObject}        = Kernel::System::DB->new(%CommonObject);
$CommonObject{SysConfigObject} = Kernel::System::SysConfig->new(%CommonObject);

# list Groups
#my %List = $CommonObject{SysConfigObject}->ConfigGroupList();
my @Groups   = (qw(Framework Ticket));
my $UserLang = '';

# get options
my %Opts = ();

getopt( 'l', \%Opts );

if ( !$Opts{l} ) {
    die "Need -l <Language>\n";
}

$UserLang = $Opts{l};

# start xml output

print '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE appendix PUBLIC "-//OASIS//DTD DocBook XML V4.4//EN"
    "http://www.oasis-open.org/docbook/xml/4.4/docbookx.dtd">
';
if ( $Opts{l} eq 'de' ) {
    print "\n<appendix id=\"config\"><title>Referenz der Konfigurationsoptionen</title>\n";
}
else {
    print "\n<appendix id=\"config\"><title>Configuration Options Reference</title>\n";
}
for my $Group (@Groups) {
    my %SubList = $CommonObject{SysConfigObject}->ConfigSubGroupList( Name => $Group );
    print "<sect1 id=\"$Group\"><title>$Group</title> \n";
    for my $SubGroup ( sort keys %SubList ) {
        print "<sect2 id=\"$Group:$SubGroup\"><title>$SubGroup</title> \n";
        my @List = $CommonObject{SysConfigObject}->ConfigSubGroupConfigItemList(
            Group    => $Group,
            SubGroup => $SubGroup
        );
        for my $Name (@List) {
            my %Item = $CommonObject{SysConfigObject}->ConfigItemGet( Name => $Name );
            my $Link = $Name;
            $Link =~ s/###/_/g;
            $Link =~ s/\///g;
            print "<sect3 id=\"$Group:$SubGroup:$Link\"><title>$Name</title> \n";
            print "<informaltable>\n";
            print " <tgroup cols=\"4\">\n";
            print "   <colspec colnum=\"1\" colname=\"col1\" colwidth=\"1*\"/>\n";
            print "   <colspec colnum=\"2\" colname=\"col2\" colwidth=\"1*\"/>\n";
            print "   <colspec colnum=\"3\" colname=\"col3\" colwidth=\"1*\"/>\n";
            print "   <colspec colnum=\"4\" colname=\"col4\" colwidth=\"1*\"/>\n";
            print "   <thead>\n";
            print "     <row>\n";
            print "       <entry>Description</entry>\n";
            print "       <entry namest=\"col2\" nameend=\"col4\">Value</entry>\n";
            print "     </row>\n";
            print "   </thead>\n";
            print "   <tbody>\n";

            #Description
            my %HashLang;
            for my $Index ( 1 ... $#{ $Item{Description} } ) {
                $Item{Description}[$Index]{Lang} ||= 'en';
                $HashLang{ $Item{Description}[$Index]{Lang} } = $Item{Description}[$Index]{Content};
            }
            my $Description;

            # Description in User Language
            if ( defined $HashLang{$UserLang} ) {
                $Description = $HashLang{$UserLang};
            }

            # Description in Default Language
            else {
                $Description = $HashLang{'en'};
            }
            $Description =~ s/&/&amp;/g;
            $Description =~ s/</&lt;/g;
            $Description =~ s/>/&gt;/g;
            print "<row>\n";
            print " <entry>Description:</entry>\n";
            print " <entry namest=\"col2\" nameend=\"col4\">$Description</entry>\n";
            print "</row>\n";
            print "<row>\n";
            print " <entry>Group:</entry>\n";
            print " <entry namest=\"col2\" nameend=\"col4\">$Group</entry>\n";
            print "</row>\n";

            for my $Area (qw(SubGroup)) {
                for ( 1 .. 10 ) {
                    if ( $Item{$Area}->[$_] ) {
                        print "<row>\n";
                        print " <entry>$Area:</entry>\n";
                        print
                            " <entry namest=\"col2\" nameend=\"col4\">$Item{$Area}->[$_]->{Content}</entry>\n";
                        print "</row>\n";
                    }
                }
            }
            my %ConfigItemDefault = $CommonObject{SysConfigObject}->ConfigItemGet(
                Name    => $Name,
                Default => 1,
            );
            print "<row>\n";
            print " <entry>Valid:</entry>\n";
            print " <entry namest=\"col2\" nameend=\"col4\">"
                . ( defined $ConfigItemDefault{Valid} ? $ConfigItemDefault{Valid} : 1 )
                . "</entry>\n";
            print "</row>\n";
            print "<row>\n";
            print " <entry>Required:</entry>\n";
            print " <entry namest=\"col2\" nameend=\"col4\">"
                . ( defined $ConfigItemDefault{Required} ? $ConfigItemDefault{Required} : 0 )
                . "</entry>\n";
            print "</row>\n";

            my $Key = $Name;
            $Key =~ s/\\/\\\\/g;
            $Key =~ s/'/\'/g;
            $Key =~ s/###/'}->{'/g;
            print "<row>\n";
            print " <entry>Config-Setting:</entry>\n";
            print " <entry namest=\"col2\" nameend=\"col4\"><programlisting><![CDATA[\n";
            my $Config = " \$Self->{'$Key'} = "
                . $CommonObject{SysConfigObject}->_XML2Perl( Data => \%ConfigItemDefault );
            print $Config;
            print "]]></programlisting>\n";
            print " </entry>\n";
            print "</row>\n";
            print "</tbody>\n";
            print "</tgroup>\n";
            print "</informaltable>\n";
            print "</sect3> \n";
        }
        print "</sect2> \n";
    }
    print "</sect1> \n";
}
print "</appendix> \n";

exit;
