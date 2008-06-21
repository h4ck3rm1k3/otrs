# --
# Kernel/Language/bg_ITSMLocation.pm - the bulgarian translation of ITSMLocation
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: bg_ITSMLocation.pm,v 1.1 2008/06/21 12:45:18 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::bg_ITSMLocation;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Location'}            = '�������';
    $Lang->{'Location-Area'}       = '';
    $Lang->{'Location Management'} = '���������� �� ��������� - ����������������';
    $Lang->{'Add Location'}        = '������ �������';
    $Lang->{'Add a new Location.'} = '������ �� �������� ���� �������';
    $Lang->{'Sub-Location of'}     = '���-������� ��';
    $Lang->{'Address'}             = '�����';
    $Lang->{'Building'}            = '������';
    $Lang->{'Floor'}               = '����';
    $Lang->{'IT Facility'}         = '�� ����������/���������';
    $Lang->{'Office'}              = '����';
    $Lang->{'Other'}               = '�����';
    $Lang->{'Outlet'}              = '�����-�������';
    $Lang->{'Rack'}                = '����-���';
    $Lang->{'Room'}                = '����';
    $Lang->{'Workplace'}           = '������� �����';

    return 1;
}

1;
