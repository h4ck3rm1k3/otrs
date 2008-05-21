# --
# Kernel/Language/bg_ITSMCore.pm - the bulgarian translation of ITSMCore
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: bg_ITSMCore.pm,v 1.7 2008/05/21 08:39:26 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::bg_ITSMCore;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Priority Management'}                 = '���������� �� ������������';
    $Lang->{'Add a new Priority.'}                 = '������ ��� ���������.';
    $Lang->{'Add Priority'}                        = '������ ���������';
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

    return 1;
}

1;
