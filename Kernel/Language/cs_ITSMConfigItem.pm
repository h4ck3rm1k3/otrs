# --
# Kernel/Language/cs_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: cs_ITSMConfigItem.pm,v 1.4 2011/03/04 16:43:42 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cs_ITSMConfigItem;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Address'} = 'Adresa';
    $Self->{Translation}->{'Admin Tool'} = 'Administra�n� n�stroj';
    $Self->{Translation}->{'Backup Device'} = 'Z�lohov�c� Za��zen�';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Building'} = 'Budova';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = '';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = '';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = '';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = '';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = '';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = '';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = '';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = '';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = '';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = '';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = '';
    $Self->{Translation}->{'CPU'} = 'Procesor';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Capacity'} = 'Kapacita';
    $Self->{Translation}->{'Change Definition'} = 'Zm�na Definice';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Zm�na definice ne�sp�n�! Viz Syst�mov� Log pro podrobnosti.';
    $Self->{Translation}->{'Client Application'} = 'U�ivatelsk� Aplikace';
    $Self->{Translation}->{'Client OS'} = 'U�ivatelsk� Opera�n� Syst�m';
    $Self->{Translation}->{'Concurrent Users'} = 'Konkuren�n� U�ivatel�';
    $Self->{Translation}->{'Config Item-Area'} = 'Konfig. Polo�ka-Struktura';
    $Self->{Translation}->{'Config Items available'} = 'Dostupn� Konfig. Polo�ky';
    $Self->{Translation}->{'Config Items shown'} = 'Zobrazen� Konfig. Polo�ky';
    $Self->{Translation}->{'CMDB'} = '';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Desktop'} = 'Stoln�';
    $Self->{Translation}->{'Developer Licence'} = 'Licence V�voj��e';
    $Self->{Translation}->{'Docking Station'} = 'Dok Stanice';
    $Self->{Translation}->{'Duplicate'} = 'Duplikace';
    $Self->{Translation}->{'Embedded'} = 'Vestav�n�';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '';
    $Self->{Translation}->{'Enterprise Licence'} = 'Podnikov� Licence ';
    $Self->{Translation}->{'Expiration Date'} = 'Konec Platnosti';
    $Self->{Translation}->{'Expired'} = 'Propadnut�';
    $Self->{Translation}->{'FQDN'} = 'FQDN';
    $Self->{Translation}->{'Floor'} = 'podla��';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Gateway';
    $Self->{Translation}->{'Graphic Adapter'} = 'Grafick� Karta';
    $Self->{Translation}->{'Hard Disk'} = 'Pevn� Disk';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Pevn� Disk::Kapacita';
    $Self->{Translation}->{'Hide Versions'} = 'Skr�t Verze';
    $Self->{Translation}->{'IP Address'} = 'IP Adresa';
    $Self->{Translation}->{'IP over DHCP'} = 'IP z DHCP';
    $Self->{Translation}->{'IT Facility'} = 'IT P��slu�enstv�';
    $Self->{Translation}->{'Inactive'} = 'Neaktivn�';
    $Self->{Translation}->{'Incident'} = 'Incident';
    $Self->{Translation}->{'Install Date'} = 'Datum Instalace';
    $Self->{Translation}->{'Keybord'} = 'Kl�vesnice';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Mobiln�';
    $Self->{Translation}->{'Last Change'} = 'Posledn� zm�na';
    $Self->{Translation}->{'Licence Key'} = 'Licen�n� Kl��';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Licen�n� Kl��::Konec Platnosti';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Licen�n� Kl��::Mno�stv�';
    $Self->{Translation}->{'Licence Type'} = 'Druh licence';
    $Self->{Translation}->{'Maintenance'} = '�dr�ba';
    $Self->{Translation}->{'Maximum number of one element'} = 'Max po�et jedn� Polo�ky';
    $Self->{Translation}->{'Media'} = 'M�dium';
    $Self->{Translation}->{'Middleware'} = 'St�edn� �rove�';
    $Self->{Translation}->{'Model'} = 'Model';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Mouse'} = 'My�';
    $Self->{Translation}->{'Network Adapter'} = 'S�ov� Adapter';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'S�ov� Adapter::IP adresa';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'S�ov� Adapter::IP z DHCP';
    $Self->{Translation}->{'Network Address'} = 'S�ov� Adresa';
    $Self->{Translation}->{'Network Address::Gateway'} = 'S�ov� Adresa::Gateway';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'S�ov� Adresa::Maska Pods�t�';
    $Self->{Translation}->{'Open Source'} = 'Software s Otev�en�m K�dem';
    $Self->{Translation}->{'Operating System'} = 'Opera�n� Syst�m';
    $Self->{Translation}->{'Operational'} = 'Opera�n�';
    $Self->{Translation}->{'Other'} = 'Jin�';
    $Self->{Translation}->{'Other Equipment'} = 'Jin� Vybaven�';
    $Self->{Translation}->{'Outlet'} = 'Fili�lka';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA karta';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'na Uzel';
    $Self->{Translation}->{'Per Processor'} = 'na Procesor';
    $Self->{Translation}->{'Per Server'} = 'na Server';
    $Self->{Translation}->{'Per User'} = 'na U�ivatele';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'Pilot'} = '��d�c�';
    $Self->{Translation}->{'Planned'} = 'Napl�nov�no';
    $Self->{Translation}->{'Printer'} = 'Tisk�rna';
    $Self->{Translation}->{'Production'} = 'Produk�n�';
    $Self->{Translation}->{'Quantity'} = 'Mno�stv�';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Repair'} = 'Oprava/Obnoven�';
    $Self->{Translation}->{'Retired'} = 'Mimo provoz';
    $Self->{Translation}->{'Review'} = 'P�ehled';
    $Self->{Translation}->{'Room'} = 'M�stnost';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'Scanner'} = 'Skener';
    $Self->{Translation}->{'Search Config Items'} = 'Vyhledat Konfig. Polo�ky';
    $Self->{Translation}->{'Security Device'} = 'Bezpe�nostn� Za��zen�';
    $Self->{Translation}->{'Serial Number'} = 'S�riov� ��slo';
    $Self->{Translation}->{'Server'} = 'Server';
    $Self->{Translation}->{'Server Application'} = 'Serverov� Aplikace';
    $Self->{Translation}->{'Server OS'} = 'Serverov� Opera�n� Syst�m';
    $Self->{Translation}->{'Show Versions'} = 'Uk�zat Verze';
    $Self->{Translation}->{'Single Licence'} = 'Jednoduch� Licence';
    $Self->{Translation}->{'Subnet Mask'} = 'Maska Pods�t�';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'Test/QA'} = 'Test/Kontrola kvality';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Stav Nasazen� t�to Konfig. Polo�ky';
    $Self->{Translation}->{'The incident state of this config item'} = 'Stav Incidentu t�to Konfig. Polo�ky';
    $Self->{Translation}->{'Time Restricted'} = '�asov� omezen� Licence';
    $Self->{Translation}->{'USB Device'} = 'USB Za��zen�';
    $Self->{Translation}->{'Unlimited'} = 'Neomezen�';
    $Self->{Translation}->{'User Tool'} = 'U�ivatelsk� N�stroj';
    $Self->{Translation}->{'Volume Licence'} = 'Svazkov� Licence';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'P��stupov� Bod WLAN';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Konec platnosti z�ruky';
    $Self->{Translation}->{'Workplace'} = 'Pracovi�t�';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Spr�va Konfigura�n�ch Polo�ek';
    $Self->{Translation}->{'Change class definition'} = '';
    $Self->{Translation}->{'Config Item'} = 'Konfig. Polo�ka';
    $Self->{Translation}->{'Class'} = 'T��da';
    $Self->{Translation}->{'Definition'} = '';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = '';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Jm�no t�to Konfig. Polo�ky';
    $Self->{Translation}->{'Deployment State'} = 'Stav Nasazen�';
    $Self->{Translation}->{'Incident State'} = 'Stav Incidentu';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '';
    $Self->{Translation}->{'Config Items per page'} = '';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = '';
    $Self->{Translation}->{'Current Incident State'} = 'Aktu�ln� Stav Incidentu';
    $Self->{Translation}->{'Current Incident State Type'} = '';
    $Self->{Translation}->{'Last Changed'} = '';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = '';
    $Self->{Translation}->{'ConfigItem-Info'} = '';
    $Self->{Translation}->{'Current Deployment State'} = 'Aktu�ln� Stav Nasazen�';
    $Self->{Translation}->{'Last changed'} = 'Posledn� zm�na';
    $Self->{Translation}->{'Last changed by'} = 'Posledn� zm�na od';
    $Self->{Translation}->{'Linked-Object'} = '';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Search-Template'} = '';
    $Self->{Translation}->{'Create New Template'} = '';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Hledat tak� v p�edchoz�ch verz�ch?';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = '';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '';
    $Self->{Translation}->{'Linked Objects'} = '';
    $Self->{Translation}->{'Show one version'} = '';
    $Self->{Translation}->{'Show all versions'} = '';
    $Self->{Translation}->{'Version Incident State'} = '';
    $Self->{Translation}->{'Version Number'} = '';
    $Self->{Translation}->{'Created By'} = '';
    $Self->{Translation}->{'Changed On'} = '';
    $Self->{Translation}->{'Resize'} = '';
    $Self->{Translation}->{'Show or hide the content.'} = '';
    $Self->{Translation}->{'Configuration Item Version Details'} = '';
    $Self->{Translation}->{'Property'} = '';

    # SysConfig
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = '';
    $Self->{Translation}->{'Configuration Item limit per page'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} = '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} = '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} = '';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected'} = '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} = '';
    $Self->{Translation}->{'Module to genetare ITSM config item statistics.'} = '';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} = '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} = '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} = '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} = '';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} = '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
