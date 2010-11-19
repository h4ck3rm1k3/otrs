# --
# Kernel/Language/uk_FAQ.pm - the ukrainian translation of FAQ
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2009 Belskii Artem
# --
# $Id: uk_FAQ.pm,v 1.3 2010/11/19 10:34:45 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.
# --

package Kernel::Language::uk_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'You have already voted!'}           = '�� ��� ����������!';
    $Lang->{'No rate selected!'}                 = '���� ������ �������!';
    $Lang->{'Thanks for your vote!'}             = '������, �� ��, �� �������������!';
    $Lang->{'Votes'}                             = '������';
    $Lang->{'LatestChangedItems'}                = '������� ������ ������';
    $Lang->{'LatestCreatedItems'}                = '������� �������� ������';
    $Lang->{'Top10Items'}                        = '��� 10 �������';
    $Lang->{'ArticleVotingQuestion'}             = '��� ��������� �� ������?';
    $Lang->{'SubCategoryOf'}                     = 'ϳ��������';
    $Lang->{'QuickSearch'}                       = '������� �����';
    $Lang->{'DetailSearch'}                      = '������������ �����';
    $Lang->{'Categories'}                        = '�������';
    $Lang->{'SubCategories'}                     = 'ϳ��������';
    $Lang->{'New FAQ Article'}                   = '���� ������ ��';
    $Lang->{'FAQ Category'}                      = '������� ��';
    $Lang->{'A category should have a name!'}    = '�������� ������� ���� ��\'�';
    $Lang->{'A category should have a comment!'} = '�������� ������� ���� ��������';
    $Lang->{'FAQ News (new created)'}            = '������ ��(��� �����)';
    $Lang->{'FAQ News (recently changed)'}       = '������ ��(������� �����)';
    $Lang->{'FAQ News (Top 10)'}                 = '������ ��(��� 10)';
    $Lang->{'StartDay'}                          = '������� ����';
    $Lang->{'StartMonth'}                        = '������� �����';
    $Lang->{'StartYear'}                         = '������� ����';
    $Lang->{'EndDay'}                            = 'ʳ���� ���';
    $Lang->{'EndMonth'}                          = 'ʳ���� �����';
    $Lang->{'EndYear'}                           = 'ʳ���� ����';
    $Lang->{'Approval'}                          = '�������� ����� � ��������(Approval)';
    $Lang->{'internal'}                          = '';
    $Lang->{'external'}                          = '';
    $Lang->{'public'}                            = '';

    $Lang->{
        'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'
        } = '���� ��������� ��������. ��� �������� ������ ��� ��������� �������� ������, �������� �� ���� �������. ���� �����, �������� ���� �����/�������� ������� ��� -������� ����-!';
    $Lang->{'Agent groups which can access this category.'} = '������ �����, ��� ������ �������� ������ �� �������';
    $Lang->{'A category needs at least one permission group!'}   = '������� ���������� ������� ����� ������� � �����';
    $Lang->{'Will be shown as comment in Explorer.'}         = '���� ��������, �� �������� � ���������';
    $Lang->{'FAQ'}                          = '���� �����';
    $Lang->{'FAQ-Area'}                     = '���� �����';
    $Lang->{'Explorer'}                       = '��������';
    $Lang->{'����������'}                   = '³����';
    return 1;
}

1;
