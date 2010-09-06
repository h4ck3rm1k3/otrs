# --
# Kernel/Language/it_ITSMConfigItem.pm - the italian translation of ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: it_ITSMConfigItem.pm,v 1.3 2010/09/06 20:31:09 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::it_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Elemento di Configurazione';
    $Lang->{'Config Item-Area'}       = 'Area di Configurazione degli Elementi';
    $Lang->{'Config Item Management'} = 'Gestione degli Elementi di Configurazione';
    $Lang->{'Change Definition'}      = 'Modifica Definizione';
    $Lang->{'Class'}                  = 'Classe';
    $Lang->{'Show Versions'}          = 'Mostra Versioni';
    $Lang->{'Hide Versions'}          = 'Nascondi Versioni';
    $Lang->{'Last changed by'}        = 'Ultima modifica di';
    $Lang->{'Last changed'}           = 'Ultima modifica';
    $Lang->{'Change of definition failed! See System Log for details.'} = 'Aggiornamento delle definizioni fallita! Guarda nel Log del Sistema per dettagli';
    $Lang->{'Also search in previous versions?'} = 'Cercare anche in versioni precedenti?';
    $Lang->{'Config Items shown'}                = 'Elementi di configurazione mostrati';
    $Lang->{'Config Items available'}            = 'Elementi di configurazione disponibili';
    $Lang->{'Search Config Items'}               = 'Ricerca elementi di configurazione';
    $Lang->{'Deployment State'}                  = 'Stato di implementazione';
    $Lang->{'Current Deployment State'}          = 'Stato attuale di implementazione';
    $Lang->{'Incident State'}                    = 'Stato dell\'Incidente';
    $Lang->{'Current Incident State'}            = 'Stato attuale dell\'Incidente';
    $Lang->{'The name of this config item'}      = 'Il nome di questo elemento di configurazione';
    $Lang->{'The deployment state of this config item'} = 'Lo stato di implementazione di questo elemento di configurazione';
    $Lang->{'The incident state of this config item'} = 'Lo stato di incidente di questo elemento di configurazione';
    $Lang->{'Last Change'}                   = 'Ultima modifica';
    $Lang->{'Duplicate'}                     = 'Duplicato';
    $Lang->{'Expired'}                       = 'Scaduto';
    $Lang->{'Inactive'}                      = 'Inattivo';
    $Lang->{'Maintenance'}                   = 'Manutenzione';
    $Lang->{'Pilot'}                         = 'Pilot';
    $Lang->{'Planned'}                       = 'Pianificato';
    $Lang->{'Production'}                    = 'Produzione';
    $Lang->{'Repair'}                        = 'Riparazione';
    $Lang->{'Retired'}                       = 'Ritirato';
    $Lang->{'Review'}                        = 'Revisionato';
    $Lang->{'Test/QA'}                       = 'Test';
    $Lang->{'Operational'}                   = 'Operativo';
    $Lang->{'Incident'}                      = 'Incidente';
    $Lang->{'Desktop'}                       = 'Desktop';
    $Lang->{'Laptop'}                        = 'Portatile';
    $Lang->{'Other'}                         = 'Altro';
    $Lang->{'PDA'}                           = 'Palmare';
    $Lang->{'Phone'}                         = 'Telefono';
    $Lang->{'Server'}                        = 'Server';
    $Lang->{'Backup Device'}                 = 'Dispositivo di Copia';
    $Lang->{'Beamer'}                        = 'Video Beam';
    $Lang->{'Camera'}                        = 'Videocamera';
    $Lang->{'Docking Station'}               = 'Docking Station';
    $Lang->{'Keybord'}                       = 'Tastiera';
    $Lang->{'Modem'}                         = 'Modem';
    $Lang->{'Monitor'}                       = 'Monitor';
    $Lang->{'Mouse'}                         = 'Mouse';
    $Lang->{'Other'}                         = 'Altro';
    $Lang->{'PCMCIA Card'}                   = 'Scheda PCMCIA';
    $Lang->{'Printer'}                       = 'Stampante';
    $Lang->{'Router'}                        = 'Router';
    $Lang->{'Scanner'}                       = 'Scanner';
    $Lang->{'Security Device'}               = 'Dispositivo di sicurezza';
    $Lang->{'Switch'}                        = 'Switch';
    $Lang->{'USB Device'}                    = 'Dispositivo USB';
    $Lang->{'WLAN Access Point'}             = 'WLAN Access Point';
    $Lang->{'GSM'}                           = 'GSM';
    $Lang->{'LAN'}                           = 'LAN';
    $Lang->{'Other'}                         = 'Altro';
    $Lang->{'Telco'}                         = 'Telco';
    $Lang->{'WLAN'}                          = 'WLAN';
    $Lang->{'Admin Tool'}                    = 'Strumenti di Amministrazione';
    $Lang->{'Client Application'}            = 'Applicazione Cliente';
    $Lang->{'Client OS'}                     = 'SO Cliente';
    $Lang->{'Embedded'}                      = 'Embedded';
    $Lang->{'Middleware'}                    = 'Middleware';
    $Lang->{'Other'}                         = 'Altro';
    $Lang->{'Server Application'}            = 'Aplicazione Server';
    $Lang->{'Server OS'}                     = 'SO Server';
    $Lang->{'User Tool'}                     = 'Strumenti Utente';
    $Lang->{'Concurrent Users'}              = 'Utenti concorrenti';
    $Lang->{'Demo'}                          = 'Dimostrativo';
    $Lang->{'Developer Licence'}             = 'Licenza di Sviluppo';
    $Lang->{'Enterprise Licence'}            = 'Licenza Aziendale';
    $Lang->{'Freeware'}                      = 'Freeware';
    $Lang->{'Open Source'}                   = 'Open Source';
    $Lang->{'Per Node'}                      = 'Per Nodo';
    $Lang->{'Per Processor'}                 = 'Per Processore';
    $Lang->{'Per Server'}                    = 'Per Server';
    $Lang->{'Per User'}                      = 'Per Utente';
    $Lang->{'Single Licence'}                = 'Single Licence';
    $Lang->{'Time Restricted'}               = 'Limitata nel tempo';
    $Lang->{'Unlimited'}                     = 'Illimitata';
    $Lang->{'Volume Licence'}                = 'Licenza per Volume';
    $Lang->{'Model'}                         = 'Modello';
    $Lang->{'Serial Number'}                 = 'Numero Seriale';
    $Lang->{'Operating System'}              = 'Sistema Operativo';
    $Lang->{'CPU'}                           = 'CPU';
    $Lang->{'Ram'}                           = 'Ram';
    $Lang->{'Hard Disk'}                     = 'Disco Rigido';
    $Lang->{'Hard Disk::Capacity'}           = 'Disco Rigido::Capacit�';
    $Lang->{'Capacity'}                      = 'Capacit�';
    $Lang->{'FQDN'}                          = 'FQDN';
    $Lang->{'Network Adapter'}               = 'Adattatore di Rete';
    $Lang->{'Network Adapter::IP over DHCP'} = 'Adattatore di Rete::IP su DHCP';
    $Lang->{'Network Adapter::IP Address'}   = 'Adattatore di Rete::Indirizzo IP';
    $Lang->{'IP over DHCP'}                  = 'IP su DHCP';
    $Lang->{'IP Address'}                    = 'Indirizzo IP';
    $Lang->{'Graphic Adapter'}               = 'Scheda Grafica';
    $Lang->{'Other Equipment'}               = 'Altre Apparecchiature';
    $Lang->{'Warranty Expiration Date'}      = 'Data di scadenza della garanzia';
    $Lang->{'Install Date'}                  = 'Data di installazione';
    $Lang->{'Network Address'}               = 'Indirizzo di Rete';
    $Lang->{'Network Address::Subnet Mask'}  = 'Indirizzo di Rete::Subnet Mask';
    $Lang->{'Network Address::Gateway'}      = 'Indirizzo di Rete::Gateway';
    $Lang->{'Subnet Mask'}                   = 'Subnet Mask';
    $Lang->{'Gateway'}                       = 'Gateway';
    $Lang->{'Licence Type'}                  = 'Tipo di Licenza';
    $Lang->{'Licence Key'}                   = 'Chiave della Licenza';
    $Lang->{'Licence Key::Quantity'}         = 'Chiave della Licenza::Quantit�';
    $Lang->{'Licence Key::Expiration Date'}  = 'Chiave della Licenza::Data di scadenza';
    $Lang->{'Quantity'}                      = 'Quantit�';
    $Lang->{'Expiration Date'}               = 'Data di scadenza';
    $Lang->{'Media'}                         = 'Supporto';
    $Lang->{'Maximum number of one element'} = 'Numero massimo di un elemento';
    $Lang->{'Identifier'}                    = 'Identificativo';
    $Lang->{'Phone 1'}                       = '';
    $Lang->{'Phone 2'}                       = '';
    $Lang->{'Address'}                       = '';
    $Lang->{'Building'}                      = '';
    $Lang->{'Floor'}                         = '';
    $Lang->{'IT Facility'}                   = '';
    $Lang->{'Office'}                        = '';
    $Lang->{'Outlet'}                        = '';
    $Lang->{'Rack'}                          = '';
    $Lang->{'Room'}                          = '';
    $Lang->{'Workplace'}                     = '';
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

    return 1;
}

1;
