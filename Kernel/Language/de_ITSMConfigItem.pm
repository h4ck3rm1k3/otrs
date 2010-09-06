# --
# Kernel/Language/de_ITSMConfigItem.pm - the german translation of ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: de_ITSMConfigItem.pm,v 1.9 2010/09/06 20:31:09 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.9 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Config Item';
    $Lang->{'Config Item-Area'}       = 'Config Item-Bereich';
    $Lang->{'Config Item Management'} = 'Config Item Verwaltung';
    $Lang->{'Change Definition'}      = 'Definition �ndern';
    $Lang->{'Class'}                  = 'Klasse';
    $Lang->{'Show Versions'}          = 'Versionen einblenden';
    $Lang->{'Hide Versions'}          = 'Versionen ausblenden';
    $Lang->{'Last changed by'}        = 'Zuletzt ge�ndert von';
    $Lang->{'Last changed'}           = 'Zuletzt ge�ndert';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = '�ndern der Definition fehlgeschlagen! Im System Log finden Sie weitere Informationen.';
    $Lang->{'Also search in previous versions?'} = 'Auch in fr�heren Versionen suchen?';
    $Lang->{'Config Items shown'}                = 'Config Items angezeigt';
    $Lang->{'Config Items available'}            = 'Config Items verf�gbar';
    $Lang->{'Search Config Items'}               = 'Config Item Suche';
    $Lang->{'Deployment State'}                  = 'Verwendungsstatus';
    $Lang->{'Current Deployment State'}          = 'Aktueller Verwendungsstatus';
    $Lang->{'Incident State'}                    = 'Vorfallsstatus';
    $Lang->{'Current Incident State'}            = 'Aktueller Vorfallsstatus';
    $Lang->{'The name of this config item'}      = 'Der Name dieses Config Items';
    $Lang->{'The deployment state of this config item'}
        = 'Der Verwendungsstatus dieses Config Items';
    $Lang->{'The incident state of this config item'} = 'Der Vorfallsstatus dieses Config Items';
    $Lang->{'Last Change'}                            = 'Letzte �nderung';
    $Lang->{'Duplicate'}                              = 'Duplizieren';
    $Lang->{'Expired'}                                = 'Abgelaufen';
    $Lang->{'Inactive'}                               = 'Inaktiv';
    $Lang->{'Maintenance'}                            = 'In Wartung';
    $Lang->{'Pilot'}                                  = 'Pilotbetrieb';
    $Lang->{'Planned'}                                = 'Geplant';
    $Lang->{'Production'}                             = 'Produktiv';
    $Lang->{'Repair'}                                 = 'In Reparatur';
    $Lang->{'Retired'}                                = 'Au�er Dienst';
    $Lang->{'Review'}                                 = 'Unter Review';
    $Lang->{'Test/QA'}                                = 'Test/QS';
    $Lang->{'Operational'}                            = 'Operativ';
    $Lang->{'Incident'}                               = 'Vorfall';
    $Lang->{'Desktop'}                                = 'Desktop';
    $Lang->{'Laptop'}                                 = 'Laptop';
    $Lang->{'Other'}                                  = 'Sonstiges';
    $Lang->{'PDA'}                                    = 'PDA';
    $Lang->{'Phone'}                                  = 'Telefon';
    $Lang->{'Server'}                                 = 'Server';
    $Lang->{'Backup Device'}                          = 'Backup Ger�t';
    $Lang->{'Beamer'}                                 = 'Beamer';
    $Lang->{'Camera'}                                 = 'Kamera';
    $Lang->{'Docking Station'}                        = 'Docking Station';
    $Lang->{'Keybord'}                                = 'Tastatur';
    $Lang->{'Modem'}                                  = 'Modem';
    $Lang->{'Monitor'}                                = 'Monitor';
    $Lang->{'Mouse'}                                  = 'Maus';
    $Lang->{'Other'}                                  = 'Sonstiges';
    $Lang->{'PCMCIA Card'}                            = 'PCMCIA Karte';
    $Lang->{'Printer'}                                = 'Drucker';
    $Lang->{'Router'}                                 = 'Router';
    $Lang->{'Scanner'}                                = 'Scanner';
    $Lang->{'Security Device'}                        = 'Sichertheitsger�t';
    $Lang->{'Switch'}                                 = 'Switch';
    $Lang->{'USB Device'}                             = 'USB Ger�t';
    $Lang->{'WLAN Access Point'}                      = 'WLAN Access Point';
    $Lang->{'GSM'}                                    = 'GSM';
    $Lang->{'LAN'}                                    = 'LAN';
    $Lang->{'Other'}                                  = 'Sonstiges';
    $Lang->{'Telco'}                                  = 'Telko';
    $Lang->{'WLAN'}                                   = 'WLAN';
    $Lang->{'Admin Tool'}                             = 'Admin Tool';
    $Lang->{'Client Application'}                     = 'Client Anwendung';
    $Lang->{'Client OS'}                              = 'Client Betriebssystem';
    $Lang->{'Embedded'}                               = 'Embedded';
    $Lang->{'Middleware'}                             = 'Middleware';
    $Lang->{'Other'}                                  = 'Sonstiges';
    $Lang->{'Server Application'}                     = 'Server Anwendung';
    $Lang->{'Server OS'}                              = 'Server Betriebssystem';
    $Lang->{'User Tool'}                              = 'User Tool';
    $Lang->{'Concurrent Users'}                       = 'Gleichzeitige User';
    $Lang->{'Demo'}                                   = 'Demo';
    $Lang->{'Developer Licence'}                      = 'Entwickler Lizenz';
    $Lang->{'Enterprise Licence'}                     = 'Enterprise Lizenz';
    $Lang->{'Freeware'}                               = 'Freeware';
    $Lang->{'Open Source'}                            = 'Open Source';
    $Lang->{'Per Node'}                               = 'Pro Knoten';
    $Lang->{'Per Processor'}                          = 'Pro Prozessor';
    $Lang->{'Per Server'}                             = 'Pro Server';
    $Lang->{'Per User'}                               = 'Pro Benutzer';
    $Lang->{'Single Licence'}                         = 'Einzellizenz';
    $Lang->{'Time Restricted'}                        = 'Zeitlich begrenzt';
    $Lang->{'Unlimited'}                              = 'Unlimitiert';
    $Lang->{'Volume Licence'}                         = 'Volumen Lizenz';
    $Lang->{'Model'}                                  = 'Model';
    $Lang->{'Serial Number'}                          = 'Seriennummer';
    $Lang->{'Operating System'}                       = 'Betriebssystem';
    $Lang->{'CPU'}                                    = 'CPU';
    $Lang->{'Ram'}                                    = 'Arbeitsspeicher';
    $Lang->{'Hard Disk'}                              = 'Festplatte';
    $Lang->{'Hard Disk::Capacity'}                    = 'Festplatte::Kapazit�t';
    $Lang->{'Capacity'}                               = 'Kapazit�t';
    $Lang->{'FQDN'}                                   = 'FQDN';
    $Lang->{'Network Adapter'}                        = 'Netzwerk Adapter';
    $Lang->{'Network Adapter::IP over DHCP'}          = 'Netzwerk Adapter::IP �ber DHCP';
    $Lang->{'Network Adapter::IP Address'}            = 'Netzwerk Adapter::IP Addresse';
    $Lang->{'IP over DHCP'}                           = 'IP �ber DHCP';
    $Lang->{'IP Address'}                             = 'IP Addresse';
    $Lang->{'Graphic Adapter'}                        = 'Grafik Adapter';
    $Lang->{'Other Equipment'}                        = 'Sonstige Ausstattung';
    $Lang->{'Warranty Expiration Date'}               = 'Garantie Ablaufdatum';
    $Lang->{'Install Date'}                           = 'Installationsdatum';
    $Lang->{'Network Address'}                        = 'Netzwerk Addresse';
    $Lang->{'Network Address::Subnet Mask'}           = 'Netzwerk Addresse::Subnetz Maske';
    $Lang->{'Network Address::Gateway'}               = 'Netzwerk Addresse::Gateway';
    $Lang->{'Subnet Mask'}                            = 'Subnetz Maske';
    $Lang->{'Gateway'}                                = 'Gateway';
    $Lang->{'Licence Type'}                           = 'Lizenztyp';
    $Lang->{'Licence Key'}                            = 'Lizenzschl�ssel';
    $Lang->{'Licence Key::Quantity'}                  = 'Lizenzschl�ssel::Menge';
    $Lang->{'Licence Key::Expiration Date'}           = 'Lizenzschl�ssel::Ablaufdatum';
    $Lang->{'Quantity'}                               = 'Menge';
    $Lang->{'Expiration Date'}                        = 'Ablaufdatum';
    $Lang->{'Media'}                                  = 'Medium';
    $Lang->{'Maximum number of one element'}          = 'Maximale Anzahl eines Elements';
    $Lang->{'Empty fields indicate that the current values are kept'}
        = 'Leere Felder belassen den aktuellen Wert';
    $Lang->{'Identifier'}                             = 'Identifikator';
    $Lang->{'Phone 1'}                                = 'Telefon 1';
    $Lang->{'Phone 2'}                                = 'Telefon 2';
    $Lang->{'Address'}                                = 'Adresse';
    $Lang->{'Building'}                               = 'Geb�ude';
    $Lang->{'Floor'}                                  = 'Etage';
    $Lang->{'IT Facility'}                            = 'IT Einrichtung';
    $Lang->{'Office'}                                 = 'B�ro';
    $Lang->{'Outlet'}                                 = 'Anschlussdose';
    $Lang->{'Rack'}                                   = 'Rack';
    $Lang->{'Room'}                                   = 'Raum';
    $Lang->{'Workplace'}                              = 'Arbeitsplatz';
    $Lang->{'CIHistory::ConfigItemCreate'}            = 'Neues ConfigItem (ID=%s)';
    $Lang->{'CIHistory::VersionCreate'}               = 'Neue Version erzeugt (ID=%s)';
    $Lang->{'CIHistory::DeploymentStateUpdate'}       = 'Verwendungsstatus ge�ndert (neu=%s; alt=%s)';
    $Lang->{'CIHistory::IncidentStateUpdate'}         = 'Vorfallsstatus ge�ndert (neu=%s; alt=%s)';
    $Lang->{'CIHistory::ConfigItemDelete'}            = 'ConfigItem (ID=%s) gel�scht';
    $Lang->{'CIHistory::LinkAdd'}                     = 'Link auf %s (Typ=%s) hinzugef�gt';
    $Lang->{'CIHistory::LinkDelete'}                  = 'Link auf %s (Typ=%s) gel�scht';
    $Lang->{'CIHistory::DefinitionUpdate'}            = 'Definition des ConfigItems aktualisiert (ID=%s)';
    $Lang->{'CIHistory::NameUpdate'}                  = 'Name ge�ndert (neu=%s; alt=%s)';
    $Lang->{'CIHistory::ValueUpdate'}                 = 'Attribut %s von "%s" auf "%s" ge�ndert';
    $Lang->{'CIHistory::VersionDelete'}               = 'Version %s gel�scht';
    $Lang->{'Frontend module registration for the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} = '';
    $Lang->{'Presents a link in the menu to go show versions in the configuraton item zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'}  = '';
    $Lang->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} = 'Definiert das Standard-Subobject der Klasse';
    $Lang->{'Object backend module registration for the import/export module.'} = 'Objekt-Backend Modul Registration des Import/Export Moduls.';
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
