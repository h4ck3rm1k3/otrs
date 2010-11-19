# --
# Kernel/Language/zh_CN_FAQ.pm - the Chinese simple translation for FAQ
# Copyright (C) 2009 Never Min <never at qnofae.org>
# --
# $Id: zh_CN_FAQ.pm,v 1.6 2010/11/19 10:34:46 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.
# --

package Kernel::Language::zh_CN_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Explorer'}                 = '���';
    $Lang->{'You have already voted!'}           = '���Ѿ�����!';
    $Lang->{'No rate selected!'}                 = 'û��ѡ������!';
    $Lang->{'Thanks for your vote!'}             = '��л��������';
    $Lang->{'Votes'}                             = '����';
    $Lang->{'LatestChangedItems'}                = '����޸ĵ�����';
    $Lang->{'LatestCreatedItems'}                = '���´���������';
    $Lang->{'Top10Items'}                        = '��õ�����';
    $Lang->{'ArticleVotingQuestion'}             = '�����¶����а�����?';
    $Lang->{'SubCategoryOf'}                     = '��Ŀ¼��';
    $Lang->{'QuickSearch'}                       = '��������';
    $Lang->{'DetailSearch'}                      = '�߼�����';
    $Lang->{'Categories'}                        = 'Ŀ¼';
    $Lang->{'SubCategories'}                     = '��Ŀ¼';
    $Lang->{'New FAQ Article'}                   = '���������';
    $Lang->{'FAQ Category'}                      = 'FAQ Ŀ¼';
    $Lang->{'A category should have a name!'}    = 'Ŀ¼������Ϊ��!';
    $Lang->{'A category should have a comment!'} = '��Ϊ��Ŀ¼д��ע��!';
    $Lang->{'FAQ Articles (new created)'}        = 'FAQ ����(�´���)';
    $Lang->{'FAQ Articles (recently changed)'}   = 'FAQ ����(�������)';
    $Lang->{'FAQ Articles (Top 10)'}             = 'FAQ ����';
    $Lang->{'StartDay'}                          = '��ʼ����';
    $Lang->{'StartMonth'}                        = '��ʼ�·�';
    $Lang->{'StartYear'}                         = '��ʼ���';
    $Lang->{'EndDay'}                            = '��������';
    $Lang->{'EndMonth'}                          = '��ʼ�·�';
    $Lang->{'EndYear'}                           = '�������';
    $Lang->{'Approval'}                          = '�Ͽɶ�';
    $Lang->{'internal'}                          = '';
    $Lang->{'external'}                          = '';
    $Lang->{'public'}                            = '';

    $Lang->{'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'} = 'û�й��ൽĿ¼. Ҫ����һƪ������Ҫ���ൽĿ¼��, ���� -Ŀ¼�˵�- ��ѡ������Ȩ�޴������µ�Ŀ¼';
    $Lang->{'Agent groups which can access this category.'} = '��һ��Ⱥ����Է��ʴ�Ŀ¼.';
    $Lang->{'A category needs at least one permission group!'}   = 'һ��Ŀ¼����Ҫ����һ��Ȩ��Ⱥ��';
    $Lang->{'Will be shown as comment in Explorer.'}         = 'ע�ͽ����ʱ��ʾ.';

    return 1;
}

1;
