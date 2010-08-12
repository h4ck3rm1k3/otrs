# --
# Kernel/Language/zh_CN_ITSMCore.pm - the Chinese simple translation of ITSMCore
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: zh_CN_ITSMCore.pm,v 1.6 2010/08/12 22:33:56 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = 'Σ���̶�';
    $Lang->{'Impact'}                              = 'Ӱ���';
    $Lang->{'Criticality <-> Impact <-> Priority'} = 'Σ���̶� <-> Ӱ��� <-> ���ȼ���';
    $Lang->{'allocation'}                          = '����';
    $Lang->{'Priority allocation'}                 = '';
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
    $Lang->{'This setting controls the name of the application as is shown in the web interface as well as the tabs and title bar of your web browser.'} = '';
    $Lang->{'Determines the way the linked objects are displayed in each zoom mask.'} = '';
    $Lang->{'List of online repositories (for example you also can use other installations as repositoriy by using Key="http://example.com/otrs/public.pl?Action=PublicRepository&File=" and Content="Some Name").'} = '';
    $Lang->{'Frontend module registration for the AgentITSMService object in the agent interface.'} = '';
    $Lang->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} = '';
    $Lang->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} = '';
    $Lang->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} = '';
    $Lang->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} = '';
    $Lang->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} = '';
    $Lang->{'Module to show back link in service menu.'} = '';
    $Lang->{'Module to show print link in service menu.'} = '';
    $Lang->{'Module to show link link in service menu.'} = '';
    $Lang->{'Module to show back link in sla menu.'} = '';
    $Lang->{'Module to show print link in sla menu.'} = '';

    return 1;
}

1;
