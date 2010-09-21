# --
# Kernel/Language/es_ITSMConfigItem.pm - the spanish translation of ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Aquiles Cohen
# --
# $Id: es_ITSMConfigItem.pm,v 1.8 2010/09/21 17:09:44 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.8 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Elemento de Configuraci�n';
    $Lang->{'Config Item-Area'}       = '�rea de Elementos de Configuraci�n';
    $Lang->{'Config Item Management'} = 'Gesti�n de Elementos de Configuraci�n';
    $Lang->{'Change Definition'}      = 'Modificar Definici�n';
    $Lang->{'Class'}                  = 'Clase';
    $Lang->{'Show Versions'}          = 'Mostrar Versiones';
    $Lang->{'Hide Versions'}          = 'Ocultar Versiones';
    $Lang->{'Last changed by'}        = '�ltima modificaci�n por';
    $Lang->{'Last changed'}           = '�ltima modificaci�n';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Actualizaci�n de definiciones fallida! Revisar el Log del Sistema para consultar los detalles';
    $Lang->{'Also search in previous versions?'} = '�Desea buscar en versiones anteriores?';
    $Lang->{'Config Items shown'}                = 'Elementos de Configuraci�n mostrados';
    $Lang->{'Config Items available'}            = 'Elementos de Configuraci�n disponibles';
    $Lang->{'Search Config Items'}               = 'Buscar Elementos de Configuraci�n';
    $Lang->{'Deployment State'}                  = 'Estado de la Implementaci�n';
    $Lang->{'Current Deployment State'}          = 'Estado Actual de la Implementaci�n';
    $Lang->{'Incident State'}                    = 'Estado del Incidente';
    $Lang->{'Current Incident State'}            = 'Estado Actual del Incidente';
    $Lang->{'The name of this config item'}      = 'El nombre de este elemento de configuraci�n';
    $Lang->{'The deployment state of this config item'}
        = 'El estado de implementaci�n de este elemento de configuraci�n';
    $Lang->{'The incident state of this config item'}
        = 'El estado de este elemento de configuraci�n';
    $Lang->{'Last Change'}                   = 'Ultima modificaci�n';
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
    $Lang->{'Desktop'}                       = 'Escritorio';
    $Lang->{'Laptop'}                        = 'Computadora port�til';
    $Lang->{'Other'}                         = 'Otro';
    $Lang->{'PDA'}                           = 'Agenda Personal';
    $Lang->{'Phone'}                         = 'Tel�fono';
    $Lang->{'Server'}                        = 'Servidor';
    $Lang->{'Backup Device'}                 = 'Dispositivo de Respaldo';
    $Lang->{'Beamer'}                        = 'Proyector';
    $Lang->{'Camera'}                        = 'C�mara';
    $Lang->{'Docking Station'}               = 'Docking Station';
    $Lang->{'Keybord'}                       = 'Teclado';
    $Lang->{'Modem'}                         = 'M�dem';
    $Lang->{'Monitor'}                       = 'Monitor';
    $Lang->{'Mouse'}                         = 'Mouse';
    $Lang->{'PCMCIA Card'}                   = 'Tarjeta PCMCIA';
    $Lang->{'Printer'}                       = 'Impresora';
    $Lang->{'Router'}                        = 'Enrutador';
    $Lang->{'Scanner'}                       = 'Esc�ner';
    $Lang->{'Security Device'}               = 'Dispositivo de Seguridad';
    $Lang->{'Switch'}                        = 'Switch';
    $Lang->{'USB Device'}                    = 'Dispositivo USB';
    $Lang->{'WLAN Access Point'}             = 'Punto de Acceso WLAN';
    $Lang->{'GSM'}                           = 'GSM';
    $Lang->{'LAN'}                           = 'LAN';
    $Lang->{'Telco'}                         = 'Conferencia telef�nica';
    $Lang->{'WLAN'}                          = 'WLAN';
    $Lang->{'Admin Tool'}                    = 'Herramienta de Administraci�n';
    $Lang->{'Client Application'}            = 'Aplicaci�n Cliente';
    $Lang->{'Client OS'}                     = 'SO Cliente';
    $Lang->{'Embedded'}                      = 'Embebido';
    $Lang->{'Middleware'}                    = 'Middleware';
    $Lang->{'Server Application'}            = 'Aplicaci�n Servidor';
    $Lang->{'Server OS'}                     = 'SO Servidor';
    $Lang->{'User Tool'}                     = 'Herramienta de Usuario';
    $Lang->{'Concurrent Users'}              = 'Usuarios Concurrentes';
    $Lang->{'Demo'}                          = 'Demostraci�n';
    $Lang->{'Developer Licence'}             = 'Licencia de Desarrollador';
    $Lang->{'Enterprise Licence'}            = 'Licencia Corporativa';
    $Lang->{'Freeware'}                      = 'Freeware';
    $Lang->{'Open Source'}                   = 'C�digo Abierto';
    $Lang->{'Per Node'}                      = 'Por Nodo';
    $Lang->{'Per Processor'}                 = 'Por Procesador';
    $Lang->{'Per Server'}                    = 'Por Servidor';
    $Lang->{'Per User'}                      = 'Por Usuario';
    $Lang->{'Single Licence'}                = 'Licencia �nica';
    $Lang->{'Time Restricted'}               = 'Tiempo Restringido';
    $Lang->{'Unlimited'}                     = 'Ilimitada';
    $Lang->{'Volume Licence'}                = 'Licencia por Volumen';
    $Lang->{'Model'}                         = 'Modelo';
    $Lang->{'Serial Number'}                 = 'N�mero Serial';
    $Lang->{'Operating System'}              = 'Sistema Operativo';
    $Lang->{'CPU'}                           = 'CPU';
    $Lang->{'Ram'}                           = 'RAM';
    $Lang->{'Hard Disk'}                     = 'Disco Duro';
    $Lang->{'Hard Disk::Capacity'}           = 'Disco Duro::Capacidad';
    $Lang->{'Capacity'}                      = 'Capacidad';
    $Lang->{'FQDN'}                          = 'FQDN';
    $Lang->{'Network Adapter'}               = 'Adaptador de Red';
    $Lang->{'Network Adapter::IP over DHCP'} = 'Adaptador de Red::IP Sobre DHCP';
    $Lang->{'Network Adapter::IP Address'}   = 'Adaptador de Red::Direcci�n IP';
    $Lang->{'IP over DHCP'}                  = 'IP sobre DHCP';
    $Lang->{'IP Address'}                    = 'Direcci�n IP';
    $Lang->{'Graphic Adapter'}               = 'Tarjeta Gr�fica';
    $Lang->{'Other Equipment'}               = 'Otro Equipo';
    $Lang->{'Warranty Expiration Date'}      = 'Fecha de Expiraci�n de la Garant�a';
    $Lang->{'Install Date'}                  = 'Fecha de Instalaci�n';
    $Lang->{'Network Address'}               = 'Direcci�n de Red';
    $Lang->{'Network Address::Subnet Mask'}  = 'Direcci�n de Red::M�scara de Subred';
    $Lang->{'Network Address::Gateway'}      = 'Direcci�n de Red::Puerta de enlace';
    $Lang->{'Subnet Mask'}                   = 'M�scara de Subred';
    $Lang->{'Gateway'}                       = 'Puerta de enlace';
    $Lang->{'Licence Type'}                  = 'Tipo de Licencia';
    $Lang->{'Licence Key'}                   = 'Clave de Licencia';
    $Lang->{'Licence Key::Quantity'}         = 'Clave de Licencia::Cantidad';
    $Lang->{'Licence Key::Expiration Date'}  = 'Clave de Licencia::Fecha de Expiraci�n';
    $Lang->{'Quantity'}                      = 'Cantidad';
    $Lang->{'Expiration Date'}               = 'Fecha de Expiraci�n';
    $Lang->{'Media'}                         = 'Medio';
    $Lang->{'Maximum number of one element'} = 'N�mero m�ximo de un elemento ';
    $Lang->{'Identifier'}                    = 'Identificador';
    $Lang->{'Phone 1'}                       = 'Tel�fono 1';
    $Lang->{'Phone 2'}                       = 'Tel�fono 2';
    $Lang->{'Address'}                       = 'Direcci�n';
    $Lang->{'Building'}                      = 'Edificio';
    $Lang->{'Floor'}                         = 'Piso';
    $Lang->{'IT Facility'}                   = 'Instalaciones de TI';
    $Lang->{'Office'}                        = 'Oficina';
    $Lang->{'Outlet'}                        = 'Outlet';
    $Lang->{'Rack'}                          = 'Rack';
    $Lang->{'Room'}                          = 'Cuarto';
    $Lang->{'Workplace'}                     = 'Lugar de trabajo';
    $Lang->{'CIHistory::ConfigItemCreate'}   = 'ConfigItem nuevo (ID=%s)';
    $Lang->{'CIHistory::VersionCreate'}      = 'Versi�n nueva (ID=%s)';
    $Lang->{'CIHistory::DeploymentStateUpdate'} = 'Implementaci�n del estado modificado (nuevo=%s; alt=%s)';
    $Lang->{'CIHistory::IncidentStateUpdate'} = 'Modificaci�n del estado del incidente (nuevo=%s; alt=%s)';
    $Lang->{'CIHistory::ConfigItemDelete'} = 'ConfigItem eliminado (ID=%s)';
    $Lang->{'CIHistory::LinkAdd'}          = 'V�nculo con %s nuevo (Tipo=%s)';
    $Lang->{'CIHistory::LinkDelete'}       = 'V�nculo con %s eliminado (Tipo=%s)';
    $Lang->{'CIHistory::DefinitionUpdate'} = 'Definici�n del ConfigItem modificado (ID=%s)';
    $Lang->{'CIHistory::NameUpdate'}       = 'Nombre actualizado (nuevo=%s; alt=%s)';
    $Lang->{'CIHistory::ValueUpdate'}      = 'Atributo %s actualizado desde "%s" hasta "%s"';
    $Lang->{'CIHistory::VersionDelete'}    = 'Versi�n %s eliminada';
    $Lang->{'Frontend module registration for the agent interface.'} = 'Registro de m�dulo frontend para la interfaz del agente.';
    $Lang->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} = 'Muestra un link en el men� para regresar en la vista detallada de un elemento de configuraci�n de la interfaz del agente.';
    $Lang->{'Presents a link in the menu to go show versions in the configuraton item zoom view of the agent interface.'} = 'Presenta un link en el men� para mostrar las versiones en la vista detallada de un elemento de configuraci�n de la interfaz del agente.';
    $Lang->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} = 'Muestra un link en el men� para acceder a la historia de un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Lang->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} = 'Muestra un link en el men� para editar un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Lang->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} = 'Muestra un link en el men� para imprimir un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Lang->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} = 'Muestra un link en el men� para vincular un elemento de configuraci�n con otro objeto, en la vista detallada de dicho elemento de configuraci�n de la interfaz del agente.';
    $Lang->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} = 'Muestra un link en el men� para duplicar un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Lang->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'}
      = 'Selecciona el m�dulo generador de n�meros de los elementos de configuraci�n. "AutoIncrementar" incrementa el n�mero del elemento de configuraci�n; el SystemID, el ConfigItemClassID y el contador son usados. El formato es "SystemID.ConfigItemClassID.Counter", por ejemplo: 1205000004, 1205000005.';
    $Lang->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} = 'Define el subobjeto por default de la clase \'ITSMConfigItem\'.';
    $Lang->{'Module to genetare ITSM config item statistics.'} = 'M�dulo para generar estad�sticas de los elementos de configuraci�n ITSM.';
    $Lang->{'Object backend module registration for the import/export module.'} = 'Registro del m�dulo de objeto backend para el m�dulo de importaci�n/exportaci�n.';
    $Lang->{'Config item event module that enables logging to history in the agent interface.'} = 'M�dulo de evento de elementos de configuraci�n que habilita el acceso a la historia en la interfaz del agente.';
    $Lang->{'Shows the config item history (reverse ordered) in the agent interface.'} = 'Muestra la historia de los elementos de configuraci�n (ordenados inversamente) en la interfaz del agente.';
    $Lang->{'Parameters for the deployment states in the preferences view of the agent interface.'} = 'Par�metros para los estados de implementaci�n en la vista de preferencias de la interfaz del agente.';
    $Lang->{'Module to check the group responsible for a class.'} = 'M�dulo para verificar el grupo responsable de una clase.';
    $Lang->{'Module to check the group responsible for a configuration item.'} = 'M�dulo para verificar el grupo responsable de un elemento de configuraci�n.';
    $Lang->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de los elementos de configuraci�n en la interfaz del agente.';
    $Lang->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de edici�n de los elementos de configuraci�n en la interfaz del agente.';
    $Lang->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} = 'Permisos necesarios para usar la ventana para agregar elementos de configuraci�n en la interfaz del agente.';
    $Lang->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de historial de los elementos de configuraci�n en la interfaz del agente.';
    $Lang->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de impresi�n de elementos de configuraci�n en la interfaz del agente.';
    $Lang->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de detalle de los elementos de configuraci�n en la interfaz del agente.';
    $Lang->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de b�squeda de elementos de configuraci�n en la interfaz del agente.';
    $Lang->{'Configuration item search backend router of the agent interface.'} = 'Router backend de b�squeda de elementos de configuraci�n de la interfaz del agente.';
    $Lang->{'Parameters for the pages (in which the configuration items are shown).'} = 'Par�metros para las p�ginas (donde se muestran los elementos de configuraci�n)';
    $Lang->{'Configuration Item Limit'} = 'L�mite de Elementos de Configuraci�n';
    $Lang->{'Configuration Item limit per page'} = 'L�mite por p�gina de Elementos de Configuraci�n';

    return 1;
}

1;
