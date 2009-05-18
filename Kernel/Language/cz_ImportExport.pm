# --
# Kernel/Language/cz_ImportExport.pm - the czech translation of ImportExport
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: cz_ImportExport.pm,v 1.7 2009/05/18 09:42:52 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cz_ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Import/Export'}              = '';
    $Lang->{'Import/Export Management'}   = '';
    $Lang->{'Add mapping template'}       = '';
    $Lang->{'Start Import'}               = '';
    $Lang->{'Start Export'}               = '';
    $Lang->{'Step'}                       = '';
    $Lang->{'Edit common information'}    = '';
    $Lang->{'Edit object information'}    = '';
    $Lang->{'Edit format information'}    = '';
    $Lang->{'Edit mapping information'}   = '';
    $Lang->{'Edit search information'}    = '';
    $Lang->{'Import information'}         = '';
    $Lang->{'Column'}                     = '';
    $Lang->{'Restrict export per search'} = '';
    $Lang->{'Source File'}                = '';
    $Lang->{'Column Seperator'}           = '';
    $Lang->{'Tabulator (TAB)'}            = '';
    $Lang->{'Semicolon (;)'}              = '';
    $Lang->{'Colon (:)'}                  = '';
    $Lang->{'Dot (.)'}                    = '';
    $Lang->{'Charset'}                    = '';

    return 1;
}

1;
