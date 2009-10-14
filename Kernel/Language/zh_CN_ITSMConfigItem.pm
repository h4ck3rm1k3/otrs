# --
# Kernel/Language/zh_CN_ITSMConfigItem.pm - the Chinese simple translation of ITSMConfigItem
# Copyright (C) 2009 Never Min <never at qnofae.org>
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: zh_CN_ITSMConfigItem.pm,v 1.2 2009/10/14 20:47:42 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = '������';
    $Lang->{'Config Item-Area'}       = '����������';
    $Lang->{'Config Item Management'} = '����������';
    $Lang->{'Change Definition'}      = '�޸Ķ���';
    $Lang->{'Class'}                  = '����';
    $Lang->{'Show Versions'}          = '��ʾ�汾';
    $Lang->{'Hide Versions'}          = '���ذ汾';
    $Lang->{'Last changed by'}        = '����޸���';
    $Lang->{'Last changed'}           = '����޸�';
    $Lang->{'Change of definition failed! See System Log for details.'}        = '�޸Ķ���ʧ��!��ϸ��Ϣ��ο�ϵͳ��־.';
    $Lang->{'Also search in previous versions?'} = 'ͬʱ������ǰ�İ汾?';
    $Lang->{'Config Items shown'}                = '��ʾ������';
    $Lang->{'Config Items available'}            = '��Ч��������';
    $Lang->{'Search Config Items'}               = '����������';
    $Lang->{'Deployment State'}                  = '����״̬';
    $Lang->{'Current Deployment State'}          = '��ǰ�Ĳ���״̬';
    $Lang->{'Incident State'}                    = '�¼�״̬';
    $Lang->{'Current Incident State'}            = '��ǰ���¼�״̬';
    $Lang->{'The name of this config item'}      = 'Ϊ�������������';
    $Lang->{'The deployment state of this config item'}        = 'Ӧ���������״̬��������';
    $Lang->{'The incident state of this config item'} = 'Ӧ������¼�״̬��������';
    $Lang->{'Last Change'}                            = '������';
    $Lang->{'Duplicate'}                              = '����';
    $Lang->{'Expired'}                                = '����';
    $Lang->{'Inactive'}                               = '�ǻ��';
    $Lang->{'Maintenance'}                            = 'ά��';
    $Lang->{'Pilot'}                                  = '����';
    $Lang->{'Planned'}                                = '�ѹ滮';
    $Lang->{'Production'}                             = '����';
    $Lang->{'Repair'}                                 = '�޸�';
    $Lang->{'Retired'}                                = '����';
    $Lang->{'Review'}                                 = '����';
    $Lang->{'Test/QA'}                                = '����/QA';
    $Lang->{'Operational'}                            = '���õ�';
    $Lang->{'Incident'}                               = '�¼�';
    $Lang->{'Desktop'}                                = '̨ʽ����';
    $Lang->{'Laptop'}                                 = '�ʼǱ�';
    $Lang->{'Other'}                                  = '����';
    $Lang->{'PDA'}                                    = 'PDA';
    $Lang->{'Phone'}                                  = '�绰';
    $Lang->{'Server'}                                 = '������';
    $Lang->{'Backup Device'}                          = '�����豸';
    $Lang->{'Beamer'}                                 = 'ͶӰ��';
    $Lang->{'Camera'}                                 = '�����';
    $Lang->{'Docking Station'}                        = '��վ';
    $Lang->{'Keybord'}                                = '����';
    $Lang->{'Modem'}                                  = '�������';
    $Lang->{'Monitor'}                                = '��ʾ��';
    $Lang->{'Mouse'}                                  = '���';
    $Lang->{'Other'}                                  = '����';
    $Lang->{'PCMCIA Card'}                            = 'PCMCIA ��';
    $Lang->{'Printer'}                                = '��ӡ��';
    $Lang->{'Router'}                                 = '·����';
    $Lang->{'Scanner'}                                = 'ɨ����';
    $Lang->{'Security Device'}                        = '��ȫ�豸';
    $Lang->{'Switch'}                                 = '������';
    $Lang->{'USB Device'}                             = 'USB �豸';
    $Lang->{'WLAN Access Point'}                      = 'WLAN ���߷��ʵ�';
    $Lang->{'GSM'}                                    = 'GSM';
    $Lang->{'LAN'}                                    = 'LAN';
    $Lang->{'Other'}                                  = '����';
    $Lang->{'Telco'}                                  = '�绰��˾';
    $Lang->{'WLAN'}                                   = '��������';
    $Lang->{'Admin Tool'}                             = '����Ա����';
    $Lang->{'Client Application'}                     = '�ͻ���Ӧ�ó���';
    $Lang->{'Client OS'}                              = '�ͻ�����ϵͳ';
    $Lang->{'Embedded'}                               = 'Ƕ��ʽ';
    $Lang->{'Middleware'}                             = '�м��';
    $Lang->{'Other'}                                  = '����';
    $Lang->{'Server Application'}                     = '������Ӧ�ó���';
    $Lang->{'Server OS'}                              = '����������ϵͳ';
    $Lang->{'User Tool'}                              = '�û�����';
    $Lang->{'Concurrent Users'}                       = '�����û���';
    $Lang->{'Demo'}                                   = '��ʾ';
    $Lang->{'Developer Licence'}                      = '�������';
    $Lang->{'Enterprise Licence'}                     = '��ҵִ��';
    $Lang->{'Freeware'}                               = '������';
    $Lang->{'Open Source'}                            = '��Դ';
    $Lang->{'Per Node'}                               = 'ÿ�ڵ�';
    $Lang->{'Per Processor'}                          = 'ÿ������';
    $Lang->{'Per Server'}                             = 'ÿ������';
    $Lang->{'Per User'}                               = 'ÿ�û�';
    $Lang->{'Single Licence'}                         = '��һ���';
    $Lang->{'Time Restricted'}                        = 'ʱ������';
    $Lang->{'Unlimited'}                              = '�����Ƶ�';
    $Lang->{'Volume Licence'}                         = '������Ȩ';
    $Lang->{'Model'}                                  = '�ͺ�';
    $Lang->{'Serial Number'}                          = '���к�';
    $Lang->{'Operating System'}                       = '����ϵͳ';
    $Lang->{'CPU'}                                    = 'CPU';
    $Lang->{'Ram'}                                    = '�ڴ�';
    $Lang->{'Hard Disk'}                              = 'Ӳ��';
    $Lang->{'Hard Disk::Capacity'}                    = 'Ӳ��::����';
    $Lang->{'Capacity'}                               = '����';
    $Lang->{'FQDN'}                                   = 'FQDN';
    $Lang->{'Network Adapter'}                        = '����';
    $Lang->{'Network Adapter::IP over DHCP'}          = '����::�� DHCP ��ȡ IP';
    $Lang->{'Network Adapter::IP Address'}            = '����::IP ��ַ';
    $Lang->{'IP over DHCP'}                           = '�� DHCP ��ȡ IP';
    $Lang->{'IP Address'}                             = 'IP ��ַ';
    $Lang->{'Graphic Adapter'}                        = 'ͼ�δ�����';
    $Lang->{'Other Equipment'}                        = '����Ԫ��';
    $Lang->{'Warranty Expiration Date'}               = '���޹�������';
    $Lang->{'Install Date'}                           = '��װ����';
    $Lang->{'Network Address'}                        = '�����ַ';
    $Lang->{'Network Address::Subnet Mask'}           = '�����ַ::��������';
    $Lang->{'Network Address::Gateway'}               = '�����ַ::����';
    $Lang->{'Subnet Mask'}                            = '��������';
    $Lang->{'Gateway'}                                = '����';
    $Lang->{'Licence Type'}                           = '������';
    $Lang->{'Licence Key'}                            = '�����Կ';
    $Lang->{'Licence Key::Quantity'}                  = '�����Կ::����';
    $Lang->{'Licence Key::Expiration Date'}           = '�����Կ::����ʱ��';
    $Lang->{'Quantity'}                               = '����';
    $Lang->{'Expiration Date'}                        = '��������';
    $Lang->{'Media'}                                  = '����';
    $Lang->{'Maximum number of one element'}          = '��Ԫ�ص��������';
    $Lang->{'Identifier'}                             = '�û���ʶ��';
    $Lang->{'Phone 1'}                                = '�绰 1';
    $Lang->{'Phone 2'}                                = '�绰 2';
    $Lang->{'Address'}                                = '��ַ';
    $Lang->{'Building'}                               = '����';
    $Lang->{'Floor'}                                  = '¥��';
    $Lang->{'IT Facility'}                            = 'IT ��ʩ';
    $Lang->{'Office'}                                 = '�칫��';
    $Lang->{'Outlet'}                                 = '����';
    $Lang->{'Rack'}                                   = '����';
    $Lang->{'Room'}                                   = '����';
    $Lang->{'Workplace'}                              = '����';

    return 1;
}

1;
