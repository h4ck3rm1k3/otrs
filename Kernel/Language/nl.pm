# --
# Kernel/Language/nl.pm - provides nl language translation
# Copyright (C) 2002-2003 Fred van Dijk <fvandijk at marklin.nl>
# Copyright (C) 2003 A-NeT Internet Services bv Hans Bakker <h.bakker at a-net.nl>
# Copyright (C) 2004 Martijn Lohmeijer <martijn.lohmeijer 'at' sogeti.nl>
# Copyright (C) 2005-2007 Jurgen Rutgers <jurgen 'at' besite.nl>
# Copyright (C) 2005-2007 Richard Hinkamp <richard 'at' besite.nl>
# Copyright (C) 2010 Ton van Boven <ton 'at' avebo.nl>
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: nl.pm,v 1.179 2012/02/27 08:26:14 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

# Not translated terms / words:

# Agent Area --> it's clear what that does
# Bounce
# Contract
# Upload

package Kernel::Language::nl;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.179 $) [1];

sub Data {
    my $Self = shift;

    # $$START$$
    # Last translation file sync: 2012-02-02 17:08:36

    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D-%M-%Y %T';
    $Self->{DateFormatLong}      = '%A %D %B %Y %T';
    $Self->{DateFormatShort}     = '%D-%M-%Y';
    $Self->{DateInputFormat}     = '%D-%M-%Y';
    $Self->{DateInputFormatLong} = '%D-%M-%Y - %T';

    # csv separator
    $Self->{Separator} = ';';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Ja',
        'No' => 'Nee',
        'yes' => 'ja',
        'no' => 'nee',
        'Off' => 'Uit',
        'off' => 'uit',
        'On' => 'Aan',
        'on' => 'aan',
        'top' => 'bovenkant',
        'end' => 'onderkant',
        'Done' => 'Klaar',
        'Cancel' => 'Annuleren',
        'Reset' => 'Opnieuw',
        'last' => 'laatste',
        'before' => 'voor',
        'Today' => 'Vandaag',
        'Tomorrow' => 'Morgen',
        'Next week' => '',
        'day' => 'dag',
        'days' => 'dagen',
        'day(s)' => 'dag(en)',
        'd' => 'd',
        'hour' => 'uur',
        'hours' => 'uur',
        'hour(s)' => 'uur',
        'Hours' => 'Uren',
        'h' => 'u',
        'minute' => 'minuut',
        'minutes' => 'minuten',
        'minute(s)' => 'minuten',
        'Minutes' => 'Minuten',
        'm' => 'm',
        'month' => 'maand',
        'months' => 'maanden',
        'month(s)' => 'maand(en)',
        'week' => 'week',
        'week(s)' => 'weken',
        'year' => 'jaar',
        'years' => 'jaren',
        'year(s)' => 'jaren',
        'second(s)' => 'seconden',
        'seconds' => 'seconden',
        'second' => 'seconde',
        's' => 's',
        'wrote' => 'schreef',
        'Message' => 'Bericht',
        'Error' => 'Fout',
        'Bug Report' => 'Foutrapport',
        'Attention' => 'Let op',
        'Warning' => 'Waarschuwing',
        'Module' => 'Module',
        'Modulefile' => 'Modulebestand',
        'Subfunction' => 'Subfunctie',
        'Line' => 'Regel',
        'Setting' => 'Instelling',
        'Settings' => 'Instellingen',
        'Example' => 'Voorbeeld',
        'Examples' => 'Voorbeelden',
        'valid' => 'geldig',
        'Valid' => 'Geldigheid',
        'invalid' => 'ongeldig',
        'Invalid' => 'Ongeldig',
        '* invalid' => '* ongeldig',
        'invalid-temporarily' => 'tijdelijk ongeldig',
        ' 2 minutes' => ' 2 minuten',
        ' 5 minutes' => ' 5 minuten',
        ' 7 minutes' => ' 7 minuten',
        '10 minutes' => '10 minuten',
        '15 minutes' => '15 minuten',
        'Mr.' => 'Dhr.',
        'Mrs.' => 'Mevr.',
        'Next' => 'Volgende',
        'Back' => 'Terug',
        'Next...' => 'Volgende >',
        '...Back' => '< Terug',
        '-none-' => '-geen-',
        'none' => 'geen',
        'none!' => 'niet ingevoerd',
        'none - answered' => 'geen - beantwoord',
        'please do not edit!' => 'niet wijzigen alstublieft!',
        'Need Action' => 'Actie nodig',
        'AddLink' => 'Koppeling toevoegen',
        'Link' => 'Koppel',
        'Unlink' => 'Ontkoppel',
        'Linked' => 'Gekoppeld',
        'Link (Normal)' => 'Koppeling (normaal)',
        'Link (Parent)' => 'Koppeling (vader)',
        'Link (Child)' => 'Koppeling (zoon)',
        'Normal' => 'Normaal',
        'Parent' => 'vader',
        'Child' => 'zoon',
        'Hit' => 'Hit',
        'Hits' => 'Hits',
        'Text' => 'Tekst',
        'Standard' => 'Standaard',
        'Lite' => 'Light',
        'User' => 'Gebruiker',
        'Username' => 'Gebruikersnaam',
        'Language' => 'Taal',
        'Languages' => 'Talen',
        'Password' => 'Wachtwoord',
        'Preferences' => 'Voorkeuren',
        'Salutation' => 'Aanhef',
        'Salutations' => 'Aanheffen',
        'Signature' => 'Handtekening',
        'Signatures' => 'Handtekeningen',
        'Customer' => 'Klant',
        'CustomerID' => 'Klantcode',
        'CustomerIDs' => 'Klantcodes',
        'customer' => 'klant',
        'agent' => 'gebruiker',
        'system' => 'systeem',
        'Customer Info' => 'Klantinformatie',
        'Customer Information' => 'Klantinformatie',
        'Customer Company' => 'Bedrijf',
        'Customer Companies' => 'Bedrijven',
        'Company' => 'Bedrijf',
        'go!' => 'start!',
        'go' => 'start',
        'All' => 'Alle',
        'all' => 'alle',
        'Sorry' => 'Sorry',
        'update!' => 'opslaan',
        'update' => 'opslaan',
        'Update' => 'Opslaan',
        'Updated!' => 'Gewijzigd',
        'submit!' => 'opslaan',
        'submit' => 'opslaan',
        'Submit' => 'Opslaan',
        'change!' => 'wijzigen',
        'Change' => 'Wijzigen',
        'change' => 'wijzigen',
        'click here' => 'klik hier',
        'Comment' => 'Opmerking',
        'Invalid Option!' => 'Geen geldige optie.',
        'Invalid time!' => 'Geen geldige tijd.',
        'Invalid date!' => 'Geen geldige datum.',
        'Name' => 'Naam',
        'Group' => 'Groep',
        'Description' => 'Omschrijving',
        'description' => 'omschrijving',
        'Theme' => 'Thema',
        'Created' => 'Aangemaakt',
        'Created by' => 'Aangemaakt door',
        'Changed' => 'Gewijzigd',
        'Changed by' => 'Gewijzigd door',
        'Search' => 'Zoeken',
        'and' => 'en',
        'between' => 'tussen',
        'Fulltext Search' => 'Alles doorzoeken',
        'Data' => 'Gegevens',
        'Options' => 'Opties',
        'Title' => 'Titel',
        'Item' => 'Onderdeel',
        'Delete' => 'Verwijderen',
        'Edit' => 'Wijzig',
        'View' => 'Weergave',
        'Number' => 'Nummer',
        'System' => 'Systeem',
        'Contact' => 'Contact',
        'Contacts' => 'Contacten',
        'Export' => 'Exporteer',
        'Up' => 'Boven',
        'Down' => 'Beneden',
        'Add' => 'Toevoegen',
        'Added!' => 'Toegevoegd',
        'Category' => 'Categorie',
        'Viewer' => 'Viewer',
        'Expand' => 'Klap uit',
        'Small' => 'Klein',
        'Medium' => 'Middel',
        'Large' => 'Groot',
        'Date picker' => 'Datumkiezer',
        'New message' => 'Nieuw bericht',
        'New message!' => 'Nieuw bericht.',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Beantwoord eerst onderstaande geëscaleerde tickets om terug te kunnen komen in de normale wachtrij.',
        'You have %s new message(s)!' => 'U heeft %s nieuwe bericht(en).',
        'You have %s reminder ticket(s)!' => 'U heeft %s herinneringsticket(s).',
        'The recommended charset for your language is %s!' => 'De aanbevolen karakterset voor uw taal is %s.',
        'Change your password.' => 'Verander uw wachtwoord.',
        'Please activate %s first!' => 'Activeer %s eerst.',
        'No suggestions' => 'Geen suggesties',
        'Word' => 'Woord',
        'Ignore' => 'Negeren',
        'replace with' => 'vervangen met',
        'There is no account with that login name.' => 'Er is geen account bekend met deze gebruikersnaam.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            'Inloggen mislukt. Uw gebruikersnaam of wachtwoord is niet correct.',
        'There is no acount with that user name.' => 'Deze gebruikersnaam is niet bekend.',
        'Please contact your administrator' => 'Neem contact op met uw beheerder',
        'Logout' => 'Uitloggen',
        'Logout successful. Thank you for using OTRS!' => 'U bent afgemeld. Bedankt voor het gebruiken van OTRS.',
        'Invalid SessionID!' => 'Ongeldige SessieID.',
        'Feature not active!' => 'Deze functie is niet actief.',
        'Agent updated!' => 'Gebruiker aangepast.',
        'Create Database' => 'Database aanmaken',
        'System Settings' => 'Systeemconfiguratie',
        'Mail Configuration' => 'E-mailconfiguratie',
        'Finished' => 'Afgerond',
        'Install OTRS' => 'Installeer OTRS',
        'Intro' => 'Introductie',
        'License' => 'Licentie',
        'Database' => 'Database',
        'Configure Mail' => 'Configureer mail',
        'Database deleted.' => 'Database verwijderd.',
        'Database setup succesful!' => 'Database-installatie afgerond.',
        'Login is needed!' => 'Inloggen is nodig.',
        'Password is needed!' => 'Een wachtwoord is vereist.',
        'Take this Customer' => 'Selecteer deze klant',
        'Take this User' => 'Selecteer deze gebruiker',
        'possible' => 'mogelijk',
        'reject' => 'afwijzen',
        'reverse' => 'omgekeerd',
        'Facility' => 'Maatregel',
        'Time Zone' => 'Tijdzone',
        'Pending till' => 'In de wacht tot',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            'Werk niet met het SuperUser account. Maak gebruikersaccounts aan.',
        'Dispatching by email To: field.' => 'Toewijzen gebaseerd op e-mailadres.',
        'Dispatching by selected Queue.' => 'Toewijzen gebaseerd op geselecteerde wachtrij.',
        'No entry found!' => 'Niets gevonden.',
        'Session has timed out. Please log in again.' => 'Uw sessie is verlopen. Meldt u opnieuw aan.',
        'No Permission!' => 'Geen toegang! Onvoldoende permissies.',
        'To: (%s) replaced with database email!' => 'Aan: e-mail adres (%s) vervangen.',
        'Cc: (%s) added database email!' => 'Cc: e-mail adres (%s) toegevoegd.',
        '(Click here to add)' => '(Klik hier om toe te voegen)',
        'Preview' => 'Voorbeeld',
        'Package not correctly deployed! Please reinstall the package.' =>
            'Pakket onjuist geïnstalleerd. Installeer het paket opnieuw.',
        '%s is not writable!' => '%s is niet schrijfbaar.',
        'Cannot create %s!' => 'Kan %s niet aanmaken.',
        'Check to activate this date' => 'Selecteer om deze datum te gebruiken',
        'You have Out of Office enabled, would you like to disable it?' =>
            'U staat geregistreerd als afwezig. Wilt u dit aanpassen?',
        'Customer %s added' => 'Klant %s toegevoegd.',
        'Role added!' => 'Rol toegevoegd.',
        'Role updated!' => 'Rol bijgewerkt.',
        'Attachment added!' => 'Bijlage toegevoegd.',
        'Attachment updated!' => 'Bijlage bijgewerkt.',
        'Response added!' => 'Antwoord toegevoegd.',
        'Response updated!' => 'Antwoord bijgewerkt',
        'Group updated!' => 'Groep bijgewerkt.',
        'Queue added!' => 'Wachtrij toegevoegd.',
        'Queue updated!' => 'Wachtrij bijgewerkt.',
        'State added!' => 'Status toegevoegd.',
        'State updated!' => 'Status bijgewerkt.',
        'Type added!' => 'Type toegevoegd.',
        'Type updated!' => 'Type bijgewerkt',
        'Customer updated!' => 'Klant aangepast.',
        'Customer company added!' => 'Bedrijf toegevoegd.',
        'Customer company updated!' => 'Bedrijf bijgewerkt.',
        'Mail account added!' => 'E-mailaccount toegevoegd.',
        'Mail account updated!' => 'E-mailaccount bijgewerkt.',
        'System e-mail address added!' => 'E-mailadres toegevoegd.',
        'System e-mail address updated!' => 'E-mailadres bijgewerkt.',
        'Contract' => 'Contract',
        'Online Customer: %s' => 'Online klanten: %s',
        'Online Agent: %s' => 'Online gebruikers: %s',
        'Calendar' => 'Kalender',
        'File' => 'Bestand',
        'Filename' => 'Bestandsnaam',
        'Type' => 'Type',
        'Size' => 'Grootte',
        'Upload' => 'Upload',
        'Directory' => 'Map',
        'Signed' => 'Getekend',
        'Sign' => 'Teken',
        'Crypted' => 'Versleuteld',
        'Crypt' => 'Versleutel',
        'PGP' => 'PGP',
        'PGP Key' => 'PGP Sleutel',
        'PGP Keys' => 'PGP Sleutels',
        'S/MIME' => 'S/MIME',
        'S/MIME Certificate' => 'S/MIME Certificaat',
        'S/MIME Certificates' => 'S/MIME Certificaten',
        'Office' => 'Kantoor',
        'Phone' => 'Telefoon',
        'Fax' => 'Fax',
        'Mobile' => 'Mobiel',
        'Zip' => 'Postcode',
        'City' => 'Plaats',
        'Street' => 'Straat',
        'Country' => 'Land',
        'Location' => 'Locatie',
        'installed' => 'geïnstalleerd',
        'uninstalled' => 'verwijderd',
        'Security Note: You should activate %s because application is already running!' =>
            'Beveiligingswaarschuwing: Activeer %s omdat de applicatie al actief is!',
        'Unable to parse repository index document.' => 'Kan repository index document niet verwerken.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'Geen pakketten gevonden in deze repository voor de huidige framework versie. De repository bevaty alleen pakketten voor andere framework versies.',
        'No packages, or no new packages, found in selected repository.' =>
            'Geen pakketten, of geen nieuwe pakketten, gevonden in de geselecteerde repository.',
        'Edit the system configuration settings.' => 'Bewerk de systeemconfiguratie.',
        'printed at' => 'afgedrukt op',
        'Loading...' => 'Bezig met laden...',
        'Dear Mr. %s,' => 'Geachte heer %s,',
        'Dear Mrs. %s,' => 'Geachte mevrouw %s,',
        'Dear %s,' => 'Geachte %s,',
        'Hello %s,' => 'Beste %s,',
        'This email address already exists. Please log in or reset your password.' =>
            'Dit e-mailadres bestaat al. Log in of reset uw wachtwoord.',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Nieuw account aangemaakt. Login informatie gestuurd aan %s. Controleer uw e-mail.',
        'Please press Back and try again.' => 'Druk op Terug en probeer opnieuw.',
        'Sent password reset instructions. Please check your email.' => 'Wachtwoord reset instructies zijn verstuurd. Controleer uw e-mail.',
        'Sent new password to %s. Please check your email.' => 'Nieuw wachtwoord gestuurd aan %s. Controleer uw e-mail.',
        'Upcoming Events' => 'Aankomende gebeurtenissen',
        'Event' => 'Gebeurtenis',
        'Events' => 'Gebeurtenissen',
        'Invalid Token!' => 'Fout token!',
        'more' => 'meer',
        'For more info see:' => 'Voor meer informatie zie:',
        'Package verification failed!' => 'Pakketverificatie mislukt!',
        'Collapse' => 'Inklappen',
        'Shown' => 'Tonen',
        'News' => 'Nieuws',
        'Product News' => 'Productnieuws',
        'OTRS News' => 'OTRS Nieuws',
        '7 Day Stats' => 'Afgelopen 7 dagen',
        'Bold' => 'Vet',
        'Italic' => 'Cursief',
        'Underline' => 'Onderstreep',
        'Font Color' => 'Tekstkleur',
        'Background Color' => 'Achtergrondkleur',
        'Remove Formatting' => 'Verwijder opmaak',
        'Show/Hide Hidden Elements' => 'Toon/verberg verborgen elementen',
        'Align Left' => 'Links uitlijnen',
        'Align Center' => 'Centreren',
        'Align Right' => 'Rechts uitlijnen',
        'Justify' => 'Aanpassen',
        'Header' => 'Type',
        'Indent' => 'Inspringing vergroten',
        'Outdent' => 'Inspringing verkleinen',
        'Create an Unordered List' => 'Maak een ongesorteerd overzicht aan',
        'Create an Ordered List' => 'Maak een gesorteerd overzicht aan',
        'HTML Link' => 'HTML koppeling',
        'Insert Image' => 'Afbeelding invoegen',
        'CTRL' => 'CTRL',
        'SHIFT' => 'SHIFT',
        'Undo' => 'Ongedaan maken',
        'Redo' => 'Herhalen',
        'Scheduler process is registered but might not be running.' => 'Schedulerproces is geregistreerd, maar niet actief.',
        'Scheduler is not running.' => 'De Scheduler is niet actief.',

        # Template: AAACalendar
        'New Year\'s Day' => 'Nieuwjaarsdag',
        'International Workers\' Day' => 'Dag van de Arbeid',
        'Christmas Eve' => 'Kerstavond',
        'First Christmas Day' => 'Eerste Kerstdag',
        'Second Christmas Day' => 'Tweede Kerstdag',
        'New Year\'s Eve' => 'Oudjaarsdag',

        # Template: AAAGenericInterface
        'OTRS as requester' => '',
        'OTRS as provider' => '',
        'Webservice "%s" created!' => '',
        'Webservice "%s" updated!' => '',

        # Template: AAAMonth
        'Jan' => 'jan',
        'Feb' => 'feb',
        'Mar' => 'mrt',
        'Apr' => 'apr',
        'May' => 'mei',
        'Jun' => 'jun',
        'Jul' => 'jul',
        'Aug' => 'aug',
        'Sep' => 'sep',
        'Oct' => 'okt',
        'Nov' => 'nov',
        'Dec' => 'dec',
        'January' => 'januari',
        'February' => 'februari',
        'March' => 'maart',
        'April' => 'april',
        'May_long' => 'mei',
        'June' => 'juni',
        'July' => 'juli',
        'August' => 'augustus',
        'September' => 'september',
        'October' => 'oktober',
        'November' => 'november',
        'December' => 'december',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'Uw voorkeuren zijn gewijzigd.',
        'User Profile' => 'Gebruikersprofiel',
        'Email Settings' => 'E-mail voorkeuren',
        'Other Settings' => 'Overige voorkeuren',
        'Change Password' => 'Wachtwoord Wijzigen',
        'Current password' => 'Huidig wachtwoord',
        'New password' => 'Nieuw wachtwoord',
        'Verify password' => 'Herhaal wachtwoord',
        'Spelling Dictionary' => 'Spellingsbibliotheek',
        'Default spelling dictionary' => 'Standaard spellingsbibliotheek',
        'Max. shown Tickets a page in Overview.' => 'Max. getoonde tickets per pagina in overzichtsscherm.',
        'The current password is not correct. Please try again!' => 'Het ingegeven wachtwoord klopt niet. Probeer het opnieuw.',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Kan het wachtwoord niet bijwerken, de wachtwoorden komen niet overeen.',
        'Can\'t update password, it contains invalid characters!' => 'Kan het wachtwoord niet bijwerken, het bevat ongeldige tekens.',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Kan het wachtwoord niet bijwerken, het moet minstens %s tekens lang zijn.',
        'Can\'t update password, it must contain at least 2 lowercase  and 2 uppercase characters!' =>
            'Kan het wachtwoord niet bijwerken, het moet minstens twee kleine letters en twee hoofdletters bevatten.',
        'Can\'t update password, it must contain at least 1 digit!' => 'Kan het wachtwoord niet bijwerken, het moet minstens 1 cijfer bevatten.',
        'Can\'t update password, it must contain at least 2 characters!' =>
            'Kan het wachtwoord niet bijwerken, het moet minstens twee tekens lang zijn.',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            'Dit wachtwoord is al eerder gebruikt. Kies een nieuw wachtwoord.',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Selecteer het scheidingsteken voor CSV bestanden. Als u geen scheidingsteken kiest zal het standaard scheidingsteken voor uw taal gebruikt worden.',
        'CSV Separator' => 'CSV scheidingsteken',

        # Template: AAAStats
        'Stat' => 'Rapportage',
        'Sum' => 'Totaal',
        'Please fill out the required fields!' => 'Vul de verplichte velden in.',
        'Please select a file!' => 'Selecteer een bestand.',
        'Please select an object!' => 'Selecteer een object.',
        'Please select a graph size!' => 'Selecteer de grootte van de grafiek.',
        'Please select one element for the X-axis!' => 'Selecteer een element voor X-as.',
        'Please select only one element or turn off the button \'Fixed\' where the select field is marked!' =>
            'Selecteer een element of haal het vinkje bij \'Statisch\' weg.',
        'If you use a checkbox you have to select some attributes of the select field!' =>
            'Als u een attribuut selecteert moet u ook één of meerdere waarden van dit attribuut selecteren.',
        'Please insert a value in the selected input field or turn off the \'Fixed\' checkbox!' =>
            'Selecteer een element of haal het vinkje bij \'Statisch\' weg.',
        'The selected end time is before the start time!' => 'De opgegeven eindtijd ligt voor de starttijd.',
        'You have to select one or more attributes from the select field!' =>
            'Kies één of meer attributen.',
        'The selected Date isn\'t valid!' => 'De geselecteerde datum is niet geldig.',
        'Please select only one or two elements via the checkbox!' => 'Kies één of meer elementen met de keuzebox.',
        'If you use a time scale element you can only select one element!' =>
            'Als u een tijdselement kiest kunt u maar één element selecteren.',
        'You have an error in your time selection!' => 'De tijdselectie bevat een fout.',
        'Your reporting time interval is too small, please use a larger time scale!' =>
            'De tijdsinterval is te klein, kies een grotere interval.',
        'The selected start time is before the allowed start time!' => 'De starttijd is te vroeg.',
        'The selected end time is after the allowed end time!' => 'De eindtijd is te laat.',
        'The selected time period is larger than the allowed time period!' =>
            'De geselecteerde tijdsperiode is langer dan de toegestane periode.',
        'Common Specification' => 'Algemene eigenschappen',
        'X-axis' => 'X-as',
        'Value Series' => 'Waardes',
        'Restrictions' => 'Restricties',
        'graph-lines' => 'lijnengrafiek',
        'graph-bars' => 'balkengrafiek',
        'graph-hbars' => 'horizontale balkengrafiek',
        'graph-points' => 'puntengrafiek',
        'graph-lines-points' => 'lijnen- en puntengrafiek',
        'graph-area' => 'vlakkengrafiek',
        'graph-pie' => 'taartpuntengrafiek',
        'extended' => 'uitgebreid',
        'Agent/Owner' => 'Gebruiker/eigenaar',
        'Created by Agent/Owner' => 'Aangemaakt door gebruiker/eigenaar',
        'Created Priority' => 'Aangemaakt met prioriteit',
        'Created State' => 'Aangemaakt met status',
        'Create Time' => 'Aangemaakt op',
        'CustomerUserLogin' => 'Klantlogin',
        'Close Time' => 'Afsluitingstijd',
        'TicketAccumulation' => 'Ticket-totalen',
        'Attributes to be printed' => 'Attributen om af te drukken',
        'Sort sequence' => 'Sorteervolgorde',
        'Order by' => 'Sorteren op',
        'Limit' => 'Beperk tot',
        'Ticketlist' => 'Ticketoverzicht',
        'ascending' => 'aflopend',
        'descending' => 'oplopend',
        'First Lock' => 'Eerste vergrendeling',
        'Evaluation by' => 'Gebruik',
        'Total Time' => 'Totale tijd',
        'Ticket Average' => 'Gemiddelde per ticket',
        'Ticket Min Time' => 'Minimumtijd voor ticket',
        'Ticket Max Time' => 'Maximumtijd voor ticket',
        'Number of Tickets' => 'Aantal tickets',
        'Article Average' => 'Gemiddelde per interactie',
        'Article Min Time' => 'Minimumtijd voor interactie',
        'Article Max Time' => 'Maximumtijd voor interactie',
        'Number of Articles' => 'Aantal interacties',
        'Accounted time by Agent' => 'Bestede tijd per gebruiker',
        'Ticket/Article Accounted Time' => 'Bestede tijd voor ticket en interacties',
        'TicketAccountedTime' => 'Bestede tijd voor ticket',
        'Ticket Create Time' => 'Aanmaaktijd ticket',
        'Ticket Close Time' => 'Sluittijd ticket',

        # Template: AAATicket
        'Status View' => 'Statusoverzicht',
        'Bulk' => 'Bulk',
        'Lock' => 'Vergrendel',
        'Unlock' => 'Ontgrendel',
        'History' => 'Geschiedenis',
        'Zoom' => 'Inhoud',
        'Age' => 'Leeftijd',
        'Bounce' => 'Bounce',
        'Forward' => 'Doorsturen',
        'From' => 'Van',
        'To' => 'Aan',
        'Cc' => 'Cc',
        'Bcc' => 'Bcc',
        'Subject' => 'Onderwerp',
        'Move' => 'Verplaatsen',
        'Queue' => 'Wachtrij',
        'Queues' => 'Wachtrijen',
        'Priority' => 'Prioriteit',
        'Priorities' => 'Prioriteiten',
        'Priority Update' => 'Prioriteit wijziging',
        'Priority added!' => 'Prioriteit toegevoegd.',
        'Priority updated!' => 'Prioriteit bijgewerkt.',
        'Signature added!' => 'Handtekening toegevoegd.',
        'Signature updated!' => 'Handtekening bijgewerkt.',
        'SLA' => 'SLA',
        'Service Level Agreement' => 'Service Level Agreement',
        'Service Level Agreements' => 'Service Level Agreements',
        'Service' => 'Service',
        'Services' => 'Services',
        'State' => 'Status',
        'States' => 'Statussen',
        'Status' => 'Status',
        'Statuses' => 'Statussen',
        'Ticket Type' => 'Ticket type',
        'Ticket Types' => 'Ticket typen',
        'Compose' => 'Maken',
        'Pending' => 'Wachten',
        'Owner' => 'Eigenaar',
        'Owner Update' => 'Eigenaar gewijzigd',
        'Responsible' => 'Verantwoordelijke',
        'Responsible Update' => 'Verantwoordelijke gewijzigd',
        'Sender' => 'Afzender',
        'Article' => 'Interactie',
        'Ticket' => 'Ticket',
        'Createtime' => 'Aangemaakt op',
        'plain' => 'zonder opmaak',
        'Email' => 'E-mail',
        'email' => 'e-mail',
        'Close' => 'Sluiten',
        'Action' => 'Actie',
        'Attachment' => 'Bijlage',
        'Attachments' => 'Bijlagen',
        'This message was written in a character set other than your own.' =>
            'Dit bericht is geschreven in een andere karakterset dan degene die u nu heeft ingesteld.',
        'If it is not displayed correctly,' => 'Als dit niet juist wordt weergegeven,',
        'This is a' => 'Dit is een',
        'to open it in a new window.' => 'om deze in een nieuw venster te openen.',
        'This is a HTML email. Click here to show it.' => 'Dit is een HTML e-mail. Klik hier om deze te tonen.',
        'Free Fields' => 'Vrije invulvelden',
        'Merge' => 'Samenvoegen',
        'merged' => 'samengevoegd',
        'closed successful' => 'succesvol gesloten',
        'closed unsuccessful' => 'niet succesvol gesloten',
        'Locked Tickets Total' => 'Totaal aantal vergrendelde tickets',
        'Locked Tickets Reminder Reached' => 'Vergrendelde tickets herinnering bereikt',
        'Locked Tickets New' => 'Nieuwe vergrendelde tickets',
        'Responsible Tickets Total' => 'Totaal aantal tickets verantwoordelijk',
        'Responsible Tickets New' => 'Nieuwe tickets verantwoordelijk',
        'Responsible Tickets Reminder Reached' => 'Tickets verantwoordelijk herinnering bereikt',
        'Watched Tickets Total' => 'Totaal gevolgde tickets',
        'Watched Tickets New' => 'Nieuwe gevolgde tickets',
        'Watched Tickets Reminder Reached' => 'Gevolgde tickets herinnering bereikt',
        'All tickets' => 'Alle tickets',
        'Available tickets' => 'Beschikbare tickets',
        'Escalation' => 'Escalatie',
        'last-search' => 'laatste zoekopdracht',
        'QueueView' => 'Wachtrijoverzicht',
        'Ticket Escalation View' => 'Ticket escalatie',
        'Message from' => 'Bericht van',
        'End message' => 'Einde van het bericht',
        'Forwarded message from' => 'Doorgestuurd bericht van',
        'End forwarded message' => 'Einde doorgestuurd bericht',
        'new' => 'nieuw',
        'open' => 'open',
        'Open' => 'Open',
        'Open tickets' => 'Open tickets',
        'closed' => 'gesloten',
        'Closed' => 'Gesloten',
        'Closed tickets' => 'Gesloten tickets',
        'removed' => 'verwijderd',
        'pending reminder' => 'wachtend op een herinnering',
        'pending auto' => 'wachtend',
        'pending auto close+' => 'wachtend op automatisch succesvol sluiten',
        'pending auto close-' => 'wachtend op automatisch niet succesvol sluiten',
        'email-external' => 'e-mail extern',
        'email-internal' => 'e-mail intern',
        'note-external' => 'externe notitie',
        'note-internal' => 'interne notitie',
        'note-report' => 'notitie rapport',
        'phone' => 'telefoon',
        'sms' => 'sms',
        'webrequest' => 'verzoek via web',
        'lock' => 'vergrendeld',
        'unlock' => 'niet vergrendeld',
        'very low' => 'zeer laag',
        'low' => 'laag',
        'normal' => 'normaal',
        'high' => 'hoog',
        'very high' => 'zeer hoog',
        '1 very low' => '1 zeer laag',
        '2 low' => '2 laag',
        '3 normal' => '3 normaal',
        '4 high' => '4 hoog',
        '5 very high' => '5 zeer hoog',
        'auto follow up' => '',
        'auto reject' => '',
        'auto remove' => '',
        'auto reply' => '',
        'auto reply/new ticket' => '',
        'Ticket "%s" created!' => 'Ticket "%s" aangemaakt.',
        'Ticket Number' => 'Ticketnummer',
        'Ticket Object' => 'Ticketonderwerp',
        'No such Ticket Number "%s"! Can\'t link it!' => 'Ticketnummer "%s" niet gevonden! Er kan dus geen koppeling worden gemaakt.',
        'You don\'t have write access to this ticket.' => 'U heeft geen schrijfrechten op dit ticket.',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'U moet de eigenaar zijn om deze actie uit te voeren.',
        'Ticket selected.' => 'Ticket geselecteerd.',
        'Ticket is locked by another agent.' => 'Dit ticket is vergrendeld door een andere gebruiker.',
        'Ticket locked.' => 'Ticket vergrendeld.',
        'Don\'t show closed Tickets' => 'Gesloten tickets niet tonen',
        'Show closed Tickets' => 'Gesloten tickets wel tonen',
        'New Article' => 'Nieuwe interactie',
        'Unread article(s) available' => 'Ongelezen interactie(s) aanwezig',
        'Remove from list of watched tickets' => 'Verwijder van lijst met gevolgde tickets',
        'Add to list of watched tickets' => 'Voeg toe aan lijst met gevolgde tickets',
        'Email-Ticket' => 'E-mail ticket',
        'Create new Email Ticket' => 'Maak nieuw e-mail ticket aan',
        'Phone-Ticket' => 'Telefoon ticket',
        'Search Tickets' => 'Zoek tickets',
        'Edit Customer Users' => 'Wijzig klanten',
        'Edit Customer Company' => 'Wijzig bedrijf',
        'Bulk Action' => 'Bulk actie',
        'Bulk Actions on Tickets' => 'Bulk actie op tickets',
        'Send Email and create a new Ticket' => 'Verstuur e-mail en maak een nieuw ticket aan',
        'Create new Email Ticket and send this out (Outbound)' => 'Maak een nieuw ticket aan en verstuur per e-mail',
        'Create new Phone Ticket (Inbound)' => 'Maak nieuw ticket aan van telefoongesprek',
        'Overview of all open Tickets' => 'Laat alle open tickets zien',
        'Locked Tickets' => 'Vergrendelde tickets',
        'My Locked Tickets' => 'Mijn vergrendelde tickets',
        'My Watched Tickets' => 'Mijn gevolgde tickets',
        'My Responsible Tickets' => 'Mijn verantwoordelijke tickets',
        'Watched Tickets' => 'Gevolgde tickets',
        'Watched' => 'Gevolgd',
        'Watch' => 'Volg',
        'Unwatch' => 'Stop met volgen',
        'Lock it to work on it' => 'Vergrendel dit ticket',
        'Unlock to give it back to the queue' => 'Ontgrendelen om dit ticket vrij te geven',
        'Shows the ticket history' => 'Laat de geschiedenis van dit ticket zien',
        'Print this ticket' => 'Print dit ticket',
        'Print this article' => 'Print deze interactie',
        'Split this article' => 'Splits deze interactie',
        'Forward article via mail' => 'Stuur interactie naar een mailadres',
        'Change the ticket priority' => 'Wijzig de prioriteit van dit ticket',
        'Change the ticket free fields!' => 'Wijzig de vrije invulvelden van het ticket',
        'Link this ticket to other objects' => 'Koppel dit ticket aan andere objecten',
        'Change the owner for this ticket' => 'Wijzig de eigenaar van dit ticket',
        'Change the  customer for this ticket' => 'Wijzig de klant voor dit ticket',
        'Add a note to this ticket' => 'Voeg een notitie toe aan dit ticket',
        'Merge into a different ticket' => 'Voeg samen met een ander ticket',
        'Set this ticket to pending' => 'Zet dit ticket in de wacht',
        'Close this ticket' => 'Sluit dit ticket',
        'Look into a ticket!' => 'Bekijk dit ticket.',
        'Delete this ticket' => 'Verwijder dit ticket',
        'Mark as Spam!' => 'Markeer als spam',
        'My Queues' => 'Mijn wachtrijen',
        'Shown Tickets' => 'Laat tickets zien',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Uw e-mail met ticketnummer "<OTRS_TICKET>" is samengevoegd met "<OTRS_MERGE_TO_TICKET>".',
        'Ticket %s: first response time is over (%s)!' => 'Ticket %s: eerste antwoord tijd is voorbij (%s).',
        'Ticket %s: first response time will be over in %s!' => 'Ticket %s: eerste antwoord tijd zal voorbij zijn binnen %s.',
        'Ticket %s: update time is over (%s)!' => 'Ticket %s: vervolg tijd is voorbij (%s).',
        'Ticket %s: update time will be over in %s!' => 'Ticket %s: vervolg tijd zal voorbij zijn binnen %s.',
        'Ticket %s: solution time is over (%s)!' => 'Ticket %s: oplossing tijd is voorbij (%s).',
        'Ticket %s: solution time will be over in %s!' => 'Ticket %s: oplossing tijd zal voorbij zijn binnen %s.',
        'There are more escalated tickets!' => 'Er zijn nog meer geëscaleerde tickets.',
        'Plain Format' => 'Broncode',
        'Reply All' => 'Allen beantwoorden',
        'Direction' => 'Richting',
        'Agent (All with write permissions)' => 'Gebruikers (met schrijfrechten)',
        'Agent (Owner)' => 'Gebruiker (eigenaar)',
        'Agent (Responsible)' => 'Agent (verantwoordelijke)',
        'New ticket notification' => 'Melding bij een nieuw ticket',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Stuur mij een melding als er een nieuw ticket in \'Mijn wachtrijen\' komt.',
        'Send new ticket notifications' => 'Melding bij nieuwe tickets',
        'Ticket follow up notification' => 'Melding bij nieuwe reacties',
        'Ticket lock timeout notification' => 'Melding bij tijdsoverschrijding van een vergrendeld ticket',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Melding bij ontgrendeling van een ticket door het systeem',
        'Send ticket lock timeout notifications' => 'Melding bij het automatisch ontgrendelen van een ticket',
        'Ticket move notification' => 'Melding bij verplaatsen van een ticket',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            ' Stuur een melding als een ticket wordt verplaatst in een van mijn wachtrijen',
        'Send ticket move notifications' => 'Melding bij het verplaatsen van een ticket',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            'Uw selectie van favoriete wachtrijen. U ontvangt automatisch een melding van nieuwe tickets in deze wachtrij, als u hiervoor heeft gekozen.',
        'Custom Queue' => 'Aangepaste wachtrij.',
        'QueueView refresh time' => 'Verversingstijd wachtrij',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            'Het wachtrijoverzicht zal automatisch verversen na de ingestelde periode.',
        'Refresh QueueView after' => 'Ververs overzicht na',
        'Screen after new ticket' => 'Scherm na nieuw ticket',
        'Show this screen after I created a new ticket' => 'Toon dit scherm na het aanmaken van een nieuw ticket',
        'Closed Tickets' => 'Afgesloten tickets',
        'Show closed tickets.' => 'Toon gesloten tickets.',
        'Max. shown Tickets a page in QueueView.' => 'Max. getoonde tickets per pagina in wachtrijscherm.',
        'Ticket Overview "Small" Limit' => 'Ticket overzicht (klein) limiet',
        'Ticket limit per page for Ticket Overview "Small"' => 'Getoonde tickets per pagina (klein)',
        'Ticket Overview "Medium" Limit' => 'Ticket overzicht (middel) limiet',
        'Ticket limit per page for Ticket Overview "Medium"' => 'Getoonde tickets per pagina (middel)',
        'Ticket Overview "Preview" Limit' => 'Ticket overzicht (groot) limiet',
        'Ticket limit per page for Ticket Overview "Preview"' => 'Getoonde tickets per pagina (groot)',
        'Ticket watch notification' => 'Gevolgde ticket meldingen',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            'Stuur mij dezelfde melding voor gevolgde tickets die naar ticket eigenaars gaan.',
        'Send ticket watch notifications' => 'Stuur melding voor gevolgde tickets',
        'Out Of Office Time' => 'Buiten kantoortijd',
        'New Ticket' => 'Nieuw ticket',
        'Create new Ticket' => 'Maak nieuw ticket aan',
        'Customer called' => 'Klant gebeld',
        'phone call' => 'telefoongesprek',
        'Phone Call Outbound' => 'Uitgaand telefoongesprek',
        'Phone Call Inbound' => 'Inkomend telefoongesprek',
        'Reminder Reached' => 'Moment van herinnering bereikt',
        'Reminder Tickets' => 'Tickets met herinnering',
        'Escalated Tickets' => 'Geëscaleerde tickets',
        'New Tickets' => 'Nieuwe tickets',
        'Open Tickets / Need to be answered' => 'Open tickets / wachtend op antwoord',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            'Alle open tickets. Aan deze tickets is al gewerkt, maar moeten nog een antwoord krijgen.',
        'All new tickets, these tickets have not been worked on yet' => 'Alle nieuwe tickets. Aan deze tickets is nog niet gewerkt',
        'All escalated tickets' => 'Alle geëscaleerde tickets',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Alle tickets met een herinnering waarbij het herinnermoment is bereikt',
        'Archived tickets' => 'Gearchiveerde tickets',
        'Unarchived tickets' => 'Ongearchiveerde tickets',
        'History::Move' => 'Ticket verplaatst naar wachtrij "%s" (%s) van wachtrij "%s" (%s).',
        'History::TypeUpdate' => 'Type gewijzigd naar %s (ID=%s).',
        'History::ServiceUpdate' => 'Service gewijzigd naar %s (ID=%s).',
        'History::SLAUpdate' => 'SLA gewijzigd naar %s (ID=%s).',
        'History::NewTicket' => 'Nieuw ticket [%s] aangemaakt (Q=%s;P=%s;S=%s).',
        'History::FollowUp' => 'Vervolg vraag voor [%s]. %s',
        'History::SendAutoReject' => 'Automatische afwijzing verstuurd aan "%s".',
        'History::SendAutoReply' => 'Automatische beantwoording verstuurd aan "%s".',
        'History::SendAutoFollowUp' => 'Automatische melding verstuurd aan "%s".',
        'History::Forward' => 'Doorgestuurd aan "%s".',
        'History::Bounce' => 'Gebounced naar "%s".',
        'History::SendAnswer' => 'E-mail verstuurd aan "%s".',
        'History::SendAgentNotification' => '"%s" melding verstuurd aan "%s".',
        'History::SendCustomerNotification' => 'Melding verstuurd aan "%s".',
        'History::EmailAgent' => 'E-mail verzonden aan gebruiker.',
        'History::EmailCustomer' => 'E-mail toegevoegd. %s',
        'History::PhoneCallAgent' => 'Klant gebeld.',
        'History::PhoneCallCustomer' => 'Klant heeft gebeld.',
        'History::AddNote' => 'Notitie toegevoegd (%s)',
        'History::Lock' => 'Ticket vergrendeld.',
        'History::Unlock' => 'Ticket ontgrendeld.',
        'History::TimeAccounting' => '%s tijdseenheden verantwoord. Nu %s tijdseenheden totaal.',
        'History::Remove' => 'Verwijderd: %s',
        'History::CustomerUpdate' => 'Bijgewerkt: %s',
        'History::PriorityUpdate' => 'Prioriteit gewijzigd van "%s" (%s) naar "%s" (%s).',
        'History::OwnerUpdate' => 'Nieuwe eigenaar is "%s" (ID=%s).',
        'History::LoopProtection' => 'Lus beveiliging! Geen automatisch antwoord verstuurd aan "%s".',
        'History::Misc' => '%s',
        'History::SetPendingTime' => 'Bijgewerkt: %s',
        'History::StateUpdate' => 'Oud: "%s" Nieuw: "%s"',
        'History::TicketDynamicFieldUpdate' => 'Bijgewerkt: %s=%s;%s=%s;',
        'History::WebRequestCustomer' => 'Klant stelt vraag via web.',
        'History::TicketLinkAdd' => 'Koppeling naar "%s" toegevoegd.',
        'History::TicketLinkDelete' => 'Koppeling naar "%s" verwijderd.',
        'History::Subscribe' => 'Added subscription for user "%s".',
        'History::Unsubscribe' => 'Removed subscription for user "%s".',
        'History::SystemRequest' => 'SystemRequest: "%s"',
        'History::ResponsibleUpdate' => 'Nieuwe verantwoordelijke is "%s" (ID=%s).',
        'History::ArchiveFlagUpdate' => 'Archiefstatus veranderd: "%s"',

        # Template: AAAWeekDay
        'Sun' => 'zo',
        'Mon' => 'ma',
        'Tue' => 'di',
        'Wed' => 'wo',
        'Thu' => 'do',
        'Fri' => 'vr',
        'Sat' => 'za',

        # Template: AdminAttachment
        'Attachment Management' => 'Beheer bijlagen',
        'Actions' => 'Acties',
        'Go to overview' => 'Naar het overzicht',
        'Add attachment' => 'Nieuwe bijlage',
        'List' => 'Overzicht',
        'Validity' => 'Geldigheid',
        'No data found.' => 'Geen gegevens gevonden.',
        'Download file' => 'Download bijlage',
        'Delete this attachment' => 'Verwijder bijlage',
        'Add Attachment' => 'Nieuwe bijlage',
        'Edit Attachment' => 'Bijlage bewerken',
        'This field is required.' => 'Dit veld is verplicht.',
        'or' => 'of',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Beheer automatische antwoorden',
        'Add auto response' => 'Nieuw automatisch antwoord',
        'Add Auto Response' => 'Nieuw automatisch antwoord',
        'Edit Auto Response' => 'Bewerk automatisch antwoord',
        'Response' => 'Antwoord',
        'Auto response from' => 'Automatisch antwoord van',
        'Reference' => 'Referentie',
        'You can use the following tags' => 'U kunt de volgende tags gebruiken',
        'To get the first 20 character of the subject.' => 'Voor de eerste 20 tekens van het onderwerp.',
        'To get the first 5 lines of the email.' => 'Voor de eerste vijf regels van het e-mail bericht.',
        'To get the realname of the sender (if given).' => 'Voor de echte naam van de afzender (indien beschikbaar).',
        'To get the article attribute' => 'Voor de attributen van de interactie',
        ' e. g.' => ' bijv.',
        'Options of the current customer user data' => 'Attributen van de huidige klant',
        'Ticket owner options' => 'Attributen van de ticket eigenaar',
        'Ticket responsible options' => 'Attributen van de verantwoordelijke',
        'Options of the current user who requested this action' => 'Attributen van de huidige gebruiker',
        'Options of the ticket data' => 'Attributen van het ticket',
        'Config options' => 'Attributen van de configuratie',
        'Example response' => 'Voorbeeld',

        # Template: AdminCustomerCompany
        'Customer Company Management' => 'Beheer bedrijven',
        'Wildcards like \'*\' are allowed.' => 'Wildcards zijn toegestaan.',
        'Add customer company' => 'Nieuw bedrijf',
        'Please enter a search term to look for customer companies.' => 'Typ om te zoeken naar bedrijven.',
        'Add Customer Company' => 'Bedrijf toevoegen',

        # Template: AdminCustomerUser
        'Customer Management' => 'Beheer klanten',
        'Add customer' => 'Nieuwe klant',
        'Select' => 'Selecteer',
        'Hint' => 'Opmerking',
        'Customer will be needed to have a customer history and to login via customer panel.' =>
            'Klanten zijn nodig om een historie te kunnen inzien en om in te loggen via het klantenscherm.',
        'Please enter a search term to look for customers.' => 'Typ om te zoeken naar klanten.',
        'Last Login' => 'Laatst ingelogd',
        'Add Customer' => 'Klant toevoegen',
        'Edit Customer' => 'Klant bewerken',
        'This field is required and needs to be a valid email address.' =>
            'Dit veld is verplicht en moet een geldig e-mailadres zijn.',
        'This email address is not allowed due to the system configuration.' =>
            'Dit e-mailadres is niet toegestaan.',
        'This email address failed MX check.' => 'Dit e-mailadres klopt niet.',
        'DNS problem, please check your configuration and the error log.' =>
            'DNS probleem geconstateerd. Kijk in de log voor meer details en pas uw configuratie aan.',
        'The syntax of this email address is incorrect.' => 'De syntax van dit e-mailadres klopt niet.',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => 'Beheer Klant - Groep koppelingen',
        'Notice' => 'Notitie',
        'This feature is disabled!' => 'Deze functie is niet geactiveerd.',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Gebuik deze mogelijkheid alleen als u groep-permissies voor klanten wilt gebruiken.',
        'Enable it here!' => 'Inschakelen',
        'Search for customers.' => 'Zoek naar klanten',
        'Edit Customer Default Groups' => 'Bewerk standaard groepen voor klanten',
        'These groups are automatically assigned to all customers.' => 'Deze groepen worden toegewezen aan alle klanten.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'U kunt deze groepen beheren via de optie "CustomerGroupAlwaysGroups".',
        'Filter for Groups' => 'Filter op groepen',
        'Select the customer:group permissions.' => 'Selecteer de permissies voor klant:groep.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Als niets geselecteerd is, zijn er geen permissies in deze groep (de klant zal geen tickets kunnen zien).',
        'Search Result:' => 'Zoekresultaat:',
        'Customers' => 'Klanten',
        'Groups' => 'Groepen',
        'No matches found.' => 'Niets gevonden.',
        'Change Group Relations for Customer' => 'Bewerk gekoppelde groepen voor klant',
        'Change Customer Relations for Group' => 'Bewerk gekoppelde klanten voor groep',
        'Toggle %s Permission for all' => '%s permissies aan/uit',
        'Toggle %s permission for %s' => '%s permissies aan/uit voor %s',
        'Customer Default Groups:' => 'Standaard groepen',
        'No changes can be made to these groups.' => 'Deze kunnen niet verwijderd worden.',
        'ro' => 'alleen lezen',
        'Read only access to the ticket in this group/queue.' => 'Leesrechten op de tickets in deze groep/wachtrij.',
        'rw' => 'lezen + schrijven',
        'Full read and write access to the tickets in this group/queue.' =>
            'Volledige lees- en schrijfrechten op de tickets in deze groep/wachtrij.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => 'Beheer Klant - Service koppelingen',
        'Edit default services' => 'Beheer standaard services',
        'Filter for Services' => 'Filter op services',
        'Allocate Services to Customer' => 'Koppel services aan klant',
        'Allocate Customers to Service' => 'Koppel klanten aan service',
        'Toggle active state for all' => 'Alles actief aan/uit',
        'Active' => 'Actief',
        'Toggle active state for %s' => 'Actief aan/uit voor %s',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => 'Beheer van dynamische velden',
        'Add new field for object' => 'Nieuw veld voor object',
        'To add a new field, select the field type form one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'Om een nieuw veld toe te voegen: kies een object-type uit de lijst. Deze kan na het aanmaken niet meer worden aangepast.',
        'Dynamic Fields List' => 'Lijst met dynamische velden',
        'Dynamic fields per page' => 'Dynamische velden per pagina',
        'Label' => 'Label',
        'Order' => 'Volgorde',
        'Object' => 'Object',

        # Template: AdminDynamicFieldCheckbox
        'Dynamic Fields' => 'Dynamische velden',
        'Field' => 'Veld',
        'Go back to overview' => 'Terug naar het overzicht',
        'General' => 'Algemeen',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Dit veld is verplicht. Het kan aleen alfanumerieke tekens bevatten.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Moet uniek zijn en kan alleen alfanumerieke tekens bevatten.',
        'Changing this value will require manual changes in the system.' =>
            'Na aanpassen van deze waarde zijn handmatige aanpassingen in het systeem nodig.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Deze naam wordt getoond in de schermen waar dit veld actief is.',
        'Field order' => 'Veldvolgorde',
        'This field is required and must be numeric.' => 'Dit veld is verplicht en moet numeriek zijn.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Dit is de volgorde waarin de velden worden weergegeven op de schermen waar ze geactiveerd zijn.',
        'Field type' => 'Veldtype',
        'Object type' => 'Objecttype',
        'Field Settings' => 'Veld-instellingen',
        'Default value' => 'Standaard waarde',
        'This is the default value for this field.' => 'Dit is de standaard-waarde voor dit veld.',
        'Save' => 'Opslaan',

        # Template: AdminDynamicFieldDateTime
        'Default date difference' => 'Standaard verschil met huidige datum',
        'This field must be numeric.' => 'Dit veld moet numeriek zijn.',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'Het verschil tot de huidige tijd (in seconden) ten behoeve van de standaard waarde van dit veld.',
        'Define years period' => 'Geef mogelijke periode',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            'Activeer deze feature om een minimale en maximale waarde te kiezen in het jaar-veld van de datum.',
        'Years in the past' => 'Jaren in het verleden',
        'Years in the past to display (default: 5 years).' => '(standaard: 5 jaar).',
        'Years in the future' => 'Jaren in de toekomst',
        'Years in the future to display (default: 5 years).' => '(standaard: 5 jaar).',
        'Show link' => 'Toon koppeling',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'Hier kunt u een optionele hyperlink opgeven die getoond wordt in de overzichten en zoom-schermen.',

        # Template: AdminDynamicFieldDropdown
        'Possible values' => 'Mogelijke waarden',
        'Key' => 'Sleutel',
        'Value' => 'Waarde',
        'Remove value' => 'Waarde verwijderen',
        'Add value' => 'Waarde toevoegen',
        'Add Value' => 'Waarde toevoegen',
        'Add empty value' => '',
        'Activate this option to create an empty selectable value.' => 'Activeer deze optie om een lege selecteerbare waarde toe te voeten.',
        'Translatable values' => 'Waarden zijn vertaalbaar',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Als u deze optie activeerd zullen de waarden vertaald worden in de taal van de eindgebruiker.',
        'Note' => 'Notitie',
        'You need to add the translations manually into the language translation files.' =>
            'U moet de vertalingen zelf toevoegen aan de vertalingsbestanden.',

        # Template: AdminDynamicFieldMultiselect

        # Template: AdminDynamicFieldText
        'Number of rows' => 'Aantal regels',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'Geef de hoogte van het invoervak voor dit veld (in regels)',
        'Number of cols' => 'Aantal kolommen',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'Geef de breedte van het invoervak voor dit veld (in kolommen)',

        # Template: AdminEmail
        'Admin Notification' => 'Melding van de beheerder',
        'With this module, administrators can send messages to agents, group or role members.' =>
            'Vanuit dit scherm kunt u een bericht sturen aan gebruikers of klanten.',
        'Create Administrative Message' => 'Stuur een bericht',
        'Your message was sent to' => 'Uw bericht is verstuurd aan',
        'Send message to users' => 'Stuur bericht aan gebruikers',
        'Send message to group members' => 'Stuur bericht aan gebruikers met groep',
        'Group members need to have permission' => 'Leden van de groep moeten permissies hebben',
        'Send message to role members' => 'Stuur bericht naar gebruikers met rol',
        'Also send to customers in groups' => 'Stuur ook naar klanten in deze groepen',
        'Body' => 'Bericht tekst',
        'Send' => 'Verstuur',

        # Template: AdminGenericAgent
        'Generic Agent' => 'Automatische Taken',
        'Add job' => 'Taak toevoegen',
        'Last run' => 'Laatst uitgevoerd',
        'Run Now!' => 'Nu uitvoeren',
        'Delete this task' => 'Verwijder deze taak',
        'Run this task' => 'Voer deze taak',
        'Job Settings' => 'Taak instellingen',
        'Job name' => 'Naam',
        'Currently this generic agent job will not run automatically.' =>
            'Deze taak zal niet automatisch draaien.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Om automatisch uit te voeren selecteer ten minste één waarde bij minuten, uren en dagen.',
        'Schedule minutes' => 'minuten',
        'Schedule hours' => 'uren',
        'Schedule days' => 'dagen',
        'Toggle this widget' => 'Klap in/uit',
        'Ticket Filter' => 'Ticket filter',
        '(e. g. 10*5155 or 105658*)' => '(bijvoorbeeld 10*5155 or 105658*)',
        '(e. g. 234321)' => '(bijvoorbeeld 234321)',
        'Customer login' => 'Klant login',
        '(e. g. U5150)' => '(bijvoorbeeld U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Zoek in tekst van een interactie. Gebruik wildcards (bijvoorbeeld "Mar*in" of "Jans*").',
        'Agent' => 'Gebruiker',
        'Ticket lock' => 'Vergrendeling',
        'Create times' => 'Tijdstip van aanmaken',
        'No create time settings.' => 'Alle',
        'Ticket created' => 'Ticket aangemaakt',
        'Ticket created between' => 'Ticket aangemaakt tussen',
        'Change times' => 'Tijdstip van wijzigen',
        'No change time settings.' => 'Alle',
        'Ticket changed' => 'Ticket gewijzigd',
        'Ticket changed between' => 'Ticket gewijzigd tussen',
        'Close times' => 'Tijdstip van sluiten',
        'No close time settings.' => 'Alle',
        'Ticket closed' => 'Ticket gesloten',
        'Ticket closed between' => 'Ticket gesloten tussen',
        'Pending times' => 'Tijdstip van wachten',
        'No pending time settings.' => 'Niet op zoeken',
        'Ticket pending time reached' => 'Ticket wachtend tot tijd bereikt',
        'Ticket pending time reached between' => 'Ticket wachtend tot tijd tussen',
        'Escalation times' => 'Tijdstip van escalatie',
        'No escalation time settings.' => 'Niet op zoeken',
        'Ticket escalation time reached' => 'Escalatiemoment bereikt',
        'Ticket escalation time reached between' => 'Escalatiemoment bereikt tussen',
        'Escalation - first response time' => 'Escalatie - eerste reactietijd',
        'Ticket first response time reached' => 'Escalatiemoment eerste reactie bereikt',
        'Ticket first response time reached between' => 'Escalatiemoment eerste reactie bereikt tussen',
        'Escalation - update time' => 'Escalatie - tijd van bijwerken',
        'Ticket update time reached' => 'Escalatiemoment - tijd van bijwerken bereikt',
        'Ticket update time reached between' => 'Escalatiemoment - tijd van bijwerken bereikt tussen',
        'Escalation - solution time' => 'Escalatie - tijd van oplossen',
        'Ticket solution time reached' => 'Escalatiemoment - tijd van oplossen bereikt',
        'Ticket solution time reached between' => 'Escalatiemoment - tijd van oplossen bereikt tussen',
        'Archive search option' => 'Zoek in archief',
        'Ticket Action' => 'Bewerk ticket',
        'Set new service' => 'Nieuwe service',
        'Set new Service Level Agreement' => 'Nieuwe Service Level Agreement',
        'Set new priority' => 'Nieuwe prioriteit',
        'Set new queue' => 'Nieuwe wachtrij',
        'Set new state' => 'Nieuwe status',
        'Set new agent' => 'Nieuwe gebruiker',
        'new owner' => 'nieuwe eigenaar',
        'new responsible' => 'nieuwe verantwoordelijke',
        'Set new ticket lock' => 'Nieuwe vergrendeling',
        'New customer' => 'Nieuwe klant',
        'New customer ID' => 'Nieuwe klantcode',
        'New title' => 'Nieuwe titel',
        'New type' => 'Nieuw type',
        'New Dynamic Field Values' => '',
        'Archive selected tickets' => 'Archiveer geselecteerde tickets',
        'Add Note' => 'Notitie toevoegen',
        'Time units' => 'Bestede tijd',
        ' (work units)' => ' (in minuten)',
        'Ticket Commands' => 'Geavanceerd',
        'Send agent/customer notifications on changes' => 'Stuur gebruiker/klant een melding bij wijzigingen',
        'CMD' => 'Commando',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Dit commando zal worden uitgevoerd. ARG[0] is het nieuwe ticketnummer. ARG[1] is het nieuwe ticketid.',
        'Delete tickets' => 'Verwijder tickets.',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Waarschuwing: alle geselecteerde tickets worden verwijderd uit de database en kunnen niet terug worden geplaatst.',
        'Execute Custom Module' => 'Start externe module',
        'Param %s key' => 'Parameter %s sleutel',
        'Param %s value' => 'Parameter %s waarde',
        'Save Changes' => 'Wijzigingen opslaan',
        'Results' => 'Resultaten',
        '%s Tickets affected! What do you want to do?' => '%s tickets gevonden! Wat wilt u doen?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Waarschuwing: u hebt voor VERWIJDEREN gekozen!',
        'Edit job' => 'Bewerk taak',
        'Run job' => 'Voer taak uit',
        'Affected Tickets' => 'Gevonden tickets',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => 'GenericInterface Debugger voor webservice %s',
        'Web Services' => 'Webservices',
        'Debugger' => 'Debugger',
        'Go back to web service' => 'Ga terug naar webservice',
        'Clear' => 'Leegmaken',
        'Do you really want to clear the debug log of this web service?' =>
            'Wilt u de debug-log van deze webservice leegmaken?',
        'Request List' => 'Lijst van verzoeken',
        'Time' => 'Tijd',
        'Remote IP' => 'IP-adres afzender',
        'Loading' => 'Laden',
        'Select a single request to see its details.' => 'Kies een verzoek om de details te zien.',
        'Filter by type' => 'Filter op type',
        'Filter from' => 'Filter op afzender',
        'Filter to' => 'Filter op bestemming',
        'Filter by remote IP' => 'Filter op IP-adres',
        'Refresh' => 'Vernieuwen',
        'Request Details' => 'Details verzoek',
        'An error occurred during communication.' => 'Er is een fout opgetreden tijdens de communicatie.',
        'Show or hide the content' => 'Toon of verberg de inhoud',
        'Clear debug log' => 'Leeg debug-log.',

        # Template: AdminGenericInterfaceInvokerDefault
        'Add new Invoker to Web Service %s' => 'Nieuwe Invoker toevoegen aan webservice %s',
        'Change Invoker %s of Web Service %s' => 'Wijzig Invoker %s voor webservice %s',
        'Add new invoker' => 'Nieuwe invoker toevoegen',
        'Change invoker %s' => 'Wijzig invoker %s',
        'Do you really want to delete this invoker?' => 'Wilt u deze invoker echt verwijderen?',
        'All configuration data will be lost.' => 'Alle configuratiedata gaat verloren.',
        'Invoker Details' => 'Invoker details',
        'The name is typically used to call up an operation of a remote web service.' =>
            'De naam wordt gebruikt om een operatie van een webservice aan te roepen.',
        'Please provide a unique name for this web service invoker.' => 'Geef een unieke naam voor deze web service invoker.',
        'The name you entered already exists.' => 'De naam die u hebt opgegeven bestaat al.',
        'Invoker backend' => 'Invoker backend',
        'This OTRS invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            '',
        'Mapping for outgoing request data' => 'Mapping voor uitgaande data.',
        'Configure' => 'Configureer',
        'The data from the invoker of OTRS will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'De data van de invoker van OTRS wordt verwerkt door deze mapping om het om te zetten in het formaat wat het communicerende systeem verwacht.',
        'Mapping for incoming response data' => 'Koppeling voor inkomende response-data',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of OTRS expects.' =>
            '',
        'Event Triggers' => 'Event triggers',
        'Asynchronous' => 'Asynchroon',
        'Delete this event' => 'Verwijder dit event',
        'This invoker will be triggered by the configured events.' => '',
        'Do you really want to delete this event trigger?' => 'Wilt u deze event trigger verwijderen?',
        'Add Event Trigger' => 'Nieuwe event trigger toevoegen',
        'To add a new event select the event object and event name and click on the "+" button' =>
            '',
        'Asynchronous event triggers are handled by the OTRS Scheduler in background (recommended).' =>
            '',
        'Synchronous event triggers would be processed directly during the web request.' =>
            '',
        'Save and continue' => 'Opslaan en doorgaan',
        'Save and finish' => 'Opslaan en voltooien',
        'Delete this Invoker' => 'Verwijder deze invoker',
        'Delete this Event Trigger' => 'Verwijder deze event trigger.',

        # Template: AdminGenericInterfaceMappingSimple
        'GenericInterface Mapping Simple for Web Service %s' => '',
        'Go back to' => 'Ga terug naar',
        'Mapping Simple' => 'Eenvoudige koppeling',
        'Default rule for unmapped keys' => 'Standaardregel voor nietgekoppelde sleutels',
        'This rule will apply for all keys with no mapping rule.' => '',
        'Default rule for unmapped values' => 'Standaardregel voor nietgekoppelde waarden',
        'This rule will apply for all values with no mapping rule.' => '',
        'New key map' => 'Nieuwe sleutelkoppeling',
        'Add key mapping' => 'Voeg sleutelkoppeling toe',
        'Mapping for Key ' => 'Koppeling voor sleutel',
        'Remove key mapping' => 'Verwijder sleutelkoppeling',
        'Key mapping' => 'Sleutelkoppeling',
        'Map key' => 'Koppel sleutel',
        'matching the' => 'die overeenkomen met',
        'to new key' => 'aan nieuwe sleutel',
        'Value mapping' => 'Waardekoppeling',
        'Map value' => 'Koppel waarde',
        'to new value' => 'aan nieuwe waarde',
        'Remove value mapping' => 'Verwijder waardekoppeling',
        'New value map' => 'Nieuwe waardekoppeling',
        'Add value mapping' => 'Voeg waardekoppeling toe',
        'Do you really want to delete this key mapping?' => 'Deze sleutelkoppeling verwijderen?',
        'Delete this Key Mapping' => 'Verwijder sleutelkoppeling',

        # Template: AdminGenericInterfaceOperationDefault
        'Add new Operation to Web Service %s' => '',
        'Change Operation %s of Web Service %s' => '',
        'Add new operation' => 'Nieuwe operatie toevoegen',
        'Change operation %s' => 'Verander operatie %s',
        'Do you really want to delete this operation?' => '',
        'Operation Details' => '',
        'The name is typically used to call up this web service operation from a remote system.' =>
            '',
        'Please provide a unique name for this web service.' => '',
        'Mapping for incoming request data' => '',
        'The request data will be processed by this mapping, to transform it to the kind of data OTRS expects.' =>
            '',
        'Operation backend' => 'Operatie-backend',
        'This OTRS operation backend module will be called internally to process the request, generating data for the response.' =>
            '',
        'Mapping for outgoing response data' => '',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            '',
        'Delete this Operation' => '',

        # Template: AdminGenericInterfaceTransportHTTPSOAP
        'GenericInterface Transport HTTP::SOAP for Web Service %s' => '',
        'Network transport' => '',
        'Properties' => 'Eigenschappen',
        'Endpoint' => 'Eindpunt',
        'URI to indicate a specific location for accessing a service.' =>
            '',
        'e.g. http://local.otrs.com:8000/Webservice/Example' => '',
        'Namespace' => '',
        'URI to give SOAP methods a context, reducing ambiguities.' => '',
        'e.g urn:otrs-com:soap:functions or http://www.otrs.com/GenericInterface/actions' =>
            '',
        'Maximum message length' => '',
        'This field should be an integer number.' => '',
        'Here you can specify the maximum size (in bytes) of SOAP messages that OTRS will process.' =>
            '',
        'Encoding' => '',
        'The character encoding for the SOAP message contents.' => '',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => '',
        'SOAPAction' => '',
        'Set to "Yes" to send a filled SOAPAction header.' => '',
        'Set to "No" to send an empty SOAPAction header.' => '',
        'SOAPAction separator' => '',
        'Character to use as separator between name space and SOAP method.' =>
            '',
        'Usually .Net web services uses a "/" as separator.' => '',
        'Authentication' => '',
        'The authentication mechanism to access the remote system.' => '',
        'A "-" value means no authentication.' => '',
        'The user name to be used to access the remote system.' => '',
        'The password for the privileged user.' => '',

        # Template: AdminGenericInterfaceWebservice
        'GenericInterface Web Service Management' => '',
        'Add web service' => 'Webservice toevoegen',
        'Clone web service' => 'Kloon webservice',
        'The name must be unique.' => '',
        'Clone' => 'Kloon',
        'Export web service' => 'Exporteer webservice',
        'Import web service' => 'Importeer webservice',
        'Configuration File' => 'Configuratiebestand',
        'The file must be a valid web service configuration YAML file.' =>
            '',
        'Import' => 'Importeer',
        'Configuration history' => 'Configuratiegeschiedenis',
        'Delete web service' => 'Verwijder webservice',
        'Do you really want to delete this web service?' => 'Wilt u deze webservice verwijderen?',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            '',
        'If you want to return to overview please click the "Go to overview" button.' =>
            '',
        'Web Service List' => 'Webservice-overzicht',
        'Remote system' => 'Ander systeem',
        'Provider transport' => 'Provider-transport',
        'Requester transport' => 'Requester-transport',
        'Details' => 'Details',
        'Debug threshold' => 'Debug-niveau',
        'In provider mode, OTRS offers web services which are used by remote systems.' =>
            '',
        'In requester mode, OTRS uses web services of remote systems.' =>
            '',
        'Operations are individual system functions which remote systems can request.' =>
            '',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            '',
        'Controller' => '',
        'Inbound mapping' => 'Inkomende koppeling',
        'Outbound mapping' => 'Uitgaande koppeling',
        'Delete this action' => '',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            '',
        'Delete webservice' => 'Verwijder webservice',
        'Delete operation' => '',
        'Delete invoker' => '',
        'Clone webservice' => 'Kloon webservice',
        'Import webservice' => 'Importeer webservice',

        # Template: AdminGenericInterfaceWebserviceHistory
        'GenericInterface Configuration History for Web Service %s' => 'GenericInterface Configuratie-geschiedenis voor webservice %s',
        'Go back to Web Service' => 'Ga terug naar webservice',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            '',
        'Configuration History List' => 'Configuratie-geschiedenis',
        'Version' => 'Versie',
        'Create time' => 'Aanmaaktijd',
        'Select a single configuration version to see its details.' => 'Selecteer een configuratie-versie om de details te bekijken.',
        'Export web service configuration' => 'Exporteer webserviceconfiguratie',
        'Restore web service configuration' => 'Herstel webserviceconfiguratie',
        'Do you really want to restore this version of the web service configuration?' =>
            'Wilt u echt deze versie van de webservice-configuratie herstellen?',
        'Your current web service configuration will be overwritten.' => 'De huidige webservice-configuratie zal worden overschreven.',
        'Show or hide the content.' => 'Toon of verberg de inhoud.',
        'Restore' => 'Herstellen',

        # Template: AdminGroup
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'WAARSCHUWING: Als u de naam van de groep \'admin\'aanpast voordat u de bijbehorende wijzigingen in de Systeemconfiguratie heeft aangebracht, zult u geen beheer-permissies meer hebben in OTRS. Als dit gebeurt, moet u de naam van de groep aanpassen met een SQL statement.',
        'Group Management' => 'Groepenbeheer',
        'Add group' => 'Groep toevoegen',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Leden van de groep Admin mogen in het administratie gedeelte, leden van de groep Stats hebben toegang tot het statistieken gedeelte.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Maak nieuwe groepen aan om tickets te kunnen scheiden en wachtrijen aan de juiste gebruikers te tonen (bijv. support, sales, management).',
        'It\'s useful for ASP solutions. ' => 'Bruikbaar voor ASP situaties.',
        'Add Group' => 'Groep toevoegen',
        'Edit Group' => 'Bewerk groep',

        # Template: AdminLog
        'System Log' => 'Logboek',
        'Here you will find log information about your system.' => 'Hier is de OTRS log te raadplegen.',
        'Hide this message' => 'Verberg dit paneel',
        'Recent Log Entries' => 'Recente Logboekregels',

        # Template: AdminMailAccount
        'Mail Account Management' => 'Beheer e-mail accounts',
        'Add mail account' => 'E-mail account toevoegen',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Alle binnenkomende e-mails van een account zullen standaard geplaatst worden in de opgegeven wachtrij.',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Als het account gemarkeerd is als \'vertrouwd\' worden al bestaande X-OTRS headers bij aankomst gebruikt. Hierna worden de e-mail filters doorlopen.',
        'Host' => 'Server',
        'Delete account' => 'Verwijder account',
        'Fetch mail' => 'Mail ophalen',
        'Add Mail Account' => 'Mail account toevoegen',
        'Example: mail.example.com' => 'Bijvoorbeeld: mail.example.com',
        'IMAP Folder' => 'IMAP folder',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'Alleen aanpassen als u uit een andere folder dan INBOX mails wilt ophalen.',
        'Trusted' => 'Vertrouwd',
        'Dispatching' => 'Sortering',
        'Edit Mail Account' => 'Bewerk mail account',

        # Template: AdminNavigationBar
        'Admin' => 'Beheer',
        'Agent Management' => 'Beheer gebruikers',
        'Queue Settings' => 'Wachtrij instellingen',
        'Ticket Settings' => 'Ticket instellingen',
        'System Administration' => 'Beheer systeem',

        # Template: AdminNotification
        'Notification Management' => 'Melding beheer',
        'Select a different language' => 'Kies een andere taal',
        'Filter for Notification' => 'Filter op meldingen',
        'Notifications are sent to an agent or a customer.' => 'Meldingen worden verstuurd naar een gebruiker.',
        'Notification' => 'Melding',
        'Edit Notification' => 'Bewerk melding',
        'e. g.' => 'bijv.',
        'Options of the current customer data' => 'Attributen van de klant',

        # Template: AdminNotificationEvent
        'Add notification' => 'Melding toevoegen',
        'Delete this notification' => 'Melding verwijderen',
        'Add Notification' => 'Melding toevoegen',
        'Recipient groups' => 'Ontvanger groepen',
        'Recipient agents' => 'Ontvanger gebruikers',
        'Recipient roles' => 'Ontvanger rollen',
        'Recipient email addresses' => 'Ontvanger e-mailadressen',
        'Article type' => 'Soort interactie',
        'Only for ArticleCreate event' => 'Alleen bij ArticleCreate gebeurtenis',
        'Subject match' => 'Onderwerp',
        'Body match' => 'Bericht tekst',
        'Include attachments to notification' => 'Voeg bijlagen toe aan melding',
        'Notification article type' => 'Interactiesoort voor melding',
        'Only for notifications to specified email addresses' => 'Alleen voor meldingen aan een specifiek e-mail adres',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Om de eerste 20 karakters van het onderwerp van de nieuwste gebruikers-interactie te tonen.',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Om de eerste vijf regels van de tekst van de nieuwste gebruikers-interactie te tonen.',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Om de eerste 20 karakters van het onderwerp van de nieuwste klant-interactie te tonen.',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Om de eerste vijf regels van de tekst van de nieuwste klant-interactie te tonen.',

        # Template: AdminPGP
        'PGP Management' => 'PGP beheer',
        'Use this feature if you want to work with PGP keys.' => 'Gebruik deze feature als u e-mail wilt versleutelen met PGP.',
        'Add PGP key' => 'PGP sleutel toevoegen',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'Hier kunt u de keyring beheren die is ingesteld in de systeemconfiguratie.',
        'Introduction to PGP' => 'Introductie tot PGP',
        'Result' => 'Resultaat',
        'Identifier' => 'Identifier',
        'Bit' => 'Bit',
        'Fingerprint' => 'Fingerprint',
        'Expires' => 'Verloopt',
        'Delete this key' => 'Verwijder deze sleutel',
        'Add PGP Key' => 'PGP sleutel toevoegen',
        'PGP key' => 'PGP sleutel',

        # Template: AdminPackageManager
        'Package Manager' => 'Pakketbeheer',
        'Uninstall package' => 'Verwijder pakket',
        'Do you really want to uninstall this package?' => 'Wilt u dit pakket echt verwijderen?',
        'Reinstall package' => 'Herinstalleer pakket',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'Wilt u dit pakket echt herinstalleren? Eventuele handmatige aanpassingen gaan verloren.',
        'Continue' => 'Doorgaan',
        'Install' => 'Installeer',
        'Install Package' => 'Installeer pakket',
        'Update repository information' => 'Vernieuw repository gegevens',
        'Did not find a required feature? OTRS Group provides their subscription customers with exclusive Add-Ons:' =>
            'Heeft u een feature niet kunnen vinden? De OTRS Groep levert add-ons voor klanten met een subscription:',
        'Online Repository' => 'Online Repository',
        'Vendor' => 'Leverancier',
        'Module documentation' => 'Moduledocumentatie',
        'Upgrade' => 'Upgrade',
        'Local Repository' => 'Lokale Repository',
        'Uninstall' => 'Verwijder',
        'Reinstall' => 'Herinstalleer',
        'Download package' => 'Download pakket',
        'Rebuild package' => 'Genereer pakket opnieuw',
        'Metadata' => 'Metadata',
        'Change Log' => 'Wijzigingen',
        'Date' => 'Datum',
        'List of Files' => 'Overzicht van bestanden',
        'Permission' => 'Permissie',
        'Download' => 'Downloaden',
        'Download file from package!' => 'Download bestand van pakket.',
        'Required' => 'Verplicht',
        'PrimaryKey' => 'Primaire sleutel',
        'AutoIncrement' => 'AutoIncrement',
        'SQL' => 'SQL statement',
        'File differences for file %s' => 'Verschillen in bestand %s',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Performance log',
        'This feature is enabled!' => 'Deze functie is ingeschakeld.',
        'Just use this feature if you want to log each request.' => 'Activeer de Performance Log alleen als u ieder verzoek wilt loggen.',
        'Activating this feature might affect your system performance!' =>
            'Deze functie gaat zelf ook een beetje ten koste van de performance.',
        'Disable it here!' => 'Uitschakelen',
        'Logfile too large!' => 'Logbestand te groot.',
        'The logfile is too large, you need to reset it' => 'Het logbestand is te groot, u moet het resetten',
        'Overview' => 'Overzicht',
        'Range' => 'Bereik',
        'Interface' => 'Interface',
        'Requests' => 'Verzoeken',
        'Min Response' => 'Minimaal',
        'Max Response' => 'Maximaal',
        'Average Response' => 'Gemiddelde',
        'Period' => 'Looptijd',
        'Min' => 'Min',
        'Max' => 'Max',
        'Average' => 'Gemiddeld',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'E-mail filterbeheer',
        'Add filter' => 'Nieuw filter',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Om inkomende e-mails te routeren op basis van e-mail headers. Matching op tekst of met behulp van regular expressions.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Als u alleen wilt filteren op het e-mailadres, gebruik dan EMAILADDRESS:info@example.local in Van, Aan of CC.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Als u regular expressions gebruikt dan kunt u ook de gevonden waarde tussen haakjes () gebruiken als [***] in de \'Set\' actie.',
        'Delete this filter' => 'Verwijder filter',
        'Add PostMaster Filter' => 'Nieuw e-mail filter',
        'Edit PostMaster Filter' => 'Bewerk e-mail filter',
        'Filter name' => 'Filter naam',
        'The name is required.' => 'De naam is verplicht.',
        'Stop after match' => 'Stop met filters na match',
        'Filter Condition' => 'Filter conditie',
        'The field needs to be a valid regular expression or a literal word.' =>
            'Dit veld kan een woord bevatten of een regular expression.',
        'Set Email Headers' => 'Nieuwe waarden',
        'The field needs to be a literal word.' => 'Dit veld moet een letterlijke waarde bevatten.',

        # Template: AdminPriority
        'Priority Management' => 'Prioriteitenbeheer',
        'Add priority' => 'Nieuwe prioriteit',
        'Add Priority' => 'Nieuwe prioriteit',
        'Edit Priority' => 'Bewerk prioriteit',

        # Template: AdminQueue
        'Manage Queues' => 'Wachtrijenbeheer',
        'Add queue' => 'Nieuwe wachtrij',
        'Add Queue' => 'Nieuwe wachtrij',
        'Edit Queue' => 'Bewerk wachtrij',
        'Sub-queue of' => 'Onderdeel van',
        'Unlock timeout' => 'Ontgrendel tijdsoverschrijding',
        '0 = no unlock' => '0 = geen ontgrendeling',
        'Only business hours are counted.' => 'Alleen openingstijden tellen mee.',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Als een ticket vergrendeld is en de gebruiker handelt het ticket niet af voor het verstrijken van de tijdsoverschrijding, dan wordt het ticket automatisch ontgrendeld en komt deze weer beschikbaar voor andere gebruikers.',
        'Notify by' => 'Melding bij',
        '0 = no escalation' => '0 = geen escalatie',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Als er geen klant naam, het externe e-mail of telefoon, bekend is voor de hier ingestelde tijd dan wordt het ticket geëscaleerd.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Als er iets wordt toegevoegd aan het ticket, b.v. een reactie per e-mail of via het web, dan zal de escalatie update tijd worden gereset. Als er geen klantencontact plaatsvindt, per e-mail of telefoon, voor de hier gedefiniëerde tijd, dan wordt het ticket geëscaleerd.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Als het ticket niet is afgesloten voor de hier gedefiniëerde tijd, dan wordt het ticket geëscaleerd.',
        'Follow up Option' => 'Reactie optie',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Bepaalt of reacties op gesloten tickets zorgen voor heropenen voor het ticket, geweigerd wordt, of een nieuw ticket genereert.',
        'Ticket lock after a follow up' => 'Ticket wordt vergrendeld na een reactie',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Als een ticket gesloten is en de klant een reactie stuurt dan wordt het ticket gekoppeld aan de oude eigenaar.',
        'System address' => 'Systeem adres',
        'Will be the sender address of this queue for email answers.' => 'Is het afzenderadres van deze wachtrij voor antwoorden per e-mail.',
        'Default sign key' => 'Standaard sleutel voor ondertekening.',
        'The salutation for email answers.' => 'De aanhef voor beantwoording van berichten per e-mail.',
        'The signature for email answers.' => 'De ondertekening voor beantwoording van berichten per e-mail.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => 'Beheer Wachtrij - Automatische antwoorden koppelingen',
        'Filter for Queues' => 'Filter op wachtrijen',
        'Filter for Auto Responses' => 'Filter op automatische antwoorden',
        'Auto Responses' => 'Automatische antwoorden',
        'Change Auto Response Relations for Queue' => 'Bewerk automatische antwoorden voor wachtrij',
        'settings' => 'instellingen',

        # Template: AdminQueueResponses
        'Manage Response-Queue Relations' => 'Beheer Antwoord - Wachtrij koppelingen',
        'Filter' => 'Filter',
        'Filter for Responses' => 'Filter op antwoorden',
        'Responses' => 'Standaard-antwoorden',
        'Change Queue Relations for Response' => 'Bewerk gekoppelde wachtrijen voor antwoord',
        'Change Response Relations for Queue' => 'Bewerk gekoppelde antwoorden voor wachtrij',

        # Template: AdminResponse
        'Manage Responses' => 'Beheer Antwoorden',
        'Add response' => 'Nieuw antwoord',
        'A response is default text to write faster answer (with default text) to customers.' =>
            'Een antwoord is een standaard tekst om sneller berichten te kunnen opstellen naar klanten.',
        'Don\'t forget to add a new response a queue!' => 'vergeet niet om een antwoord aan een wachtrij te koppelen.',
        'Delete this entry' => 'Verwijder antwoord',
        'Add Response' => 'Nieuw antwoord',
        'Edit Response' => 'Bewerk antwoord',
        'The current ticket state is' => 'De huidige ticketstatus is',
        'Your email address is' => 'Uw e-mailadres is',

        # Template: AdminResponseAttachment
        'Manage Responses <-> Attachments Relations' => 'Beheer Antwoorden <-> Bijlagen',
        'Filter for Attachments' => 'Filter op bijlagen',
        'Change Response Relations for Attachment' => 'Bewerk gekoppelde antwoorden voor attachment',
        'Change Attachment Relations for Response' => 'Bewerk gekoppelde attachments voor antwoord',
        'Toggle active for all' => 'Actief aan/uit voor alles',
        'Link %s to selected %s' => 'Koppel %s aan %s',

        # Template: AdminRole
        'Role Management' => 'Beheer rollen',
        'Add role' => 'Nieuwe rol',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Maak een nieuwe rol en koppel deze aan groepen. Vervolgens kunt u rollen toewijzen aan gebruikers.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'Er zijn geen rollen gedefiniëerd. Maak een nieuwe aan.',
        'Add Role' => 'Nieuwe rol',
        'Edit Role' => 'Bewerk rol',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => 'Beheer Rol-Groep koppelingen',
        'Filter for Roles' => 'Filter op rollen',
        'Roles' => 'Rollen',
        'Select the role:group permissions.' => 'Selecteer de rol-groep permissies.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Als niets is geselecteerd, heeft deze rol geen permissies op deze groep.',
        'Change Role Relations for Group' => 'Bewerk gekoppelde rollen voor groep',
        'Change Group Relations for Role' => 'Bewerk gekoppelde groepen voor rol',
        'Toggle %s permission for all' => 'Permissies %s aan/uit',
        'move_into' => 'verplaats naar',
        'Permissions to move tickets into this group/queue.' => 'Permissies om tickets naar deze groep/wachtrij te verplaatsen.',
        'create' => 'aanmaken',
        'Permissions to create tickets in this group/queue.' => 'Permissies om tickets in deze groep/wachtrij aan te maken.',
        'priority' => 'prioriteit',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Permissies om de prioriteit van een ticket in deze groep/wachtrij te wijzigen.',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => 'Beheer Gebruiker-Rol koppelingen',
        'Filter for Agents' => 'Filter op gebruikers',
        'Agents' => 'Gebruikers',
        'Manage Role-Agent Relations' => 'Beheer Rol-Gebruiker koppelingen',
        'Change Role Relations for Agent' => 'Bewerk gekoppelde rollen voor gebruiker',
        'Change Agent Relations for Role' => 'Bewerk gekoppelde gebruikers voor rol',

        # Template: AdminSLA
        'SLA Management' => 'SLA beheer',
        'Add SLA' => 'Nieuwe SLA',
        'Edit SLA' => 'Bewerk SLA',
        'Please write only numbers!' => 'Gebruik alleen cijfers.',

        # Template: AdminSMIME
        'S/MIME Management' => 'S/MIME beheer',
        'Add certificate' => 'Nieuw certificaat',
        'Add private key' => 'Private sleutel toevoegen',
        'Filter for certificates' => 'Filter op certificaten',
        'Filter for SMIME certs' => 'Filter op SMIME certificaten',
        'Here you can add relations to your private certificate, these will be embedded to the SMIME signature every time you use this certificate to sign an email.' =>
            '',
        'See also' => 'Zie voor meer informatie',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'Hier kunt u de certificaten en private sleutels van OTRS beheren.',
        'Hash' => 'Hash',
        'Create' => 'Aanmaken',
        'Handle related certificates' => '',
        'Delete this certificate' => 'Verwijder certificaat',
        'Add Certificate' => 'Nieuw certificaat',
        'Add Private Key' => 'Nieuwe private sleutel',
        'Secret' => 'Geheim',
        'Related Certificates for' => '',
        'Delete this relation' => '',
        'Available Certificates' => '',
        'Relate this certificate' => '',

        # Template: AdminSalutation
        'Salutation Management' => 'Beheer aanheffen',
        'Add salutation' => 'Nieuwe aanhef',
        'Add Salutation' => 'Nieuwe aanhef',
        'Edit Salutation' => 'Bewerk aanhef',
        'Example salutation' => 'Aanhef voorbeeld',

        # Template: AdminScheduler
        'This option will force Scheduler to start even if the process is still registered in the database' =>
            'Deze optie zorgt ervoor dat de Scheduler gestart wordt, ook als het proces nog geregistreerd is in de database',
        'Start scheduler' => 'Start Scheduler',
        'Scheduler could not be started. Check if scheduler is not running and try it again with Force Start option' =>
            'De Scheduler kon niet worden gestart. Verifiëer of de Scheduler niet actief is en probeer opnieuw met de Forceer Start-optie.',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => 'Secure Mode is niet actief.',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'Secure Mode wordt normaal gesproken geactiveerd na afronding van de installatie.',
        'Secure mode must be disabled in order to reinstall using the web-installer.' =>
            'Secure Mode moet gedeactiveerd worden om te kunnen herinstalleren met de web-installer.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Als Secure Mode nog niet actief is activeer dit via de Systeemconfiguratie omdat de applicatie al draait.',

        # Template: AdminSelectBox
        'SQL Box' => 'SQL console',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Hier kunt u SQL statements invoeren die direct door de database worden uitgevoerd.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'De syntax van uw SQL query bevat een fout.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'Er mist tenminste een parameter.',
        'Result format' => 'Uitvoeren naar',
        'Run Query' => 'Uitvoeren',

        # Template: AdminService
        'Service Management' => 'Service beheer',
        'Add service' => 'Nieuwe service',
        'Add Service' => 'Nieuwe service',
        'Edit Service' => 'Bewerk Service',
        'Sub-service of' => 'Onderdeel van',

        # Template: AdminSession
        'Session Management' => 'Sessies',
        'All sessions' => 'Alle sessies',
        'Agent sessions' => 'Gebruiker sessies',
        'Customer sessions' => 'Klant sessies',
        'Unique agents' => 'Unieke gebruikers',
        'Unique customers' => 'Unieke klanten',
        'Kill all sessions' => 'Alle sessies verwijderen',
        'Kill this session' => 'Verwijder deze sessie',
        'Session' => 'Sessie',
        'Kill' => 'Verwijder',
        'Detail View for SessionID' => 'Details',

        # Template: AdminSignature
        'Signature Management' => 'Handtekening beheer',
        'Add signature' => 'Nieuwe handtekening',
        'Add Signature' => 'Nieuwe handtekening',
        'Edit Signature' => 'Bewerk handtekening',
        'Example signature' => 'Handtekening voorbeeld',

        # Template: AdminState
        'State Management' => 'Status beheer',
        'Add state' => 'Nieuwe status',
        'Please also update the states in SysConfig where needed.' => 'Pas ook de namen van de status aan in SysConfig waar nodig.',
        'Add State' => 'Nieuwe status',
        'Edit State' => 'Bewerk status',
        'State type' => 'Status type',

        # Template: AdminSysConfig
        'SysConfig' => 'Systeemconfiguratie',
        'Navigate by searching in %s settings' => 'Doorzoek %s instellingen',
        'Navigate by selecting config groups' => 'Navigeer door groepen te kiezen',
        'Download all system config changes' => 'Download alle aanpassingen in de systeemconfiguratie',
        'Export settings' => 'Exporteer configuratie',
        'Load SysConfig settings from file' => 'Laad configuratie uit bestand',
        'Import settings' => 'Importeer configuratie',
        'Import Settings' => 'Importeer configuratie',
        'Please enter a search term to look for settings.' => 'Geef een zoekterm op.',
        'Subgroup' => 'Subgroep',
        'Elements' => 'Elementen',

        # Template: AdminSysConfigEdit
        'Edit Config Settings' => 'Bewerk systeemconfiguratie',
        'This config item is only available in a higher config level!' =>
            'Dit configuratieitem is alleen beschikbaar op een hoger configuratieniveau.',
        'Reset this setting' => 'Terug naar standaard',
        'Error: this file could not be found.' => 'Fout: dit bestand is niet gevonden.',
        'Error: this directory could not be found.' => 'Fout: deze map niet gevonden.',
        'Error: an invalid value was entered.' => 'Fout: een ongeldige waarde is ingegeven.',
        'Content' => 'Inhoud',
        'Remove this entry' => 'Verwijder deze sleutel',
        'Add entry' => 'Sleutel toevoegen',
        'Remove entry' => 'Verwijder sleutel',
        'Add new entry' => 'Nieuwe sleutel toevoegen',
        'Create new entry' => 'Nieuwe sleutel toevoegen',
        'New group' => 'Nieuwe groep',
        'Group ro' => 'Alleen-lezen groep',
        'Readonly group' => 'Alleen-lezen groep',
        'New group ro' => 'Nieuwe alleen-lezen groep',
        'Loader' => 'Loader',
        'File to load for this frontend module' => 'Bestand om te laden voor deze frontend module',
        'New Loader File' => 'Nieuw bestand voor Loader',
        'NavBarName' => 'Titel navigatiebalk',
        'NavBar' => 'Navigatiebalk',
        'LinkOption' => 'Link',
        'Block' => 'Blok',
        'AccessKey' => 'Sneltoetskoppeling',
        'Add NavBar entry' => 'Navigatiebalk item toevoegen',
        'Year' => 'Jaar',
        'Month' => 'Maand',
        'Day' => 'Dag',
        'Invalid year' => 'Ongeldig jaar',
        'Invalid month' => 'Ongeldige maand',
        'Invalid day' => 'Ongeldige dag',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Systeem e-mailadressen beheer',
        'Add system address' => 'Nieuw e-mailadres',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Alle inkomende berichten met dit adres in Aan of CC worden toegewezen aan de geselecteerde wachtrij.',
        'Email address' => 'E-mailadres',
        'Display name' => 'Weergegeven naam',
        'Add System Email Address' => 'Nieuw e-mailadres',
        'Edit System Email Address' => 'Bewerk e-mailadres',
        'The display name and email address will be shown on mail you send.' =>
            'De weergegeven naam en het e-mailadres worden gebruikt voor uitgaande mail.',

        # Template: AdminType
        'Type Management' => 'Type beheer',
        'Add ticket type' => 'Nieuw ticket type',
        'Add Type' => 'Nieuw type',
        'Edit Type' => 'Bewerk type',

        # Template: AdminUser
        'Add agent' => 'Nieuwe gebruiker',
        'Agents will be needed to handle tickets.' => 'Gebruikers zijn nodig om te kunnen werken in het systeem.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'vergeet niet om een gebruiker aan groepen en/of rollen te koppelen.',
        'Please enter a search term to look for agents.' => 'Typ om te zoeken naar gebruikers.',
        'Last login' => 'Laatst ingelogd',
        'Login as' => 'Inloggen als',
        'Switch to agent' => 'Omschakelen naar gebruiker',
        'Add Agent' => 'Nieuwe gebruiker',
        'Edit Agent' => 'Bewerk gebruiker',
        'Firstname' => 'Voornaam',
        'Lastname' => 'Achternaam',
        'Password is required.' => 'Wachtwoord is verplicht.',
        'Start' => 'Begin',
        'End' => 'Einde',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => 'Beheer Gebruiker-Groep koppelingen',
        'Change Group Relations for Agent' => 'Bewerk gekoppelde groepen voor gebruiker',
        'Change Agent Relations for Group' => 'Bewerk gekoppelde gebruikers voor groep',
        'note' => 'notitie',
        'Permissions to add notes to tickets in this group/queue.' => 'Permissies om notities aan tickets in de wachtrijen behorende bij deze groep toe te voegen.',
        'owner' => 'eigenaar',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Permissies om de eigenaar van de tickets in de wachtrijen behorende bij deze groep te wijzigen.',

        # Template: AgentBook
        'Address Book' => 'Adresboek',
        'Search for a customer' => 'Zoek naar een klant',
        'Add email address %s to the To field' => 'Voeg e-mailadres %s toe aan het Aan-veld',
        'Add email address %s to the Cc field' => 'Voeg e-mailadres %s toe aan het CC-veld',
        'Add email address %s to the Bcc field' => 'Voeg e-mailadres %s toe aan het BCC-veld',
        'Apply' => 'Toepassen',

        # Template: AgentCustomerSearch
        'Search Customer' => 'Klanten zoeken',
        'Duplicated entry' => '',
        'This address already exists on the address list.' => '',

        # Template: AgentCustomerTableView

        # Template: AgentDashboard
        'Dashboard' => 'Dashboard',

        # Template: AgentDashboardCalendarOverview
        'in' => 'over',

        # Template: AgentDashboardIFrame

        # Template: AgentDashboardImage

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s is beschikbaar.',
        'Please update now.' => 'Voer nu een update uit.',
        'Release Note' => 'Releasenote',
        'Level' => 'Soort',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Geplaatst %s geleden.',

        # Template: AgentDashboardTicketGeneric
        'My locked tickets' => 'Mijn vergrendelde tickets',
        'My watched tickets' => 'Mijn gevolgde tickets',
        'My responsibilities' => 'Tickets waarvoor ik verantwoordelijk ben',
        'Tickets in My Queues' => 'Tickets in mijn wachtrijen',

        # Template: AgentDashboardTicketStats

        # Template: AgentDashboardUserOnline

        # Template: AgentHTMLReferenceForms

        # Template: AgentHTMLReferenceOverview

        # Template: AgentHTMLReferencePageLayout
        'The ticket has been locked' => 'Het ticket is vergrendeld',
        'Undo & close window' => 'Annuleren en scherm sluiten',

        # Template: AgentInfo
        'Info' => 'Informatie',
        'To accept some news, a license or some changes.' => 'Om een tekst te tonen, zoals nieuws of een licentie, die de agent moet accepteren.',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Koppel object: %s',
        'Close window' => 'Sluit venster',
        'go to link delete screen' => 'ga naar koppeling-verwijder scherm',
        'Select Target Object' => 'Selecteer doel',
        'Link Object' => 'Koppel object',
        'with' => 'met',
        'Unlink Object: %s' => 'Ontkoppel object',
        'go to link add screen' => 'ga naar koppelscherm',

        # Template: AgentNavigationBar

        # Template: AgentPreferences
        'Edit your preferences' => 'Bewerk uw voorkeuren',

        # Template: AgentSpelling
        'Spell Checker' => 'Spellingcontrole',
        'spelling error(s)' => 'Spelfout(en)',
        'Apply these changes' => 'Pas deze wijzigingen toe',

        # Template: AgentStatsDelete
        'Delete stat' => 'Verwijder rapport',
        'Stat#' => 'Rapport#',
        'Do you really want to delete this stat?' => 'Wilt u dit rapport echt verwijderen?',

        # Template: AgentStatsEditRestrictions
        'Step %s' => 'Stap %s',
        'General Specifications' => 'Algemene Instellingen',
        'Select the element that will be used at the X-axis' => 'Selecteer het element wat gebruikt wordt op de X-as',
        'Select the elements for the value series' => 'Selecteer de elementen voor de Y-as',
        'Select the restrictions to characterize the stat' => 'Selecteer de zoekrestricties voor dit rapport',
        'Here you can make restrictions to your stat.' => 'Hier kunt u beperkingen voor dit rapport opgeven.',
        'If you remove the hook in the "Fixed" checkbox, the agent generating the stat can change the attributes of the corresponding element.' =>
            'Als u het vinkje bij \'Statisch\' weghaalt, kunnen gebruikers de attributen van het bijbehorende element aanpassen bij het genereren van de rapporten.',
        'Fixed' => 'Statisch',
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Kies een element, of schakel de optie \'Statisch\' uit.',
        'Absolute Period' => 'Absolute periode',
        'Between' => 'Tussen',
        'Relative Period' => 'Relatieve periode',
        'The last' => 'De laatste',
        'Finish' => 'Voltooien',

        # Template: AgentStatsEditSpecification
        'Permissions' => 'Permissies',
        'You can select one or more groups to define access for different agents.' =>
            'U kunt één of meerdere groepen definiëren die deze rapportage kunnen gebruiken.',
        'Some result formats are disabled because at least one needed package is not installed.' =>
            'Sommige formaten worden niet getoond omdat de juiste bibliotheken niet zijn geïnstalleerd. Vraag uw beheerder.',
        'Please contact your administrator.' => 'Neem contact op met uw beheerder.',
        'Graph size' => 'Grootte',
        'If you use a graph as output format you have to select at least one graph size.' =>
            'Als u een afbeelding als vorm heeft gekozen moet u tenminste één grootte selecteren.',
        'Sum rows' => 'Toon totaal per rij',
        'Sum columns' => 'Toon totaal per kolom',
        'Use cache' => 'Gebruik buffer',
        'Most of the stats can be cached. This will speed up the presentation of this stat.' =>
            'De meeste rapporten kunnen worden gebufferd, dit versnelt het genereren van het rapport.',
        'If set to invalid end users can not generate the stat.' => 'Als deze op ongeldig staat, kan het rapport niet gebruikt worden.',

        # Template: AgentStatsEditValueSeries
        'Here you can define the value series.' => 'Hier kunt u de waarden voor de Y-as kiezen.',
        'You have the possibility to select one or two elements.' => 'U kunt één of twee elementen kiezen.',
        'Then you can select the attributes of elements.' => 'Vervolgens kunt u de getoonde attributen van de elementen kiezen.',
        'Each attribute will be shown as single value series.' => 'Ieder attribuut wordt getoond als een eigen waarde.',
        'If you don\'t select any attribute all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            'Als u geen waarde kiest worden alle attributen van het element gebruikt bij het genereren van het rapport.',
        'Scale' => 'Schaal',
        'minimal' => 'minimaal',
        'Please remember, that the scale for value series has to be larger than the scale for the X-axis (e.g. X-Axis => Month, ValueSeries => Year).' =>
            'Let er op dat de schaal voor de Y-as groter moet zijn dan die voor de X-as (bijvooreeld X-as = maand, Y-as = jaar).',

        # Template: AgentStatsEditXaxis
        'Here you can define the x-axis. You can select one element via the radio button.' =>
            'Hier kunt u de X-as definiëren. U kunt een element kiezen met de radio-button.',
        'maximal period' => 'maximale periode',
        'minimal scale' => 'minimale schaal',

        # Template: AgentStatsImport
        'Import Stat' => 'Importeer rapport',
        'File is not a Stats config' => 'Het bestand is geen geldig rapport-configuratie bestand',
        'No File selected' => 'Geen bestand geselecteerd',

        # Template: AgentStatsOverview
        'Stats' => 'Rapporten',

        # Template: AgentStatsPrint
        'Print' => 'Afdrukken',
        'No Element selected.' => 'Geen element geselecteerd.',

        # Template: AgentStatsView
        'Export config' => 'Exporteer rapport-configuratie',
        'With the input and select fields you can influence the format and contents of the statistic.' =>
            'Met deze velden kunt u het formaat en de inhoud van het rapport beïnvloeden.',
        'Exactly what fields and formats you can influence is defined by the statistic administrator.' =>
            'Welke velden en formaten beschikbaar zijn is gedefiniëerd in het rapport zelf.',
        'Stat Details' => 'Rapport ',
        'Format' => 'Formaat',
        'Graphsize' => 'Grafiek grootte',
        'Cache' => 'Cache',
        'Exchange Axis' => 'Wissel assen',
        'Configurable params of static stat' => 'Configureerbare parameters voor rapport',
        'No element selected.' => 'Geen element geselecteerd.',
        'maximal period from' => 'Maximale periode van',
        'to' => 'tot',

        # Template: AgentTicketActionCommon
        'Change Free Text of Ticket' => 'Wijzig vrije velden',
        'Change Owner of Ticket' => 'Wijzig eigenaar van het ticket',
        'Close Ticket' => 'Sluit ticket',
        'Add Note to Ticket' => 'Voeg notitie toe aan ticket',
        'Set Pending' => 'Zet in de wacht',
        'Change Priority of Ticket' => 'Wijzig prioriteit van ticket',
        'Change Responsible of Ticket' => 'Wijzig verantwoordelijke voor ticket',
        'Cancel & close window' => 'Annuleren en scherm sluiten',
        'Service invalid.' => 'Service is ongeldig.',
        'New Owner' => 'Nieuwe eigenaar',
        'Please set a new owner!' => 'Kies een nieuwe eigenaar.',
        'Previous Owner' => 'Vorige eigenaar',
        'Inform Agent' => 'Informeer gebruiker',
        'Optional' => 'Optioneel',
        'Inform involved Agents' => 'Informeer betrokken gebruikers',
        'Spell check' => 'Spellingscontrole',
        'Note type' => 'Notitiesoort',
        'Next state' => 'Status',
        'Pending date' => 'In de wacht: datum',
        'Date invalid!' => 'Ongeldige datum.',

        # Template: AgentTicketActionPopupClose

        # Template: AgentTicketBounce
        'Bounce Ticket' => 'Bounce ticket',
        'Bounce to' => 'Bounce naar',
        'You need a email address.' => 'E-mailadres is verplicht.',
        'Need a valid email address or don\'t use a local email address.' =>
            'Een e-mailadres is verplicht. U kunt geen lokale adressen gebruiken.',
        'Next ticket state' => 'Status',
        'Inform sender' => 'Informeer afzender',
        'Send mail!' => 'Bericht versturen',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Ticket bulk-actie',
        'Send Email' => 'Stuur e-mail',
        'Merge to' => 'Voeg samen met',
        'Invalid ticket identifier!' => 'Ongeldige ticket identifier.',
        'Merge to oldest' => 'Voeg samen met oudste',
        'Link together' => 'Koppelen',
        'Link to parent' => 'Koppel aan vader',
        'Unlock tickets' => 'Ontgrendel tickets',

        # Template: AgentTicketClose

        # Template: AgentTicketCompose
        'Compose answer for ticket' => 'Bericht opstellen voor',
        'Remove Ticket Customer' => 'Verwijder ',
        'Please remove this entry and enter a new one with the correct value.' =>
            'Verwijder deze en geef een nieuwe met een correcte waarde.',
        'Please include at least one recipient' => 'Voeg tenminste één ontvanger toe',
        'Remove Cc' => 'Verwijder CC',
        'Remove Bcc' => 'Verwijder BCC',
        'Address book' => 'Adresboek',
        'Pending Date' => 'Wacht tot datum',
        'for pending* states' => 'voor \'wachtend op-\' statussen',
        'Date Invalid!' => 'Datum ongeldig.',

        # Template: AgentTicketCustomer
        'Change customer of ticket' => 'Wijzig klant van een ticket',
        'Customer Data' => 'Klantgegevens',
        'Customer user' => 'Klant',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => 'Maak nieuw e-mail ticket',
        'From queue' => 'In wachtrij',
        'To customer' => 'Aan klant',
        'Please include at least one customer for the ticket.' => 'Voeg ten minste één klant toe voor dit ticket.',
        'Get all' => 'Gebruik alle',

        # Template: AgentTicketEscalation

        # Template: AgentTicketForward
        'Forward ticket: %s - %s' => 'Ticket doorsturen: %s - %s',
        'Need a valid email address or don\'t use a local email address' =>
            'Een e-mailadres is verplicht. U kunt geen lokale adressen gebruiken.',

        # Template: AgentTicketFreeText

        # Template: AgentTicketHistory
        'History of' => 'Geschiedenis van',
        'History Content' => 'Inhoud',
        'Zoom view' => 'Detailoverzicht',

        # Template: AgentTicketMerge
        'Ticket Merge' => 'Ticket samenvoegen',
        'You need to use a ticket number!' => 'Gebruik een ticketnummer.',
        'A valid ticket number is required.' => 'Een geldig ticketnummer is verplicht.',
        'Need a valid email address.' => 'Geen geldig e-mailadres.',

        # Template: AgentTicketMove
        'Move Ticket' => 'Verplaats ticket',
        'New Queue' => 'Nieuwe wachtrij',

        # Template: AgentTicketNote

        # Template: AgentTicketOverviewMedium
        'Select all' => 'Selecteer alles',
        'No ticket data found.' => 'Geen tickets gevonden.',
        'First Response Time' => 'Eerste reactie',
        'Service Time' => 'Service tijd',
        'Update Time' => 'Vervolg tijd',
        'Solution Time' => 'Oplossingstijd',
        'Move ticket to a different queue' => 'Verplaats naar nieuwe wachtrij',
        'Change queue' => 'Verplaats naar wachtrij',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Verander zoekopties',
        'Tickets per page' => 'Tickets per pagina',

        # Template: AgentTicketOverviewPreview
        '","26' => '',

        # Template: AgentTicketOverviewSmall
        'Escalation in' => 'Escalatie om',
        'Locked' => 'Vergrendeling',
        '","30' => '',

        # Template: AgentTicketOwner

        # Template: AgentTicketPending

        # Template: AgentTicketPhone
        'Create New Phone Ticket' => 'Maak nieuw telefoon ticket aan',
        'From customer' => 'Van klant',
        'To queue' => 'In wachtrij',

        # Template: AgentTicketPhoneCommon
        'Phone call' => 'Telefoongesprek',

        # Template: AgentTicketPlain
        'Email Text Plain View' => 'E-mailbericht zonder opmaak',
        'Plain' => 'Zonder opmaak',
        'Download this email' => 'Download deze e-mail',

        # Template: AgentTicketPrint
        'Ticket-Info' => 'Ticket informatie',
        'Accounted time' => 'Bestede tijd',
        'Linked-Object' => 'Gekoppeld item',
        'by' => 'door',

        # Template: AgentTicketPriority

        # Template: AgentTicketQueue

        # Template: AgentTicketResponsible

        # Template: AgentTicketSearch
        'Search template' => 'Sjabloon',
        'Create Template' => 'Maak sjabloon',
        'Create New' => 'Nieuw',
        'Profile link' => 'Koppeling naar sjabloon',
        'Save changes in template' => 'Sla wijzigingen op in sjabloon',
        'Add another attribute' => 'Voeg attribuut toe',
        'Output' => 'Uitvoeren naar',
        'Fulltext' => 'Volledig',
        'Remove' => 'Verwijderen',
        'Customer User Login' => 'Klant login',
        'Created in Queue' => 'Aangemaakt in wachtrij',
        'Lock state' => 'Vergrendeling',
        'Watcher' => 'Volger',
        'Article Create Time (before/after)' => 'Aanmaaktijd interactie (voor/na)',
        'Article Create Time (between)' => 'Aanmaaktijd interactie (tussen)',
        'Ticket Create Time (before/after)' => 'Aanmaaktijd ticket (voor/na)',
        'Ticket Create Time (between)' => 'Aanmaaktijd ticket (tussen)',
        'Ticket Change Time (before/after)' => 'Ticket gewijzigd (voor/na)',
        'Ticket Change Time (between)' => 'Ticket gewijzigd (tussen)',
        'Ticket Close Time (before/after)' => 'Ticket gesloten (voor/na)',
        'Ticket Close Time (between)' => 'Ticket gesloten (tussen)',
        'Archive Search' => 'Zoek in archief',
        'Run search' => 'Voer zoekopdracht uit',

        # Template: AgentTicketSearchOpenSearchDescriptionFulltext

        # Template: AgentTicketSearchOpenSearchDescriptionTicketNumber

        # Template: AgentTicketSearchResultPrint

        # Template: AgentTicketZoom
        'Article filter' => 'Filter interacties',
        'Article Type' => 'Soort interactie',
        'Sender Type' => 'Soort verzender',
        'Save filter settings as default' => 'Sla filter op als standaard',
        'Ticket Information' => 'Ticket informatie',
        'Linked Objects' => 'Gekoppelde objecten',
        'Article(s)' => 'Interactie(s)',
        'Change Queue' => 'Wijzig wachtrij',
        'Article Filter' => 'Filter interacties',
        'Add Filter' => 'Nieuw filter',
        'Set' => 'Nieuwe waarden',
        'Reset Filter' => 'Herstel filter',
        'Show one article' => 'Toon één interactie',
        'Show all articles' => 'Toon alle interacties',
        'Unread articles' => 'Ongelezen interacties',
        'No.' => 'Nr.',
        'Unread Article!' => 'Ongelezen interactie.',
        'Incoming message' => 'Binnenkomend bericht',
        'Outgoing message' => 'Uitgaand bericht',
        'Internal message' => 'Intern bericht',
        'Resize' => 'Grootte wijzigen',

        # Template: AttachmentBlocker
        'To protect your privacy, active or/and remote content has blocked.' =>
            'Om uw privacy te beschermen is actieve inhoud geblokkeerd.',
        'Load blocked content.' => 'Laad actieve inhoud.',

        # Template: Copyright

        # Template: CustomerAccept

        # Template: CustomerError
        'Traceback' => 'Traceback',

        # Template: CustomerFooter
        'Powered by' => 'Draait op',
        'One or more errors occurred!' => 'Een of meerdere problemen zijn opgetreden.',
        'Close this dialog' => 'Sluit venster',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'Kan geen popup openen. Schakel popup blockers uit voor deze website.',

        # Template: CustomerHeader

        # Template: CustomerLogin
        'Login' => 'Inloggen',
        'User name' => 'Gebruikersnaam',
        'Your user name' => 'Uw gebruikersnaam',
        'Your password' => 'Uw wachtwoord',
        'Forgot password?' => 'Wachtwoord vergeten?',
        'Log In' => 'Inloggen',
        'Not yet registered?' => 'Nog niet geregistreerd?',
        'Sign up now' => 'Gebruikersnaam registreren',
        'Request new password' => 'Vraag een nieuw wachtwoord aan',
        'Your User Name' => 'Uw gebruikersnaam',
        'A new password will be sent to your email address.' => 'Een nieuw wachtwoord wordt naar uw e-mailadres verzonden.',
        'Create Account' => 'Maak account',
        'Please fill out this form to receive login credentials.' => 'Vul dit formulier in om een gebruikersnaam aan te maken.',
        'How we should address you' => 'Hoe moeten we u adresseren?',
        'Your First Name' => 'Uw voornaam',
        'Please supply a first name' => 'Voer uw voornaam in',
        'Your Last Name' => 'Uw achternaam',
        'Please supply a last name' => 'Voer uw achternaam in',
        'Your email address (this will become your username)' => 'Uw e-mailadres (dit wordt uw gebruikersnaam)',
        'Please supply a' => 'Geef een',

        # Template: CustomerNavigationBar
        'Edit personal preferences' => 'Voorkeuren bewerken',
        'Logout %s' => 'Uitloggen %s',

        # Template: CustomerPreferences

        # Template: CustomerRichTextEditor

        # Template: CustomerTicketMessage
        'Service level agreement' => 'Service level agreement',

        # Template: CustomerTicketOverview
        'Welcome!' => 'Welkom!',
        'Please click the button below to create your first ticket.' => 'Klik op de button om uw eerste ticket aan te maken.',
        'Create your first ticket' => 'Maak uw eerste ticket aan',

        # Template: CustomerTicketPrint
        'Ticket Print' => 'Ticket print',

        # Template: CustomerTicketSearch
        'Profile' => 'Sjabloon',
        'e. g. 10*5155 or 105658*' => 'bijv. 2010*5155 of 20100802*',
        'Customer ID' => 'Klant ID',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => 'Zoeken in tekst in tickets (bijv. "Jans*en" of "Print*")',
        'Recipient' => 'Geadresseerde',
        'Carbon Copy' => 'CC',
        'Time restrictions' => 'Tijd',
        'No time settings' => 'Niet zoeken op tijd',
        'Only tickets created' => 'Alleen tickets aangemaakt',
        'Only tickets created between' => 'Alleen tickets aangemaakt tussen',
        'Ticket archive system' => 'Ticket-archief',
        'Save search as template?' => 'Bewaar zoekopdracht als sjabloon?',
        'Save as Template?' => 'Bewaar als sjabloon?',
        'Save as Template' => 'Bewaar',
        'Template Name' => 'Template naam',
        'Pick a profile name' => 'Naam voor dit sjabloon',
        'Output to' => 'Uitvoer naar',

        # Template: CustomerTicketSearchOpenSearchDescription

        # Template: CustomerTicketSearchResultPrint

        # Template: CustomerTicketSearchResultShort
        'of' => 'van',
        'Page' => 'Pagina',
        'Search Results for' => 'Zoekresultaat voor',
        '","18' => '',

        # Template: CustomerTicketZoom
        'Expand article' => 'Toon interactie',
        'Reply' => 'Beantwoord',

        # Template: CustomerWarning

        # Template: Datepicker
        'Invalid date (need a future date)!' => 'Ongeldig (datum kan niet in verleden zijn).',
        'Previous' => 'Vorige',
        'Sunday' => 'zondag',
        'Monday' => 'maandag',
        'Tuesday' => 'dinsdag',
        'Wednesday' => 'woensdag',
        'Thursday' => 'donderdag',
        'Friday' => 'vrijdag',
        'Saturday' => 'zaterdag',
        'Su' => 'zo',
        'Mo' => 'ma',
        'Tu' => 'di',
        'We' => 'wo',
        'Th' => 'do',
        'Fr' => 'vr',
        'Sa' => 'za',
        'Open date selection' => 'Open datumkiezer',

        # Template: Error
        'Oops! An Error occurred.' => 'Oeps! Daar ging iets mis.',
        'Error Message' => 'Foutmelding',
        'You can' => 'U kunt',
        'Send a bugreport' => 'Een bug report indienen',
        'go back to the previous page' => 'terug naar de vorige pagina',
        'Error Details' => 'Error gegevens',

        # Template: Footer
        'Top of page' => 'Naar boven',

        # Template: FooterJS
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Als u deze pagina verlaat worden alle openstaande popup-vensters ook gesloten.',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'Er is al een popup open voor dit ticket. Wilt u deze sluiten en de nieuwe laden?',
        'Please enter at least one search value or * to find anything.' =>
            'Geef één of meerdere tekens of een wildcard als * op om een zoekopdracht uit te voeren.',

        # Template: FooterSmall

        # Template: HTMLHead

        # Template: HTMLHeadBlockEvents

        # Template: Header
        'You are logged in as' => 'Ingelogd als',

        # Template: HeaderSmall

        # Template: Installer
        'JavaScript not available' => 'JavaScript is niet beschikbaar',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            'Om OTRS te kunnen gebruiken, moet JavaScript geactiveerd zijn in uw browser.',
        'Database Settings' => 'Database configuratie',
        'General Specifications and Mail Settings' => 'Algemene instellingen en mailconfiguratie',
        'Registration' => 'Registratie',
        'Welcome to %s' => 'Welkom bij %s',
        'Web site' => 'Website',
        'Database check successful.' => 'Database controle gelukt.',
        'Mail check successful.' => 'Mail controle gelukt.',
        'Error in the mail settings. Please correct and try again.' => 'Fout in de mailinstellingen. Corrigeer ze en probeer nog eens.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => 'Configureer uitgaande mail',
        'Outbound mail type' => 'Uitgaande mail type',
        'Select outbound mail type.' => 'Selecteer e-mail soort.',
        'Outbound mail port' => 'Uitgaande mail poort',
        'Select outbound mail port.' => 'Kies de TCP poort voor uitgaand e-mail verkeer.',
        'SMTP host' => 'SMTP host',
        'SMTP host.' => 'SMTP host.',
        'SMTP authentication' => 'SMTP authenticatie',
        'Does your SMTP host need authentication?' => 'Heeft uw SMTP host authenticatie nodig?',
        'SMTP auth user' => 'SMTP auth user',
        'Username for SMTP auth.' => 'Login voor SMTP authenticatie',
        'SMTP auth password' => 'SMTP auth password',
        'Password for SMTP auth.' => 'Wachtwoord voor SMTP authenticatie',
        'Configure Inbound Mail' => 'Configureer binnenkomende mail',
        'Inbound mail type' => 'Ingaande mail type',
        'Select inbound mail type.' => 'Selecteer e-mail soort.',
        'Inbound mail host' => 'Ingaande mail host',
        'Inbound mail host.' => 'Hostnaam mailserver voor inkomende mail.',
        'Inbound mail user' => 'User',
        'User for inbound mail.' => 'Login voor inkomende mail server.',
        'Inbound mail password' => 'Password',
        'Password for inbound mail.' => 'Wachtwoord voor inkomende mail server.',
        'Result of mail configuration check' => 'Resultaat van mailconfiguratie test',
        'Check mail configuration' => 'Test mailconfiguratie',
        'Skip this step' => 'Sla dit over',
        'Skipping this step will automatically skip the registration of your OTRS. Are you sure you want to continue?' =>
            'Als u deze stap overslaat dan slaat u ook de registratie van uw OTRS-systeem over. Weet u zeker dat u wilt doorgaan?',

        # Template: InstallerDBResult
        'False' => 'Fout',

        # Template: InstallerDBStart
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty. For security reasons we do recommend setting a root password. For more information please refer to your database documentation.' =>
            'Als er een wachtwoord hoort bij dit account, vul deze hier in. Vanuit beveiligingsoogpunt is het aan te bevelen een wachtwoord te gebruiken. Kijk in de databasedocumentatie voor meer informatie.',
        'Currently only MySQL is supported in the web installer.' => 'Alleen MySQL wordt ondersteund door de web installer.',
        'If you want to install OTRS on another database type, please refer to the file README.database.' =>
            'Als u OTRS op een ander type database wilt installeren, kijk dan in het bestand README.database voor instructies.',
        'Database-User' => 'OTRS database gebruiker',
        'New' => 'Nieuw',
        'A new database user with limited rights will be created for this OTRS system.' =>
            'Een nieuwe database gebruiker met beperkte permissies wordt aangemaakt voor deze OTRS omgeving.',
        'default \'hot\'' => 'Standaard \'hot\'',
        'DB--- host' => 'Database host',
        'Check database settings' => 'Test database instellingen',
        'Result of database check' => 'Resultaat van database test',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Om OTRS te gebruiken moet u nu de webserver herstarten.',
        'Restart your webserver' => 'Herstart webserver',
        'After doing so your OTRS is up and running.' => 'Hierna is OTRS klaar voor gebruik.',
        'Start page' => 'Inlogpagina',
        'Your OTRS Team' => 'Het OTRS team',

        # Template: InstallerLicense
        'Accept license' => 'Accepteer licentie',
        'Don\'t accept license' => 'Licentie niet accepteren',

        # Template: InstallerLicenseText

        # Template: InstallerRegistration
        'Organization' => 'Organisatie',
        'Position' => 'Rol',
        'Complete registration and continue' => 'Registreer en ga verder met installatie',
        'Please fill in all fields marked as mandatory.' => 'Vul de verplichte velden in.',

        # Template: InstallerSystem
        'SystemID' => 'Systeem identificatie',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'De identifier van het systeem. Ieder ticketnummer en elk HTTP sessie ID bevat dit nummer.',
        'System FQDN' => 'OTRS FQDN',
        'Fully qualified domain name of your system.' => 'Fully Qualified Domain Name van het systeem.',
        'AdminEmail' => 'E-mailadres beheerder',
        'Email address of the system administrator.' => 'E-mailadres van de beheerder.',
        'Log' => 'Log',
        'LogModule' => 'Logmodule',
        'Log backend to use.' => 'Te gebruiken logbestand.',
        'LogFile' => 'Logbestand',
        'Log file location is only needed for File-LogModule!' => 'Locatie logbestand is alleen nodig voor de File-Log module.',
        'Webfrontend' => 'Web Frontend',
        'Default language' => 'Standaard taal',
        'Default language.' => 'Standaard taal.',
        'CheckMXRecord' => 'Check MX Record',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'E-mailadressen die handmatig worden ingevoerd worden gecontroleerd met de MX records gevonden in de DNS. Gebruik deze mogelijkheid niet als uw DNS traag is of geen publieke adressen kan herleiden.',

        # Template: LinkObject
        'Object#' => 'Object#',
        'Add links' => 'Links toevoegen',
        'Delete links' => 'Links verwijderen',

        # Template: Login
        'JavaScript Not Available' => 'JavaScript niet beschikbaar',
        'Browser Warning' => 'Waarschuwing',
        'The browser you are using is too old.' => 'De browser die u gebruikt is te oud.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            'OTRS kan overweg met een grote hoeveelheid browsers. Gebruik s.v.p een van deze.',
        'Please see the documentation or ask your admin for further information.' =>
            'Zie de documentatie of vraag uw beheerder voor meer informatie.',
        'Lost your password?' => 'Wachtwoord vergeten?',
        'Request New Password' => 'Vraag nieuw wachtwoord aan',
        'Back to login' => 'Terug naar inlogscherm',

        # Template: Motd
        'Message of the Day' => 'Soep van de Dag',

        # Template: NoPermission
        'Insufficient Rights' => 'Onvoldoende permissies',
        'Back to the previous page' => 'Terug naar de vorige pagina',

        # Template: Notify

        # Template: Pagination
        'Show first page' => 'Toon eerste pagina',
        'Show previous pages' => 'Toon vorige pagina\'s',
        'Show page %s' => 'Toon pagina %s',
        'Show next pages' => 'Toon volgende pagina\'s',
        'Show last page' => 'Toon laatste pagina',

        # Template: PictureUpload
        'Need FormID!' => 'Geen FormID gevonden.',
        'No file found!' => 'Geen bestand gevonden.',
        'The file is not an image that can be shown inline!' => 'Dit bestand kan niet inline worden weergegeven.',

        # Template: PrintFooter
        'URL' => 'URL',

        # Template: PrintHeader
        'printed by' => 'afgedrukt door',

        # Template: PublicDefault

        # Template: Redirect

        # Template: RichTextEditor

        # Template: SpellingInline

        # Template: Test
        'OTRS Test Page' => 'OTRS Testpagina',
        'Welcome %s' => 'Welkom %s',
        'Counter' => 'Teller',

        # Template: Warning
        'Go back to the previous page' => 'Terug naar de vorige pagina',

        # SysConfig
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            '',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            '',
        'Activates lost password feature for agents, in the agent interface.' =>
            '',
        'Activates lost password feature for customers.' => '',
        'Activates support for customer groups.' => '',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            '',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            '',
        'Activates the ticket archive system search in the customer interface.' =>
            '',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            '',
        'Activates time accounting.' => '',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            '',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface.' =>
            '',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Agent Notifications' => 'Meldingen voor gebruikers',
        'Agent interface article notification module to check PGP.' => '',
        'Agent interface article notification module to check S/MIME.' =>
            '',
        'Agent interface module to access fulltext search via nav bar.' =>
            '',
        'Agent interface module to access search profiles via nav bar.' =>
            '',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            '',
        'Agent interface notification module to check the used charset.' =>
            '',
        'Agent interface notification module to see the number of tickets an agent is responsible for.' =>
            '',
        'Agent interface notification module to see the number of watched tickets.' =>
            '',
        'Agents <-> Groups' => 'Gebruikers <-> Groepen',
        'Agents <-> Roles' => 'Gebruikers <-> Rollen',
        'Allows adding notes in the close ticket screen of the agent interface.' =>
            '',
        'Allows adding notes in the ticket free text screen of the agent interface.' =>
            '',
        'Allows adding notes in the ticket note screen of the agent interface.' =>
            '',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows adding notes in the ticket responsible screen of the agent interface.' =>
            '',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            '',
        'Allows agents to generate individual-related stats.' => '',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            '',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            '',
        'Allows customers to change the ticket priority in the customer interface.' =>
            '',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            '',
        'Allows customers to set the ticket priority in the customer interface.' =>
            '',
        'Allows customers to set the ticket queue in the customer interface. If this is set to \'No\', QueueDefault should be configured.' =>
            '',
        'Allows customers to set the ticket service in the customer interface.' =>
            '',
        'Allows defining new types for ticket (if ticket type feature is enabled).' =>
            '',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            '',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search w. g. with this kind of conditions like "(key1&&key2)" or "(key1||key2)".' =>
            '',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search w. g. with this kind of conditions like "(key1&&key2)" or "(key1||key2)".' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            '',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            '',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            '',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            '',
        'Attachments <-> Responses' => 'Standaard-antwoorden <-> Bijlagen',
        'Auto Responses <-> Queues' => 'Wachtrijen <-> Automatische antwoorden',
        'Automated line break in text messages after x number of chars.' =>
            '',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            '',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled).' =>
            '',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            '',
        'Balanced white skin by Felix Niklas.' => '',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            '',
        'Builds an article index right after the article\'s creation.' =>
            '',
        'CMD example setup. Ignores emails where external CMD returns some output on STDOUT (email will be piped into STDIN of some.bin).' =>
            '',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for the web service config backend.' => '',
        'Change password' => 'Wachtwoord wijzigen',
        'Change queue!' => 'Verander wachtrij.',
        'Change the customer for this ticket' => 'Wijzig de klant voor dit ticket',
        'Change the free fields for this ticket' => 'Wijzig de vrije velden voor dit ticket',
        'Change the priority for this ticket' => 'Wijzig de prioriteit voor dit ticket',
        'Change the responsible person for this ticket' => 'Wijzig de verantwoordelijke personen voor dit ticket',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            '',
        'Checkbox' => 'Checkbox',
        'Checks the SystemID in ticket number detection for follow-ups (use "No" if SystemID has been changed after using the system).' =>
            '',
        'Closed tickets of customer' => 'Gesloten tickets van klant',
        'Comment for new history entries in the customer interface.' => '',
        'Companies' => 'Bedrijven',
        'Company Tickets' => 'Tickets van groep',
        'Company name for the customer web interface. Will also be included in emails as an X-Header.' =>
            '',
        'Configure your own log text for PGP.' => '',
        'Configures a default TicketDynmicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (http://doc.otrs.org/), chapter "Ticket Event Module".' =>
            '',
        'Configures the full-text index. Execute "bin/otrs.RebuildFulltextIndex.pl" in order to generate a new index.' =>
            '',
        'Controls if customers have the ability to sort their tickets.' =>
            '',
        'Converts HTML mails into text messages.' => '',
        'Create and manage Service Level Agreements (SLAs).' => 'Aanmaken en beheren van Service Level Agreements (SLA\'s).',
        'Create and manage agents.' => 'Aanmaken en beheren van gebruikers.',
        'Create and manage attachments.' => 'Aanmaken en beheren van bijlagen.',
        'Create and manage companies.' => 'Aanmaken en beheren van bedrijven.',
        'Create and manage customers.' => 'Aanmaken en beheren van klanten.',
        'Create and manage dynamic fields.' => 'Aanmaken en beheren van dynamische velden',
        'Create and manage event based notifications.' => 'Aanmaken en beheren van meldingen door gebeurtenissen.',
        'Create and manage groups.' => 'Aanmaken en beheren van groepen.',
        'Create and manage notifications that are sent to agents.' => 'Aanmaken en beheren van meldingen die naar de gebruikers gestuurd worden.',
        'Create and manage queues.' => 'Aanmaken en beheren van wachtrijen.',
        'Create and manage response templates.' => 'Aanmaken en beheren van voorgedefiniëerde antwoorden.',
        'Create and manage responses that are automatically sent.' => 'Aanmaken en beheren van teksten die automatisch naar de klant worden gestuurd.',
        'Create and manage roles.' => 'Aanmaken en beheren van rollen.',
        'Create and manage salutations.' => 'Aanmaken en beheren van aanheffen.',
        'Create and manage services.' => 'Aanmaken en beheren van services.',
        'Create and manage signatures.' => 'Aanmaken en beheren van handtekeningen.',
        'Create and manage ticket priorities.' => 'Aanmaken en beheren van prioriteiten.',
        'Create and manage ticket states.' => 'Aanmaken en beheren van statussen.',
        'Create and manage ticket types.' => 'Aanmaken en beheren van typen.',
        'Create and manage web services.' => 'Aanmaken en beheren van webservices.',
        'Create new email ticket and send this out (outbound)' => 'Maak een nieuw ticket en verstuur hiervan een mail (uitgaand)',
        'Create new phone ticket (inbound)' => 'Maak een nieuw telefoon ticket aan (inkomend)',
        'Custom text for the page shown to customers that have no tickets yet.' =>
            '',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customers <-> Groups' => 'Klanten <-> Groepen',
        'Customers <-> Services' => 'Klanten <-> Services',
        'DEPRECATED! This setting is not used any more and will be removed in a future version of OTRS.' =>
            '',
        'Data used to export the search result in CSV format.' => '',
        'Date / Time' => '',
        'Debugs the translation set. If this is set to "Yes" all strings (text) without translations are written to STDERR. This can be helpful when you are creating a new translation file. Otherwise, this option should remain set to "No".' =>
            '',
        'Default ACL values for ticket actions.' => '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            '',
        'Default loop protection module.' => '',
        'Default queue ID used by the system in the agent interface.' => '',
        'Default skin for OTRS 3.0 interface.' => '',
        'Default skin for interface.' => 'Standaard kleuren voor OTRS schermen.',
        'Default ticket ID used by the system in the agent interface.' =>
            '',
        'Default ticket ID used by the system in the customer interface.' =>
            '',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Define the start day of the week for the date picker.' => '',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            '',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            '',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            '',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            '',
        'Defines a default list of words, that are ignored by the spell checker.' =>
            '',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            '',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            '',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            '',
        'Defines a useful module to load specific user options or to display news.' =>
            '',
        'Defines all the X-headers that should be scanned.' => '',
        'Defines all the languages that are available to the application. The Key/Content pair links the front-end display name to the appropriate language PM file. The "Key" value should be the base-name of the PM file (i.e. de.pm is the file, then de is the "Key" value). The "Content" value should be the display name for the front-end. Specify any own-defined language here (see the developer documentation http://doc.otrs.org/ for more infomation). Please remember to use the HTML equivalents for non-ASCII characters (i.e. for the German oe = o umlaut, it is necessary to use the &ouml; symbol).' =>
            '',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            '',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            '',
        'Defines all the parameters for this item in the customer preferences.' =>
            '',
        'Defines all the possible stats output formats.' => '',
        'Defines an alternate URL, where the login link refers to.' => '',
        'Defines an alternate URL, where the logout link refers to.' => '',
        'Defines an alternate login URL for the customer panel..' => '',
        'Defines an alternate logout URL for the customer panel.' => '',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=$Data{"CustomerID"}\' or \'\').' =>
            '',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            '',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if composed messages have to be spell checked in the agent interface.' =>
            '',
        'Defines if time accounting is mandatory in the agent interface.' =>
            '',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            '',
        'Defines scheduler PID update time in seconds (floating point number).' =>
            '',
        'Defines scheduler sleep time in seconds after processing all available tasks (floating point number).' =>
            '',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            '',
        'Defines the URL CSS path.' => '',
        'Defines the URL base path of icons, CSS and Java Script.' => '',
        'Defines the URL image path of icons for navigation.' => '',
        'Defines the URL java script path.' => '',
        'Defines the URL rich text editor path.' => '',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            '',
        'Defines the body text for notification mails sent to agents, about new password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for notification mails sent to agents, with token about new requested password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            '',
        'Defines the body text for notification mails sent to customers, about new password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for notification mails sent to customers, with token about new requested password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for rejected emails.' => '',
        'Defines the boldness of the line drawed by the graph.' => '',
        'Defines the colors for the graphs.' => '',
        'Defines the column to store the keys for the preferences table.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view. Take care to maintain the dictionaries installed in the system in the data section.' =>
            '',
        'Defines the connections for http/ftp, via a proxy.' => '',
        'Defines the date input format used in forms (option or input fields).' =>
            '',
        'Defines the default CSS used in rich text editors.' => '',
        'Defines the default auto response type of the article for this operation.' =>
            '',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. The default themes are Standard and Lite. If you like, you can add your own theme. Please refer the administrator manual located at http://doc.otrs.org/.' =>
            '',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            '',
        'Defines the default history type in the customer interface.' => '',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            '',
        'Defines the default maximum number of search results shown on the overview page.' =>
            '',
        'Defines the default next state for a ticket after customer follow up in the customer interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default priority of follow up customer tickets in the ticket zoom screen in the customer interface.' =>
            '',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            '',
        'Defines the default priority of new tickets.' => '',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            '',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            '',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            '',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            '',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            '',
        'Defines the default sender type of the article for this operation.' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen. Example: a text, 1, DynamicField_Field1StartYear=2002;DynamicField_Field1StartMonth=12;DynamicField_Field1StartDay=12;DynamicField_Field1StartHour=00;DynamicField_Field1StartMinute=00;DynamicField_Field1StartSecond=00;DynamicField_Field1StopYear=2009;DynamicField_Field1StopMonth=02;DynamicField_Field1StopDay=10;DynamicField_Field1StopHour=23;DynamicField_Field1StopMinute=59;DynamicField_Field1StopSecond=59;.' =>
            '',
        'Defines the default sort criteria for all queues displayed in the queue view, after sort by priority is done.' =>
            '',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            '',
        'Defines the default spell checker dictionary.' => '',
        'Defines the default state of new customer tickets in the customer interface.' =>
            '',
        'Defines the default state of new tickets.' => '',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            '',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default type for article in the customer interface.' =>
            '',
        'Defines the default type of forwarded message in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the default type of the article for this operation.' => '',
        'Defines the default type of the note in the close ticket screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket zoom screen of the customer interface.' =>
            '',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            '',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            '',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            '',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            '',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            '',
        'Defines the format of responses in the ticket compose screen of the agent interface ($QData{"OrigFrom"} is From 1:1, $QData{"OrigFromName"} is only realname of From).' =>
            '',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            '',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every user for these groups).' =>
            '',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the height of the legend.' => '',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            '',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            '',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            '',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            '',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            '',
        'Defines the hours and week days to count the working time.' => '',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            '',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            '',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            '',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            '',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            '',
        'Defines the list of online repositories. Another installations can be used as repository, for example: Key="http://example.com/otrs/public.pl?Action=PublicRepository;File=" and Content="Some Name".' =>
            '',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            '',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            '',
        'Defines the maximal size (in bytes) for file uploads via the browser.' =>
            '',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            '',
        'Defines the maximum number of pages per PDF file.' => '',
        'Defines the maximum size (in MB) of the log file.' => '',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            '',
        'Defines the module that shows all the currently loged in customers in the agent interface.' =>
            '',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            '',
        'Defines the module that shows the currently loged in agents in the customer interface.' =>
            '',
        'Defines the module that shows the currently loged in customers in the customer interface.' =>
            '',
        'Defines the module to authenticate customers.' => '',
        'Defines the module to display a notification in the agent interface, (only for agents on the admin group) if the scheduler is not running.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            '',
        'Defines the module to generate html refresh headers of html sites, in the customer interface.' =>
            '',
        'Defines the module to generate html refresh headers of html sites.' =>
            '',
        'Defines the module to send emails. "Sendmail" directly uses the sendmail binary of your operating system. Any of the "SMTP" mechanisms use a specified (external) mailserver. "DoNotSendEmail" doesn\'t send emails and it is useful for test systems.' =>
            '',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            '',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            '',
        'Defines the name of the column to store the data in the preferences table.' =>
            '',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            '',
        'Defines the name of the indicated calendar.' => '',
        'Defines the name of the key for customer sessions.' => '',
        'Defines the name of the session key. E.g. Session, SessionID or OTRS.' =>
            '',
        'Defines the name of the table, where the customer preferences are stored.' =>
            '',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            '',
        'Defines the parameters for the customer preferences table.' => '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            '',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            '',
        'Defines the path for scheduler to store its console output (SchedulerOUT.log and SchedulerERR.log).' =>
            '',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Standard/CustomerAccept.dtl.' =>
            '',
        'Defines the path to PGP binary.' => '',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            '',
        'Defines the placement of the legend. This should be a two letter key of the form: \'B[LCR]|R[TCB]\'. The first letter indicates the placement (Bottom or Right), and the second letter the alignment (Left, Right, Center, Top, or Bottom).' =>
            '',
        'Defines the postmaster default queue.' => '',
        'Defines the receipent target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "SystemAddress" displays all system addresses) in the agent interface.' =>
            '',
        'Defines the receipent target of the tickets ("Queue" shows all queues, "SystemAddress" displays all system addresses) in the customer interface.' =>
            '',
        'Defines the search limit for the stats.' => '',
        'Defines the sender for rejected emails.' => '',
        'Defines the separator between the agents real name and the given queue email address.' =>
            '',
        'Defines the spacing of the legends.' => '',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            '',
        'Defines the standard size of PDF pages.' => '',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            '',
        'Defines the state of a ticket if it gets a follow-up.' => '',
        'Defines the state type of the reminder for pending tickets.' => '',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            '',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            '',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            '',
        'Defines the subject for rejected emails.' => '',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            '',
        'Defines the system identifier. Every ticket number and http session string contain this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of OTRS).' =>
            '',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            '',
        'Defines the time in days to keep log backup files.' => '',
        'Defines the time in seconds after which the Scheduler performs an automatic self-restart.' =>
            '',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            '',
        'Defines the type of protocol, used by ther web server, to serve the application. If https protocol will be used instead of plain http, it must be specified it here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            '',
        'Defines the used character for email quotes in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the user identifier for the customer panel.' => '',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            '',
        'Defines the valid state types for a ticket.' => '',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/otrs.UnlockTickets.pl" can be used.' =>
            '',
        'Defines the viewable locks of a ticket. Default: unlock, tmp_lock.' =>
            '',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the width of the legend.' => '',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            '',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            '',
        'Defines wich article type should be expanded when entering the overview. If nothing defined, latest article will be expanded.' =>
            '',
        'Delay time between autocomplete queries in milliseconds.' => '',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            '',
        'Deletes requested sessions if they have timed out.' => '',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            '',
        'Determines if the search results container for the autocomplete feature should adjust its width dynamically.' =>
            '',
        'Determines if the statistics module may generate ticket lists.' =>
            '',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            '',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            '',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            '',
        'Determines the next screen after the follow up screen of a zoomed ticket in the customer interface.' =>
            '',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return to search results, queueview, dashboard or the like, LastScreenView will return to TicketZoom.' =>
            '',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            '',
        'Determines the strings that will be shown as receipent (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the receipent.' =>
            '',
        'Determines the strings that will be shown as receipent (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the receipent.' =>
            '',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            '',
        'Determines which options will be valid of the recepient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            '',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            '',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be activated).' =>
            '',
        'Disables the web installer (http://yourhost.example.com/otrs/installer.pl), to prevent the system from being hijacked. If set to "No", the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If not active, it also disables the GenericAgent, PackageManager and SQL Box (to avoid the use of destructive queries, such as DROP DATABASE, and also to steal user passwords).' =>
            '',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            '',
        'Dropdown' => '',
        'Dynamic Fields Checkbox Backend GUI' => '',
        'Dynamic Fields Date Time Backend GUI' => '',
        'Dynamic Fields Drop-down Backend GUI' => '',
        'Dynamic Fields GUI' => '',
        'Dynamic Fields Multiselect Backend GUI' => '',
        'Dynamic Fields Overview Limit' => '',
        'Dynamic Fields Text Backend GUI' => '',
        'Dynamic Fields used to export the search result in CSV format.' =>
            '',
        'Dynamic fields limit per page for Dynamic Fields Overview' => '',
        'Dynamic fields options shown in the ticket message screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###AttributesView.' =>
            '',
        'Dynamic fields shown in the ticket close screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket compose screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket email screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket forward screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket free text screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket medium format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket move screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket note screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket owner screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket pending screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone inbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket preview format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket priority screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket responsible screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'DynamicField backend registration.' => '',
        'DynamicField object registration.' => '',
        'Email Addresses' => 'E-mailadressen',
        'Enables PDF output. The CPAN module PDF::API2 is required, if not installed, PDF output will be disabled.' =>
            '',
        'Enables PGP support. When PGP support is enabled for signing and securing mail, it is HIGHLY recommended that the web server be run as the OTRS user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            '',
        'Enables S/MIME support.' => '',
        'Enables customers to create their own accounts.' => '',
        'Enables file upload in the package manager frontend.' => '',
        'Enables or disable the debug mode over frontend interface.' => '',
        'Enables or disables the autocomplete feature for the customer search in the agent interface.' =>
            '',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            '',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            '',
        'Enables spell checker support.' => '',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            '',
        'Enables ticket bulk action feature only for the listed groups.' =>
            '',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            '',
        'Enables ticket watcher feature only for the listed groups.' => '',
        'Escalation view' => 'Escalatieoverzicht',
        'Event list to be displayed on GUI to trigger generic interface invokers.' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Example for dynamic dield' => '',
        'Example for dynamic field' => '',
        'Example for free text' => '',
        'Execute SQL statements.' => 'Voer SQL statements uit op de database.',
        'Executes follow up checks on In-Reply-To or References headers for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow up mail attachments checks in  mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow up mail body checks in mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow up plain/raw mail checks in mails that don\'t have a ticket number in the subject.' =>
            '',
        'Experimental "Slim" skin which tries to save screen space for power users.' =>
            '',
        'Exports the whole article tree in search result (it can affect the system performance).' =>
            '',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            '',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Standard/AgentInfo.dtl.' =>
            '',
        'Filter incoming emails.' => 'Filter inkomende e-mails.',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            '',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            '',
        'Forces to unlock tickets after being moved to another queue.' =>
            '',
        'Frontend language' => 'Taal',
        'Frontend module registration (disable company link if no company feature is used).' =>
            '',
        'Frontend module registration for the agent interface.' => '',
        'Frontend module registration for the customer interface.' => '',
        'Frontend theme' => 'Thema',
        'GenericAgent' => 'Automatische taken',
        'GenericInterface Debugger GUI' => '',
        'GenericInterface Invoker GUI' => '',
        'GenericInterface Operation GUI' => '',
        'GenericInterface TransportHTTPSOAP GUI' => '',
        'GenericInterface Web Service GUI' => '',
        'GenericInterface Webservice History GUI' => '',
        'GenericInterface Webservice Mapping GUI' => '',
        'GenericInterface module registration for the invoker layer.' => '',
        'GenericInterface module registration for the mapping layer.' => '',
        'GenericInterface module registration for the operation layer.' =>
            '',
        'GenericInterface module registration for the transport layer.' =>
            '',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files.' =>
            '',
        'Grants access, if the customer ID of the ticket matches the customer user\'s ID and the customer user has group permissions on the queue the ticket is in.' =>
            '',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). Runtime will do full-text searches on live data (it works fine for up to 50.000 tickets). StaticDB will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/otrs.RebuildFulltextIndex.pl".' =>
            '',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the crypt type of passwords must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            '',
        'If "DB" was selected for SessionModule, a column for the identifiers in session table must be specified.' =>
            '',
        'If "DB" was selected for SessionModule, a column for the values in session table must be specified.' =>
            '',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            '',
        'If "FS" was selected for SessionModule, a directory where the session data will be stored must be specified.' =>
            '',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            '',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and special paramaters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            '',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use OTRS. Specify the group, who may access the system.' =>
            '',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            '',
        'If "Sendmail" was selected as SendmailModule, the location of the sendmail binary and the needed options must be specified.' =>
            '',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            '',
        'If "SysLog" was selected for LogModule, a special log sock can be specified (on solaris you may need to use \'stream\').' =>
            '',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            '',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            '',
        'If a note is added by an agent, sets the state of a ticket in the close ticket screen of the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of a ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of a ticket in the ticket free text screen of the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of a ticket in the ticket note screen of the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of a ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            '',
        'If enabled, OTRS will deliver all CSS files in minified form. WARNING: If you turn this off, there will likely be problems in IE 7, because it cannot load more than 32 CSS files.' =>
            '',
        'If enabled, OTRS will deliver all JavaScript files in minified form.' =>
            '',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            '',
        'If enabled, the OTRS version tag will be removed from the HTTP headers.' =>
            '',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            'Indien geactiveerd worden de verschillende overzichten (Dashboard, vergrendelde tickets, wachtrijoverzicht) automatisch ververst na de ingestelde tijd.',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            '',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty.' =>
            '',
        'If this regex matches, no message will be send by the autoresponder.' =>
            '',
        'If you want to use a mirror database for agent ticket fulltext search or to generate stats, specify the DSN to this database.' =>
            '',
        'If you want to use a mirror database for agent ticket fulltext search or to generate stats, the password to authenticate to this database can be specified.' =>
            '',
        'If you want to use a mirror database for agent ticket fulltext search or to generate stats, the user to authenticate to this database can be specified.' =>
            '',
        'Ignore article with system sender type for new article feature (e. g. auto responses or email notifications).' =>
            '',
        'Includes article create times in the ticket search of the agent interface.' =>
            '',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the script "bin/otrs.RebuildTicketIndex.pl" for initial index update.' =>
            '',
        'Install ispell or aspell on the system, if you want to use a spell checker. Please specify the path to the aspell or ispell binary on your operating system.' =>
            '',
        'Interface language' => 'Taal',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'Link agents to groups.' => 'Koppel gebruikers aan groepen.',
        'Link agents to roles.' => 'Koppel gebruikers aan rollen.',
        'Link attachments to responses templates.' => 'Koppel standaard-antwoorden aan bijlagen.',
        'Link customers to groups.' => 'Koppel klanten aan groepen.',
        'Link customers to services.' => 'Koppel klanten aan services.',
        'Link queues to auto responses.' => 'Koppel wachtrijen aan automatische antwoorden.',
        'Link responses to queues.' => 'Koppel standaard-antwoorden aan wachtrijen.',
        'Link roles to groups.' => 'Koppel rollen aan groepen.',
        'Links 2 tickets with a "Normal" type link.' => 'Koppelt twee tickets met een "Normaal"-type koppeling.',
        'Links 2 tickets with a "ParentChild" type link.' => 'Koppelt twee tickets met een "vader - zoon"-type koppeling.',
        'List of CSS files to always be loaded for the agent interface.' =>
            '',
        'List of CSS files to always be loaded for the customer interface.' =>
            '',
        'List of IE6-specific CSS files to always be loaded for the customer interface.' =>
            '',
        'List of IE7-specific CSS files to always be loaded for the agent interface.' =>
            '',
        'List of IE7-specific CSS files to always be loaded for the customer interface.' =>
            '',
        'List of IE8-specific CSS files to always be loaded for the agent interface.' =>
            '',
        'List of IE8-specific CSS files to always be loaded for the customer interface.' =>
            '',
        'List of JS files to always be loaded for the agent interface.' =>
            '',
        'List of JS files to always be loaded for the customer interface.' =>
            '',
        'List of default StandardResponses which are assigned automatically to new Queues upon creation.' =>
            '',
        'Log file for the ticket counter.' => '',
        'Mail Accounts' => '',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            '',
        'Makes the application check the syntax of email addresses.' => '',
        'Makes the picture transparent.' => '',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            '',
        'Manage PGP keys for email encryption.' => 'Beheer PGP-sleutels voor encryptie van e-mail.',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'Beheer POP3 of IMAP accounts om e-mail van op te halen en om te zetten in tickets.',
        'Manage S/MIME certificates for email encryption.' => 'Beheer S/MIME certificaten voor encryptie van e-mail.',
        'Manage existing sessions.' => 'Beheer sessies van klanten en gebruikers.',
        'Manage periodic tasks.' => 'Beheer terugkerende taken.',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            '',
        'Max size of the subjects in an email reply.' => '',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            '',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            '',
        'Maximum size (in characters) of the customer info table in the queue view.' =>
            '',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            '',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            '',
        'Module to check customer permissions.' => '',
        'Module to check if a user is in a special group. Access is granted, if the user is in the specified group and has ro and rw permissions.' =>
            '',
        'Module to check if arrived emails should be marked as email-internal (because of original forwared internal email it college). ArticleType and SenderType define the values for the arrived email/article.' =>
            '',
        'Module to check the agent responsible of a ticket.' => '',
        'Module to check the group permissions for the access to customer tickets.' =>
            '',
        'Module to check the owner of a ticket.' => '',
        'Module to check the watcher agents of a ticket.' => '',
        'Module to compose signed messages (PGP or S/MIME).' => '',
        'Module to crypt composed messages (PGP or S/MIME).' => '',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            '',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            '',
        'Module to generate accounted time ticket statistics.' => '',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            '',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            '',
        'Module to generate ticket solution and response time statistics.' =>
            '',
        'Module to generate ticket statistics.' => '',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            '',
        'Module to use database filter storage.' => '',
        'Multiselect' => '',
        'My Tickets' => 'Mijn tickets',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            '',
        'New email ticket' => 'Nieuw e-mail ticket',
        'New phone ticket' => 'Nieuw telefoon ticket',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Notifications (Event)' => 'Meldingen (gebeurtenis)',
        'Number of displayed tickets' => 'Aantal weergegeven tickets',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            '',
        'Open tickets of customer' => 'Open tickets van klant',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            '',
        'Overview Escalated Tickets' => 'Overzicht geëscaleerde tickets',
        'Overview Refresh Time' => 'Verversingsinterval overzichten',
        'Overview of all open Tickets.' => 'Overzicht van alle openstaande tickets',
        'PGP Key Management' => '',
        'PGP Key Upload' => 'PGP sleutel upload',
        'Parameters for the CreateNextMask object in the preference view of the agent interface.' =>
            '',
        'Parameters for the CustomQueue object in the preference view of the agent interface.' =>
            '',
        'Parameters for the FollowUpNotify object in the preference view of the agent interface.' =>
            '',
        'Parameters for the LockTimeoutNotify object in the preference view of the agent interface.' =>
            '',
        'Parameters for the MoveNotify object in the preference view of the agent interface.' =>
            '',
        'Parameters for the NewTicketNotify object in the preferences view of the agent interface.' =>
            '',
        'Parameters for the RefreshTime object in the preference view of the agent interface.' =>
            '',
        'Parameters for the WatcherNotify object in the preference view of the agent interface.' =>
            '',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket calendar of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket stats of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the pages (in which the dynamic fields are shown) of the dynamic fields overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the medium ticket overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the small ticket overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the ticket preview overview.' =>
            '',
        'Parameters of the example SLA attribute Comment2.' => '',
        'Parameters of the example queue attribute Comment2.' => '',
        'Parameters of the example service attribute Comment2.' => '',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            '',
        'Path of the file that stores all the settings for the QueueObject object for the agent interface.' =>
            '',
        'Path of the file that stores all the settings for the QueueObject object for the customer interface.' =>
            '',
        'Path of the file that stores all the settings for the TicketObject for the agent interface.' =>
            '',
        'Path of the file that stores all the settings for the TicketObject for the customer interface.' =>
            '',
        'Performs the configured action for each event (as an Invoker) for each configured Webservice.' =>
            '',
        'Permitted width for compose email windows.' => '',
        'Permitted width for compose note windows.' => '',
        'Picture-Upload' => '',
        'PostMaster Filters' => 'E-mail filters',
        'PostMaster Mail Accounts' => 'E-mail accounts',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see http://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            '',
        'Queue view' => 'Wachtrijoverzicht',
        'Refresh Overviews after' => 'Ververs Overzichten na',
        'Refresh interval' => 'Interval',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            '',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            '',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket merge screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            '',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            '',
        'Responses <-> Queues' => 'Standaard-antwoorden <-> Wachtrijen',
        'Restores a ticket from the archive (only if the event is a state change, from closed to any open available state).' =>
            '',
        'Roles <-> Groups' => 'Rollen <-> Groepen',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            '',
        'Runs the system in "Demo" mode. If set to "Yes", agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            '',
        'S/MIME Certificate Upload' => 'S/MIME Certificaten Uploaden',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the OTRS user. You can switch between the modules even on a system that is already in production without any loss of data.' =>
            '',
        'Saves the login and password on the session table in the database, if "DB" was selected for SessionModule.' =>
            '',
        'Search backend default router.' => '',
        'Search backend router.' => '',
        'Select your frontend Theme.' => 'Kies uw thema',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            '',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            '',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            'Stuur mij een melding als een reactie op een ticket binnenkomt en ik de eigenaar van het ticket ben, of het ticket ontgrendeld is en in één van \'Mijn wachtrijen\' staat.',
        'Send notifications to users.' => 'Stuur berichten aan gebruikers.',
        'Send ticket follow up notifications' => 'Stuur meldingen bij reacties op een ticket',
        'Sender type for new tickets from the customer inteface.' => '',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            '',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            '',
        'Sends customer notifications just to the mapped customer. Normally, if no customer is mapped, the latest customer sender gets the notification.' =>
            '',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            '',
        'Sends the notifications which are configured in the admin interface under "Notfication (Event)".' =>
            '',
        'Set sender email addresses for this system.' => 'Instellen van e-mailadressen gebruikt voor dit systeem.',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            '',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            '',
        'Set this to yes if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            '',
        'Sets if ticket owner must be selected by the agent.' => '',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            '',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            '',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            '',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            '',
        'Sets the default article type for new email tickets in the agent interface.' =>
            '',
        'Sets the default article type for new phone tickets in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            '',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            '',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            '',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            '',
        'Sets the default priority for new email tickets in the agent interface.' =>
            '',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            '',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            '',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the default text for new email tickets in the agent interface.' =>
            '',
        'Sets the display order of the different items in the preferences view.' =>
            '',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is loged out.' =>
            '',
        'Sets the minimal ticket counter size (if "AutoIncrement" was selected as TicketNumberGenerator). Default is 5, this means the counter starts from 10000.' =>
            '',
        'Sets the minimum number of characters before autocomplete query is sent.' =>
            '',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            '',
        'Sets the number of search results to be displayed for the autocomplete feature.' =>
            '',
        'Sets the options for PGP binary.' => '',
        'Sets the order of the different items in the customer preferences view.' =>
            '',
        'Sets the password for private PGP key.' => '',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            '',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            '',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the size of the statistic graph.' => '',
        'Sets the stats hook.' => '',
        'Sets the system time zone (required a system with UTC as system time). Otherwise this is a diff time to the local time.' =>
            '',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the time type which should be shown.' => '',
        'Sets the timeout (in seconds) for http/ftp downloads.' => '',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            '',
        'Sets the user time zone per user (required a system with UTC as system time and UTC under TimeZone). Otherwise this is a diff time to the local time.' =>
            '',
        'Sets the user time zone per user based on java script / browser time zone offset feature at login time.' =>
            '',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            '',
        'Show article as rich text even if rich text writing is disabled.' =>
            '',
        'Shows a count of icons in the ticket zoom, if the article has attachments.' =>
            '',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            '',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to see the customer who requested the ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to see the owner of a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to see the responsible agent of a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to set a ticket as spam in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            '',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            '',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            '',
        'Shows a link to see a zoomed email ticket in plain text.' => '',
        'Shows a link to set a ticket as spam in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            '',
        'Shows all both ro and rw queues in the queue view.' => '',
        'Shows all open tickets (even if they are locked) in the escalation view of the agent interface.' =>
            '',
        'Shows all open tickets (even if they are locked) in the status view of the agent interface.' =>
            '',
        'Shows all the articles of the ticket (expanded) in the zoom view.' =>
            '',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            '',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            '',
        'Shows colors for different article types in the article table.' =>
            '',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            '',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            '',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            '',
        'Shows the activated ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            '',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            '',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            '',
        'Shows the customer user\'s info in the ticket zoom view.' => '',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.' =>
            '',
        'Shows the message of the day on login screen of the agent interface.' =>
            '',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            '',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows the title fields in the close ticket screen of the agent interface.' =>
            '',
        'Shows the title fields in the ticket free text screen of the agent interface.' =>
            '',
        'Shows the title fields in the ticket note screen of the agent interface.' =>
            '',
        'Shows the title fields in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows time in long format (days, hours, minutes), if set to "Yes"; or in short format (days, hours), if set to "No".' =>
            '',
        'Shows time use complete description (days, hours, minutes), if set to "Yes"; or just first letter (d, h, m), if set to "No".' =>
            '',
        'Skin' => 'Skin',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            '',
        'Spam Assassin example setup. Ignores emails that are marked with SpamAssassin.' =>
            '',
        'Spam Assassin example setup. Moves marked mails to spam queue.' =>
            '',
        'Specifies if an agent should receive email notification of his own actions.' =>
            '',
        'Specifies the background color of the chart.' => '',
        'Specifies the background color of the picture.' => '',
        'Specifies the border color of the chart.' => '',
        'Specifies the border color of the legend.' => '',
        'Specifies the bottom margin of the chart.' => '',
        'Specifies the different article types that will be used in the system.' =>
            '',
        'Specifies the different note types that will be used in the system.' =>
            '',
        'Specifies the directory to store the data in, if "FS" was selected for TicketStorageModule.' =>
            '',
        'Specifies the directory where SSL certificates are stored.' => '',
        'Specifies the directory where private SSL certificates are stored.' =>
            '',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "OTRS Notification Master" otrs@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address. Notifications are messages such as en::Customer::QueueUpdate or en::Agent::Move.' =>
            '',
        'Specifies the left margin of the chart.' => '',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "OTRS Notification Master" otrs@your.example.com). Notifications are messages such as en::Customer::QueueUpdate or en::Agent::Move.' =>
            '',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png, 700 x 100 pixel).' =>
            '',
        'Specifies the path of the file for the performance log.' => '',
        'Specifies the path to the converter that allows the view of Microsoft Excel files, in the web interface.' =>
            '',
        'Specifies the path to the converter that allows the view of Microsoft Word files, in the web interface.' =>
            '',
        'Specifies the path to the converter that allows the view of PDF documents, in the web interface.' =>
            '',
        'Specifies the path to the converter that allows the view of XML files, in the web interface.' =>
            '',
        'Specifies the right margin of the chart.' => '',
        'Specifies the text color of the chart (e. g. caption).' => '',
        'Specifies the text color of the legend.' => '',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            '',
        'Specifies the top margin of the chart.' => '',
        'Specifies user id of the postmaster data base.' => '',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            '',
        'Start number for statistics counting. Every new stat increments this number.' =>
            '',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            '',
        'Statistics' => 'Rapportages',
        'Status view' => 'Statusoverzicht',
        'Stores cookies after the browser has been closed.' => '',
        'Strips empty lines on the ticket preview in the queue view.' => '',
        'Textarea' => '',
        'The "bin/PostMasterMailAccount.pl" will reconnect to POP3/POP3S/IMAP/IMAPS host after the specified count of messages.' =>
            '',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            '',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            '',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            '',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            '',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the last case you should enable PostmasterFollowupSearchInRaw or PostmasterFollowUpSearchInReferences to recognize followups based on email headers and/or body.' =>
            '',
        'The headline shown in the customer interface.' => '',
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            '',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The logo shown on top of the login box of the agent interface. The URL to the image must be relative URL to the skin image directory.' =>
            '',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            '',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            '',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            '',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            '',
        'Ticket event module that triggers the escalation stop events.' =>
            '',
        'Ticket overview' => 'Ticketoverzicht',
        'Tickets' => 'Tickets',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            '',
        'Toolbar Item for a shortcut.' => '',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            '',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            '',
        'Types' => 'Typen',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            '',
        'Update and extend your system with software packages.' => 'Voeg functies toe aan uw systeem door het installeren van pakketten.',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            '',
        'Updates the ticket index accelerator.' => '',
        'Uses Cc recipients in reply Cc list on compose an email answer in the ticket compose screen of the agent interface.' =>
            '',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard responses, auto responses and notifications.' =>
            '',
        'View performance benchmark results.' => 'Bekijk resultaten van de performance log.',
        'View system log messages.' => 'Bekijk het OTRS logboek.',
        'Wear this frontend skin' => 'Kies een kleur voor de schermen',
        'Webservice path separator.' => '',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. In this text area you can define this text (This text cannot be changed by the agent).' =>
            '',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            '',
        'Your language' => 'Uw taal',
        'Your queue selection of your favorite queues. You also get notified about those queues via email if enabled.' =>
            'Uw selectie van favoriete wachtrijen. U ontvangt automatisch een melding van nieuwe tickets in deze wachtrij, als u hiervoor heeft gekozen.',

        #
        # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
        #
        '"}' => '"}',
        '%s Tickets affected! Do you really want to use this job?' => '%s Tickets worden bewerkt! Weet u zeker dat u deze actie wilt uitvoeren?',
        '(Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behinde a dial-up line $!)' =>
            '(Controleerd MX-records voor e-mailadressen)',
        '(Email of the system admin)' => '(E-mail van de beheerder)',
        '(Full qualified domain name of your system)' => '(DNS-naam van dit systeem, bijvoorbeeld otrs.mycompany.local)',
        '(Logfile just needed for File-LogModule!)' => '(Logbestand alleen nodig voor File-LogModule',
        '(Note: It depends on your installation how many dynamic objects you can use)' =>
            '(Let op: het is afhankelijk van uw installatie hoeveel dynamische metrieken u kunt gebruiken)',
        '(Note: Useful for big databases and low performance server)' => '(Nuttig voor grote databases en langzame servers)',
        '(The identify of the system. Each ticket number and each http session id starts with this number)' =>
            '(De identificatie van dit systeem. Ieder ticketnummer en ieder HTTP sessie-id start met dit nummer)',
        '(Used default language)' => '(Gebruikte standaardtaal)',
        '(Used log backend)' => '(gebruikte logmodule)',
        'A SLA should have a name!' => 'Vul een naam in.',
        'A article should have a title!' => 'Geef een onderwerp op voor de interactie.',
        'A filter should have a name!' => 'Geef een naam op voor dit filter.',
        'A message must be spell checked!' => 'De spelling moet gecontroleerd worden.',
        'A message should have a To: recipient!' => 'Geef teminste één geadresseerde (aan:) op.',
        'A message should have a body!' => 'Geen berichttekst ingevuld.',
        'A message should have a customer!' => 'Klant is verplicht.',
        'A message should have a subject!' => 'Geef een onderwerp op voor dit bericht.',
        'A message should have a subject! .' => 'Onderwerp is verplicht',
        'A required field is:' => 'Verplicht veld:',
        'A ticket should be associated with a queue!' => 'Een ticket moet in een wachtrij geplaatst worden.',
        'A ticket should have a type!' => 'Type is verplicht.',
        'A web calendar' => 'Kalender',
        'A web file manager' => 'Een online bestandsbeheerder',
        'A web mail client' => 'Webmail gebruiker',
        'About OTRS' => 'Over OTRS',
        'Absolut Period' => 'Absolute data',
        'Accept the license' => 'Accepteer de licentie',
        'Add Customer User' => 'Klanten toevoegen',
        'Add System Address' => 'Systeem e-mailadres toevoegen',
        'Add User' => 'Nieuwe gebruiker toevoegen',
        'Add a new Agent.' => 'Voeg hier een nieuwe gebruiker toe.',
        'Add a new Customer Company.' => 'Voeg een nieuw bedrijf toe.',
        'Add a new Group.' => 'Nieuwe groep toevoegen.',
        'Add a new Notification.' => 'Voeg een melding toe.',
        'Add a new Priority.' => 'Nieuwe prioriteit toevoegen.',
        'Add a new Role.' => 'Voeg een nieuwe rol toe.',
        'Add a new SLA.' => 'Nieuwe SLA toevoegen.',
        'Add a new Salutation.' => 'Een nieuwe aanhef toevoegen.',
        'Add a new Service.' => 'Voeg nieuwe service toe.',
        'Add a new Signature.' => 'Nieuwe handtekening toevoegen.',
        'Add a new State.' => 'Voeg een nieuwe status toe.',
        'Add a new System Address.' => 'Voeg nieuw systeem e-mailadres toe.',
        'Add a new Type.' => 'Nieuw type toevoegen.',
        'Add a new salutation' => 'Voeg een nieuwe aanhef toe',
        'Add note to ticket' => 'Notitie toevoegen aan ticket',
        'Added User "%s"' => 'Gebruiker "%s" toegevoegd.',
        'Admin-Area' => 'Beheer',
        'Admin-Email' => 'Admin e-mailadres',
        'Admin-Password' => 'Wachtwoord',
        'Admin-Support Overview' => 'Bekijk systeeminformatie en start een support aanvraag naar het OTRS team.',
        'Admin-User' => 'Account met databasebeheerrechten',
        'Admin-password' => 'Wachtwoord',
        'Agent Mailbox' => 'Gebruiker postvak',
        'Agent Preferences' => 'Gebruiker voorkeuren',
        'Agent based' => 'Gebaseerd op gebruiker',
        'Agent-Area' => 'Gebruiker',
        'All Agents' => 'Alle gebruikers',
        'All Customer variables like defined in config option CustomerUser.' =>
            'Alle klantvariabelen zoals vastgelegd in de configuratieoptie Klant.',
        'All customer tickets.' => 'Alle tickets van deze klant.',
        'All email addresses get excluded on replaying on composing an email.' =>
            'OTRS zal nooit mail sturen aan alle hier gedefiniëerde adressen.',
        'All incoming emails with this "Email" (To:) will be dispatched in the selected queue!' =>
            'Alle binnenkomende emails met deze "To:" worden in de gekozen wachtrij geplaatst.',
        'All messages' => 'Alle berichten',
        'All new tickets!' => 'Alle nieuwe tickets.',
        'All tickets where the reminder date has reached!' => 'Alle tickets waar het herinnermoment is bereikt.',
        'All tickets which are escalated!' => 'Alle geëscaleerde tickets',
        'Allocate %s to' => 'Wijs %s toe aan',
        'Allocate CustomerUser to service' => 'Koppel klanten aan service',
        'Allocate services to CustomerUser' => 'Koppel services aan klant',
        'Allow empty value' => 'Lege waarden zijn toegestaan',
        'An' => 'een',
        'Answer' => 'Antwoord',
        'Article Create Times' => 'Aanmaakdatum interacties',
        'Article created' => 'Interactie aangemaakt op',
        'Article created between' => 'Interactie aangemaakt tussen',
        'Article filter settings' => 'Filter',
        'ArticleID' => 'Interactie ID',
        'Articles' => 'Interacties',
        'Attach' => 'Toevoegen',
        'Attribute' => 'Eigenschap',
        'Auto Response From' => 'E-mailadres',
        'Body is required.' => 'Tekst is verplicht.',
        'Bounce Ticket: ' => 'Bounce Ticket: ',
        'Bounce ticket' => 'Bounce Ticket',
        'Bulk-Action' => 'Bulk actie',
        'CSV' => 'CSV',
        'Can not create link with %s!' => 'Kan geen koppeling maken met %s.',
        'Can not delete link with %s!' => 'Kan koppeling met %s niet verwijderen.',
        'Can\'t update password, invalid characters!' => 'Uw wachtwoord kan niet worden gewijzigd, er zijn ongeldige karakters gevonden.',
        'Can\'t update password, must be at least %s characters!' => 'Uw wachtwoord kan niet worden gewijzigd, er zijn minimaal %s karakters noodzakelijk.',
        'Can\'t update password, must contain 2 lower and 2 upper characters!' =>
            'Uw wachtwoord kan niet worden gewijzigd, er zijn minimaal 2 kleine en 2 hoofdletters noodzakelijk.',
        'Can\'t update password, needs at least 1 digit!' => 'Uw wachtwoord kan niet worden gewijzigd, er is minimaal 1 cijfer noodzakelijk.',
        'Can\'t update password, needs at least 2 characters!' => 'Uw wachtwoord kan niet worden gewijzigd, er zijn minimaal 2 letters noodzakelijk.',
        'Can\'t update password, your new passwords do not match! Please try again!' =>
            'Uw wachtwoord kan niet worden gewijzigd, de wachtwoorden komen niet overeen. Probeer het opnieuw.',
        'Category Tree' => 'Categorie-boom',
        'Change %s Relations for' => 'Bewerk gekoppelde %s voor',
        'Change %s Relations for %s' => 'Bewerk %s koppelingen voor %s',
        'Change %s settings' => 'Wijzig instellingen voor %s',
        'Change Times' => 'Zoek op wijzigingen',
        'Change free text of ticket' => 'Verander de vrije tekstvelden van een ticket.',
        'Change owner of ticket' => 'Wijzig eigenaar van ticket',
        'Change priority of ticket' => 'Prioriteit wijzigen voor ticket',
        'Change responsible of ticket' => 'Wijzig verantwoordelijke van dit ticket',
        'Change the ticket priority!' => 'Wijzig de prioriteit van het ticket.',
        'Change the ticket responsible!' => 'Wijzig de verantwoordelijke van het ticket.',
        'Change user <-> group settings' => 'Wijzigen van gebruiker <-> groep toekenning',
        'ChangeLog' => 'Wijziging',
        'Child-Object' => 'Zoon-item',
        'City{CustomerUser}' => 'Woonplaats',
        'Clear From' => 'Wis e-mailadres',
        'Clear To' => '"Aan" leeg maken',
        'Click here to report a bug!' => 'Klik hier om een fout te rapporteren.',
        'Close Times' => 'Zoek op sluitdatum',
        'Close this ticket!' => 'Sluit dit ticket.',
        'Close ticket' => 'Sluit ticket',
        'Close type' => 'Afsluitcode',
        'Close!' => 'Sluit',
        'Collapse View' => 'Ingekort',
        'Comment (internal)' => 'Interne opmerking',
        'Comment{CustomerUser}' => 'Opmerking',
        'CompanyTickets' => 'Tickets van bedrijf',
        'Compose Answer' => 'Antwoord opstellen',
        'Compose Email' => 'E-mail opstellen',
        'Compose Follow up' => 'Reactie aanmaken',
        'Config Options' => 'Configuratie',
        'Config options (e. g. &lt;OTRS_CONFIG_HttpType&gt;)' => 'Configuratiegegevens (bijvoorbeeld &lt;OTRS_CONFIG_HttpType&gt;)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>)' => 'Configuratie opties (bijvoorbeeld <OTRS_CONFIG_HttpType>)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>).' => 'Configuratie-gegevens (bijvoorbeeld <OTRS_CONFIG_HttpType>).',
        'Contact customer' => 'Neem contact op',
        'Context Settings' => 'Context',
        'Country{CustomerUser}' => 'Land',
        'Create New Template' => 'Maak nieuwe template',
        'Create Times' => 'Zoek op aanmaakdatum',
        'Create new Phone Ticket' => 'Maak nieuw telefoon ticket aan',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...).' =>
            'Maak nieuwe groepen aan om de toegangsrechten te regelen voor verschillende groepen van agenten (bijvoorbeeld verkoopafdeling, supportafdeling).',
        'Create your first Ticket' => 'Maak uw eerste ticket aan',
        'Create/Expires' => 'Verloopt',
        'CreateTicket' => 'Ticket aanmaken',
        'Customer Move Notify' => 'Klantmelding bij verplaatsen',
        'Customer Owner Notify' => 'Klantmelding andere eigenaar',
        'Customer State Notify' => 'Klantmelding andere status',
        'Customer User' => 'Klant',
        'Customer User Management' => 'Gebruikersbeheer klanten',
        'Customer Users' => 'Klanten',
        'Customer Users <-> Groups' => 'Klanten <-> Groepen',
        'Customer Users <-> Groups Management' => 'Klanten <-> Groepen beheer',
        'Customer Users <-> Services' => 'Klanten <-> Services',
        'Customer Users <-> Services Management' => 'Beheer Klanten <-> Services',
        'Customer history' => 'Klantgeschiedenis',
        'Customer history search' => 'Zoeken in klantgeschiedenis',
        'Customer history search (e. g. "ID342425").' => 'Klantgeschiedenis zoeken (bijvoorbeeld "ID342425").',
        'Customer user will be needed to have a customer history and to login via customer panel.' =>
            'Klanten moeten een klanthistorie hebben voordat zij kunnen inloggen via de klantschermen.',
        'CustomerGroupSupport needs to be active in Kernel/Config.pm, read more about this feature in the documentation. Take care!' =>
            'Ondersteuning voor klantgroepen moet worden geactiveerd in de Configuratie. Lees meer hierover in de documentatie: zoek op \'CustomerGroupSupport\'.',
        'CustomerID{CustomerUser}' => 'Klantnummer',
        'CustomerUser' => 'Klant',
        'D' => 'D',
        'DB connect host' => 'Hostnaam databaseserver',
        'Database Backend' => 'Database',
        'Days' => 'Dagen',
        'Default' => 'Standaard',
        'Default Charset' => 'Standaard karakterset',
        'Default Language' => 'Standaardtaal',
        'Delete this ticket!' => 'Verwijder dit ticket.',
        'Detail' => 'Detail',
        'Diff' => 'Diff',
        'Discard all changes and return to the compose screen' => 'Veranderingen niet opslaan en ga terug naar het berichtscherm',
        'Display Name' => 'Weergegeven naam',
        'Do dispatch or filter incoming emails based on email X-Headers! RegExp is also possible.' =>
            'U kunt ontvangen e-mailberichten filteren op basis van het e-mailadres, headers, het onderwerp of andere eigenschappen.',
        'Do you really want to delete this Object?' => 'Weet u zeker dat u dit item wilt verwijderen?',
        'Do you really want to reinstall this package (all manual changes get lost)?' =>
            'Wilt u dit pakket echt herinstalleren? Alle handmatige wijzigingen gaan verloren.',
        'Don\'t forget to add a new user to groups and/or roles!' => 'vergeet niet om een nieuwe gebruiker te koppelen aan de benodigde groepen en/of rollen.',
        'Don\'t forget to add a new user to groups!' => 'vergeet niet om groepen aan deze gebruiker toe te kennen.',
        'Don\'t work with UserID 1 (System account)! Create new users!' =>
            'Werk niet met deze gebruiker (User# 1 - systeemaccount). Maak nieuwe gebruikers aan!',
        'Download Settings' => 'Download configuratie',
        'Download all system config changes.' => 'De configuratie opslaan in een bestand.',
        'Dynamic-Object' => 'Dynamische metriek',
        'Edit Article' => 'Bewerk interactie',
        'Edit default services.' => 'Wijzig standaard services.',
        'Email Address' => 'E-mailadres',
        'Email based' => 'Gebaseerd op e-mail',
        'Email of the system admin.' => 'E-mail van de beheerder.',
        'Email{CustomerUser}' => 'E-mailadres',
        'Escalation - First Response Time' => 'Escalatiemoment First Response',
        'Escalation - Solution Time' => 'Escalatiemoment oplostijd',
        'Escalation - Update Time' => 'Escalatiemoment Update Time',
        'Escalation Times' => 'Escalatiemoment',
        'Escalation time' => 'Escalatietijd',
        'Event is required!' => 'Kies een event.',
        'Expand View' => 'Uitgebreid',
        'Explanation' => 'Uitleg',
        'Export Config' => 'Exporteer configuratie',
        'Fax{CustomerUser}' => 'Fax',
        'FileManager' => 'Bestandsbeheer',
        'Filelist' => 'Bestandslijst',
        'Filter for Language' => 'Filter op taal',
        'Filter name is required.' => 'Filter naam is verplicht.',
        'Filtername' => 'Naam filter',
        'Firstname{CustomerUser}' => 'Voornaam',
        'Follow up' => 'Reactie',
        'Follow up notification' => 'Melding bij reacties',
        'For very complex stats it is possible to include a hardcoded file.' =>
            'Voor zeer complexe rapportages is het mogelijk om een \'hardcoded\' bestand te gebruiken.',
        'Forward ticket: ' => 'Doorsturen:',
        'Frontend' => 'Interface',
        'Fulltext-Search in Article (e. g. "Mar*in" or "Baue*")' => 'Gebruik wildcards (bijvoorbeeld "Mar*in" of "Jans*")',
        'Go' => 'Uitvoeren',
        'Go to group %s' => 'Toon groep %s',
        'Group %s' => 'Groep %s',
        'Group Ro' => 'Alleen-lezen groep',
        'Group based' => 'Gebaseerd op groep',
        'Group selection' => 'Groep selectie',
        'HTML' => 'HTML',
        'Hash/Fingerprint' => 'Hash',
        'Have a lot of fun!' => 'Veel plezier!',
        'Here you can define the value series. You have the possibility to select one or two elements. Then you can select the attributes of elements. Each attribute will be shown as single value series. If you don\'t select any attribute all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            'Hier kunt u de waarden op de Y-as kiezen. U kunt één of twee elementen kiezen. Vervolgens kunt u de getoonde attributen van de elementen kiezen. Ieder attribuut wordt getoond als een eigen waarde. Als u geen waarde kiest worden alle attributen van het element gebruikt bij het genereren van het rapport.',
        'Here you can define the value series. You have the possibility to select one or two elements. Then you can select the attributes of elements. Each attribute will be shown as single value series. If you don\'t select any attribute all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Hier kunt u de Y-as definiëren. U heeft de mogelijkheid om één of twee elementen te selecteren. Daarna kunt u de attributen kiezen. Als u geen attribuut selecteerd zullen alle attributen gebruikt worden.',
        'Here you can define the x-axis. You can select one element via the radio button. If you make no selection all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            'Hier kunt u de X-as definiëren. U kunt een element kiezen met de radio-button. Als u geen selectie maakt worden alle attributen van het element getoond bij het aanmaken van het rapport.',
        'Here you can define the x-axis. You can select one element via the radio button. Then you you have to select two or more attributes of the element. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Hier kunt u de waarden voor de X-as definiëren. U kunt een element kiezen via de radiobutton. Daarna kunt u twee of meer attributen van dit element kiezen. Als u géén selectie maakt worden alle attributen van dit element gebruikt in de rapportage.',
        'Here you can insert a description of the stat.' => 'Hier kunt u een beschrijving van deze statistieken toevoegen.',
        'Here you can select the dynamic object you want to use.' => 'Selecteer de metriek die u wilt gebruiken.',
        'Home' => 'Home',
        'IMAP' => 'IMAP',
        'IMAPS' => 'IMAPS',
        'If Secure Mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Als Secure Mode nog niet aan staat moet u deze activeren in de Systeemconfiguratie.',
        'If a new hardcoded file is available this attribute will be shown and you can select one.' =>
            'Als een \'hardcoded\' bestand beschikbaar is zal deze automatisch getoond worden en kunt u deze hier selecteren.',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked for the old owner.' =>
            'Wanneer een ticket wordt gesloten en de klant stuurt een follow up wordt het ticket vergrendeld voor de oorspronkelijke eigenaar.',
        'If a ticket will not be answered in this time, just only this ticket will be shown.' =>
            'Als een ticket niet binnen deze tijd is beantwoord zal alleen dit ticket worden getoond.',
        'If an agent locks a ticket and he/she will not send an answer within this time, the ticket will be unlock automatically. So the ticket is viewable for all other agents.' =>
            'Wanneer een gebruiker een ticket vergrendelt en hij/zij stuurt geen antwoord binnen de vergrendeltijd dan zal het ticket automatisch ontgrendeld worden. Het ticket kan dan door andere gebrukers worden ingezien.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the user).' =>
            'Als er geen selectie is gemaakt dan zijn er geen permissies voor deze groep (Tickets zullen dus niet beschikbaar zijn voor de gebruiker).',
        'If you need the sum of every column select yes.' => 'Selecteer \'ja\' als u totalen per kolom wilt.',
        'If you need the sum of every row select yes' => 'Selecteer \'ja\' als u totalen per rij wilt',
        'If you use RegExp, you also can use the matched value in () as [***] in \'Set\'.' =>
            'Bij gebruik van RegExp kunt u ook de gematchte waarde tussen haken () gebruiken als variabele met naam [***].',
        'If you want to account time, please provide Subject and Text!' =>
            'Als u tijd wilt registreren voor dit ticket, vul dan ook de velden Onderwerp en Tekst.',
        'If your account is trusted, the already existing x-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Wanneer het account vertrouwd is, zullen de X-OTRS headers gebruikt worden! PostMaster filters zullen ook nog steeds gebruikt worden.',
        'Image' => 'Afbeelding',
        'Important' => 'Belangrijk',
        'In this form you can select the basic specifications.' => 'Hier kunt u de algemene eigenschappen opgeven.',
        'Information about the Stat' => 'Informatie over deze statistieken',
        'Insert of the common specifications' => 'Geef eigenschappen van rapporten op',
        'Is Job Valid' => 'Is de taak actief',
        'Is Job Valid?' => 'Is de taak actief?',
        'It\'s useful for ASP solutions.' => 'Bruikbaar voor ASP-oplossingen.',
        'It\'s useful for a lot of users and groups.' => 'Dit is nuttig bij grote hoeveelheden gebruikers en/of groepen.',
        'Job-List' => 'Takenlijst',
        'Keyword' => 'Trefwoord',
        'Keywords' => 'Trefwoorden',
        'Last update' => 'Laatste wijziging',
        'Lastname{CustomerUser}' => 'Achternaam',
        'Link Table' => 'Koppelingen',
        'Link auto responses to queues.' => 'Koppel wachtrijen aan automatische antwoorden.',
        'Link queues to auto responses..' => 'Koppel wachtrijen aan automatische antwoorden.',
        'Link this ticket to an other objects!' => 'Koppel het ticket met andere items.',
        'Link this ticket to other objects!' => 'Koppel dit ticket aan andere objecten.',
        'Link to Parent' => 'Koppel aan vader-item',
        'Linked as' => 'Gekoppeld als',
        'Load Settings' => 'Laad configuratie uit bestand',
        'Lock it to work on it!' => 'Vergrendel een ticket om er mee te kunnen werken.',
        'Logfile' => 'Logbestand',
        'Logfile too large, you need to reset it!' => 'Het logbestand is te groot, leeg deze eerst.',
        'Login failed! Your username or password was entered incorrectly.' =>
            'Aanmelden is mislukt. Uw gebruikersnaam of wachtwoord is onjuist.',
        'Lookup' => 'Zoek',
        'Mail Management' => 'Mail beheer',
        'Mailbox' => 'Postbus',
        'Match' => 'Zoek eigen',
        'Max. displayed tickets' => 'Maximaal aantal weergegeven tickets',
        'Max. shown Tickets a page' => 'Max. aantal tickets per pagina',
        'Merge this ticket!' => 'Voeg dit Ticket samen met een ander ticket.',
        'Message for new Owner' => 'Bericht voor nieuwe eigenaar',
        'Message sent to' => 'Bericht verstuurd naar',
        'Misc' => 'Overige',
        'Mobile{CustomerUser}' => 'Mobiel',
        'Modified' => 'Gewijzigd',
        'Modules' => 'Modulen',
        'Move notification' => 'Stuur mij een melding bij het verplaatsen van een ticket',
        'Multiple selection of the output format.' => 'Vorm van de rapportage, meerdere selecties zijn mogelijk.',
        'My Queue' => 'Mijn wachtrij',
        'MyTickets' => 'Mijn tickets',
        'Name is required!' => 'Naam is verplicht.',
        'Name is required.' => 'De naam is verplicht.',
        'Need a valid email address or don\'t use a local address!' => 'Een e-mailadres is verplicht. U kunt geen lokale adressen gebruiken.',
        'Need a valid mail address or don\'t use a local email address' =>
            'Een e-mailadres is verplicht. U kunt geen lokale adressen gebruiken.',
        'Need a valid mail address or don\'t use a local email address.' =>
            'Een e-mailadres is verplicht. U kunt geen lokale adressen gebruiken.',
        'Need valid email address or don\'t use local address' => 'Het e-mailadres is ongeldig',
        'New Agent' => 'Nieuwe gebruiker',
        'New Customer' => 'Nieuwe klant',
        'New Dynamic Fields' => 'Nieuwe dynamische velden',
        'New Group' => 'Nieuwe groep',
        'New Group Ro' => 'Nieuwe groep',
        'New Password' => 'Nieuw wachtwoord',
        'New Priority' => 'Nieuwe prioriteit',
        'New SLA' => 'Nieuwe SLA',
        'New Service' => 'Nieuwe service',
        'New State' => 'Nieuwe status',
        'New Ticket Lock' => 'Nieuwe ticketvergrendeling',
        'New TicketFreeFields' => 'Nieuwe vrije velden',
        'New Title' => 'Nieuwe titel',
        'New Type' => 'nieuw type',
        'New account created. Sent Login-Account to %s.' => 'Nieuw account aangemaakt. De logingegevens zijn verstuurd aan %s.',
        'New messages' => 'Nieuwe berichten',
        'New password again' => 'Bevestig nieuw wachtwoord',
        'Next Week' => 'Volgende week',
        'No * possible!' => 'Gebruik van een * is niet mogelijk.',
        'No Packages for requested Framework in this Online Repository, but Packages for other Frameworks!' =>
            'Voor het gevraagde framework zijn er geen pakketten gevonden in de Online Repository.',
        'No Packages or no new Packages in selected Online Repository!' =>
            'Geen pakketten (of geen nieuwe pakketten) gevonden in de geselecteerde Online Repository.',
        'No Permission' => 'Geen permissies',
        'No matches found' => 'Geen overeenkomsten gevonden',
        'No means, send agent and customer notifications on changes.' => ' ',
        'No time settings.' => 'Geen tijdinstellingen.',
        'Note Text' => 'Notitietekst',
        'Notification (Customer)' => 'Melding (klant)',
        'Notifications' => 'Meldingen',
        'OTRS sends an notification email to the customer if the ticket is moved.' =>
            'Het systeem stuurt een melding naar de klant wanneer het ticket wordt verplaatst.',
        'OTRS sends an notification email to the customer if the ticket owner has changed.' =>
            'Het systeem stuurt een melding naar de klant wanneer de eigenaar is veranderd.',
        'OTRS sends an notification email to the customer if the ticket state has changed.' =>
            'Het systeem stuurt een melding naar de klant wanneer de status is veranderd.',
        'Object already linked as %s.' => 'Object al gekoppeld aan %s.',
        'Of couse this feature will take some system performance it self!' =>
            'Deze instelling gaat zelf ook een beetje ten koste van de systeemperformance.',
        'Online' => 'Ingelogd',
        'Only for ArticleCreate Event.' => 'Alleen voor ArticleCreate.',
        'Open Tickets' => 'Openstaande tickets',
        'Options of the current customer user data (e. g. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)' =>
            'Attributen van de huidige klant (bijvoorbeeld &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>)' =>
            'Opties van de data van de klant (bijvoorbeeld <OTRS_CUSTOMER_DATA_UserFirstname>)',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>).' =>
            'Gegevens van de huidige klant (bijvoorbeeld <OTRS_CUSTOMER_DATA_UserFirstname>).',
        'Options of the current user who requested this action (e. g. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)' =>
            'Gegevens van de huidige gebruiker (bijvoorbeeld &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>)' =>
            'Opties van de gebruiker die deze actie heeft aangevraagd (bijvoorbeeld <OTRS_CURRENT_UserFirstname>)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>).' =>
            'Gegevens van de huidige gebruiker die deze actie heeft verzocht (bijvoorbeeld <OTRS_CURRENT_UserFirstname>).',
        'Options of the ticket data (e. g. &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)' =>
            'Ticketgegevens (bijvoorbeeld &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)',
        'Options of the ticket data (e. g. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Ticket gegevens (e. g. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Gegevens van het ticket (bijvoorbeeld <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Gegevens van het ticket(bijvoorbeeld <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).' =>
            'Gegevens van het ticket (bijvoorbeeld <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).',
        'Other Options' => 'Overige opties',
        'Out Of Office' => 'Afwezigheid',
        'POP3' => 'POP3',
        'POP3 Account Management' => 'POP3 toegang beheer',
        'POP3S' => 'POP3S',
        'Package' => 'Pakket',
        'Package not correctly deployed! You should reinstall the Package again!' =>
            'Pakket is niet goed geïnstalleerd! Installeer het pakket opnieuw.',
        'Package not correctly deployed! You should reinstall the package again!' =>
            'Pakket is niet correct geïnstalleerd. Installeer het pakket opnieuw.',
        'Param 1' => 'Parameter 1',
        'Param 1 key' => 'Parameter 1 sleutel',
        'Param 1 value' => 'Parameter 1 waarde',
        'Param 2' => 'Parameter 2',
        'Param 2 key' => 'Parameter 2 sleutel',
        'Param 2 value' => 'Parameter 2 waarde',
        'Param 3' => 'Parameter 3',
        'Param 3 key' => 'Parameter 3 sleutel',
        'Param 3 value' => 'Parameter 3 waarde',
        'Param 4' => 'Parameter 4',
        'Param 4 key' => 'Parameter 4 sleutel',
        'Param 4 value' => 'Parameter 4 waarde',
        'Param 5' => 'Parameter 5',
        'Param 5 key' => 'Parameter 5 sleutel',
        'Param 5 value' => 'Parameter 5 waarde',
        'Param 6' => 'Parameter 6',
        'Param 6 key' => 'Parameter 6 sleutel',
        'Param 6 value' => 'Parameter 6 waarde',
        'Parent-Object' => 'Vader',
        'Password is already in use! Please use an other password!' => 'Wachtwoord wordt al gebruikt. Kies een ander wachtwoord.',
        'Password is already used! Please use an other password!' => 'Wachtwoord is al in gebruik. Kies een ander wachtwoord.',
        'Passwords doesn\'t match! Please try it again!' => 'Wachtwoorden komen niet overeen! Probeer het opnieuw.',
        'Pending Times' => 'Wachtend tot',
        'Pending messages' => 'Wachtende berichten',
        'Pending type' => 'In de wacht: type',
        'Permission settings. You can select one or more groups to make the configurated stat visible for different agents.' =>
            'U kunt één of meer groepen selecteren om de rapoorten voor de gebruikers beschikbaar te maken.',
        'Permissions to change the ticket owner in this group/queue.' => 'Permissies om de eigenaar van het ticket in deze groep / wachtrij te wijzigen.',
        'PhoneView' => 'Telefoonscherm',
        'Phone{CustomerUser}' => 'Telefoon',
        'Please command us.' => 'Maak er s.v.p. eentje aan.',
        'Please contact your admin' => 'Vraag uw systeembeheerder',
        'Please enter subject.' => 'Vul een onderwerp in.',
        'Please provide a name.' => 'Vul een naam in.',
        'Please select a value' => 'Selecteer een waarde',
        'PostMaster Filter' => 'E-mail filters',
        'PostMaster Mail Account' => 'E-mail account',
        'Prio' => 'Prioriteit',
        'Problem' => 'Probleem',
        'Queue <-> Auto Responses Management' => 'Wachtrij <-> Automatische antwoorden',
        'Queue ID' => 'Wachtrij ID',
        'Queue Management' => 'Beheer wachtrijen',
        'Queue is required.' => 'Wachtrij is een verplicht veld.',
        'QueueView Refresh Time' => 'Verversingstijd wachtrij',
        'Rebuild' => 'Genereer opnieuw',
        'Recipients' => 'Geadresseerden',
        'Reminder' => 'Herinnering',
        'Reminder messages' => 'Herinneringsberichten',
        'Required Field' => 'Verplicht veld',
        'Required!' => 'Verplicht',
        'Response Management' => 'Beheer standaard-antwoorden',
        'Responses <-> Attachments Management' => 'Beheer Standaard-Antwoorden <-> Bijlagen',
        'Responses <-> Queue Management' => 'Beheer Standaard-Antwoorden <-> Wachtrijen',
        'Return to the compose screen' => 'Terug naar berichtscherm',
        'Role' => 'Rol',
        'Roles <-> Agents' => 'Gebruikers <-> Rollen',
        'Roles <-> Groups Management' => 'Beheer Rollen <-> Groepen',
        'Roles <-> Users' => 'Rollen <-> Gebruikers',
        'Roles <-> Users Management' => 'Beheer Rollen <-> Gebruikers',
        'Run Search' => 'Zoek',
        'Save Job as?' => 'Sla taak op onder',
        'Save Search-Profile as Template?' => 'Zoekprofiel als sjabloon bewaren ?',
        'Schedule' => 'Plan in',
        'Search Result' => 'Zoekresultaat',
        'Search Ticket' => 'Zoek Ticket',
        'Search for' => 'Zoek naar',
        'Search for customers (wildcards are allowed).' => 'Typ om te zoeken naar klanten (wildcards toegestaan).',
        'Search-Profile as Template?' => 'Bewaar als sjabloon?',
        'Secure Mode need to be enabled!' => 'Secure Mode moet geactiveerd zijn.',
        'Select Box' => 'SQL select query',
        'Select Box Result' => 'Resultaat',
        'Select Group' => 'Kies groep',
        'Select Source (for add)' => 'Selecteer bron (voor toevoegen)',
        'Select group' => 'Selecteer groep',
        'Select the customeruser:service relations.' => 'Selecteer de klant:service koppelingen.',
        'Select the element, which will be used at the X-axis' => 'Selecteer het element dat gebruikt zal worden voor de X-as',
        'Select the restrictions to characterise the stat' => 'Selecteer over welke data gerapporteerd moet worden',
        'Select the role:user relations.' => 'Selecteer de rol:gebruiker relatie.',
        'Select the user:group permissions.' => 'Selecteer de gebruikers:groep permissies.',
        'Select your QueueView refresh time.' => 'Selecteer de verversingstijd van de wachtrij in uw scherm.',
        'Select your default spelling dictionary.' => 'Selecteer uw standaard spellingsbibliotheek.',
        'Select your frontend Charset.' => 'Kies uw karakterset.',
        'Select your frontend QueueView.' => 'Kies uw weergave van de wachtrij.',
        'Select your frontend language.' => 'Kies uw taal.',
        'Select your out of office time.' => 'Geef hieronder het tijdvak aan waarin u afwezig bent. Gedurende deze periode zien andere behandelaars uw afwezigheid.',
        'Select your screen after creating a new ticket.' => 'Selecteer het vervolgscherm na het invoeren van een nieuw ticket.',
        'Selection needed' => 'Selectie benodigd',
        'Send Administrative Message to Agents' => 'Stuur berichten naar gebruikers',
        'Send Notification' => 'Stuur melding',
        'Send me a notification if a customer sends a follow up and I\'m the owner of this ticket.' =>
            'Stuur mij een melding als een klant een reactie geeft en ik de eigenaar van het ticket ben.',
        'Send me a notification of an watched ticket like an owner of an ticket.' =>
            'Stuur mij meldingen van gevolgde tickets alsof ik de eigenaar ben.',
        'Send no notifications' => 'Stuur geen meldingen',
        'Sent new password to: %s' => 'Nieuw wachtwoord verstuurd naar %s',
        'Sent password reset instructions to %s. Please check your email.' =>
            'Wachtwoord reset instructies zijn verstuurd aan %s. Controleer uw e-mail.',
        'Sent password token to: %s' => 'Wachtwoord verstuurd naar %s',
        'Sessions' => 'Sessies',
        'Set customer user and customer id of a ticket' => 'Wijs de klant en klantID aan een ticket toe',
        'Set this ticket to pending!' => 'Plaats dit ticket in de wacht.',
        'Show' => 'Toon',
        'Solution' => 'Oplossing',
        'Some result formats are disabled because at least one needed package is not installed. Please contact your administrator.' =>
            'Sommige formaten worden niet getoond omdat de juiste bibliotheken niet zijn geïnstalleerd. Vraag uw beheerder.',
        'Sorry, feature not active!' => 'Deze functie is niet actief.',
        'Sort by' => 'Sorteer op',
        'Source' => 'Bron',
        'Specify the height of the edit field in lines.' => 'Geef de hoogte van het tekstveld in regels',
        'Specify the width of the edit field in characters.' => 'Geef de breedte van het tekstveld in tekens',
        'Spell Check' => 'Spellingscontrole',
        'Split' => 'Splitsen',
        'State Type' => 'Status type',
        'Static-File' => '\'Hardcoded\' bestand',
        'Stats-Area' => 'Statistieken',
        'Step %s of %s' => 'Stap %s van %s',
        'Step 1' => 'Stap 1',
        'Step 2' => 'Stap 2',
        'Step 3' => 'Stap 3',
        'Step 4' => 'Stap 4',
        'Street{CustomerUser}' => 'Straat',
        'Sub-Queue of' => 'Subwachtrij van',
        'Sub-Service of' => 'Service is onderdeel van',
        'Subject is required.' => 'Onderwerp is verplicht.',
        'Subscribe' => 'Inschrijven',
        'Support Assessment' => 'Support',
        'Symptom' => 'Symptoom',
        'System History' => 'Systeem geschiedenis',
        'System State Management' => 'Statusbeheer',
        'Systemaddress' => 'Systeem-adres',
        'Take care that you also updated the default states in you Kernel/Config.pm!' =>
            'Bewerk ook de statussen in Kernel/Config.pm',
        'Text is required!' => 'Tekst is verplicht.',
        'The SLA name is required.' => 'De naam is verplicht.',
        'The Ticket was locked' => 'Het ticket is ontgrendeld',
        'The User Name you wish to have' => 'Uw gebruikersnaam naar keuze',
        'The customer id is required!' => 'Het klant ID is verplicht.',
        'The customer is required!' => 'De klant is verplicht.',
        'The customer is required.' => 'Kies een klant.',
        'The field is required.' => 'Dit veld is verplicht.',
        'The message being composed has been closed.  Exiting.' => 'Het bericht dat werd aangemaakt is gesloten.',
        'The subject is required!' => 'Onderwerp is een verplicht veld.',
        'The subject is required.' => 'Onderwerp is verplicht',
        'The text is required!' => 'Tekst is een verplicht veld.',
        'The text is required.' => 'Tekst is verplicht.',
        'These values are read-only.' => 'Deze waarden kunt u alleen lezen.',
        'These values are required.' => 'Deze waarden zijn verplicht.',
        'This OTRS invoker backend module will be called to prepare the data to be sent to the remote system, and to process it\'s response data.' =>
            'Deze OTRS invoker module wordt aangeroepen om de data te verwerken die verstuurd wordt, en om de response te verwerken.',
        'This account exists.' => 'Dit account bestaat al. ',
        'This is useful if you want that no one can get the result of the stat or the stat isn\'t ready configurated.' =>
            'Dit is handig als het rapport nog niet gereed is.',
        'This value is required' => 'Deze waarde is verplicht',
        'This window must be called from compose window' => 'Dit scherm moet van het scherm <opstellen bericht> worden aangeroepen',
        'Ticket Comands' => 'Ticket opdrachten',
        'Ticket Lock' => 'Ticketvergrendeling',
        'Ticket Search' => 'Zoek ticket',
        'Ticket Status View' => 'Overzicht van ticket statussen',
        'Ticket Type is required!' => 'Geen type ingevuld.',
        'Ticket add note' => 'Ticket bericht',
        'Ticket escalation!' => 'Ticket escalatie',
        'Ticket locked!' => 'Ticket vergrendeld.',
        'Ticket owner options (e. g. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)' =>
            'Gegevens van ticket-eigenaar (bijvoorbeeld &lt;OTRS_OWNER_USERFIRSTNAME&gt;)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>)' => 'Gegevens van de ticketeigenaar (bijvoorbeeld <OTRS_OWNER_UserFirstname>)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>).' => 'Gegevens van de ticket eigenaar (bijvoorbeeld <OTRS_OWNER_UserFirstname>).',
        'Ticket responsible options (e. g. <OTRS_RESPONSIBLE_UserFirstname>).' =>
            'Gegevens van de ticket verantwoordelijke (bijvoorbeeld <OTRS_RESPONSIBLE_UserFirstname).',
        'Ticket selected for bulk action!' => 'Ticket geselecteerd voor bulk actie.',
        'Ticket type is required.' => 'Ticket type is verplicht.',
        'Ticket unlock!' => 'Ontgrendelen',
        'Ticket-Area' => 'Tickets',
        'TicketFreeFields' => 'Vrije invulvelden',
        'TicketFreeText' => 'Vrije invulvelden van het ticket',
        'TicketID' => 'Ticket ID',
        'TicketZoom' => 'Inhoud ticket',
        'Tickets available' => 'Tickets beschikbaar',
        'Tickets shown' => 'Tickets getoond',
        'Tickets which need to be answered!' => 'Tickets die moeten worden behandeld.',
        'Time units is a required field!' => 'Bestede tijd is een verplicht veld.',
        'Time units is a required field.' => 'Bestede tijd is een verplicht veld.',
        'Time units is required field.' => 'Bestede Tijd is een verplicht veld.',
        'Time1' => 'Tijd 1',
        'Time2' => 'Tijd 2',
        'Time3' => 'Tijd 3',
        'Time4' => 'Tijd 4',
        'Time5' => 'Tijd 5',
        'Time6' => 'Tijd 6',
        'Timeover' => 'Tijdsoverschrijding',
        'Times' => 'Keren',
        'Title is required.' => 'Onderwerp is verplicht.',
        'Title of the stat.' => 'Naam van deze rapportage',
        'Title{CustomerUser}' => 'Titel',
        'Title{user}' => 'Titel',
        'To get the article attribute (e. g. (<OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).' =>
            'Om attributen van de interactie te gebruiken (bijvoorbeeld <OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).',
        'To get the article attribute (e. g. (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).' =>
            'Voor de eigenschappen van de interactie (bijvoorbeeld <OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).',
        'To is required.' => 'Aan is verplicht.',
        'Top of Page' => 'Bovenkant pagina',
        'Total hits' => 'Totaal gevonden',
        'Type:' => 'Type:',
        'U' => 'U',
        'Unable to parse Online Repository index document!' => 'Kan Online Repository index niet lezen.',
        'Uniq' => 'Uniek',
        'Unlock Tickets' => 'Tickets ontgrendelen',
        'Unlock to give it back to the queue!' => 'Ontgrendel een ticket om deze terug te laten keren naar de wachtrij.',
        'Unsubscribe' => 'Uitschrijven',
        'Use utf-8 it your database supports it!' => 'Kies UTF-8 als uw database dit ondersteunt.',
        'Useable options' => 'Variabelen',
        'Used default language.' => 'De standaard taal.',
        'User Management' => 'Gebruikersbeheer',
        'User will be needed to handle tickets.' => 'Maak een gebruiker aan om tickets te kunnen behandelen.',
        'Username{CustomerUser}' => 'Gebruikersnaam',
        'Users' => 'Gebruikers',
        'Users <-> Groups' => 'Gebruikers <-> Groepen',
        'Users <-> Groups Management' => 'Gebruikers <-> Groepen beheer',
        'Warning! This tickets will be removed from the database! This tickets are lost!' =>
            'Waarschuwing: deze tickets zullen worden verwijderd uit de database!',
        'Watch notification' => 'Gevolgde tickets',
        'We stop eating if you wish us to do.' => 'het gaat immers om u.',
        'Web-Installer' => 'Web Installer',
        'WebMail' => 'Webmail',
        'WebWatcher' => 'Webwatcher',
        'Welcome to OTRS' => 'Welkom bij OTRS',
        'Wildcards are allowed.' => 'Wildcards zijn toegestaan.',
        'With an invalid stat it isn\'t feasible to generate a stat.' => 'Als het rapport op ongeldig staat kan deze niet gegenereerd worden.',
        'With the input and select fields you can configurate the stat at your needs. Which elements of a stat you can edit depends on your stats administrator who configurated the stat.' =>
            'Met de invoer- en selectievelden is het rapport aanpasbaar. Welke elementen precies aan te passen zijn verschilt per rapportage.',
        'Years in future' => 'Jaren in de toekomst',
        'Years in past' => 'Jaren in het verleden',
        'Yes means, send no agent and customer notifications on changes.' =>
            'Bij \'Ja\' worden er geen meldingen gestuurd naar eigenaar en klant bij wijzigingen.',
        'Yes, save it with name' => 'Ja, sla op met naam',
        'You as the customer have the ability to let us support staff people jump around as you wish because it\'s all about you.' =>
            'U als onze klant heeft de mogelijkheid om alles van ons gedaan te krijgen, ',
        'You as the customer have the ability to let us support staff people jump around as you wish because it\'s all about you. We stop eating if you wish us to do. Your way to communicate with us is this thing called \'ticket\'. Please command us.' =>
            'U als onze klant heeft de mogelijkheid om alles van ons gedaan te krijgen, het gaat immers om u. De sleutel hiertoe is het aanmaken van wat we een \'ticket\' noemen. Maak er s.vp.p eentje aan.',
        'You got new message!' => 'U heeft een nieuw bericht.',
        'You have not created a ticket yet.' => 'U hebt nog geen tickets aangemaakt.',
        'You have to select two or more attributes from the select field!' =>
            'Kies twee of meer attributen.',
        'You need a To: recipient!' => 'U hebt een adres nodig bij Aan:',
        'You need a email address (e. g. customer@example.com) in To:!' =>
            'In het Aan-veld is een e-mailadres nodig.',
        'You need a to: recipient!.' => 'U moet een adres invullen bij Aan:',
        'You need min. one selected Ticket!' => 'Selecteer tenminste één ticket.',
        'You need to account time!' => 'Het is verplicht de bestede tijd in te voeren.',
        'You need to activate %s first to use it!' => 'U moet eerst %s activeren voordat u het kunt gebruiken.',
        'Your email address is new' => 'Uw e-mailadres is nieuw.',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Uw e-mail met ticketnummer "<OTRS_TICKET>" is gebounced naar "<OTRS_BOUNCE_TO>". Neem contact op met dit adres voor meer informatie.',
        'Your own Ticket' => 'Uw eigen ticket',
        'Your way to communicate with us is this thing called \'ticket\'.' =>
            'De sleutel hiertoe is het aanmaken van wat we een \'ticket\' noemen.',
        'Zip{CustomerUser}' => 'Postcode',
        'customer realname' => 'naam van de klant',
        'delete' => 'verwijderen',
        'down' => 'naar beneden',
        'false' => 'onwaar',
        'for agent firstname' => 'voornaam van de gebruiker',
        'for agent lastname' => 'achternaam van behandelaar',
        'for agent login' => 'de login van de gebruiker',
        'for agent user id' => 'de login naam van de gebruiker ',
        'kill all sessions' => 'alle sessies afsluiten',
        'kill session' => 'sessie afsluiten',
        'modified' => 'gewijzigd',
        'new ticket' => 'nieuw ticket',
        'next step' => 'volgende stap',
        'send' => 'verstuur',
        'sort downward' => 'sorteer aflopend',
        'sort upward' => 'sorteer oplopend',
        'tmp_lock' => 'tijdelijk vergrendeld',
        'to get the first 20 character of the subject' => 'voor de eerste 20 tekens van het onderwerp',
        'to get the first 5 lines of the email' => 'voor de eerste vijf regels van het e-mail bericht',
        'to get the from line of the email' => 'voor het e-mailadres waar vandaan de e-mail komt',
        'to get the realname of the sender (if given)' => 'voor de echte naam van de afzender (indien beschikbaar)',
        'up' => 'naar boven',
        'utf8' => 'utf8',
        'x' => 'x',

    };
    # $$STOP$$
    return;
}

1;
