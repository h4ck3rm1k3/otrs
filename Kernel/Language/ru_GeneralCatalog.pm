# --
# Kernel/Language/ru_GeneralCatalog.pm - the russian translation of GeneralCatalog
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Egor Tsilenko <bg8s at symlink.ru>
# --
# $Id: ru_GeneralCatalog.pm,v 1.2 2009/05/18 09:40:46 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ru_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

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
