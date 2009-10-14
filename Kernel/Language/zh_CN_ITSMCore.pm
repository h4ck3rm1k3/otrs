# --
# Kernel/Language/zh_CN_ITSMCore.pm - the Chinese simple translation of ITSMCore
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: zh_CN_ITSMCore.pm,v 1.2 2009/10/14 20:45:11 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = 'Σ���̶�';
    $Lang->{'Impact'}                              = 'Ӱ���';
    $Lang->{'Criticality <-> Impact <-> Priority'} = 'Σ���̶� <-> Ӱ��� <-> ���ȼ���';
    $Lang->{'allocate'}                            = '����';
    $Lang->{'Relevant to'}                         = '���';
    $Lang->{'Includes'}                            = '����';
    $Lang->{'Part of'}                             = '������';
    $Lang->{'Depends on'}                          = 'ȡ����';
    $Lang->{'Required for'}                        = '�����';
    $Lang->{'Connected to'}                        = '���ӵ�';
    $Lang->{'Alternative to'}                      = 'ѡ�����';
    $Lang->{'Incident State'}                      = '�¼�״̬';
    $Lang->{'Current Incident State'}              = '��ǰ�¼�״̬';
    $Lang->{'Current State'}                       = '��״';
    $Lang->{'Service-Area'}                        = '������';
    $Lang->{'Minimum Time Between Incidents'}      = '��̵�ʱ�����¼�';
    $Lang->{'Service Overview'}                    = '�������';
    $Lang->{'SLA Overview'}                        = 'SLA ����';
    $Lang->{'Associated Services'}                 = '�����ķ���';
    $Lang->{'Associated SLAs'}                     = '������ SLAs';
    $Lang->{'Back End'}                            = '���';
    $Lang->{'Demonstration'}                       = 'ʾ��';
    $Lang->{'End User Service'}                    = '�����û�����';
    $Lang->{'Front End'}                           = 'ǰ��';
    $Lang->{'IT Management'}                       = 'IT ����';
    $Lang->{'IT Operational'}                      = 'IT ��Ӫ';
    $Lang->{'Other'}                               = '����';
    $Lang->{'Project'}                             = '��Ŀ';
    $Lang->{'Reporting'}                           = '����';
    $Lang->{'Training'}                            = 'ѵ��';
    $Lang->{'Underpinning Contract'}               = '���ݺ�ͬ';
    $Lang->{'Availability'}                        = '�������';
    $Lang->{'Errors'}                              = '����';
    $Lang->{'Other'}                               = '����';
    $Lang->{'Recovery Time'}                       = '�ָ�ʱ��';
    $Lang->{'Resolution Rate'}                     = '�������';
    $Lang->{'Response Time'}                       = '��Ӧʱ��';
    $Lang->{'Transactions'}                        = '����';

    return 1;
}

1;
