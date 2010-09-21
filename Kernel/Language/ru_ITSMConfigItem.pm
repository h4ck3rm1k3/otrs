# --
# Kernel/Language/ru_ITSMConfigItem.pm - the russian translation of ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Egor Tsilenko <bg8s at symlink.ru>
# --
# $Id: ru_ITSMConfigItem.pm,v 1.6 2010/09/21 17:09:44 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ru_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = '�������� ��������';
    $Lang->{'Config Item-Area'}       = '����� �������� �������';
    $Lang->{'Config Item Management'} = '���������� ��������� ����������';
    $Lang->{'Change Definition'}      = '�������� ��������';
    $Lang->{'Class'}                  = '�����';
    $Lang->{'Show Versions'}          = '�������� ������';
    $Lang->{'Hide Versions'}          = '������ ������';
    $Lang->{'Last changed by'}        = '����� ���������� ���������';
    $Lang->{'Last changed'}           = '����� ���������� ���������';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = '���������� �������� ��������! ��� ��������� ���������� ������ System Log.';
    $Lang->{'Also search in previous versions?'} = '������ � ���������� �������?';
    $Lang->{'Config Items shown'}                = '�������� �������� �������';
    $Lang->{'Config Items available'}            = '�������� �������� �������';
    $Lang->{'Search Config Items'}               = '����� �������� �������';
    $Lang->{'Deployment State'}                  = '��������� �������������';
    $Lang->{'Current Deployment State'}          = '������� ��������� �������������';
    $Lang->{'Incident State'}                    = '��������� ���������';
    $Lang->{'Current Incident State'}            = '������� ��������� ���������';
    $Lang->{'The name of this config item'}      = '��� ����� �������� ��������';
    $Lang->{'The deployment state of this config item'}
        = '��������� ������������� ����� ��������� ��������';
    $Lang->{'The incident state of this config item'} = '������';
    $Lang->{'Last Change'}                            = '����� ���������� ���������';
    $Lang->{'Duplicate'}                              = '������';
    $Lang->{'Expired'}                                = '��������';
    $Lang->{'Inactive'}                               = '���������';
    $Lang->{'Maintenance'}                            = '����������� ������������';
    $Lang->{'Pilot'}                                  = '�����������';
    $Lang->{'Planned'}                                = '��������������';
    $Lang->{'Production'}                             = '������������';
    $Lang->{'Repair'}                                 = '������';
    $Lang->{'Retired'}                                = '�������';
    $Lang->{'Review'}                                 = '����������';
    $Lang->{'Test/QA'}                                = '������������';
    $Lang->{'Operational'}                            = '� ������������';
    $Lang->{'Incident'}                               = '��������';
    $Lang->{'Desktop'}                                = '���������� ��';
    $Lang->{'Laptop'}                                 = '�������';
    $Lang->{'Other'}                                  = '������';
    $Lang->{'PDA'}                                    = 'PDA';
    $Lang->{'Phone'}                                  = '�������';
    $Lang->{'Server'}                                 = '������';
    $Lang->{'Backup Device'}                          = '���������� ������';
    $Lang->{'Beamer'}                                 = '��������';
    $Lang->{'Camera'}                                 = '������';
    $Lang->{'Docking Station'}                        = '���-�������';
    $Lang->{'Keybord'}                                = '����������';
    $Lang->{'Modem'}                                  = '�����';
    $Lang->{'Monitor'}                                = '�������';
    $Lang->{'Mouse'}                                  = '�����';
    $Lang->{'Other'}                                  = '������';
    $Lang->{'PCMCIA Card'}                            = 'PCMCIA �����';
    $Lang->{'Printer'}                                = '�������';
    $Lang->{'Router'}                                 = '�������������';
    $Lang->{'Scanner'}                                = '������';
    $Lang->{'Security Device'}                        = '�����-�����';
    $Lang->{'Switch'}                                 = '����������';
    $Lang->{'USB Device'}                             = 'USB ����������';
    $Lang->{'WLAN Access Point'}                      = 'WLAN ����� �������';
    $Lang->{'GSM'}                                    = 'GSM';
    $Lang->{'LAN'}                                    = '������� �����';
    $Lang->{'Other'}                                  = '������';
    $Lang->{'Telco'}                                  = '';
    $Lang->{'WLAN'}                                   = 'WLAN';
    $Lang->{'Admin Tool'}                             = '��������� �������';
    $Lang->{'Client Application'}                     = '���������� ����������';
    $Lang->{'Client OS'}                              = '���������� ��';
    $Lang->{'Embedded'}                               = '����������';
    $Lang->{'Middleware'}                             = '������������� ��';
    $Lang->{'Other'}                                  = '������';
    $Lang->{'Server Application'}                     = '��������� ����������';
    $Lang->{'Server OS'}                              = '��������� ��';
    $Lang->{'User Tool'}                              = '���������������� �������';
    $Lang->{'Concurrent Users'}                       = '����������� ��������';
    $Lang->{'Demo'}                                   = '����-������';
    $Lang->{'Developer Licence'}                      = '�������� ��� ������������';
    $Lang->{'Enterprise Licence'}                     = '������������� ��������';
    $Lang->{'Freeware'}                               = '���������� ��';
    $Lang->{'Open Source'}                            = '�� � �������� �����';
    $Lang->{'Per Node'}                               = '�� ����(����)';
    $Lang->{'Per Processor'}                          = '�� ���';
    $Lang->{'Per Server'}                             = '�� ������';
    $Lang->{'Per User'}                               = '�� ������������';
    $Lang->{'Single Licence'}                         = '����������� ��������';
    $Lang->{'Time Restricted'}                        = '������������ �� �������';
    $Lang->{'Unlimited'}                              = '��� �����������';
    $Lang->{'Volume Licence'}                         = '������������� ��������';
    $Lang->{'Model'}                                  = '������';
    $Lang->{'Serial Number'}                          = '�������� �����';
    $Lang->{'Operating System'}                       = '������������ �������';
    $Lang->{'CPU'}                                    = '���';
    $Lang->{'Ram'}                                    = '���';
    $Lang->{'Hard Disk'}                              = '������� ����';
    $Lang->{'Hard Disk::Capacity'}                    = '������� ����::�����';
    $Lang->{'Capacity'}                               = '�����';
    $Lang->{'FQDN'}                                   = 'FQDN';
    $Lang->{'Network Adapter'}                        = '������� �������';
    $Lang->{'Network Adapter::IP over DHCP'}          = '������� �������::IP �� DHCP';
    $Lang->{'Network Adapter::IP Address'}            = '������� �������::IP �����';
    $Lang->{'IP over DHCP'}                           = 'IP �� DHCP';
    $Lang->{'IP Address'}                             = 'IP �����';
    $Lang->{'Graphic Adapter'}                        = '����� �������';
    $Lang->{'Other Equipment'}                        = '������ ������������';
    $Lang->{'Warranty Expiration Date'}               = '���� ��������� ��������';
    $Lang->{'Install Date'}                           = '���� ���������';
    $Lang->{'Network Address'}                        = '������� �����';
    $Lang->{'Network Address::Subnet Mask'}           = '������� �����::����� �������';
    $Lang->{'Network Address::Gateway'}               = '������� �����::����';
    $Lang->{'Subnet Mask'}                            = '����� �������';
    $Lang->{'Gateway'}                                = '����';
    $Lang->{'Licence Type'}                           = '��� ��������';
    $Lang->{'Licence Key'}                            = '������������ ����';
    $Lang->{'Licence Key::Quantity'}                  = '������������ ����::����������';
    $Lang->{'Licence Key::Expiration Date'}           = '������������ ����::���� ��������';
    $Lang->{'Quantity'}                               = '����������';
    $Lang->{'Expiration Date'}                        = '���� ��������';
    $Lang->{'Media'}                                  = '�������������� ��������';
    $Lang->{'Maximum number of one element'}          = '������������ ���������� ������ ��������';
    $Lang->{'Identifier'}                             = '�������������';
    $Lang->{'Phone 1'}                                = '';
    $Lang->{'Phone 2'}                                = '';
    $Lang->{'Address'}                                = '';
    $Lang->{'Building'}                               = '';
    $Lang->{'Floor'}                                  = '';
    $Lang->{'IT Facility'}                            = '';
    $Lang->{'Office'}                                 = '';
    $Lang->{'Outlet'}                                 = '';
    $Lang->{'Rack'}                                   = '';
    $Lang->{'Room'}                                   = '';
    $Lang->{'Workplace'}                              = '';
    $Lang->{'CIHistory::ConfigItemCreate'}              = '';
    $Lang->{'CIHistory::VersionCreate'}                 = '';
    $Lang->{'CIHistory::DeploymentStateUpdate'}         = '';
    $Lang->{'CIHistory::IncidentStateUpdate'}           = '';
    $Lang->{'CIHistory::ConfigItemDelete'}              = '';
    $Lang->{'CIHistory::LinkAdd'}                       = '';
    $Lang->{'CIHistory::LinkDelete'}                    = '';
    $Lang->{'CIHistory::DefinitionUpdate'}              = '';
    $Lang->{'CIHistory::NameUpdate'}                    = '';
    $Lang->{'CIHistory::ValueUpdate'}                   = '';
    $Lang->{'CIHistory::VersionDelete'}                 = '';
    $Lang->{'Frontend module registration for the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} = '';
    $Lang->{'Presents a link in the menu to go show versions in the configuraton item zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} = '';
    $Lang->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} = '';
    $Lang->{'Module to genetare ITSM config item statistics.'} = '';
    $Lang->{'Object backend module registration for the import/export module.'} = '';
    $Lang->{'Config item event module that enables logging to history in the agent interface.'} = '';
    $Lang->{'Shows the config item history (reverse ordered) in the agent interface.'} = '';
    $Lang->{'Parameters for the deployment states in the preferences view of the agent interface.'} = '';
    $Lang->{'Module to check the group responsible for a class.'} = '';
    $Lang->{'Module to check the group responsible for a configuration item.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} = '';
    $Lang->{'Configuration item search backend router of the agent interface.'} = '';
    $Lang->{'Parameters for the pages (in which the configuration items are shown).'} = '';
    $Lang->{'Configuration Item Limit'} = '';
    $Lang->{'Configuration Item limit per page'} = '';

    return 1;
}

1;
