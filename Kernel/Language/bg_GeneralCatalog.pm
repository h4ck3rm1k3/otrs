# --
# Kernel/Language/bg_GeneralCatalog.pm - the bulgarian translation of GeneralCatalog
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: bg_GeneralCatalog.pm,v 1.8 2008/08/13 14:19:21 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::bg_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.8 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'General Catalog'}            = '������� �������';
    $Lang->{'General Catalog Management'} = '���������� �� �������� �������';
    $Lang->{'Catalog Class'}              = '������� � ��������';
    $Lang->{'Add a new Catalog Class.'}   = '������ ��� ���� � ��������.';
    $Lang->{'Add Catalog Item'}           = '������ ������� ��� ��������';
    $Lang->{'Add Catalog Class'}          = '������ ���� � ��������';
    $Lang->{'Functionality'}              = '��������������';

    return 1;
}

1;
