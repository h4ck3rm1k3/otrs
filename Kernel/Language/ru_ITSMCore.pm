# --
# Kernel/Language/ru_ITSMCore.pm - the russian translation of ITSMCore
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Egor Tsilenko <bg8s at symlink.ru>
# --
# $Id: ru_ITSMCore.pm,v 1.2 2009/05/18 09:48:24 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ru_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = '�����������';
    $Lang->{'Impact'}                              = '�������';
    $Lang->{'Criticality <-> Impact <-> Priority'} = '����������� <-> ������� <-> ���������';
    $Lang->{'allocate'}                            = '���������� ����������� ';
    $Lang->{'Relevant to'}                         = '��������� �';
    $Lang->{'Includes'}                            = '��������';
    $Lang->{'Part of'}                             = '������� ��';
    $Lang->{'Depends on'}                          = '������� ��';
    $Lang->{'Required for'}                        = '��������� ���';
    $Lang->{'Connected to'}                        = '������ �';
    $Lang->{'Alternative to'}                      = '������ ���';
    $Lang->{'Incident State'}                      = '��������� ���������';
    $Lang->{'Current Incident State'}              = '������� ��������� ���������';
    $Lang->{'Current State'}                       = '������� ���������';
    $Lang->{'Service-Area'}                        = '����� ��������';
    $Lang->{'Minimum Time Between Incidents'}      = '����������� ����� ����� �����������';
    $Lang->{'Service Overview'}                    = '����� ��������';
    $Lang->{'SLA Overview'}                        = '����� SLA';
    $Lang->{'Associated Services'}                 = '��������� �������';
    $Lang->{'Associated SLAs'}                     = '��������� SLA';
    $Lang->{'Back End'}                            = '��������� �����';
    $Lang->{'Demonstration'}                       = '������������';
    $Lang->{'End User Service'}                    = '�������� ������ ������������';
    $Lang->{'Front End'}                           = '������������ �����';
    $Lang->{'IT Management'}                       = '���������� ��';
    $Lang->{'IT Operational'}                      = '������������ ��';
    $Lang->{'Other'}                               = '������';
    $Lang->{'Project'}                             = '������������';
    $Lang->{'Reporting'}                           = '����������� �������';
    $Lang->{'Training'}                            = '��������';
    $Lang->{'Underpinning Contract'}               = '�������� ���������';
    $Lang->{'Availability'}                        = '�����������';
    $Lang->{'Errors'}                              = '������';
    $Lang->{'Other'}                               = '������';
    $Lang->{'Recovery Time'}                       = '����� ��������������';
    $Lang->{'Resolution Rate'}                     = '������������� �������� �������';
    $Lang->{'Response Time'}                       = '����� �������';
    $Lang->{'Transactions'}                        = '���������� ��������';

    return 1;
}

1;
