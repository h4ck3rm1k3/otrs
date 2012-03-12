# --
# Kernel/Language/lv.pm - provides Latvian language translation
# Copyright (C) 2009 Ivars Strazdins <ivars.strazdins at gmail.com>
# --
# $Id: lv.pm,v 1.43 2012/03/01 13:25:08 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
package Kernel::Language::lv;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.43 $) [1];

sub Data {
    my $Self = shift;

    # $$START$$
    # Last translation file sync: 2012-03-01 14:20:10

    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D.%M.%Y %T';
    $Self->{DateFormatLong}      = '%T - %D.%M.%Y';
    $Self->{DateFormatShort}     = '%D.%M.%Y';
    $Self->{DateInputFormat}     = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';

    # csv separator
    $Self->{Separator} = '';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Jā',
        'No' => 'Nē',
        'yes' => 'jā',
        'no' => 'nē',
        'Off' => 'Izslēgts',
        'off' => 'izslēgts',
        'On' => 'Ieslēgts',
        'on' => 'ieslēgts',
        'top' => 'sākums',
        'end' => 'beigas',
        'Done' => 'Pabeigts',
        'Cancel' => 'Atcelt',
        'Reset' => 'Atiestatīt',
        'last' => 'pēdējais',
        'before' => 'pirms',
        'Today' => 'Šodien',
        'Tomorrow' => 'Rīt',
        'Next week' => '',
        'day' => 'diena',
        'days' => 'dienas',
        'day(s)' => 'diena(s)',
        'd' => '',
        'hour' => 'stunda',
        'hours' => 'stundas',
        'hour(s)' => 'stunda(s)',
        'Hours' => '',
        'h' => '',
        'minute' => 'minūte',
        'minutes' => 'minūtes',
        'minute(s)' => 'minūte(s)',
        'Minutes' => '',
        'm' => '',
        'month' => 'mēnesis',
        'months' => 'mēneši',
        'month(s)' => 'mēnesis(ši)',
        'week' => 'nedēļa',
        'week(s)' => 'nedēļa(s)',
        'year' => 'gads',
        'years' => 'gadi',
        'year(s)' => 'gads(i)',
        'second(s)' => 'sekunde(s)',
        'seconds' => 'sekundes',
        'second' => 'sekunde',
        's' => '',
        'wrote' => 'rakstīja',
        'Message' => 'ziņojums',
        'Error' => 'kļūda',
        'Bug Report' => 'kļūdas ziņojums',
        'Attention' => 'uzmanību',
        'Warning' => 'brīdinājums',
        'Module' => 'modulis',
        'Modulefile' => 'moduļa fails',
        'Subfunction' => 'apakšfunkcija',
        'Line' => 'līnija',
        'Setting' => 'iestatījums',
        'Settings' => 'Iestatījumi',
        'Example' => 'piemērs',
        'Examples' => 'piemēri',
        'valid' => 'derīgs',
        'Valid' => 'Vai derīgs?',
        'invalid' => 'nederīgs',
        'Invalid' => '',
        '* invalid' => '* ir nederīga',
        'invalid-temporarily' => 'īslaicīgi nederīgs',
        ' 2 minutes' => ' 2 minūtes',
        ' 5 minutes' => ' 5 minūtes',
        ' 7 minutes' => ' 7 minūtes',
        '10 minutes' => '10 minūtes',
        '15 minutes' => '15 minūtes',
        'Mr.' => 'K-gs',
        'Mrs.' => 'K-dze',
        'Next' => 'Nākamais',
        'Back' => 'Atpakaļ',
        'Next...' => 'Nākamais...',
        '...Back' => '...atpakaļ',
        '-none-' => '-nav-',
        'none' => 'nav',
        'none!' => 'nav pazīmju!',
        'none - answered' => 'neviens nav atbildējis',
        'please do not edit!' => 'lūdzu nelabot!',
        'Need Action' => '',
        'AddLink' => 'Pievienot saiti',
        'Link' => 'Saite',
        'Unlink' => 'Dzēst saiti',
        'Linked' => 'Sasaistīts',
        'Link (Normal)' => 'Saite (normāla)',
        'Link (Parent)' => 'Saite (uz sākotnējo)',
        'Link (Child)' => 'Saite (uz nākamo)',
        'Normal' => 'Normāls',
        'Parent' => 'Sākotnējais',
        'Child' => 'Nākamais',
        'Hit' => 'Trāpījums',
        'Hits' => 'Trāpījumi',
        'Text' => 'Teksts',
        'Standard' => 'Standarta',
        'Lite' => 'Vieglā',
        'User' => 'Lietotājs',
        'Username' => 'Lietotājvārds',
        'Language' => 'Valoda',
        'Languages' => 'Valodas',
        'Password' => 'Parole',
        'Preferences' => 'Iestatījumi',
        'Salutation' => 'Uzruna',
        'Salutations' => 'Uzrunas',
        'Signature' => 'Paraksts',
        'Signatures' => 'Paraksti',
        'Customer' => 'Klienti',
        'CustomerID' => 'Klienta identifikators',
        'CustomerIDs' => 'Klienta identifikatori',
        'customer' => 'Klients',
        'agent' => 'atbildīgais',
        'system' => 'sistēma',
        'Customer Info' => 'Klienta informācija',
        'Customer Information' => '',
        'Customer Company' => 'Klienta organizācija/uzņēmums',
        'Customer Companies' => '',
        'Company' => 'Organizācija/uzņēmums',
        'go!' => 'Sākt!',
        'go' => 'Sākt',
        'All' => 'Visi pieteikumi',
        'all' => 'visi pieteikumi',
        'Sorry' => 'Atvainojiet',
        'update!' => 'atjaunināšana!',
        'update' => 'atjaunināšana',
        'Update' => 'Atjaunināt',
        'Updated!' => 'Atjaunināts!',
        'submit!' => 'iesniegt!',
        'submit' => 'ieniegt',
        'Submit' => 'Iesniegt',
        'change!' => 'Mainīt!',
        'Change' => 'Mainīt',
        'change' => 'Mainīt',
        'click here' => 'klikšķināt te',
        'Comment' => 'Komentārs',
        'Invalid Option!' => 'Nederīga izvēle!',
        'Invalid time!' => 'Nederīgs laiks!',
        'Invalid date!' => 'Nederīgs datums!',
        'Name' => 'Vārds',
        'Group' => 'Grupa',
        'Description' => 'Apraksts',
        'description' => 'apraksts',
        'Theme' => 'Tēma',
        'Created' => 'Izveidots',
        'Created by' => 'Izveidojis',
        'Changed' => 'Mainīts',
        'Changed by' => 'Mainījis',
        'Search' => 'Meklēt',
        'and' => 'un',
        'between' => 'starp',
        'Fulltext Search' => 'pilna teksta meklēšana',
        'Data' => 'Datu fails',
        'Options' => 'Iestatījumi',
        'Title' => 'Virsraksts',
        'Item' => 'vienība',
        'Delete' => 'Dzēst',
        'Edit' => 'Labot',
        'View' => 'Skatīt',
        'Number' => 'Numurs',
        'System' => 'Sistēma',
        'Contact' => 'Kontaktpersona',
        'Contacts' => 'Kontaktpersonas',
        'Export' => 'Eksports',
        'Up' => 'uz augšu',
        'Down' => 'uz leju',
        'Add' => 'Pievienot',
        'Added!' => 'Pievienots!',
        'Category' => 'Kategorija',
        'Viewer' => 'Aplūkotājs',
        'Expand' => 'Izvērst',
        'Small' => '',
        'Medium' => '',
        'Large' => '',
        'Date picker' => '',
        'New message' => 'Jauni ziņojumi',
        'New message!' => 'Jauns ziņojums!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Lai varētu atgriezties uz parasto rindas apskati, lūdzu atbildiet uz šo problēmas pieteikumu!',
        'You have %s new message(s)!' => 'Jums ir %s jauns(i) ziņojums(i)!',
        'You have %s reminder ticket(s)!' => 'Jums ir %s atgādinājums(i)!',
        'The recommended charset for your language is %s!' => 'Ieteicamais simbolu kodējums izvēlētajai valodai ir %s!',
        'Change your password.' => '',
        'Please activate %s first!' => '',
        'No suggestions' => 'Nav ieteikumu',
        'Word' => 'Vārds',
        'Ignore' => 'Ignorēt',
        'replace with' => 'aizvietot ar',
        'There is no account with that login name.' => 'Nav lietāja konta ar tādu lietotāja vārdu.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            '',
        'There is no acount with that user name.' => '',
        'Please contact your administrator' => '',
        'Logout' => 'Atteikties',
        'Logout successful. Thank you for using OTRS!' => 'Atteikšanās veiksmīga! Paldies, ka izmantojāt OTRS problēmu pieteikumu sistēmu!',
        'Invalid SessionID!' => 'Nederīgs sesijas ID!',
        'Feature not active!' => 'Papildiespēja nav aktivizēta!',
        'Agent updated!' => '',
        'Create Database' => 'Izveidot datubāzi',
        'System Settings' => 'Sistēmas iestatījumi',
        'Mail Configuration' => '',
        'Finished' => 'Pabeigts(i)',
        'Install OTRS' => '',
        'Intro' => '',
        'License' => 'Licence',
        'Database' => 'Datubāze',
        'Configure Mail' => '',
        'Database deleted.' => '',
        'Database setup succesful!' => '',
        'Login is needed!' => 'Vispirms jāpiesakās sistēmā!',
        'Password is needed!' => 'Parole ir obligāta!',
        'Take this Customer' => 'Ņemt šo klientu',
        'Take this User' => 'Ņemt šo lietotāju',
        'possible' => 'iespējams',
        'reject' => 'nepieņemt',
        'reverse' => 'pretēji',
        'Facility' => 'Iespēja',
        'Time Zone' => '',
        'Pending till' => 'Neizlemts līdz',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            '',
        'Dispatching by email To: field.' => 'Pārvietot pēc Kam: lauka pazīmes e-pastā.',
        'Dispatching by selected Queue.' => 'Pārvietot uz norādīto rindu.',
        'No entry found!' => 'Nekas netika atrasts!',
        'Session has timed out. Please log in again.' => 'Sesija ir beigusies. Lūdzu, piesakieties vēlreiz.',
        'No Permission!' => 'Nav atļaujas!',
        'To: (%s) replaced with database email!' => 'Kam: (%s) tikai aizvietots ar datubāzes e-pastu!',
        'Cc: (%s) added database email!' => 'Datubāzes e-pasta adrese pievienota Kopija: (%s) laukā!',
        '(Click here to add)' => '(Klikšķiniet šeit, lai pievienotu)',
        'Preview' => 'Priekšapskate',
        'Package not correctly deployed! Please reinstall the package.' =>
            '',
        '%s is not writable!' => '',
        'Cannot create %s!' => '',
        'Check to activate this date' => '',
        'You have Out of Office enabled, would you like to disable it?' =>
            '',
        'Customer %s added' => '',
        'Role added!' => '',
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
        'Contract' => 'Kontrakts (līgums)',
        'Online Customer: %s' => 'Tiešsaistes klients: %s',
        'Online Agent: %s' => 'Tiešsaistes atbildīgā persona: %s',
        'Calendar' => 'Kalendārs',
        'File' => 'Datu fails',
        'Filename' => 'Faila (datnes) nosaukums',
        'Type' => 'Tips',
        'Size' => 'Izmērs',
        'Upload' => 'Augšupielādēt',
        'Directory' => 'Direktorija (mape)',
        'Signed' => 'Parakstīts',
        'Sign' => 'Parakstīt',
        'Crypted' => 'Šifrēts',
        'Crypt' => 'Šifrēt',
        'PGP' => '',
        'PGP Key' => '',
        'PGP Keys' => '',
        'S/MIME' => '',
        'S/MIME Certificate' => '',
        'S/MIME Certificates' => '',
        'Office' => 'Birojs',
        'Phone' => 'Telefons',
        'Fax' => 'Fakss',
        'Mobile' => 'Mobilais telefons',
        'Zip' => 'Pasta indekss',
        'City' => 'Pilsēta',
        'Street' => 'Iela',
        'Country' => 'Valsts',
        'Location' => 'Vieta',
        'installed' => 'instalēts',
        'uninstalled' => 'nav instalēts',
        'Security Note: You should activate %s because application is already running!' =>
            'Drošības piezīme: jums vajadzētu aktivizēt %s, jo programma jau darbojas!',
        'Unable to parse repository index document.' => '',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            '',
        'No packages, or no new packages, found in selected repository.' =>
            '',
        'Edit the system configuration settings.' => '',
        'printed at' => 'izdrukāts',
        'Loading...' => '',
        'Dear Mr. %s,' => 'Cien. %s k-gs,',
        'Dear Mrs. %s,' => 'Cien. %s k-dze,',
        'Dear %s,' => 'Cien. %s,',
        'Hello %s,' => 'Labdien %s,',
        'This email address already exists. Please log in or reset your password.' =>
            '',
        'New account created. Sent login information to %s. Please check your email.' =>
            '',
        'Please press Back and try again.' => 'Lūdzu, klikšķiniet uz Atpakaļ un mēģiniet vēlreiz.',
        'Sent password reset instructions. Please check your email.' => '',
        'Sent new password to %s. Please check your email.' => '',
        'Upcoming Events' => 'Nākamie notikumi',
        'Event' => 'Notikums',
        'Events' => 'Notikumi',
        'Invalid Token!' => 'Nederīga piekļuves pilnvara!',
        'more' => 'vēl',
        'For more info see:' => 'Papildus informācijai, lūdzu, skatīt:',
        'Package verification failed!' => 'Pākotnes pārbaude neizdevās!',
        'Collapse' => 'Sašaurināt',
        'Shown' => '',
        'News' => 'Jaunumi',
        'Product News' => 'Izstrādes jaunumi',
        'OTRS News' => 'OTRS jaunumi',
        '7 Day Stats' => '7 dienu statistika',
        'Bold' => 'Treknraksts',
        'Italic' => 'Kursīvs',
        'Underline' => 'Pasvītrots',
        'Font Color' => 'Fonta krāsa',
        'Background Color' => 'Fona krāsa',
        'Remove Formatting' => 'Novākt formātējumu',
        'Show/Hide Hidden Elements' => 'Rādīt/Slēpt slēptos teksta elementus',
        'Align Left' => 'Kārtot pa kreisi',
        'Align Center' => 'Centrēt',
        'Align Right' => 'Kārtot pa labi',
        'Justify' => 'Izlīdzināt',
        'Header' => 'Galvene',
        'Indent' => 'Atkāpe',
        'Outdent' => 'Pretējā atkāpe',
        'Create an Unordered List' => 'Izveidot nesakārtotu sarakstu',
        'Create an Ordered List' => 'Izveidot sakārtotu sarakstu',
        'HTML Link' => 'HTML hipersaite',
        'Insert Image' => 'Ievietot attēlu',
        'CTRL' => 'CTRL',
        'SHIFT' => 'SHIFT',
        'Undo' => 'atcelt',
        'Redo' => 'atjaunot',
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
        'Jan' => 'Jan',
        'Feb' => 'Feb',
        'Mar' => 'Mar',
        'Apr' => 'Apr',
        'May' => 'Mai',
        'Jun' => 'Jūn',
        'Jul' => 'Jūl',
        'Aug' => 'Aug',
        'Sep' => 'Sep',
        'Oct' => 'Okt',
        'Nov' => 'Nov',
        'Dec' => 'Dec',
        'January' => 'Janvāris',
        'February' => 'Februāris',
        'March' => 'Marts',
        'April' => 'Aprīlis',
        'May_long' => 'Maijs',
        'June' => 'Jūnijs',
        'July' => 'Jūlijs',
        'August' => 'Augusts',
        'September' => 'Septembris',
        'October' => 'Oktobris',
        'November' => 'Novembris',
        'December' => 'Decembris',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'Iestatījumi sekmīgi atjaunoti!',
        'User Profile' => '',
        'Email Settings' => '',
        'Other Settings' => '',
        'Change Password' => 'Paroles maiņa',
        'Current password' => '',
        'New password' => 'Jaunā parole',
        'Verify password' => '',
        'Spelling Dictionary' => 'Pareizrakstības vārdnīca',
        'Default spelling dictionary' => '',
        'Max. shown Tickets a page in Overview.' => 'Maksimālais problēmu pieteikumu skaits pārskata lapā.',
        'The current password is not correct. Please try again!' => '',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            '',
        'Can\'t update password, it contains invalid characters!' => '',
        'Can\'t update password, it must be at least %s characters long!' =>
            '',
        'Can\'t update password, it must contain at least 2 lowercase  and 2 uppercase characters!' =>
            '',
        'Can\'t update password, it must contain at least 1 digit!' => '',
        'Can\'t update password, it must contain at least 2 characters!' =>
            '',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            '',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            '',
        'CSV Separator' => '',

        # Template: AAAStats
        'Stat' => 'Statistika',
        'Sum' => '',
        'Please fill out the required fields!' => 'Lūdzu, aizpildiet obligātos laukus!',
        'Please select a file!' => 'Lūdzu, izvēlieties failu (datni)!',
        'Please select an object!' => 'Lūdzu, izvēlieties objektu!',
        'Please select a graph size!' => 'Lūdzu, izvēlieties diagrammas izmēru!',
        'Please select one element for the X-axis!' => 'Lūdzu, izvēlieties vienu elementu X-asij!',
        'Please select only one element or turn off the button \'Fixed\' where the select field is marked!' =>
            'Lūdzu, izvēlieties tikai vienu elementu vai arī atiestatiet \'Fixed\' pogu pie iezīmētā lauka!',
        'If you use a checkbox you have to select some attributes of the select field!' =>
            'Ja lietojiet izvēles rūtiņu, tad iezīmētajam laukam jāizvēlas daži atribūti!',
        'Please insert a value in the selected input field or turn off the \'Fixed\' checkbox!' =>
            'Lūdzu ievadiet vērtību iezīmētajā laukā vai atstatiet \'Fixed\' izvēles rūtiņu!',
        'The selected end time is before the start time!' => 'Izvēlētais beigu laiks ir pirms sākuma laika!',
        'You have to select one or more attributes from the select field!' =>
            'Jums jāizvēlas viena vai vairākas vērtības no izvēles lauka!',
        'The selected Date isn\'t valid!' => 'Izvēlētais datums nav derīgs!',
        'Please select only one or two elements via the checkbox!' => 'Lūdzu izvēles rūtiņā izvēlieties tikai vienu vai divus elementus!',
        'If you use a time scale element you can only select one element!' =>
            'Lietojot laika mērogu, iespējams izvēlēties tikai vienu elementu!',
        'You have an error in your time selection!' => 'Izvēlētais laiks ir kļūdains!',
        'Your reporting time interval is too small, please use a larger time scale!' =>
            'Atskaites laika intervāls ir pārāks mazs, lūdzu, izvēlieties lielāku laika mērogu!',
        'The selected start time is before the allowed start time!' => 'Izvēlētais sākuma laiks ir pirms atļautā sākuma laika!',
        'The selected end time is after the allowed end time!' => 'Izvēlētais beigu laiks ir pēc atļautā beigu laika!',
        'The selected time period is larger than the allowed time period!' =>
            'Izvēlētais laika periods ir lielāks nekā atļautais periods!',
        'Common Specification' => 'Vispārīgā specifikācija',
        'X-axis' => 'X-ass',
        'Value Series' => 'Vērtības',
        'Restrictions' => 'Ierobežojumi',
        'graph-lines' => 'līniju diagramma',
        'graph-bars' => 'joslu diagramma',
        'graph-hbars' => 'horizontālo joslu diagramma',
        'graph-points' => 'punktu diagramma',
        'graph-lines-points' => 'punktu un līniju diagramma',
        'graph-area' => 'laukumu diagramma',
        'graph-pie' => 'sektoru diagramma',
        'extended' => 'paplašinātā',
        'Agent/Owner' => 'Aģents/Īpašnieks',
        'Created by Agent/Owner' => 'Izveidojis Aģents/Īpašnieks',
        'Created Priority' => 'Izveidotā prioritāte',
        'Created State' => 'Izveidotais statuss',
        'Create Time' => 'Izveidošanas laiks',
        'CustomerUserLogin' => 'Klienta lietotājvārds',
        'Close Time' => 'Aizvēršanas laiks',
        'TicketAccumulation' => 'Pieteikumu uzkrāšana',
        'Attributes to be printed' => 'Drukājamie atribūti',
        'Sort sequence' => 'kārtošanas secība',
        'Order by' => 'Kārtot pēc',
        'Limit' => 'Limits',
        'Ticketlist' => 'Pieteikumu saraksts',
        'ascending' => 'pieaugoša',
        'descending' => 'dilstoša',
        'First Lock' => 'Pirmo reizi aizslēgts',
        'Evaluation by' => 'Izvērtējis',
        'Total Time' => 'Kopējais laiks',
        'Ticket Average' => 'Vidējais pieteikuma ilgums',
        'Ticket Min Time' => 'Minimālais pieteikuma ilgums',
        'Ticket Max Time' => 'Maksimālais pieteikuma ilgums',
        'Number of Tickets' => 'Pieteikumu skaits',
        'Article Average' => 'Vidējais pieteikuma ilgums',
        'Article Min Time' => 'Minimālais pieteikuma ilgums',
        'Article Max Time' => 'Maksimālais pieteikuma ilgums',
        'Number of Articles' => 'Pieteikumu skaits',
        'Accounted time by Agent' => 'Uzskaitītais laiks aģentam',
        'Ticket/Article Accounted Time' => 'Uzskaitītais laiks pieteikumam/ziņojumam',
        'TicketAccountedTime' => 'Pieteikumu uzskaitītais laiks',
        'Ticket Create Time' => 'Pieteikuma izveidošanas laiks',
        'Ticket Close Time' => 'Pieteikuma aizvēršanas laiks',

        # Template: AAATicket
        'Status View' => '',
        'Bulk' => '',
        'Lock' => 'Aizslēgt',
        'Unlock' => 'Atslēgt',
        'History' => 'Vēsture',
        'Zoom' => 'Atvērt vaļā',
        'Age' => 'Atvērts jau',
        'Bounce' => 'Pārcelt',
        'Forward' => 'Pārsūtīt',
        'From' => 'No',
        'To' => 'Kam',
        'Cc' => 'Kopija',
        'Bcc' => 'Diskrētā kopija',
        'Subject' => 'Tēma',
        'Move' => 'Pārvietot',
        'Queue' => 'Rinda',
        'Queues' => 'Rindas',
        'Priority' => 'Prioritāte',
        'Priorities' => '',
        'Priority Update' => 'Prioritāte mainīta',
        'Priority added!' => '',
        'Priority updated!' => '',
        'Signature added!' => '',
        'Signature updated!' => '',
        'SLA' => 'Servisa līmeņa līgums',
        'Service Level Agreement' => '',
        'Service Level Agreements' => '',
        'Service' => 'Servisi',
        'Services' => '',
        'State' => 'Statuss',
        'States' => '',
        'Status' => 'Statuss',
        'Statuses' => '',
        'Ticket Type' => '',
        'Ticket Types' => '',
        'Compose' => 'Izveidot',
        'Pending' => 'Neizlemts',
        'Owner' => 'Īpašnieks',
        'Owner Update' => 'Īpašnieks mainīts',
        'Responsible' => 'Atbildīgais',
        'Responsible Update' => 'Atbildīgais mainīts',
        'Sender' => 'Nosūtītājs',
        'Article' => 'Ziņojums',
        'Ticket' => 'Pieteikumi',
        'Createtime' => 'Izveidošanas laiks',
        'plain' => 'vienkāršs teksts',
        'Email' => 'E-pasts',
        'email' => 'e-pasts',
        'Close' => 'Aizvērt',
        'Action' => 'Darbība',
        'Attachment' => 'Pielikums',
        'Attachments' => 'Pielikumi',
        'This message was written in a character set other than your own.' =>
            'Šis ziņojums ir rakstīts citā rakstzīmju kodējumā nekā pašlaik izmantotais.',
        'If it is not displayed correctly,' => 'Ja tas netiek parādīts pareizi,',
        'This is a' => 'Tas ir',
        'to open it in a new window.' => 'lai atvērtu jaunā logā',
        'This is a HTML email. Click here to show it.' => 'Šis ir HTML e-pasts. Klikšķiniet šeit, lai atvērtu to jaunā pārlūkprogrammas logā.',
        'Free Fields' => 'Neaizpildītie lauki',
        'Merge' => 'Apvienot',
        'merged' => 'apvienotie',
        'closed successful' => 'aizvērta, atrisināta',
        'closed unsuccessful' => 'aizvērta, neatrisināta',
        'Locked Tickets Total' => '',
        'Locked Tickets Reminder Reached' => '',
        'Locked Tickets New' => '',
        'Responsible Tickets Total' => '',
        'Responsible Tickets New' => '',
        'Responsible Tickets Reminder Reached' => '',
        'Watched Tickets Total' => '',
        'Watched Tickets New' => '',
        'Watched Tickets Reminder Reached' => '',
        'All tickets' => 'Visi pieteikumi',
        'Available tickets' => '',
        'Escalation' => 'Eskalācija',
        'last-search' => '',
        'QueueView' => 'Rindas skats',
        'Ticket Escalation View' => 'Pieteikumu eskalācijas skats',
        'Message from' => '',
        'End message' => '',
        'Forwarded message from' => '',
        'End forwarded message' => '',
        'new' => 'jauna',
        'open' => 'atvērta',
        'Open' => 'Atvērta',
        'Open tickets' => '',
        'closed' => 'aizvērta',
        'Closed' => 'Aizvērta',
        'Closed tickets' => '',
        'removed' => 'aizvākta',
        'pending reminder' => 'neizlemts - gaida atgādinājumu',
        'pending auto' => 'gaida automātisku darbību',
        'pending auto close+' => 'gaida automātisku aizvēršanu+',
        'pending auto close-' => 'gaida automātisku aizvēršanu-',
        'email-external' => 'ārējs e-pasts',
        'email-internal' => 'iekšējs e-pasts',
        'note-external' => 'ārēja piezīme',
        'note-internal' => 'iekšēja piezīme',
        'note-report' => 'piezīmju pārskats',
        'phone' => 'telefona zvans',
        'sms' => 'sms',
        'webrequest' => 'no pārlūkprogrammas veidots pieteikums',
        'lock' => 'aizslēgt',
        'unlock' => 'atslēgt',
        'very low' => 'ļoti zema',
        'low' => 'zema',
        'normal' => 'normāla',
        'high' => 'augsta',
        'very high' => 'ļoti augsta',
        '1 very low' => '1 ļoti zema',
        '2 low' => '2 zema',
        '3 normal' => '3 normāla',
        '4 high' => '4 augsta',
        '5 very high' => '5 ļoti augsta',
        'auto follow up' => '',
        'auto reject' => '',
        'auto remove' => '',
        'auto reply' => '',
        'auto reply/new ticket' => '',
        'Ticket "%s" created!' => 'Problēmas pieteikums "%s" izveidots!',
        'Ticket Number' => 'Pieteikuma numurs',
        'Ticket Object' => 'Pieteikuma objekts (?)',
        'No such Ticket Number "%s"! Can\'t link it!' => 'Nevar atrast šādu problēmas pieteikuma numuru "%s"! Nav iespējams to piesaistīt!',
        'You don\'t have write access to this ticket.' => '',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            '',
        'Ticket selected.' => '',
        'Ticket is locked by another agent.' => '',
        'Ticket locked.' => '',
        'Don\'t show closed Tickets' => 'Nerādīt atvērtos problēmu pieteikumus',
        'Show closed Tickets' => 'Rādīt atvērtos problēmu pieteikumus',
        'New Article' => 'Jauns ziņojums',
        'Unread article(s) available' => '',
        'Remove from list of watched tickets' => '',
        'Add to list of watched tickets' => '',
        'Email-Ticket' => 'Pieteikums ar e-pastu',
        'Create new Email Ticket' => 'Izveidot jaunu problēmas pieteikumu ar e-pastu',
        'Phone-Ticket' => 'Telefonisks pieteikums',
        'Search Tickets' => 'Meklēt pieteikumos',
        'Edit Customer Users' => 'Labot klientu datus',
        'Edit Customer Company' => 'Labot klientu organizāciju/uzņēmumu datus',
        'Bulk Action' => '',
        'Bulk Actions on Tickets' => 'Veikt darbības ar vairākiem pieteikumiem uzreiz',
        'Send Email and create a new Ticket' => 'Nosūtīt e-pastu un izveidot jaunu problēmas pieteikumu',
        'Create new Email Ticket and send this out (Outbound)' => 'Izveidot jaunu problēmas pieteikumu ar e-pastu un to izsūtīt (izejošs)',
        'Create new Phone Ticket (Inbound)' => 'Izveidot jaunu telefonisku problēmas pieteikumu (ienākošs)',
        'Overview of all open Tickets' => 'Pārskats par visiem atvērtajiem problēmu pieteikumiem',
        'Locked Tickets' => 'Aizslēgtie pieteikumi',
        'My Locked Tickets' => '',
        'My Watched Tickets' => '',
        'My Responsible Tickets' => '',
        'Watched Tickets' => 'Vērotie pieteikumi',
        'Watched' => 'Vērots',
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
        'Change the ticket free fields!' => 'Mainīt pieteikuma neaizpildītos laukus',
        'Link this ticket to other objects' => '',
        'Change the owner for this ticket' => '',
        'Change the  customer for this ticket' => '',
        'Add a note to this ticket' => '',
        'Merge into a different ticket' => '',
        'Set this ticket to pending' => '',
        'Close this ticket' => '',
        'Look into a ticket!' => 'Apskatīt pieteikumu!',
        'Delete this ticket' => '',
        'Mark as Spam!' => 'Iezīmēt kā mēstuli (spamu)!',
        'My Queues' => 'Manas rindas',
        'Shown Tickets' => 'Parādītie pieteikumi',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Jūsu e-pasts ar pieteikuma numuru "<OTRS_TICKET>" ir apvienots ar pieteikumu nr. "<OTRS_MERGE_TO_TICKET>"!',
        'Ticket %s: first response time is over (%s)!' => 'Pieteikums %s: reakcijas laiks ir lielāks par (%s)!',
        'Ticket %s: first response time will be over in %s!' => 'Pieteikums %s: reakcijas laiks beigsies %s!',
        'Ticket %s: update time is over (%s)!' => 'Pieteikums %s: atjaunošanas (labošanas) laiks ir lielāks par (%s)!',
        'Ticket %s: update time will be over in %s!' => 'Pieteikums %s: atjaunošanas (labošanas) laiks beigsies %s!',
        'Ticket %s: solution time is over (%s)!' => 'Pieteikums %s: atrisināšanas laiks ir lielāks par (%s)!',
        'Ticket %s: solution time will be over in %s!' => 'Pieteikums %s: atrisināšanas laiks beigsies %s!',
        'There are more escalated tickets!' => 'Ir vēl citi problēmu pieteikumi ar paaugstinātu svarīgumu (?)!',
        'Plain Format' => '',
        'Reply All' => '',
        'Direction' => '',
        'Agent (All with write permissions)' => '',
        'Agent (Owner)' => '',
        'Agent (Responsible)' => '',
        'New ticket notification' => 'Jauna pieteikuma paziņojums',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Sūtīt man paziņojumu ja manās rindās parādās jauns pieteikums.',
        'Send new ticket notifications' => '',
        'Ticket follow up notification' => '',
        'Ticket lock timeout notification' => 'Pieteikuma slēgšanas noilguma paziņojums',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Sūtīt man paziņojumu, ja sistēma ir atslēgusi pieteikumu.',
        'Send ticket lock timeout notifications' => '',
        'Ticket move notification' => '',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Nosūtīt man paziņojumu, ja pieteikums pārvietots uz kādu no "Manām rindām".',
        'Send ticket move notifications' => '',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            '',
        'Custom Queue' => 'Pielāgota rinda',
        'QueueView refresh time' => 'Rindas skata atjaunināšanas laiks',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            '',
        'Refresh QueueView after' => '',
        'Screen after new ticket' => 'Ekrāns pēc jauna pieteikuma izveidošanas',
        'Show this screen after I created a new ticket' => '',
        'Closed Tickets' => 'Aizvērtie pieteikumi',
        'Show closed tickets.' => 'Rādīt aizvērtos pieteikumus.',
        'Max. shown Tickets a page in QueueView.' => 'Maksimālais parādīto pieteikumu skaits rindas skatā (pieteikumu sarakstā).',
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
        'New Ticket' => 'Jaunie pieteikumi',
        'Create new Ticket' => 'Izveidot jaunu pieteikumu',
        'Customer called' => 'Klienta zvans',
        'phone call' => 'telefona zvans',
        'Phone Call Outbound' => '',
        'Phone Call Inbound' => '',
        'Reminder Reached' => 'Sasniegts atgādinājuma laiks',
        'Reminder Tickets' => 'Pieteikumi ar atgādinājumiem',
        'Escalated Tickets' => 'Eskalētie pieteikumi',
        'New Tickets' => 'Jaunie pieteikumi',
        'Open Tickets / Need to be answered' => 'Atvētie pieteikumi/nepieciešama atbilde',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            '',
        'All new tickets, these tickets have not been worked on yet' => '',
        'All escalated tickets' => '',
        'All tickets with a reminder set where the reminder date has been reached' =>
            '',
        'Archived tickets' => '',
        'Unarchived tickets' => '',
        'History::Move' => 'Problēmas pieteikums ievietots rindā "%s" (%s) pārceļot no rindas "%s" (%s).',
        'History::TypeUpdate' => 'Tips mainīts uz %s (ID=%s).',
        'History::ServiceUpdate' => 'Serviss mainīts uz%s (ID=%s).',
        'History::SLAUpdate' => 'SLA mainīts uz %s (ID=%s).',
        'History::NewTicket' => 'Izveidots jauns problēmas pieteikums [%s] (Q=%s;P=%s;S=%s).',
        'History::FollowUp' => 'Sekošana pieteikumam [%s]. %s',
        'History::SendAutoReject' => 'Uz "%s" nosūtīts automātisks problēmas pieteikuma noraidījums.',
        'History::SendAutoReply' => 'Uz "%s" nosūtīta automātiska atbilde.',
        'History::SendAutoFollowUp' => 'Uz "%s" nosūtīta automātiska sekošanas atbilde.',
        'History::Forward' => 'Pārsūtīts uz "%s".',
        'History::Bounce' => 'Ziņojums pārcelts pie "%s".',
        'History::SendAnswer' => 'Uz "%s" nosūtīts e-pasts.',
        'History::SendAgentNotification' => '"%s"-paziņojums nosūtīts uz "%s".',
        'History::SendCustomerNotification' => 'Uz "%s" nosūtīts paziņojums.',
        'History::EmailAgent' => 'Klientam nosūtīts e-pasts.',
        'History::EmailCustomer' => 'E-pasts pievienots. %s',
        'History::PhoneCallAgent' => 'Darbinieka zvans klientam.',
        'History::PhoneCallCustomer' => 'Klienta zvans mums.',
        'History::AddNote' => 'Pievienota piezīme (%s)',
        'History::Lock' => 'Problēmas pieteikums aizslēgts.',
        'History::Unlock' => 'Problēmas pieteikums atslēgts.',
        'History::TimeAccounting' => 'Uzskaitītas %s laika vienība(s). Tagad kopējais laiks ir %s laika vienība(s).',
        'History::Remove' => '%s dzēsts.',
        'History::CustomerUpdate' => 'Labots: %s',
        'History::PriorityUpdate' => 'Prioritāte mainīta no "%s" (%s) uz "%s" (%s).',
        'History::OwnerUpdate' => 'Jaunais atbildīgas par problēmu ir "%s" (ID=%s).',
        'History::LoopProtection' => 'Cilpas aizsardzība! Automātiska atbilde uz "%s" nav nosūtīta.',
        'History::Misc' => '%s',
        'History::SetPendingTime' => 'Neizlemts līdz: %s',
        'History::StateUpdate' => 'Vecais: "%s" Jaunais: "%s"',
        'History::TicketDynamicFieldUpdate' => 'Labots: %s=%s;%s=%s;',
        'History::WebRequestCustomer' => 'Klienta pieprasījums no pārlūkprogrammas.',
        'History::TicketLinkAdd' => 'Pievienota saite uz problēmas ziņojumu "%s".',
        'History::TicketLinkDelete' => 'Dzēsta saite uz problēmas ziņojumu "%s".',
        'History::Subscribe' => 'Pievienota sekošana lietotājam "%s".',
        'History::Unsubscribe' => 'Noņemta sekošana lietotājam "%s".',
        'History::SystemRequest' => 'Sistēmas pieprasījums (%s).',
        'History::ResponsibleUpdate' => '',
        'History::ArchiveFlagUpdate' => '',

        # Template: AAAWeekDay
        'Sun' => 'Sv',
        'Mon' => 'Pi',
        'Tue' => 'Ot',
        'Wed' => 'Tr',
        'Thu' => 'Ce',
        'Fri' => 'Pk',
        'Sat' => 'Se',

        # Template: AdminAttachment
        'Attachment Management' => 'Pielikumu pārvaldība',
        'Actions' => '',
        'Go to overview' => '',
        'Add attachment' => '',
        'List' => 'Saraksts',
        'Validity' => '',
        'No data found.' => '',
        'Download file' => '',
        'Delete this attachment' => '',
        'Add Attachment' => '',
        'Edit Attachment' => '',
        'This field is required.' => '',
        'or' => 'vai',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Automātisko atbilžu pārvaldība',
        'Add auto response' => '',
        'Add Auto Response' => '',
        'Edit Auto Response' => '',
        'Response' => 'Atbilde',
        'Auto response from' => '',
        'Reference' => 'Atsauce (en)',
        'You can use the following tags' => '',
        'To get the first 20 character of the subject.' => 'Lai saņemtu pirmās 20 rakstzīmes no pieteikuma tēmas',
        'To get the first 5 lines of the email.' => 'Lai saņemtu pirmās 5 rindiņas no e-pasta',
        'To get the realname of the sender (if given).' => 'Lai saņemtu nosūtītāja īsto vārdu (ja norādīts).',
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
        'Customer Company Management' => 'Klienta organizāciju/uzņēmumu datu pārvaldība',
        'Wildcards like \'*\' are allowed.' => '',
        'Add customer company' => '',
        'Please enter a search term to look for customer companies.' => '',
        'Add Customer Company' => 'Pievienot klienta organizāciju/uzņēmumu',

        # Template: AdminCustomerUser
        'Customer Management' => '',
        'Add customer' => '',
        'Select' => 'Paņemt',
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
        'This feature is disabled!' => 'Šī iespēja ir atiestatīta!',
        'Just use this feature if you want to define group permissions for customers.' =>
            '',
        'Enable it here!' => 'Aktivizēt šeit!',
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
        'Groups' => 'Grupas',
        'No matches found.' => '',
        'Change Group Relations for Customer' => '',
        'Change Customer Relations for Group' => '',
        'Toggle %s Permission for all' => '',
        'Toggle %s permission for %s' => '',
        'Customer Default Groups:' => '',
        'No changes can be made to these groups.' => '',
        'ro' => 'lasīt',
        'Read only access to the ticket in this group/queue.' => 'Tikai pieteikumu lasīšanas tiesības šajā grupā/rindā.',
        'rw' => 'rakstīt',
        'Full read and write access to the tickets in this group/queue.' =>
            'Visas lasīšanas un rakstīšanas tiesības šajā grupā/rindā.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => '',
        'Edit default services' => '',
        'Filter for Services' => '',
        'Allocate Services to Customer' => '',
        'Allocate Customers to Service' => '',
        'Toggle active state for all' => '',
        'Active' => 'Aktīvs',
        'Toggle active state for %s' => '',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => '',
        'Add new field for object' => '',
        'To add a new field, select the field type form one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            '',
        'Dynamic Fields List' => '',
        'Dynamic fields per page' => '',
        'Label' => '',
        'Order' => 'Kārtība',
        'Object' => 'Objekts',

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
        'Save' => 'Saglabāt',

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
        'Key' => 'Atslēga',
        'Value' => 'Vērtība',
        'Remove value' => '',
        'Add value' => '',
        'Add Value' => '',
        'Add empty value' => '',
        'Activate this option to create an empty selectable value.' => '',
        'Translatable values' => '',
        'If you activate this option the values will be translated to the user defined language.' =>
            '',
        'Note' => 'Piezīme(s)',
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
        'Admin Notification' => 'Administratora paziņojumi',
        'With this module, administrators can send messages to agents, group or role members.' =>
            '',
        'Create Administrative Message' => '',
        'Your message was sent to' => '',
        'Send message to users' => '',
        'Send message to group members' => '',
        'Group members need to have permission' => '',
        'Send message to role members' => '',
        'Also send to customers in groups' => '',
        'Body' => 'Saturs',
        'Send' => 'Nosūtīt',

        # Template: AdminGenericAgent
        'Generic Agent' => '',
        'Add job' => '',
        'Last run' => 'Pēdējo reizi izpildīts',
        'Run Now!' => 'Izpildīt tagad!',
        'Delete this task' => '',
        'Run this task' => '',
        'Job Settings' => '',
        'Job name' => '',
        'Currently this generic agent job will not run automatically.' =>
            'Pašlaik šis vispārīgais aģenta uzdevums neizpildīsies automātiski.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Lai iestatītu automātisku izpildi, izvēlieties vismaz vienu vērtību no minūtēm, stundām un dienām!',
        'Schedule minutes' => '',
        'Schedule hours' => '',
        'Schedule days' => '',
        'Toggle this widget' => '',
        'Ticket Filter' => '',
        '(e. g. 10*5155 or 105658*)' => 'piem. 10*5144 vai 105658*',
        '(e. g. 234321)' => 'piem. 234321',
        'Customer login' => '',
        '(e. g. U5150)' => 'piem. U5150',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => '',
        'Agent' => 'Aģents (pieteikumu apstrādātājs)',
        'Ticket lock' => '',
        'Create times' => '',
        'No create time settings.' => 'Nav izveidošanas laika iestatījumu',
        'Ticket created' => 'Pieteikums izveidots',
        'Ticket created between' => 'Pieteikums izveidots starp',
        'Change times' => '',
        'No change time settings.' => 'Nemainīt laika iestatījumus',
        'Ticket changed' => 'Pieteikums izmainīts',
        'Ticket changed between' => 'Pieteikums izmainīts starp',
        'Close times' => '',
        'No close time settings.' => 'Nav aizvēršanas laika iestatījumu',
        'Ticket closed' => 'Pieteikums aizvērts',
        'Ticket closed between' => 'Pieteikums aizvērts starp ',
        'Pending times' => '',
        'No pending time settings.' => 'Nav izlemšanas laika iestatījumu',
        'Ticket pending time reached' => 'Pienācis pieteikuma izlemšanas laiks',
        'Ticket pending time reached between' => 'Pieteikuma izlemšanas laiks sasniegts starp',
        'Escalation times' => '',
        'No escalation time settings.' => 'Eskalācijas laiki nav iestatīti.',
        'Ticket escalation time reached' => 'Pienācis pieteikuma eskalācijas laiks',
        'Ticket escalation time reached between' => 'Pieteikuma eskalācijas laiks pienācis starp',
        'Escalation - first response time' => '',
        'Ticket first response time reached' => 'Pienācis pieteikuma pirmās atbildes laiks',
        'Ticket first response time reached between' => 'Pieteikuma pirmās atbildes laiks pienācis starp',
        'Escalation - update time' => '',
        'Ticket update time reached' => 'Pienācis pieteikuma atjaunošanas laiks',
        'Ticket update time reached between' => 'Pieteikuma atjaunošanas laiks pienācis starp',
        'Escalation - solution time' => '',
        'Ticket solution time reached' => 'Pienācis pieteikuma atrisināšanas laiks',
        'Ticket solution time reached between' => 'Pieteikuma atrisināšanas laiks pienācis starp',
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
        'Add Note' => 'Pievienot piezīmi',
        'Time units' => 'Laika vienības',
        ' (work units)' => ' (darba laika vienības)',
        'Ticket Commands' => '',
        'Send agent/customer notifications on changes' => 'Izmaiņu gadījumā nosūtīt paziņojumus aģentam/klientam',
        'CMD' => 'Komanda',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Šī komanda tiks izpildīta. ARG[0] būs pieteikuma numurs un ARG[1] būs pieteikuma identifikators (ID).',
        'Delete tickets' => 'Dzēst pieteikumus',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            '',
        'Execute Custom Module' => '',
        'Param %s key' => '',
        'Param %s value' => '',
        'Save Changes' => '',
        'Results' => 'Rezultāti',
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
        'Time' => 'Laiks',
        'Remote IP' => '',
        'Loading' => '',
        'Select a single request to see its details.' => '',
        'Filter by type' => '',
        'Filter from' => '',
        'Filter to' => '',
        'Filter by remote IP' => '',
        'Refresh' => 'Atjaunot',
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
        'Import' => 'Importēt',
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
        'Version' => 'Versija',
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
            'BRĪDINĀJUMS! Ja pirms grupas \'admin\' pārdēvēšanas citā vārdā netiks izdarītas izmaiņas sistēmas konfigurācijā, nebūs iespējams pieteikties administrēšanas sadaļā! Ja tā ir gadījies, pārdēvējiet grupu atpakaļ par admin ar SQL teikuma palidzību.',
        'Group Management' => 'Grupu pārvaldība',
        'Add group' => '',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            '\'admin\' grupa domāta lai darbotos administrēšanas sadaļā un \'stats\' grupa lai darbotos statistikas sadaļā.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            '',
        'It\'s useful for ASP solutions. ' => '',
        'Add Group' => 'Pievienot grupu',
        'Edit Group' => '',

        # Template: AdminLog
        'System Log' => 'Sistēmas žurnāls',
        'Here you will find log information about your system.' => '',
        'Hide this message' => '',
        'Recent Log Entries' => '',

        # Template: AdminMailAccount
        'Mail Account Management' => 'Pasta kontu pārvaldība',
        'Add mail account' => '',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Visi ienākošie e-pasta ziņojumi ar vienu un to pašu lietotāja kontu tiks pārsūtīti uz norādīto rindu!',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Ja jūsu konts ir uzticams, tad prioritātēm un citur tiks izmantoti jau ziņojuma pienākšanas laikā eksistējošie X-OTRS hederi (galvenes). Neatkarīgi no tā tiks izmantots arī Postmaster filtrs.',
        'Host' => 'Resursdators',
        'Delete account' => '',
        'Fetch mail' => '',
        'Add Mail Account' => '',
        'Example: mail.example.com' => '',
        'IMAP Folder' => '',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            '',
        'Trusted' => 'Uzticams',
        'Dispatching' => 'Nosūtīšana',
        'Edit Mail Account' => '',

        # Template: AdminNavigationBar
        'Admin' => 'Administrēšana',
        'Agent Management' => '',
        'Queue Settings' => '',
        'Ticket Settings' => '',
        'System Administration' => '',

        # Template: AdminNotification
        'Notification Management' => 'Paziņojumu pārvaldība',
        'Select a different language' => '',
        'Filter for Notification' => '',
        'Notifications are sent to an agent or a customer.' => 'Paziņojumi tiek nosūtīti aģentam vai klientam.',
        'Notification' => 'Paziņojumi',
        'Edit Notification' => '',
        'e. g.' => '',
        'Options of the current customer data' => '',

        # Template: AdminNotificationEvent
        'Add notification' => '',
        'Delete this notification' => '',
        'Add Notification' => 'Pievienot paziņojumu',
        'Recipient groups' => '',
        'Recipient agents' => '',
        'Recipient roles' => '',
        'Recipient email addresses' => '',
        'Article type' => 'Ziņojuma tips',
        'Only for ArticleCreate event' => '',
        'Subject match' => 'Sakrīt tēma',
        'Body match' => 'Sakrīt saturs',
        'Include attachments to notification' => '',
        'Notification article type' => '',
        'Only for notifications to specified email addresses' => '',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Lai saņemtu pirmās 20 rakstzīmes no tēmas (no pēdējā aģenta ziņojuma)',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Lai saņemtu pirmās 5 satura rindas (no pēdējā aģenta ziņojuma)',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Lai saņemtu pirmās 20 rakstzīmes no tēmas (no pēdējā klienta ziņojuma).',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Lai saņemtu pirmās 5 satura rindas (no pēdējā klienta ziņojuma)',

        # Template: AdminPGP
        'PGP Management' => 'PGP pārvaldība',
        'Use this feature if you want to work with PGP keys.' => '',
        'Add PGP key' => '',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'Šādi var tieši labot ar sistēmas konfigurāciju (SysConfig) izveidoto atslēgu saišķi.',
        'Introduction to PGP' => '',
        'Result' => 'Rezultāts',
        'Identifier' => 'Identifikātors',
        'Bit' => 'Bits',
        'Fingerprint' => 'Identificētājsumma',
        'Expires' => 'Darbības termiņš',
        'Delete this key' => '',
        'Add PGP Key' => '',
        'PGP key' => '',

        # Template: AdminPackageManager
        'Package Manager' => 'Pakotņu pārvaldība',
        'Uninstall package' => '',
        'Do you really want to uninstall this package?' => 'Vai tiešām vēlaties noņemt šo pakotni?',
        'Reinstall package' => '',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            '',
        'Continue' => 'Turpināt',
        'Install' => 'Instalēt',
        'Install Package' => '',
        'Update repository information' => '',
        'Did not find a required feature? OTRS Group provides their subscription customers with exclusive Add-Ons:' =>
            '',
        'Online Repository' => 'Tiešsaistes repozitorijs',
        'Vendor' => 'Piegādātājs',
        'Module documentation' => 'Moduļa dokumentācija',
        'Upgrade' => 'Jaunināt',
        'Local Repository' => 'Lokālais repozitorijs',
        'Uninstall' => 'Noņemt',
        'Reinstall' => 'Pārinstalēt',
        'Download package' => '',
        'Rebuild package' => '',
        'Metadata' => '',
        'Change Log' => '',
        'Date' => 'Datums',
        'List of Files' => '',
        'Permission' => 'Tiesības',
        'Download' => 'Lejupielādēt',
        'Download file from package!' => 'Lejupielādēt failu (datni) no pakotnes!',
        'Required' => 'Pieprasīts',
        'PrimaryKey' => 'Primārā atslēga',
        'AutoIncrement' => 'Autopieaugums',
        'SQL' => 'SQL',
        'File differences for file %s' => '',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Veiktspējas žurnāls',
        'This feature is enabled!' => 'Šī iespēja ir aktivizēta!',
        'Just use this feature if you want to log each request.' => 'Lietojiet šo iespēju lai žurnalētu katru pieprasījumu.',
        'Activating this feature might affect your system performance!' =>
            'Šīs iespējas aktivizēšana var negatīvi ietekmēt sistēmas veiktspēju.',
        'Disable it here!' => 'Atiestatīt šeit!',
        'Logfile too large!' => 'Žurnāla fails ir pārāk liels!',
        'The logfile is too large, you need to reset it' => '',
        'Overview' => 'Pārskats',
        'Range' => 'Intervāls',
        'Interface' => 'Interfeiss',
        'Requests' => 'Pieprasījumi',
        'Min Response' => 'Min. atbildes laiks',
        'Max Response' => 'Maks. atbildes laiks',
        'Average Response' => 'Vidējais atbildes laiks',
        'Period' => 'Periods',
        'Min' => 'Min.',
        'Max' => 'Maks.',
        'Average' => 'Vidēji',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'PostMaster\'a filtru pārvaldība',
        'Add filter' => '',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            '',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Ja vēlaties, lai sakristu tikai e-pasta adrese, izmantojiet EMAILADDRESS:info@example.com No, Kam vai Kopija laukos.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            '',
        'Delete this filter' => '',
        'Add PostMaster Filter' => '',
        'Edit PostMaster Filter' => '',
        'Filter name' => '',
        'The name is required.' => '',
        'Stop after match' => 'Pārtraukt pēc sakritības',
        'Filter Condition' => '',
        'The field needs to be a valid regular expression or a literal word.' =>
            '',
        'Set Email Headers' => '',
        'The field needs to be a literal word.' => '',

        # Template: AdminPriority
        'Priority Management' => 'Prioritāšu pārvaldība',
        'Add priority' => '',
        'Add Priority' => 'Pievienot prioritāti',
        'Edit Priority' => '',

        # Template: AdminQueue
        'Manage Queues' => '',
        'Add queue' => '',
        'Add Queue' => '',
        'Edit Queue' => '',
        'Sub-queue of' => '',
        'Unlock timeout' => 'Atslēgšanas noilgums',
        '0 = no unlock' => '0 = neatslēgt',
        'Only business hours are counted.' => 'Tiek uzskaitītas tikai darbalaika stundas.',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            '',
        'Notify by' => 'Paziņot ar',
        '0 = no escalation' => '0 = netiek eskalēts',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            '',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            '',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            '',
        'Follow up Option' => 'Sekošanas iespēja',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            '',
        'Ticket lock after a follow up' => 'Pieteikuma slēgšana pēc sekošanas',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            '',
        'System address' => '',
        'Will be the sender address of this queue for email answers.' => 'E-pasta atbildēm izmantos šīs rindas nosūtītāja adresi.',
        'Default sign key' => '',
        'The salutation for email answers.' => 'Uzruna e-pasta atbildēm.',
        'The signature for email answers.' => 'Paraksts e-pasta atbildēm.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => '',
        'Filter for Queues' => '',
        'Filter for Auto Responses' => '',
        'Auto Responses' => 'Automātiskas atbildes',
        'Change Auto Response Relations for Queue' => '',
        'settings' => 'Iestatījumi',

        # Template: AdminQueueResponses
        'Manage Response-Queue Relations' => '',
        'Filter' => 'Filtrs',
        'Filter for Responses' => '',
        'Responses' => 'Atbildes',
        'Change Queue Relations for Response' => '',
        'Change Response Relations for Queue' => '',

        # Template: AdminResponse
        'Manage Responses' => '',
        'Add response' => '',
        'A response is a default text which helps your agents to write faster answers to customers.' =>
            '',
        'Don\'t forget to add new responses to queues.' => '',
        'Delete this entry' => '',
        'Add Response' => '',
        'Edit Response' => '',
        'The current ticket state is' => 'Aktuālais pieteikuma statuss ir',
        'Your email address is' => '',

        # Template: AdminResponseAttachment
        'Manage Responses <-> Attachments Relations' => '',
        'Filter for Attachments' => '',
        'Change Response Relations for Attachment' => '',
        'Change Attachment Relations for Response' => '',
        'Toggle active for all' => '',
        'Link %s to selected %s' => '',

        # Template: AdminRole
        'Role Management' => 'Lomu pārvaldība',
        'Add role' => '',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Izveidot jaunu lomu un iekļaut tajā grupas. Pēc tam pievienot lomu lietotājiem',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            '',
        'Add Role' => 'Pievienot lomas',
        'Edit Role' => '',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => '',
        'Filter for Roles' => '',
        'Roles' => 'Lomas',
        'Select the role:group permissions.' => '',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            '',
        'Change Role Relations for Group' => '',
        'Change Group Relations for Role' => '',
        'Toggle %s permission for all' => '',
        'move_into' => 'ievietot',
        'Permissions to move tickets into this group/queue.' => 'Tiesības ievietot pieteikumus šajā grupā/rindā.',
        'create' => 'izveidot',
        'Permissions to create tickets in this group/queue.' => 'Tiesības izveidot pieteikumus šajā grupā/rindā.',
        'priority' => 'prioritāte',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Tiesības mainīt pieteikuma prioritāti šajā grupā/rindā.',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => '',
        'Filter for Agents' => '',
        'Agents' => '',
        'Manage Role-Agent Relations' => '',
        'Change Role Relations for Agent' => '',
        'Change Agent Relations for Role' => '',

        # Template: AdminSLA
        'SLA Management' => 'Servisa līmeņa līgumu pārvaldība',
        'Add SLA' => 'Pievienot servisa līmeņa līgumu',
        'Edit SLA' => '',
        'Please write only numbers!' => '',

        # Template: AdminSMIME
        'S/MIME Management' => 'S/MIME pārvaldība',
        'Add certificate' => '',
        'Add private key' => '',
        'Filter for certificates' => '',
        'Filter for SMIME certs' => '',
        'Here you can add relations to your private certificate, these will be embedded to the SMIME signature every time you use this certificate to sign an email.' =>
            '',
        'See also' => 'Skatīt arī',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'Šādi var tieši failu sistēmā labot sertifikātus un privātās atslēgas.',
        'Hash' => 'Jaucējsumma',
        'Create' => 'Izveidot',
        'Handle related certificates' => '',
        'Delete this certificate' => '',
        'Add Certificate' => 'Pievieot sertifikātu',
        'Add Private Key' => 'Pievienot privāto atslēgu',
        'Secret' => 'Slepenais kods',
        'Related Certificates for' => '',
        'Delete this relation' => '',
        'Available Certificates' => '',
        'Relate this certificate' => '',

        # Template: AdminSalutation
        'Salutation Management' => 'Uzrunu pārvaldība',
        'Add salutation' => '',
        'Add Salutation' => 'Pievienot uzrunu',
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
            'Parasti drošo režīmu (Secure Mode) uzstāda pēc instalācijas beigām.',
        'Secure mode must be disabled in order to reinstall using the web-installer.' =>
            'Lai pārinstalētu datus, lietojot pārlūkprogrammas instalātoru, drošajam režīmam (Secure Mode) ir jābūt izslēgtam.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            '',

        # Template: AdminSelectBox
        'SQL Box' => 'SQL pieprasījumi',
        'Here you can enter SQL to send it directly to the application database.' =>
            '',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            '',
        'There is at least one parameter missing for the binding. Please check it.' =>
            '',
        'Result format' => '',
        'Run Query' => '',

        # Template: AdminService
        'Service Management' => 'Servisu pārvaldība',
        'Add service' => '',
        'Add Service' => 'Pievienot servisu',
        'Edit Service' => '',
        'Sub-service of' => '',

        # Template: AdminSession
        'Session Management' => 'Sesiju pārvaldība',
        'All sessions' => '',
        'Agent sessions' => '',
        'Customer sessions' => '',
        'Unique agents' => '',
        'Unique customers' => '',
        'Kill all sessions' => 'Apturēt visas sesijas',
        'Kill this session' => '',
        'Session' => 'Sesija',
        'Kill' => '',
        'Detail View for SessionID' => '',

        # Template: AdminSignature
        'Signature Management' => 'Parakstu pārvaldība',
        'Add signature' => '',
        'Add Signature' => 'Pievienot parakstu',
        'Edit Signature' => '',
        'Example signature' => '',

        # Template: AdminState
        'State Management' => 'Statusu pārvaldība',
        'Add state' => '',
        'Please also update the states in SysConfig where needed.' => '',
        'Add State' => 'Pievienot statusu',
        'Edit State' => '',
        'State type' => '',

        # Template: AdminSysConfig
        'SysConfig' => 'Sistēmas konfigurācija (SysConfig)',
        'Navigate by searching in %s settings' => '',
        'Navigate by selecting config groups' => '',
        'Download all system config changes' => '',
        'Export settings' => '',
        'Load SysConfig settings from file' => '',
        'Import settings' => '',
        'Import Settings' => '',
        'Please enter a search term to look for settings.' => '',
        'Subgroup' => 'Apakšgrupa',
        'Elements' => 'Elementi',

        # Template: AdminSysConfigEdit
        'Edit Config Settings' => '',
        'This config item is only available in a higher config level!' =>
            '',
        'Reset this setting' => '',
        'Error: this file could not be found.' => '',
        'Error: this directory could not be found.' => '',
        'Error: an invalid value was entered.' => '',
        'Content' => 'Saturs',
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
        'NavBarName' => 'Vadības paneļa nosaukums',
        'NavBar' => 'Vadības panelis',
        'LinkOption' => '',
        'Block' => 'Bloks',
        'AccessKey' => 'Pieejas atslēga',
        'Add NavBar entry' => '',
        'Year' => 'Gads',
        'Month' => 'Mēnesis',
        'Day' => 'Diena',
        'Invalid year' => '',
        'Invalid month' => '',
        'Invalid day' => '',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Sistēmas e-pasta adrešu pārvaldība',
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
        'Type Management' => 'Tipu pārvaldība',
        'Add ticket type' => '',
        'Add Type' => 'Pievienot tipu',
        'Edit Type' => '',

        # Template: AdminUser
        'Add agent' => '',
        'Agents will be needed to handle tickets.' => '',
        'Don\'t forget to add a new agent to groups and/or roles!' => '',
        'Please enter a search term to look for agents.' => '',
        'Last login' => '',
        'Login as' => 'Pieteikties sistēmā kā',
        'Switch to agent' => '',
        'Add Agent' => '',
        'Edit Agent' => '',
        'Firstname' => 'Vārds',
        'Lastname' => 'Uzvārds',
        'Password is required.' => '',
        'Start' => 'Sākt',
        'End' => 'Beigt',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => '',
        'Change Group Relations for Agent' => '',
        'Change Agent Relations for Group' => '',
        'note' => '',
        'Permissions to add notes to tickets in this group/queue.' => '',
        'owner' => 'īpašnieks',
        'Permissions to change the owner of tickets in this group/queue.' =>
            '',

        # Template: AgentBook
        'Address Book' => 'Adresu grāmata',
        'Search for a customer' => '',
        'Add email address %s to the To field' => '',
        'Add email address %s to the Cc field' => '',
        'Add email address %s to the Bcc field' => '',
        'Apply' => '',

        # Template: AgentCustomerSearch
        'Search Customer' => 'Meklēt klientu',
        'Duplicated entry' => '',
        'This address already exists on the address list.' => '',

        # Template: AgentCustomerTableView

        # Template: AgentDashboard
        'Dashboard' => 'Darbvirsmas panelis',

        # Template: AgentDashboardCalendarOverview
        'in' => 'iekšā',

        # Template: AgentDashboardIFrame

        # Template: AgentDashboardImage

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s ir pieejams',
        'Please update now.' => 'Lūdzu, atjauniniet tūlīt',
        'Release Note' => 'Laidiena piezīme',
        'Level' => 'Līmenis',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Ievietots %s atpakaļ.',

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
        'Info' => 'Informācija',
        'To accept some news, a license or some changes.' => '',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Saistītais objekts: %s',
        'Close window' => '',
        'go to link delete screen' => '',
        'Select Target Object' => '',
        'Link Object' => 'Saistīt ar objektu',
        'with' => 'ar',
        'Unlink Object: %s' => 'Atsaistīt objektu: %s',
        'go to link add screen' => '',

        # Template: AgentNavigationBar

        # Template: AgentPreferences
        'Edit your preferences' => '',

        # Template: AgentSpelling
        'Spell Checker' => 'Pareizrakstības pārbaude',
        'spelling error(s)' => 'pareizrakstības kļūda(s)',
        'Apply these changes' => 'Apstiprināt izmaiņas',

        # Template: AgentStatsDelete
        'Delete stat' => '',
        'Stat#' => 'Atskaite Nr.',
        'Do you really want to delete this stat?' => '',

        # Template: AgentStatsEditRestrictions
        'Step %s' => '',
        'General Specifications' => '',
        'Select the element that will be used at the X-axis' => '',
        'Select the elements for the value series' => 'Izvēlieties elementus vērtību (Y) asij',
        'Select the restrictions to characterize the stat' => '',
        'Here you can make restrictions to your stat.' => 'Šeit statistikas pārskatam var izveidot ierobežojumus.',
        'If you remove the hook in the "Fixed" checkbox, the agent generating the stat can change the attributes of the corresponding element.' =>
            'Ja "Fixed" izvēles rūtiņu nav iezīmēta, tad aģents, kurš veido pārskatu, var mainīt attiecīgā elementa atribūtus.',
        'Fixed' => 'Fiksēts',
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Lūdzu, izvēlieties tikai vienu elementu vai atstatiet pogu \'Fiksēts\'.',
        'Absolute Period' => '',
        'Between' => 'Starp',
        'Relative Period' => 'Relatīvais periods',
        'The last' => 'Pēdējais',
        'Finish' => 'Beigas',

        # Template: AgentStatsEditSpecification
        'Permissions' => 'Tiesības',
        'You can select one or more groups to define access for different agents.' =>
            '',
        'Some result formats are disabled because at least one needed package is not installed.' =>
            '',
        'Please contact your administrator.' => '',
        'Graph size' => '',
        'If you use a graph as output format you have to select at least one graph size.' =>
            'Ja kā izvades formāts norādīta diagramma, jāizvēlas vismaz viens diagrammas izmērs.',
        'Sum rows' => 'Summēt rindas',
        'Sum columns' => 'Summēt kolonnas',
        'Use cache' => '',
        'Most of the stats can be cached. This will speed up the presentation of this stat.' =>
            'Lielāko daļu atskaišu iespējams kešot. Tas paātrinās atskaites izveidošanu.',
        'If set to invalid end users can not generate the stat.' => '',

        # Template: AgentStatsEditValueSeries
        'Here you can define the value series.' => '',
        'You have the possibility to select one or two elements.' => '',
        'Then you can select the attributes of elements.' => '',
        'Each attribute will be shown as single value series.' => '',
        'If you don\'t select any attribute all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            '',
        'Scale' => 'Mērogs',
        'minimal' => 'minimālā vērtība',
        'Please remember, that the scale for value series has to be larger than the scale for the X-axis (e.g. X-Axis => Month, ValueSeries => Year).' =>
            'Lūdzu, atcerieties, ka vērtību (Y) ass mērogam jābūt lielākām nekā X-ass mērogam (piem. X-ass => mēnesis, Y-ass => gads).',

        # Template: AgentStatsEditXaxis
        'Here you can define the x-axis. You can select one element via the radio button.' =>
            '',
        'maximal period' => 'maksmālais periods',
        'minimal scale' => 'minimālais mērogs',

        # Template: AgentStatsImport
        'Import Stat' => '',
        'File is not a Stats config' => 'Norādītais fails nesatur statistikas konfigurācijas datus',
        'No File selected' => 'Nav izvēlēts neviens fails',

        # Template: AgentStatsOverview
        'Stats' => 'Statistika',

        # Template: AgentStatsPrint
        'Print' => 'Drukāt',
        'No Element selected.' => 'Nav izvēlēts neviens elements.',

        # Template: AgentStatsView
        'Export config' => '',
        'With the input and select fields you can influence the format and contents of the statistic.' =>
            '',
        'Exactly what fields and formats you can influence is defined by the statistic administrator.' =>
            '',
        'Stat Details' => '',
        'Format' => 'Formāts',
        'Graphsize' => 'Diagrammas izmērs',
        'Cache' => 'Kešatmiņa',
        'Exchange Axis' => 'Samainīt asis',
        'Configurable params of static stat' => 'Statisko atskaišu konfigurējamie parametri',
        'No element selected.' => 'Nav izvēlēts neviens elements.',
        'maximal period from' => 'maksimālais periods no',
        'to' => 'līdz',

        # Template: AgentTicketActionCommon
        'Change Free Text of Ticket' => '',
        'Change Owner of Ticket' => '',
        'Close Ticket' => '',
        'Add Note to Ticket' => '',
        'Set Pending' => 'Iestatīt kā neizlemtu',
        'Change Priority of Ticket' => '',
        'Change Responsible of Ticket' => '',
        'Cancel & close window' => '',
        'Service invalid.' => '',
        'New Owner' => 'Jauns īpašnieks',
        'Please set a new owner!' => '',
        'Previous Owner' => 'Iepriekšējais īpašnieks',
        'Inform Agent' => 'Informēt aģentu',
        'Optional' => 'Izvēles',
        'Inform involved Agents' => 'Informēt iesaistītos aģentus',
        'Spell check' => '',
        'Note type' => 'Piezīmes tips',
        'Next state' => 'Nākamais statuss',
        'Pending date' => 'Gaida līdz (datumam)',
        'Date invalid!' => '',

        # Template: AgentTicketActionPopupClose

        # Template: AgentTicketBounce
        'Bounce Ticket' => '',
        'Bounce to' => 'Atleks uz',
        'You need a email address.' => '',
        'Need a valid email address or don\'t use a local email address.' =>
            '',
        'Next ticket state' => 'Nākamais pieteikuma stāvoklis',
        'Inform sender' => 'Informēt nosūtītāju',
        'Send mail!' => 'Nosūtīt ziņojumu!',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Labot vairākus pieteikumus',
        'Send Email' => '',
        'Merge to' => 'Apvienot ar',
        'Invalid ticket identifier!' => '',
        'Merge to oldest' => 'Apvienot ar vecāko',
        'Link together' => 'Sasaistīt kopā',
        'Link to parent' => '',
        'Unlock tickets' => '',

        # Template: AgentTicketClose

        # Template: AgentTicketCompose
        'Compose answer for ticket' => 'Rakstīt atbildi pieteikumam',
        'Remove Ticket Customer' => '',
        'Please remove this entry and enter a new one with the correct value.' =>
            '',
        'Please include at least one recipient' => '',
        'Remove Cc' => '',
        'Remove Bcc' => '',
        'Address book' => '',
        'Pending Date' => 'Izlemt līdz (datumam)',
        'for pending* states' => 'izlemšanas* stāvokļiem',
        'Date Invalid!' => '',

        # Template: AgentTicketCustomer
        'Change customer of ticket' => 'Mainīt pieteikuma klientu',
        'Customer Data' => 'Klienta dati',
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
        'History of' => 'Vēsture',
        'History Content' => '',
        'Zoom view' => '',

        # Template: AgentTicketMerge
        'Ticket Merge' => 'Apvienot pieteikumus',
        'You need to use a ticket number!' => 'Jālieto pieteikuma numurs!',
        'A valid ticket number is required.' => '',
        'Need a valid email address.' => '',

        # Template: AgentTicketMove
        'Move Ticket' => 'Pārvietot pieteikumu',
        'New Queue' => 'Jauna rinda',

        # Template: AgentTicketNote

        # Template: AgentTicketOverviewMedium
        'Select all' => '',
        'No ticket data found.' => '',
        'First Response Time' => 'Pirmais reakcijas laiks',
        'Service Time' => 'Servisa laiks',
        'Update Time' => 'Atjaunināšanas laiks',
        'Solution Time' => 'Atrisinājuma laiks',
        'Move ticket to a different queue' => '',
        'Change queue' => 'Mainīt rindu',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Mainīt meklēšanas iestatījumus',
        'Tickets per page' => '',

        # Template: AgentTicketOverviewPreview
        '","26' => '',

        # Template: AgentTicketOverviewSmall
        'Escalation in' => 'Eskalēt',
        'Locked' => 'Aizslēgts',
        '","30' => '',

        # Template: AgentTicketOwner

        # Template: AgentTicketPending

        # Template: AgentTicketPhone
        'Create New Phone Ticket' => '',
        'From customer' => '',
        'To queue' => '',

        # Template: AgentTicketPhoneCommon
        'Phone call' => 'Telefona zvans',

        # Template: AgentTicketPlain
        'Email Text Plain View' => '',
        'Plain' => 'vienkāršs teksts',
        'Download this email' => '',

        # Template: AgentTicketPrint
        'Ticket-Info' => 'Informācija par pieteikumu',
        'Accounted time' => 'Uzskaitītais laiks',
        'Linked-Object' => 'Saistītie objekti',
        'by' => 'no',

        # Template: AgentTicketPriority

        # Template: AgentTicketQueue

        # Template: AgentTicketResponsible

        # Template: AgentTicketSearch
        'Search template' => 'Meklēšanas sagatave',
        'Create Template' => '',
        'Create New' => '',
        'Profile link' => '',
        'Save changes in template' => '',
        'Add another attribute' => '',
        'Output' => 'Rezultātu forma',
        'Fulltext' => 'Pilnais teksts',
        'Remove' => '',
        'Customer User Login' => 'Klienta pieteikšanās sistēmā',
        'Created in Queue' => 'Izveidots rindā',
        'Lock state' => '',
        'Watcher' => 'Novērotājs',
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
        'Article Type' => 'Ziņojuma tips',
        'Sender Type' => '',
        'Save filter settings as default' => 'Saglabāt filtra iestatījumus kā noklusētos',
        'Ticket Information' => '',
        'Linked Objects' => '',
        'Article(s)' => '',
        'Change Queue' => '',
        'Article Filter' => '',
        'Add Filter' => '',
        'Set' => 'Uzstādīt',
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
        'Traceback' => 'Izsekot vēsturei',

        # Template: CustomerFooter
        'Powered by' => 'Darbina ar',
        'One or more errors occurred!' => '',
        'Close this dialog' => '',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            '',

        # Template: CustomerHeader

        # Template: CustomerLogin
        'Login' => 'Pieteikties',
        'User name' => '',
        'Your user name' => '',
        'Your password' => '',
        'Forgot password?' => '',
        'Log In' => '',
        'Not yet registered?' => '',
        'Sign up now' => '',
        'Request new password' => 'Pieprasīt jaunu paroli',
        'Your User Name' => '',
        'A new password will be sent to your email address.' => '',
        'Create Account' => 'Izveidot lietotāja kontu',
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
        'Profile' => 'Profils',
        'e. g. 10*5155 or 105658*' => '',
        'Customer ID' => '',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => '',
        'Recipient' => 'Saņēmējs',
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
        'of' => 'no',
        'Page' => 'Lapa',
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
        'Welcome to %s' => '%s',
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
            'Ja datubāzei ir iestatīta \'root\' parole, ievadiet to šeit. Ja nav, atstājiet lauku tukšu. Drošības apsvērumu dēļ mēs iesakām datubāzei iestatīt \'root\'paroli. Papildinformāciju meklējiet savas datubāzes dokumentācijā.',
        'Currently only MySQL is supported in the web installer.' => '',
        'If you want to install OTRS on another database type, please refer to the file README.database.' =>
            '',
        'Database-User' => 'Datubāzes lietotāja parole',
        'New' => 'Jauna',
        'A new database user with limited rights will be created for this OTRS system.' =>
            '',
        'default \'hot\'' => 'noklusētais \'hot\'',
        'DB--- host' => '',
        'Check database settings' => '',
        'Result of database check' => '',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Lai varētu izmantot OTRS, sekojošā komanda jāizpilda terminālī/čaulā.',
        'Restart your webserver' => 'Pārstartējiet tīmekļa serveri (webserver).',
        'After doing so your OTRS is up and running.' => 'Pēc tam OTRS būs darba kārtībā un palaists.',
        'Start page' => 'Sākumlapa',
        'Your OTRS Team' => 'Jūsu OTRS komanda',

        # Template: InstallerLicense
        'Accept license' => 'Piekrist licencei',
        'Don\'t accept license' => 'Nepiekrist licencei',

        # Template: InstallerLicenseText

        # Template: InstallerRegistration
        'Organization' => 'Organizācija/uzņēmums',
        'Position' => '',
        'Complete registration and continue' => '',
        'Please fill in all fields marked as mandatory.' => '',

        # Template: InstallerSystem
        'SystemID' => 'Sistēmas ID',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            '',
        'System FQDN' => 'Sistēmas FQDN',
        'Fully qualified domain name of your system.' => '',
        'AdminEmail' => 'Administratora e-pasts',
        'Email address of the system administrator.' => '',
        'Log' => 'Žurnāls',
        'LogModule' => 'Žurnāla modulis',
        'Log backend to use.' => '',
        'LogFile' => '',
        'Log file location is only needed for File-LogModule!' => '',
        'Webfrontend' => 'Pārlūka priekšpuse',
        'Default language' => '',
        'Default language.' => '',
        'CheckMXRecord' => 'Pārbaudīt MX ierakstu',
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
        'Lost your password?' => 'Aizmirsta parole?',
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
        'URL' => 'URL (adrese)',

        # Template: PrintHeader
        'printed by' => 'drukājis',

        # Template: PublicDefault

        # Template: Redirect

        # Template: RichTextEditor

        # Template: SpellingInline

        # Template: Test
        'OTRS Test Page' => 'OTRS problēmu pieteikumu sistēmas testa lapa',
        'Welcome %s' => 'Laipni lūdzam %s',
        'Counter' => 'Skaitītājs',

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
        'Attachments <-> Responses' => 'Pielikumi <-> Atbildes',
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
        'Default value for NameX' => '',
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
        'Email Addresses' => 'E-pasta adreses',
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
        'GenericAgent' => 'Vispārīgais uzdevums',
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
        'NameX' => '',
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
        'Roles <-> Groups' => 'Lomas <-> Grupas',
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
        'Select your frontend Theme.' => 'Izvēlieties interfeisa tēmu.',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            '',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            '',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            'Sūtīt man paziņojumu, ja klients nosūta papildinformāciju un es esmu šī pieteikuma īpašnieks.',
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
        'Tickets' => 'Pieteikumu',
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
            'Izvēlētās prioritārās rindas. Ja ir iestatīts, tad jūs saņemsiet par šīm rindām paziņojumus arī e-pastā.',

        #
        # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
        #
        '%s Tickets affected! Do you really want to use this job?' => 'Tiks mainīti %s pieteikumi! Vai tiešām vēlaties izpildīt šo uzdevumu?',
        '(Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behinde a dial-up line $!)' =>
            '(Nosūtot atbildes ziņojumu, OTRS pārbauda izmantoto e-pasta adrešu MX ierakstus. Nelietojiet, ja OTRS sistēma izmanto iezvanpieeju!)',
        '(Email of the system admin)' => '(Sistēmas administratora e-pasts)',
        '(Full qualified domain name of your system)' => '(Sistēmas pilnais domēna vārds)',
        '(Logfile just needed for File-LogModule!)' => '(Žurnāla fails. Tiek izmantots tikai failu žurnālam!)',
        '(Note: It depends on your installation how many dynamic objects you can use)' =>
            '(Piezīme: no instalācijas ir atkarīgs cik dinamiskos objektus objektus var lietot)',
        '(Note: Useful for big databases and low performance server)' => '(Piezīmes: noderīgi lielām datu bāzēm un zemas veiktspējas serveriem)',
        '(The identify of the system. Each ticket number and each http session id starts with this number)' =>
            'Sistēmas identifikators. Katrs pieteikums un katra http sesija sākas ar šo numuru',
        '(Ticket identifier. Some people want toset this to e. g. \'Ticket#\', \'Call#\' or \'MyTicket#\')' =>
            'Pieteikuma identifikators. Iespējams iestatīt identifikātora nosaukumu, piem. \'Pieteikums#\', \'Zvans#\' vai \'MansPieteikums#\')',
        '(Used default language)' => '(Izmantotā noklusētā valoda)',
        '(Used log backend)' => '(Izmantotā žurnāla aizmugure)',
        '(Used ticket number format)' => '(Izmantotais pieteikuma identifikatora formāts)',
        'A article should have a title!' => 'Ziņojumam jābūt arī virsrakstam!',
        'A message must be spell checked!' => 'Ziņojumam jāpārbauda pareizrakstība!',
        'A message should have a To: recipient!' => 'Ziņojumam jābūt saņēmējam (Kam:)!',
        'A message should have a body!' => 'Ziņojumam jābūt saturam!',
        'A message should have a subject!' => 'Ziņojumam jābūt tēmai!',
        'A required field is:' => 'Obligātais lauks ir:',
        'A response is default text to write faster answer (with default text) to customers.' =>
            'Atbilde ir noklusētais teksts lai varētu ātri sastādīt atbildi klientam ar jau gatavu tekstu.',
        'A web calendar' => 'Kalendārs',
        'Absolut Period' => 'Absolūtais periods',
        'Add Customer User' => 'Pievienot klienta datus',
        'Add System Address' => 'Pievienot sistēmas e-pasta adresi',
        'Add User' => 'Pievienot lietotāju',
        'Add a new Agent.' => 'Pievienot jaunu aģentu (pieteikumu apstrādes operatoru).',
        'Add a new Customer Company.' => 'Pievienot jaunu klienta organizāciju/uzņēmumu.',
        'Add a new Group.' => 'Pievienot jaunu grupu.',
        'Add a new Notification.' => 'Pievienojiet jaunu paziņojumu.',
        'Add a new Priority.' => 'Pievienot jaunu prioritāti.',
        'Add a new Role.' => 'Pievienot jaunu lomu.',
        'Add a new SLA.' => 'Pievienot jaunu servisa līmeņa līgumu.',
        'Add a new Salutation.' => 'Pievienot jaunu uzrunu.',
        'Add a new Service.' => 'Pievienot jaunu servisu.',
        'Add a new Signature.' => 'Pievienot jaunu parakstu.',
        'Add a new State.' => 'Pievienot jaunu statusu.',
        'Add a new System Address.' => 'Pievienot jaunu sistēmas e-pasta adresi.',
        'Add a new Type.' => 'Pievienot jaunu tipu.',
        'Add a note to this ticket!' => 'Pievienot pieteikumam piezīmi!',
        'Add note to ticket' => 'Pievienot pieteikumam piezīmi',
        'Added User "%s"' => 'Lietotājs "%s" pievienots.',
        'Admin-Area' => 'Administrēšanas sadaļa',
        'Admin-Password' => 'Administratora parole',
        'Admin-User' => 'Lietotājs - administrators',
        'Agent Mailbox' => 'Lietotāja pastkaste',
        'Agent Preferences' => 'Lietotāja iestatījumi',
        'Agent based' => 'Aģentiem',
        'Agent-Area' => 'Lietotāja sadaļa',
        'All Agent variables.' => 'Visi aģenta mainīgie dati',
        'All Agents' => 'Visi aģenti',
        'All Customer variables like defined in config option CustomerUser.' =>
            'Visi klienta mainīgie dati kā noteikts \'CustomerUser\' konfigurācijas iestatījumā.',
        'All customer tickets.' => 'Visi klienta pieteikumi.',
        'All email addresses get excluded on replaying on composing an email.' =>
            'Rakstot atbildes e-pasta ziņojumu, visas e-pasta adreses tiks izlaistas.',
        'All incoming emails with this "Email" (To:) will be dispatched in the selected queue!' =>
            'Visi ienākošie e-pasta ziņojumi ar šo adresi (Kam:) tiks pārsūtīti uz izvēlēto rindu!',
        'All messages' => 'Visi ziņojumi',
        'All new tickets!' => 'Visi jaunie pieteikumi',
        'All tickets where the reminder date has reached!' => 'Visi pieteikumi, kuriem pienācis atgādinājuma datums',
        'All tickets which are escalated!' => 'Visi eskalētie pieteikumi',
        'Allocate CustomerUser to service' => 'Pievienot klientus servisam',
        'Allocate services to CustomerUser' => 'Pievienot klientam servisus',
        'Answer' => 'Atbilde',
        'Article Create Times' => 'Ziņojuma izveidošanas laiki',
        'Article created' => 'Ziņojums izveidots',
        'Article created between' => 'Ziņojums izveidots laikā starp',
        'Article filter settings' => 'Ziņojuma filtra iestatījumi',
        'Attach' => 'Pievienot',
        'Attribute' => 'Attribūts',
        'Auto Response From' => 'Automātiska atbilde no',
        'Auto Responses <-> Queue' => 'Automātiskas atbildes <-> Rindas',
        'Bounce ticket' => 'Pieteikumu varēs pārcelt',
        'Bulk-Action' => 'Labot vairākus',
        'CSV' => 'CSV',
        'Can not create link with %s!' => 'Nevar izveidot saiti ar %s!',
        'Can not delete link with %s!' => 'Nevar nodzēst saiti ar %s !',
        'Can\'t update password, invalid characters!' => 'Nav iespējams mainīt paroli, tā satur nederīgas rakstzīmes.',
        'Can\'t update password, must be at least %s characters!' => 'Nav iespējams mainīt paroli, nepieciešamas vismaz %s rakstzīmes.',
        'Can\'t update password, must contain 2 lower and 2 upper characters!' =>
            'Nav iespējams mainīt paroli, parolei jāsatur vismaz 2 lielo un 2 mazo burtu rakstzīmes.',
        'Can\'t update password, need 2 lower and 2 upper characters!' =>
            'Nav iespējams mainīt paroli, parolei jāsatur vismaz 2 lielo un 2 mazo burtu rakstzīmes.',
        'Can\'t update password, need min. 1 digit!' => 'Nav iespējams mainīt paroli, parolei jāsatur vismaz 1 ciparu rakstzīme!',
        'Can\'t update password, need min. 2 characters!' => 'Nav iespējams mainīt paroli, parolei jāsatur vismaz 2 rakstzīmes!',
        'Can\'t update password, need min. 8 characters!' => 'Nav iespējams mainīt paroli, nepieciešamas vismaz 8 rakstzīmes.',
        'Can\'t update password, needs at least 1 digit!' => 'Nav iespējams mainīt paroli, parolei jāsatur vismaz 1 ciparu rakstzīme!',
        'Can\'t update password, needs at least 2 characters!' => 'Nav iespējams mainīt paroli, parolei jāsatur vismaz 2 rakstzīmes!',
        'Can\'t update password, passwords doesn\'t match! Please try it again!' =>
            'Nav iespējams mainīt paroli, jaunās paroles nesakrīt savā starpā!',
        'Can\'t update password, your new passwords do not match! Please try again!' =>
            'Nav iespējams mainīt paroli, jaunās paroles nesakrīt savā starpā! Lūdzu, mēģiniet vēlreiz',
        'Category Tree' => 'Kategorijas',
        'Change %s settings' => 'Mainīt %s iestatījumus',
        'Change Time' => 'Mainīt laiku',
        'Change Times' => 'Mainīt laikus',
        'Change free text of ticket' => 'Mainīt pieteikuma brīvo tekstu',
        'Change owner of ticket' => 'Mainīt pieteikuma īpašnieku',
        'Change priority of ticket' => 'Mainīt pieteikuma prioritāti',
        'Change responsible of ticket' => 'Mainīt atbildīgo par pieteikumu',
        'Change the ticket customer!' => 'Mainīt pieteikuma pieteicēju (klientu)!',
        'Change the ticket owner!' => 'Mainīt pieteikuma īpašnieku (atbildīgo)!',
        'Change the ticket priority!' => 'Mainīt pieteikuma prioritāti!',
        'Change user <-> group settings' => 'Mainīt lietotāju <-> grupu iestatījumus',
        'ChangeLog' => 'Izmaiņu saraksts',
        'Child-Object' => '\'Bērna\' objekts',
        'Classification' => 'Klasifikācija',
        'Clear From' => 'Dzēst No:',
        'Clear To' => 'Nodzēst Kam:',
        'Click here to report a bug!' => 'Klikšķiniet te, lai paziņotu par kļūdu!',
        'Close Times' => 'Aizvēršanas laiki',
        'Close this ticket!' => 'Aizvērt pieteikumu!',
        'Close ticket' => 'Aizvērt pieteikumu',
        'Close type' => 'Aizvēršanas tips',
        'Close!' => 'Aizvērt!',
        'Collapse View' => 'Sašaurināt skatu',
        'Comment (internal)' => 'Komentārs (iekšējais)',
        'CompanyTickets' => 'Organizācijas/uzņēmuma pieteikumi',
        'Compose Answer' => 'Rakstīt atbildi',
        'Compose Email' => 'Izveidot e-pasta ziņojumu',
        'Compose Follow up' => 'Rakstīt sekošanas ziņojumu',
        'Config Options' => 'Konfigurācijas iestatījumi',
        'Config options (e. g. &lt;OTRS_CONFIG_HttpType&gt;)' => 'Konfigurācijas iestatījumi (piem.&lt;OTRS_CONFIG_HttpType&gt;)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>)' => 'Konfigurācijas iestatījumi (piem. <OTRS_CONFIG_HttpType>)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>).' => 'Konfigurācijas dati (piem. <OTRS_CONFIG_HttpType).',
        'Contact customer' => 'Kontaktēties (zvanīt) klientam',
        'Create Times' => 'Izveidošanas laiki',
        'Create new Phone Ticket' => 'Izveidot jaunu telefonisku pieteikumu',
        'Create new database' => 'Izveidot jaunu datubāzi',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...).' =>
            'Veidojiet jaunas grupas, lai pārvaldītu pieejas tiesības dažādām aģentu grupām (piemēram iepirkumu daļai, atbalsta daļai, pārdošanas daļai, utt.).',
        'CreateTicket' => 'Izveidot vēl vienu',
        'Current Impact Rating' => 'Tekošais ietekmes novērtējums',
        'Customer Move Notify' => 'Paziņojums klientam par pieteikuma pārvietošanu',
        'Customer Owner Notify' => 'Paziņojums klientam par pieteikuma īpašnieka maiņu',
        'Customer State Notify' => 'Paziņojums klientam par statusa maiņu',
        'Customer User' => 'Knients',
        'Customer User Management' => 'Klientu datu pārvaldība',
        'Customer Users' => 'Klienti',
        'Customer Users <-> Groups' => 'Klienti <-> Grupas',
        'Customer Users <-> Groups Management' => 'Klientu grupu <-> Grupu pārvaldība',
        'Customer Users <-> Services' => 'Klienti <-> Servisi',
        'Customer Users <-> Services Management' => 'Klientu <-> Servisu pārvaldība',
        'Customer history' => 'Klienta vēstures dati',
        'Customer history search' => 'Meklēšana klienta vēstures datos',
        'Customer history search (e. g. "ID342425").' => 'Meklēšana klienta vēstures datos (piem. "ID342425").',
        'Customer user will be needed to have a customer history and to login via customer panel.' =>
            'Klienta lietotājvārds ir nepieciešams lai saglabātu klienta vēstures datus un lai pieteiktos sistēmā.',
        'CustomerUser' => 'Klienti',
        'D' => 'D',
        'DB Admin Password' => 'Datubāzes administratora parole',
        'DB Admin User' => 'Datubāzes administratora lietotājvārds',
        'DB connect host' => 'Datubāzes resursdators',
        'Default' => 'Noklusētā vērtība',
        'Default Charset' => 'Noklusētais kodējums',
        'Default Language' => 'Noklusētā valoda',
        'Delete old database' => 'Dzēst veco datubāzi',
        'Delete this ticket!' => 'Dzēst šo pieteikumu!',
        'Detail' => 'Detaļas',
        'Diff' => 'Atšķirības',
        'Discard all changes and return to the compose screen' => 'Izmest visas izmaiņas un atgriezties ziņojuma sastādīšanas logā',
        'Do dispatch or filter incoming emails based on email X-Headers! RegExp is also possible.' =>
            'Pārvietot vai filtrēt ienākošos e-pastus pēc to X-hederiem (galvenēm). Pieļaujamas arī regulārās izteiksmes (regexp).',
        'Do you really want to delete this Object?' => 'Vai tiešām vēlaties dzēst šo objektu?',
        'Do you really want to reinstall this package (all manual changes get lost)?' =>
            'Vai tiešām vēlaties pārinstalēt šo pakotni (visas izdarītās izmaiņas tiks zaudētas)?',
        'Don\'t forget to add a new response a queue!' => 'Neaizmirstiet rindai pievienot jaunu atbildi!',
        'Don\'t forget to add a new user to groups and/or roles!' => 'Neaizmirstiet pievienot jauno lietotāju grupām un/vai lomām!',
        'Don\'t forget to add a new user to groups!' => 'Neaizmirstiet pievienot jauno lietotāju grupām!',
        'Don\'t work with UserID 1 (System account)! Create new users!' =>
            'Lūdzu, nestrādājiet ar Lietotāja ID 1 (sistēmas kontu)! Izveidojiet jaunu lietotāju!',
        'Download Settings' => 'Lejupielādēt iestatījumus',
        'Download all system config changes.' => 'Lejupielādēt visas sistēmas konfigurācijas izmaiņas.',
        'Drop Database' => 'Dzēst datubāzi',
        'Dynamic-Object' => 'Dinamisks objekts',
        'Edit default services.' => 'Labot noklusētos servisus.',
        'Email based' => 'E-pasta ziņojumiem',
        'Escalation - First Response Time' => 'Eskalācija - pirmās atbildes laiks',
        'Escalation - Solution Time' => 'Eskalācija - atrisināšanas laiks',
        'Escalation - Update Time' => 'Eskalācija - atjaunošanas laiks',
        'Escalation Times' => 'Eskalācijas laiki',
        'Escalation time' => 'Eskalācijas laiks',
        'Event is required!' => 'Notikums ir obligāts!',
        'Expand View' => 'Paplašināt skatu',
        'Explanation' => 'Paskaidrojums',
        'Export Config' => 'Eksportēt konfigurāciju',
        'FAQ Search Result' => 'BUJ (FAQ) meklēšanas rezultāti',
        'FAQ System History' => 'BUJ (FAQ) sistēmas vēstures dati',
        'File-Name' => 'Faila (datnes) nosaukums',
        'File-Path' => 'Faila (datnes) ceļa vārds',
        'Filelist' => 'Failu (datņu) saraksts',
        'Filtername' => 'Filtra nosaukums',
        'Follow up' => 'Sekošana',
        'Follow up notification' => 'Sekošanas paziņojums',
        'For very complex stats it is possible to include a hardcoded file.' =>
            'Ļoti sarežģītām atskaitēm var izmantot iepriekš definētu failu (datni) atskaites kritērijiem.',
        'Frontend' => 'Lietotāja interfeiss',
        'Fulltext-Search in Article (e. g. "Mar*in" or "Baue*")' => 'Meklēšana visā ziņojuma tekstā (piem. "Mar*in" vai "Neva*")',
        'Go' => 'Izpildīt',
        'Group Ro' => 'Ro grupa (iespējams tikai lasīt)',
        'Group based' => 'Grupām',
        'Group selection' => 'Grupu izvēle',
        'Have a lot of fun!' => 'Veiksmi darbā!',
        'Here you can define the value series. You have the possibility to select one or two elements. Then you can select the attributes of elements. Each attribute will be shown as single value series. If you don\'t select any attribute all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Šeit var noteikt vērtību ass elementus. Iespējams izvēlēties vienu vai divus elementus. Pēc tam var izvēlēties elementu atribūtus. Katrs atribūts tiks parādīts kā atsevišķa vērtību sērija. Ja netiks izvēlēts neviens atsevišķs atribūts, veidojot atskaiti tiks izmantoti visi izvēlētā elementa atribūti, kā arī jaunie atribūti, kuri pievienoti kopš pēdējās konfigurēšanas.',
        'Here you can define the x-axis. You can select one element via the radio button. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Šeit var izvēlēties X-asi. Ar radio pogu iespējams izvēlēties vienu elementu. Ja netiks izvēlēts nekas, veidojot atskaiti tiks izmantoti visi izvēlētā elementa atribūti, kā arī jaunie atribūti, kuri pievienoti kopš pēdējās konfigurēšanas.',
        'Here you can insert a description of the stat.' => 'Šeit var ierakstīt statistikas atskaites aprakstu.',
        'Here you can select the dynamic object you want to use.' => 'Šeit var izvēlēties kādus dinamiskos objektus lietot.',
        'Home' => 'Sākums',
        'If Secure Mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Ja drošais režīms vēl nav aktivizēts, aktivizējiet to no sistēmas konfigurācijas (SysConfig), jo programma jau tiek pašlaik darbināta.',
        'If a new hardcoded file is available this attribute will be shown and you can select one.' =>
            'Ja būs pieejams jauns kritēriju fails tad šis atribūts tiks parādīts un to varēs izvēlēties.',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked for the old owner.' =>
            'Ja pieteikums ir aizvērts un klients ir nosūtījis papildinājumu, pieteikums tiks aizslēgts, saglabājot iepriekšējo īpašnieku.',
        'If a ticket will not be answered in this time, just only this ticket will be shown.' =>
            'Ja uz pieteikumu netiks atbildēts līdz ši laika beigām, tiks parādīts tikai šis pieteikums.',
        'If an agent locks a ticket and he/she will not send an answer within this time, the ticket will be unlock automatically. So the ticket is viewable for all other agents.' =>
            'Ja aģents slēdz pieteikumu un neatbild līdz šī laika beigām, pieteikums tiks automātiski atslēgts. Tātad pieteikums būs atkal redzams visiem aģentiem.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the user).' =>
            'Ja nekas nav iestatīts, tad šajā grupā lietotājam nav tiesību (lietotājam pieteikumi nebūs pieejami).',
        'If you need the sum of every column select yes.' => 'Ja nepieciešams summēt visas kolonnas, izvēlieties \'Jā\'.',
        'If you need the sum of every row select yes' => 'Ja nepieciešams summēt visas rindiņas, izvēlieties \'Jā\'.',
        'If you use RegExp, you also can use the matched value in () as [***] in \'Set\'.' =>
            'Lietojot regulārās izteiksmes (regexp), var izmantot arī sakrītošo vērtību kā [***] zem \'Uzstādīt\'.',
        'Image' => 'Attēls',
        'Important' => 'Svarīgi',
        'Imported' => 'Importēts',
        'Imported by' => 'Importējis',
        'In this form you can select the basic specifications.' => 'Šajā formā var izvēlēties pamata kritērijus.',
        'In this way you can directly edit the keyring configured in Kernel/Config.pm.' =>
            'Šādi iespējams tieši labot atslēgu saišķi failā Kernel/Config.pm',
        'Information about the Stat' => 'Informācija par atskaiti',
        'Insert of the common specifications' => 'Ievadiet kopējas pazīmes',
        'Instance' => 'Instance',
        'Is Job Valid' => 'Vai uzdevums ir derīgs',
        'Is Job Valid?' => 'Vai uzdevums ir derīgs?',
        'It\'s useful for ASP solutions.' => 'Izmantojams ASP-risinājumiem.',
        'It\'s useful for a lot of users and groups.' => 'Noderīga daudzu lietotāju un grupu gadījumā.',
        'Job-List' => 'Uzdevumu saraksts',
        'Keyword' => 'Atslēgvārds',
        'Keywords' => 'Atslēgvārdi',
        'Last update' => 'Pēdējā atjaunināšana',
        'Link this ticket to an other objects!' => 'Piesaistīt šo pieteikumu citiem objektiem!',
        'Link to Parent' => 'Sasaistīt ar senci',
        'Linked as' => 'Sasaistīts kā',
        'Load' => 'Ielādēt',
        'Load Settings' => 'Ielādēt iestatījumus',
        'Lock it to work on it!' => 'Aizslēgt pieteikumu lai ar to strādātu!',
        'Logfile' => 'Žurnāla fails) datne',
        'Logfile too large, you need to reset it!' => 'Žurnāla fails ir pārāk liels, jums jāsamazina tā izmērs!',
        'Login failed! Your username or password was entered incorrectly.' =>
            'Neizdevās pieteikties! Lietotājvārds vai parole tika ievadīti nepareizi.',
        'Lookup' => 'Caurskatīt',
        'Mail Management' => 'E-pasta pārvaldība',
        'Mailbox' => 'Pastkaste',
        'Match' => 'Sakritība',
        'Merge this ticket!' => 'Apvienot šo pieteikumu (ar citu)!',
        'Message for new Owner' => 'Ziņojums jaunajam īpašniekam',
        'Message sent to' => 'Ziņojums nosūtīts',
        'Misc' => 'Dažādi',
        'Modified' => 'Mainīts',
        'Modules' => 'Moduļi',
        'Move notification' => 'Pārvietošanas paziņojums',
        'Multiple selection of the output format.' => 'Atskaišu izvades formāta izvēles.',
        'My Queue' => 'Mana rinda',
        'MyTickets' => 'Mani pieteikumi',
        'Name is required!' => 'Vārds ir obligāts!',
        'New Agent' => 'Jauns aģents',
        'New Customer' => 'Jauns klients',
        'New Group' => 'Jauna grupa',
        'New Group Ro' => 'Jauna Ro grupa (tikai lasīšanai)',
        'New Priority' => 'Jauna prioritāte',
        'New SLA' => 'Jauns servisa līmeņa līgums',
        'New Service' => 'Jauns serviss',
        'New State' => 'Jauns statuss',
        'New Ticket Lock' => 'Jauna pieteikuma slēgšanas zīme',
        'New TicketFreeFields' => 'Jauni pieteikuma neaizpildītie lauki',
        'New Title' => 'Jauns virsraksts',
        'New Type' => 'Jauns tips',
        'New account created. Sent Login-Account to %s.' => 'Izveidots jauns lietotāja konts. Konta dati nosūtīti uz %s.',
        'New messages' => 'Jauni ziņojumi',
        'New password again' => 'Jaunā parole vēlreiz',
        'Next Week' => 'nākamā nedēļa',
        'No * possible!' => '"*" nav iespējama!',
        'No Packages for requested Framework in this Online Repository, but Packages for other Frameworks!' =>
            'Pieprasītajai struktūrai (framework) nav pakotņu šajā tiešsaistes repozitorijā, bet ir pakotnes citām struktūrām.',
        'No Packages or no new Packages in selected Online Repository!' =>
            'Izvēlētajā tiešsaistes repozitorijā nav pakotņu vai nav jaunu pakotņu!',
        'No Permission' => 'Nav tiesību',
        'No time settings.' => 'Nav laika iestatījumu.',
        'Node-Address' => 'Mezgla adrese',
        'Node-Name' => 'Mezgla nosaukums',
        'Note Text' => 'Piezīmes teksts',
        'Notification (Customer)' => 'Paziņojums (klienta)',
        'Notification (Event)' => 'Paziņojums (notikums)',
        'Notifications' => 'Paziņojumi',
        'OTRS DB Password' => 'OTRS datubāzes parole',
        'OTRS sends an notification email to the customer if the ticket is moved.' =>
            'Ja pieteikums tiks pārvietots, OTRS problēmu pieteikumu sistēma nosūtīs klientam e-pasta paziņojumu.',
        'OTRS sends an notification email to the customer if the ticket owner has changed.' =>
            'Ja  tiks mainīts pieteikuma īpašnieks, OTRS problēmu pieteikumu sistēma nosūtīs klientam e-pasta paziņojumu.',
        'OTRS sends an notification email to the customer if the ticket state has changed.' =>
            'Ja tiks mainīts pieteikuma statuss, OTRS problēmu pieteikumu sistēma nosūtīs klientam e-pasta paziņojumu.',
        'Object already linked as %s.' => 'Objekts jau piesaistīts kā %s.',
        'Of couse this feature will take some system performance it self!' =>
            'Protams, šis iestatījums prasīs sistēmas resursus.',
        'Only for ArticleCreate Event.' => 'Tikai ziņojuma izveidošanas notikumam.',
        'Open Tickets' => 'Atvērtie pieteikumi',
        'Options of the current customer user data (e. g. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)' =>
            'Tekošā klienta datu iestatījumi (piem. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;).',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>)' =>
            'Tekošā klienta datu iestatījumi (piem. <OTRS_CUSTOMER_DATA_UserFirstname>)',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>).' =>
            'Tekošā klienta dati (piem. <OTRS_CUSTOMER_DATA_UserFirstname>)',
        'Options of the current user who requested this action (e. g. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)' =>
            'Darbības pieprasītāja lietotāja iestatījumi (piem. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>)' =>
            'Darbības pieprasītāja lietotāja iestatījumi (piem. <OTRS_CURRENT_UserFirstname>)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>).' =>
            'Darbības pieprasītāja lietotāja dati (piem. <OTRS_CURRENT_UserFirstname).',
        'Options of the ticket data (e. g. &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)' =>
            'Pieteikuma iestatījumi (piem. &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)',
        'Options of the ticket data (e. g. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Pieteikuma iestatījumi(piem. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Pieteikuma datu iestatījumi (piem. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).' =>
            'Pieteikuma īpašību dati (piem. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).',
        'Other Options' => 'Citas iespējas',
        'Out Of Office' => 'Ārpus biroja',
        'POP3 Account Management' => 'POP3 kontu pārvaldība',
        'Package' => 'Pakotne',
        'Package not correctly deployed! You should reinstall the Package again!' =>
            'Programmatūras pakotne nav korekti pievienota! Nepieciešams pārinstalēt programmatūras pakotni!',
        'Param 1' => 'Parametrs 1',
        'Param 2' => 'Parametrs 2',
        'Param 3' => 'Parametrs 3',
        'Param 4' => 'Parametrs 4',
        'Param 5' => 'Parametrs 5',
        'Param 6' => 'Parametrs 6',
        'Parent-Object' => '\'Vecāku\' objekts',
        'Password is already in use! Please use an other password!' => 'Šī parole jau tiek izmantota, lūdzu izmantojiet citu paroli!',
        'Password is already used! Please use an other password!' => 'Šī parole jau ir tikusi izmantota, lūdzu izmantojiet citu paroli!',
        'Passwords doesn\'t match! Please try it again!' => 'Paroles nesakrīt! Lūdzu, mēģiniet vēlreiz!',
        'Pending Times' => 'Izlemšanas laiki',
        'Pending messages' => 'Neizlemtie pieteikumi',
        'Pending type' => 'Neizlemts: tips',
        'Permission settings. You can select one or more groups to make the configurated stat visible for different agents.' =>
            'Tiesības: Ir iespējams izvēlēties vienu vai vairākas grupas lai izveidotā atskaite būtu pieejama dažādiem aģentiem.',
        'Permissions to change the ticket owner in this group/queue.' => 'Tiesības mainīt pieteikuma īpašnieku šajā grupā/rindā.',
        'PhoneView' => 'Telefonu saraksts',
        'Please contact your admin' => 'Lūdzu sazinieties ar sistēmas administratoru',
        'Print this ticket!' => 'Drukāt šo pieteikumu!',
        'Prio' => 'Prioritāte',
        'Process-Path' => 'Procesa ceļš',
        'Product' => 'Produkts(i)',
        'Queue <-> Auto Responses Management' => 'Rindu <-> Automātisko atbilžu pārvaldība',
        'Queue Management' => 'Rindu pārvaldība',
        'Realname' => 'Īstais vārds',
        'Rebuild' => 'Pārbūvēt',
        'Recipients' => 'Saņēmēji',
        'Reminder' => 'Atgādinājumi',
        'Reminder messages' => 'Atgādinājuma paziņojumi',
        'Reporter' => 'Ziņotājs',
        'Required Field' => 'Obligātais lauks',
        'Response Management' => 'Atbilžu pārvaldība',
        'Responses <-> Attachments Management' => 'Atbilžu <-> Pielikumu pārvaldība',
        'Responses <-> Queue' => 'Atbildes <-> Rindas',
        'Responses <-> Queue Management' => 'Atbilžu <-> Rindu pārvaldība',
        'Return to the compose screen' => 'Atgriezties ziņojuma sastādīšanas logā',
        'Role' => 'Loma',
        'Roles <-> Groups Management' => 'Lomu <-> Grupu pārvaldība',
        'Roles <-> Users' => 'Lomas <-> Lietotāji',
        'Roles <-> Users Management' => 'Lomu <-> Lietotāju pārvaldība',
        'Save Job as?' => 'Saglabāt uzdevumu kā...',
        'Save Search-Profile as Template?' => 'Vai saglabāt meklēšanas profilu kā sagatavi?',
        'Schedule' => 'Grafiks',
        'Search Result' => 'Meklēšanas rezultāti',
        'Search for' => 'Meklēt pēc',
        'Secure Mode need to be enabled!' => 'Drošajam režīmam (Secure Mode) ir jābūt ieslēgtam!',
        'Select Box' => 'Atlases lauks',
        'Select Box Result' => 'Pieprasījuma rezultātu logs',
        'Select Source (for add)' => 'Izvēlēties avotu (pievienošanai)',
        'Select the customeruser:service relations.' => 'Iestatīt klienta lietotājvārda:servisa attiecības.',
        'Select the element, which will be used at the X-axis' => 'Izvēlieties X-asij izmantojamo elementu.',
        'Select the restrictions to characterise the stat' => 'Izvēlieties ierobežojumus lai raksturotu šo statistikas pārskatu',
        'Select the role:user relations.' => 'Atzīmējiet lomas:lietotāja sakarības.',
        'Select the user:group permissions.' => 'Izvēlēties lietotāju:grupu tiesības.',
        'Select your QueueView refresh time.' => 'Izvēlieties, cik bieži pārlasīt rindas skatu (pieteikumu sarakstus).',
        'Select your default spelling dictionary.' => 'Izvēlieties noklusēto pareizrakstības pārbaudes vārdnīcu.',
        'Select your frontend Charset.' => 'Izvēlieties interfeisa rakstzīmju kodējumu.',
        'Select your frontend QueueView.' => 'Izvēlieties interfeisa rindas skata (pieteikumu saraksta) izskatu.',
        'Select your frontend language.' => 'Izvēlieties interfeisa valodu.',
        'Select your out of office time.' => 'Iestatiet laiku, kurā neatrodieties birojā.',
        'Select your screen after creating a new ticket.' => 'Izvēlieties ekrāna izskatu pēc jauna pieteikuma izveidošanas.',
        'Selection needed' => 'Jāizvēlas',
        'Send Notification' => 'Sūtīt paziņojumu',
        'Send me a notification of an watched ticket like an owner of an ticket.' =>
            'Nosūtīt man vērotā pieteikuma paziņojumu kā pieteikuma īpašniekam.',
        'Sent new password to: ' => 'Nosutīt jauno paroli uz: ',
        'Sent new password to: %s' => 'Jaunā parole nosūtīta uz %s.',
        'Sent password token to: %s' => 'Paroles maiņas piekļuves pilnvara nosūtīta uz %s.',
        'Service-Name' => 'Servisa nosaukums',
        'Sessions' => 'sesijas',
        'Set customer user and customer id of a ticket' => 'Izvēlēties pieteikuma klientu un klienta identifikatoru',
        'Set this ticket to pending!' => 'Iestatīt šim pieteikumam statusu \'neizlemts\'!',
        'Show' => 'Rādīt',
        'Shows the ticket history!' => 'Parādīt problēmas pieteikuma vēsturi!',
        'Site' => 'Vieta',
        'Solution' => 'Risinājums',
        'Sort by' => 'Kārtot pēc',
        'Source' => 'Dati no',
        'Spell Check' => 'Pareizrakstības pārbaude',
        'Split' => 'Sadalīt',
        'State Type' => 'Statusa tips',
        'Static-File' => 'Statiskais fails (datne)',
        'Stats-Area' => 'Statistikas sadaļa',
        'Sub-Queue of' => 'apakšrinda',
        'Sub-Service of' => 'Kā apakšservisu',
        'Subscribe' => 'Parakstīties',
        'System State Management' => 'Sistēmas statusa pārvaldība',
        'System Status' => 'Systēmas statuss',
        'Systemaddress' => 'Sistēmas adrese',
        'Take care that you also updated the default states in you Kernel/Config.pm!' =>
            'Neaizmirstiet izlabot noklusētos statusus Kernel/Config.pm failā!',
        'The message being composed has been closed.  Exiting.' => 'Aktīvais ziņojums ir ticis aizvērts. Izejam.',
        'This account exists.' => 'Šāds lietotāja konts eksistē.',
        'This is useful if you want that no one can get the result of the stat or the stat isn\'t ready configurated.' =>
            'Noderīgi, ja vēlaties, lai neviens nevarētu izmantot atskaites rezultātus vai atskaites konfigurēšana vēl nav pabeigta.',
        'This values are read only.' => 'Šīs vērtības ir pieejamas tikai lasīšanai.',
        'This values are required.' => 'Šīs vērtības ir obligātas (jāaizpilda obligāti).',
        'This window must be called from compose window' => 'Šis logs jāizsauc no ziņojuma sastādīšanas loga',
        'Ticket Lock' => 'Pieteikuma slēgšanas pazīme',
        'Ticket Number Generator' => 'Pieteikumu identifikatoru ģenerators',
        'Ticket Search' => 'Meklēt pieteikumus',
        'Ticket Status View' => 'Pieteikuma statusa skats',
        'Ticket Type is required!' => 'Pieteikuma tips ir obligāts!',
        'Ticket escalation!' => 'Pieteikumu eskalācija!',
        'Ticket locked!' => 'Pieteikums aizslēgts!',
        'Ticket owner options (e. g. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)' =>
            'Pieteikuma īpašnieka iestatījumi (piem. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>)' => 'Pieteikuma īpašnieka datu iestatījumi (piem. <OTRS_OWNER_UserFirstname>)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>).' => 'Pieteikuma īpašnieka dati (piem. <OTRS_OWNER_UserFirstname>).',
        'Ticket responsible options (e. g. <OTRS_RESPONSIBLE_UserFirstname>).' =>
            'Pieteikuma atbildes dati (piem. <OTRS_RESPONSIBLE_UserFirstname>).',
        'Ticket selected for bulk action!' => 'Pieteikums izvēlēts kopīgai apstrādei!',
        'Ticket unlock!' => 'Pieteikums atslēgts!',
        'Ticket-Area' => 'Pieteikumu sadaļa',
        'TicketFreeFields' => 'Pieteikuma neaizpildītie lauki',
        'TicketFreeText' => 'Pieteikuma brīvais teksts',
        'TicketZoom' => 'Atvērt pieteikumu',
        'Tickets available' => 'Pieejamie pieteikumi',
        'Tickets shown' => 'Parādītie pieteikumi',
        'Tickets which need to be answered!' => 'Pieteikumi, uz kuriem nepieciešams atbildēt',
        'Timeover' => 'Laika periods',
        'Times' => 'Laiki',
        'Title of the stat.' => 'Statistikas atskaites nosaukums.',
        'To enable automatic execusion select at least one value form minutes, hours and days!' =>
            'Lai iestatītu automātisku izpildi, izvēlieties vismaz vienu vērtību no minūtēm, stundām un dienām!',
        'To get the article attribute (e. g. (<OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).' =>
            'Lai saņemtu ziņojuma atribūtus (piem. <OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> un <OTRS_AGENT_Body>).',
        'To get the article attribute (e. g. (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).' =>
            'Lai saņemtu pieteikuma atribūtus (piem. (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> un <OTRS_CUSTOMER_Body>).',
        'Top of Page' => 'Lapas augša',
        'Total hits' => 'Kopējais daudzums',
        'U' => 'U',
        'Unable to parse Online Repository index document!' => 'Nav iespējams caurlūkot tiešsaistes repozitorija indeksu!',
        'Uniq' => 'Unikāli',
        'Unlock Tickets' => 'Atslēgt pieteikumus',
        'Unlock to give it back to the queue!' => 'Atslēgt pieteikumu lai varētu to atgriezt atpakaļ rindā!',
        'Unsubscribe' => 'Beigt parakstīšanos',
        'Use utf-8 it your database supports it!' => 'Izmantojiet utf-8 kodējumu, ja to uztur datubāze!',
        'Useable options' => 'Izmantojamie iestatījumi',
        'User Management' => 'Lietotāju pārvaldība',
        'User will be needed to handle tickets.' => 'Lai apstrādātu pieteikumus, nepieciešams lietotājs.',
        'User-Name' => 'Lietotājvārds',
        'User-Number' => 'Lietotāja identifikators',
        'Users' => 'Lietotāji',
        'Users <-> Groups' => 'Lietotāji <-> Grupas',
        'Users <-> Groups Management' => 'Lietotāju <-> Grupu pārvaldība',
        'Warning! This tickets will be removed from the database! This tickets are lost!' =>
            'Brīdinājums! Šie pieteikumi tiks dzēsti no datubāzes! Pieteikumi tiks zaudēti!',
        'Watch notification' => 'Vērošanas paziņojums',
        'Web-Installer' => 'Instalācija no interneta pārlūka',
        'Welcome to OTRS' => 'Lūdzam OTRS problēmu pieteikumu sistēmā',
        'With an invalid stat it isn\'t feasible to generate a stat.' => 'Ar nederīgu atskaiti nav iespējams izveidot jaunu atskaiti.',
        'With the input and select fields you can configurate the stat at your needs. Which elements of a stat you can edit depends on your stats administrator who configurated the stat.' =>
            'Ar ievades un izvēlētajiem laukiem var konfigurēt atskaiti pēc nepieciešamības. No administratora, kurš konfigurējis atskaiti, būs atkarīgs, kādus elementus varēs labot.',
        'Workflow Groups' => 'Darbplūsmas grupas',
        'Yes, save it with name' => 'Jā, saglabāt ar nosaukumu',
        'You got new message!' => 'Jums ir jauns ziņojums!',
        'You need a email address (e. g. customer@example.com) in To:!' =>
            'Kam: laukā nepieciešama e-pasta adrese (piem. klients@piemeram.lv)!',
        'You need min. one selected Ticket!' => 'Jāizvēlas vismaz viens pieteikums!',
        'You need to account time!' => 'Nepieciešams uzskaitīt laiku!',
        'You need to activate %s first to use it!' => 'Lai to izmantotu, vispirms jāaktivizē %s!',
        'You use the DELETE option! Take care, all deleted Tickets are lost!!!' =>
            'Šis iestatījums DZĒŠ datus! Esiet uzmanīgi, visi nodzēstie pieteikumi tiks neatgriezeniski zaudēti!',
        'Your email address is new' => 'Jūsu e-pasta adrese ir jauna',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Jūsu e-pasts ar pieteikuma numuru "<OTRS_TICKET>" ir pārcelts pie "<OTRS_BOUNCE_TO>". Papildinformāciju, lūdzu, jautājiet norādītajā adresē.',
        'Your own Ticket' => 'Jūsu pieteikums',
        'customer realname' => 'klienta vārds',
        'down' => 'dilstoša',
        'false' => 'aplams',
        'for agent firstname' => 'aģenta vārdam',
        'for agent lastname' => 'aģenta uzvārdam',
        'for agent login' => 'aģenta pieteikumam sistēmā',
        'for agent user id' => 'aģenta lietotāja identifikatoram',
        'kill all sessions' => 'apturēt visas sesijas',
        'kill session' => 'Apturēt sesiju',
        'modified' => 'mainīts',
        'new ticket' => 'jauns pieteikums',
        'next step' => 'nākamais solis',
        'not rated' => 'nav vērtējuma',
        'not verified' => 'nav pārbaudīts',
        'read' => 'lasīts(i)',
        'send' => 'nosutīt',
        'sort downward' => 'kārtot dilstošā secībā',
        'sort upward' => 'kārtot pieaugošā secībā',
        'tmp_lock' => 'pagaidu slēgšana',
        'to get the first 20 character of the subject' => 'lai parādītu ziņojuma tēmas pirmos 20 simbolus',
        'to get the first 5 lines of the email' => 'lai parādītu pirmās piecas e-pasta ziņojuma rindiņas',
        'to get the from line of the email' => 'lai parādītu e-pasta No: rindiņu',
        'to get the realname of the sender (if given)' => 'lai izmantotu nosūtītāja īsto vārdu (ja ir norādīts)',
        'unknown' => 'nezināms',
        'unread' => 'nelasīts(i)',
        'up' => 'augoša',
        'utf8' => 'utf8',
        'verified' => 'pārbaudījis',
        'x' => 'x',

    };
    # $$STOP$$
    return;
}

1;
