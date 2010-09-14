# --
# Kernel/Language/zh_CN_ImportExport.pm - the Chinese simple translation of ImportExport
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: zh_CN_ImportExport.pm,v 1.5 2010/09/14 21:25:45 dz Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.5 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Import/Export'}              = '����/����';
    $Lang->{'Import/Export Management'}   = '����/��������';
    $Lang->{'Add mapping template'}       = '����ӳ��ģ��';
    $Lang->{'Start Import'}               = '��ʼ����';
    $Lang->{'Start Export'}               = '��ʼ����';
    $Lang->{'Step'}                       = '����';
    $Lang->{'Edit common information'}    = '�༭������Ϣ';
    $Lang->{'Edit object information'}    = '�༭������Ϣ';
    $Lang->{'Edit format information'}    = '�༭��ʽ��Ϣ';
    $Lang->{'Edit mapping information'}   = '�༭ӳ����Ϣ';
    $Lang->{'Edit search information'}    = '�༭������Ϣ';
    $Lang->{'Import information'}         = '������Ϣ';
    $Lang->{'Column'}                     = '��';
    $Lang->{'Restrict export per search'} = '���Ƶ���ÿ����Ѱ';
    $Lang->{'Source File'}                = 'Դ�ļ�';
    $Lang->{'Column Separator'}           = '�зָ���';
    $Lang->{'Tabulator (TAB)'}            = '�Ʊ�� (TAB)';
    $Lang->{'Semicolon (;)'}              = '�ֺ� (;)';
    $Lang->{'Colon (:)'}                  = 'ð�� (:)';
    $Lang->{'Dot (.)'}                    = '��� (.)';
    $Lang->{'Charset'}                    = '�ַ���';
# add by Never
    $Lang->{'Template'}                   = 'ģ��';
    $Lang->{'Frontend module registration for the agent interface.'} = '';
    $Lang->{'Format backend module registration for the import/export module.'} = '';
    $Lang->{'Import and export object information.'} = '';
    $Lang->{'Object is required!'} = '';
    $Lang->{'Format is required!'} = '';
    $Lang->{'Class is required!'} = '';
    $Lang->{'Column Separator is required!'} = '';
    $Lang->{'No map elements found.'} = '';

    return 1;
}

1;
