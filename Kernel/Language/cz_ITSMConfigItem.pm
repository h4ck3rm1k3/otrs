# --
# Kernel/Language/cz_ITSMConfigItem.pm - the czech translation of ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2007-2008 Milen Koutev
# Copyright (C) 2010 O2BS.com, s r.o. Jakub Hanus
# --
# $Id: cz_ITSMConfigItem.pm,v 1.7 2010/02/22 12:18:30 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cz_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Konfig. Polo�ka';
    $Lang->{'Config Item-Area'}       = 'Konfig. Polo�ka-Struktura';
    $Lang->{'Config Item Management'} = 'Spr�va Konfigura�n�ch Polo�ek';
    $Lang->{'Change Definition'}      = 'Zm�na Definice';
    $Lang->{'Class'}                  = 'T��da';
    $Lang->{'Show Versions'}          = 'Uk�zat Verze';
    $Lang->{'Hide Versions'}          = 'Skr�t Verze';
    $Lang->{'Last changed by'}        = 'Posledn� zm�na od';
    $Lang->{'Last changed'}           = 'Posledn� zm�na';
    $Lang->{'Change of definition failed! See System Log for details.'} = 'Zm�na definice ne�sp�n�! Viz Syst�mov� Log pro podrobnosti.';
    $Lang->{'Also search in previous versions?'}        = 'Hledat tak� v p�edchoz�ch verz�ch?';
    $Lang->{'Config Items shown'}                       = 'Zobrazen� Konfig. Polo�ky';
    $Lang->{'Config Items available'}                   = 'Dostupn� Konfig. Polo�ky';
    $Lang->{'Search Config Items'}                      = 'Vyhledat Konfig. Polo�ky';
    $Lang->{'Deployment State'}                         = 'Stav Nasazen�';
    $Lang->{'Current Deployment State'}                 = 'Aktu�ln� Stav Nasazen�';
    $Lang->{'Incident State'}                           = 'Stav Incidentu';
    $Lang->{'Current Incident State'}                   = 'Aktu�ln� Stav Incidentu';
    $Lang->{'The name of this config item'}             = 'Jm�no t�to Konfig. Polo�ky';
    $Lang->{'The deployment state of this config item'} = 'Stav Nasazen� t�to Konfig. Polo�ky';
    $Lang->{'The incident state of this config item'}   = 'Stav Incidentu t�to Konfig. Polo�ky';

    $Lang->{'Last Change'}                              = 'Posledn� zm�na';
    $Lang->{'Duplicate'}                                = 'Duplikace';
    $Lang->{'Expired'}                                  = 'Propadnut�';
    $Lang->{'Inactive'}                                 = 'Neaktivn�';
    $Lang->{'Maintenance'}                              = '�dr�ba';
    $Lang->{'Pilot'}                                    = '��d�c�';
    $Lang->{'Planned'}                                  = 'Napl�nov�no';
    $Lang->{'Production'}                               = 'Produk�n�';
    $Lang->{'Repair'}                                   = 'Oprava/Obnoven�';
    $Lang->{'Retired'}                                  = 'Mimo provoz';
    $Lang->{'Review'}                                   = 'P�ehled';
    $Lang->{'Test/QA'}                                  = 'Test/Kontrola kvality';
    $Lang->{'Operational'}                              = 'Opera�n�';
    $Lang->{'Incident'}                                 = 'Incident';
    $Lang->{'Desktop'}                                  = 'Stoln�';
    $Lang->{'Laptop'}                                   = 'Mobiln�';
    $Lang->{'Other'}                                    = 'Jin�';
    $Lang->{'PDA'}                                      = 'PDA';
    $Lang->{'Phone'}                                    = 'Telefon';
    $Lang->{'Server'}                                   = 'Server';
    $Lang->{'Backup Device'}                            = 'Z�lohov�c� Za��zen�';
    $Lang->{'Beamer'}                                   = 'Beamer';
    $Lang->{'Camera'}                                   = 'Kamera';
    $Lang->{'Docking Station'}                          = 'Dok Stanice';
    $Lang->{'Keybord'}                                  = 'Kl�vesnice';
    $Lang->{'Modem'}                                    = 'Modem';
    $Lang->{'Monitor'}                                  = 'Monitor';
    $Lang->{'Mouse'}                                    = 'My�';
    $Lang->{'Other'}                                    = 'Jin�';
    $Lang->{'PCMCIA Card'}                              = 'PCMCIA karta';
    $Lang->{'Printer'}                                  = 'Tisk�rna';
    $Lang->{'Router'}                                   = 'Router';
    $Lang->{'Scanner'}                                  = 'Skener';
    $Lang->{'Security Device'}                          = 'Bezpe�nostn� Za��zen�';
    $Lang->{'Switch'}                                   = 'Switch';
    $Lang->{'USB Device'}                               = 'USB Za��zen�';
    $Lang->{'WLAN Access Point'}                        = 'P��stupov� Bod WLAN';
    $Lang->{'GSM'}                                      = 'GSM';
    $Lang->{'LAN'}                                      = 'LAN';
    $Lang->{'Other'}                                    = 'Jin�';
    $Lang->{'Telco'}                                    = 'Telco';
    $Lang->{'WLAN'}                                     = 'WLAN';
    $Lang->{'Admin Tool'}                               = 'Administra�n� n�stroj';
    $Lang->{'Client Application'}                       = 'U�ivatelsk� Aplikace';
    $Lang->{'Client OS'}                                = 'U�ivatelsk� Opera�n� Syst�m';
    $Lang->{'Embedded'}                                 = 'Vestav�n�';
    $Lang->{'Middleware'}                               = 'St�edn� �rove�';
    $Lang->{'Other'}                                    = 'Jin�';
    $Lang->{'Server Application'}                       = 'Serverov� Aplikace';
    $Lang->{'Server OS'}                                = 'Serverov� Opera�n� Syst�m';
    $Lang->{'User Tool'}                                = 'U�ivatelsk� N�stroj';
    $Lang->{'Concurrent Users'}                         = 'Konkuren�n� U�ivatel�';
    $Lang->{'Demo'}                                     = 'Demo';
    $Lang->{'Developer Licence'}                        = 'Licence V�voj��e';
    $Lang->{'Enterprise Licence'}                       = 'Podnikov� Licence ';
    $Lang->{'Freeware'}                                 = 'Freeware';
    $Lang->{'Open Source'}                              = 'Software s Otev�en�m K�dem';
    $Lang->{'Per Node'}                                 = 'na Uzel';
    $Lang->{'Per Processor'}                            = 'na Procesor';
    $Lang->{'Per Server'}                               = 'na Server';
    $Lang->{'Per User'}                                 = 'na U�ivatele';
    $Lang->{'Single Licence'}                           = 'Jednoduch� Licence';
    $Lang->{'Time Restricted'}                          = '�asov� omezen� Licence';
    $Lang->{'Unlimited'}                                = 'Neomezen�';
    $Lang->{'Volume Licence'}                           = 'Svazkov� Licence';
    $Lang->{'Model'}                                    = 'Model';
    $Lang->{'Serial Number'}                            = 'S�riov� ��slo';
    $Lang->{'Operating System'}                         = 'Opera�n� Syst�m';
    $Lang->{'CPU'}                                      = 'Procesor';
    $Lang->{'Ram'}                                      = 'RAM';
    $Lang->{'Hard Disk'}                                = 'Pevn� Disk';
    $Lang->{'Hard Disk::Capacity'}                      = 'Pevn� Disk::Kapacita';
    $Lang->{'Capacity'}                                 = 'Kapacita';
    $Lang->{'FQDN'}                                     = 'FQDN';
    $Lang->{'Network Adapter'}                          = 'S�ov� Adapter';
    $Lang->{'Network Adapter::IP over DHCP'}            = 'S�ov� Adapter::IP z DHCP';
    $Lang->{'Network Adapter::IP Address'}              = 'S�ov� Adapter::IP adresa';
    $Lang->{'IP over DHCP'}                             = 'IP z DHCP';
    $Lang->{'IP Address'}                               = 'IP Adresa';
    $Lang->{'Graphic Adapter'}                          = 'Grafick� Karta';
    $Lang->{'Other Equipment'}                          = 'Jin� Vybaven�';
    $Lang->{'Warranty Expiration Date'}                 = 'Konec platnosti z�ruky';
    $Lang->{'Install Date'}                             = 'Datum Instalace';
    $Lang->{'Network Address'}                          = 'S�ov� Adresa';
    $Lang->{'Network Address::Subnet Mask'}             = 'S�ov� Adresa::Maska Pods�t�';
    $Lang->{'Network Address::Gateway'}                 = 'S�ov� Adresa::Gateway';
    $Lang->{'Subnet Mask'}                              = 'Maska Pods�t�';
    $Lang->{'Gateway'}                                  = 'Gateway';
    $Lang->{'Licence Type'}                             = 'Druh licence';
    $Lang->{'Licence Key'}                              = 'Licen�n� Kl��';
    $Lang->{'Licence Key::Quantity'}                    = 'Licen�n� Kl��::Mno�stv�';
    $Lang->{'Licence Key::Expiration Date'}             = 'Licen�n� Kl��::Konec Platnosti';
    $Lang->{'Quantity'}                                 = 'Mno�stv�';
    $Lang->{'Expiration Date'}                          = 'Konec Platnosti';
    $Lang->{'Media'}                                    = 'M�dium';
    $Lang->{'Maximum number of one element'}            = 'Max po�et jedn� Polo�ky';
    $Lang->{'Identifier'}                               = 'Identifik�tor';
    $Lang->{'Phone 1'}                                  = 'Telefon 1';
    $Lang->{'Phone 2'}                                  = 'Telefon 2';
    $Lang->{'Address'}                                  = 'Adresa';
    $Lang->{'Building'}                                 = 'Budova';
    $Lang->{'Floor'}                                    = 'podla��';
    $Lang->{'IT Facility'}                              = 'IT P��slu�enstv�';
    $Lang->{'Office'}                                   = 'Kancel��';
    $Lang->{'Outlet'}                                   = 'Fili�lka';
    $Lang->{'Rack'}                                     = 'Rack';
    $Lang->{'Room'}                                     = 'M�stnost';
    $Lang->{'Workplace'}                                = 'Pracovi�t�';

    return 1;
}

1;
