# --
# Kernel/Language/bg_ITSMCore.pm - the bulgarian translation of ITSMCore
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: bg_ITSMCore.pm,v 1.4 2008/01/23 16:48:36 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::bg_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub Data {
    my ($Self) = @_;

    $Self->{Translation}->{'Priority Management'}
        = '���������� �� ������������';
    $Self->{Translation}->{'Add a new Priority.'} = '������ ��� ���������.';
    $Self->{Translation}->{'Add Priority'}        = '������ ���������';
    $Self->{Translation}->{'Criticality'}         = '����������';
    $Self->{Translation}->{'Impact'}              = '�������';
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'}
        = '����������<->�������<->���������';
    $Self->{Translation}->{'allocate'}       = '���������';
    $Self->{Translation}->{'Relevant to'}    = '��������� �';
    $Self->{Translation}->{'Includes'}       = '��������';
    $Self->{Translation}->{'Part of'}        = '���� ��';
    $Self->{Translation}->{'Depends on'}     = '������ ��';
    $Self->{Translation}->{'Required for'}   = '��������� ��';
    $Self->{Translation}->{'Connected to'}   = '������� �';
    $Self->{Translation}->{'Alternative to'} = '������������ ��';

    return 1;
}

1;
