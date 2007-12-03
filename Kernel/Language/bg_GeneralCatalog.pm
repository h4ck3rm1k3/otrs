# --
# Kernel/Language/bg_GeneralCatalog.pm - the bulgarian translation of GeneralCatalog
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: bg_GeneralCatalog.pm,v 1.2 2007/12/03 16:21:01 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::Language::bg_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

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
