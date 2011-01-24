# --
# Kernel/Language/fr_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: fr_ITSMConfigItem.pm,v 1.5 2011/01/24 20:23:19 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fr_ITSMConfigItem;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Address'} = 'Adresse';
    $Self->{Translation}->{'Admin Tool'} = 'Outil d\'Administration';
    $Self->{Translation}->{'Backup Device'} = 'Element de sauvegarde';
    $Self->{Translation}->{'Beamer'} = 'R�troprojecteur';
    $Self->{Translation}->{'Building'} = 'Batiment';
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
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = 'Cam�ra';
    $Self->{Translation}->{'Capacity'} = 'Capacit�';
    $Self->{Translation}->{'Change Definition'} = 'D�finition du Changement';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Modification de la d�finition �chou�e! Regardez les Log Syst�mes pour plus de d�tails.';
    $Self->{Translation}->{'Client Application'} = 'Application Cliente';
    $Self->{Translation}->{'Client OS'} = 'OS Client';
    $Self->{Translation}->{'Concurrent Users'} = 'Utilisateurs concurrents';
    $Self->{Translation}->{'Config Item-Area'} = 'Zone des El�ments de Configuration';
    $Self->{Translation}->{'Config Items available'} = 'El�ments de configuration disponibles';
    $Self->{Translation}->{'Config Items shown'} = 'El�ments de configuration montr�s';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Desktop'} = 'Ordinateur';
    $Self->{Translation}->{'Developer Licence'} = 'License D�veloppeur';
    $Self->{Translation}->{'Docking Station'} = 'Base pour Portable';
    $Self->{Translation}->{'Duplicate'} = 'Dupliquer';
    $Self->{Translation}->{'Embedded'} = 'Embarqu�';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '';
    $Self->{Translation}->{'Enterprise Licence'} = 'License Entreprise';
    $Self->{Translation}->{'Expiration Date'} = 'Date d\'expiration';
    $Self->{Translation}->{'Expired'} = 'Expir�';
    $Self->{Translation}->{'FQDN'} = 'FQDN';
    $Self->{Translation}->{'Floor'} = 'Etage';
    $Self->{Translation}->{'Freeware'} = 'Freeware/Graticiel';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Passerelle';
    $Self->{Translation}->{'Graphic Adapter'} = 'Adaptateur graphique';
    $Self->{Translation}->{'Hard Disk'} = 'Disque dur';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Disque dur::Capacit�';
    $Self->{Translation}->{'Hide Versions'} = 'Cacher les Versions';
    $Self->{Translation}->{'IP Address'} = 'Adresse IP';
    $Self->{Translation}->{'IP over DHCP'} = 'IP sur DHCP';
    $Self->{Translation}->{'IT Facility'} = 'D�partement IT';
    $Self->{Translation}->{'Inactive'} = 'Inactif';
    $Self->{Translation}->{'Incident'} = 'Incident';
    $Self->{Translation}->{'Install Date'} = 'Date d\'installation';
    $Self->{Translation}->{'Keybord'} = 'Clavier';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Portable';
    $Self->{Translation}->{'Last Change'} = 'Derni�re modification';
    $Self->{Translation}->{'Licence Key'} = 'Cl� de la license';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Cl� de la license::Date d\'expiration';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Cl� de la license::Quantit�';
    $Self->{Translation}->{'Licence Type'} = 'Type de license';
    $Self->{Translation}->{'Maintenance'} = 'Maintenance';
    $Self->{Translation}->{'Maximum number of one element'} = 'Quantit� maximale pour un �l�ment';
    $Self->{Translation}->{'Media'} = 'Media';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Model'} = 'Mod�le';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Moniteur';
    $Self->{Translation}->{'Mouse'} = 'Souris';
    $Self->{Translation}->{'Network Adapter'} = 'Adaptateur r�seau';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Adaptateur r�seau:: Adresse IP';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Adaptateur r�seau::IP sur DHCP';
    $Self->{Translation}->{'Network Address'} = 'Adresse r�seau';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Adresse r�seau::Passerelle';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Adresse r�seau::Masque du sous r�seau';
    $Self->{Translation}->{'Open Source'} = 'Open Source';
    $Self->{Translation}->{'Operating System'} = 'Syst�me d\'exploitation';
    $Self->{Translation}->{'Operational'} = 'Op�rationnel';
    $Self->{Translation}->{'Other'} = 'Autre';
    $Self->{Translation}->{'Other Equipment'} = 'Autre �quipement';
    $Self->{Translation}->{'Outlet'} = 'Prise';
    $Self->{Translation}->{'PCMCIA Card'} = 'Carte PCMCIA';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'Par noeud';
    $Self->{Translation}->{'Per Processor'} = 'Par processeur';
    $Self->{Translation}->{'Per Server'} = 'Par Serveur';
    $Self->{Translation}->{'Per User'} = 'Par Utilisateur';
    $Self->{Translation}->{'Phone 1'} = 'T�l�phone 1';
    $Self->{Translation}->{'Phone 2'} = 'T�l�phone 2';
    $Self->{Translation}->{'Pilot'} = 'Pilote';
    $Self->{Translation}->{'Planned'} = 'Planifi�';
    $Self->{Translation}->{'Printer'} = 'Imprimante';
    $Self->{Translation}->{'Production'} = 'Production';
    $Self->{Translation}->{'Quantity'} = 'Quantit�';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Repair'} = 'En r�paration';
    $Self->{Translation}->{'Retired'} = 'Retir�';
    $Self->{Translation}->{'Review'} = 'Revue';
    $Self->{Translation}->{'Room'} = 'Pi�ce';
    $Self->{Translation}->{'Router'} = 'Routeur';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Search Config Items'} = 'Chercher dans les �l�ments de configuration';
    $Self->{Translation}->{'Security Device'} = 'P�riph�rique de s�curit�';
    $Self->{Translation}->{'Serial Number'} = 'Num�ro de s�rie';
    $Self->{Translation}->{'Server'} = 'Serveur';
    $Self->{Translation}->{'Server Application'} = 'Application Serveur';
    $Self->{Translation}->{'Server OS'} = 'OS Server';
    $Self->{Translation}->{'Show Versions'} = 'Montrer les Versions';
    $Self->{Translation}->{'Single Licence'} = 'License unique';
    $Self->{Translation}->{'Subnet Mask'} = 'Masque du sous r�seau';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'Test/QA'} = 'Test/QA';
    $Self->{Translation}->{'The deployment state of this config item'} = 'L\'�tat de d�ploiement de cet �l�ment de configuration';
    $Self->{Translation}->{'The incident state of this config item'} = 'L\'�tat d\'incident de cet �l�ment de configuration';
    $Self->{Translation}->{'Time Restricted'} = 'Limit�e dans le temps';
    $Self->{Translation}->{'USB Device'} = 'P�riph�rique USB';
    $Self->{Translation}->{'Unlimited'} = 'Illimit�';
    $Self->{Translation}->{'User Tool'} = 'Outil Utilisateur';
    $Self->{Translation}->{'Volume Licence'} = 'License par volume';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'Point d\'access WLAN';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Date d\'expiration de la garantie';
    $Self->{Translation}->{'Workplace'} = 'Emplacement';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Gestion des El�ments de Configuration';
    $Self->{Translation}->{'Change class definition'} = '';
    $Self->{Translation}->{'Config Item'} = 'El�ment de configuration';
    $Self->{Translation}->{'Class'} = 'Classe';
    $Self->{Translation}->{'Definition'} = '';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = '';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Le nom de cet �l�ment de configuration';
    $Self->{Translation}->{'Deployment State'} = 'Etat de d�ploiement';
    $Self->{Translation}->{'Incident State'} = 'Etat de l\'incident';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '';
    $Self->{Translation}->{'Config Items per page'} = '';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = '';
    $Self->{Translation}->{'Current Incident State'} = 'Etat actuel de l\'incident';
    $Self->{Translation}->{'Current Incident State Type'} = '';
    $Self->{Translation}->{'Last Changed'} = '';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = '';
    $Self->{Translation}->{'ConfigItem-Info'} = '';
    $Self->{Translation}->{'Current Deployment State'} = 'Etat actuel de d�ploiement';
    $Self->{Translation}->{'Last changed'} = 'Derni�re modification';
    $Self->{Translation}->{'Last changed by'} = 'Derni�re modification effectu�e par';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Search-Template'} = '';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Chercher �galement dans les versions pr�c�dentes??';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = '';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '';
    $Self->{Translation}->{'Show one version'} = '';
    $Self->{Translation}->{'Show all versions'} = '';
    $Self->{Translation}->{'Version Incident State'} = '';
    $Self->{Translation}->{'Version Number'} = '';
    $Self->{Translation}->{'Created By'} = '';
    $Self->{Translation}->{'Changed On'} = '';
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
