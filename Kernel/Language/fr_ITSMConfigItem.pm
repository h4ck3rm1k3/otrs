# --
# Kernel/Language/fr_ITSMConfigItem.pm - the french translation of ITSMConfigItem
# Copyright (C) 2001-2009 Olivier Sallou <olivier.sallou at irisa.fr>
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: fr_ITSMConfigItem.pm,v 1.4 2010/09/21 17:09:44 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fr_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'El�ment de configuration';
    $Lang->{'Config Item-Area'}       = 'Zone des El�ments de Configuration';
    $Lang->{'Config Item Management'} = 'Gestion des El�ments de Configuration';
    $Lang->{'Change Definition'}      = 'D�finition du Changement';
    $Lang->{'Class'}                  = 'Classe';
    $Lang->{'Show Versions'}          = 'Montrer les Versions';
    $Lang->{'Hide Versions'}          = 'Cacher les Versions';
    $Lang->{'Last changed by'}        = 'Derni�re modification effectu�e par';
    $Lang->{'Last changed'}           = 'Derni�re modification';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Modification de la d�finition �chou�e! Regardez les Log Syst�mes pour plus de d�tails.';
    $Lang->{'Also search in previous versions?'} = 'Chercher �galement dans les versions pr�c�dentes??';
    $Lang->{'Config Items shown'}                = 'El�ments de configuration montr�s';
    $Lang->{'Config Items available'}            = 'El�ments de configuration disponibles';
    $Lang->{'Search Config Items'}               = 'Chercher dans les �l�ments de configuration';
    $Lang->{'Deployment State'}                  = 'Etat de d�ploiement';
    $Lang->{'Current Deployment State'}          = 'Etat actuel de d�ploiement';
    $Lang->{'Incident State'}                    = 'Etat de l\'incident';
    $Lang->{'Current Incident State'}            = 'Etat actuel de l\'incident';
    $Lang->{'The name of this config item'}      = 'Le nom de cet �l�ment de configuration';
    $Lang->{'The deployment state of this config item'}
        = 'L\'�tat de d�ploiement de cet �l�ment de configuration';
    $Lang->{'The incident state of this config item'} = 'L\'�tat d\'incident de cet �l�ment de configuration';
    $Lang->{'Last Change'}                            = 'Derni�re modification';
    $Lang->{'Duplicate'}                              = 'Dupliquer';
    $Lang->{'Expired'}                                = 'Expir�';
    $Lang->{'Inactive'}                               = 'Inactif';
    $Lang->{'Maintenance'}                            = 'Maintenance';
    $Lang->{'Pilot'}                                  = 'Pilote';
    $Lang->{'Planned'}                                = 'Planifi�';
    $Lang->{'Production'}                             = 'Production';
    $Lang->{'Repair'}                                 = 'En r�paration';
    $Lang->{'Retired'}                                = 'Retir�';
    $Lang->{'Review'}                                 = 'Revue';
    $Lang->{'Test/QA'}                                = 'Test/QA';
    $Lang->{'Operational'}                            = 'Op�rationnel';
    $Lang->{'Incident'}                               = 'Incident';
    $Lang->{'Desktop'}                                = 'Ordinateur';
    $Lang->{'Laptop'}                                 = 'Portable';
    $Lang->{'Other'}                                  = 'Autre';
    $Lang->{'PDA'}                                    = 'PDA';
    $Lang->{'Phone'}                                  = 'T�l�phone';
    $Lang->{'Server'}                                 = 'Serveur';
    $Lang->{'Backup Device'}                          = 'Element de sauvegarde';
    $Lang->{'Beamer'}                                 = 'R�troprojecteur';
    $Lang->{'Camera'}                                 = 'Cam�ra';
    $Lang->{'Docking Station'}                        = 'Base pour Portable';
    $Lang->{'Keybord'}                                = 'Clavier';
    $Lang->{'Modem'}                                  = 'Modem';
    $Lang->{'Monitor'}                                = 'Moniteur';
    $Lang->{'Mouse'}                                  = 'Souris';
    $Lang->{'Other'}                                  = 'Autre';
    $Lang->{'PCMCIA Card'}                            = 'Carte PCMCIA';
    $Lang->{'Printer'}                                = 'Imprimante';
    $Lang->{'Router'}                                 = 'Routeur';
    $Lang->{'Scanner'}                                = 'Scanner';
    $Lang->{'Security Device'}                        = 'P�riph�rique de s�curit�';
    $Lang->{'Switch'}                                 = 'Switch';
    $Lang->{'USB Device'}                             = 'P�riph�rique USB';
    $Lang->{'WLAN Access Point'}                      = 'Point d\'access WLAN';
    $Lang->{'GSM'}                                    = 'GSM';
    $Lang->{'LAN'}                                    = 'LAN';
    $Lang->{'Other'}                                  = 'Autre';
    $Lang->{'Telco'}                                  = 'Telco';
    $Lang->{'WLAN'}                                   = 'WLAN';
    $Lang->{'Admin Tool'}                             = 'Outil d\'Administration';
    $Lang->{'Client Application'}                     = 'Application Cliente';
    $Lang->{'Client OS'}                              = 'OS Client';
    $Lang->{'Embedded'}                               = 'Embarqu�';
    $Lang->{'Middleware'}                             = 'Middleware';
    $Lang->{'Other'}                                  = 'Autre';
    $Lang->{'Server Application'}                     = 'Application Serveur';
    $Lang->{'Server OS'}                              = 'OS Server';
    $Lang->{'User Tool'}                              = 'Outil Utilisateur';
    $Lang->{'Concurrent Users'}                       = 'Utilisateurs concurrents';
    $Lang->{'Demo'}                                   = 'Demo';
    $Lang->{'Developer Licence'}                      = 'License D�veloppeur';
    $Lang->{'Enterprise Licence'}                     = 'License Entreprise';
    $Lang->{'Freeware'}                               = 'Freeware/Graticiel';
    $Lang->{'Open Source'}                            = 'Open Source';
    $Lang->{'Per Node'}                               = 'Par noeud';
    $Lang->{'Per Processor'}                          = 'Par processeur';
    $Lang->{'Per Server'}                             = 'Par Serveur';
    $Lang->{'Per User'}                               = 'Par Utilisateur';
    $Lang->{'Single Licence'}                         = 'License unique';
    $Lang->{'Time Restricted'}                        = 'Limit�e dans le temps';
    $Lang->{'Unlimited'}                              = 'Illimit�';
    $Lang->{'Volume Licence'}                         = 'License par volume';
    $Lang->{'Model'}                                  = 'Mod�le';
    $Lang->{'Serial Number'}                          = 'Num�ro de s�rie';
    $Lang->{'Operating System'}                       = 'Syst�me d\'exploitation';
    $Lang->{'CPU'}                                    = 'CPU';
    $Lang->{'Ram'}                                    = 'RAM';
    $Lang->{'Hard Disk'}                              = 'Disque dur';
    $Lang->{'Hard Disk::Capacity'}                    = 'Disque dur::Capacit�';
    $Lang->{'Capacity'}                               = 'Capacit�';
    $Lang->{'FQDN'}                                   = 'FQDN';
    $Lang->{'Network Adapter'}                        = 'Adaptateur r�seau';
    $Lang->{'Network Adapter::IP over DHCP'}          = 'Adaptateur r�seau::IP sur DHCP';
    $Lang->{'Network Adapter::IP Address'}            = 'Adaptateur r�seau:: Adresse IP';
    $Lang->{'IP over DHCP'}                           = 'IP sur DHCP';
    $Lang->{'IP Address'}                             = 'Adresse IP';
    $Lang->{'Graphic Adapter'}                        = 'Adaptateur graphique';
    $Lang->{'Other Equipment'}                        = 'Autre �quipement';
    $Lang->{'Warranty Expiration Date'}               = 'Date d\'expiration de la garantie';
    $Lang->{'Install Date'}                           = 'Date d\'installation';
    $Lang->{'Network Address'}                        = 'Adresse r�seau';
    $Lang->{'Network Address::Subnet Mask'}           = 'Adresse r�seau::Masque du sous r�seau';
    $Lang->{'Network Address::Gateway'}               = 'Adresse r�seau::Passerelle';
    $Lang->{'Subnet Mask'}                            = 'Masque du sous r�seau';
    $Lang->{'Gateway'}                                = 'Passerelle';
    $Lang->{'Licence Type'}                           = 'Type de license';
    $Lang->{'Licence Key'}                            = 'Cl� de la license';
    $Lang->{'Licence Key::Quantity'}                  = 'Cl� de la license::Quantit�';
    $Lang->{'Licence Key::Expiration Date'}           = 'Cl� de la license::Date d\'expiration';
    $Lang->{'Quantity'}                               = 'Quantit�';
    $Lang->{'Expiration Date'}                        = 'Date d\'expiration';
    $Lang->{'Media'}                                  = 'Media';
    $Lang->{'Maximum number of one element'}          = 'Quantit� maximale pour un �l�ment';
    $Lang->{'Identifier'}                             = 'Identifiant';
    $Lang->{'Phone 1'}                                = 'T�l�phone 1';
    $Lang->{'Phone 2'}                                = 'T�l�phone 2';
    $Lang->{'Address'}                                = 'Adresse';
    $Lang->{'Building'}                               = 'Batiment';
    $Lang->{'Floor'}                                  = 'Etage';
    $Lang->{'IT Facility'}                            = 'D�partement IT';
    $Lang->{'Office'}                                 = 'Bureau';
    $Lang->{'Outlet'}                                 = 'Prise';
    $Lang->{'Rack'}                                   = 'Rack';
    $Lang->{'Room'}                                   = 'Pi�ce';
    $Lang->{'Workplace'}                              = 'Emplacement';
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
