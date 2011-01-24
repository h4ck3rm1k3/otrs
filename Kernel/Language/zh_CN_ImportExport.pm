# --
# Kernel/Language/zh_CN_ImportExport.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: zh_CN_ImportExport.pm,v 1.7 2011/01/24 20:49:14 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_ImportExport;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = '����ӳ��ģ��';
    $Self->{Translation}->{'Charset'} = '�ַ���';
    $Self->{Translation}->{'Colon (:)'} = 'ð�� (:)';
    $Self->{Translation}->{'Column'} = '��';
    $Self->{Translation}->{'Column Separator'} = '�зָ���';
    $Self->{Translation}->{'Dot (.)'} = '��� (.)';
    $Self->{Translation}->{'Semicolon (;)'} = '�ֺ� (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = '�Ʊ�� (TAB)';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = '����/��������';
    $Self->{Translation}->{'Add template'} = '';
    $Self->{Translation}->{'Create a template to import and export object information.'} = '';
    $Self->{Translation}->{'Start Import'} = '��ʼ����';
    $Self->{Translation}->{'Start Export'} = '��ʼ����';
    $Self->{Translation}->{'Delete Template'} = '';
    $Self->{Translation}->{'Step'} = '����';
    $Self->{Translation}->{'Edit common information'} = '�༭������Ϣ';
    $Self->{Translation}->{'Object is required!'} = '';
    $Self->{Translation}->{'Format is required!'} = '';
    $Self->{Translation}->{'Edit object information'} = '�༭������Ϣ';
    $Self->{Translation}->{'Edit format information'} = '�༭��ʽ��Ϣ';
    $Self->{Translation}->{' is required!'} = '';
    $Self->{Translation}->{'Edit mapping information'} = '�༭ӳ����Ϣ';
    $Self->{Translation}->{'No map elements found.'} = '';
    $Self->{Translation}->{'Add Mapping Element'} = '';
    $Self->{Translation}->{'Edit search information'} = '�༭������Ϣ';
    $Self->{Translation}->{'Restrict export per search'} = '���Ƶ���ÿ����Ѱ';
    $Self->{Translation}->{'Import information'} = '������Ϣ';
    $Self->{Translation}->{'Source File'} = 'Դ�ļ�';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} = '';
    $Self->{Translation}->{'Import and export object information.'} = '';
    $Self->{Translation}->{'Import/Export'} = '����/����';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'Template'} = 'ģ��';

}

1;
