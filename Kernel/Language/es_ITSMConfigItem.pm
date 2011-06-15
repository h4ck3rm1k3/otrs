# --
# Kernel/Language/es_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: es_ITSMConfigItem.pm,v 1.12 2011/06/15 14:02:07 ep Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_ITSMConfigItem;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Address'} = 'Direcci�n';
    $Self->{Translation}->{'Admin Tool'} = 'Herramienta de Administraci�n';
    $Self->{Translation}->{'Backup Device'} = 'Dispositivo de Respaldo';
    $Self->{Translation}->{'Beamer'} = 'Proyector';
    $Self->{Translation}->{'Building'} = 'Edificio';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'ConfigItem nuevo (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'ConfigItem eliminado (ID=%s)';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'Definici�n del ConfigItem modificado (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Implementaci�n del estado modificado (nuevo=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Modificaci�n del estado del incidente (nuevo=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'V�nculo con %s nuevo (Tipo=%s)';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'V�nculo con %s eliminado (Tipo=%s)';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Nombre actualizado (nuevo=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'Atributo %s actualizado desde "%s" hasta "%s"';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Versi�n nueva (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Versi�n %s eliminada';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = 'C�mara';
    $Self->{Translation}->{'Capacity'} = 'Capacidad';
    $Self->{Translation}->{'Change Definition'} = 'Modificar Definici�n';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Actualizaci�n de definiciones fallida! Revisar el Log del Sistema para consultar los detalles';
    $Self->{Translation}->{'Client Application'} = 'Aplicaci�n Cliente';
    $Self->{Translation}->{'Client OS'} = 'SO Cliente';
    $Self->{Translation}->{'Concurrent Users'} = 'Usuarios Concurrentes';
    $Self->{Translation}->{'Config Item-Area'} = '�rea de Elementos de Configuraci�n';
    $Self->{Translation}->{'Config Items available'} = 'Elementos de Configuraci�n disponibles';
    $Self->{Translation}->{'Config Items shown'} = 'Elementos de Configuraci�n mostrados';
    $Self->{Translation}->{'CMDB'} = '';
    $Self->{Translation}->{'Demo'} = 'Demostraci�n';
    $Self->{Translation}->{'Desktop'} = 'Escritorio';
    $Self->{Translation}->{'Developer Licence'} = 'Licencia de Desarrollador';
    $Self->{Translation}->{'Docking Station'} = 'Docking Station';
    $Self->{Translation}->{'Duplicate'} = 'Duplicado';
    $Self->{Translation}->{'Embedded'} = 'Embebido';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '';
    $Self->{Translation}->{'Enterprise Licence'} = 'Licencia Corporativa';
    $Self->{Translation}->{'Expiration Date'} = 'Fecha de Expiraci�n';
    $Self->{Translation}->{'Expired'} = 'Expirado';
    $Self->{Translation}->{'FQDN'} = 'FQDN';
    $Self->{Translation}->{'Floor'} = 'Piso';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Puerta de enlace';
    $Self->{Translation}->{'Graphic Adapter'} = 'Tarjeta Gr�fica';
    $Self->{Translation}->{'Hard Disk'} = 'Disco Duro';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Disco Duro::Capacidad';
    $Self->{Translation}->{'Hide Versions'} = 'Ocultar Versiones';
    $Self->{Translation}->{'IP Address'} = 'Direcci�n IP';
    $Self->{Translation}->{'IP over DHCP'} = 'IP sobre DHCP';
    $Self->{Translation}->{'IT Facility'} = 'Instalaciones de TI';
    $Self->{Translation}->{'Inactive'} = 'Inactivo';
    $Self->{Translation}->{'Install Date'} = 'Fecha de Instalaci�n';
    $Self->{Translation}->{'Keybord'} = 'Teclado';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Computadora port�til';
    $Self->{Translation}->{'Last Change'} = 'Ultima modificaci�n';
    $Self->{Translation}->{'Licence Key'} = 'Clave de Licencia';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Clave de Licencia::Fecha de Expiraci�n';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Clave de Licencia::Cantidad';
    $Self->{Translation}->{'Licence Type'} = 'Tipo de Licencia';
    $Self->{Translation}->{'Maintenance'} = 'Mantenimiento';
    $Self->{Translation}->{'Maximum number of one element'} = 'N�mero m�ximo de un elemento ';
    $Self->{Translation}->{'Media'} = 'Medio';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Model'} = 'Modelo';
    $Self->{Translation}->{'Modem'} = 'M�dem';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Mouse'} = 'Mouse';
    $Self->{Translation}->{'Network Adapter'} = 'Adaptador de Red';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Adaptador de Red::Direcci�n IP';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Adaptador de Red::IP Sobre DHCP';
    $Self->{Translation}->{'Network Address'} = 'Direcci�n de Red';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Direcci�n de Red::Puerta de enlace';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Direcci�n de Red::M�scara de Subred';
    $Self->{Translation}->{'Open Source'} = 'C�digo Abierto';
    $Self->{Translation}->{'Operating System'} = 'Sistema Operativo';
    $Self->{Translation}->{'Operational'} = 'Operacional';
    $Self->{Translation}->{'Other'} = 'Otro';
    $Self->{Translation}->{'Other Equipment'} = 'Otro Equipo';
    $Self->{Translation}->{'Outlet'} = 'Outlet';
    $Self->{Translation}->{'PCMCIA Card'} = 'Tarjeta PCMCIA';
    $Self->{Translation}->{'PDA'} = 'Agenda Personal';
    $Self->{Translation}->{'Per Node'} = 'Por Nodo';
    $Self->{Translation}->{'Per Processor'} = 'Por Procesador';
    $Self->{Translation}->{'Per Server'} = 'Por Servidor';
    $Self->{Translation}->{'Per User'} = 'Por Usuario';
    $Self->{Translation}->{'Phone 1'} = 'Tel�fono 1';
    $Self->{Translation}->{'Phone 2'} = 'Tel�fono 2';
    $Self->{Translation}->{'Pilot'} = 'Piloto';
    $Self->{Translation}->{'Planned'} = 'Planificado';
    $Self->{Translation}->{'Printer'} = 'Impresora';
    $Self->{Translation}->{'Production'} = 'Producci�n';
    $Self->{Translation}->{'Quantity'} = 'Cantidad';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Repair'} = 'Reparaci�n';
    $Self->{Translation}->{'Retired'} = 'Retirado';
    $Self->{Translation}->{'Review'} = 'Revisado';
    $Self->{Translation}->{'Room'} = 'Cuarto';
    $Self->{Translation}->{'Router'} = 'Enrutador';
    $Self->{Translation}->{'Scanner'} = 'Esc�ner';
    $Self->{Translation}->{'Search Config Items'} = 'Buscar Elementos de Configuraci�n';
    $Self->{Translation}->{'Security Device'} = 'Dispositivo de Seguridad';
    $Self->{Translation}->{'Serial Number'} = 'N�mero Serial';
    $Self->{Translation}->{'Server'} = 'Servidor';
    $Self->{Translation}->{'Server Application'} = 'Aplicaci�n Servidor';
    $Self->{Translation}->{'Server OS'} = 'SO Servidor';
    $Self->{Translation}->{'Show Versions'} = 'Mostrar Versiones';
    $Self->{Translation}->{'Single Licence'} = 'Licencia �nica';
    $Self->{Translation}->{'Subnet Mask'} = 'M�scara de Subred';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Conferencia telef�nica';
    $Self->{Translation}->{'Test/QA'} = 'Pruebas';
    $Self->{Translation}->{'The deployment state of this config item'} = 'El estado de implementaci�n de este elemento de configuraci�n';
    $Self->{Translation}->{'The incident state of this config item'} = 'El estado de este elemento de configuraci�n';
    $Self->{Translation}->{'Time Restricted'} = 'Tiempo Restringido';
    $Self->{Translation}->{'USB Device'} = 'Dispositivo USB';
    $Self->{Translation}->{'Unlimited'} = 'Ilimitada';
    $Self->{Translation}->{'User Tool'} = 'Herramienta de Usuario';
    $Self->{Translation}->{'Volume Licence'} = 'Licencia por Volumen';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'Punto de Acceso WLAN';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Fecha de Expiraci�n de la Garant�a';
    $Self->{Translation}->{'Workplace'} = 'Lugar de trabajo';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Gesti�n de Elementos de Configuraci�n';
    $Self->{Translation}->{'Change class definition'} = '';
    $Self->{Translation}->{'Config Item'} = 'Elemento de Configuraci�n';
    $Self->{Translation}->{'Class'} = 'Clase';
    $Self->{Translation}->{'Definition'} = '';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = '';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'El nombre de este elemento de configuraci�n';
    $Self->{Translation}->{'Deployment State'} = 'Estado de la Implementaci�n';
    $Self->{Translation}->{'Incident State'} = 'Estado del Incidente';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '';
    $Self->{Translation}->{'Config Items per page'} = '';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = '';
    $Self->{Translation}->{'Current Incident State'} = 'Estado Actual del Incidente';
    $Self->{Translation}->{'Current Incident State Type'} = '';
    $Self->{Translation}->{'Last Changed'} = '';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = '';
    $Self->{Translation}->{'ConfigItem-Info'} = '';
    $Self->{Translation}->{'Current Deployment State'} = 'Estado Actual de la Implementaci�n';
    $Self->{Translation}->{'Last changed'} = '�ltima modificaci�n';
    $Self->{Translation}->{'Last changed by'} = '�ltima modificaci�n por';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Search-Template'} = '';
    $Self->{Translation}->{'Create New Template'} = '';
    $Self->{Translation}->{'Also search in previous versions?'} = '�Desea buscar en versiones anteriores?';

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
    $Self->{Translation}->{'Resize'} = '';
    $Self->{Translation}->{'Show or hide the content.'} = '';
    $Self->{Translation}->{'Configuration Item Version Details'} = '';
    $Self->{Translation}->{'Property'} = '';

    # SysConfig
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} = 'M�dulo de evento de elementos de configuraci�n que habilita el acceso a la historia en la interfaz del agente.';
    $Self->{Translation}->{'Configuration Item Limit'} = 'L�mite de Elementos de Configuraci�n';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'L�mite por p�gina de Elementos de Configuraci�n';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} = 'Router backend de b�squeda de elementos de configuraci�n de la interfaz del agente.';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} = '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} = 'Define el subobjeto por default de la clase \'ITSMConfigItem\'.';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected'} = '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'M�dulo para verificar el grupo responsable de una clase.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} = 'M�dulo para verificar el grupo responsable de un elemento de configuraci�n.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'M�dulo para generar estad�sticas de los elementos de configuraci�n ITSM.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} = 'Registro del m�dulo de objeto backend para el m�dulo de importaci�n/exportaci�n.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} = 'Par�metros para los estados de implementaci�n en la vista de preferencias de la interfaz del agente.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} = 'Par�metros para las p�ginas (donde se muestran los elementos de configuraci�n)';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de los elementos de configuraci�n en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de b�squeda de elementos de configuraci�n en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de detalle de los elementos de configuraci�n en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} = 'Permisos necesarios para usar la ventana para agregar elementos de configuraci�n en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de edici�n de los elementos de configuraci�n en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de historial de los elementos de configuraci�n en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} = 'Permisos necesarios para usar la ventana de impresi�n de elementos de configuraci�n en la interfaz del agente.';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} = 'Selecciona el m�dulo generador de n�meros de los elementos de configuraci�n. "AutoIncrementar" incrementa el n�mero del elemento de configuraci�n; el SystemID, el ConfigItemClassID y el contador son usados. El formato es "SystemID.ConfigItemClassID.Counter", por ejemplo: 1205000004, 1205000005.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} = 'Muestra un link en el men� para vincular un elemento de configuraci�n con otro objeto, en la vista detallada de dicho elemento de configuraci�n de la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} = 'Muestra un link en el men� para acceder a la historia de un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} = 'Muestra un link en el men� para duplicar un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} = 'Muestra un link en el men� para editar un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} = 'Muestra un link en el men� para regresar en la vista detallada de un elemento de configuraci�n de la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} = 'Muestra un link en el men� para imprimir un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} = 'Muestra la historia de los elementos de configuraci�n (ordenados inversamente) en la interfaz del agente.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} = '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'Presents a link in the menu to go show versions in the configuraton item zoom view of the agent interface.'} = 'Presenta un link en el men� para mostrar las versiones en la vista detallada de un elemento de configuraci�n de la interfaz del agente.';

}

1;
