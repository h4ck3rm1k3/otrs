# --
# Kernel/Language/ru_GeneralCatalog.pm - the russian translation of GeneralCatalog
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Egor Tsilenko <bg8s at symlink.ru>
# --
# $Id: ru_GeneralCatalog.pm,v 1.1 2008/08/15 14:46:31 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::ru_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'General Catalog'}            = '����� �������';
    $Lang->{'General Catalog Management'} = '���������� ����� ���������';
    $Lang->{'Catalog Class'}              = '����� ��������';
    $Lang->{'Add a new Catalog Class.'}   = '�������� ����� ����� ��������';
    $Lang->{'Add Catalog Item'}           = '���������� �������� ��������';
    $Lang->{'Add Catalog Class'}          = '���������� ������ ��������';
    $Lang->{'Functionality'}              = '����������������';

    return 1;
}

1;
