# --
# Kernel/Language/ru_ImportExport.pm - the russian translation of ImportExport
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Egor Tsilenko <bg8s at symlink.ru>
# --
# $Id: ru_ImportExport.pm,v 1.4 2010/09/08 18:02:53 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ru_ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Import/Export'}              = '������/�������';
    $Lang->{'Import/Export Management'}   = '���������� ��������/���������';
    $Lang->{'Add mapping template'}       = '���������� ������� ������������';
    $Lang->{'Start Import'}               = '������ ������';
    $Lang->{'Start Export'}               = '������ �������';
    $Lang->{'Step'}                       = '���';
    $Lang->{'Edit common information'}    = '������������� ����� ����������';
    $Lang->{'Edit object information'}    = '������������� ���������� �� �������';
    $Lang->{'Edit format information'}    = '������������� ������ ������';
    $Lang->{'Edit mapping information'}   = '������������� ���������� ������������';
    $Lang->{'Edit search information'}    = '������������� ��������� ����������';
    $Lang->{'Import information'}         = '���������� �������';
    $Lang->{'Column'}                     = '�������';
    $Lang->{'Restrict export per search'} = '���������� ������� �������';
    $Lang->{'Source File'}                = '�������� ����';
    $Lang->{'Column Separator'}           = '�����������';
    $Lang->{'Tabulator (TAB)'}            = '��������� (TAB)';
    $Lang->{'Semicolon (;)'}              = '����� � ������� (;)';
    $Lang->{'Colon (:)'}                  = '��������� (:)';
    $Lang->{'Dot (.)'}                    = '����� (.)';
    $Lang->{'Charset'}                    = '���������';
    $Lang->{'Frontend module registration for the agent interface.'} = '';
    $Lang->{'Format backend module registration for the import/export module.'} = '';
    $Lang->{'Import and export object information.'} = '';

    return 1;
}

1;
