# --
# Kernel/Language/cs.pm - provides Czech language translation
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# Copyright (C) 2003 Lukas Vicanek alias networ <lulka at centrum dot cz>
# Copyright (C) 2004 BENETA.cz, s.r.o. (Marta Macalkova, Vadim Buzek, Petr Ocasek) <info at beneta dot cz>
# Copyright (C) 2010 O2BS.com, s r.o. Jakub Hanus
# Copyright (C) 2010 Pavel <pavel.vilim at kodys.cz>
# --
# $Id: cs.pm,v 1.20 2012/02/27 08:26:14 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cs;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.20 $) [1];

sub Data {
    my $Self = shift;

    # $$START$$
    # Last translation file sync: 2012-02-02 17:08:16

    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D/%M/%Y %T';
    $Self->{DateFormatLong}      = '%A %D %B %Y %T';
    $Self->{DateFormatShort}     = '%D/%M/%Y';
    $Self->{DateInputFormat}     = '%D/%M/%Y';
    $Self->{DateInputFormatLong} = '%D/%M/%Y - %T';

    # csv separator
    $Self->{Separator} = ';';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Ano',
        'No' => 'Ne',
        'yes' => 'ano',
        'no' => 'ne',
        'Off' => 'Vypnuto',
        'off' => 'vypnuto',
        'On' => 'Zapnuto',
        'on' => 'zapnuto',
        'top' => 'nahoru',
        'end' => 'konec',
        'Done' => 'Hotovo',
        'Cancel' => 'Storno',
        'Reset' => '',
        'last' => 'poslední',
        'before' => 'před',
        'Today' => '',
        'Tomorrow' => 'Zítra',
        'Next week' => '',
        'day' => 'den',
        'days' => 'dní(dny)',
        'day(s)' => 'den(dní)',
        'd' => '',
        'hour' => 'hodina',
        'hours' => 'hodin',
        'hour(s)' => 'hodina(y)',
        'Hours' => '',
        'h' => '',
        'minute' => 'minuta',
        'minutes' => 'minut',
        'minute(s)' => 'minuta(y)',
        'Minutes' => '',
        'm' => '',
        'month' => 'měsíc',
        'months' => 'měsíců',
        'month(s)' => 'měsíc(e)',
        'week' => 'týden',
        'week(s)' => 'týden(týdny)',
        'year' => 'rok',
        'years' => 'roků',
        'year(s)' => 'rok(y)',
        'second(s)' => 'vteřina(y)',
        'seconds' => 'vteřin',
        'second' => 'vteřina',
        's' => '',
        'wrote' => 'napsal',
        'Message' => 'Zpráva',
        'Error' => 'Chyba',
        'Bug Report' => 'Upozornění na chybu',
        'Attention' => 'Upozornění',
        'Warning' => 'Varování',
        'Module' => 'Modul',
        'Modulefile' => 'Modulový soubor',
        'Subfunction' => 'Podfunkce',
        'Line' => 'Řádek',
        'Setting' => 'Nastavení',
        'Settings' => 'Nastavení',
        'Example' => 'Příklad',
        'Examples' => 'Příklady',
        'valid' => 'platný',
        'Valid' => 'Platnost',
        'invalid' => 'neplatný',
        'Invalid' => '',
        '* invalid' => '* neplatný',
        'invalid-temporarily' => 'neplatný-dočasně',
        ' 2 minutes' => ' 2 minuty',
        ' 5 minutes' => ' 5 minut',
        ' 7 minutes' => ' 7 minut',
        '10 minutes' => '10 minut',
        '15 minutes' => '15 minut',
        'Mr.' => 'pan',
        'Mrs.' => 'paní',
        'Next' => 'Další',
        'Back' => 'Zpět',
        'Next...' => 'Další...',
        '...Back' => '...Zpět',
        '-none-' => '-žádný-',
        'none' => 'žádné',
        'none!' => 'žádný!',
        'none - answered' => 'žádný - odpovězeno',
        'please do not edit!' => 'prosíme neupravovat!',
        'Need Action' => '',
        'AddLink' => 'Přidat Párování',
        'Link' => 'Spárovat',
        'Unlink' => 'Zrušit Párování',
        'Linked' => 'Spárováno',
        'Link (Normal)' => 'Párovat (Normálně)',
        'Link (Parent)' => 'Párovat (Nadřazený)',
        'Link (Child)' => 'Párovat (Podřízený)',
        'Normal' => 'Normální',
        'Parent' => 'Nadřazený',
        'Child' => 'Podřízený',
        'Hit' => 'Přístup',
        'Hits' => 'Přístupů',
        'Text' => 'Text',
        'Standard' => 'Standard',
        'Lite' => 'Omezená',
        'User' => 'Uživatel',
        'Username' => 'Uživatelské jméno',
        'Language' => 'Jazyk',
        'Languages' => 'Jazyky',
        'Password' => 'Heslo',
        'Preferences' => 'Předvolby',
        'Salutation' => 'Oslovení',
        'Salutations' => 'Pozdrav',
        'Signature' => 'Podpis',
        'Signatures' => 'Podpisy',
        'Customer' => 'Klient',
        'CustomerID' => 'ID klienta',
        'CustomerIDs' => 'ID klienta',
        'customer' => 'klient',
        'agent' => 'řešitel',
        'system' => 'systém',
        'Customer Info' => 'Informace o klientovi',
        'Customer Information' => 'Informace o klientovi',
        'Customer Company' => 'Společnost klienta',
        'Customer Companies' => '',
        'Company' => 'Společnost',
        'go!' => 'jdi!',
        'go' => 'jdi',
        'All' => 'Vše',
        'all' => 'vše',
        'Sorry' => 'Omluva',
        'update!' => 'aktualizovat!',
        'update' => 'aktualizovat',
        'Update' => 'Aktualizovat',
        'Updated!' => 'Aktualizováno',
        'submit!' => 'Odeslat!',
        'submit' => 'odeslat',
        'Submit' => 'Odeslat',
        'change!' => 'změnit!',
        'Change' => 'Změnit',
        'change' => 'změnit',
        'click here' => 'klikněte zde',
        'Comment' => 'Komentář',
        'Invalid Option!' => 'Neplatná volba',
        'Invalid time!' => 'Neplatný čas',
        'Invalid date!' => 'Neplatné datum',
        'Name' => 'Jméno',
        'Group' => 'Skupina',
        'Description' => 'Popis',
        'description' => 'popis',
        'Theme' => 'Motiv',
        'Created' => 'Vytvořeno',
        'Created by' => 'Vytvořeno kým',
        'Changed' => 'Změněno',
        'Changed by' => 'Změněno kým',
        'Search' => 'Vyhledat',
        'and' => 'a',
        'between' => 'mezi',
        'Fulltext Search' => 'Fulltextové vyhledávání',
        'Data' => '',
        'Options' => 'Možnosti',
        'Title' => 'Nadpis',
        'Item' => 'Položka',
        'Delete' => 'Vymazat',
        'Edit' => 'Editovat',
        'View' => 'Náhled',
        'Number' => 'Číslo',
        'System' => 'Systém',
        'Contact' => 'Kontakt',
        'Contacts' => 'Kontakty',
        'Export' => 'Exportovat',
        'Up' => 'Nahoru',
        'Down' => 'Dolu',
        'Add' => 'Přidat',
        'Added!' => 'Přidáno!',
        'Category' => 'Kategorie',
        'Viewer' => 'Prohlížeč',
        'Expand' => 'Rozbalit',
        'Small' => 'Malý',
        'Medium' => 'Střední',
        'Large' => 'Velký',
        'Date picker' => '',
        'New message' => 'Nová zpráva',
        'New message!' => 'Nová zpráva!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Prosím, odpovězte na tento (tyto) tiket(y) pro návrat do normálního náhledu fronty!',
        'You have %s new message(s)!' => 'Máte %s novou zprávu (nových zpráv)!',
        'You have %s reminder ticket(s)!' => 'Máte %s upomínkový(ch) tiket(ů)',
        'The recommended charset for your language is %s!' => 'Doporučená znaková sada pro Váš jazyk je %s!',
        'Change your password.' => 'Změňte si heslo.',
        'Please activate %s first!' => '',
        'No suggestions' => 'Žádné návrhy',
        'Word' => 'Slovo',
        'Ignore' => 'Ignorovat',
        'replace with' => 'nahradit čím',
        'There is no account with that login name.' => 'Žádný účet s tímto přihlašovacím jménem neexistuje.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            '',
        'There is no acount with that user name.' => '',
        'Please contact your administrator' => '',
        'Logout' => 'Odhlásit',
        'Logout successful. Thank you for using OTRS!' => 'Odhlášení bylo úspěsné. Děkujeme Vám za používání OTRS!',
        'Invalid SessionID!' => 'Neplatné ID relace!',
        'Feature not active!' => 'Funkce je neaktivní!',
        'Agent updated!' => '',
        'Create Database' => 'Vytvořit Databazi',
        'System Settings' => 'Nastavení systému',
        'Mail Configuration' => '',
        'Finished' => 'Dokončeno',
        'Install OTRS' => '',
        'Intro' => '',
        'License' => 'Licence',
        'Database' => 'Databáze',
        'Configure Mail' => '',
        'Database deleted.' => '',
        'Database setup succesful!' => '',
        'Login is needed!' => 'Vyžadováno přihlášení',
        'Password is needed!' => 'Vyžadováno heslo',
        'Take this Customer' => 'Vybrat tohoto Zákazníka',
        'Take this User' => 'Vybrat tohoto uživatele',
        'possible' => 'možný',
        'reject' => 'zamítnout',
        'reverse' => 'reverzní',
        'Facility' => 'Vybavení',
        'Time Zone' => '',
        'Pending till' => 'Čekání na vyřízení do',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            '',
        'Dispatching by email To: field.' => 'Přiřadit podle emailu - pole KOMU:.',
        'Dispatching by selected Queue.' => 'Přiřadit do vybrané fronty.',
        'No entry found!' => 'Nebyl nalezen žádný záznam!',
        'Session has timed out. Please log in again.' => 'Relace vypršela. Prosím, přihlašte se znovu.',
        'No Permission!' => 'Nemáte oprávnění',
        'To: (%s) replaced with database email!' => 'Komu: (%s) nahrazeno emailem z databáze!',
        'Cc: (%s) added database email!' => 'Kopie: (%s) doplněno emailem z databáze',
        '(Click here to add)' => '(Pro přidání klikněte zde)',
        'Preview' => 'Zobrazit',
        'Package not correctly deployed! Please reinstall the package.' =>
            '',
        '%s is not writable!' => '',
        'Cannot create %s!' => '',
        'Check to activate this date' => '',
        'You have Out of Office enabled, would you like to disable it?' =>
            '',
        'Customer %s added' => '',
        'Role added!' => 'Role přidána!',
        'Role updated!' => '',
        'Attachment added!' => '',
        'Attachment updated!' => '',
        'Response added!' => '',
        'Response updated!' => '',
        'Group updated!' => '',
        'Queue added!' => '',
        'Queue updated!' => '',
        'State added!' => '',
        'State updated!' => '',
        'Type added!' => '',
        'Type updated!' => '',
        'Customer updated!' => '',
        'Customer company added!' => '',
        'Customer company updated!' => '',
        'Mail account added!' => '',
        'Mail account updated!' => '',
        'System e-mail address added!' => '',
        'System e-mail address updated!' => '',
        'Contract' => 'Kontrakt',
        'Online Customer: %s' => 'Online Zákazníci',
        'Online Agent: %s' => 'Online Řešitelé',
        'Calendar' => 'Kalendář',
        'File' => 'Soubor',
        'Filename' => 'Název souboru',
        'Type' => 'Typ Tiketu',
        'Size' => 'Velikost',
        'Upload' => '',
        'Directory' => 'Adresář',
        'Signed' => 'Podepsáno',
        'Sign' => 'Podepsat',
        'Crypted' => 'Šifrováno',
        'Crypt' => 'Šifrovat',
        'PGP' => 'PGP',
        'PGP Key' => '',
        'PGP Keys' => '',
        'S/MIME' => 'S/MIME',
        'S/MIME Certificate' => '',
        'S/MIME Certificates' => '',
        'Office' => 'Kancelář',
        'Phone' => 'Telefon',
        'Fax' => 'Fax',
        'Mobile' => 'Mobilní telefon',
        'Zip' => 'PSČ',
        'City' => 'Město',
        'Street' => 'Ulice',
        'Country' => 'Země',
        'Location' => 'Lokalita',
        'installed' => 'instalováno',
        'uninstalled' => 'odinstalováno',
        'Security Note: You should activate %s because application is already running!' =>
            'Bezpečnostní poznámka: Aktivujte %s protože aplikace stále běží!',
        'Unable to parse repository index document.' => '',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            '',
        'No packages, or no new packages, found in selected repository.' =>
            '',
        'Edit the system configuration settings.' => '',
        'printed at' => 'vytištěno na',
        'Loading...' => '',
        'Dear Mr. %s,' => 'Vážený Pane %s,',
        'Dear Mrs. %s,' => 'Vážená Paní %s,',
        'Dear %s,' => 'Vážený(á) %s,',
        'Hello %s,' => 'Dobrý den %s,',
        'This email address already exists. Please log in or reset your password.' =>
            '',
        'New account created. Sent login information to %s. Please check your email.' =>
            '',
        'Please press Back and try again.' => 'Prosím klikněte na "Zpět" a opakujte pokus',
        'Sent password reset instructions. Please check your email.' => '',
        'Sent new password to %s. Please check your email.' => '',
        'Upcoming Events' => 'Aktuální události',
        'Event' => 'Událost',
        'Events' => 'Události',
        'Invalid Token!' => 'Neplatný Token',
        'more' => 'další',
        'For more info see:' => 'Pro další informace viz:',
        'Package verification failed!' => 'Ověření balíčku selhalo',
        'Collapse' => 'Zhroucení',
        'Shown' => 'Zobrazeno',
        'News' => 'Novinky',
        'Product News' => 'Novinky o Produktu',
        'OTRS News' => 'Novinky OTRS',
        '7 Day Stats' => 'Statistiky za 7 dnů',
        'Bold' => 'Tučně',
        'Italic' => 'Kurzíva',
        'Underline' => 'Podtržení',
        'Font Color' => 'Barva Písma',
        'Background Color' => 'Barva Pozadí',
        'Remove Formatting' => 'Odstranit Formátování',
        'Show/Hide Hidden Elements' => 'Zobrazit/Skrýt schované prvky',
        'Align Left' => 'Zarovnání Vlevo',
        'Align Center' => 'Zarovnání na Střed',
        'Align Right' => 'Zarovnání Vpravo',
        'Justify' => 'Formátovat',
        'Header' => 'Hlavička',
        'Indent' => 'Odsazení',
        'Outdent' => 'Zrušit Odsazení',
        'Create an Unordered List' => 'Vytvořit nesetříděný seznam',
        'Create an Ordered List' => 'Vytvořit setříděný seznam',
        'HTML Link' => 'HTML odkaz',
        'Insert Image' => 'Vložit Obrázek',
        'CTRL' => 'Ctrl',
        'SHIFT' => 'Shift',
        'Undo' => 'Krok Zpět',
        'Redo' => 'Znovuobnovit',
        'Scheduler process is registered but might not be running.' => '',
        'Scheduler is not running.' => '',

        # Template: AAACalendar
        'New Year\'s Day' => '',
        'International Workers\' Day' => '',
        'Christmas Eve' => '',
        'First Christmas Day' => '',
        'Second Christmas Day' => '',
        'New Year\'s Eve' => '',

        # Template: AAAGenericInterface
        'OTRS as requester' => '',
        'OTRS as provider' => '',
        'Webservice "%s" created!' => '',
        'Webservice "%s" updated!' => '',

        # Template: AAAMonth
        'Jan' => 'Led',
        'Feb' => 'Úno',
        'Mar' => 'Bře',
        'Apr' => 'Dub',
        'May' => 'Kvě',
        'Jun' => 'Čer',
        'Jul' => 'Čvc',
        'Aug' => 'Srp',
        'Sep' => 'Zář',
        'Oct' => 'Říj',
        'Nov' => 'Lis',
        'Dec' => 'Pro',
        'January' => 'Leden',
        'February' => 'Únor',
        'March' => 'Březen',
        'April' => 'Duben',
        'May_long' => 'Květen',
        'June' => 'Červen',
        'July' => 'Červenec',
        'August' => 'Srpen',
        'September' => 'Září',
        'October' => 'Říjen',
        'November' => 'Listopad',
        'December' => 'Prosinec',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'Nastavení úspěšně aktualizováno!',
        'User Profile' => 'Uživatelský profil',
        'Email Settings' => 'Nastavení emailu',
        'Other Settings' => 'Ostatní nastavení',
        'Change Password' => 'Změna hesla',
        'Current password' => 'Stávající heslo',
        'New password' => 'Nové Heslo',
        'Verify password' => '',
        'Spelling Dictionary' => 'Slovník pro kontrolu pravopisu',
        'Default spelling dictionary' => '',
        'Max. shown Tickets a page in Overview.' => 'Max. zobrazených tiketů v přehledu na stránku',
        'The current password is not correct. Please try again!' => 'Současné heslo nesouhlasí. Zkuste to prosím znovu!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Nelze zaktualizovat heslo, Vaše nová hesla si neodpovídají. Zkuste to prosím znovu!',
        'Can\'t update password, it contains invalid characters!' => 'Nelze zaktualizovat heslo, protože obsahuje neplatné znaky. Zkuste to prosím znovu!',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Nelze zaktualizovat heslo, protože neobsahuje minimálně %s znaků. Zkuste to prosím znovu!',
        'Can\'t update password, it must contain at least 2 lowercase  and 2 uppercase characters!' =>
            'Nelze zaktualizovat heslo, protože neobsahuje alespoň 2 malá a 2 velká písmena!',
        'Can\'t update password, it must contain at least 1 digit!' => 'Nelze zaktualizovat heslo, protože neobsahuje alespoň 1 číslici!',
        'Can\'t update password, it must contain at least 2 characters!' =>
            'Nelze zaktualizovat heslo, protože neobsahuje alespoň 2 znaky!',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            'Nelze zaktualizovat heslo, protože toto heslo bylo již jednou použito. Zvolte prosím nové!',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            '',
        'CSV Separator' => '',

        # Template: AAAStats
        'Stat' => 'Statistika',
        'Sum' => '',
        'Please fill out the required fields!' => 'Prosím vyplňte povinná pole!',
        'Please select a file!' => 'Prosím vyberte soubor!',
        'Please select an object!' => 'Prosím zvolte objekt!',
        'Please select a graph size!' => 'Prosím zvolte velikost grafu!',
        'Please select one element for the X-axis!' => 'Prosím vyberte jeden prvek pro osu X!',
        'Please select only one element or turn off the button \'Fixed\' where the select field is marked!' =>
            '',
        'If you use a checkbox you have to select some attributes of the select field!' =>
            'Je-li použito zaškrtávací políčko, je nutno zvolit atribut zvoleného pole!',
        'Please insert a value in the selected input field or turn off the \'Fixed\' checkbox!' =>
            '',
        'The selected end time is before the start time!' => 'Zvolené Konečné datum je před Počátečním datem!',
        'You have to select one or more attributes from the select field!' =>
            'Musí být zvolen jeden nebo více atributů z vybraného pole!',
        'The selected Date isn\'t valid!' => '',
        'Please select only one or two elements via the checkbox!' => 'Prosím vyberte jeden nebo dva prvky pomocí zaškrtávacího políčka!',
        'If you use a time scale element you can only select one element!' =>
            'Při použití časového měřítka je možné vybrat pouze jeden prvek!',
        'You have an error in your time selection!' => 'Chyba ve zvoleném čase!',
        'Your reporting time interval is too small, please use a larger time scale!' =>
            'Příliš malý časový interval pro report, prosím zvolte větší rozsah!',
        'The selected start time is before the allowed start time!' => 'Zvolený počátek je před povoleným počátkem!',
        'The selected end time is after the allowed end time!' => 'Zvolený konec je po povoleném konci!',
        'The selected time period is larger than the allowed time period!' =>
            'Zvolená perioda je delší, než povolená!',
        'Common Specification' => 'Všeobecné nastavení',
        'X-axis' => 'Osa X',
        'Value Series' => 'Řada Hodnot',
        'Restrictions' => 'Omezení',
        'graph-lines' => 'graf-čáry',
        'graph-bars' => 'graf-sloupec',
        'graph-hbars' => 'graf-hsloupec',
        'graph-points' => 'graf-body',
        'graph-lines-points' => 'graf-čáry-body',
        'graph-area' => 'oblast grafu',
        'graph-pie' => 'výsečový graf',
        'extended' => 'podrobný',
        'Agent/Owner' => 'Řešitel/Vlastník',
        'Created by Agent/Owner' => 'Vytvořeno Řešitelem/Vlastníkem',
        'Created Priority' => 'Nastavená Priorita',
        'Created State' => 'Nastavený Stav',
        'Create Time' => 'Nastavený Čas',
        'CustomerUserLogin' => 'Přihlášení Zákazník/Uživatel',
        'Close Time' => 'Čas uzavření',
        'TicketAccumulation' => 'Sumarizace Tiketu',
        'Attributes to be printed' => 'Atributy k vytištění',
        'Sort sequence' => 'Řazení pořadí',
        'Order by' => 'Řadit dle',
        'Limit' => '',
        'Ticketlist' => 'seznam Tiketů',
        'ascending' => 'vzestupně',
        'descending' => 'sestupně',
        'First Lock' => 'První Zámek',
        'Evaluation by' => 'Vyhodnoceno dle',
        'Total Time' => 'Celkový čas',
        'Ticket Average' => 'Průměr tiketu',
        'Ticket Min Time' => 'Min. čas tiketu',
        'Ticket Max Time' => 'Max. čas tiketu',
        'Number of Tickets' => 'Počet tiketů',
        'Article Average' => 'průměr položek',
        'Article Min Time' => 'Min. čas položky',
        'Article Max Time' => 'Max. čas položky',
        'Number of Articles' => 'Počet položek',
        'Accounted time by Agent' => 'Řešitelem počítaný čas',
        'Ticket/Article Accounted Time' => '',
        'TicketAccountedTime' => '',
        'Ticket Create Time' => 'čas vytvoření tiketu',
        'Ticket Close Time' => 'čas uzavření tiketu',

        # Template: AAATicket
        'Status View' => '',
        'Bulk' => '',
        'Lock' => 'Zamknout',
        'Unlock' => 'Odemknout',
        'History' => 'Historie',
        'Zoom' => 'Zobrazit',
        'Age' => 'Stáří',
        'Bounce' => 'Odeslat zpět',
        'Forward' => 'Předat',
        'From' => 'Od',
        'To' => 'Komu',
        'Cc' => 'Kopie',
        'Bcc' => 'Slepá kopie',
        'Subject' => 'Předmět',
        'Move' => 'Přesunout',
        'Queue' => 'Fronta',
        'Queues' => 'Řady',
        'Priority' => 'Priorita',
        'Priorities' => '',
        'Priority Update' => 'Oprava Priority',
        'Priority added!' => '',
        'Priority updated!' => '',
        'Signature added!' => '',
        'Signature updated!' => '',
        'SLA' => '',
        'Service Level Agreement' => '',
        'Service Level Agreements' => '',
        'Service' => 'Služba',
        'Services' => '',
        'State' => 'Stav',
        'States' => '',
        'Status' => 'Stav',
        'Statuses' => '',
        'Ticket Type' => '',
        'Ticket Types' => '',
        'Compose' => 'Sestavit',
        'Pending' => 'Čeká na vyřízení',
        'Owner' => 'Vlastník',
        'Owner Update' => 'Oprava Vlastníka',
        'Responsible' => 'Odpovědný',
        'Responsible Update' => 'Oprava Odpovědnosti',
        'Sender' => 'Odesílatel',
        'Article' => 'Položka',
        'Ticket' => 'Tiket',
        'Createtime' => 'Doba vytvoření',
        'plain' => 'jednoduchý',
        'Email' => '',
        'email' => '',
        'Close' => 'Zavřít',
        'Action' => 'Akce',
        'Attachment' => 'Příloha',
        'Attachments' => 'Přílohy',
        'This message was written in a character set other than your own.' =>
            'Tato zpráva byla napsána v jiné znakové sadě než Vaše.',
        'If it is not displayed correctly,' => 'Pokud není zobrazeno správně,',
        'This is a' => 'Toto je',
        'to open it in a new window.' => 'pro otevření v novém okně.',
        'This is a HTML email. Click here to show it.' => 'Toto je HTML email. Pro zobrazení klikněte zde.',
        'Free Fields' => 'Prázdná pole',
        'Merge' => 'Sloučit',
        'merged' => 'Sloučeno',
        'closed successful' => 'uzavřeno - vyřešeno',
        'closed unsuccessful' => 'uzavřeno - nevyřešeno',
        'Locked Tickets Total' => '',
        'Locked Tickets Reminder Reached' => '',
        'Locked Tickets New' => '',
        'Responsible Tickets Total' => '',
        'Responsible Tickets New' => '',
        'Responsible Tickets Reminder Reached' => '',
        'Watched Tickets Total' => '',
        'Watched Tickets New' => '',
        'Watched Tickets Reminder Reached' => '',
        'All tickets' => 'Všechny tikety',
        'Available tickets' => '',
        'Escalation' => 'Eskalace',
        'last-search' => '',
        'QueueView' => 'Náhled fronty',
        'Ticket Escalation View' => '',
        'Message from' => '',
        'End message' => '',
        'Forwarded message from' => '',
        'End forwarded message' => '',
        'new' => 'nová',
        'open' => 'otevřít',
        'Open' => 'Otevřít',
        'Open tickets' => '',
        'closed' => 'uzavřeno',
        'Closed' => 'Uzavřeno',
        'Closed tickets' => '',
        'removed' => 'odstraněno',
        'pending reminder' => 'upomínka při čekání na vyřízení',
        'pending auto' => 'auto čekání na vyřízení',
        'pending auto close+' => 'čeká na vyřízení - automaticky zavřít+',
        'pending auto close-' => 'čeká na vyřízení - automaticky zavřít-',
        'email-external' => 'externí email',
        'email-internal' => 'interní email',
        'note-external' => 'poznámka-externí',
        'note-internal' => 'poznámka-interní',
        'note-report' => 'poznámka-report',
        'phone' => 'telefon',
        'sms' => '',
        'webrequest' => 'požadavek přes web',
        'lock' => 'zamčeno',
        'unlock' => 'nezamčený',
        'very low' => 'velmi nízká',
        'low' => 'nízký',
        'normal' => 'normální',
        'high' => 'vysoký',
        'very high' => 'velmi vysoká',
        '1 very low' => '1 velmi nízká',
        '2 low' => '2 nízká',
        '3 normal' => '3 normální',
        '4 high' => '4 vysoká',
        '5 very high' => '5 velmi vysoká',
        'auto follow up' => '',
        'auto reject' => '',
        'auto remove' => '',
        'auto reply' => '',
        'auto reply/new ticket' => '',
        'Ticket "%s" created!' => 'Tiket "%s" vytvořen!',
        'Ticket Number' => 'číslo tiketu',
        'Ticket Object' => 'Tiket Objekt',
        'No such Ticket Number "%s"! Can\'t link it!' => '',
        'You don\'t have write access to this ticket.' => '',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            '',
        'Ticket selected.' => '',
        'Ticket is locked by another agent.' => '',
        'Ticket locked.' => '',
        'Don\'t show closed Tickets' => 'Nezobrazovat uzavřené tikety',
        'Show closed Tickets' => 'Zobrazit zavřené tikety',
        'New Article' => 'Nová položka',
        'Unread article(s) available' => '',
        'Remove from list of watched tickets' => '',
        'Add to list of watched tickets' => '',
        'Email-Ticket' => 'Email Tiket',
        'Create new Email Ticket' => 'Vytvořit nový Email Tiket',
        'Phone-Ticket' => 'Telefonní Tiket',
        'Search Tickets' => 'Vyhledávání Tiketů',
        'Edit Customer Users' => 'Editace uživatelů zákazníka',
        'Edit Customer Company' => 'Editace společnosti zákazníka',
        'Bulk Action' => 'Hromadná akce',
        'Bulk Actions on Tickets' => 'Hromadná akce na tiketech',
        'Send Email and create a new Ticket' => 'Zaslat Email a vytvořit nový tiket',
        'Create new Email Ticket and send this out (Outbound)' => 'Vytvořit nový Email Tiket a odeslat jej (Odchozí)',
        'Create new Phone Ticket (Inbound)' => 'Vytvořit nový Telefonní Tiket (Příchozí)',
        'Overview of all open Tickets' => 'Přehled všech otevřených tiketů',
        'Locked Tickets' => 'Uzamčené tikety',
        'My Locked Tickets' => '',
        'My Watched Tickets' => '',
        'My Responsible Tickets' => '',
        'Watched Tickets' => 'Zobrazené tikety',
        'Watched' => 'Zobrazené',
        'Watch' => '',
        'Unwatch' => '',
        'Lock it to work on it' => '',
        'Unlock to give it back to the queue' => '',
        'Show the ticket history' => '',
        'Print this ticket' => '',
        'Print this article' => '',
        'Split this article' => '',
        'Forward article via mail' => '',
        'Change the ticket priority' => '',
        'Change the ticket free fields!' => 'Změna volných polí tiketu',
        'Link this ticket to other objects' => '',
        'Change the owner for this ticket' => '',
        'Change the  customer for this ticket' => '',
        'Add a note to this ticket' => '',
        'Merge into a different ticket' => '',
        'Set this ticket to pending' => '',
        'Close this ticket' => '',
        'Look into a ticket!' => 'Náhled Tiketu',
        'Delete this ticket' => '',
        'Mark as Spam!' => 'Označit jako SPAM',
        'My Queues' => 'Moje Fronty',
        'Shown Tickets' => 'Zobrazit Tikety',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Váš email s číslem Tiketu "<OTRS_TICKET>" je svázán s "<OTRS_MERGE_TO_TICKET>"',
        'Ticket %s: first response time is over (%s)!' => 'Tiket %s: Vypršel čas První Reakce (%s)!',
        'Ticket %s: first response time will be over in %s!' => 'Tiket %s: Čas První Reakce vyprší v %s!',
        'Ticket %s: update time is over (%s)!' => 'Tiket %s: Vypršel čas Aktualizace (%s)!',
        'Ticket %s: update time will be over in %s!' => 'Tiket %s: Čas Aktualizace vyprší v %s!',
        'Ticket %s: solution time is over (%s)!' => 'Tiket %s: Vypršel čas Řešení (%s)!',
        'Ticket %s: solution time will be over in %s!' => 'Tiket %s: Čas Řešení vyprší v %s!',
        'There are more escalated tickets!' => 'Je zde více Eskalovaných Tiketů',
        'Plain Format' => '',
        'Reply All' => '',
        'Direction' => '',
        'Agent (All with write permissions)' => '',
        'Agent (Owner)' => '',
        'Agent (Responsible)' => '',
        'New ticket notification' => 'Oznámení o Novém Tiketu',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Pošli mi oznámení o novém Tiketu v mých Frontách.',
        'Send new ticket notifications' => '',
        'Ticket follow up notification' => '',
        'Ticket lock timeout notification' => 'Oznámení o vypršení času uzamčení tiketu',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Pošli mi oznámení, pokud je tiket odemknut systémem.',
        'Send ticket lock timeout notifications' => '',
        'Ticket move notification' => '',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Pošli mi oznámení pokud je Tiket přesunut do mých Front.',
        'Send ticket move notifications' => '',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            '',
        'Custom Queue' => 'Vlastní fronta',
        'QueueView refresh time' => 'Doba obnovení náhledu fronty',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            '',
        'Refresh QueueView after' => '',
        'Screen after new ticket' => 'Zobrazení po Novém Tiketu',
        'Show this screen after I created a new ticket' => '',
        'Closed Tickets' => 'Uzavřené Tikety',
        'Show closed tickets.' => 'Ukázat uzavřené tikety.',
        'Max. shown Tickets a page in QueueView.' => 'Max. zobrazených tiketů v náhledu fronty na stránku',
        'Ticket Overview "Small" Limit' => '',
        'Ticket limit per page for Ticket Overview "Small"' => '',
        'Ticket Overview "Medium" Limit' => '',
        'Ticket limit per page for Ticket Overview "Medium"' => '',
        'Ticket Overview "Preview" Limit' => '',
        'Ticket limit per page for Ticket Overview "Preview"' => '',
        'Ticket watch notification' => '',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            '',
        'Send ticket watch notifications' => '',
        'Out Of Office Time' => '',
        'New Ticket' => 'nový Tiket',
        'Create new Ticket' => 'Vytvořit Nový Tiket',
        'Customer called' => 'Volal Zákazník',
        'phone call' => 'Telefonní volání',
        'Phone Call Outbound' => '',
        'Phone Call Inbound' => '',
        'Reminder Reached' => 'Dosažena Upomínka',
        'Reminder Tickets' => 'Upozornění na Tikety',
        'Escalated Tickets' => 'Eskalované Tikety',
        'New Tickets' => 'Nové Tikety',
        'Open Tickets / Need to be answered' => 'Otevřené Tikety / Nutno Odpovědět',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            '',
        'All new tickets, these tickets have not been worked on yet' => '',
        'All escalated tickets' => '',
        'All tickets with a reminder set where the reminder date has been reached' =>
            '',
        'Archived tickets' => '',
        'Unarchived tickets' => '',
        'History::Move' => 'Tiket přesunut do Fronty "%s" (%s) z Fronty "%s" (%s).',
        'History::TypeUpdate' => 'Typ Tiketu aktualizován na %s (ID=%s).',
        'History::ServiceUpdate' => 'Služba aktualizována na %s (ID=%s).',
        'History::SLAUpdate' => 'SLA aktualizováno na %s (ID=%s).',
        'History::NewTicket' => 'Nový Tiket [%s] vytvořen (Q=%s;P=%s;S=%s).',
        'History::FollowUp' => 'Následovat pro [%s]. %s',
        'History::SendAutoReject' => 'Automatické odmítnutí zasláno na "%s".',
        'History::SendAutoReply' => 'Automatická odpověď zaslána na "%s".',
        'History::SendAutoFollowUp' => 'Automatické následování zasláno na "%s".',
        'History::Forward' => 'Předáno dál "%s".',
        'History::Bounce' => 'Odraženo na "%s".',
        'History::SendAnswer' => 'Email odeslán na "%s".',
        'History::SendAgentNotification' => '"%s"- upozornění odesláno na "%s".',
        'History::SendCustomerNotification' => 'Upozornění odesláno na "%s".',
        'History::EmailAgent' => 'Email odeslán zákazníkovi.',
        'History::EmailCustomer' => 'Email přidán. %s',
        'History::PhoneCallAgent' => 'Řešitel kontaktoval Zákazníka.',
        'History::PhoneCallCustomer' => 'Zákazník kontaktoval nás.',
        'History::AddNote' => 'Přidaná poznámka (%s)',
        'History::Lock' => 'Zamknutý Tiket.',
        'History::Unlock' => 'Odemknutý Tiket.',
        'History::TimeAccounting' => '%s napočítaných časových jednotek. Součet všech je %s.',
        'History::Remove' => '%s',
        'History::CustomerUpdate' => 'Aktualizováno: %s',
        'History::PriorityUpdate' => 'Priorita změněna z "%s" (%s) na "%s" (%s).',
        'History::OwnerUpdate' => 'Nový vlastník je "%s" (ID=%s).',
        'History::LoopProtection' => 'Přeposlání nepovoleno! Nebyla odeslána automatická odpověď na "%s".',
        'History::Misc' => '%s',
        'History::SetPendingTime' => 'Aktualizováno: %s',
        'History::StateUpdate' => 'Starý: "%s" Nový: "%s"',
        'History::TicketDynamicFieldUpdate' => 'Aktualizováno: %s=%s;%s=%s;',
        'History::WebRequestCustomer' => 'Webový požadavek Zákazníka.',
        'History::TicketLinkAdd' => 'Spárováno s Tiketem "%s".',
        'History::TicketLinkDelete' => 'Párování s tiketem "%s" zrušeno.',
        'History::Subscribe' => 'Přidána poznámka pro uživatele"%s".',
        'History::Unsubscribe' => 'Poznámka pro uživatele odebrána "%s".',
        'History::SystemRequest' => '',
        'History::ResponsibleUpdate' => '',
        'History::ArchiveFlagUpdate' => '',

        # Template: AAAWeekDay
        'Sun' => 'Ne',
        'Mon' => 'Po',
        'Tue' => 'Út',
        'Wed' => 'St',
        'Thu' => 'Čt',
        'Fri' => 'Pá',
        'Sat' => 'So',

        # Template: AdminAttachment
        'Attachment Management' => 'Správa příloh',
        'Actions' => '',
        'Go to overview' => '',
        'Add attachment' => '',
        'List' => 'Pořadí',
        'Validity' => '',
        'No data found.' => '',
        'Download file' => '',
        'Delete this attachment' => '',
        'Add Attachment' => '',
        'Edit Attachment' => '',
        'This field is required.' => '',
        'or' => 'nebo',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Správa automatických odpovědí',
        'Add auto response' => '',
        'Add Auto Response' => '',
        'Edit Auto Response' => '',
        'Response' => 'Odpověď',
        'Auto response from' => '',
        'Reference' => '',
        'You can use the following tags' => '',
        'To get the first 20 character of the subject.' => 'pro získáni prvních 20ti znaků z předmětu',
        'To get the first 5 lines of the email.' => 'pro získáni prvních 5ti řádků z emailu',
        'To get the realname of the sender (if given).' => 'Pro získání Jména Odesílatele (je-li dáno)',
        'To get the article attribute' => '',
        ' e. g.' => '',
        'Options of the current customer user data' => '',
        'Ticket owner options' => '',
        'Ticket responsible options' => '',
        'Options of the current user who requested this action' => '',
        'Options of the ticket data' => '',
        'Config options' => '',
        'Example response' => '',

        # Template: AdminCustomerCompany
        'Customer Company Management' => 'Správa Společnosti Zákazníka',
        'Wildcards like \'*\' are allowed.' => '',
        'Add customer company' => '',
        'Please enter a search term to look for customer companies.' => '',
        'Add Customer Company' => 'Přidat Společnost Zákazníka',

        # Template: AdminCustomerUser
        'Customer Management' => '',
        'Add customer' => '',
        'Select' => 'Vybrat',
        'Hint' => '',
        'Customer will be needed to have a customer history and to login via customer panel.' =>
            '',
        'Please enter a search term to look for customers.' => '',
        'Last Login' => '',
        'Add Customer' => '',
        'Edit Customer' => '',
        'This field is required and needs to be a valid email address.' =>
            '',
        'This email address is not allowed due to the system configuration.' =>
            '',
        'This email address failed MX check.' => '',
        'DNS problem, please check your configuration and the error log.' =>
            '',
        'The syntax of this email address is incorrect.' => '',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => '',
        'Notice' => '',
        'This feature is disabled!' => 'tato Funkce je Deaktivovaná!',
        'Just use this feature if you want to define group permissions for customers.' =>
            '',
        'Enable it here!' => 'Aktivujte ji Zde!',
        'Search for customers.' => '',
        'Edit Customer Default Groups' => '',
        'These groups are automatically assigned to all customers.' => '',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            '',
        'Filter for Groups' => '',
        'Select the customer:group permissions.' => '',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            '',
        'Search Result:' => '',
        'Customers' => '',
        'Groups' => 'Skupiny',
        'No matches found.' => '',
        'Change Group Relations for Customer' => '',
        'Change Customer Relations for Group' => '',
        'Toggle %s Permission for all' => '',
        'Toggle %s permission for %s' => '',
        'Customer Default Groups:' => '',
        'No changes can be made to these groups.' => '',
        'ro' => 'jen pro čtení',
        'Read only access to the ticket in this group/queue.' => 'Přístup pouze pro čtení tiketu v této skupině/frontě.',
        'rw' => 'čtení/psaní',
        'Full read and write access to the tickets in this group/queue.' =>
            'Plný přístup pro čtení a psaní do tiketů v této skupině/frontě.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => '',
        'Edit default services' => '',
        'Filter for Services' => '',
        'Allocate Services to Customer' => '',
        'Allocate Customers to Service' => '',
        'Toggle active state for all' => '',
        'Active' => 'Aktivní',
        'Toggle active state for %s' => '',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => '',
        'Add new field for object' => '',
        'To add a new field, select the field type form one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            '',
        'Dynamic Fields List' => '',
        'Dynamic fields per page' => '',
        'Label' => '',
        'Order' => 'Seřadit',
        'Object' => 'Objekt',

        # Template: AdminDynamicFieldCheckbox
        'Dynamic Fields' => '',
        'Field' => '',
        'Go back to overview' => '',
        'General' => '',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            '',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            '',
        'Changing this value will require manual changes in the system.' =>
            '',
        'This is the name to be shown on the screens where the field is active.' =>
            '',
        'Field order' => '',
        'This field is required and must be numeric.' => '',
        'This is the order in which this field will be shown on the screens where is active.' =>
            '',
        'Field type' => '',
        'Object type' => '',
        'Field Settings' => '',
        'Default value' => '',
        'This is the default value for this field.' => '',
        'Save' => 'Uložit',

        # Template: AdminDynamicFieldDateTime
        'Default date difference' => '',
        'This field must be numeric.' => '',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            '',
        'Define years period' => '',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            '',
        'Years in the past' => '',
        'Years in the past to display (default: 5 years).' => '',
        'Years in the future' => '',
        'Years in the future to display (default: 5 years).' => '',
        'Show link' => '',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            '',

        # Template: AdminDynamicFieldDropdown
        'Possible values' => '',
        'Key' => 'Klíč',
        'Value' => 'Hodnota',
        'Remove value' => '',
        'Add value' => '',
        'Add Value' => '',
        'Add empty value' => '',
        'Activate this option to create an empty selectable value.' => '',
        'Translatable values' => '',
        'If you activate this option the values will be translated to the user defined language.' =>
            '',
        'Note' => 'Poznámka',
        'You need to add the translations manually into the language translation files.' =>
            '',

        # Template: AdminDynamicFieldMultiselect

        # Template: AdminDynamicFieldText
        'Number of rows' => '',
        'Specify the height (in lines) for this field in the edit mode.' =>
            '',
        'Number of cols' => '',
        'Specify the width (in characters) for this field in the edit mode.' =>
            '',

        # Template: AdminEmail
        'Admin Notification' => 'Admin Notifikace',
        'With this module, administrators can send messages to agents, group or role members.' =>
            '',
        'Create Administrative Message' => '',
        'Your message was sent to' => '',
        'Send message to users' => '',
        'Send message to group members' => '',
        'Group members need to have permission' => '',
        'Send message to role members' => '',
        'Also send to customers in groups' => '',
        'Body' => 'Tělo',
        'Send' => 'Odeslat',

        # Template: AdminGenericAgent
        'Generic Agent' => '',
        'Add job' => '',
        'Last run' => 'Naposledy Spuštěno',
        'Run Now!' => 'Spustit Teď',
        'Delete this task' => '',
        'Run this task' => '',
        'Job Settings' => '',
        'Job name' => '',
        'Currently this generic agent job will not run automatically.' =>
            'Aktuálně nebude Úloha Obecného Prostředu spouštěna automaticky',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Pro automatické spuštění vyberte alespoň jednu z hodnot: minuta, hodina a den!',
        'Schedule minutes' => '',
        'Schedule hours' => '',
        'Schedule days' => '',
        'Toggle this widget' => '',
        'Ticket Filter' => '',
        '(e. g. 10*5155 or 105658*)' => '(např. 10*5155 or 105658*)',
        '(e. g. 234321)' => '(např. 234321)',
        'Customer login' => '',
        '(e. g. U5150)' => '(např. U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => '',
        'Agent' => 'Řešitel',
        'Ticket lock' => '',
        'Create times' => '',
        'No create time settings.' => 'Žádná nastavení Času Vytvoření.',
        'Ticket created' => 'Tiket vytvořen',
        'Ticket created between' => 'Tiket vytvořen mezi',
        'Change times' => '',
        'No change time settings.' => 'Žádná nastavení změny Času',
        'Ticket changed' => 'Tiket změněn',
        'Ticket changed between' => 'Tiket změněn mezi',
        'Close times' => '',
        'No close time settings.' => 'Čas Uzavření - bez nastavení',
        'Ticket closed' => 'Uzavřené Tikety',
        'Ticket closed between' => 'Uzavřené Tikety mezi',
        'Pending times' => '',
        'No pending time settings.' => 'Nevyřešené Časy - bez nastavení',
        'Ticket pending time reached' => 'Dosažen Čas Řešení',
        'Ticket pending time reached between' => 'Dosažen Čas Řešení mezi',
        'Escalation times' => '',
        'No escalation time settings.' => 'Časy Eskalace - bez nastavení',
        'Ticket escalation time reached' => 'Dosažen Čas Eskalace',
        'Ticket escalation time reached between' => 'Dosažen Čas Eskalace mezi',
        'Escalation - first response time' => '',
        'Ticket first response time reached' => 'Dosažen Čas První Odpovědi',
        'Ticket first response time reached between' => 'Dosažen Čas První Odpovědi mezi',
        'Escalation - update time' => '',
        'Ticket update time reached' => 'Dosažen Čas Aktualizace',
        'Ticket update time reached between' => 'Dosažen Čas Aktualizace mezi',
        'Escalation - solution time' => '',
        'Ticket solution time reached' => 'Dosažen Čas Řešení',
        'Ticket solution time reached between' => 'Dosažen Čas Řešení mezi',
        'Archive search option' => '',
        'Ticket Action' => '',
        'Set new service' => '',
        'Set new Service Level Agreement' => '',
        'Set new priority' => '',
        'Set new queue' => '',
        'Set new state' => '',
        'Set new agent' => '',
        'new owner' => '',
        'new responsible' => '',
        'Set new ticket lock' => '',
        'New customer' => '',
        'New customer ID' => '',
        'New title' => '',
        'New type' => '',
        'New Dynamic Field Values' => '',
        'Archive selected tickets' => '',
        'Add Note' => 'Přidat poznámku',
        'Time units' => 'Jednotky času',
        ' (work units)' => '(jednotky práce)',
        'Ticket Commands' => '',
        'Send agent/customer notifications on changes' => 'Odeslat upozornění Řešiteli/Zákazníkovi při změně',
        'CMD' => '',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Příkaz bude proveden. ARG[0] bude číslo Tiketu. ARG[1] ID Tiketu',
        'Delete tickets' => 'Vymazat Tikety',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            '',
        'Execute Custom Module' => '',
        'Param %s key' => '',
        'Param %s value' => '',
        'Save Changes' => '',
        'Results' => 'Výsledky',
        '%s Tickets affected! What do you want to do?' => '',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            '',
        'Edit job' => '',
        'Run job' => '',
        'Affected Tickets' => '',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => '',
        'Web Services' => '',
        'Debugger' => '',
        'Go back to web service' => '',
        'Clear' => '',
        'Do you really want to clear the debug log of this web service?' =>
            '',
        'Request List' => '',
        'Time' => 'Čas',
        'Remote IP' => '',
        'Loading' => '',
        'Select a single request to see its details.' => '',
        'Filter by type' => '',
        'Filter from' => '',
        'Filter to' => '',
        'Filter by remote IP' => '',
        'Refresh' => 'Obnovit',
        'Request Details' => '',
        'An error occurred during communication.' => '',
        'Show or hide the content' => '',
        'Clear debug log' => '',

        # Template: AdminGenericInterfaceInvokerDefault
        'Add new Invoker to Web Service %s' => '',
        'Change Invoker %s of Web Service %s' => '',
        'Add new invoker' => '',
        'Change invoker %s' => '',
        'Do you really want to delete this invoker?' => '',
        'All configuration data will be lost.' => '',
        'Invoker Details' => '',
        'The name is typically used to call up an operation of a remote web service.' =>
            '',
        'Please provide a unique name for this web service invoker.' => '',
        'The name you entered already exists.' => '',
        'Invoker backend' => '',
        'This OTRS invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            '',
        'Mapping for outgoing request data' => '',
        'Configure' => '',
        'The data from the invoker of OTRS will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            '',
        'Mapping for incoming response data' => '',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of OTRS expects.' =>
            '',
        'Event Triggers' => '',
        'Asynchronous' => '',
        'Delete this event' => '',
        'This invoker will be triggered by the configured events.' => '',
        'Do you really want to delete this event trigger?' => '',
        'Add Event Trigger' => '',
        'To add a new event select the event object and event name and click on the "+" button' =>
            '',
        'Asynchronous event triggers are handled by the OTRS Scheduler in background (recommended).' =>
            '',
        'Synchronous event triggers would be processed directly during the web request.' =>
            '',
        'Save and continue' => '',
        'Save and finish' => '',
        'Delete this Invoker' => '',
        'Delete this Event Trigger' => '',

        # Template: AdminGenericInterfaceMappingSimple
        'GenericInterface Mapping Simple for Web Service %s' => '',
        'Go back to' => '',
        'Mapping Simple' => '',
        'Default rule for unmapped keys' => '',
        'This rule will apply for all keys with no mapping rule.' => '',
        'Default rule for unmapped values' => '',
        'This rule will apply for all values with no mapping rule.' => '',
        'New key map' => '',
        'Add key mapping' => '',
        'Mapping for Key ' => '',
        'Remove key mapping' => '',
        'Key mapping' => '',
        'Map key' => '',
        'matching the' => '',
        'to new key' => '',
        'Value mapping' => '',
        'Map value' => '',
        'to new value' => '',
        'Remove value mapping' => '',
        'New value map' => '',
        'Add value mapping' => '',
        'Do you really want to delete this key mapping?' => '',
        'Delete this Key Mapping' => '',

        # Template: AdminGenericInterfaceOperationDefault
        'Add new Operation to Web Service %s' => '',
        'Change Operation %s of Web Service %s' => '',
        'Add new operation' => '',
        'Change operation %s' => '',
        'Do you really want to delete this operation?' => '',
        'Operation Details' => '',
        'The name is typically used to call up this web service operation from a remote system.' =>
            '',
        'Please provide a unique name for this web service.' => '',
        'Mapping for incoming request data' => '',
        'The request data will be processed by this mapping, to transform it to the kind of data OTRS expects.' =>
            '',
        'Operation backend' => '',
        'This OTRS operation backend module will be called internally to process the request, generating data for the response.' =>
            '',
        'Mapping for outgoing response data' => '',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            '',
        'Delete this Operation' => '',

        # Template: AdminGenericInterfaceTransportHTTPSOAP
        'GenericInterface Transport HTTP::SOAP for Web Service %s' => '',
        'Network transport' => '',
        'Properties' => '',
        'Endpoint' => '',
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
        'Add web service' => '',
        'Clone web service' => '',
        'The name must be unique.' => '',
        'Clone' => '',
        'Export web service' => '',
        'Import web service' => '',
        'Configuration File' => '',
        'The file must be a valid web service configuration YAML file.' =>
            '',
        'Import' => '',
        'Configuration history' => '',
        'Delete web service' => '',
        'Do you really want to delete this web service?' => '',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            '',
        'If you want to return to overview please click the "Go to overview" button.' =>
            '',
        'Web Service List' => '',
        'Remote system' => '',
        'Provider transport' => '',
        'Requester transport' => '',
        'Details' => '',
        'Debug threshold' => '',
        'In provider mode, OTRS offers web services which are used by remote systems.' =>
            '',
        'In requester mode, OTRS uses web services of remote systems.' =>
            '',
        'Operations are individual system functions which remote systems can request.' =>
            '',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            '',
        'Controller' => '',
        'Inbound mapping' => '',
        'Outbound mapping' => '',
        'Delete this action' => '',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            '',
        'Delete webservice' => '',
        'Delete operation' => '',
        'Delete invoker' => '',
        'Clone webservice' => '',
        'Import webservice' => '',

        # Template: AdminGenericInterfaceWebserviceHistory
        'GenericInterface Configuration History for Web Service %s' => '',
        'Go back to Web Service' => '',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            '',
        'Configuration History List' => '',
        'Version' => 'Verze',
        'Create time' => '',
        'Select a single configuration version to see its details.' => '',
        'Export web service configuration' => '',
        'Restore web service configuration' => '',
        'Do you really want to restore this version of the web service configuration?' =>
            '',
        'Your current web service configuration will be overwritten.' => '',
        'Show or hide the content.' => '',
        'Restore' => '',

        # Template: AdminGroup
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            '',
        'Group Management' => 'Správa skupiny',
        'Add group' => '',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Skupina administrátora má přístup do administrační a statistické zóny.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            '',
        'It\'s useful for ASP solutions. ' => '',
        'Add Group' => 'Přidat Skupinu',
        'Edit Group' => '',

        # Template: AdminLog
        'System Log' => 'Log systému',
        'Here you will find log information about your system.' => '',
        'Hide this message' => '',
        'Recent Log Entries' => '',

        # Template: AdminMailAccount
        'Mail Account Management' => 'Správa Emailových Účtů',
        'Add mail account' => '',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Všechny příchozí emaily z daného účtu budou zařazeny do vybrané fronty!',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            '',
        'Host' => 'Hostitel',
        'Delete account' => '',
        'Fetch mail' => '',
        'Add Mail Account' => '',
        'Example: mail.example.com' => '',
        'IMAP Folder' => '',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            '',
        'Trusted' => 'Ověřeno',
        'Dispatching' => 'Zařazení',
        'Edit Mail Account' => '',

        # Template: AdminNavigationBar
        'Admin' => '',
        'Agent Management' => '',
        'Queue Settings' => '',
        'Ticket Settings' => '',
        'System Administration' => '',

        # Template: AdminNotification
        'Notification Management' => 'Správa oznámení',
        'Select a different language' => '',
        'Filter for Notification' => '',
        'Notifications are sent to an agent or a customer.' => 'Oznámení jsou odeslána agentovi či klientovi',
        'Notification' => 'Upozornění',
        'Edit Notification' => '',
        'e. g.' => '',
        'Options of the current customer data' => '',

        # Template: AdminNotificationEvent
        'Add notification' => '',
        'Delete this notification' => '',
        'Add Notification' => 'Přidat oznámení',
        'Recipient groups' => '',
        'Recipient agents' => '',
        'Recipient roles' => '',
        'Recipient email addresses' => '',
        'Article type' => 'Typ položky',
        'Only for ArticleCreate event' => '',
        'Subject match' => 'Shoda Předmětu',
        'Body match' => 'Shoda Těla',
        'Include attachments to notification' => '',
        'Notification article type' => '',
        'Only for notifications to specified email addresses' => '',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'pro získáni prvních 20ti znaků z předmětu (z nejnovějšího článku Řešitele)',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'pro získáni prvních 5ti řádků z těla (z nejnovějšího článku Řešitele)',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'pro získáni prvních 20ti znaků z předmětu (z nejnovějšího článku Zákazníka)',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'pro získáni prvních 5ti řádků z těla (z nejnovějšího článku Zákazníka)',

        # Template: AdminPGP
        'PGP Management' => 'Správa PGP',
        'Use this feature if you want to work with PGP keys.' => '',
        'Add PGP key' => '',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'V tomto způsobu můžete Keyring, konfigurovaný v SysConfigu, editovat přímo',
        'Introduction to PGP' => '',
        'Result' => 'Výsledek',
        'Identifier' => 'Identifikátor',
        'Bit' => 'Kousek',
        'Fingerprint' => 'Otisk',
        'Expires' => 'Propadává',
        'Delete this key' => '',
        'Add PGP Key' => '',
        'PGP key' => '',

        # Template: AdminPackageManager
        'Package Manager' => 'Správa Balíčků',
        'Uninstall package' => '',
        'Do you really want to uninstall this package?' => 'Opravdu chcete odinstalovat tento Balíček?',
        'Reinstall package' => '',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            '',
        'Continue' => 'Pokračovat',
        'Install' => 'Instalovat',
        'Install Package' => '',
        'Update repository information' => '',
        'Did not find a required feature? OTRS Group provides their subscription customers with exclusive Add-Ons:' =>
            '',
        'Online Repository' => 'Online Schránka',
        'Vendor' => 'Prodavač',
        'Module documentation' => 'Dokumentace Modulu',
        'Upgrade' => 'Aktualizace',
        'Local Repository' => 'Lokální Schránka',
        'Uninstall' => 'Odinstalovat',
        'Reinstall' => 'Reinstalovat',
        'Download package' => '',
        'Rebuild package' => '',
        'Metadata' => '',
        'Change Log' => '',
        'Date' => 'Datum',
        'List of Files' => '',
        'Permission' => 'Práva',
        'Download' => '',
        'Download file from package!' => 'Download Souboru z Balíčku!',
        'Required' => 'Vyžadováno',
        'PrimaryKey' => 'Primární Klíč',
        'AutoIncrement' => 'Automatický Přírůstek',
        'SQL' => '',
        'File differences for file %s' => '',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Log Výkonu',
        'This feature is enabled!' => 'Tato Funkce je Aktivována!',
        'Just use this feature if you want to log each request.' => 'Pro logování všech Požadavků stačí zapnout tuto Funkci',
        'Activating this feature might affect your system performance!' =>
            'Aktivace této Funkce může ovlivnit chod Systému!',
        'Disable it here!' => 'Deaktivujte ji Zde!',
        'Logfile too large!' => 'Příliš velký logfile',
        'The logfile is too large, you need to reset it' => '',
        'Overview' => 'Přehled',
        'Range' => 'Oblast',
        'Interface' => 'Rozhraní',
        'Requests' => 'Požadavky',
        'Min Response' => 'Minimální Odezva',
        'Max Response' => 'Maximální Odezva',
        'Average Response' => 'Průměrná Odezva',
        'Period' => 'Perioda',
        'Min' => '',
        'Max' => '',
        'Average' => 'Průměr',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'Správa Filtru PostMaster',
        'Add filter' => '',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            '',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            '',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            '',
        'Delete this filter' => '',
        'Add PostMaster Filter' => '',
        'Edit PostMaster Filter' => '',
        'Filter name' => '',
        'The name is required.' => '',
        'Stop after match' => 'Stop po shodě',
        'Filter Condition' => '',
        'The field needs to be a valid regular expression or a literal word.' =>
            '',
        'Set Email Headers' => '',
        'The field needs to be a literal word.' => '',

        # Template: AdminPriority
        'Priority Management' => 'Správa priorit',
        'Add priority' => '',
        'Add Priority' => 'Přidat Prioritou',
        'Edit Priority' => '',

        # Template: AdminQueue
        'Manage Queues' => '',
        'Add queue' => '',
        'Add Queue' => '',
        'Edit Queue' => '',
        'Sub-queue of' => '',
        'Unlock timeout' => 'Čas do odemknutí',
        '0 = no unlock' => '0 = žádné odemknutí',
        'Only business hours are counted.' => 'Počítají se pouze úřední hodiny',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            '',
        'Notify by' => 'Upozorněno kým',
        '0 = no escalation' => '0 = žádné stupňování',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            '',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            '',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            '',
        'Follow up Option' => 'Následující volba',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            '',
        'Ticket lock after a follow up' => 'Zamknout tiket po následujícím',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            '',
        'System address' => '',
        'Will be the sender address of this queue for email answers.' => 'Bude adresou odesílatele z této fronty pro emailové odpovědi.',
        'Default sign key' => '',
        'The salutation for email answers.' => 'Oslovení pro emailové odpovědi.',
        'The signature for email answers.' => 'Podpis pro emailové odpovědi.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => '',
        'Filter for Queues' => '',
        'Filter for Auto Responses' => '',
        'Auto Responses' => 'Automatické Odpovědi',
        'Change Auto Response Relations for Queue' => '',
        'settings' => 'Nastavení',

        # Template: AdminQueueResponses
        'Manage Response-Queue Relations' => '',
        'Filter' => 'Filtr',
        'Filter for Responses' => '',
        'Responses' => 'Odpovědi',
        'Change Queue Relations for Response' => '',
        'Change Response Relations for Queue' => '',

        # Template: AdminResponse
        'Manage Responses' => '',
        'Add response' => '',
        'A response is default text to write faster answer (with default text) to customers.' =>
            'Odpověď je obsahuje výchozí text sloužící k rychlejší reakci (spolu s výchozím textem) klientům.',
        'Don\'t forget to add a new response a queue!' => 'Nezapomeňte přidat novou reakci odpoveď do fronty!',
        'Delete this entry' => '',
        'Add Response' => '',
        'Edit Response' => '',
        'The current ticket state is' => 'Aktuální stav tiketu je',
        'Your email address is' => '',

        # Template: AdminResponseAttachment
        'Manage Responses <-> Attachments Relations' => '',
        'Filter for Attachments' => '',
        'Change Response Relations for Attachment' => '',
        'Change Attachment Relations for Response' => '',
        'Toggle active for all' => '',
        'Link %s to selected %s' => '',

        # Template: AdminRole
        'Role Management' => 'Správa Rolí',
        'Add role' => '',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Vytvořit Roli a vložit do ní Skupiny. Následně přiřadit Roli Uživatelům.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            '',
        'Add Role' => 'Přidat Roli',
        'Edit Role' => '',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => '',
        'Filter for Roles' => '',
        'Roles' => 'Role',
        'Select the role:group permissions.' => '',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            '',
        'Change Role Relations for Group' => '',
        'Change Group Relations for Role' => '',
        'Toggle %s permission for all' => '',
        'move_into' => 'přesunout do',
        'Permissions to move tickets into this group/queue.' => 'Práva přesunout tikety do této skupiny/fronty',
        'create' => 'vytvořit',
        'Permissions to create tickets in this group/queue.' => 'Práva vytvořit tikety v této skupině/frontě',
        'priority' => 'priorita',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Práva změnit prioritu tiketu v této skupině/frontě',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => '',
        'Filter for Agents' => '',
        'Agents' => '',
        'Manage Role-Agent Relations' => '',
        'Change Role Relations for Agent' => '',
        'Change Agent Relations for Role' => '',

        # Template: AdminSLA
        'SLA Management' => 'Správa SLA',
        'Add SLA' => 'Přidat SLA',
        'Edit SLA' => '',
        'Please write only numbers!' => '',

        # Template: AdminSMIME
        'S/MIME Management' => 'Správa S/MIME',
        'Add certificate' => '',
        'Add private key' => '',
        'Filter for certificates' => '',
        'Filter for SMIME certs' => '',
        'Here you can add relations to your private certificate, these will be embedded to the SMIME signature every time you use this certificate to sign an email.' =>
            '',
        'See also' => 'Viz. také',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'V tomto způsobu můžete editovat Certifikáty a Privátní Klíče přímo v Souborovém Systému.',
        'Hash' => 'Hash #',
        'Create' => 'Vytvořit',
        'Handle related certificates' => '',
        'Delete this certificate' => '',
        'Add Certificate' => 'Přidat Certifikát',
        'Add Private Key' => 'Přidat Privátní Klíč',
        'Secret' => 'Tajný',
        'Related Certificates for' => '',
        'Delete this relation' => '',
        'Available Certificates' => '',
        'Relate this certificate' => '',

        # Template: AdminSalutation
        'Salutation Management' => 'Správa oslovení',
        'Add salutation' => '',
        'Add Salutation' => 'Přidat Oslovení',
        'Edit Salutation' => '',
        'Example salutation' => '',

        # Template: AdminScheduler
        'This option will force Scheduler to start even if the process is still registered in the database' =>
            '',
        'Start scheduler' => '',
        'Scheduler could not be started. Check if scheduler is not running and try it again with Force Start option' =>
            '',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => '',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'Bezpečnostní Mód bude (normálně) nastaven po dokončení iniciační instalace.',
        'Secure mode must be disabled in order to reinstall using the web-installer.' =>
            'Bezpečnostní Mód musí být deaktivován za účelem Reinstalu pomocí Web-Installeru.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            '',

        # Template: AdminSelectBox
        'SQL Box' => '',
        'Here you can enter SQL to send it directly to the application database.' =>
            '',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            '',
        'There is at least one parameter missing for the binding. Please check it.' =>
            '',
        'Result format' => '',
        'Run Query' => '',

        # Template: AdminService
        'Service Management' => 'Správa Služeb',
        'Add service' => '',
        'Add Service' => 'Přidat Službu',
        'Edit Service' => '',
        'Sub-service of' => '',

        # Template: AdminSession
        'Session Management' => 'Správa relace',
        'All sessions' => '',
        'Agent sessions' => '',
        'Customer sessions' => '',
        'Unique agents' => '',
        'Unique customers' => '',
        'Kill all sessions' => 'Ukončit všechny Relace',
        'Kill this session' => '',
        'Session' => 'Relace',
        'Kill' => '',
        'Detail View for SessionID' => '',

        # Template: AdminSignature
        'Signature Management' => 'Správa podpisů',
        'Add signature' => '',
        'Add Signature' => 'Přidat Podpis',
        'Edit Signature' => '',
        'Example signature' => '',

        # Template: AdminState
        'State Management' => 'Správa Stavu',
        'Add state' => '',
        'Please also update the states in SysConfig where needed.' => '',
        'Add State' => 'Přidat Stav',
        'Edit State' => '',
        'State type' => '',

        # Template: AdminSysConfig
        'SysConfig' => '',
        'Navigate by searching in %s settings' => '',
        'Navigate by selecting config groups' => '',
        'Download all system config changes' => '',
        'Export settings' => '',
        'Load SysConfig settings from file' => '',
        'Import settings' => '',
        'Import Settings' => '',
        'Please enter a search term to look for settings.' => '',
        'Subgroup' => 'Podskupina',
        'Elements' => 'Prvky',

        # Template: AdminSysConfigEdit
        'Edit Config Settings' => '',
        'This config item is only available in a higher config level!' =>
            '',
        'Reset this setting' => '',
        'Error: this file could not be found.' => '',
        'Error: this directory could not be found.' => '',
        'Error: an invalid value was entered.' => '',
        'Content' => 'Obsah',
        'Remove this entry' => '',
        'Add entry' => '',
        'Remove entry' => '',
        'Add new entry' => '',
        'Create new entry' => '',
        'New group' => '',
        'Group ro' => '',
        'Readonly group' => '',
        'New group ro' => '',
        'Loader' => '',
        'File to load for this frontend module' => '',
        'New Loader File' => '',
        'NavBarName' => 'Jméno Navigační Lišty',
        'NavBar' => 'Navigační Lišta',
        'LinkOption' => '',
        'Block' => 'Brzdová Destička',
        'AccessKey' => 'Přístupový Klíč',
        'Add NavBar entry' => '',
        'Year' => '',
        'Month' => '',
        'Day' => '',
        'Invalid year' => '',
        'Invalid month' => '',
        'Invalid day' => '',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Správa emailových adres systému',
        'Add system address' => '',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            '',
        'Email address' => '',
        'Display name' => '',
        'Add System Email Address' => '',
        'Edit System Email Address' => '',
        'The display name and email address will be shown on mail you send.' =>
            '',

        # Template: AdminType
        'Type Management' => 'Správa Typů Tiketu',
        'Add ticket type' => '',
        'Add Type' => 'Přidat Typ Tiketu',
        'Edit Type' => '',

        # Template: AdminUser
        'Add agent' => '',
        'Agents will be needed to handle tickets.' => '',
        'Don\'t forget to add a new agent to groups and/or roles!' => '',
        'Please enter a search term to look for agents.' => '',
        'Last login' => '',
        'Login as' => 'Přihlásit jako',
        'Switch to agent' => '',
        'Add Agent' => '',
        'Edit Agent' => '',
        'Firstname' => 'Křestní Jméno',
        'Lastname' => 'Příjmenní',
        'Password is required.' => '',
        'Start' => '',
        'End' => 'Konec',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => '',
        'Change Group Relations for Agent' => '',
        'Change Agent Relations for Group' => '',
        'note' => '',
        'Permissions to add notes to tickets in this group/queue.' => '',
        'owner' => 'vlastník',
        'Permissions to change the owner of tickets in this group/queue.' =>
            '',

        # Template: AgentBook
        'Address Book' => 'Adresář',
        'Search for a customer' => '',
        'Add email address %s to the To field' => '',
        'Add email address %s to the Cc field' => '',
        'Add email address %s to the Bcc field' => '',
        'Apply' => '',

        # Template: AgentCustomerSearch
        'Search Customer' => 'Vyhledat Zákazníka',
        'Duplicated entry' => '',
        'This address already exists on the address list.' => '',

        # Template: AgentCustomerTableView

        # Template: AgentDashboard
        'Dashboard' => 'Nástěnka',

        # Template: AgentDashboardCalendarOverview
        'in' => 'v',

        # Template: AgentDashboardIFrame

        # Template: AgentDashboardImage

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s je dostupný!',
        'Please update now.' => 'Aktualizujte prosím nyní',
        'Release Note' => 'Vypustit Poznámku',
        'Level' => 'Úroveň',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Odesláno před %s',

        # Template: AgentDashboardTicketGeneric
        'My locked tickets' => '',
        'My watched tickets' => '',
        'My responsibilities' => '',
        'Tickets in My Queues' => '',

        # Template: AgentDashboardTicketStats

        # Template: AgentDashboardUserOnline

        # Template: AgentHTMLReferenceForms

        # Template: AgentHTMLReferenceOverview

        # Template: AgentHTMLReferencePageLayout
        'The ticket has been locked' => '',
        'Undo & close window' => '',

        # Template: AgentInfo
        'Info' => '',
        'To accept some news, a license or some changes.' => '',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Svázat Objekt: %s',
        'Close window' => '',
        'go to link delete screen' => '',
        'Select Target Object' => '',
        'Link Object' => 'Svázat Objekt',
        'with' => 's',
        'Unlink Object: %s' => 'Zrušit Vazbu Objektu: %s',
        'go to link add screen' => '',

        # Template: AgentNavigationBar

        # Template: AgentPreferences
        'Edit your preferences' => '',

        # Template: AgentSpelling
        'Spell Checker' => 'Funkce na kontrolu pravopisu',
        'spelling error(s)' => 'chyba(y) v pravopisu',
        'Apply these changes' => 'Aplikovat tyto změny',

        # Template: AgentStatsDelete
        'Delete stat' => '',
        'Stat#' => '',
        'Do you really want to delete this stat?' => '',

        # Template: AgentStatsEditRestrictions
        'Step %s' => '',
        'General Specifications' => '',
        'Select the element that will be used at the X-axis' => '',
        'Select the elements for the value series' => 'Vybrat prvky pro řadu hodnot',
        'Select the restrictions to characterize the stat' => '',
        'Here you can make restrictions to your stat.' => 'Zde je možné provést omezení Statistik',
        'If you remove the hook in the "Fixed" checkbox, the agent generating the stat can change the attributes of the corresponding element.' =>
            '',
        'Fixed' => 'pevně stanoveno',
        'Please select only one element or turn off the button \'Fixed\'.' =>
            '',
        'Absolute Period' => '',
        'Between' => 'Mezi',
        'Relative Period' => 'Relativní Interval',
        'The last' => 'Poslední',
        'Finish' => 'Ukončit',

        # Template: AgentStatsEditSpecification
        'Permissions' => 'Oprávnění',
        'You can select one or more groups to define access for different agents.' =>
            '',
        'Some result formats are disabled because at least one needed package is not installed.' =>
            '',
        'Please contact your administrator.' => '',
        'Graph size' => '',
        'If you use a graph as output format you have to select at least one graph size.' =>
            'Při použití grafu jako výstupního formátu, je nutno vybrat alespoň jednu velikost grafu.',
        'Sum rows' => 'Součet řádků',
        'Sum columns' => 'Součet Sloupců',
        'Use cache' => '',
        'Most of the stats can be cached. This will speed up the presentation of this stat.' =>
            'Většina Reportů může být uložena do mezipaměti. Toto urychlí jejich následnou presentaci.',
        'If set to invalid end users can not generate the stat.' => '',

        # Template: AgentStatsEditValueSeries
        'Here you can define the value series.' => '',
        'You have the possibility to select one or two elements.' => '',
        'Then you can select the attributes of elements.' => '',
        'Each attribute will be shown as single value series.' => '',
        'If you don\'t select any attribute all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            '',
        'Scale' => 'Měřítko',
        'minimal' => 'minimální',
        'Please remember, that the scale for value series has to be larger than the scale for the X-axis (e.g. X-Axis => Month, ValueSeries => Year).' =>
            '',

        # Template: AgentStatsEditXaxis
        'Here you can define the x-axis. You can select one element via the radio button.' =>
            '',
        'maximal period' => 'maximální interval',
        'minimal scale' => 'minimální měřítko',

        # Template: AgentStatsImport
        'Import Stat' => '',
        'File is not a Stats config' => 'Soubor není nastavením Reportu',
        'No File selected' => 'Nebyl vybrán soubor',

        # Template: AgentStatsOverview
        'Stats' => 'Reporty',

        # Template: AgentStatsPrint
        'Print' => 'Tisknout',
        'No Element selected.' => 'Nebyl vybrán prvek',

        # Template: AgentStatsView
        'Export config' => '',
        'With the input and select fields you can influence the format and contents of the statistic.' =>
            '',
        'Exactly what fields and formats you can influence is defined by the statistic administrator.' =>
            '',
        'Stat Details' => '',
        'Format' => '',
        'Graphsize' => 'Velikost Grafu',
        'Cache' => 'Vyrovnávací paměť',
        'Exchange Axis' => 'Exchange osy',
        'Configurable params of static stat' => 'Konfigurovatelné parametry Statického Reportu',
        'No element selected.' => 'Nebyl vybrán prvek',
        'maximal period from' => 'maximální perioda z',
        'to' => 'komu',

        # Template: AgentTicketActionCommon
        'Change Free Text of Ticket' => '',
        'Change Owner of Ticket' => '',
        'Close Ticket' => '',
        'Add Note to Ticket' => '',
        'Set Pending' => 'Nastavit - čeká na vyřízení',
        'Change Priority of Ticket' => '',
        'Change Responsible of Ticket' => '',
        'Cancel & close window' => '',
        'Service invalid.' => '',
        'New Owner' => 'Nový vlastník',
        'Please set a new owner!' => '',
        'Previous Owner' => 'Předchozí vlastník',
        'Inform Agent' => '',
        'Optional' => '',
        'Inform involved Agents' => '',
        'Spell check' => '',
        'Note type' => 'Typ poznámky',
        'Next state' => 'Nasledující stav',
        'Pending date' => 'Datum čekání na vyřízení',
        'Date invalid!' => '',

        # Template: AgentTicketActionPopupClose

        # Template: AgentTicketBounce
        'Bounce Ticket' => '',
        'Bounce to' => 'Odeslat zpět',
        'You need a email address.' => '',
        'Need a valid email address or don\'t use a local email address.' =>
            '',
        'Next ticket state' => 'Následující stav tiketu',
        'Inform sender' => 'Informovat odesílatele',
        'Send mail!' => 'Poslat mail!',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Hromadná akce Tiketu',
        'Send Email' => '',
        'Merge to' => 'Spojit s',
        'Invalid ticket identifier!' => '',
        'Merge to oldest' => 'Spojit s nejstarším',
        'Link together' => 'spárovat dohlromady',
        'Link to parent' => '',
        'Unlock tickets' => '',

        # Template: AgentTicketClose

        # Template: AgentTicketCompose
        'Compose answer for ticket' => 'Sestavit odpověď pro tiket',
        'Remove Ticket Customer' => '',
        'Please remove this entry and enter a new one with the correct value.' =>
            '',
        'Please include at least one recipient' => '',
        'Remove Cc' => '',
        'Remove Bcc' => '',
        'Address book' => '',
        'Pending Date' => 'Očekávaný čas vyřízení',
        'for pending* states' => 'pro stavy očekávání*',
        'Date Invalid!' => '',

        # Template: AgentTicketCustomer
        'Change customer of ticket' => 'Změnit klienta tiketu',
        'Customer Data' => 'Data Zákazníka',
        'Customer user' => '',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => '',
        'From queue' => '',
        'To customer' => '',
        'Please include at least one customer for the ticket.' => '',
        'Get all' => '',

        # Template: AgentTicketEscalation

        # Template: AgentTicketForward
        'Forward ticket: %s - %s' => '',
        'Need a valid email address or don\'t use a local email address' =>
            '',

        # Template: AgentTicketFreeText

        # Template: AgentTicketHistory
        'History of' => 'Historie',
        'History Content' => '',
        'Zoom view' => '',

        # Template: AgentTicketMerge
        'Ticket Merge' => 'Sloučení Tiketu',
        'You need to use a ticket number!' => 'Notno použít číslo Tiketu',
        'A valid ticket number is required.' => '',
        'Need a valid email address.' => '',

        # Template: AgentTicketMove
        'Move Ticket' => 'Přesunout tiket',
        'New Queue' => 'Nová fronta',

        # Template: AgentTicketNote

        # Template: AgentTicketOverviewMedium
        'Select all' => '',
        'No ticket data found.' => '',
        'First Response Time' => 'Čas první reakce',
        'Service Time' => 'Servisní čas',
        'Update Time' => 'Čas Aktualizace',
        'Solution Time' => 'Čas Řešení',
        'Move ticket to a different queue' => '',
        'Change queue' => 'Změnit frontu',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Změnit možnosti vyhledávání',
        'Tickets per page' => '',

        # Template: AgentTicketOverviewPreview
        '","26' => '',

        # Template: AgentTicketOverviewSmall
        'Escalation in' => 'Eskalace v',
        'Locked' => 'Uzamčeno',
        '","30' => '',

        # Template: AgentTicketOwner

        # Template: AgentTicketPending

        # Template: AgentTicketPhone
        'Create New Phone Ticket' => '',
        'From customer' => '',
        'To queue' => '',

        # Template: AgentTicketPhoneCommon
        'Phone call' => 'Telefoní hovor',

        # Template: AgentTicketPlain
        'Email Text Plain View' => '',
        'Plain' => 'Jednoduché',
        'Download this email' => '',

        # Template: AgentTicketPrint
        'Ticket-Info' => 'Informace o Tiketu',
        'Accounted time' => 'Účtovaná doba',
        'Linked-Object' => '',
        'by' => 'přes',

        # Template: AgentTicketPriority

        # Template: AgentTicketQueue

        # Template: AgentTicketResponsible

        # Template: AgentTicketSearch
        'Search template' => 'Forma vyhledávání',
        'Create Template' => '',
        'Create New' => '',
        'Profile link' => '',
        'Save changes in template' => '',
        'Add another attribute' => '',
        'Output' => 'Forma výsledku',
        'Fulltext' => '',
        'Remove' => '',
        'Customer User Login' => 'Přihlášení klienta',
        'Created in Queue' => 'Vytvořeno ve Frontě',
        'Lock state' => '',
        'Watcher' => '',
        'Article Create Time (before/after)' => '',
        'Article Create Time (between)' => '',
        'Ticket Create Time (before/after)' => '',
        'Ticket Create Time (between)' => '',
        'Ticket Change Time (before/after)' => '',
        'Ticket Change Time (between)' => '',
        'Ticket Close Time (before/after)' => '',
        'Ticket Close Time (between)' => '',
        'Archive Search' => '',
        'Run search' => '',

        # Template: AgentTicketSearchOpenSearchDescriptionFulltext

        # Template: AgentTicketSearchOpenSearchDescriptionTicketNumber

        # Template: AgentTicketSearchResultPrint

        # Template: AgentTicketZoom
        'Article filter' => '',
        'Article Type' => 'Typ Článku',
        'Sender Type' => '',
        'Save filter settings as default' => 'Uložit Filtr jako Implicitní',
        'Ticket Information' => '',
        'Linked Objects' => '',
        'Article(s)' => '',
        'Change Queue' => '',
        'Article Filter' => '',
        'Add Filter' => '',
        'Set' => 'Nastavit',
        'Reset Filter' => '',
        'Show one article' => '',
        'Show all articles' => '',
        'Unread articles' => '',
        'No.' => '',
        'Unread Article!' => '',
        'Incoming message' => '',
        'Outgoing message' => '',
        'Internal message' => '',
        'Resize' => '',

        # Template: AttachmentBlocker
        'To protect your privacy, active or/and remote content has blocked.' =>
            '',
        'Load blocked content.' => '',

        # Template: Copyright

        # Template: CustomerAccept

        # Template: CustomerError
        'Traceback' => 'Jít zpět',

        # Template: CustomerFooter
        'Powered by' => 'Vytvořeno',
        'One or more errors occurred!' => '',
        'Close this dialog' => '',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            '',

        # Template: CustomerHeader

        # Template: CustomerLogin
        'Login' => 'Přihlášení',
        'User name' => '',
        'Your user name' => '',
        'Your password' => '',
        'Forgot password?' => '',
        'Log In' => '',
        'Not yet registered?' => '',
        'Sign up now' => '',
        'Request new password' => 'Požádat o nové heslo',
        'Your User Name' => '',
        'A new password will be sent to your email address.' => '',
        'Create Account' => 'Vytvořit účet',
        'Please fill out this form to receive login credentials.' => '',
        'How we should address you' => '',
        'Your First Name' => '',
        'Please supply a first name' => '',
        'Your Last Name' => '',
        'Please supply a last name' => '',
        'Your email address (this will become your username)' => '',
        'Please supply a' => '',

        # Template: CustomerNavigationBar
        'Edit personal preferences' => '',
        'Logout %s' => '',

        # Template: CustomerPreferences

        # Template: CustomerRichTextEditor

        # Template: CustomerTicketMessage
        'Service level agreement' => '',

        # Template: CustomerTicketOverview
        'Welcome!' => '',
        'Please click the button below to create your first ticket.' => '',
        'Create your first ticket' => '',

        # Template: CustomerTicketPrint
        'Ticket Print' => '',

        # Template: CustomerTicketSearch
        'Profile' => 'Profil',
        'e. g. 10*5155 or 105658*' => '',
        'Customer ID' => '',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => '',
        'Recipient' => 'Příjemci',
        'Carbon Copy' => '',
        'Time restrictions' => '',
        'No time settings' => '',
        'Only tickets created' => '',
        'Only tickets created between' => '',
        'Ticket archive system' => '',
        'Save search as template?' => '',
        'Save as Template?' => '',
        'Save as Template' => '',
        'Template Name' => '',
        'Pick a profile name' => '',
        'Output to' => '',

        # Template: CustomerTicketSearchOpenSearchDescription

        # Template: CustomerTicketSearchResultPrint

        # Template: CustomerTicketSearchResultShort
        'of' => 'z',
        'Page' => 'Strana',
        'Search Results for' => '',
        '","18' => '',

        # Template: CustomerTicketZoom
        'Expand article' => '',
        'Reply' => '',

        # Template: CustomerWarning

        # Template: Datepicker
        'Invalid date (need a future date)!' => '',
        'Previous' => '',
        'Sunday' => '',
        'Monday' => '',
        'Tuesday' => '',
        'Wednesday' => '',
        'Thursday' => '',
        'Friday' => '',
        'Saturday' => '',
        'Su' => '',
        'Mo' => '',
        'Tu' => '',
        'We' => '',
        'Th' => '',
        'Fr' => '',
        'Sa' => '',
        'Open date selection' => '',

        # Template: Error
        'Oops! An Error occurred.' => '',
        'Error Message' => '',
        'You can' => '',
        'Send a bugreport' => '',
        'go back to the previous page' => '',
        'Error Details' => '',

        # Template: Footer
        'Top of page' => '',

        # Template: FooterJS
        'If you now leave this page, all open popup windows will be closed, too!' =>
            '',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            '',
        'Please enter at least one search value or * to find anything.' =>
            '',

        # Template: FooterSmall

        # Template: HTMLHead

        # Template: HTMLHeadBlockEvents

        # Template: Header
        'You are logged in as' => '',

        # Template: HeaderSmall

        # Template: Installer
        'JavaScript not available' => '',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            '',
        'Database Settings' => '',
        'General Specifications and Mail Settings' => '',
        'Registration' => '',
        'Welcome to %s' => 'Vítejte v %s',
        'Web site' => '',
        'Database check successful.' => '',
        'Mail check successful.' => '',
        'Error in the mail settings. Please correct and try again.' => '',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => '',
        'Outbound mail type' => '',
        'Select outbound mail type.' => '',
        'Outbound mail port' => '',
        'Select outbound mail port.' => '',
        'SMTP host' => '',
        'SMTP host.' => '',
        'SMTP authentication' => '',
        'Does your SMTP host need authentication?' => '',
        'SMTP auth user' => '',
        'Username for SMTP auth.' => '',
        'SMTP auth password' => '',
        'Password for SMTP auth.' => '',
        'Configure Inbound Mail' => '',
        'Inbound mail type' => '',
        'Select inbound mail type.' => '',
        'Inbound mail host' => '',
        'Inbound mail host.' => '',
        'Inbound mail user' => '',
        'User for inbound mail.' => '',
        'Inbound mail password' => '',
        'Password for inbound mail.' => '',
        'Result of mail configuration check' => '',
        'Check mail configuration' => '',
        'Skip this step' => '',
        'Skipping this step will automatically skip the registration of your OTRS. Are you sure you want to continue?' =>
            '',

        # Template: InstallerDBResult
        'False' => '',

        # Template: InstallerDBStart
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty. For security reasons we do recommend setting a root password. For more information please refer to your database documentation.' =>
            '',
        'Currently only MySQL is supported in the web installer.' => '',
        'If you want to install OTRS on another database type, please refer to the file README.database.' =>
            '',
        'Database-User' => 'Uživatel',
        'New' => 'Nové',
        'A new database user with limited rights will be created for this OTRS system.' =>
            '',
        'default \'hot\'' => 'výchozí \'hot\'',
        'DB--- host' => '',
        'Check database settings' => '',
        'Result of database check' => '',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Abyste mohli používat OTRS, musíte zadat následující řádek do Vašeho příkazového řádku (Terminal/Shell) jako root.',
        'Restart your webserver' => 'Restartujte Váš webserver',
        'After doing so your OTRS is up and running.' => 'Po dokončení následujících operací je Váš OTRS spuštěn a poběží',
        'Start page' => 'Úvodní stránka',
        'Your OTRS Team' => 'Váš OTRS tým',

        # Template: InstallerLicense
        'Accept license' => 'Přijmout licenci',
        'Don\'t accept license' => '',

        # Template: InstallerLicenseText

        # Template: InstallerRegistration
        'Organization' => 'Organizace',
        'Position' => '',
        'Complete registration and continue' => '',
        'Please fill in all fields marked as mandatory.' => '',

        # Template: InstallerSystem
        'SystemID' => 'Systémové ID',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            '',
        'System FQDN' => 'Systém FQDN',
        'Fully qualified domain name of your system.' => '',
        'AdminEmail' => 'Email Administrátora',
        'Email address of the system administrator.' => '',
        'Log' => '',
        'LogModule' => 'Log Modul',
        'Log backend to use.' => '',
        'LogFile' => '',
        'Log file location is only needed for File-LogModule!' => '',
        'Webfrontend' => 'Webove rozhraní',
        'Default language' => '',
        'Default language.' => '',
        'CheckMXRecord' => 'Kontrola MX záznamu',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            '',

        # Template: LinkObject
        'Object#' => '',
        'Add links' => '',
        'Delete links' => '',

        # Template: Login
        'JavaScript Not Available' => '',
        'Browser Warning' => '',
        'The browser you are using is too old.' => '',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            '',
        'Please see the documentation or ask your admin for further information.' =>
            '',
        'Lost your password?' => 'Ztratil/a jste heslo?',
        'Request New Password' => '',
        'Back to login' => '',

        # Template: Motd
        'Message of the Day' => '',

        # Template: NoPermission
        'Insufficient Rights' => '',
        'Back to the previous page' => '',

        # Template: Notify

        # Template: Pagination
        'Show first page' => '',
        'Show previous pages' => '',
        'Show page %s' => '',
        'Show next pages' => '',
        'Show last page' => '',

        # Template: PictureUpload
        'Need FormID!' => '',
        'No file found!' => '',
        'The file is not an image that can be shown inline!' => '',

        # Template: PrintFooter
        'URL' => '',

        # Template: PrintHeader
        'printed by' => 'tisknuto',

        # Template: PublicDefault

        # Template: Redirect

        # Template: RichTextEditor

        # Template: SpellingInline

        # Template: Test
        'OTRS Test Page' => 'Testovací OTRS stránka',
        'Welcome %s' => 'Vítejte %s',
        'Counter' => 'Počítadlo',

        # Template: Warning
        'Go back to the previous page' => '',

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
        'Agent Notifications' => '',
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
        'Agents <-> Groups' => '',
        'Agents <-> Roles' => '',
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
        'Attachments <-> Responses' => 'Přílohy <-> Odpovědi',
        'Auto Responses <-> Queues' => '',
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
        'Change password' => '',
        'Change queue!' => '',
        'Change the customer for this ticket' => '',
        'Change the free fields for this ticket' => '',
        'Change the priority for this ticket' => '',
        'Change the responsible person for this ticket' => '',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            '',
        'Checkbox' => '',
        'Checks the SystemID in ticket number detection for follow-ups (use "No" if SystemID has been changed after using the system).' =>
            '',
        'Closed tickets of customer' => '',
        'Comment for new history entries in the customer interface.' => '',
        'Companies' => '',
        'Company Tickets' => '',
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
        'Create and manage Service Level Agreements (SLAs).' => '',
        'Create and manage agents.' => '',
        'Create and manage attachments.' => '',
        'Create and manage companies.' => '',
        'Create and manage customers.' => '',
        'Create and manage dynamic fields.' => '',
        'Create and manage event based notifications.' => '',
        'Create and manage groups.' => '',
        'Create and manage notifications that are sent to agents.' => '',
        'Create and manage queues.' => '',
        'Create and manage response templates.' => '',
        'Create and manage responses that are automatically sent.' => '',
        'Create and manage roles.' => '',
        'Create and manage salutations.' => '',
        'Create and manage services.' => '',
        'Create and manage signatures.' => '',
        'Create and manage ticket priorities.' => '',
        'Create and manage ticket states.' => '',
        'Create and manage ticket types.' => '',
        'Create and manage web services.' => '',
        'Create new email ticket and send this out (outbound)' => '',
        'Create new phone ticket (inbound)' => '',
        'Custom text for the page shown to customers that have no tickets yet.' =>
            '',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customers <-> Groups' => '',
        'Customers <-> Services' => '',
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
        'Default skin for interface.' => '',
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
        'Email Addresses' => 'Emailové Adresy',
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
        'Escalation view' => '',
        'Event list to be displayed on GUI to trigger generic interface invokers.' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Example for dynamic dield' => '',
        'Example for dynamic field' => '',
        'Example for free text' => '',
        'Execute SQL statements.' => '',
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
        'Filter incoming emails.' => '',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            '',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            '',
        'Forces to unlock tickets after being moved to another queue.' =>
            '',
        'Frontend language' => '',
        'Frontend module registration (disable company link if no company feature is used).' =>
            '',
        'Frontend module registration for the agent interface.' => '',
        'Frontend module registration for the customer interface.' => '',
        'Frontend theme' => '',
        'GenericAgent' => 'Obecný Prostředek',
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
            '',
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
        'Interface language' => '',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'Link agents to groups.' => '',
        'Link agents to roles.' => '',
        'Link attachments to responses templates.' => '',
        'Link customers to groups.' => '',
        'Link customers to services.' => '',
        'Link queues to auto responses.' => '',
        'Link responses to queues.' => '',
        'Link roles to groups.' => '',
        'Links 2 tickets with a "Normal" type link.' => '',
        'Links 2 tickets with a "ParentChild" type link.' => '',
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
        'Manage PGP keys for email encryption.' => '',
        'Manage POP3 or IMAP accounts to fetch email from.' => '',
        'Manage S/MIME certificates for email encryption.' => '',
        'Manage existing sessions.' => '',
        'Manage periodic tasks.' => '',
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
        'My Tickets' => '',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            '',
        'New email ticket' => '',
        'New phone ticket' => '',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Notifications (Event)' => '',
        'Number of displayed tickets' => '',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            '',
        'Open tickets of customer' => '',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            '',
        'Overview Escalated Tickets' => '',
        'Overview Refresh Time' => '',
        'Overview of all open Tickets.' => '',
        'PGP Key Management' => '',
        'PGP Key Upload' => '',
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
        'PostMaster Filters' => '',
        'PostMaster Mail Accounts' => '',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see http://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            '',
        'Queue view' => '',
        'Refresh Overviews after' => '',
        'Refresh interval' => '',
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
        'Responses <-> Queues' => '',
        'Restores a ticket from the archive (only if the event is a state change, from closed to any open available state).' =>
            '',
        'Roles <-> Groups' => 'Role <-> Skupiny',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            '',
        'Runs the system in "Demo" mode. If set to "Yes", agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            '',
        'S/MIME Certificate Upload' => '',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the OTRS user. You can switch between the modules even on a system that is already in production without any loss of data.' =>
            '',
        'Saves the login and password on the session table in the database, if "DB" was selected for SessionModule.' =>
            '',
        'Search backend default router.' => '',
        'Search backend router.' => '',
        'Select your frontend Theme.' => 'Výběr motivu rozhraní.',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            '',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            '',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            '',
        'Send notifications to users.' => '',
        'Send ticket follow up notifications' => '',
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
        'Set sender email addresses for this system.' => '',
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
        'Skin' => '',
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
        'Statistics' => '',
        'Status view' => '',
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
        'Ticket overview' => '',
        'Tickets' => 'Tikety',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            '',
        'Toolbar Item for a shortcut.' => '',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            '',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            '',
        'Types' => '',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            '',
        'Update and extend your system with software packages.' => '',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            '',
        'Updates the ticket index accelerator.' => '',
        'Uses Cc recipients in reply Cc list on compose an email answer in the ticket compose screen of the agent interface.' =>
            '',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard responses, auto responses and notifications.' =>
            '',
        'View performance benchmark results.' => '',
        'View system log messages.' => '',
        'Wear this frontend skin' => '',
        'Webservice path separator.' => '',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. In this text area you can define this text (This text cannot be changed by the agent).' =>
            '',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            '',
        'Your language' => '',
        'Your queue selection of your favorite queues. You also get notified about those queues via email if enabled.' =>
            'Selekce Front z Oblíbených. Bude zasíláno oznámení, je-li zapnuto.',

        #
        # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
        #
        '%s Tickets affected! Do you really want to use this job?' => 'Ovlivněno %s Tiketů! Opravdu spustit Úlohu?',
        '(Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behinde a dial-up line $!)' =>
            '(Kontroluj MX záznamy použitých emailových adres při sestavování odpovědi. Nepoužívejte pokud OTRS server připojen pomocí vytáčené linky!)',
        '(Email of the system admin)' => '(Email administrátora systému)',
        '(Full qualified domain name of your system)' => '(Platný název domény pro váš systém (FQDN))',
        '(Logfile just needed for File-LogModule!)' => '(Pro logování do souboru je nutné zadat název souboru logu!)',
        '(Note: It depends on your installation how many dynamic objects you can use)' =>
            '(Poznámka: počet možných použitých Dynamických Objektů je závislý na typu Instalace)',
        '(Note: Useful for big databases and low performance server)' => '(Poznámka: vhodné pro obsáhlé databáze a méně výkoné servery)',
        '(The identify of the system. Each ticket number and each http session id starts with this number)' =>
            '(Identita systému. Každé číslo tiketu a ID každá HTTP relace začíná tímto číslem)',
        '(Ticket identifier. Some people want toset this to e. g. \'Ticket#\', \'Call#\' or \'MyTicket#\')' =>
            '(Identifikátor tiketů. Nekteří lidé chtějí nastavit např. \'Tiket#\',  \'Hovor#\' nebo \'MujTiket#\')',
        '(Used default language)' => '(Použitý výchozí jazyk)',
        '(Used log backend)' => '(Použit výstup do logu)',
        '(Used ticket number format)' => '(Použitý formát čísel tiketů)',
        'A article should have a title!' => 'Článek by měl mít nadpis!',
        'A message must be spell checked!' => 'Zpráva musí být pravopisně zkontrolovaná!',
        'A message should have a To: recipient!' => 'Zpráva by měla obsahovat Komu: příjemce!',
        'A message should have a body!' => 'Zpráva by měla mít tělo!',
        'A message should have a subject!' => 'Zpráva by měla mít předmět!',
        'A web calendar' => 'WEB Kalendář',
        'A web file manager' => 'Webový Správce Souborů',
        'A web mail client' => 'Web Email Klient',
        'Absolut Period' => 'Absolutní Interval',
        'Account Type' => 'Typ Účtu',
        'Add Customer User' => 'Přidat Uživatele Zákazníka',
        'Add System Address' => 'Přidat Systémovou Adresu',
        'Add User' => 'Přidat Uživatele',
        'Add a new Agent.' => 'Přidat Řešitele',
        'Add a new Customer Company.' => 'Přidat novou Společnost Zákazníka',
        'Add a new Group.' => 'Přidat Novou Skupinu',
        'Add a new Notification.' => 'Přidat Nové Oznámení',
        'Add a new Priority.' => 'Přidat novou Prioritou',
        'Add a new Role.' => 'Přidat Novou Roli',
        'Add a new SLA.' => 'Přidat nové SLA',
        'Add a new Salutation.' => 'Přidat nové Oslovení',
        'Add a new Service.' => 'Přidat novou Službu',
        'Add a new Signature.' => 'Přidat nový Podpis',
        'Add a new State.' => 'Přidat nový Stav',
        'Add a new System Address.' => 'Přidat novou Systémovou Adresu',
        'Add a new Type.' => 'Přidat nový Typ Tiketu',
        'Add a note to this ticket!' => 'Přidat poznámku do Tiketu',
        'Add note to ticket' => 'Přidat poznámku k tiketu',
        'Added User "%s"' => 'Přidaní Uživatelé "%s"',
        'Admin-Area' => 'Oblast Admina',
        'Admin-Email' => 'Email administrátora',
        'Admin-Password' => 'Heslo Administrátora',
        'Admin-User' => 'Administrátor',
        'Advisory' => 'Poradenství',
        'Agent Mailbox' => 'Mailbox Řešitele',
        'Agent Preferences' => 'Předvolby Řešitele',
        'Agent based' => 'na základě Řešitele',
        'Agent-Area' => 'Oblast Řešitele',
        'All Agent variables.' => 'Všechny Proměnné Řešitele',
        'All Agents' => 'Všichni Řešitelé',
        'All customer tickets.' => 'Všechny tikety Zákazníka',
        'All email addresses get excluded on replaying on composing an email.' =>
            'Vyloučit všechny Emailové adresy v odpovědi nového mailu.',
        'All incoming emails with this "Email" (To:) will be dispatched in the selected queue!' =>
            'Všechny příchozí emaily obsahující tohoto adresáta (v poli KOMU) budou zařazeny to vybrané fronty!',
        'All messages' => 'Všechny zprávy',
        'All new tickets!' => 'Všechny nové Tikety!',
        'All tickets where the reminder date has reached!' => 'Všechny Tikety u kterých byla dosažena upomínka!',
        'All tickets which are escalated!' => 'Všechny Tikety které jsou Eskalovány!',
        'Allocate CustomerUser to service' => 'Přidělit Zákazníka/Uživatele ke Službě',
        'Allocate services to CustomerUser' => 'Přidělit Službu Zákazníkovi/Uživateli',
        'Answer' => 'Odpověď',
        'Article Create Times' => 'Čas vytvoření Článku',
        'Article created' => 'Článek vytvořen',
        'Article created between' => 'Článek vytvořen mezi',
        'Article filter settings' => 'Nastavení Filtru Článku',
        'ArticleID' => 'ID položky',
        'Attach' => 'Připojit',
        'Attribute' => 'Atribut',
        'Auto Response From' => 'Automatická odpověď Od',
        'Bounce ticket' => 'Odeslat tiket zpět',
        'Can not create link with %s!' => 'Není možné vytvořit vazbu s %s',
        'Can not delete link with %s!' => 'Nemožné smazat spárování s %s',
        'Category Tree' => 'Strom Kategorií',
        'Change %s settings' => 'Změnit nastavení %s',
        'Change Times' => 'Změna časů',
        'Change free text of ticket' => 'Změnit úplný text tiketu',
        'Change owner of ticket' => 'Změnit vlastníka tiketu',
        'Change priority of ticket' => 'Změnit důležitost tiketu',
        'Change responsible of ticket' => 'Změna Odpovědnosti Tiketu',
        'Change roles <-> groups settings' => 'Změna Rolí <-> Nastavení Skupin',
        'Change the ticket customer!' => 'Změna Zákazníka Tiketu',
        'Change the ticket owner!' => 'Změna vlastníka tiketu!',
        'Change the ticket priority!' => 'Změna Priority tiketu',
        'Change user <-> group settings' => 'Změnit uživatele <-> nastavení skupiny',
        'ChangeLog' => 'Log Změn',
        'Child-Object' => 'Podřízený Objekt',
        'Clear From' => 'Vymazat pole Od',
        'Clear To' => 'Vyčistit',
        'Click here to report a bug!' => 'Klikněte zde pro nahlášení chyby!',
        'Close Times' => 'Časy Uzavření',
        'Close this ticket!' => 'Uzavřít Tiket',
        'Close ticket' => 'Zavřít tiket',
        'Close type' => 'Zavřít typ',
        'Close!' => 'Zavřít!',
        'Collapse View' => 'Zkrácený pohled',
        'Comment (internal)' => 'Komentář (interní)',
        'CompanyTickets' => 'Firemní Tikety',
        'Compose Answer' => 'Odpovědět',
        'Compose Email' => 'Napsat Email',
        'Compose Follow up' => 'Sestavit následující',
        'Config Options' => 'Sparáva Nastavení',
        'Config options (e. g. &lt;OTRS_CONFIG_HttpType&gt;)' => 'Možnosti Nastavení (příklad: &lt;OTRS_CONFIG_HttpType&gt;)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>)' => 'Možnosti Nastavení (příklad: <OTRS?CONFIG?HttpType>)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>).' => 'Možnosti Upřesnění (příklad <OTRS_CONFIG_HttpType>).',
        'Contact customer' => 'Kontaktovat klienta',
        'Create Times' => 'Časy Vytvoření',
        'Create new Phone Ticket' => 'Vytvořit nový Telefonní Tiket',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...).' =>
            'Vytvořit nové skupiny pro přiřazení práv přístupů ruzným skupinám agentů (např. oddělení nákupu, oddělení podpory, oddělení prodeje...).',
        'CreateTicket' => 'Vytvořeno Tiketu',
        'Customer Move Notify' => 'Oznámení Klientovi o změně fronty',
        'Customer Owner Notify' => 'Oznámení Klientovi o změně vlastníka',
        'Customer State Notify' => 'Oznámení Klientovi o změně stavu',
        'Customer User' => 'Uživatelé Zákazníka',
        'Customer User Management' => 'Správa Zákaznických Uživatelů',
        'Customer Users' => 'Uživatelé Zákazníka',
        'Customer Users <-> Groups' => 'Uživatelé Zákazníka <-> Skupiny',
        'Customer Users <-> Groups Management' => 'Uživatelé Zákazníka <-> Správa Skupin',
        'Customer Users <-> Services Management' => 'Uživatelé Zákazníka <-> Správa Služeb',
        'Customer history' => 'Historie Zákazníka',
        'Customer history search' => 'Vyhledávání historie klienta',
        'Customer history search (e. g. "ID342425").' => 'Vyhledávání historie klienta (např. "ID342425")',
        'Customer user will be needed to have a customer history and to login via customer panel.' =>
            'Uživatel Zákazníka bude potřebovat zákaznickou historii a logovat se ze Zákaznického Modulu',
        'CustomerUser' => 'Klient',
        'D' => 'A-Z',
        'DB Admin Password' => 'Heslo administrátora databáze',
        'DB Admin User' => 'Administrátor databáze',
        'DB Host' => 'Hostitel (server) databáze',
        'DB Type' => 'Typ databáze',
        'DB connect host' => 'Spojení s DB ztraceno',
        'Default' => 'Defaultní',
        'Default Charset' => 'Výchozí znaková sada',
        'Default Language' => 'Výchozí jazyk',
        'Delete old database' => 'Smazat starou databázi',
        'Delete this ticket!' => 'Výmaz Tiketu',
        'Diff' => 'Rozdíl',
        'Discard all changes and return to the compose screen' => 'Zrušit všechny změny a vrátit se zpět do okna vytváření',
        'Do dispatch or filter incoming emails based on email X-Headers! RegExp is also possible.' =>
            'Odešli nebo Filtruj příchozí meaily založené na X-Headers! Možný je také RegExp.',
        'Do you really want to delete this Object?' => 'Opravdu smazat tento Objekt?',
        'Do you really want to reinstall this package (all manual changes get lost)?' =>
            'Opravdu chcete reinstalovat tento Balíček (všechna manuální nastavení budou ztracena)?',
        'Don\'t forget to add a new user to groups!' => 'Nezapomeňte přidat nového uživatele do skupin!',
        'Don\'t work with UserID 1 (System account)! Create new users!' =>
            'Z bezpečnostních důvodů nepracujte se superuživatelským účtem - vytvořte si nového uživatele!',
        'Download Settings' => 'Stáhnout Nastavení',
        'Download all system config changes.' => 'Stáhnout všechny Systémové Konfigurační změny.',
        'Drop Database' => 'Odstranit databazi',
        'Dynamic-Object' => 'Dynamický Objekt',
        'Edit default services.' => 'Upravit Výchozí Službu',
        'Email based' => 'na základě Emailu',
        'Escaladed Tickets' => 'Eskalované Tikety',
        'Escalation - First Response Time' => 'Eskalace - Čas První Odpovědi!',
        'Escalation - Solution Time' => 'Eskalace - Čas Řešení',
        'Escalation - Update Time' => 'Eskalace - Čas Aktualizace',
        'Escalation Times' => 'Časy Eskalace',
        'Escalation time' => 'Doba Eskalace',
        'Event is required!' => 'Vyžadována Událost!',
        'Expand View' => 'Rozšířený pohled',
        'Explanation' => 'Legenda',
        'Export Config' => 'Exportovat nastavení',
        'FileManager' => 'Správce Souborů',
        'Filelist' => 'Seznam Souborů',
        'Filtername' => 'Jméno Filtru',
        'Follow up' => 'Následující',
        'Follow up notification' => 'Následuj Oznámení',
        'For very complex stats it is possible to include a hardcoded file.' =>
            'Do hodně komplexních Reportů je možné zahrnout zakódované soubory.',
        'Frontend' => 'Rozhraní',
        'Fulltext-Search in Article (e. g. "Mar*in" or "Baue*")' => 'Fulltextové vyhledávání v položce (např. "Mar*in" or "Baue*")',
        'Group Ro' => 'Skupina pouze pro čtení',
        'Group based' => 'na základě Skupiny',
        'Group selection' => 'Výběr Skupiny',
        'Have a lot of fun!' => 'Přejeme hodně úspěchů s OTRS!',
        'Here you can insert a description of the stat.' => 'Zde můžete vložit popis Statistiky',
        'Here you can select the dynamic object you want to use.' => 'Zde můžete vybrat Dinamický Objekt, který chcete použít.',
        'Home' => 'Domů',
        'If Secure Mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Pokud není Bezpečnostní Mód aktivní, proveďte tak pomocí SysConfigu, protože aplikace stále běží.',
        'If a new hardcoded file is available this attribute will be shown and you can select one.' =>
            'V případě nového dostupného Zakódovaného Souboru bude zobrazen příznak a bude možné jej vybrat.',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked for the old owner.' =>
            'Pokud je tiket uzavřen a klient odešle následující, tiket bude pro starého vlastníka uzamknut.',
        'If a ticket will not be answered in this time, just only this ticket will be shown.' =>
            'Pokud na Tiket nebude reagováno v tomto čase, bude zobrazen poze tento.',
        'If a ticket will not be answered in thos time, just only this ticket will be shown.' =>
            'Nebude-li tiket odpovězen v daném čase, bude zobrazen pouze tento Tiket.',
        'If an agent locks a ticket and he/she will not send an answer within this time, the ticket will be unlock automatically. So the ticket is viewable for all other agents.' =>
            'Pokud Řešitel uzamkne tiket a neodešle v této době odpověď, tiket bude automaticky odemknut. Tak se stane tiket viditelný pro všechny ostatní Řešitele.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the user).' =>
            'Pokud nebylo nic vybráno, nejsou v této skupině žádná práva (tikety nebudou pro uživatele dostupné).',
        'If you need the sum of every column select yes.' => 'Je-li vyžadován součet všech sloupců, vyberte ANO',
        'If you need the sum of every row select yes' => 'Je-li vyžadován součet všech řádků, vyberte ANO',
        'If you want to account time, please provide Subject and Text!' =>
            'Jestli chcete počítat čas, poskytněte Předmět a Text!',
        'Image' => 'Obrázek',
        'Important' => 'Důležité',
        'In this form you can select the basic specifications.' => 'V tomto Formuláři můžete vybrat základní specifikace.',
        'In this way you can directly edit the keyring configured in Kernel/Config.pm.' =>
            'V tomto zúůsobu můžete přímo editovat Keyring konfigurovaný v Kernelu pm.',
        'Information about the Stat' => 'Informace o Reportu',
        'Insert of the common specifications' => 'Vložení společných upřesnění',
        'Is Job Valid' => 'Je Úloha platná',
        'Is Job Valid?' => 'Je Úloha platná?',
        'It\'s useful for ASP solutions.' => 'To je vhodné pro řešení ASP',
        'Job-List' => 'Seznam Úloh',
        'Keyword' => 'Klíčové slovo',
        'Keywords' => 'Klíčová slova',
        'Last update' => 'Poslední aktualizace',
        'Link this ticket to an other objects!' => 'Spárovat Tiket s jinými objekty!',
        'Link to Parent' => 'Spárovat s mateřským',
        'Linked as' => 'Spárováno jako',
        'Load Settings' => 'Nahrát Nastavení',
        'Lock it to work on it!' => 'Uzamknout pro práci',
        'Logfile' => 'Log soubor',
        'Logfile too large, you need to reset it!' => 'Příliš velký logfile, proveťe jeho reset!',
        'Login failed! Your username or password was entered incorrectly.' =>
            'Přihlášení neúspěšné! Vaše uživatelské jméno či heslo bylo zadáno nesprávně.',
        'Lookup' => 'Vyhledávání',
        'Mail Management' => 'Správa e-mailů',
        'Mailbox' => 'Poštovní schránka',
        'Match' => 'Obsahuje',
        'Merge this ticket!' => 'Sloučit Tiket',
        'Message for new Owner' => 'Zpráva pro nového vlastníka',
        'Message sent to' => 'Zpráva odeslána',
        'Misc' => 'Různé',
        'Modified' => 'Změněno',
        'Modules' => 'Moduly',
        'Move notification' => 'Přesunout oznámení',
        'Multiple selection of the output format.' => 'Výběr ze Selekce výstupního formátu.',
        'MyTickets' => 'moje Tikety',
        'Name is required!' => 'Vyžadováno Jméno!',
        'New Agent' => 'Nový Řešitel',
        'New Customer' => 'Nový Zákazník',
        'New Group' => 'Nová Skupina',
        'New Group Ro' => 'Nová Skupina pouze pro čtení',
        'New Password' => 'Nové heslo',
        'New Priority' => 'Nová Priorita',
        'New SLA' => 'Nové SLA',
        'New Service' => 'Nová Služba',
        'New State' => 'Nový Stav',
        'New Ticket Lock' => 'Nový Zámek Tiketu',
        'New TicketFreeFields' => 'Nová Volná Pole Tiketu',
        'New Title' => 'Nový Nadpis',
        'New Type' => 'Nový Typ Tiketu',
        'New account created. Sent Login-Account to %s.' => 'Nový účet vytvořen. Přihlašovací údaje odeslány na %s.',
        'New messages' => 'Nové zprávy',
        'New password again' => 'Potvrdit Nové Heslo',
        'Next Week' => 'Další Týden',
        'No * possible!' => 'Žádná * možná!',
        'No Packages for requested Framework in this Online Repository, but Packages for other Frameworks!' =>
            'Žádné balíčky pro požadovaný rámec v tomto online úložišti, než pro jiné rámce!',
        'No Packages or no new Packages in selected Online Repository!' =>
            'Žádné (nové) balíčky ve vybraném online úložišti',
        'No Permission' => 'Nedostatečná práva',
        'No means, send agent and customer notifications on changes.' => 'Ne znamená: poslat Řešiteli i Zákazníkovi oznámení při změně',
        'No time settings.' => 'Žádná nastavení času',
        'Note Text' => 'Text poznámky',
        'Notification (Customer)' => 'Oznámení (Zákazníkovi)',
        'Notifications' => 'Notifikace',
        'OTRS DB Name' => 'Název OTRS databáze',
        'OTRS DB Password' => 'Heslo OTRS databáze',
        'OTRS DB User' => 'Uživatel OTRS databáze',
        'OTRS DB connect host' => 'Hostitel OTRS databáze (server)',
        'OTRS sends an notification email to the customer if the ticket is moved.' =>
            'OTRS pošle klientovi emailem oznámení, pokud bude tiket přesunut.',
        'OTRS sends an notification email to the customer if the ticket owner has changed.' =>
            'OTRS pošle klientovi emailem oznámení, pokud se změní vlastník tiketu.',
        'OTRS sends an notification email to the customer if the ticket state has changed.' =>
            'OTRS pošle klientovi emailem oznámení, pokud se změní stav tiketu.',
        'Object already linked as %s.' => 'Objekt je již spárován jako %s',
        'Of couse this feature will take some system performance it self!' =>
            'Při nastání tohoto jevu dojde k poklesu výkonu',
        'Only for ArticleCreate Event.' => 'Pouze pro událost vytvoření Článku',
        'Open Tickets' => 'Otevřít Tikety',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>).' =>
            'Možnosti informací o tomto Uživateli Zákazníka (příklad <OTRS_CUSTOMER_DATA_UserFirstname>).',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>)' =>
            'Možnosti stávajícího Uživatele požadujícího tuto akci (příklad: <OTRS_CURRENT_UserFirstname>)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>).' =>
            'Možnosti tohoto Uživatele, který požadoval tuto akci (příklad <OTRS_CURRENT_UserFirstname>).',
        'Options of the ticket data (e. g. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Možnosti dat Tiketu (příklad: <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Možnosti dat Tiketu (příklad: <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).' =>
            'Možnosti dat Tiketu (příklad <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).',
        'Other Options' => 'Další možnosti',
        'Out Of Office' => 'Mimo Kancelář',
        'POP3 Account Management' => 'Správa POP3 účtů',
        'Package' => 'Balíček',
        'Package not correctly deployed! You should reinstall the Package again!' =>
            'Rozbalení balíčku neúspěšné! Reinstalujte balíček znovu!',
        'Param 1' => 'Parametr 1',
        'Param 2' => 'Parametr 2',
        'Param 3' => 'Parametr 3',
        'Param 4' => 'Parametr 4',
        'Param 5' => 'Parametr 5',
        'Param 6' => 'Parametr 6',
        'Parent-Object' => 'Nadřazený Objekt',
        'Password is already in use! Please use an other password!' => 'Heslo je používáno! Použijte prosím jiné heslo!',
        'Password is already used! Please use an other password!' => 'Heslo je již použito! Použijte prosím jiné heslo!',
        'Pending Times' => 'Nevyřešené Časy',
        'Pending messages' => 'Zprávy čekající na vyřízení',
        'Pending type' => 'Typ čekání na vyřízení',
        'Permission settings. You can select one or more groups to make the configurated stat visible for different agents.' =>
            'Nastavení Oprávnění. Na základě selekce Skupin můžete report zviditelnit různým Řešitelům.',
        'Permissions to change the ticket owner in this group/queue.' => 'Práva změnit vlastníka tiketu v této skupině/frontě',
        'PhoneView' => 'Nový tiket / hovor',
        'Please contact your admin' => 'Kontaktujte, prosím, Vašeho administrátora',
        'Print this ticket!' => 'Vytisknout tiket!',
        'Prio' => 'Priorita',
        'Problem' => 'Problém',
        'Queue <-> Auto Responses Management' => 'Fronta <-> Správa Automatických Odpovědí',
        'Queue ID' => 'ID fronty',
        'Queue Management' => 'Správa front',
        'Realname' => 'Skutečné jméno',
        'Rebuild' => 'Obnovit',
        'Recipients' => 'Adresáti',
        'Reminder' => 'Upomínka',
        'Reminder messages' => 'Upomínkové zprávy',
        'Required Field' => 'Povinné Pole',
        'Response Management' => 'Správa Reakcí',
        'Responses <-> Attachments Management' => 'Reakce <-> Správa Příloh',
        'Responses <-> Queue Management' => 'Reakce <-> Správa Front',
        'Return to the compose screen' => 'Zpět do okna vytváření',
        'Roles <-> Groups Management' => 'Role <-> Správa Skupin',
        'Roles <-> Users' => 'Role <-> Uživatelé',
        'Roles <-> Users Management' => 'Role <-> Správa Uživatelů',
        'Save Job as?' => 'Uložit Úlohu jako?',
        'Save Search-Profile as Template?' => 'Uložit profil vyhledávání jako šablonu?',
        'Schedule' => 'Plánování',
        'Search Result' => 'Výsledky vyhledávání',
        'Search for' => 'Vyhledávání',
        'Secure Mode need to be enabled!' => 'Bezpečnostní Mód musí být aktivován!',
        'Select Box' => 'Požadavek na SQL databázi',
        'Select Box Result' => 'Výsledek SQL dotazu',
        'Select Source (for add)' => 'Vybrat zdroj (pro přidání)',
        'Select the customeruser:service relations.' => 'Vybrat Uživatele Zákazníka: vazba ke službě',
        'Select the element, which will be used at the X-axis' => 'Vybrat prvek pro osu X',
        'Select the restrictions to characterise the stat' => 'Vyberte omezení pro charakteristiku Reportu',
        'Select the role:user relations.' => 'Vybrat Roli: vztahy Uživatele.',
        'Select the user:group permissions.' => 'Vybrat uživatele:práva skupiny',
        'Select your QueueView refresh time.' => 'Vyberte si dobu obnovení náhledu fronty.',
        'Select your default spelling dictionary.' => 'Výběr výchozího pravopisného slovníku',
        'Select your frontend Charset.' => 'Výběr znakové sady rozhraní.',
        'Select your frontend QueueView.' => 'Výběr náhledu fronty rozhraní.',
        'Select your frontend language.' => 'Výběr jazyka rozhraní.',
        'Select your out of office time.' => 'Nastavení času Mimo Kancelář',
        'Select your screen after creating a new ticket.' => 'Vyberte Zobrazení po vytvoření nového Tiketu.',
        'Selection needed' => 'Nutný Výběr',
        'Send Notification' => 'Odeslat Upozornění',
        'Send me a notification if a customer sends a follow up and I\'m the owner of this ticket.' =>
            'Pošli mi oznámení, pokud klient pošle následující a jsem vlastník tohoto tiketu.',
        'Send me a notification of an watched ticket like an owner of an ticket.' =>
            'Pošli mi oznámení o prohlédnutých Tiketech, jako Vlastníkovi Tiketů',
        'Send no notifications' => 'Neodesílat Notifikace',
        'Sent new password to: %s' => 'Nové heslo odesláno na: %s',
        'Sent password token to: %s' => 'Heslo Tokenu odesláno na: %s',
        'Sessions' => 'Relace',
        'Set customer user and customer id of a ticket' => 'Nastavit klienta a nastavit ID klienta tiketu',
        'Set this ticket to pending!' => 'Nastavit jako Nevyřešený',
        'Show' => 'Ukaž',
        'Shows the ticket history!' => 'Ukáže historii tiketu!',
        'Site' => 'Umístění',
        'Solution' => 'Řešení',
        'Sort by' => 'Třídit dle',
        'Source' => 'Zdroj',
        'Spell Check' => 'Kontrola pravopisu',
        'Split' => 'Rozdělit',
        'State Type' => 'Typ stavu',
        'Static-File' => 'Statický Soubor',
        'Stats-Area' => 'Oblast Reportů',
        'Sub-Queue of' => 'Podfronta ',
        'Sub-Service of' => 'Podslužba',
        'Subscribe' => 'Podepsat',
        'Symptom' => 'Příznak',
        'System History' => 'Historie Systému',
        'System State Management' => 'Správa stavu systému',
        'System Status' => 'Status Systému',
        'Systemaddress' => 'Systémová adresa',
        'Take care that you also updated the default states in you Kernel/Config.pm!' =>
            'Ujistěte se, že jste aktualizovali také výchozí hodnoty ve Vašem Kernel/Config.pm!',
        'The message being composed has been closed.  Exiting.' => 'Vytvářená zpráva byla uzavřena. Opouštím.',
        'This account exists.' => 'Tento účet existuje',
        'This window must be called from compose window' => 'Toto okno musí být vyvoláno z okna vytváření',
        'Ticket Hook' => 'Označení tiketu',
        'Ticket Lock' => 'Zámek Tiketu',
        'Ticket Number Generator' => 'Generátor čísel tiketů',
        'Ticket Search' => 'Hledání tiketu',
        'Ticket Status View' => 'Zobrazení Statutu Tiketu',
        'Ticket escalation!' => 'Eskalace tiketů',
        'Ticket locked!' => 'Tiket zamknut!',
        'Ticket owner options (e. g. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)' =>
            'Možnosti Vlastníka Tiketu (příklad: &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>)' => 'Možnosti Vlastníka Tiketu (příklad: <OTRS_OWNER_UserFirstname>)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>).' => 'Možnosti Vlastníka Tiketu (příklad <OTRS_OWNER_UserFirstname>).',
        'Ticket selected for bulk action!' => 'Tiket vybrán pro Hromadnou Akci!',
        'Ticket unlock!' => 'Tiket odemknut!',
        'Ticket-Area' => 'Oblast Tiketu',
        'TicketFreeFields' => 'Volná pole Tiketu',
        'TicketFreeText' => 'Volný text tiketu',
        'TicketID' => 'ID tiketu',
        'TicketZoom' => 'Zobrazení tiketu',
        'Tickets available' => 'Tiketů k dispozici',
        'Tickets shown' => 'Zobrazené tikety',
        'Tickets which need to be answered!' => 'Tikety na které je třeba odpovědět!',
        'Times' => 'Doba',
        'Title of the stat.' => 'Jméno Statistiky',
        'To get the article attribute (e. g. (<OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).' =>
            'Pro získání atributů článku (příklad (<OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).',
        'To get the article attribute (e. g. (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).' =>
            'Pro získání atributu článku (příklad (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).',
        'Top of Page' => 'Nahoru',
        'Total hits' => 'Celkový počet záznamů',
        'U' => 'Z-A',
        'Unable to parse Online Repository index document!' => 'Nepodařilo se zpracovat Online Repository Index',
        'Uniq' => 'Počet',
        'Unlock Tickets' => 'Odemknout Tikety',
        'Unlock to give it back to the queue!' => 'Odemknout zpět do Fronty',
        'Unsubscribe' => 'Nepodepsat',
        'Use utf-8 it your database supports it!' => 'Použijte utf-8 pokud to Vaše databáze podporuje',
        'Useable options' => 'Použitelné možnosti',
        'User Management' => 'Správa uživatelů',
        'User will be needed to handle tickets.' => 'Uživatel bude potřebovat práva pro správu tiketů.',
        'Users' => 'Uživatelé',
        'Users <-> Groups' => 'Uživatelé <-> Skupiny',
        'Users <-> Groups Management' => 'Uživatelé <-> Správa Skupin',
        'Verify New Password' => 'Potvrzení hesla',
        'Warning! This tickets will be removed from the database! This tickets are lost!' =>
            'Výstraha! Tyto Tikety budou vymazány z Databáze a budou ztraceny!',
        'Watch notification' => 'Zobrazit Oznámení',
        'Web-Installer' => 'Web-instalátor',
        'WebMail' => 'Web Mail',
        'WebWatcher' => 'Webový Prohlížeč',
        'Welcome to OTRS' => 'Vítejte v OTRS',
        'Yes means, send no agent and customer notifications on changes.' =>
            'Ne znamená: Neposlat Řešiteli a Zákazníkovi oznámení při změně',
        'Yes, save it with name' => 'Ano, uložit pod názvem',
        'You got new message!' => 'Máte novou zprávu!',
        'You have to select two or more attributes from the select field!' =>
            'Nutno zvolit dva a více atributů z výběrového pole!',
        'You need a email address (e. g. customer@example.com) in To:!' =>
            'Musíte mít  uvedenu emailovou adresu (např. klient@priklad.cz) v poli Komu:!',
        'You need min. one selected Ticket!' => 'Nutno vybrat alespoň jeden Tiket!',
        'You need to account time!' => 'Potřebujete účtovat dobu!',
        'You need to activate %s first to use it!' => '%s musí být aktivováno!',
        'Your email address is new' => 'Vaše Email adresa je nová',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Váš email s číslem ticketu "<OTRS_TICKET>" je odeslán zpět na "<OTRS_BOUNCE_TO>". Kontaktujte tuto adresu pro další infromace.',
        'Your own Ticket' => 'Váš vlastní tiket',
        'accept license' => 'souhlasím s licencí',
        'customer realname' => 'skutečné jméno klienta',
        'don\'t accept license' => 'nesouhlasím s licencí',
        'down' => 'dolů',
        'false' => 'Nepravda',
        'for agent firstname' => 'pro křestní jméno agenta',
        'for agent lastname' => 'pro příjmení agenta',
        'for agent login' => 'pro přihlášení Řešitele',
        'for agent user id' => 'pro uživatelské ID agenta',
        'kill all sessions' => 'Zrušit všechny relace',
        'kill session' => 'Ukončit Relaci',
        'modified' => 'Upraveno',
        'new ticket' => 'nový tiket',
        'next step' => 'další krok',
        'send' => 'poslat',
        'sort downward' => 'Třídit sestupně',
        'sort upward' => 'Třídit vzestupně',
        'to get the first 20 character of the subject' => 'pro získáni prvních 20 znaků z předmětu',
        'to get the first 5 lines of the email' => 'pro získání prvních 5 řádků z emailu',
        'to get the from line of the email' => 'pro získaní řádku Od z emailu',
        'to get the realname of the sender (if given)' => 'pro získaní skutečného jména odesílatele (pokud je zadáno)',
        'up' => 'nahoru',
        'x' => 'Spustit',

    };
    # $$STOP$$
    return;
}

1;
