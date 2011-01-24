# --
# Kernel/Language/de_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: de_ITSMConfigItem.pm,v 1.11 2011/01/24 20:23:20 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMConfigItem;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Address'} = 'Adresse';
    $Self->{Translation}->{'Admin Tool'} = 'Admin Tool';
    $Self->{Translation}->{'Backup Device'} = 'Backup Ger�t';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Building'} = 'Geb�ude';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'Neues ConfigItem (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'ConfigItem (ID=%s) gel�scht';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'Definition des ConfigItems aktualisiert (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Verwendungsstatus ge�ndert (neu=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Vorfallsstatus ge�ndert (neu=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'Link auf %s (Typ=%s) hinzugef�gt';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'Link auf %s (Typ=%s) gel�scht';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Name ge�ndert (neu=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'Attribut %s von "%s" auf "%s" ge�ndert';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Neue Version erzeugt (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Version %s gel�scht';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Capacity'} = 'Kapazit�t';
    $Self->{Translation}->{'Change Definition'} = 'Definition �ndern';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = '�ndern der Definition fehlgeschlagen! Im System Log finden Sie weitere Informationen.';
    $Self->{Translation}->{'Client Application'} = 'Client Anwendung';
    $Self->{Translation}->{'Client OS'} = 'Client Betriebssystem';
    $Self->{Translation}->{'Concurrent Users'} = 'Gleichzeitige User';
    $Self->{Translation}->{'Config Item-Area'} = 'Config Item-Bereich';
    $Self->{Translation}->{'Config Items available'} = 'Config Items verf�gbar';
    $Self->{Translation}->{'Config Items shown'} = 'Config Items angezeigt';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'Developer Licence'} = 'Entwickler Lizenz';
    $Self->{Translation}->{'Docking Station'} = 'Docking Station';
    $Self->{Translation}->{'Duplicate'} = 'Duplizieren';
    $Self->{Translation}->{'Embedded'} = 'Embedded';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Leere Felder belassen den aktuellen Wert';
    $Self->{Translation}->{'Enterprise Licence'} = 'Enterprise Lizenz';
    $Self->{Translation}->{'Expiration Date'} = 'Ablaufdatum';
    $Self->{Translation}->{'Expired'} = 'Abgelaufen';
    $Self->{Translation}->{'FQDN'} = 'FQDN';
    $Self->{Translation}->{'Floor'} = 'Etage';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Gateway';
    $Self->{Translation}->{'Graphic Adapter'} = 'Grafik Adapter';
    $Self->{Translation}->{'Hard Disk'} = 'Festplatte';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Festplatte::Kapazit�t';
    $Self->{Translation}->{'Hide Versions'} = 'Versionen ausblenden';
    $Self->{Translation}->{'IP Address'} = 'IP Addresse';
    $Self->{Translation}->{'IP over DHCP'} = 'IP �ber DHCP';
    $Self->{Translation}->{'IT Facility'} = 'IT Einrichtung';
    $Self->{Translation}->{'Inactive'} = 'Inaktiv';
    $Self->{Translation}->{'Incident'} = 'Vorfall';
    $Self->{Translation}->{'Install Date'} = 'Installationsdatum';
    $Self->{Translation}->{'Keybord'} = 'Tastatur';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Laptop';
    $Self->{Translation}->{'Last Change'} = 'Letzte �nderung';
    $Self->{Translation}->{'Licence Key'} = 'Lizenzschl�ssel';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Lizenzschl�ssel::Ablaufdatum';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Lizenzschl�ssel::Menge';
    $Self->{Translation}->{'Licence Type'} = 'Lizenztyp';
    $Self->{Translation}->{'Maintenance'} = 'In Wartung';
    $Self->{Translation}->{'Maximum number of one element'} = 'Maximale Anzahl eines Elements';
    $Self->{Translation}->{'Media'} = 'Medium';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Model'} = 'Model';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Mouse'} = 'Maus';
    $Self->{Translation}->{'Network Adapter'} = 'Netzwerk Adapter';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Netzwerk Adapter::IP Addresse';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Netzwerk Adapter::IP �ber DHCP';
    $Self->{Translation}->{'Network Address'} = 'Netzwerk Addresse';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Netzwerk Addresse::Gateway';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Netzwerk Addresse::Subnetz Maske';
    $Self->{Translation}->{'Open Source'} = 'Open Source';
    $Self->{Translation}->{'Operating System'} = 'Betriebssystem';
    $Self->{Translation}->{'Operational'} = 'Operativ';
    $Self->{Translation}->{'Other'} = 'Sonstiges';
    $Self->{Translation}->{'Other Equipment'} = 'Sonstige Ausstattung';
    $Self->{Translation}->{'Outlet'} = 'Anschlussdose';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA Karte';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'Pro Knoten';
    $Self->{Translation}->{'Per Processor'} = 'Pro Prozessor';
    $Self->{Translation}->{'Per Server'} = 'Pro Server';
    $Self->{Translation}->{'Per User'} = 'Pro Benutzer';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'Pilot'} = 'Pilotbetrieb';
    $Self->{Translation}->{'Planned'} = 'Geplant';
    $Self->{Translation}->{'Printer'} = 'Drucker';
    $Self->{Translation}->{'Production'} = 'Produktiv';
    $Self->{Translation}->{'Quantity'} = 'Menge';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'Arbeitsspeicher';
    $Self->{Translation}->{'Repair'} = 'In Reparatur';
    $Self->{Translation}->{'Retired'} = 'Au�er Dienst';
    $Self->{Translation}->{'Review'} = 'Unter Review';
    $Self->{Translation}->{'Room'} = 'Raum';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Search Config Items'} = 'Config Item Suche';
    $Self->{Translation}->{'Security Device'} = 'Sichertheitsger�t';
    $Self->{Translation}->{'Serial Number'} = 'Seriennummer';
    $Self->{Translation}->{'Server'} = 'Server';
    $Self->{Translation}->{'Server Application'} = 'Server Anwendung';
    $Self->{Translation}->{'Server OS'} = 'Server Betriebssystem';
    $Self->{Translation}->{'Show Versions'} = 'Versionen einblenden';
    $Self->{Translation}->{'Single Licence'} = 'Einzellizenz';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnetz Maske';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Telko';
    $Self->{Translation}->{'Test/QA'} = 'Test/QS';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Der Verwendungsstatus dieses Config Items';
    $Self->{Translation}->{'The incident state of this config item'} = 'Der Vorfallsstatus dieses Config Items';
    $Self->{Translation}->{'Time Restricted'} = 'Zeitlich begrenzt';
    $Self->{Translation}->{'USB Device'} = 'USB Ger�t';
    $Self->{Translation}->{'Unlimited'} = 'Unlimitiert';
    $Self->{Translation}->{'User Tool'} = 'User Tool';
    $Self->{Translation}->{'Volume Licence'} = 'Volumen Lizenz';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN Access Point';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Garantie Ablaufdatum';
    $Self->{Translation}->{'Workplace'} = 'Arbeitsplatz';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Config Item Verwaltung';
    $Self->{Translation}->{'Change class definition'} = 'Klassen-Definition �ndern';
    $Self->{Translation}->{'Config Item'} = 'Config Item';
    $Self->{Translation}->{'Class'} = 'Klasse';
    $Self->{Translation}->{'Definition'} = 'Definition';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = 'Filter f�r Klassen';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'W�hlen Sie eine Klasse aus der Liste aus um ein neues Config Item zu erstellen.';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Der Name dieses Config Items';
    $Self->{Translation}->{'Deployment State'} = 'Verwendungsstatus';
    $Self->{Translation}->{'Incident State'} = 'Vorfallsstatus';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Kontext-Eintstellungen';
    $Self->{Translation}->{'Config Items per page'} = 'Config Items pro Seite';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = 'Verwendungsstatus-Typ';
    $Self->{Translation}->{'Current Incident State'} = 'Aktueller Vorfallsstatus';
    $Self->{Translation}->{'Current Incident State Type'} = 'Aktueller Vorfallsstatus-Typ';
    $Self->{Translation}->{'Last Changed'} = 'Zuletzt ge�ndert';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = 'ConfigItem';
    $Self->{Translation}->{'ConfigItem-Info'} = 'ConfigItem-Info';
    $Self->{Translation}->{'Current Deployment State'} = 'Aktueller Verwendungsstatus';
    $Self->{Translation}->{'Last changed'} = 'Zuletzt ge�ndert';
    $Self->{Translation}->{'Last changed by'} = 'Zuletzt ge�ndert von';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Also search in previous versions?'} = 'Auch in fr�heren Versionen suchen?';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = 'Erstellzeit';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Configuration Item';
    $Self->{Translation}->{'Show one version'} = 'Zeige nur eine Version';
    $Self->{Translation}->{'Show all versions'} = 'Zeige alle Versionen';
    $Self->{Translation}->{'Version Incident State'} = 'Versions-Vorfallstatus';
    $Self->{Translation}->{'Version Number'} = 'Versionsnummer';
    $Self->{Translation}->{'Created By'} = 'Erstellt von';
    $Self->{Translation}->{'Changed On'} = 'Ge�ndert am';
    $Self->{Translation}->{'Show or hide the content.'} = 'Inhalt anzeigen oder verbergen.';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Configuration Item Versions-Details';
    $Self->{Translation}->{'Property'} = 'Eigenschaft';

    # SysConfig
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = '';
    $Self->{Translation}->{'Configuration Item limit per page'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} = '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} = '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} = 'Definiert das Standard-Subobject der Klasse';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected'} = '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} = '';
    $Self->{Translation}->{'Module to genetare ITSM config item statistics.'} = '';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} = 'Objekt-Backend Modul Registration des Import/Export Moduls.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} = '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} = '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} = '';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} = '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
