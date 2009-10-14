# --
# Kernel/Language/zh_CN_GeneralCatalog.pm - the Chinese simple translation of GeneralCatalog
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: zh_CN_GeneralCatalog.pm,v 1.2 2009/10/14 20:43:22 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'General Catalog'}            = '��Ŀ¼';
    $Lang->{'General Catalog Management'} = '��Ŀ¼����';
    $Lang->{'Catalog Class'}              = 'Ŀ¼�ּ�';
    $Lang->{'Add a new Catalog Class.'}   = '����һ����Ŀ¼�ּ�';
    $Lang->{'Add Catalog Item'}           = '����Ŀ¼��Ŀ';
    $Lang->{'Add Catalog Class'}          = '������Ŀ¼�ּ�';
    $Lang->{'Functionality'}              = '������;';

    return 1;
}

1;
