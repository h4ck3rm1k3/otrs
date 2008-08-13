# --
# Kernel/Language/bg_ITSMCore.pm - the bulgarian translation of ITSMCore
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: bg_ITSMCore.pm,v 1.11 2008/08/13 14:20:12 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::bg_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.11 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Criticality'}                         = '����������';
    $Lang->{'Impact'}                              = '�������';
    $Lang->{'Criticality <-> Impact <-> Priority'} = '����������<->�������<->���������';
    $Lang->{'allocate'}                            = '���������';
    $Lang->{'Relevant to'}                         = '��������� �';
    $Lang->{'Includes'}                            = '��������';
    $Lang->{'Part of'}                             = '���� ��';
    $Lang->{'Depends on'}                          = '������ ��';
    $Lang->{'Required for'}                        = '��������� ��';
    $Lang->{'Connected to'}                        = '������� �';
    $Lang->{'Alternative to'}                      = '������������ ��';
    $Lang->{'Incident State'}                      = '';
    $Lang->{'Current Incident State'}              = '';
    $Lang->{'Current State'}                       = '';
    $Lang->{'Service-Area'}                        = '';
    $Lang->{'Minimum Time Between Incidents'}      = '��������� ����� ����� �����������';
    $Lang->{'Service Overview'}                    = '';
    $Lang->{'SLA Overview'}                        = '';
    $Lang->{'Associated Services'}                 = '';
    $Lang->{'Associated SLAs'}                     = '�������� SLA ��������';
    $Lang->{'Back End'}                            = '������� �������/BackEnd';
    $Lang->{'Demonstration'}                       = '������������';
    $Lang->{'End User Service'}                    = '������ �� ������ �����������';
    $Lang->{'Front End'}                           = '��������� �������/FrontEnd';
    $Lang->{'IT Management'}                       = '���������� �� ��';
    $Lang->{'IT Operational'}                      = '�� ��������';
    $Lang->{'Other'}                               = '�����';
    $Lang->{'Project'}                             = '������';
    $Lang->{'Reporting'}                           = '���������';
    $Lang->{'Training'}                            = '��������';
    $Lang->{'Underpinning Contract'}               = '������� �������';
    $Lang->{'Availability'}                        = '����������';
    $Lang->{'Errors'}                              = '������';
    $Lang->{'Other'}                               = '�����';
    $Lang->{'Recovery Time'}                       = '����� �� ��������������';
    $Lang->{'Resolution Rate'}                     = '����� �� �����������';
    $Lang->{'Response Time'}                       = '����� �� �������';
    $Lang->{'Transactions'}                        = '������/����������';

    return 1;
}

1;
