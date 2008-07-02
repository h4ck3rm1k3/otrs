# --
# Kernel/Language/bg_ITSMService.pm - the bulgarian translation of ITSMService
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: bg_ITSMService.pm,v 1.2 2008/07/02 14:11:33 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::bg_ITSMService;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Incident State'}                 = '';
    $Lang->{'Current Incident State'}         = '';
    $Lang->{'Current State'}                  = '';
    $Lang->{'Service-Area'}                   = '';
    $Lang->{'Minimum Time Between Incidents'} = '��������� ����� ����� �����������';
    $Lang->{'Associated SLAs'}                = '�������� SLA ��������';
    $Lang->{'Back End'}                       = '������� �������/BackEnd';
    $Lang->{'Demonstration'}                  = '������������';
    $Lang->{'End User Service'}               = '������ �� ������ �����������';
    $Lang->{'Front End'}                      = '��������� �������/FrontEnd';
    $Lang->{'IT Management'}                  = '���������� �� ��';
    $Lang->{'IT Operational'}                 = '�� ��������';
    $Lang->{'Other'}                          = '�����';
    $Lang->{'Project'}                        = '������';
    $Lang->{'Reporting'}                      = '���������';
    $Lang->{'Training'}                       = '��������';
    $Lang->{'Underpinning Contract'}          = '������� �������';
    $Lang->{'Availability'}                   = '����������';
    $Lang->{'Errors'}                         = '������';
    $Lang->{'Other'}                          = '�����';
    $Lang->{'Recovery Time'}                  = '����� �� ��������������';
    $Lang->{'Resolution Rate'}                = '����� �� �����������';
    $Lang->{'Response Time'}                  = '����� �� �������';
    $Lang->{'Transactions'}                   = '������/����������';

    return 1;
}

1;
