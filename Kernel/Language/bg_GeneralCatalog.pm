# --
# Kernel/Language/bg_GeneralCatalog.pm - the bulgarian translation of GeneralCatalog
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: bg_GeneralCatalog.pm,v 1.4 2008/01/23 16:24:31 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::bg_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub Data {
    my ($Self) = @_;

    $Self->{Translation}->{'General Catalog'} = '������� �������';
    $Self->{Translation}->{'General Catalog Management'}
        = '���������� �� �������� �������';
    $Self->{Translation}->{'Catalog Class'} = '������� � ��������';
    $Self->{Translation}->{'Add a new Catalog Class.'}
        = '������ ��� ���� � ��������.';
    $Self->{Translation}->{'Add Catalog Item'}
        = '������ ������� ��� ��������';
    $Self->{Translation}->{'Add Catalog Class'} = '������ ���� � ��������';
    $Self->{Translation}->{'Functionality'}     = '��������������';

    return 1;
}

1;
