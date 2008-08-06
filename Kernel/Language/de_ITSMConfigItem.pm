# --
# Kernel/Language/de_ITSMConfigItem.pm - the german translation of ITSMConfigItem
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: de_ITSMConfigItem.pm,v 1.3 2008/08/06 10:44:41 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::de_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

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
    $Lang->{'Identifier'}                             = 'Identifikator';

    return 1;
}

1;
