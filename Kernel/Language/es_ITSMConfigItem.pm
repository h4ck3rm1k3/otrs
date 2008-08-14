# --
# Kernel/Language/es_ITSMConfigItem.pm - the spanish translation of ITSMConfigItem
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Aquiles Cohen
# --
# $Id: es_ITSMConfigItem.pm,v 1.3 2008/08/14 11:50:28 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::es_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Elemento de Configuraci�n';
    $Lang->{'Config Item-Area'}       = 'Area de Configuraci�n de Elementos';
    $Lang->{'Config Item Management'} = 'Administraci�n de Elementos de Configuraci�n';
    $Lang->{'Change Definition'}      = 'Cambiar Definici�n';
    $Lang->{'Class'}                  = 'Clase';
    $Lang->{'Show Versions'}          = 'Mostrar Versiones';
    $Lang->{'Hide Versions'}          = 'Ocultar Versiones';
    $Lang->{'Last changed by'}        = 'Ultima actualizaci�n por';
    $Lang->{'Last changed'}           = 'Ultima actualizaci�n';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Actualizaci�n de definiciones fallida! Revisar el Log del Sistema para consultar detalles';
    $Lang->{'Also search in previous versions?'} = 'buscar en versiones anteriores?';
    $Lang->{'Config Items shown'}                = 'Elementos de configuraci�n mostrados';
    $Lang->{'Config Items available'}            = 'Elementos de configuraci�n disponibles';
    $Lang->{'Search Config Items'}               = 'Buscar elementos de configuraci�n';
    $Lang->{'Deployment State'}                  = 'Estado de implementaci�n';
    $Lang->{'Current Deployment State'}          = 'Estado actual de implementaci�n';
    $Lang->{'Incident State'}                    = 'Estado del Incidente';
    $Lang->{'Current Incident State'}            = 'Estado Actual del Incidente';
    $Lang->{'The name of this config item'}      = 'El nombre de este elemento de configuraci�n';
    $Lang->{'The deployment state of this config item'}
        = 'El estado de implementaci�n de este elemento de configuraci�n';
    $Lang->{'The incident state of this config item'}
        = 'El estado de este elemento de configuraci�n';
    $Lang->{'Last Change'}                   = 'Ultima actualizaci�n';
    $Lang->{'Duplicate'}                     = 'Duplicado';
    $Lang->{'Expired'}                       = 'Expirado';
    $Lang->{'Inactive'}                      = 'Inactivo';
    $Lang->{'Maintenance'}                   = 'Mantenimiento';
    $Lang->{'Pilot'}                         = 'Piloto';
    $Lang->{'Planned'}                       = 'Planificado';
    $Lang->{'Production'}                    = 'Producci�n';
    $Lang->{'Repair'}                        = 'Reparaci�n';
    $Lang->{'Retired'}                       = 'Retirado';
    $Lang->{'Review'}                        = 'Revisado';
    $Lang->{'Test/QA'}                       = 'Pruebas';
    $Lang->{'Operational'}                   = 'Operacional';
    $Lang->{'Incident'}                      = 'Incidente';
    $Lang->{'Desktop'}                       = '';
    $Lang->{'Laptop'}                        = 'Portatil';
    $Lang->{'Other'}                         = 'Otro';
    $Lang->{'PDA'}                           = 'Agenda Personal';
    $Lang->{'Phone'}                         = 'Tel�fono';
    $Lang->{'Server'}                        = 'Servidor';
    $Lang->{'Backup Device'}                 = 'Dispositivo de Copias';
    $Lang->{'Beamer'}                        = 'Video Beam';
    $Lang->{'Camera'}                        = 'C�mara';
    $Lang->{'Docking Station'}               = '';
    $Lang->{'Keybord'}                       = 'Teclado';
    $Lang->{'Modem'}                         = '';
    $Lang->{'Monitor'}                       = '';
    $Lang->{'Mouse'}                         = '';
    $Lang->{'Other'}                         = 'Otro';
    $Lang->{'PCMCIA Card'}                   = 'Tarjeta PCMCIA';
    $Lang->{'Printer'}                       = 'Impresora';
    $Lang->{'Router'}                        = 'Enrutador';
    $Lang->{'Scanner'}                       = 'Escaner';
    $Lang->{'Security Device'}               = 'Dispositivo de seguridad';
    $Lang->{'Switch'}                        = '';
    $Lang->{'USB Device'}                    = 'Dispositivo USB';
    $Lang->{'WLAN Access Point'}             = '';
    $Lang->{'GSM'}                           = '';
    $Lang->{'LAN'}                           = '';
    $Lang->{'Other'}                         = 'Otro';
    $Lang->{'Telco'}                         = '';
    $Lang->{'WLAN'}                          = '';
    $Lang->{'Admin Tool'}                    = 'Herramienta de Administrador';
    $Lang->{'Client Application'}            = 'Aplicaci�n Cliente';
    $Lang->{'Client OS'}                     = 'SO Cliente';
    $Lang->{'Embedded'}                      = 'Embebido';
    $Lang->{'Middleware'}                    = '';
    $Lang->{'Other'}                         = 'Otro';
    $Lang->{'Server Application'}            = 'Aplicaci�n Servidor';
    $Lang->{'Server OS'}                     = 'SO Servidor';
    $Lang->{'User Tool'}                     = 'Herramienta de Usuario';
    $Lang->{'Concurrent Users'}              = 'Usuarios concurrentes';
    $Lang->{'Demo'}                          = 'Demostraci�n';
    $Lang->{'Developer Licence'}             = 'Licencia de Desarrollador';
    $Lang->{'Enterprise Licence'}            = 'Licencia Corporativa';
    $Lang->{'Freeware'}                      = '';
    $Lang->{'Open Source'}                   = '';
    $Lang->{'Per Node'}                      = 'Por Nodo';
    $Lang->{'Per Processor'}                 = 'Por Procesador';
    $Lang->{'Per Server'}                    = 'Por Servidor';
    $Lang->{'Per User'}                      = 'Por Usuario';
    $Lang->{'Single Licence'}                = '';
    $Lang->{'Time Restricted'}               = 'Tiempo restringida';
    $Lang->{'Unlimited'}                     = 'Ilimitada';
    $Lang->{'Volume Licence'}                = 'Licencia por Volumen';
    $Lang->{'Model'}                         = 'Modelo';
    $Lang->{'Serial Number'}                 = 'Numero Serial';
    $Lang->{'Operating System'}              = 'Sistema Operativo';
    $Lang->{'CPU'}                           = '';
    $Lang->{'Ram'}                           = '';
    $Lang->{'Hard Disk'}                     = 'Disco Duro';
    $Lang->{'Hard Disk::Capacity'}           = 'Disco Duro::Capacidad';
    $Lang->{'Capacity'}                      = 'Capacidad';
    $Lang->{'FQDN'}                          = '';
    $Lang->{'Network Adapter'}               = 'Adaptador de Red';
    $Lang->{'Network Adapter::IP over DHCP'} = 'Adaptador de Red::IP Sobre DHCP';
    $Lang->{'Network Adapter::IP Address'}   = 'Adaptador de Red::Direcci�n IP';
    $Lang->{'IP over DHCP'}                  = 'IP sobre DHCP';
    $Lang->{'IP Address'}                    = 'Direcci�n IP';
    $Lang->{'Graphic Adapter'}               = 'Tarjeta Gr�fica';
    $Lang->{'Other Equipment'}               = 'Otro equipo';
    $Lang->{'Warranty Expiration Date'}      = 'Fecha de Expiraci�n de la Garant�a';
    $Lang->{'Install Date'}                  = 'Fecha de Instalaci�n';
    $Lang->{'Network Address'}               = 'Direcci�n de Red';
    $Lang->{'Network Address::Subnet Mask'}  = 'Direcci�n de Red::Mascara de Subred';
    $Lang->{'Network Address::Gateway'}      = 'Direcci�n de Red::Puerta de enlace';
    $Lang->{'Subnet Mask'}                   = 'Mascara de Subred';
    $Lang->{'Gateway'}                       = 'Puerta de enlace';
    $Lang->{'Licence Type'}                  = 'Tipo de Licencia';
    $Lang->{'Licence Key'}                   = 'Llave de Licencia';
    $Lang->{'Licence Key::Quantity'}         = 'Llave de Licencia::Cantidad';
    $Lang->{'Licence Key::Expiration Date'}  = 'Llave de Licencia::Fecha de Expiraci�n';
    $Lang->{'Quantity'}                      = 'Cantidad';
    $Lang->{'Expiration Date'}               = 'Fecha de Expiraci�n';
    $Lang->{'Media'}                         = 'Medio';
    $Lang->{'Maximum number of one element'} = 'Maximo numero de un elemento ';
    $Lang->{'Identifier'}                    = 'Identificador';

    return 1;
}

1;
