#!/usr/bin/perl -w
# --
# login.pl - a simple external login page for OTRS
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: login.pl,v 1.8 2009/02/16 12:50:17 tr Exp $
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

# to get the errors on screen
use CGI::Carp qw(fatalsToBrowser);

# Simple Common Gateway Interface Class
use CGI;
my $CGI = new CGI;

# config options
my $OTRSLocation = 'http://otrs.example.com/otrs/index.pl';
my $RequestedURL = $CGI->param('RequestedURL') || '';
my $User         = $CGI->param('User') || '';
my $Reason       = $CGI->param('Reason') || '';

# reason param translation
my $ReasonTranslation = {
    SystemError      => 'System error! Contact your admin!',
    LoginFailed      => 'Login failed! Your username or password was entered incorrectly.',
    Logout           => 'Logout successful. Thank you for using OTRS!',
    InvalidSessionID => 'Invalid SessionID!',
    ''               => '',
};

# html quote
$User                         = _Ascii2Html($User);
$RequestedURL                 = _Ascii2Html($RequestedURL);
$ReasonTranslation->{$Reason} = _Ascii2Html( $ReasonTranslation->{$Reason} );

# html page
print "Content-Type: text/html

<html>
<head>
    <title>login page</title>
</head>
<body>

<h1>login page</h1>

<p>
<font color=\"red\">$ReasonTranslation->{$Reason}</font>
</p>

<form action=\"$OTRSLocation\" method=\"get\" enctype=\"application/x-www-form-urlencoded\">
<input type=\"hidden\" name=\"Action\" value=\"Login\">
<input type=\"hidden\" name=\"RequestedURL\" value=\"$RequestedURL\">

<table cellspacing=\"8\" cellpadding=\"2\">
<tr>
    <td>Username:</td>
    <td><input type=\"text\" name=\"User\" value=\"$User\" size=\"18\"></td>
</tr>
<tr>
    <td>Password:</td>
    <td><input type=\"password\" name=\"Password\" size=\"18\"></td>
</tr>
</table>

<input type=\"submit\" value=\"Login\">
</form>

</body>
</html>

";

sub _Ascii2Html {
    my $Text = shift;

    $Text =~ s/&/&amp;/g;
    $Text =~ s/</&lt;/g;
    $Text =~ s/>/&gt;/g;
    $Text =~ s/"/&quot;/g;

    return $Text;
}
