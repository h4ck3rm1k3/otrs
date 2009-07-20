# --
# Kernel/Language/cz_ITSMConfigItem.pm - the czech translation of ITSMConfigItem
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2007-2008 Milen Koutev
# --
# $Id: cz_ITSMConfigItem.pm,v 1.6 2009/07/20 13:11:18 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cz_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Konfig. jednotky CI';
    $Lang->{'Config Item-Area'}       = '';
    $Lang->{'Config Item Management'} = '��zen� konfigura�n�ch jednotek CI';
    $Lang->{'Change Definition'}      = 'Zm�na definice';
    $Lang->{'Class'}                  = 'T��da';
    $Lang->{'Show Versions'}          = 'Uka� Verze';
    $Lang->{'Hide Versions'}          = 'Hide Verze';
    $Lang->{'Last changed by'}        = 'Posledn� zm�na od';
    $Lang->{'Last changed'}           = 'Posledn� zm�na';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Zm�na definic� ne�sp�n�! Viz syst�mov� z�znam o detajlech.';
    $Lang->{'Also search in previous versions?'}        = 'Hledat v p�edchoz�ch verz�ch?';
    $Lang->{'Config Items shown'}                       = 'Ukazan� konfig.jednotky';
    $Lang->{'Config Items available'}                   = 'Dostupn� konfig.jednotky';
    $Lang->{'Search Config Items'}                      = '';
    $Lang->{'Deployment State'}                         = '';
    $Lang->{'Current Deployment State'}                 = '';
    $Lang->{'Incident State'}                           = '';
    $Lang->{'Current Incident State'}                   = '';
    $Lang->{'The name of this config item'}             = '';
    $Lang->{'The deployment state of this config item'} = '';
    $Lang->{'The incident state of this config item'}   = '';
    $Lang->{'Last Change'}                              = 'Posledn� zm�na';
    $Lang->{'Duplicate'}                                = 'Zhotovit kopie';
    $Lang->{'Expired'}                                  = 'Vyprchl�';
    $Lang->{'Inactive'}                                 = 'Neaktivn�';
    $Lang->{'Maintenance'}                              = '�dr�ba';
    $Lang->{'Pilot'}                                    = 'Pilot-v�dce';
    $Lang->{'Planned'}                                  = 'Planov�n';
    $Lang->{'Production'}                               = 'Produk�n�';
    $Lang->{'Repair'}                                   = 'Oprava/Obnoven�';
    $Lang->{'Retired'}                                  = 'Mimo provoz';
    $Lang->{'Review'}                                   = 'Prohl�en';
    $Lang->{'Test/QA'}                                  = 'Test/Kontrola kvality';
    $Lang->{'Operational'}                              = '';
    $Lang->{'Incident'}                                 = '';
    $Lang->{'Desktop'}                                  = 'Stoln�';
    $Lang->{'Laptop'}                                   = 'Mobiln�';
    $Lang->{'Other'}                                    = 'Ostatn�';
    $Lang->{'PDA'}                                      = 'PDA';
    $Lang->{'Phone'}                                    = 'Telefon';
    $Lang->{'Server'}                                   = 'Server';
    $Lang->{'Backup Device'}                            = 'Z�lohov�c� za��zen�';
    $Lang->{'Beamer'}                                   = 'Beamer';
    $Lang->{'Camera'}                                   = 'Komora';
    $Lang->{'Docking Station'}                          = 'Dok stanice';
    $Lang->{'Keybord'}                                  = 'Kl�vesnice';
    $Lang->{'Modem'}                                    = 'Modem';
    $Lang->{'Monitor'}                                  = 'Obrazovka';
    $Lang->{'Mouse'}                                    = 'My�';
    $Lang->{'Other'}                                    = 'Ostatn�';
    $Lang->{'PCMCIA Card'}                              = 'PCMCIA karta';
    $Lang->{'Printer'}                                  = 'Tisk�rna';
    $Lang->{'Router'}                                   = 'Ruetr';
    $Lang->{'Scanner'}                                  = 'Sn�ma�';
    $Lang->{'Security Device'}                          = 'Bezpe�nostn� za��zen�';
    $Lang->{'Switch'}                                   = 'Sp�na�';
    $Lang->{'USB Device'}                               = 'USB za��zen�';
    $Lang->{'WLAN Access Point'}                        = 'WLAN bod p��stupu';
    $Lang->{'GSM'}                                      = 'GSM';
    $Lang->{'LAN'}                                      = 'LAN';
    $Lang->{'Other'}                                    = 'Ostatn�';
    $Lang->{'Telco'}                                    = 'Telco';
    $Lang->{'WLAN'}                                     = 'WLAN';
    $Lang->{'Admin Tool'}                               = 'Administra�n� n�stroj';
    $Lang->{'Client Application'}                       = 'U�ivatelsk� aplikace';
    $Lang->{'Client OS'}                                = 'U�ivatelsk� opera�n� syst�m';
    $Lang->{'Embedded'}                                 = 'Vestav�n�';
    $Lang->{'Middleware'}                               = 'St�edn� �rove�';
    $Lang->{'Other'}                                    = 'Ostatn�';
    $Lang->{'Server Application'}                       = 'Serverov� aplikace';
    $Lang->{'Server OS'}                                = 'Serverov� oper.syst�m';
    $Lang->{'User Tool'}                                = 'U�ivatelsk� n�stroj';
    $Lang->{'Concurrent Users'}                         = 'Konkuren�n� u�ivatel�';
    $Lang->{'Demo'}                                     = 'Demo';
    $Lang->{'Developer Licence'}                        = 'Licence v�voj��e';
    $Lang->{'Enterprise Licence'}                       = 'Podnikatelsk� licence ';
    $Lang->{'Freeware'}                                 = 'Bezplatn�';
    $Lang->{'Open Source'}                              = 'Software s otev�en�m k?dem';
    $Lang->{'Per Node'}                                 = 'Licencov�n� �zlu';
    $Lang->{'Per Processor'}                            = 'Licencov�n� pro procesor';
    $Lang->{'Per Server'}                               = 'Licencov�n� pro server';
    $Lang->{'Per User'}                                 = 'Licencov�n� pro u�ivatele';
    $Lang->{'Single Licence'}                           = 'Jednotliv� licence';
    $Lang->{'Time Restricted'}                          = '�asov� omezen� licence';
    $Lang->{'Unlimited'}                                = 'Neomezen� licence ';
    $Lang->{'Volume Licence'}                           = 'Speci�ln� ob�mov� programy';
    $Lang->{'Model'}                                    = 'Model';
    $Lang->{'Serial Number'}                            = 'S�riov� ��slo';
    $Lang->{'Operating System'}                         = 'Opera�n� syst�m';
    $Lang->{'CPU'}                                      = 'Procesor';
    $Lang->{'Ram'}                                      = 'Pam�';
    $Lang->{'Hard Disk'}                                = 'Tvrd� disk';
    $Lang->{'Hard Disk::Capacity'}                      = 'Tvrd� disk::kapacita';
    $Lang->{'Capacity'}                                 = '?Kapacita';
    $Lang->{'FQDN'}                                     = 'FQDN';
    $Lang->{'Network Adapter'}                          = 'S�ov� adapter';
    $Lang->{'Network Adapter::IP over DHCP'}            = 'S�ov� adapter::IP z DHCP';
    $Lang->{'Network Adapter::IP Address'}              = 'S�ov� adapter::IP adresa';
    $Lang->{'IP over DHCP'}                             = 'IP z DHCP';
    $Lang->{'IP Address'}                               = 'IP adresa';
    $Lang->{'Graphic Adapter'}                          = 'Grafick� karta';
    $Lang->{'Other Equipment'}                          = 'Jin� vybaven�';
    $Lang->{'Warranty Expiration Date'}                 = 'Konec platnosti z�ruky';
    $Lang->{'Install Date'}                             = 'Datum instalace';
    $Lang->{'Network Address'}                          = 'S�ov� adresa';
    $Lang->{'Network Address::Subnet Mask'}             = 'S�ov� adresa:maska subs�t�';
    $Lang->{'Network Address::Gateway'}                 = 'S�ov� adresa::Gate p�echod';
    $Lang->{'Subnet Mask'}                              = 'Maska subs�t�';
    $Lang->{'Gateway'}                                  = 'Gate p�echod';
    $Lang->{'Licence Type'}                             = 'Druh licence';
    $Lang->{'Licence Key'}                              = 'Licen�n� kl��';
    $Lang->{'Licence Key::Quantity'}                    = 'Licen�n� kl��::Mno�stv�';
    $Lang->{'Licence Key::Expiration Date'}             = 'Licen�n� kl��::konec platnosti';
    $Lang->{'Quantity'}                                 = 'Mno�stv�';
    $Lang->{'Expiration Date'}                          = 'Konec platnosti';
    $Lang->{'Media'}                                    = 'M�dium';
    $Lang->{'Maximum number of one element'}            = '';
    $Lang->{'Identifier'}                               = '';
    $Lang->{'Phone 1'}                                  = '';
    $Lang->{'Phone 2'}                                  = '';
    $Lang->{'Address'}                                  = '';
    $Lang->{'Building'}                                 = '';
    $Lang->{'Floor'}                                    = '';
    $Lang->{'IT Facility'}                              = '';
    $Lang->{'Office'}                                   = '';
    $Lang->{'Outlet'}                                   = '';
    $Lang->{'Rack'}                                     = '';
    $Lang->{'Room'}                                     = '';
    $Lang->{'Workplace'}                                = '';

    return 1;
}

1;
