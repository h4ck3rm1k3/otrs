# --
# Kernel/Language/ct_ITSMConfigItem.pm - the catalan translation of ITSMConfigItem
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Sistemes OTIC (ibsalut) - Antonio Linde
# --
# $Id: ct_ITSMConfigItem.pm,v 1.3 2009/05/18 09:56:41 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ct_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Element de configuraci�';
    $Lang->{'Config Item-Area'}       = '�rea-Element de configuraci�';
    $Lang->{'Config Item Management'} = 'Gesti� d\'elements de configuraci�';
    $Lang->{'Change Definition'}      = 'Canviar definici�';
    $Lang->{'Class'}                  = 'Classe';
    $Lang->{'Show Versions'}          = 'Mostrar versions';
    $Lang->{'Hide Versions'}          = 'Ocultar versions';
    $Lang->{'Last changed by'}        = '�ltim canvi per';
    $Lang->{'Last changed'}           = '�ltim canvi';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Canvi de definici� ha fallat! Veure el registre del sistema per a m�s detalls.';
    $Lang->{'Also search in previous versions?'} = 'Cercar tamb� en versions anteriors?';
    $Lang->{'Config Items shown'}                = 'Elements de configuraci� mostrats';
    $Lang->{'Config Items available'}            = 'Elements de configuraci� disponibles';
    $Lang->{'Search Config Items'}               = 'Cercar elements de configuraci�';
    $Lang->{'Deployment State'}                  = 'Estat del desplegament';
    $Lang->{'Current Deployment State'}          = 'Estat actual del desplegament';
    $Lang->{'Incident State'}                    = 'Estat de l\'incident';
    $Lang->{'Current Incident State'}            = 'Estat actual de l\'incident';
    $Lang->{'The name of this config item'}      = 'El nom d\'aquest element de configuraci�';
    $Lang->{'The deployment state of this config item'}
        = 'L\'estat del desplegament d\aquest element de configuraci�';
    $Lang->{'The incident state of this config item'}
        = 'L\'estat de l\'incident d\'aquest element de configuraci�';
    $Lang->{'Last Change'}                   = '�ltim canvi';
    $Lang->{'Duplicate'}                     = 'Duplicar';
    $Lang->{'Expired'}                       = 'Expirat';
    $Lang->{'Inactive'}                      = 'Inactiu';
    $Lang->{'Maintenance'}                   = 'Manteniment';
    $Lang->{'Pilot'}                         = 'Pilot';
    $Lang->{'Planned'}                       = 'Planificat';
    $Lang->{'Production'}                    = 'Producci�';
    $Lang->{'Repair'}                        = 'Reparar';
    $Lang->{'Retired'}                       = 'Retirat';
    $Lang->{'Review'}                        = 'Revisar';
    $Lang->{'Test/QA'}                       = 'Provar/QA';
    $Lang->{'Operational'}                   = 'Operatiu';
    $Lang->{'Incident'}                      = 'Incident';
    $Lang->{'Desktop'}                       = 'Ordinador';
    $Lang->{'Laptop'}                        = 'Port�til';
    $Lang->{'Other'}                         = 'Altres';
    $Lang->{'PDA'}                           = 'PDA';
    $Lang->{'Phone'}                         = 'Tel�fon';
    $Lang->{'Server'}                        = 'Servidor';
    $Lang->{'Backup Device'}                 = 'Dispositiu de c�pies de seguretat';
    $Lang->{'Beamer'}                        = 'Projector';
    $Lang->{'Camera'}                        = 'C�mera';
    $Lang->{'Docking Station'}               = 'Unitat d\'expansi�';
    $Lang->{'Keybord'}                       = 'Teclat';
    $Lang->{'Modem'}                         = 'M�dem';
    $Lang->{'Monitor'}                       = 'Monitor';
    $Lang->{'Mouse'}                         = 'Ratol�';
    $Lang->{'Other'}                         = 'Altres';
    $Lang->{'PCMCIA Card'}                   = 'Targeta PCMCIA';
    $Lang->{'Printer'}                       = 'Impressora';
    $Lang->{'Router'}                        = 'Encaminador';
    $Lang->{'Scanner'}                       = 'Esc�ner';
    $Lang->{'Security Device'}               = 'Dispositiu de seguretat';
    $Lang->{'Switch'}                        = 'Commutador';
    $Lang->{'USB Device'}                    = 'Dispositiu USB';
    $Lang->{'WLAN Access Point'}             = 'Punt d\'acc�s WLAN';
    $Lang->{'GSM'}                           = 'GSM';
    $Lang->{'LAN'}                           = 'LAN';
    $Lang->{'Other'}                         = 'Altres';
    $Lang->{'Telco'}                         = 'Telco';
    $Lang->{'WLAN'}                          = 'WLAN';
    $Lang->{'Admin Tool'}                    = 'Eina d\'administraci�';
    $Lang->{'Client Application'}            = 'Aplicaci� client';
    $Lang->{'Client OS'}                     = 'Sistema Operatiu client';
    $Lang->{'Embedded'}                      = 'Integrat';
    $Lang->{'Middleware'}                    = 'Middleware';
    $Lang->{'Other'}                         = 'Altres';
    $Lang->{'Server Application'}            = 'Aplicaci� servidor';
    $Lang->{'Server OS'}                     = 'Sistema Operatiu servidor';
    $Lang->{'User Tool'}                     = 'Eina d\'usuari';
    $Lang->{'Concurrent Users'}              = 'Usuaris concurrents';
    $Lang->{'Demo'}                          = 'Demo';
    $Lang->{'Developer Licence'}             = 'Llic�ncia de desenvolupament';
    $Lang->{'Enterprise Licence'}            = 'Llic�ncia corporativa';
    $Lang->{'Freeware'}                      = 'Freeware';
    $Lang->{'Open Source'}                   = 'Open Source';
    $Lang->{'Per Node'}                      = 'Per Node';
    $Lang->{'Per Processor'}                 = 'Per Processador';
    $Lang->{'Per Server'}                    = 'Per Servidor';
    $Lang->{'Per User'}                      = 'Per Usuari';
    $Lang->{'Single Licence'}                = 'Llic�ncia Individual';
    $Lang->{'Time Restricted'}               = 'Restricci� de temps';
    $Lang->{'Unlimited'}                     = 'Il�limitat';
    $Lang->{'Volume Licence'}                = 'Llic�ncia per volum';
    $Lang->{'Model'}                         = 'Model';
    $Lang->{'Serial Number'}                 = 'Nombre de s�rie';
    $Lang->{'Operating System'}              = 'Sistema Operatiu';
    $Lang->{'CPU'}                           = 'CPU';
    $Lang->{'Ram'}                           = 'Ram';
    $Lang->{'Hard Disk'}                     = 'Disc dur';
    $Lang->{'Hard Disk::Capacity'}           = 'Disc dur::Capacitat';
    $Lang->{'Capacity'}                      = 'Capacitat';
    $Lang->{'FQDN'}                          = 'FQDN';
    $Lang->{'Network Adapter'}               = 'Adaptador de xarxa';
    $Lang->{'Network Adapter::IP over DHCP'} = 'Adaptador de xarxa::IP per DHCP';
    $Lang->{'Network Adapter::IP Address'}   = 'Adaptador de xarxa::Direcci� IP';
    $Lang->{'IP over DHCP'}                  = 'IP per DHCP';
    $Lang->{'IP Address'}                    = 'Direcci� IP';
    $Lang->{'Graphic Adapter'}               = 'Adaptador gr�fic';
    $Lang->{'Other Equipment'}               = 'Alter equipament';
    $Lang->{'Warranty Expiration Date'}      = 'Data de fi de la garantia';
    $Lang->{'Install Date'}                  = 'Data d\'instal�laci�';
    $Lang->{'Network Address'}               = 'Direcci� de xarxa';
    $Lang->{'Network Address::Subnet Mask'}  = 'Direcci� de xarxa::M�scara de subxarxa';
    $Lang->{'Network Address::Gateway'}      = 'Direcci� de xarxa::Porta d\'enlla�';
    $Lang->{'Subnet Mask'}                   = 'M�scara de subxarxa';
    $Lang->{'Gateway'}                       = 'Porta d\'enlla�';
    $Lang->{'Licence Type'}                  = 'Tipus de llic�ncia';
    $Lang->{'Licence Key'}                   = 'Clau de llic�ncia';
    $Lang->{'Licence Key::Quantity'}         = 'Clau de llic�ncia::Cuantitat';
    $Lang->{'Licence Key::Expiration Date'}  = 'Clau de llic�ncia::Data d\'expiraci�';
    $Lang->{'Quantity'}                      = 'Cuantitat';
    $Lang->{'Expiration Date'}               = 'Data d\'expiraci�';
    $Lang->{'Media'}                         = 'Medi';
    $Lang->{'Maximum number of one element'} = 'Nombre m�xim d\'un element';
    $Lang->{'Identifier'}                    = 'Identificador';

    return 1;
}

1;
