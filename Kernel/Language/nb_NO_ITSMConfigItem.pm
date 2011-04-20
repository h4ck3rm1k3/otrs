# --
# Kernel/Language/nb_NO_ITSMConfigItem.pm - the Norwegian translation of ITSMConfigItem
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# Copyright (C) 2011 Eirik Wulff <eirik at epledoktor.no>
# --
# $Id: nb_NO_ITSMConfigItem.pm,v 1.1 2011/04/20 10:47:49 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nb_NO_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Admin-verkt�y'} = '';
    $Self->{Translation}->{'Backup Device'} = 'Backup-enhet';
    $Self->{Translation}->{'Beamer'} = '';
    $Self->{Translation}->{'Building'} = 'Bygning';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'Ny Konfigurasjonsenhet (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'Konfigurasjonsenhet (ID=%s) slettet';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'Konfigurasjonsenhetens definisjon ble oppdatert (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Produksjonssettingstilstand endret (ny=%s; gml=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Hendelsestilstand oppdatert (ny=%s; gml=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'Kobling til %s (type=%s) lagt til';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'Kobling til %s (type=%s) lagt til';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Navn oppdatert (nytt=%s; gml=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'Attributt %s oppdatert fra "%s" til "%s"';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Ny versjon (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Versjon %s slettet';
    $Self->{Translation}->{'CPU'} = 'Prosessor';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Capacity'} = 'Kapasitet';
    $Self->{Translation}->{'Change Definition'} = 'Endre definisjon';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Endring feilet! Se systemloggen for detaljer.';
    $Self->{Translation}->{'Client Application'} = 'Klient-applikasjon';
    $Self->{Translation}->{'Client OS'} = 'Klient-OS';
    $Self->{Translation}->{'Concurrent Users'} = 'Samtidige brukere';
    $Self->{Translation}->{'Config Item-Area'} = 'Konfigurasjonsenhet-omr�de';
    $Self->{Translation}->{'Config Items available'} = 'Tilgjengelige konfigurasjonsenheter';
    $Self->{Translation}->{'Config Items shown'} = 'Viste konfigurasjonsenheter';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Desktop'} = 'Stasjon�r';
    $Self->{Translation}->{'Developer Licence'} = 'Utviklerlisens';
    $Self->{Translation}->{'Docking Station'} = 'Dokkingstasjon';
    $Self->{Translation}->{'Duplicate'} = 'Duplis�r';
    $Self->{Translation}->{'Embedded'} = 'Innebygd';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Tomme felter indikerer at de n�v�rende verdiene beholdes';
    $Self->{Translation}->{'Enterprise Licence'} = 'Enterprise-lisens';
    $Self->{Translation}->{'Expiration Date'} = 'Utg�r dato';
    $Self->{Translation}->{'Expired'} = 'Utg�tt';
    $Self->{Translation}->{'FQDN'} = 'FQDN';
    $Self->{Translation}->{'Floor'} = 'Etasje';
    $Self->{Translation}->{'Freeware'} = 'Gratis programvare';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Ruter';
    $Self->{Translation}->{'Graphic Adapter'} = 'Grafikkort';
    $Self->{Translation}->{'Hard Disk'} = 'Harddisk';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Harddisk::Kapasitet';
    $Self->{Translation}->{'Hide Versions'} = 'Skjul versjoner';
    $Self->{Translation}->{'IP Address'} = 'IP-adresse';
    $Self->{Translation}->{'IP over DHCP'} = 'IP fra DHCP';
    $Self->{Translation}->{'IT Facility'} = 'IT-fasilitet';
    $Self->{Translation}->{'Inactive'} = 'Inaktiv';
    $Self->{Translation}->{'Incident'} = 'Hendelse';
    $Self->{Translation}->{'Install Date'} = 'Installasjonsdato';
    $Self->{Translation}->{'Keybord'} = 'Tastatur';
    $Self->{Translation}->{'LAN'} = 'Lokalnett';
    $Self->{Translation}->{'Laptop'} = 'B�rbar';
    $Self->{Translation}->{'Last Change'} = 'Sist endret';
    $Self->{Translation}->{'Licence Key'} = 'Lisensn�kkel';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Lisensn�kkel::Utg�r dato';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Lisensn�kkel::Antall';
    $Self->{Translation}->{'Licence Type'} = 'Lisenstype';
    $Self->{Translation}->{'Maintenance'} = 'Vedlikehold';
    $Self->{Translation}->{'Maximum number of one element'} = 'Maks. antall av ett element';
    $Self->{Translation}->{'Media'} = 'Media';
    $Self->{Translation}->{'Middleware'} = 'Mellomvare';
    $Self->{Translation}->{'Model'} = 'Modell';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Skjerm';
    $Self->{Translation}->{'Mouse'} = 'Mus';
    $Self->{Translation}->{'Network Adapter'} = 'Nettverkskort';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Nettverkskort::IP-adresse';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Nettverkskort::IP fra DHCP';
    $Self->{Translation}->{'Network Address'} = 'Nettverksadresse';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Nettverksadresse::Ruter';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Nettverksadresse::Subnettmaske';
    $Self->{Translation}->{'Open Source'} = '�pen kildekode';
    $Self->{Translation}->{'Operating System'} = 'Operativsystem';
    $Self->{Translation}->{'Operational'} = 'Operativ';
    $Self->{Translation}->{'Other'} = 'Annet';
    $Self->{Translation}->{'Other Equipment'} = 'Annet utstyr';
    $Self->{Translation}->{'Outlet'} = 'Kontakt';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA-kort';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'Per Node';
    $Self->{Translation}->{'Per Processor'} = 'Per Prosessor';
    $Self->{Translation}->{'Per Server'} = 'Per Tjener';
    $Self->{Translation}->{'Per User'} = 'Per Bruker';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'Pilot'} = 'Pilot';
    $Self->{Translation}->{'Planned'} = 'Planlagt';
    $Self->{Translation}->{'Printer'} = 'Skriver';
    $Self->{Translation}->{'Production'} = 'Produksjon';
    $Self->{Translation}->{'Quantity'} = 'Antall';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'Internminne';
    $Self->{Translation}->{'Repair'} = 'Reparasjon';
    $Self->{Translation}->{'Retired'} = 'Pensjonert';
    $Self->{Translation}->{'Review'} = 'Evaluering';
    $Self->{Translation}->{'Room'} = 'Rom';
    $Self->{Translation}->{'Router'} = 'Ruter';
    $Self->{Translation}->{'Scanner'} = 'Skanner';
    $Self->{Translation}->{'Search Config Items'} = 'S�k konfigurasjonsenheter';
    $Self->{Translation}->{'Security Device'} = 'Sikkerhetsenhet';
    $Self->{Translation}->{'Serial Number'} = 'Serienummer';
    $Self->{Translation}->{'Server'} = 'Tjener';
    $Self->{Translation}->{'Server Application'} = 'Tjener-applikasjon';
    $Self->{Translation}->{'Server OS'} = 'Tjener-OS';
    $Self->{Translation}->{'Show Versions'} = 'Vis versjoner';
    $Self->{Translation}->{'Single Licence'} = 'Enkeltlisens';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnettmaske';
    $Self->{Translation}->{'Switch'} = 'Svitsj';
    $Self->{Translation}->{'Telco'} = 'Teleutstyr';
    $Self->{Translation}->{'Test/QA'} = 'Test/Kvalitetskontroll';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Produksjonssettingstilstand for denne konfigurasjonsenheten';
    $Self->{Translation}->{'The incident state of this config item'} = 'Hendelsestilstanden for denne konfigurasjonsenheten';
    $Self->{Translation}->{'Time Restricted'} = 'Tidsbegrenset';
    $Self->{Translation}->{'USB Device'} = 'USB-enhet';
    $Self->{Translation}->{'Unlimited'} = 'Ubegrenset';
    $Self->{Translation}->{'User Tool'} = 'Brukerverkt�y';
    $Self->{Translation}->{'Volume Licence'} = 'Volumlisens';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN-basestasjon';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Utl�psdato for garanti';
    $Self->{Translation}->{'Workplace'} = 'Arbeidssted';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Administrasjon av konfigurasjonsenheter';
    $Self->{Translation}->{'Actions'} = 'Gj�rem�l';
    $Self->{Translation}->{'Add'} = 'Legg till';
    $Self->{Translation}->{'Change class definition'} = 'Endre klassedefinisjon';
    $Self->{Translation}->{'Go to overview'} = 'Til oversikt';
    $Self->{Translation}->{'List'} = 'Liste';
    $Self->{Translation}->{'Config Item'} = 'Konfigurasjonsenhet';
    $Self->{Translation}->{'Class'} = 'Klasse';
    $Self->{Translation}->{'Version'} = 'Versjon';
    $Self->{Translation}->{'Created by'} = 'Opprettet av';
    $Self->{Translation}->{'Created'} = 'Opprettet';
    $Self->{Translation}->{'View'} = 'Vis';
    $Self->{Translation}->{'Definition'} = 'Definisjon';
    $Self->{Translation}->{'Change'} = 'Endre';
    $Self->{Translation}->{'Submit'} = 'Send';
    $Self->{Translation}->{'or'} = 'eller';
    $Self->{Translation}->{'Cancel'} = 'Avbryt';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = 'Filter for klasser';
    $Self->{Translation}->{'Hint'} = 'Hint';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Velg en klasse fra listen for � opprette en ny konfigurasjonsenhet';
    $Self->{Translation}->{'No matches found.'} = 'Ingen treff ble funnet.';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'Edit'} = 'Endre';
    $Self->{Translation}->{'Cancel & close window'} = 'Avbryt og lukk vinduet';
    $Self->{Translation}->{'Name'} = 'Navn';
    $Self->{Translation}->{'The name of this config item'} = 'Navnet til denne konfigurasjonsenheten';
    $Self->{Translation}->{'This field is required.'} = 'Dette feltet er obligatorisk';
    $Self->{Translation}->{'Deployment State'} = 'Produksjonssettingstilstand';
    $Self->{Translation}->{'Incident State'} = 'Hendelsestilstand';
    $Self->{Translation}->{'Delete'} = 'Slett';
    $Self->{Translation}->{'Save'} = 'Lagre';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of'} = 'Historikken til';
    $Self->{Translation}->{'History Content'} = 'Historikk-innhold';
    $Self->{Translation}->{'User'} = 'Bruker';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Change search options'} = 'Endre s�kevalg';
    $Self->{Translation}->{'Context Settings'} = 'Kontekstvalg';
    $Self->{Translation}->{'Config Items per page'} = 'Konfigurasjonsenheter per side';
    $Self->{Translation}->{'Settings'} = 'Innstillinger';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'State'} = 'Tilstand';
    $Self->{Translation}->{'Deployment State Type'} = 'Type Produksjonssettingstilstand';
    $Self->{Translation}->{'Current Incident State'} = 'N�v�rende Hendelsestilstand';
    $Self->{Translation}->{'Current Incident State Type'} = 'N�v�rende type Hendelsestilstand';
    $Self->{Translation}->{'Last Changed'} = 'Sist endret';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = 'Konfigurasjonsenhet';
    $Self->{Translation}->{'ConfigItem-Info'} = 'Konfigurasjonsenhet-info';
    $Self->{Translation}->{'Current Deployment State'} = 'N�v�rende Produksjonssettingstilstand';
    $Self->{Translation}->{'Last changed'} = 'Sist endret';
    $Self->{Translation}->{'Last changed by'} = 'Sist endret av';
    $Self->{Translation}->{'Linked-Object'} = 'Koblet objekt';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Search-Template'} = 'S�kemal';
    $Self->{Translation}->{'Create New'} = 'Opprett ny';
    $Self->{Translation}->{'Create Template'} = 'Opprett Mal';
    $Self->{Translation}->{'Create New Template'} = 'Opprett ny mal';
    $Self->{Translation}->{'Run Search'} = 'Utf�r s�ket';
    $Self->{Translation}->{'Search template'} = 'S�kemal';
    $Self->{Translation}->{'Save changes in template'} = 'Lagre endringer i mal';
    $Self->{Translation}->{'Add another attribute'} = 'Legg til flere attributter';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Ogs� s�ke i tidligere versjoner?';
    $Self->{Translation}->{'(e. g. 10*5155 or 105658*)'} = '(f.eks. 10*5155 eller 88880*)';
    $Self->{Translation}->{'Remove this entry'} = 'Slett dette innlegget';
    $Self->{Translation}->{'Remove'} = 'Slett';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = 'Opprettelsestidspunkt';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Konfigurasjonsenhet';
    $Self->{Translation}->{'Linked Objects'} = 'Koblede objekter';
    $Self->{Translation}->{'Show one version'} = 'Vis �n versjon';
    $Self->{Translation}->{'Show all versions'} = 'Vis alle versjoner';
    $Self->{Translation}->{'Version Incident State'} = 'Hendelsestilstand for versjonen';
    $Self->{Translation}->{'Version Number'} = 'Versjon';
    $Self->{Translation}->{'Created By'} = 'Opprettet av';
    $Self->{Translation}->{'Changed On'} = 'Endret';
    $Self->{Translation}->{'Show or hide the content.'} = 'Vis eller skjul innholdet';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Versjonsdetaljer for enheten';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
