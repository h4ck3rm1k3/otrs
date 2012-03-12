# --
# Kernel/Language/it.pm - provides it language translation
# Copyright (C) 2003,2008 Remo Catelotti <Remo.Catelotti at eutelia.it>
# Copyright (C) 2003 Gabriele Santilli <gsantilli at omnibus.net>
# Copyright (C) 2005,2009 Giordano Bianchi <giordano.bianchi at gmail.com>
# Copyright (C) 2009 Remo Catelotti <Remo.Catelotti at agilesistemi.com>
# Copyright (C) 2009 Emiliano Coletti <e.coletti at gmail.com>
# Copyright (C) 2009 Alessandro Faraldi <faraldia at gmail.com>
# Copyright (C) 2010 Alessandro Grassi <alessandro.grassi at devise.it>
# --
# $Id: it.pm,v 1.129 2012/03/01 13:25:08 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::it;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.129 $) [1];

sub Data {
    my $Self = shift;

    # $$START$$
    # Last translation file sync: 2012-03-01 14:20:06

    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D/%M/%Y %T';
    $Self->{DateFormatLong}      = '%A %D %B %Y %T';
    $Self->{DateFormatShort}     = '%D/%M/%Y';
    $Self->{DateInputFormat}     = '%D/%M/%Y';
    $Self->{DateInputFormatLong} = '%D/%M/%Y - %T';

    # csv separator
    $Self->{Separator} = '';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Sì',
        'No' => '',
        'yes' => 'sì',
        'no' => '',
        'Off' => 'Spento',
        'off' => 'spento',
        'On' => 'Acceso',
        'on' => 'acceso',
        'top' => 'inizio pagina',
        'end' => 'fine pagina',
        'Done' => 'Fatto',
        'Cancel' => 'Annulla',
        'Reset' => 'Ripristina',
        'last' => 'ultimo',
        'before' => 'precedente',
        'Today' => 'Oggi',
        'Tomorrow' => 'Domani',
        'Next week' => '',
        'day' => 'giorno',
        'days' => 'giorni',
        'day(s)' => 'giorno(i)',
        'd' => '',
        'hour' => 'ora',
        'hours' => 'ore',
        'hour(s)' => 'ora(e)',
        'Hours' => 'Ore',
        'h' => '',
        'minute' => 'minuto',
        'minutes' => 'minuti',
        'minute(s)' => 'minuto(i)',
        'Minutes' => 'Minuti',
        'm' => '',
        'month' => 'mese',
        'months' => 'mesi',
        'month(s)' => 'mese(i)',
        'week' => 'settimana',
        'week(s)' => 'settimana(e)',
        'year' => 'anno',
        'years' => 'anni',
        'year(s)' => 'anno(i)',
        'second(s)' => 'secondo(i)',
        'seconds' => 'secondi',
        'second' => 'secondo',
        's' => '',
        'wrote' => 'ha scritto',
        'Message' => 'Messaggio',
        'Error' => 'Errore',
        'Bug Report' => 'Segnala anomalie',
        'Attention' => 'Attenzione',
        'Warning' => 'Attenzione',
        'Module' => 'Modulo',
        'Modulefile' => 'Archivio del modulo',
        'Subfunction' => 'Sotto-funzione',
        'Line' => 'Linea',
        'Setting' => 'Impostazione',
        'Settings' => 'Impostazioni',
        'Example' => 'Esempio',
        'Examples' => 'Esempi',
        'valid' => 'valido',
        'Valid' => 'Valido',
        'invalid' => 'non valido',
        'Invalid' => '',
        '* invalid' => ' * non valido',
        'invalid-temporarily' => 'non valido-temporaneamente',
        ' 2 minutes' => ' 2 minuti',
        ' 5 minutes' => ' 5 minuti',
        ' 7 minutes' => ' 7 minuti',
        '10 minutes' => '10 minuti',
        '15 minutes' => '15 minuti',
        'Mr.' => 'Sig',
        'Mrs.' => 'Sig.ra',
        'Next' => 'Prossimo',
        'Back' => 'Indietro',
        'Next...' => 'Prossimo...',
        '...Back' => '...indietro',
        '-none-' => '-nessuno-',
        'none' => 'nessuno',
        'none!' => 'nessuno!',
        'none - answered' => 'nessuna - risposta',
        'please do not edit!' => 'per favore non modificare!',
        'Need Action' => '',
        'AddLink' => 'Aggiungi link',
        'Link' => 'Collega',
        'Unlink' => 'Togli Collegamento',
        'Linked' => 'Collegato',
        'Link (Normal)' => 'Collega (Normale)',
        'Link (Parent)' => 'Collega (Genitore)',
        'Link (Child)' => 'Collega (Figlio)',
        'Normal' => 'Normale',
        'Parent' => 'Genitore',
        'Child' => 'Figlio',
        'Hit' => 'Accesso',
        'Hits' => 'Accessi',
        'Text' => 'Testo',
        'Standard' => '',
        'Lite' => 'Ridotta',
        'User' => 'Utente',
        'Username' => 'Nome utente',
        'Language' => 'Lingua',
        'Languages' => 'Lingue',
        'Password' => '',
        'Preferences' => 'Preferenze',
        'Salutation' => 'Titolo',
        'Salutations' => 'Titolo',
        'Signature' => 'Firma',
        'Signatures' => 'Firme',
        'Customer' => 'Cliente',
        'CustomerID' => 'Codice cliente',
        'CustomerIDs' => 'Codici Cliente',
        'customer' => 'cliente',
        'agent' => 'operatore',
        'system' => 'sistema',
        'Customer Info' => 'Informazioni Cliente',
        'Customer Information' => 'Informazioni Cliente',
        'Customer Company' => 'Azienda del Cliente',
        'Customer Companies' => 'Aziende dei Clienti',
        'Company' => 'Azienda',
        'go!' => 'vai!',
        'go' => 'vai',
        'All' => 'Tutti',
        'all' => 'tutti',
        'Sorry' => 'Spiacente',
        'update!' => 'aggiorna!',
        'update' => 'aggiorna',
        'Update' => 'Aggiorna',
        'Updated!' => 'Aggiornato',
        'submit!' => 'accetta!',
        'submit' => 'accetta',
        'Submit' => 'Accetta',
        'change!' => 'Modifica!',
        'Change' => 'Modifica',
        'change' => 'modifica',
        'click here' => 'clicca qui',
        'Comment' => 'Commento',
        'Invalid Option!' => 'Opzione non-valida',
        'Invalid time!' => 'ora non-valida',
        'Invalid date!' => 'data non-valida',
        'Name' => 'Nome',
        'Group' => 'Gruppo',
        'Description' => 'Descrizione',
        'description' => 'descrizione',
        'Theme' => 'Tema',
        'Created' => 'Creato',
        'Created by' => 'Creato da',
        'Changed' => 'Modificato',
        'Changed by' => 'Modificato da',
        'Search' => 'Cerca',
        'and' => 'e',
        'between' => 'tra',
        'Fulltext Search' => 'Ricerca Fulltext',
        'Data' => 'Dati',
        'Options' => 'Opzioni',
        'Title' => 'Titolo',
        'Item' => 'Oggetto',
        'Delete' => 'Cancella',
        'Edit' => 'Modifica',
        'View' => 'Vista',
        'Number' => 'Numero',
        'System' => 'Sistema',
        'Contact' => 'Contatto',
        'Contacts' => 'Contatti',
        'Export' => 'Esporta',
        'Up' => 'Su',
        'Down' => 'Giù',
        'Add' => 'Aggiungi',
        'Added!' => 'Aggiunto',
        'Category' => 'Categoria',
        'Viewer' => 'Visualizzatore',
        'Expand' => 'espandi',
        'Small' => 'Piccolo',
        'Medium' => 'Medio',
        'Large' => 'Grande',
        'Date picker' => 'Selezione data',
        'New message' => 'Nuovo messaggio',
        'New message!' => 'Nuovo messaggio!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Per favore rispondi a queste richieste prima di tornare alla lista!',
        'You have %s new message(s)!' => 'Hai %s nuovi messaggi!',
        'You have %s reminder ticket(s)!' => 'Hai %s Promemoria memorizzati',
        'The recommended charset for your language is %s!' => 'Il set di caratteri consigliato per la tua lingua è %s!',
        'Change your password.' => 'Cambia la tua password.',
        'Please activate %s first!' => 'Per favore, attivare %s prima!',
        'No suggestions' => 'Non ci sono suggerimenti',
        'Word' => 'Parola',
        'Ignore' => 'Ignora',
        'replace with' => 'sostituisci con',
        'There is no account with that login name.' => 'Nome utente non valido.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            'Login fallito! L\'username o la password sono errati.',
        'There is no acount with that user name.' => 'Non esistono account con questo username.',
        'Please contact your administrator' => 'Si prega di contattare l\'amministratore',
        'Logout' => 'Esci',
        'Logout successful. Thank you for using OTRS!' => 'Disconnessione avvenuta con successo. Grazie per aver usato OTRS!',
        'Invalid SessionID!' => 'ID di sessione non valido!',
        'Feature not active!' => 'Funzione non attiva!',
        'Agent updated!' => 'Agente aggiornato!',
        'Create Database' => 'Crea database ',
        'System Settings' => 'Impostazioni di sistema',
        'Mail Configuration' => 'Configurazione della posta',
        'Finished' => 'Operazione terminata',
        'Install OTRS' => '',
        'Intro' => '',
        'License' => 'Licenza',
        'Database' => '',
        'Configure Mail' => '',
        'Database deleted.' => '',
        'Database setup succesful!' => '',
        'Login is needed!' => 'Devi fare il login',
        'Password is needed!' => 'La password è richiesta',
        'Take this Customer' => 'Prendi questo Cliente',
        'Take this User' => 'Prendi questo Utente',
        'possible' => 'possibile',
        'reject' => 'respingi',
        'reverse' => 'inverti',
        'Facility' => 'Funzione',
        'Time Zone' => 'Fuso orario',
        'Pending till' => 'In attesa per',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            '',
        'Dispatching by email To: field.' => 'Smistamento in base al campo A:.',
        'Dispatching by selected Queue.' => 'Smistamento in base alla coda selezionata.',
        'No entry found!' => 'Vuoto!',
        'Session has timed out. Please log in again.' => 'Sessione scaduta. Per favore, effettua di nuovo l\'accesso.',
        'No Permission!' => 'Permessi insufficienti',
        'To: (%s) replaced with database email!' => 'A: (%s) sostituito con l\'indirizzo presente nel database',
        'Cc: (%s) added database email!' => 'Cc: (%s) aggiunto nel db email!',
        '(Click here to add)' => '(clicca per aggiungere)',
        'Preview' => 'Anteprima',
        'Package not correctly deployed! Please reinstall the package.' =>
            '',
        '%s is not writable!' => '%s non è scrivibile!',
        'Cannot create %s!' => 'Impossibile creare %s!',
        'Check to activate this date' => '',
        'You have Out of Office enabled, would you like to disable it?' =>
            '',
        'Customer %s added' => 'Cliente %s aggiunto',
        'Role added!' => 'Ruolo aggiunto!',
        'Role updated!' => 'Ruolo aggiornato!',
        'Attachment added!' => 'Allegato aggiunto!',
        'Attachment updated!' => 'Allegato aggiornato!',
        'Response added!' => 'Risposta aggiunta!',
        'Response updated!' => 'Risposta aggiornata!',
        'Group updated!' => 'Gruppo aggiornato!',
        'Queue added!' => 'Coda aggiunta!',
        'Queue updated!' => 'Coda aggiornata!',
        'State added!' => 'Stato aggiunto!',
        'State updated!' => 'Stato aggiornato!',
        'Type added!' => 'Tipo aggiunto!',
        'Type updated!' => 'Tipo aggiornato!',
        'Customer updated!' => 'Cliente aggiornato!',
        'Customer company added!' => '',
        'Customer company updated!' => '',
        'Mail account added!' => '',
        'Mail account updated!' => '',
        'System e-mail address added!' => '',
        'System e-mail address updated!' => '',
        'Contract' => 'Contratto',
        'Online Customer: %s' => 'Clienti collegati: %s',
        'Online Agent: %s' => 'Operatori collegati: %s',
        'Calendar' => 'Calendario',
        'File' => '',
        'Filename' => 'Nome file',
        'Type' => 'Tipo',
        'Size' => 'Dimensione',
        'Upload' => 'Caricamento',
        'Directory' => 'Cartella',
        'Signed' => 'Firmato',
        'Sign' => 'Firma',
        'Crypted' => 'Crittografato',
        'Crypt' => 'Crittografa',
        'PGP' => '',
        'PGP Key' => 'Chiave PGP',
        'PGP Keys' => 'Chiavi PGP',
        'S/MIME' => '',
        'S/MIME Certificate' => 'Certificato S/MIME',
        'S/MIME Certificates' => 'Certificati S/MIME',
        'Office' => 'Ufficio',
        'Phone' => 'Telefono',
        'Fax' => '',
        'Mobile' => 'Cellulare',
        'Zip' => 'CAP',
        'City' => 'Citta',
        'Street' => 'Via',
        'Country' => 'Stato',
        'Location' => 'Sede',
        'installed' => 'Installato',
        'uninstalled' => 'Disistallato',
        'Security Note: You should activate %s because application is already running!' =>
            'Dovresti attivare  %s perche\' l\' applicativo e\' in esecuzione !',
        'Unable to parse repository index document.' => 'Impossibile analizzare l\'indice dei repository.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'Non esistono pacchetti per la vostra versione del framework in questo repository, ne sono contenuti solo per altre versioni.',
        'No packages, or no new packages, found in selected repository.' =>
            'Nessun pacchetto, o nessun pacchetto nuovo è stato trovato nel repository selezionato.',
        'Edit the system configuration settings.' => 'Modifica le impostazioni di sistema.',
        'printed at' => 'Stampato il ',
        'Loading...' => 'Caricamento...',
        'Dear Mr. %s,' => 'Spettabile  sig. %s',
        'Dear Mrs. %s,' => 'Spettabile sig.ra %s',
        'Dear %s,' => 'Spettabile %s',
        'Hello %s,' => 'Salve %s , ',
        'This email address already exists. Please log in or reset your password.' =>
            'Questo indirizzo email è già esistente. Per favore effettuare il login o reimpostare la password.',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Nuovo account creato. Inviate le informazioni di login a %s. Si prega di controllare l\'email.',
        'Please press Back and try again.' => 'Prego tornare in dietro a riprovare .',
        'Sent password reset instructions. Please check your email.' => 'Inviate istruzioni per il reset della password. Si prega di controllare l\'email.',
        'Sent new password to %s. Please check your email.' => 'Inviata nuova password a %s. Si prega di controllare l\'email.',
        'Upcoming Events' => 'Eventi in arrivo',
        'Event' => 'Evento',
        'Events' => 'Eventi',
        'Invalid Token!' => 'Striga Invalida',
        'more' => 'di più',
        'For more info see:' => 'Per maggior informazioni vedi:',
        'Package verification failed!' => 'Verifica del pacchetto fallita! ',
        'Collapse' => 'Collassa',
        'Shown' => 'Visualizzati',
        'News' => 'Notizie',
        'Product News' => 'Notizie Prodotto',
        'OTRS News' => 'Notizie OTRS',
        '7 Day Stats' => 'Statistiche 7 Giorni',
        'Bold' => 'Grassetto',
        'Italic' => 'Corsivo',
        'Underline' => 'Sottolinea',
        'Font Color' => 'Colore Carattere',
        'Background Color' => 'Colore sfondo',
        'Remove Formatting' => 'Togli la formattazione',
        'Show/Hide Hidden Elements' => 'Mostra/Nascondi Elementi nascosti',
        'Align Left' => 'Allinea a sinistra',
        'Align Center' => 'Allinea in centro',
        'Align Right' => 'Allinea a destra',
        'Justify' => 'Giustifica',
        'Header' => 'Intestazione (header)',
        'Indent' => 'Indentazione',
        'Outdent' => 'Non Indentazione ',
        'Create an Unordered List' => 'Crea una lista Disordinata',
        'Create an Ordered List' => 'Crea una lista Ordinata',
        'HTML Link' => 'Collegamento HTML',
        'Insert Image' => 'Inserisci Immagine',
        'CTRL' => '',
        'SHIFT' => '',
        'Undo' => 'Annulla',
        'Redo' => 'Ripeti',
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
        'Jan' => 'Gen',
        'Feb' => '',
        'Mar' => '',
        'Apr' => '',
        'May' => 'Mag',
        'Jun' => 'Giu',
        'Jul' => 'Lug',
        'Aug' => 'Ago',
        'Sep' => 'Set',
        'Oct' => 'Ott',
        'Nov' => '',
        'Dec' => 'Dic',
        'January' => 'Gennaio',
        'February' => 'Febbraio',
        'March' => 'Marzo',
        'April' => 'Aprile',
        'May_long' => 'Maggio',
        'June' => 'Giugno',
        'July' => 'Luglio',
        'August' => 'Agosto',
        'September' => 'Settembre',
        'October' => 'Ottobre',
        'November' => 'Novembre',
        'December' => 'Dicembre',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'Preferenze modificate con successo!',
        'User Profile' => 'Profilo utente',
        'Email Settings' => 'Impsotazioni email',
        'Other Settings' => 'Altre impostazioni',
        'Change Password' => 'Cambia Password',
        'Current password' => 'Password attuale',
        'New password' => 'Nuova Password',
        'Verify password' => 'Verifica password',
        'Spelling Dictionary' => 'Dizionario',
        'Default spelling dictionary' => 'Dizionario predefinito',
        'Max. shown Tickets a page in Overview.' => 'Numero massimo di richieste per pagina nel Sommario',
        'The current password is not correct. Please try again!' => 'La password corrente è errata. Riprovare!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Impossibile aggiornare la password, le password nuove non corrispondono. Si prega di riprovare!',
        'Can\'t update password, it contains invalid characters!' => 'Impossibile aggiornare la password, contiene caratteri non validi!',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Impossibile aggiornare la password, deve essere lunga almeno %s caratteri!',
        'Can\'t update password, it must contain at least 2 lowercase  and 2 uppercase characters!' =>
            'Impossibile aggiornare la password, deve avere almeno due lettere minuscole e due maiuscole!',
        'Can\'t update password, it must contain at least 1 digit!' => 'Impossibile aggiornare la password, deve contenere almeno un numero!',
        'Can\'t update password, it must contain at least 2 characters!' =>
            'Impossibile aggiornare la password, deve contenere almeno due caratteri!',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            'Impossibile aggiornare la password, questa password è stata già usata. Si prega di sceglierne un\'altra!',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Selezionare il carattere separatore usato nei file CSV (statistiche e ricerca). Se non viene selezionato un separatore, verrà usato il separatore predefinito per il vostro linguaggio.',
        'CSV Separator' => 'Separatore CSV',

        # Template: AAAStats
        'Stat' => '',
        'Sum' => 'Somma',
        'Please fill out the required fields!' => 'Prego compilare i campi richiesti!',
        'Please select a file!' => 'Prego selezionare un file',
        'Please select an object!' => 'Prego selezionare un oggetto',
        'Please select a graph size!' => 'Prego selezionare la dimensione del grafico',
        'Please select one element for the X-axis!' => 'Per favore selezionare un elemento come asse delle X ',
        'Please select only one element or turn off the button \'Fixed\' where the select field is marked!' =>
            'Prego selezionare un solo elemento, oppure togliere  \'Fixed\' dove sono marcati i campi ! ',
        'If you use a checkbox you have to select some attributes of the select field!' =>
            'Se usi il checkbox, devi decidere almeno un attributo per il campo selezionato!',
        'Please insert a value in the selected input field or turn off the \'Fixed\' checkbox!' =>
            'Prego inserire un valore nel campo selezionato oppure deseleziona \'Fixed\' nel checkbox!',
        'The selected end time is before the start time!' => 'Il tempo di fine precede  il tempo di partenza selezionato !',
        'You have to select one or more attributes from the select field!' =>
            'Devi selezionare uno o piu attributi per il campo !',
        'The selected Date isn\'t valid!' => 'Data selezionata  non valida!',
        'Please select only one or two elements via the checkbox!' => 'Seleziona uno o due elementi solo !',
        'If you use a time scale element you can only select one element!' =>
            'Se usi il tempo come scala di valori puoi selezionare un solo elemento !',
        'You have an error in your time selection!' => 'Esiste un errore nel tempo selezionato!',
        'Your reporting time interval is too small, please use a larger time scale!' =>
            'Intervallo per il report troppo piccolo , usa un tempo come intervallo maggiore !',
        'The selected start time is before the allowed start time!' => 'Il tempo iniziale precedente al tempo iniziale ammesso ',
        'The selected end time is after the allowed end time!' => 'tempo finale segue il tempo finale ammesso!',
        'The selected time period is larger than the allowed time period!' =>
            'Intervallo di troppo grande del periodo ammesso!',
        'Common Specification' => 'Specifiche comuni',
        'X-axis' => 'Asse X',
        'Value Series' => 'Serie di valori',
        'Restrictions' => 'Restrizioni-filtro',
        'graph-lines' => 'grafico-linea',
        'graph-bars' => 'grafico-barra',
        'graph-hbars' => 'grafico-barra-oriz',
        'graph-points' => 'grafico-punti',
        'graph-lines-points' => 'grafico-linee-punti',
        'graph-area' => 'grafico-area',
        'graph-pie' => 'grafico-torta',
        'extended' => 'esteso',
        'Agent/Owner' => 'Agente/Proprietario',
        'Created by Agent/Owner' => 'Creato da Agente/Proprietario',
        'Created Priority' => 'Priorita ',
        'Created State' => 'Stato ticket',
        'Create Time' => 'Tempo di Creazione',
        'CustomerUserLogin' => 'Login Utente Cliente',
        'Close Time' => 'Tempo di Chiusura',
        'TicketAccumulation' => 'Accumulo Ticket',
        'Attributes to be printed' => 'Attributi sa stampare',
        'Sort sequence' => 'Sequeza di ordinamento',
        'Order by' => 'Ordinati per ',
        'Limit' => 'Limite',
        'Ticketlist' => 'Lista Tickets',
        'ascending' => 'Crescente',
        'descending' => 'Decrescente',
        'First Lock' => 'Prima presa in carico',
        'Evaluation by' => 'Valutato da',
        'Total Time' => 'Tempo totale',
        'Ticket Average' => 'Media Ticket',
        'Ticket Min Time' => 'Max Tempo Ticket',
        'Ticket Max Time' => 'Min Tempo Ticket',
        'Number of Tickets' => 'Numero dei Tickets',
        'Article Average' => 'Media Articolo',
        'Article Min Time' => 'Min Tempo Articolo',
        'Article Max Time' => 'Max Tempo Articolo',
        'Number of Articles' => 'Numero di Articoli',
        'Accounted time by Agent' => 'Tempo allocato dall\'agente',
        'Ticket/Article Accounted Time' => 'Ticket/Tempo allocato',
        'TicketAccountedTime' => 'TempoAllocatoTicket',
        'Ticket Create Time' => 'Tempo di creazione Tickets',
        'Ticket Close Time' => 'Tempo di chiusura Tickets',

        # Template: AAATicket
        'Status View' => 'Visualizzazione Stato',
        'Bulk' => 'Blocco',
        'Lock' => 'Preso in gestione',
        'Unlock' => 'Libero',
        'History' => 'Storico',
        'Zoom' => 'Dettagli',
        'Age' => 'Tempo trascorso',
        'Bounce' => 'Rispedisci al mittente',
        'Forward' => 'Inoltra',
        'From' => 'Da',
        'To' => 'A',
        'Cc' => '',
        'Bcc' => '',
        'Subject' => 'Oggetto',
        'Move' => 'Sposta',
        'Queue' => 'Coda',
        'Queues' => 'Code',
        'Priority' => 'Priorità',
        'Priorities' => 'Priorità',
        'Priority Update' => 'Aggiornamento Priorità',
        'Priority added!' => '',
        'Priority updated!' => '',
        'Signature added!' => '',
        'Signature updated!' => '',
        'SLA' => '',
        'Service Level Agreement' => '',
        'Service Level Agreements' => '',
        'Service' => 'Servizio',
        'Services' => 'Servizi',
        'State' => 'Stato',
        'States' => 'Stati',
        'Status' => 'Stato',
        'Statuses' => 'Stati',
        'Ticket Type' => 'Tipo ticket',
        'Ticket Types' => 'Tipi ticket',
        'Compose' => 'Componi',
        'Pending' => 'In attesa',
        'Owner' => 'Operatore',
        'Owner Update' => 'Aggiornamento Operatore',
        'Responsible' => 'Responsabile',
        'Responsible Update' => 'Aggiornamento Responsabile',
        'Sender' => 'Mittente',
        'Article' => 'Articolo',
        'Ticket' => 'Richiesta',
        'Createtime' => 'Istante di creazione',
        'plain' => 'diretto',
        'Email' => '',
        'email' => '',
        'Close' => 'Chiudi',
        'Action' => 'Azione',
        'Attachment' => 'Allegato',
        'Attachments' => 'Allegati',
        'This message was written in a character set other than your own.' =>
            'Questo messaggio è stato scritto in un set di caratteri diverso dal tuo.',
        'If it is not displayed correctly,' => 'Se non è visualizzato correttamente,',
        'This is a' => 'Questo è un',
        'to open it in a new window.' => 'per aprire in una nuova finestra.',
        'This is a HTML email. Click here to show it.' => 'Questa è una email in HTML. Clicca qui per visualizzarla.',
        'Free Fields' => 'Campi Liberi',
        'Merge' => 'Unisci',
        'merged' => 'unito',
        'closed successful' => 'chiuso con successo',
        'closed unsuccessful' => 'chiuso senza successo',
        'Locked Tickets Total' => 'Totale ticket presi in carico',
        'Locked Tickets Reminder Reached' => 'Ticket presi in carico con reminder raggiunto',
        'Locked Tickets New' => 'Nuovi ticket presi in carico',
        'Responsible Tickets Total' => 'Totale Ticket Responsabili',
        'Responsible Tickets New' => 'Nuovi Ticket Responsabili',
        'Responsible Tickets Reminder Reached' => 'Ticket responsabili con reminder raggiunto',
        'Watched Tickets Total' => 'Totale ticket osservati',
        'Watched Tickets New' => 'Nuovi ticket osservati',
        'Watched Tickets Reminder Reached' => 'Ticket osservati con reminder raggiunto',
        'All tickets' => 'Richieste totali',
        'Available tickets' => '',
        'Escalation' => '',
        'last-search' => '',
        'QueueView' => 'Lista Richieste',
        'Ticket Escalation View' => 'Vista gestione Ticket',
        'Message from' => '',
        'End message' => '',
        'Forwarded message from' => '',
        'End forwarded message' => '',
        'new' => 'nuovo',
        'open' => 'aperto',
        'Open' => 'aperto',
        'Open tickets' => '',
        'closed' => 'chiuso',
        'Closed' => 'Chiuso',
        'Closed tickets' => '',
        'removed' => 'rimosso',
        'pending reminder' => 'in attesa di promemoria',
        'pending auto' => '',
        'pending auto close+' => 'in attesa di chiusura automatica+',
        'pending auto close-' => 'in attesa di chiusura automatica-',
        'email-external' => 'Email esterna',
        'email-internal' => 'Email interna',
        'note-external' => 'Nota esterna',
        'note-internal' => 'Nota interna',
        'note-report' => 'Nota rapporto',
        'phone' => 'telefono',
        'sms' => '',
        'webrequest' => 'richiesta da web',
        'lock' => 'preso in gestione',
        'unlock' => 'libero',
        'very low' => 'molto basso',
        'low' => 'basso',
        'normal' => 'normale',
        'high' => 'alto',
        'very high' => 'molto alto',
        '1 very low' => '1 molto bassa',
        '2 low' => '2 bassa',
        '3 normal' => '3 normale',
        '4 high' => '4 alta',
        '5 very high' => '5 molto alta',
        'auto follow up' => '',
        'auto reject' => '',
        'auto remove' => '',
        'auto reply' => '',
        'auto reply/new ticket' => '',
        'Ticket "%s" created!' => 'Richiesta "%s" creata!',
        'Ticket Number' => 'Numero Richiesta',
        'Ticket Object' => 'Oggetto Richiesta',
        'No such Ticket Number "%s"! Can\'t link it!' => 'Numero richiesta "%s" non presente! Collegamento impossibile!',
        'You don\'t have write access to this ticket.' => '',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            '',
        'Ticket selected.' => '',
        'Ticket is locked by another agent.' => '',
        'Ticket locked.' => '',
        'Don\'t show closed Tickets' => 'Non mostrare le richieste chiuse',
        'Show closed Tickets' => 'Mostra le richieste chiuse',
        'New Article' => 'Nuovo articolo',
        'Unread article(s) available' => 'Articoli non letti disponibili',
        'Remove from list of watched tickets' => 'Rimuovere dalla lista di ticket osservati',
        'Add to list of watched tickets' => 'Aggiungere alla lista di ticket osservati',
        'Email-Ticket' => 'Richiesta via Email',
        'Create new Email Ticket' => 'Crea una nuova richiesta via email',
        'Phone-Ticket' => 'Richiesta-Telefonica',
        'Search Tickets' => 'Ricerca Richieste',
        'Edit Customer Users' => 'Modifica Utenti Clienti',
        'Edit Customer Company' => 'Modifica Azienda Cliente',
        'Bulk Action' => 'Operazioni Multiple',
        'Bulk Actions on Tickets' => 'Operazione di massa sulle richieste',
        'Send Email and create a new Ticket' => 'Manda un email e crea una nuova richiesta',
        'Create new Email Ticket and send this out (Outbound)' => 'Crea una nuova e-mail e invio',
        'Create new Phone Ticket (Inbound)' => 'Crea un nuovo Ticket ',
        'Overview of all open Tickets' => 'Vista globale di tutte le richieste aperte',
        'Locked Tickets' => 'Richieste in gestione',
        'My Locked Tickets' => 'Miei ticket presi in carico',
        'My Watched Tickets' => 'Miei ticket osservati',
        'My Responsible Tickets' => 'Miei ticket responsabili',
        'Watched Tickets' => 'Tickets Visionati',
        'Watched' => 'Visionati',
        'Watch' => 'Osserva',
        'Unwatch' => 'Non osservare',
        'Lock it to work on it' => '',
        'Unlock to give it back to the queue' => '',
        'Show the ticket history' => '',
        'Print this ticket' => '',
        'Print this article' => '',
        'Split this article' => '',
        'Forward article via mail' => '',
        'Change the ticket priority' => '',
        'Change the ticket free fields!' => 'Cambia i campi liberi della richiesta',
        'Link this ticket to other objects' => '',
        'Change the owner for this ticket' => '',
        'Change the  customer for this ticket' => '',
        'Add a note to this ticket' => '',
        'Merge into a different ticket' => '',
        'Set this ticket to pending' => '',
        'Close this ticket' => '',
        'Look into a ticket!' => 'Visualizza questa richiesta',
        'Delete this ticket' => '',
        'Mark as Spam!' => 'Segnala come spam',
        'My Queues' => 'Le mie Code',
        'Shown Tickets' => 'Richieste Visualizzate',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'La tua email con la richiesta numero "<OTRS_TICKET>" è stata unita a "<OTRS_MERGE_TO_TICKET>".',
        'Ticket %s: first response time is over (%s)!' => 'Per questo Ticket %s: Prima risposta scaduta (%s)!',
        'Ticket %s: first response time will be over in %s!' => 'Per questo Ticket %s: Prima risposta scade dopo %s!',
        'Ticket %s: update time is over (%s)!' => 'Per questo Ticket %s: aggiornamento scade dopo %s!',
        'Ticket %s: update time will be over in %s!' => 'Per questo Ticket %s: aggiornamento scade dopo %s! ',
        'Ticket %s: solution time is over (%s)!' => 'Per questo Ticket %s: soluzione scaduta il (%s)!',
        'Ticket %s: solution time will be over in %s!' => 'Per questo Ticket %s: soluzione scade dopo %s! ',
        'There are more escalated tickets!' => 'Ci sono più tickets in gestione!',
        'Plain Format' => 'Formato base',
        'Reply All' => 'Rispondi a tutti',
        'Direction' => 'Direzione',
        'Agent (All with write permissions)' => 'Agente (Con tutti i permessi di scrittura)',
        'Agent (Owner)' => 'Agente (Proprietario)',
        'Agent (Responsible)' => 'Agente (Responsabile)',
        'New ticket notification' => 'Notifica nuova richiesta',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Mandami una notifica se viene inserita una nuova richiesta in una coda della lista "Le mie Code"',
        'Send new ticket notifications' => 'Inviare nuove notifiche ticket',
        'Ticket follow up notification' => 'Notifica di follow-up del ticket',
        'Ticket lock timeout notification' => 'Notifica scadenza gestione richieste',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Mandami una notifica se una richiesta viene sbloccata dal sistema.',
        'Send ticket lock timeout notifications' => 'Invia notifiche di time-out della presa in carico',
        'Ticket move notification' => 'Notifica di spostamento del ticket',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Mandami una notifica se una richiesta viene spostata in una coda della lista "Le mie Code"',
        'Send ticket move notifications' => 'Invia notifica di spostamento del ticket',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            '',
        'Custom Queue' => 'Coda personale',
        'QueueView refresh time' => 'Tempo di aggiornamento lista richieste',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            '',
        'Refresh QueueView after' => 'Ricarica QueueView successivamente',
        'Screen after new ticket' => 'Pagina da mostrare dopo una nuova richiesta',
        'Show this screen after I created a new ticket' => 'Mostra questa schermata dopo aver creato un ticket',
        'Closed Tickets' => 'Richieste chiuse',
        'Show closed tickets.' => 'Mostra le richieste chiuse.',
        'Max. shown Tickets a page in QueueView.' => 'Numero di richieste visualizzate per pagina nella Lista Richieste',
        'Ticket Overview "Small" Limit' => 'Limite di visualizzazione ticket nella visuale "Piccola"',
        'Ticket limit per page for Ticket Overview "Small"' => 'Limite di visualizzazione ticket per pagina nella visuale "Piccola"',
        'Ticket Overview "Medium" Limit' => 'Limite di visualizzazione ticket nella visuale "Media"',
        'Ticket limit per page for Ticket Overview "Medium"' => 'Limite di visualizzazione ticket per pagina nella visuale "Media"',
        'Ticket Overview "Preview" Limit' => 'Limite di visualizzazione ticket nella visuale "Grande"',
        'Ticket limit per page for Ticket Overview "Preview"' => 'Limite di visualizzazione ticket per pagina nella visuale "Grande"',
        'Ticket watch notification' => 'Notifica di osservazione dei ticket',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            'Inviami per i ticket osservati la stessa notifica che ricevono i proprietari.',
        'Send ticket watch notifications' => 'Inviare notifica di osservazione ticket',
        'Out Of Office Time' => 'Orario di assenza dall\'ufficio',
        'New Ticket' => 'Nuovo Ticket',
        'Create new Ticket' => 'Crea un nuovo Ticket',
        'Customer called' => 'Utente chiamato',
        'phone call' => 'Telefono',
        'Phone Call Outbound' => 'Chiamata esterna',
        'Phone Call Inbound' => '',
        'Reminder Reached' => 'Promemoria Raggiunti',
        'Reminder Tickets' => 'Tickets di promemoria',
        'Escalated Tickets' => 'Ticket scalati',
        'New Tickets' => 'Nuovo Ticket',
        'Open Tickets / Need to be answered' => 'Tickets Aperti / che richiedono risposta',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            '',
        'All new tickets, these tickets have not been worked on yet' => '',
        'All escalated tickets' => 'Tutti i ticket scalati',
        'All tickets with a reminder set where the reminder date has been reached' =>
            '',
        'Archived tickets' => '',
        'Unarchived tickets' => '',
        'History::Move' => 'Richiesta mossa nella coda "%s" (%s) dalla coda "%s" (%s).',
        'History::TypeUpdate' => 'Updated Type to %s (ID=%s).',
        'History::ServiceUpdate' => 'Updated Service to %s (ID=%s).',
        'History::SLAUpdate' => 'Updated SLA to %s (ID=%s).',
        'History::NewTicket' => 'Nuova richiesta [%s] creata (Q=%s;P=%s;S=%s).',
        'History::FollowUp' => 'Prosecuzione per [%s]. %s',
        'History::SendAutoReject' => 'Rifiuto automatico inviato a "%s".',
        'History::SendAutoReply' => 'Risposta automatica inviata a "%s".',
        'History::SendAutoFollowUp' => 'Prosecuzione automatica inviata a "%s".',
        'History::Forward' => 'Inoltrato a "%s".',
        'History::Bounce' => 'Rispedito a "%s".',
        'History::SendAnswer' => 'Email inviata a "%s".',
        'History::SendAgentNotification' => '"%s"-notifica inviata a "%s".',
        'History::SendCustomerNotification' => 'Notifica inviata a "%s".',
        'History::EmailAgent' => 'Email inviata al cliente.',
        'History::EmailCustomer' => 'Email. %s aggiunta',
        'History::PhoneCallAgent' => 'L\'operatore ha chiamato il cliente.',
        'History::PhoneCallCustomer' => 'Il cliente ha chiamato noi.',
        'History::AddNote' => 'Aggiunta nota (%s)',
        'History::Lock' => 'Richiesta bloccata.',
        'History::Unlock' => 'Richiesta lasciata.',
        'History::TimeAccounting' => '%s unita\' temporali addebitate. Nuovo totale: %s.',
        'History::Remove' => 'Rimosso da %s',
        'History::CustomerUpdate' => 'Aggiornato: %s',
        'History::PriorityUpdate' => 'Priorita\' cambiata da "%s" (%s) a "%s" (%s).',
        'History::OwnerUpdate' => 'Nuovo operatore assegnato = "%s" (ID=%s).',
        'History::LoopProtection' => 'Loop-Protection! Nessuna risposta automatica inviata a "%s".',
        'History::Misc' => '%s',
        'History::SetPendingTime' => 'Aggiornato: %s',
        'History::StateUpdate' => 'Vecchio: "%s" Nuovo: "%s"',
        'History::TicketDynamicFieldUpdate' => 'Aggiornato: %s=%s;%s=%s;',
        'History::WebRequestCustomer' => 'Richiesta del cliente via web.',
        'History::TicketLinkAdd' => 'Aggiunto link alla richiesta "%s".',
        'History::TicketLinkDelete' => 'Eliminato link alla richiesta "%s".',
        'History::Subscribe' => 'Aggiunta sottoscrizione per l\'utente "%s".',
        'History::Unsubscribe' => 'Rimossa sottoscrizione per l\'utente "%s".',
        'History::SystemRequest' => 'Richiesta di sistema',
        'History::ResponsibleUpdate' => 'Aggiornamento responsabile',
        'History::ArchiveFlagUpdate' => '',

        # Template: AAAWeekDay
        'Sun' => 'Dom',
        'Mon' => 'Lun',
        'Tue' => 'Mar',
        'Wed' => 'Mer',
        'Thu' => 'Gio',
        'Fri' => 'Ven',
        'Sat' => 'Sab',

        # Template: AdminAttachment
        'Attachment Management' => 'Gestione allegati',
        'Actions' => 'Azioni',
        'Go to overview' => 'Vai a visualizzazione',
        'Add attachment' => 'Aggiungi allegato',
        'List' => 'Lista',
        'Validity' => '',
        'No data found.' => 'Nessun dato trovato.',
        'Download file' => 'Scarica file',
        'Delete this attachment' => 'Elimina questo allegato',
        'Add Attachment' => 'Aggiungi allegato',
        'Edit Attachment' => 'Modifica allegato',
        'This field is required.' => 'Questo campo è obbligatorio',
        'or' => 'oppure',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Gestione risposte automatiche',
        'Add auto response' => 'Aggiungi risposta automatica',
        'Add Auto Response' => 'Aggiungi Risposta Automatica',
        'Edit Auto Response' => 'Modifica risposta automatica',
        'Response' => 'Risposta',
        'Auto response from' => 'Risposta automatica da',
        'Reference' => 'Referenza',
        'You can use the following tags' => 'Puoi usare i seguenti tag',
        'To get the first 20 character of the subject.' => 'Usa i primi 20 caratteri del subject.',
        'To get the first 5 lines of the email.' => 'Usa le prime 5 linee della Email .',
        'To get the realname of the sender (if given).' => 'Usa il realname dello user (se presente).',
        'To get the article attribute' => 'Usa l\'attributo dell\'articolo',
        ' e. g.' => '',
        'Options of the current customer user data' => 'Opzioni dei dati del cliente corrente',
        'Ticket owner options' => 'Operazioni proprietario ticket',
        'Ticket responsible options' => 'Operazione responsabile ticket',
        'Options of the current user who requested this action' => 'Opzioni dell\'utente corrente che ha richiesto questa azione',
        'Options of the ticket data' => 'Opzioni dei dati del ticket',
        'Config options' => 'Opzioni di configurazione',
        'Example response' => 'Risposta di esempio',

        # Template: AdminCustomerCompany
        'Customer Company Management' => 'Gestione Azienda Cliente',
        'Wildcards like \'*\' are allowed.' => '',
        'Add customer company' => 'Aggiungi compagnia clienti',
        'Please enter a search term to look for customer companies.' => 'Inserire una chiave di ricerca per le compagnie dei clienti.',
        'Add Customer Company' => 'Aggiungi Azienda Cliente',

        # Template: AdminCustomerUser
        'Customer Management' => 'Gestione clienti',
        'Add customer' => 'Aggiungi cliente',
        'Select' => 'Seleziona',
        'Hint' => 'Suggerimento',
        'Customer will be needed to have a customer history and to login via customer panel.' =>
            'Il cliente necessiterà di uno storico, e di effettuare il login tramite il pannello cliente.',
        'Please enter a search term to look for customers.' => 'Inserire una chiave di ricerca per i clienti.',
        'Last Login' => 'Ultimo accesso',
        'Add Customer' => 'Aggiungi cliente',
        'Edit Customer' => 'Modifica cliente',
        'This field is required and needs to be a valid email address.' =>
            'Questo campo è obbligatorio e deve contenere un indirizzo email valido.',
        'This email address is not allowed due to the system configuration.' =>
            'Questo indirizzo email non è consentito dalla configurazione di sistema.',
        'This email address failed MX check.' => 'Questo indirizzo email non ha superato il controllo MX.',
        'DNS problem, please check your configuration and the error log.' =>
            '',
        'The syntax of this email address is incorrect.' => 'La sintassi di questa email è errata.',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => 'Gestisci relazioni Cliente-Gruppo',
        'Notice' => 'Notifica',
        'This feature is disabled!' => 'Questa funzione e disabilitata',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Usare questa funzione solo se si vogliono definire permessi di gruppo per gli utenti.',
        'Enable it here!' => 'Abilita funzione qui',
        'Search for customers.' => '',
        'Edit Customer Default Groups' => 'Modifica gruppi di default degli utenti',
        'These groups are automatically assigned to all customers.' => 'Questi gruppi saranno assegnati automaticamente a tuti gli utenti.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'E\' possibile gestire questi gruppi tramite l\'impostazione di configurazione "CustomerGroupAlwaysGroups".',
        'Filter for Groups' => 'Filtri per gruppi',
        'Select the customer:group permissions.' => 'Selezionare i permessi cliente:gruppo.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Se non si effettua una selezione, non ci saranno permessi in questo gruppo (i ticket non saranno disponibili al cliente)',
        'Search Result:' => 'Risultato della ricerca:',
        'Customers' => 'Utenti',
        'Groups' => 'Gruppi',
        'No matches found.' => 'Nessun risultato.',
        'Change Group Relations for Customer' => 'Cambia relazioni di gruppo per il cliente',
        'Change Customer Relations for Group' => 'Cambia relazioni dei clienti per il gruppo',
        'Toggle %s Permission for all' => 'Imposta permesso %s per tutti',
        'Toggle %s permission for %s' => 'Imposta permesso %s per %s',
        'Customer Default Groups:' => 'Gruppi di default per il cliente:',
        'No changes can be made to these groups.' => 'Nessun cambiamento verrà effettuato a questi gruppi.',
        'ro' => 'sola lettura',
        'Read only access to the ticket in this group/queue.' => 'Accesso in sola lettura alle richieste in questo gruppo/coda.',
        'rw' => 'lettura e scrittura',
        'Full read and write access to the tickets in this group/queue.' =>
            'Accesso completo in lettura e scrittura alle richieste in questo gruppo/coda',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => 'Gestisci relazioni cliente-servizi',
        'Edit default services' => 'Modifica servizi di default',
        'Filter for Services' => 'Filtri per i servizi',
        'Allocate Services to Customer' => 'Alloca servizi a cliente',
        'Allocate Customers to Service' => 'Alloca clienti a servizio',
        'Toggle active state for all' => 'Imposta stato attivo per tutti',
        'Active' => 'Attivo',
        'Toggle active state for %s' => 'Imposta stato attivo per %s',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => '',
        'Add new field for object' => '',
        'To add a new field, select the field type form one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            '',
        'Dynamic Fields List' => '',
        'Dynamic fields per page' => '',
        'Label' => '',
        'Order' => 'Ordine',
        'Object' => 'Oggetto',

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
        'Default value' => 'Valore di default',
        'This is the default value for this field.' => '',
        'Save' => 'Salva',

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
        'Key' => 'Chiave',
        'Value' => 'Valore',
        'Remove value' => '',
        'Add value' => '',
        'Add Value' => '',
        'Add empty value' => '',
        'Activate this option to create an empty selectable value.' => '',
        'Translatable values' => '',
        'If you activate this option the values will be translated to the user defined language.' =>
            '',
        'Note' => 'Nota',
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
        'Admin Notification' => 'Notifiche Amministrative',
        'With this module, administrators can send messages to agents, group or role members.' =>
            '',
        'Create Administrative Message' => '',
        'Your message was sent to' => 'Il messaggio è stato inviato a',
        'Send message to users' => 'Invia messaggio agli utenti',
        'Send message to group members' => 'Invia messaggio ai membri del gruppo',
        'Group members need to have permission' => 'I membri del gruppo necessitano del permesso',
        'Send message to role members' => 'Invia messaggio ai membri del ruolo',
        'Also send to customers in groups' => 'Invia anche ai clienti nei gruppi',
        'Body' => 'Testo',
        'Send' => 'Invia',

        # Template: AdminGenericAgent
        'Generic Agent' => 'Agente generico',
        'Add job' => 'Aggiungi job',
        'Last run' => 'Ultima esecuzione',
        'Run Now!' => 'Esegui Ora',
        'Delete this task' => 'Elimina questo task',
        'Run this task' => 'Esegui questo task',
        'Job Settings' => 'Impostazioni job',
        'Job name' => 'Nome job',
        'Currently this generic agent job will not run automatically.' =>
            'Ora questo agente generico non viene lanciato autamaticamente .',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Per abilitare il lancio automatico seleziona almeno un valore per i minuti,ore,giorni ! ',
        'Schedule minutes' => 'Minuti dell\'orario',
        'Schedule hours' => 'Ore dell\'orario',
        'Schedule days' => 'Giorni dell\'orario',
        'Toggle this widget' => 'Imposta questo widget',
        'Ticket Filter' => 'Filtro ticket',
        '(e. g. 10*5155 or 105658*)' => '(per esempio \'10*5155\' o \'105658*\')',
        '(e. g. 234321)' => '(per esempio \'234321\')',
        'Customer login' => 'Login cliente',
        '(e. g. U5150)' => '(per esempio \'U5150\')',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Ricerca a testo nell\'articolo (ad esempio "Mar*in" o "Baue*").',
        'Agent' => 'Operatore',
        'Ticket lock' => 'Presa in carico ticket',
        'Create times' => 'Tempi di creazione',
        'No create time settings.' => 'Data di Creazione mancante ',
        'Ticket created' => 'Richiesta creata',
        'Ticket created between' => 'Richiesta creata tra',
        'Change times' => '',
        'No change time settings.' => 'Nessuna modifica tempo.',
        'Ticket changed' => 'Ticket cambiato',
        'Ticket changed between' => 'Ticket cambiato fra ',
        'Close times' => 'Tempi di chiusura',
        'No close time settings.' => 'nessuna data  chiusura',
        'Ticket closed' => 'Ticket Chiusi',
        'Ticket closed between' => 'Ticket Chiusi tra ',
        'Pending times' => 'Tempi di attesa',
        'No pending time settings.' => 'Tempo di attesa non selezionato',
        'Ticket pending time reached' => 'Tempo di attesa per Ticket raggiunto',
        'Ticket pending time reached between' => 'Tempo di attesa per Ticket raggiunto fra ',
        'Escalation times' => 'Tempi di scalo',
        'No escalation time settings.' => 'Tempo di gestione non selezionato.',
        'Ticket escalation time reached' => 'Tempo di gestione per Ticket superato',
        'Ticket escalation time reached between' => 'Tempo di gestione per Ticket superato fra',
        'Escalation - first response time' => 'Scalo - Prima risposta',
        'Ticket first response time reached' => 'Tempo di prima risposta superato',
        'Ticket first response time reached between' => 'Tempo di prima risposta superato fra',
        'Escalation - update time' => 'Scalo - Aggiornamento',
        'Ticket update time reached' => 'Tempo di gestione - Aggiorna scaduto ',
        'Ticket update time reached between' => 'Tempo di gestione - Aggiorna scaduto fra',
        'Escalation - solution time' => 'Scalo - Soluzione',
        'Ticket solution time reached' => 'Tempo per soluzione scaduto',
        'Ticket solution time reached between' => 'Tempo per soluzione scaduto fra ',
        'Archive search option' => 'Opzione di ricerca in archivio',
        'Ticket Action' => 'Azione ticket',
        'Set new service' => 'Imposta nuovo servizio',
        'Set new Service Level Agreement' => 'Imposta nuovo Service Level Agreement',
        'Set new priority' => 'Imposta nuova priorità',
        'Set new queue' => 'Imposta nuova coda',
        'Set new state' => 'Imposta nuovo stato',
        'Set new agent' => 'Imposta nuovo agente',
        'new owner' => 'Nuovo proprietario',
        'new responsible' => '',
        'Set new ticket lock' => 'Imposta nuova presa in carico del ticket',
        'New customer' => 'Nuovo cliente',
        'New customer ID' => 'Nuovo ID cliente',
        'New title' => 'Nuovo titolo',
        'New type' => 'Nuovo tipo',
        'New Dynamic Field Values' => '',
        'Archive selected tickets' => 'Archivia i ticket selezionati',
        'Add Note' => 'Aggiungi nota',
        'Time units' => 'Tempo',
        ' (work units)' => ' (unità di lavoro)',
        'Ticket Commands' => 'Comandi Ticket',
        'Send agent/customer notifications on changes' => 'Invia a un agente/utente una notifica se cambia',
        'CMD' => 'comando',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Questo comando verrà eseguito. ARG[0] sarà il numero della richiesta. ARG[1] sarà l\'identificativo della richiesta.',
        'Delete tickets' => 'Elimina richieste',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Attenzione: Tutti i ticket corrispondenti saranno rimossi dal database e non potranno essere ripristinati!',
        'Execute Custom Module' => 'Esegui Modulo Custom',
        'Param %s key' => 'Chiave parametro %s',
        'Param %s value' => 'Valore parametro %s',
        'Save Changes' => 'Salva cambiamenti',
        'Results' => 'Risultati',
        '%s Tickets affected! What do you want to do?' => '%s ticket corrispondenti! Cosa si desidera fare?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Attenzione: E\' stata usata l\'opzione RIMUOVI. Tutti i ticket rimossi saranno persi!',
        'Edit job' => 'Modifica job',
        'Run job' => 'Esegui job',
        'Affected Tickets' => 'Ticket corrispondenti',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => '',
        'Web Services' => '',
        'Debugger' => '',
        'Go back to web service' => '',
        'Clear' => '',
        'Do you really want to clear the debug log of this web service?' =>
            '',
        'Request List' => '',
        'Time' => 'Tempo',
        'Remote IP' => '',
        'Loading' => 'Caricamento',
        'Select a single request to see its details.' => '',
        'Filter by type' => '',
        'Filter from' => '',
        'Filter to' => '',
        'Filter by remote IP' => '',
        'Refresh' => 'Aggiorna',
        'Request Details' => '',
        'An error occurred during communication.' => '',
        'Show or hide the content' => 'Mostra o nascondi contenuto',
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
        'Import' => 'Importa',
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
        'Version' => 'Versione',
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
            'WARNING: Quando cambi il nome del gruppo di \'admin\', prima del cambiamento in SysConfig, vieni bloccato sul pannello administrations! Se questo accade rimentti il nome precedente .',
        'Group Management' => 'Gestione gruppo',
        'Add group' => 'Aggiungi gruppo',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Il gruppo admin ha accesso all\'area amministrazione mentre il gruppo stats ha accesso alle statistiche.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Crea nuovi gruppi per gestire i permessi di accesso per diversi gruppi di agenti (ad esempio il dipartimento acquisti, dipartimento di supporto, dipartimento vendite, ...). ',
        'It\'s useful for ASP solutions. ' => 'E\' utile per soluzioni ASP. ',
        'Add Group' => 'Inserisci gruppo',
        'Edit Group' => 'Modifica gruppo',

        # Template: AdminLog
        'System Log' => 'Log di sistema',
        'Here you will find log information about your system.' => 'Qui si troveranno informazioni di log sul sistema.',
        'Hide this message' => '',
        'Recent Log Entries' => '',

        # Template: AdminMailAccount
        'Mail Account Management' => 'Gestione Credenziali Mail ',
        'Add mail account' => 'Aggiungi account di posta',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Tutti i messaggi in arrivo saranno smistati nella coda selezionata!',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Se il tuo account è fidato (trusted), verrà utilizzato l\'header X-OTRS dell\'istante di arrivo (priorità, ...)! Il filtro di ingresso verrà utilizzato in ogni caso.',
        'Host' => '',
        'Delete account' => 'Elimina account',
        'Fetch mail' => 'Scarica posta',
        'Add Mail Account' => 'Aggiungi account di posta',
        'Example: mail.example.com' => 'Esempio: mail.exempio.it',
        'IMAP Folder' => '',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            '',
        'Trusted' => 'Fidato',
        'Dispatching' => 'Smistamento',
        'Edit Mail Account' => 'Modifica account di posta',

        # Template: AdminNavigationBar
        'Admin' => '',
        'Agent Management' => 'Gestione agenti',
        'Queue Settings' => 'Impostazioni delle code',
        'Ticket Settings' => 'Impostazioni dei ticket',
        'System Administration' => 'Amministrazione di sistema',

        # Template: AdminNotification
        'Notification Management' => 'Gestione delle notifiche',
        'Select a different language' => '',
        'Filter for Notification' => 'Filtri per le notifiche',
        'Notifications are sent to an agent or a customer.' => 'Le notifiche sono inviate ad un operatore o a un cliente',
        'Notification' => 'Notifica',
        'Edit Notification' => 'Modifica notifica',
        'e. g.' => '',
        'Options of the current customer data' => 'Opzioni per i dati del cliente corrente',

        # Template: AdminNotificationEvent
        'Add notification' => 'Aggiungi notifica',
        'Delete this notification' => 'Elimina questa notifica',
        'Add Notification' => 'Aggiungi notifica',
        'Recipient groups' => 'Gruppi destinatari',
        'Recipient agents' => 'Agenti destinatari',
        'Recipient roles' => 'Ruoli destinatari',
        'Recipient email addresses' => 'Indirizzi email destinatari',
        'Article type' => 'Tipo articolo',
        'Only for ArticleCreate event' => 'Solo per l\'evento ArticleCreate',
        'Subject match' => 'Match nell\' oggetto mail',
        'Body match' => 'Match nel corpo mail ',
        'Include attachments to notification' => 'Includi allegati nella notifica',
        'Notification article type' => 'Tipo di articolo di notifica',
        'Only for notifications to specified email addresses' => 'Solo per le notifiche a questo specifico indirizzo email',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Per avere i primi 20 caratteri mail - subject (agent) ',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Per avere le prime 5 righe corpo mail (agent).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Per avere i primi 20 caratteri mail - subject (customer).',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Per avere le prime 5 righe corpo mail (customer).',

        # Template: AdminPGP
        'PGP Management' => 'Gestione PGP',
        'Use this feature if you want to work with PGP keys.' => 'Usare questa funzione se si desidera lavorare con chiavi PGP',
        'Add PGP key' => 'Aggiungi chiave PGP',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'In questo modo puoi configurare direttamente il portachiavi PGP in SysConfig',
        'Introduction to PGP' => 'Introduzione a PGP',
        'Result' => 'Risultato',
        'Identifier' => 'Identificatore',
        'Bit' => '',
        'Fingerprint' => 'Impronta (fingerprint)',
        'Expires' => 'Scade',
        'Delete this key' => 'Elimina questa chiave',
        'Add PGP Key' => 'Aggiungi chiave PGP',
        'PGP key' => 'Chiave PGP',

        # Template: AdminPackageManager
        'Package Manager' => 'Gestione Pacchetti',
        'Uninstall package' => 'Disinstalla pacchetto',
        'Do you really want to uninstall this package?' => 'Vuoi davvero disinstallare questo pacchetto?',
        'Reinstall package' => 'Reinstalla pacchetto',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'Si desidera veramente reinstallare questo pacchetto? Ogni cabiamento manuale verrà perduto',
        'Continue' => 'Continua',
        'Install' => 'Installa',
        'Install Package' => 'Installa pacchetto',
        'Update repository information' => 'Aggiorna informazioni sui repository',
        'Did not find a required feature? OTRS Group provides their subscription customers with exclusive Add-Ons:' =>
            '',
        'Online Repository' => 'Archivio Online',
        'Vendor' => 'Fornitore',
        'Module documentation' => 'Documentazione sul modulo',
        'Upgrade' => 'Aggiorna',
        'Local Repository' => 'Archivio Locale',
        'Uninstall' => 'rimuovi pacchetto',
        'Reinstall' => 'Re-installa',
        'Download package' => 'Scarica pacchetto',
        'Rebuild package' => 'Ricostruisci pacchetto',
        'Metadata' => '',
        'Change Log' => '',
        'Date' => 'Data',
        'List of Files' => 'Lista dei file',
        'Permission' => 'Permessi',
        'Download' => 'Scarica',
        'Download file from package!' => 'Scarica file dal pacchetto!',
        'Required' => 'Richiesto',
        'PrimaryKey' => '',
        'AutoIncrement' => '',
        'SQL' => '',
        'File differences for file %s' => 'Differenze per il file %s',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Log delle Performance',
        'This feature is enabled!' => 'Funzione abilitata',
        'Just use this feature if you want to log each request.' => 'usa questa funzionalita per tracciare ogni richiesta',
        'Activating this feature might affect your system performance!' =>
            'L\' attivazione di questa funzionalita\' puo\' ridurre le prestazioni del sistema .',
        'Disable it here!' => 'Disabilita funzione qui',
        'Logfile too large!' => 'Log File troppo grande ',
        'The logfile is too large, you need to reset it' => 'Il file di log è troppo grande, è necessario un reset del file',
        'Overview' => 'Sommario',
        'Range' => 'intervallo',
        'Interface' => 'interfaccia',
        'Requests' => 'Richiesta',
        'Min Response' => 'Minimo per Risposta',
        'Max Response' => 'Massimo per Risposta',
        'Average Response' => 'Media per Risposta',
        'Period' => 'Periodo',
        'Min' => 'Minimo',
        'Max' => 'Massimo',
        'Average' => 'Media',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'Gestione filtri posta in ingresso',
        'Add filter' => 'Aggiungi filtro',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Per gestire o filtrare email in entrata basandosi sugli header. E\' anche possibile usare espressioni regolari',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Se vuoi che corrisponda solo negli indirizzi di email , usa EMAILADDRESS:info@example.com in From, To or Cc.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Se si desidera usare espressioni regolari, si può usare il valore di match tra () come [***] nell\'azione \'Set\'.',
        'Delete this filter' => 'Elimina questo filtro',
        'Add PostMaster Filter' => 'Aggiungi filtro PostMaster',
        'Edit PostMaster Filter' => 'Modifica filtro PostMaster',
        'Filter name' => 'Nome del filtro',
        'The name is required.' => '',
        'Stop after match' => 'Ferma dopo trovato',
        'Filter Condition' => 'Condizione per il filtro',
        'The field needs to be a valid regular expression or a literal word.' =>
            '',
        'Set Email Headers' => 'Imposta header dell\'email',
        'The field needs to be a literal word.' => '',

        # Template: AdminPriority
        'Priority Management' => 'Gestione Priorità',
        'Add priority' => 'Aggiungi Priorità',
        'Add Priority' => 'Aggiungi Priorità',
        'Edit Priority' => 'Modifica Priorità',

        # Template: AdminQueue
        'Manage Queues' => 'Gestione code',
        'Add queue' => 'Aggiungi coda',
        'Add Queue' => 'Aggiungi coda',
        'Edit Queue' => 'Modifica coda',
        'Sub-queue of' => 'Sotto-coda di',
        'Unlock timeout' => 'Tempo di sblocco automatico',
        '0 = no unlock' => '0 = nessuno sblocco automatico',
        'Only business hours are counted.' => 'Sono considerate solo le ore lavorative.',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Se un agente prende in carico un ticket e non lo chiude prima dello sblocco automatico, il ticket viene sbloccato e diventa disponibile per altri agenti.',
        'Notify by' => 'Notificato da',
        '0 = no escalation' => '0 = nessuno scalo',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Se non c\'è un contatto aggiunto con il cliente, sia per email che per telefono per un ticket nuovo, prima che il tempo qui definito scada, il ticket viene scalato',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Se c\'è un articolo aggiunto, come un floow-up o il portale cliente, il tempo di aggiornamento di scalo viene azzerato. Se non c\'è un contatto con il cliente, sia per posta che per telefono, aggiunto al ticket prima che scada il tempo definito qui, il ticket viene scalato.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Se il ticket non viene impostato a chiuso prima che scada il tempo qui definito, il ticket viene scalato.',
        'Follow up Option' => 'Opzioni per i follow-up',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Specifica se i follow-up ai ticket chiusi riaprono i ticket, vengono respinti o portano a un nuovo ticket.',
        'Ticket lock after a follow up' => 'Presa in gestione della richiesta dopo una prosecuzione',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Se un ticket viene chiuso e il cliente manda un follow-up, il ticket sarà preso in carica dal vecchio proprietario.',
        'System address' => 'Indirizzo di sistema',
        'Will be the sender address of this queue for email answers.' => 'Mittente utilizzato per le risposte relative alle richieste di questa coda.',
        'Default sign key' => 'Chiave di default per le firme',
        'The salutation for email answers.' => 'Saluto (parte iniziale) per le email generate automaticamente dal sistema.',
        'The signature for email answers.' => 'Firma (parte finale) per le email generate automaticamente dal sistema.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => 'Gestisci relazioni Coda-Risposte automatiche',
        'Filter for Queues' => 'Filtri per le code',
        'Filter for Auto Responses' => 'Filtri per le risposte automatiche',
        'Auto Responses' => 'Risposte Automatiche',
        'Change Auto Response Relations for Queue' => 'Cambia le relazioni delle risposte automatiche con la coda',
        'settings' => 'Configura',

        # Template: AdminQueueResponses
        'Manage Response-Queue Relations' => 'Imposta le relazioni Risposta-Coda',
        'Filter' => 'Filtro',
        'Filter for Responses' => 'Filtro per le risposte',
        'Responses' => 'Risposte',
        'Change Queue Relations for Response' => 'Cambia le relazioni delle code con la risposta',
        'Change Response Relations for Queue' => 'Cambia le relazioni delle risposte con la coda',

        # Template: AdminResponse
        'Manage Responses' => 'Gestione risposte',
        'Add response' => 'Aggiungi risposta',
        'A response is a default text which helps your agents to write faster answers to customers.' =>
            '',
        'Don\'t forget to add new responses to queues.' => '',
        'Delete this entry' => 'Elimina',
        'Add Response' => 'Aggiungi risposta',
        'Edit Response' => 'Modifica risposta',
        'The current ticket state is' => 'Lo stato corrente della richiesta è',
        'Your email address is' => 'Il tuo indirizzo email è',

        # Template: AdminResponseAttachment
        'Manage Responses <-> Attachments Relations' => 'Gestisci relazioni Risposte <-> Allegati',
        'Filter for Attachments' => 'Filtro per gli allegati',
        'Change Response Relations for Attachment' => 'Cambia relazioni delle risposte per gli allegati',
        'Change Attachment Relations for Response' => 'Cambia relazioni degli allegati per le risposte',
        'Toggle active for all' => 'Imposta attivo per tutti',
        'Link %s to selected %s' => 'Collega %s con %',

        # Template: AdminRole
        'Role Management' => 'Gestione ruoli',
        'Add role' => 'Aggiungi ruolo',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Crea un ruolo e mettici i gruppi. Poi aggiungi il ruolo agli utenti.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'Non ci sono ruoli definiti. Si prega di usare il tasto Aggiungi per crearne uno nuovo.',
        'Add Role' => 'Aggiungi Ruolo',
        'Edit Role' => 'Modifica ruolo',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => 'Gestione relazioni ruolo-gruppo',
        'Filter for Roles' => 'Filtri per i ruoli',
        'Roles' => 'Ruoli',
        'Select the role:group permissions.' => 'Selezionare i permessi ruolo:gruppo',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Se non si seleziona niente, non ci sono permessi in questo gruppo (i ticket non saranno disponibili per questo ruolo).',
        'Change Role Relations for Group' => 'Cambia le relazioni del ruolo per il gruppo',
        'Change Group Relations for Role' => 'Cambia le relazioni del gruppo per il ruolo',
        'Toggle %s permission for all' => 'Imposta il permeso %s per tutti',
        'move_into' => 'muovi_in',
        'Permissions to move tickets into this group/queue.' => 'Autorizzazione a muovere richieste in questo gruppo/coda',
        'create' => 'crea',
        'Permissions to create tickets in this group/queue.' => 'Autorizzazione a creare richieste in questo gruppo/coda',
        'priority' => 'priorità',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Autorizzazione a cambiare la priorità di una richiesta in questo gruppo/coda',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => 'Gestione relazioni agente-ruolo',
        'Filter for Agents' => 'Filtro per gli agenti',
        'Agents' => 'Agenti',
        'Manage Role-Agent Relations' => 'Gestione relazioni ruolo-agente',
        'Change Role Relations for Agent' => 'Cambia relazioni di ruolo per l\'agente',
        'Change Agent Relations for Role' => 'Cambia relazioni di agente per il ruolo',

        # Template: AdminSLA
        'SLA Management' => 'Gestione SLA',
        'Add SLA' => 'Aggiungi SLA',
        'Edit SLA' => 'Modifica SLA',
        'Please write only numbers!' => 'Per favore usa solo numeri!',

        # Template: AdminSMIME
        'S/MIME Management' => 'Gestione S/MIME ',
        'Add certificate' => 'Aggiungi certificato',
        'Add private key' => 'Aggiungi chiave privata',
        'Filter for certificates' => '',
        'Filter for SMIME certs' => '',
        'Here you can add relations to your private certificate, these will be embedded to the SMIME signature every time you use this certificate to sign an email.' =>
            '',
        'See also' => 'Vedi anche',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'Puoi modificare il certificato e la chiave privata direttamente sul filesystem.',
        'Hash' => '',
        'Create' => 'Crea',
        'Handle related certificates' => '',
        'Delete this certificate' => 'Elimina questo certificato',
        'Add Certificate' => 'Aggiungi certificato',
        'Add Private Key' => 'Aggiunti chiave privata',
        'Secret' => 'Segreto',
        'Related Certificates for' => '',
        'Delete this relation' => '',
        'Available Certificates' => '',
        'Relate this certificate' => '',

        # Template: AdminSalutation
        'Salutation Management' => 'Gestione saluti',
        'Add salutation' => 'Aggiungi saluto',
        'Add Salutation' => 'Aggiungi il template di saluti',
        'Edit Salutation' => 'Modifica saluto',
        'Example salutation' => 'Saluto di esempio',

        # Template: AdminScheduler
        'This option will force Scheduler to start even if the process is still registered in the database' =>
            '',
        'Start scheduler' => '',
        'Scheduler could not be started. Check if scheduler is not running and try it again with Force Start option' =>
            '',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => 'E\' necessario abilitare la modalità sicura!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'La modalita Sicura, (normalmente) viene abilitata dopo il completamento istallazione.',
        'Secure mode must be disabled in order to reinstall using the web-installer.' =>
            'La Modalita Sicura deve essere tolta per installare usando il web-installer.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Se non è attivata la modalità sicura, attivarla tramite SySConfig perché il programma è già in esecuzione.',

        # Template: AdminSelectBox
        'SQL Box' => 'script SQL ',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Qui è possibile inserire SQL per inviarlo direttamente al database.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'La sintassi della query SQL è sbagliata.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'C\'è almeno un parametro mancante per il binding.',
        'Result format' => 'Formato dei risultati',
        'Run Query' => 'Esegui query',

        # Template: AdminService
        'Service Management' => 'Gestione Servizi',
        'Add service' => 'Aggiungi servizio',
        'Add Service' => 'inserisci un servizio',
        'Edit Service' => 'Modifica servizio',
        'Sub-service of' => 'Sotto-servizio di',

        # Template: AdminSession
        'Session Management' => 'Gestione Sessioni',
        'All sessions' => 'Tutte le sessioni',
        'Agent sessions' => 'Sessioni degli agenti',
        'Customer sessions' => 'Sessioni dei clienti',
        'Unique agents' => 'Agenti unici',
        'Unique customers' => 'Clienti unici',
        'Kill all sessions' => 'termina tutte le sessioni',
        'Kill this session' => 'Termina questa sessione',
        'Session' => 'Sessione',
        'Kill' => 'Termina',
        'Detail View for SessionID' => 'Visualizza dettagli per SessionID',

        # Template: AdminSignature
        'Signature Management' => 'Gestione firme digitali',
        'Add signature' => 'Aggiungi firma',
        'Add Signature' => 'Aggiungi Firma',
        'Edit Signature' => 'Modifica firma',
        'Example signature' => 'Firma di esempio',

        # Template: AdminState
        'State Management' => 'Gestione Stati',
        'Add state' => 'Aggiungi stato',
        'Please also update the states in SysConfig where needed.' => '',
        'Add State' => 'inserisci stato',
        'Edit State' => 'Modifica stato',
        'State type' => 'Tipo di stato',

        # Template: AdminSysConfig
        'SysConfig' => '',
        'Navigate by searching in %s settings' => 'Naviga cercando nelle impostazioni di %',
        'Navigate by selecting config groups' => '',
        'Download all system config changes' => 'Scarica tutti i cambiamenti alla configurazione di sistema',
        'Export settings' => 'Esporta impostazioni',
        'Load SysConfig settings from file' => 'Carica impostazioni di SysConfig da file',
        'Import settings' => 'Importa configurazione',
        'Import Settings' => 'Importa configurazione',
        'Please enter a search term to look for settings.' => 'Inserire una chiave di ricerca per trovare impostazioni.',
        'Subgroup' => 'Sottogruppi',
        'Elements' => 'Elementi',

        # Template: AdminSysConfigEdit
        'Edit Config Settings' => 'Modifica impostazioni di configurazione',
        'This config item is only available in a higher config level!' =>
            'Questa configurazione è solo disponibile a liveli più alti!',
        'Reset this setting' => 'Reimposta questa opzione',
        'Error: this file could not be found.' => 'Errore: Impossibile trovare questo file.',
        'Error: this directory could not be found.' => 'Errore: Impossibile trovare questa directory.',
        'Error: an invalid value was entered.' => 'Errore: Sono stati inseriti dati non validi.',
        'Content' => 'Contenuto',
        'Remove this entry' => 'Rimuovi questa entry',
        'Add entry' => 'Aggiungi entry',
        'Remove entry' => 'Rimuovi entry',
        'Add new entry' => 'Aggiungi nuova entry',
        'Create new entry' => 'Crea nuova entry',
        'New group' => 'Nuovo grouppo',
        'Group ro' => 'Gruppo RO',
        'Readonly group' => 'Gruppo read-only',
        'New group ro' => 'Nuovo gruppo RO',
        'Loader' => 'Caricatore',
        'File to load for this frontend module' => 'File da caricare per questo modulo di frontend',
        'New Loader File' => 'Nuovo file caricatore',
        'NavBarName' => 'NomeBarraNav',
        'NavBar' => 'BarraNav',
        'LinkOption' => 'OpzioneLink',
        'Block' => 'Bloco',
        'AccessKey' => 'ChiaveAccesso',
        'Add NavBar entry' => 'Aggiungi entry BarraNav',
        'Year' => 'Anno',
        'Month' => 'Mese',
        'Day' => 'Giorno',
        'Invalid year' => 'Anno invalido',
        'Invalid month' => 'Mese invalido',
        'Invalid day' => 'Giorno invalido',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Gestione indirizzi Email di sistema',
        'Add system address' => 'Aggiungi indirizzo di sistema',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Tutta la posta in entrata con questo indirizzo in A: o Cc: verrà inoltrata alla coda selezionata.',
        'Email address' => 'Indirizzo email',
        'Display name' => 'Nome visibile',
        'Add System Email Address' => 'Aggiungi indirizzo email di sistema',
        'Edit System Email Address' => 'Modifica indirizzo email di sistema',
        'The display name and email address will be shown on mail you send.' =>
            'Il nome visualizzato e l\'indirizzo email verranno visualizzati sulle email inviate da qui.',

        # Template: AdminType
        'Type Management' => 'Gestione tipologie',
        'Add ticket type' => 'Aggiungi tipo di ticket',
        'Add Type' => 'Aggiungi tipo',
        'Edit Type' => 'Modifica tipo',

        # Template: AdminUser
        'Add agent' => 'Aggiungi agente',
        'Agents will be needed to handle tickets.' => 'Gli agenti serviranno a gestire i ticket.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'Non dimenticare di aggiungere gli agenti nuovi ai gruppo e/o ai ruoli!',
        'Please enter a search term to look for agents.' => 'Inserire una chiave di ricerca per trovare agenti.',
        'Last login' => 'Ultimo accesso',
        'Login as' => 'Cambia login',
        'Switch to agent' => 'Cambia ad agente',
        'Add Agent' => 'Aggiungi agente',
        'Edit Agent' => 'Modifica agente',
        'Firstname' => 'Nome',
        'Lastname' => 'Cognome',
        'Password is required.' => '',
        'Start' => 'Inizio',
        'End' => 'Fine',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => 'Gestisci relazioni Agente-Gruppo',
        'Change Group Relations for Agent' => 'Cambia relazioni di gruppo per l\'agente',
        'Change Agent Relations for Group' => 'Cambia relazioni di agente per il gruppo',
        'note' => '',
        'Permissions to add notes to tickets in this group/queue.' => 'Permesso di aggiungere note ai ticket in questo gruppo/coda.',
        'owner' => 'gestore',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Permesso di cambiare il gestore dei ticket in questo gruppo/coda.',

        # Template: AgentBook
        'Address Book' => 'Rubrica',
        'Search for a customer' => 'Ricerca cliente',
        'Add email address %s to the To field' => 'Aggiungi indirizzo email %s al campo A:',
        'Add email address %s to the Cc field' => 'Aggiungi indirizzo email %s al campo Cc:',
        'Add email address %s to the Bcc field' => 'Aggiungi indirizzo email %s al campo Bcc:',
        'Apply' => 'Applica',

        # Template: AgentCustomerSearch
        'Search Customer' => 'Ricerca cliente',
        'Duplicated entry' => '',
        'This address already exists on the address list.' => '',

        # Template: AgentCustomerTableView

        # Template: AgentDashboard
        'Dashboard' => 'Cruscotto',

        # Template: AgentDashboardCalendarOverview
        'in' => '',

        # Template: AgentDashboardIFrame

        # Template: AgentDashboardImage

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s e\' disponibile!',
        'Please update now.' => 'Prego aggiornare ora',
        'Release Note' => 'Nota di rilascio',
        'Level' => 'Livello',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Inviato il %s .',

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
        'Undo & close window' => 'Annulla e chiudi finestra',

        # Template: AgentInfo
        'Info' => 'Informazioni',
        'To accept some news, a license or some changes.' => 'Accettare delle news, una licenza o dei cambiamenti.',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Collega oggetto : %s ',
        'Close window' => 'Chiudi finestra',
        'go to link delete screen' => 'vai alla schermata di eliminazione link',
        'Select Target Object' => 'Selezionare Oggetto',
        'Link Object' => 'Collega oggetto',
        'with' => 'con',
        'Unlink Object: %s' => 'Scollega oggetto: %s ',
        'go to link add screen' => 'vai alla schermata di aggiunta link',

        # Template: AgentNavigationBar

        # Template: AgentPreferences
        'Edit your preferences' => 'Modifica preferenze',

        # Template: AgentSpelling
        'Spell Checker' => 'Verifica ortografica',
        'spelling error(s)' => 'Errori di ortografia',
        'Apply these changes' => 'Applica le modifiche',

        # Template: AgentStatsDelete
        'Delete stat' => 'Elimina statistica',
        'Stat#' => '',
        'Do you really want to delete this stat?' => 'Si desidera veramente eliminare questa statistica?',

        # Template: AgentStatsEditRestrictions
        'Step %s' => 'Passo %s',
        'General Specifications' => 'Specifiche generali',
        'Select the element that will be used at the X-axis' => 'Selezionare l\'elemento che verrà usato nell\'asse X',
        'Select the elements for the value series' => 'Seleziona gli elementi come valori della serie ',
        'Select the restrictions to characterize the stat' => 'Selezionare le restrizioni per caratterizzare la statistica',
        'Here you can make restrictions to your stat.' => 'Qui puoi creare le regole filtri per le stat.',
        'If you remove the hook in the "Fixed" checkbox, the agent generating the stat can change the attributes of the corresponding element.' =>
            'Se cancelli "Fisso" ,durante la generazione delle stat sono possibili cambiamenti per gli attributi del corrispondente elemento. ',
        'Fixed' => 'Fisso',
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Seleziona solo un elemento e togli  \'Fisso\' . ',
        'Absolute Period' => 'Periodo assoluto',
        'Between' => 'fra',
        'Relative Period' => 'Periodo relativo',
        'The last' => 'Ultimo ',
        'Finish' => 'Fine',

        # Template: AgentStatsEditSpecification
        'Permissions' => ' Permessi',
        'You can select one or more groups to define access for different agents.' =>
            'Si può scegliere uno o più gruppi per definire l\'accesso a diversi agenti.',
        'Some result formats are disabled because at least one needed package is not installed.' =>
            'Alcuni formati sono disabilitati perché almeno un pacchetto richiesto non è installato.',
        'Please contact your administrator.' => 'Si prega di contattare l\'amministratore',
        'Graph size' => 'Dimensioni grafico',
        'If you use a graph as output format you have to select at least one graph size.' =>
            ' Se hai selezioneto il grafo come formato delle stat. devi anche selezione la dimensione ',
        'Sum rows' => 'Somma le righe',
        'Sum columns' => 'somma le colonne',
        'Use cache' => 'Usa cache',
        'Most of the stats can be cached. This will speed up the presentation of this stat.' =>
            'le stat possono usare il meccanismo della cache ',
        'If set to invalid end users can not generate the stat.' => 'Se impostato a invalido gli utenti finali non possono generare la statistica.',

        # Template: AgentStatsEditValueSeries
        'Here you can define the value series.' => 'Qui si può definire la serie di valori',
        'You have the possibility to select one or two elements.' => 'Si a la possibilità di selezionare uno o due elementi.',
        'Then you can select the attributes of elements.' => 'Dopo di che si può scegliere gli attributi degli elementi.',
        'Each attribute will be shown as single value series.' => 'Ogni attributo sarà visualizzato come una singola serie di valori.',
        'If you don\'t select any attribute all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            '',
        'Scale' => 'scala valori',
        'minimal' => 'minimo',
        'Please remember, that the scale for value series has to be larger than the scale for the X-axis (e.g. X-Axis => Month, ValueSeries => Year).' =>
            'Ricorda, la scala dei valori deve essere piu ampia della scala per la X-axis (esempio X-Axis => Mesi , ValueSeries => Anni).',

        # Template: AgentStatsEditXaxis
        'Here you can define the x-axis. You can select one element via the radio button.' =>
            'Qui si può definire l\'asse X. Si può scegliere un elemento tramite il bottone radio.',
        'maximal period' => 'Periodo Massimo',
        'minimal scale' => 'Intervallo minimo',

        # Template: AgentStatsImport
        'Import Stat' => 'Importa Statistica',
        'File is not a Stats config' => 'File non corrisponde a configurazione di stat',
        'No File selected' => 'file non selezionato',

        # Template: AgentStatsOverview
        'Stats' => 'Statistiche',

        # Template: AgentStatsPrint
        'Print' => 'Stampa',
        'No Element selected.' => 'nessun elemento selezionato',

        # Template: AgentStatsView
        'Export config' => 'Esporta configurazione',
        'With the input and select fields you can influence the format and contents of the statistic.' =>
            '',
        'Exactly what fields and formats you can influence is defined by the statistic administrator.' =>
            '',
        'Stat Details' => 'Dettagli statistica',
        'Format' => 'Formato',
        'Graphsize' => 'Dimensione Immagine',
        'Cache' => '',
        'Exchange Axis' => 'Scambia assi',
        'Configurable params of static stat' => 'Parametri configurabili per le statistiche ',
        'No element selected.' => 'nessun elemento selezionato',
        'maximal period from' => 'Periodo massimo da ',
        'to' => 'a',

        # Template: AgentTicketActionCommon
        'Change Free Text of Ticket' => 'Cambia Testo Libero di un Ticket',
        'Change Owner of Ticket' => 'Cambia proprietario ticket',
        'Close Ticket' => 'Chiudi ticket',
        'Add Note to Ticket' => 'Aggiungi nota al ticket',
        'Set Pending' => 'Imposta attesa',
        'Change Priority of Ticket' => 'Cambia priorità del ticket',
        'Change Responsible of Ticket' => 'Cambia responsabile ticket',
        'Cancel & close window' => 'Annulla e chiudi finestra',
        'Service invalid.' => 'Servizio non valido.',
        'New Owner' => 'Nuovo Gestore',
        'Please set a new owner!' => 'Si prega di impostare un nuovo proprietario!',
        'Previous Owner' => 'Gestore precedente',
        'Inform Agent' => 'Informa Operatore',
        'Optional' => 'Opzionale',
        'Inform involved Agents' => 'Informa gli operatori coinvolti',
        'Spell check' => 'Controllo ortografico',
        'Note type' => 'Tipologia della nota',
        'Next state' => 'Stato successivo',
        'Pending date' => 'In attesa fino a',
        'Date invalid!' => 'Data invalida!',

        # Template: AgentTicketActionPopupClose

        # Template: AgentTicketBounce
        'Bounce Ticket' => '',
        'Bounce to' => 'Rispedisci a',
        'You need a email address.' => 'E\' necessario un indirizzo email.',
        'Need a valid email address or don\'t use a local email address.' =>
            'E\' necessario un indirizzo email valido o non usare un indirizzo email locale.',
        'Next ticket state' => 'Stato successivo della richiesta',
        'Inform sender' => 'Informa il mittente',
        'Send mail!' => 'Invia messaggio!',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Azione di massa',
        'Send Email' => '',
        'Merge to' => 'Unisci a',
        'Invalid ticket identifier!' => 'Identificatore ticket non valido!',
        'Merge to oldest' => 'Unisci a precedente',
        'Link together' => 'Collega',
        'Link to parent' => 'Collega a genitore',
        'Unlock tickets' => 'Sblocca ticket',

        # Template: AgentTicketClose

        # Template: AgentTicketCompose
        'Compose answer for ticket' => 'Componi la risposta alla richiesta',
        'Remove Ticket Customer' => '',
        'Please remove this entry and enter a new one with the correct value.' =>
            '',
        'Please include at least one recipient' => '',
        'Remove Cc' => '',
        'Remove Bcc' => '',
        'Address book' => 'Rubrica',
        'Pending Date' => 'Attesa fino a',
        'for pending* states' => 'per gli stati di attesa*',
        'Date Invalid!' => 'Data non valida!',

        # Template: AgentTicketCustomer
        'Change customer of ticket' => 'Modifica il cliente della richiesta',
        'Customer Data' => 'Dati del cliente',
        'Customer user' => 'Utente cliente',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => 'Crea nuovo ticket email',
        'From queue' => 'Dalla coda',
        'To customer' => '',
        'Please include at least one customer for the ticket.' => '',
        'Get all' => 'Prendi tutto',

        # Template: AgentTicketEscalation

        # Template: AgentTicketForward
        'Forward ticket: %s - %s' => '',
        'Need a valid email address or don\'t use a local email address' =>
            'E\' necessario un indirizzo email valido o non usare un indirizzo email locale.',

        # Template: AgentTicketFreeText

        # Template: AgentTicketHistory
        'History of' => 'Storico di',
        'History Content' => 'Contenuto delo storico',
        'Zoom view' => '',

        # Template: AgentTicketMerge
        'Ticket Merge' => 'Unisci Richiesta',
        'You need to use a ticket number!' => 'Devi usare un numero di richiesta',
        'A valid ticket number is required.' => 'Serve un numero ticket valido.',
        'Need a valid email address.' => 'Serve un indirizzo email valido',

        # Template: AgentTicketMove
        'Move Ticket' => 'Sposta la richiesta',
        'New Queue' => 'Nuova coda',

        # Template: AgentTicketNote

        # Template: AgentTicketOverviewMedium
        'Select all' => 'Seleziona tutto',
        'No ticket data found.' => 'Non sono stati trovati dati ticket.',
        'First Response Time' => 'Tempo iniziale per risposta',
        'Service Time' => 'Tempo per Servizio',
        'Update Time' => 'Tempo per aggiornamento',
        'Solution Time' => 'Tempo per soluzione',
        'Move ticket to a different queue' => 'Sposta il ticket ad una coda differente',
        'Change queue' => 'Cambia coda',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Modifica le opzioni di ricerca',
        'Tickets per page' => '',

        # Template: AgentTicketOverviewPreview
        '","26' => '',

        # Template: AgentTicketOverviewSmall
        'Escalation in' => 'Scala in',
        'Locked' => 'In gestione',
        '","30' => '',

        # Template: AgentTicketOwner

        # Template: AgentTicketPending

        # Template: AgentTicketPhone
        'Create New Phone Ticket' => 'Crea nuovo ticket telefonico',
        'From customer' => 'Dal cliente',
        'To queue' => 'Alla coda',

        # Template: AgentTicketPhoneCommon
        'Phone call' => 'Chiamata telefonica ',

        # Template: AgentTicketPlain
        'Email Text Plain View' => 'Visualizzazione plain del corpo dell\'email',
        'Plain' => '',
        'Download this email' => 'Scarica questa email',

        # Template: AgentTicketPrint
        'Ticket-Info' => 'Richiesta-Info',
        'Accounted time' => 'Tempo addebitato',
        'Linked-Object' => 'Oggetto Collegato',
        'by' => 'da',

        # Template: AgentTicketPriority

        # Template: AgentTicketQueue

        # Template: AgentTicketResponsible

        # Template: AgentTicketSearch
        'Search template' => 'Modello di ricerca',
        'Create Template' => 'Crea template',
        'Create New' => 'Crea nuovo',
        'Profile link' => '',
        'Save changes in template' => 'Salva modifiche al template',
        'Add another attribute' => 'Aggiungi un altro attributo',
        'Output' => 'Tipo di risultato',
        'Fulltext' => 'Testo libero',
        'Remove' => 'Rimuovi',
        'Customer User Login' => 'Identificativo di Accesso del Cliente',
        'Created in Queue' => 'Creata nella Coda',
        'Lock state' => 'Blocca stato',
        'Watcher' => 'Osservatore',
        'Article Create Time (before/after)' => 'Tempo di creazione articolo (prima/dopo)',
        'Article Create Time (between)' => 'Tempo di creazione articolo (in mezzo)',
        'Ticket Create Time (before/after)' => 'Tempo di creazione ticket (prima/dopo)',
        'Ticket Create Time (between)' => 'Tempo di creazione ticket (in mezzo)',
        'Ticket Change Time (before/after)' => 'Tempo di modifica ticket (prima/dopo)',
        'Ticket Change Time (between)' => 'Tempo di modifica ticket (in mezzo)',
        'Ticket Close Time (before/after)' => 'Tempo di chiusura ticket (prima/dopo)',
        'Ticket Close Time (between)' => 'Tempo di chiusura ticket (in mezzo)',
        'Archive Search' => 'Ricerca archivio',
        'Run search' => '',

        # Template: AgentTicketSearchOpenSearchDescriptionFulltext

        # Template: AgentTicketSearchOpenSearchDescriptionTicketNumber

        # Template: AgentTicketSearchResultPrint

        # Template: AgentTicketZoom
        'Article filter' => 'Filtro articolo',
        'Article Type' => 'Tipo Articolo',
        'Sender Type' => '',
        'Save filter settings as default' => 'Salva config filtri come default',
        'Ticket Information' => 'Informazioni sul ticket',
        'Linked Objects' => 'Oggetti collegati',
        'Article(s)' => 'Articoli',
        'Change Queue' => 'Cambia coda',
        'Article Filter' => 'Filtro articoli',
        'Add Filter' => 'Aggiungi filtro',
        'Set' => 'Impostazione',
        'Reset Filter' => 'Reimposta filtro',
        'Show one article' => 'Mostra un articolo',
        'Show all articles' => 'Mostra tutti gli articoli',
        'Unread articles' => 'Articoli non letti',
        'No.' => '',
        'Unread Article!' => 'Articolo non letto!',
        'Incoming message' => 'Messaggio in entrata',
        'Outgoing message' => 'Messaggio in uscita',
        'Internal message' => 'Messaggio interno',
        'Resize' => 'Ridimensiona',

        # Template: AttachmentBlocker
        'To protect your privacy, active or/and remote content has blocked.' =>
            'Per proteggere la sua privacy, del contenuto attivo e/o remoto è stato bloccato.',
        'Load blocked content.' => 'Carica contenuto bloccato.',

        # Template: Copyright

        # Template: CustomerAccept

        # Template: CustomerError
        'Traceback' => 'Dettaglio della tracciatura ',

        # Template: CustomerFooter
        'Powered by' => 'Fornito da',
        'One or more errors occurred!' => 'Si sono verificati uno o più errori!',
        'Close this dialog' => 'Chiudere questa schermata',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'Impossibile aprire una finestra di popup. Si prega di disabilitare ogni bloccatore di popup per questa applicazione.',

        # Template: CustomerHeader

        # Template: CustomerLogin
        'Login' => 'Accesso',
        'User name' => 'Nome utente',
        'Your user name' => 'Il suo user name',
        'Your password' => 'La sua password',
        'Forgot password?' => 'Password dimenticata?',
        'Log In' => 'Accesso',
        'Not yet registered?' => 'Non ancora registrato?',
        'Sign up now' => 'Registrazione',
        'Request new password' => 'Richiedi una nuova password',
        'Your User Name' => 'Il suo user name',
        'A new password will be sent to your email address.' => 'Una nuova password verrà invata al suo indirizzo email.',
        'Create Account' => 'Registrati',
        'Please fill out this form to receive login credentials.' => '',
        'How we should address you' => 'Come chiamarla',
        'Your First Name' => 'Il suo nome',
        'Please supply a first name' => 'Si prega di inserire un nome',
        'Your Last Name' => 'Il suo cognome',
        'Please supply a last name' => 'Si prega di inserire un cognome',
        'Your email address (this will become your username)' => '',
        'Please supply a' => 'Si prega di inserire un',

        # Template: CustomerNavigationBar
        'Edit personal preferences' => 'Modifica impostazioni personali',
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
        'Profile' => 'Profilo',
        'e. g. 10*5155 or 105658*' => '',
        'Customer ID' => 'ID Cliente',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => 'Ricerca a testo nei ticket (e. g. "John*n" or "Will*")',
        'Recipient' => 'Destinatario',
        'Carbon Copy' => 'Copia Carbone',
        'Time restrictions' => 'Restrizioni di tempo',
        'No time settings' => '',
        'Only tickets created' => 'Solo ticket creati',
        'Only tickets created between' => 'Solo ticket creati tra',
        'Ticket archive system' => '',
        'Save search as template?' => '',
        'Save as Template?' => 'Salvare come template?',
        'Save as Template' => '',
        'Template Name' => 'Nome template',
        'Pick a profile name' => '',
        'Output to' => 'Output',

        # Template: CustomerTicketSearchOpenSearchDescription

        # Template: CustomerTicketSearchResultPrint

        # Template: CustomerTicketSearchResultShort
        'of' => 'di',
        'Page' => 'Pagina',
        'Search Results for' => 'Risultati di ricerca per',
        '","18' => '',

        # Template: CustomerTicketZoom
        'Expand article' => '',
        'Reply' => 'Risposta',

        # Template: CustomerWarning

        # Template: Datepicker
        'Invalid date (need a future date)!' => 'Data non valida (è necessaria una data nel futuro)!',
        'Previous' => 'Precedente',
        'Sunday' => 'Domenica',
        'Monday' => 'Lunedì',
        'Tuesday' => 'Martedì',
        'Wednesday' => 'Mercoledì',
        'Thursday' => 'Giovedì',
        'Friday' => 'Venerdì',
        'Saturday' => 'Sabato',
        'Su' => 'Do',
        'Mo' => 'Lu',
        'Tu' => 'Ma',
        'We' => 'Me',
        'Th' => 'Gi',
        'Fr' => 'Ve',
        'Sa' => 'Sa',
        'Open date selection' => 'Apri selezione data',

        # Template: Error
        'Oops! An Error occurred.' => 'Oops! Si è verificato un errore.',
        'Error Message' => 'Messaggio di errore',
        'You can' => 'Si può',
        'Send a bugreport' => 'Inviare un bug report',
        'go back to the previous page' => 'tornare alla pagina precedente',
        'Error Details' => 'Dettagli dell\'errore',

        # Template: Footer
        'Top of page' => 'Inizio della pagina',

        # Template: FooterJS
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Se si abbandona questa pagina, tutti i popup verranno chiusi!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'Un popup di questa schermata è già aperto. Si desidera chiuderlo ed aprire questo invece?',
        'Please enter at least one search value or * to find anything.' =>
            '',

        # Template: FooterSmall

        # Template: HTMLHead

        # Template: HTMLHeadBlockEvents

        # Template: Header
        'You are logged in as' => 'Si è effettuato l\'accesso come',

        # Template: HeaderSmall

        # Template: Installer
        'JavaScript not available' => 'JavaScript non disponibile',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            'Per poter usare OTRS, è necessario abilitare JavaScript nel browser.',
        'Database Settings' => 'Impostazion Database',
        'General Specifications and Mail Settings' => 'Specifiche generiche ed impostazioni email',
        'Registration' => '',
        'Welcome to %s' => 'Benvenuto in %s',
        'Web site' => '',
        'Database check successful.' => 'Controllo database eseguito con successo.',
        'Mail check successful.' => 'Controllo email eseguito con successo.',
        'Error in the mail settings. Please correct and try again.' => 'Errore nelle impostazioni dell\'email. Correggere e riprovare.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => 'Configura posta in uscita',
        'Outbound mail type' => 'Tipo di posta in uscita',
        'Select outbound mail type.' => 'Selezionare il tipo di posta in uscita',
        'Outbound mail port' => 'Porta del server di posta',
        'Select outbound mail port.' => 'Selezionare la porta del server di posta',
        'SMTP host' => '',
        'SMTP host.' => '',
        'SMTP authentication' => 'Autenticazione SMTP',
        'Does your SMTP host need authentication?' => 'Serve autenticazione SMTP per questo host?',
        'SMTP auth user' => '',
        'Username for SMTP auth.' => 'Username per l\'autenticazione SMTP',
        'SMTP auth password' => '',
        'Password for SMTP auth.' => 'Password per l\'autenticazione SMTP',
        'Configure Inbound Mail' => 'Configura posta in entrata',
        'Inbound mail type' => 'Tipo posta in entrata',
        'Select inbound mail type.' => 'Selezionare il tipo di posta in entrata',
        'Inbound mail host' => 'Host di posta in entrata',
        'Inbound mail host.' => 'Host di posta in entrata',
        'Inbound mail user' => 'Host di posta in entrata',
        'User for inbound mail.' => 'Username per la posta in entrata',
        'Inbound mail password' => 'Password per la posta in entrata',
        'Password for inbound mail.' => 'Password per la posta in entrata',
        'Result of mail configuration check' => 'Risultato del controllo di configurazione della posta',
        'Check mail configuration' => 'Controllo configurazione della posta',
        'Skip this step' => 'Salta questo passaggio',
        'Skipping this step will automatically skip the registration of your OTRS. Are you sure you want to continue?' =>
            '',

        # Template: InstallerDBResult
        'False' => 'Falso',

        # Template: InstallerDBStart
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty. For security reasons we do recommend setting a root password. For more information please refer to your database documentation.' =>
            'Se hei una passwd per accesso al db , devi inserirla qui. Se no lascia il campo vuoto. Per maggiori info sulla sicurezza sul db consulta il manuale ',
        'Currently only MySQL is supported in the web installer.' => 'Momentaneamente è supportato sulo MySQL dall\'installer web.',
        'If you want to install OTRS on another database type, please refer to the file README.database.' =>
            'Se si desidera installare OTRS su un altro database, riferirsi al file README.database',
        'Database-User' => 'Utente DB',
        'New' => 'Nuovi',
        'A new database user with limited rights will be created for this OTRS system.' =>
            'Verrà creato un nuovo database a permessi limitati per questo sistema OTRS',
        'default \'hot\'' => '\'hot\' predefinito',
        'DB--- host' => '',
        'Check database settings' => 'Controlla impostazioni database',
        'Result of database check' => 'Risultato del controllo database',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Per poter usare OTRS devi inserire questa riga di comando in una shell come utente root.',
        'Restart your webserver' => 'Riavvia il tuo server web',
        'After doing so your OTRS is up and running.' => 'Dopo di ciò OTRS sarà pronto all\'uso.',
        'Start page' => 'Pagina iniziale',
        'Your OTRS Team' => 'Gruppo di sviluppo di OTRS',

        # Template: InstallerLicense
        'Accept license' => 'accetto ',
        'Don\'t accept license' => 'non accetto ',

        # Template: InstallerLicenseText

        # Template: InstallerRegistration
        'Organization' => 'Azienda',
        'Position' => '',
        'Complete registration and continue' => '',
        'Please fill in all fields marked as mandatory.' => '',

        # Template: InstallerSystem
        'SystemID' => 'ID del sistema',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'L\'identificatore di questo sistema. Ogni numero di ticket e ogni ID di sessione HTTP contengono questo numero.',
        'System FQDN' => 'FQDN del sistema',
        'Fully qualified domain name of your system.' => 'Nome FQDN di questo sistema',
        'AdminEmail' => 'Admin Email',
        'Email address of the system administrator.' => 'Indirizzo dell\'amministratore di sistema.',
        'Log' => '',
        'LogModule' => 'Modulo di log',
        'Log backend to use.' => 'Backend di log da usare',
        'LogFile' => 'File di log',
        'Log file location is only needed for File-LogModule!' => 'La posizione del file di log serve solo per File-LogModule!',
        'Webfrontend' => 'Interfaccia web',
        'Default language' => 'Lingua di default',
        'Default language.' => 'Lingua di default.',
        'CheckMXRecord' => 'Controlli sui record MX',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'Gli indirizzi scritti a mano vengono controllati tramite i record MX trovati nei DNS. Non usare questa opzione se il DNS usato dalla macchina è lento o non risolve gli indirizzi pubblici.',

        # Template: LinkObject
        'Object#' => '',
        'Add links' => 'Aggiungi link',
        'Delete links' => 'Elimina link',

        # Template: Login
        'JavaScript Not Available' => 'JavaScript non disponibile',
        'Browser Warning' => '',
        'The browser you are using is too old.' => 'Il browser in uso è obsoleto.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            'OTRS funziona con una quantità innumerevole di browser, si prega di utilizzare uno di essi.',
        'Please see the documentation or ask your admin for further information.' =>
            'Si prega di consultare la documentazione oppure cheidere all\'amministratore per informazioni addizionali.',
        'Lost your password?' => 'Hai dimenticato la password?',
        'Request New Password' => 'Richiedi nuova password',
        'Back to login' => 'Torna all\'accesso',

        # Template: Motd
        'Message of the Day' => 'Messaggio del giorno',

        # Template: NoPermission
        'Insufficient Rights' => 'Permessi insufficienti',
        'Back to the previous page' => 'Pagina precedente',

        # Template: Notify

        # Template: Pagination
        'Show first page' => 'Mostra prima pagina',
        'Show previous pages' => 'Mostra pagine precedenti',
        'Show page %s' => 'Mostra pagina %s',
        'Show next pages' => 'Mostra pagine successive',
        'Show last page' => 'Mostra ultima pagina',

        # Template: PictureUpload
        'Need FormID!' => 'FormID necessario!',
        'No file found!' => 'Nessun file trovato!',
        'The file is not an image that can be shown inline!' => 'Il file non è un\'immagine che può essere mostrata in linea!',

        # Template: PrintFooter
        'URL' => '',

        # Template: PrintHeader
        'printed by' => 'stampato da',

        # Template: PublicDefault

        # Template: Redirect

        # Template: RichTextEditor

        # Template: SpellingInline

        # Template: Test
        'OTRS Test Page' => 'Pagina di test OTRS',
        'Welcome %s' => 'Benvenuto/a %s',
        'Counter' => 'Contatore',

        # Template: Warning
        'Go back to the previous page' => 'Torna alla pagina precedente',

        # SysConfig
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'Modulo ACL che permette di chiudere ticket genitori solo se tutti i ticket figli sono già chiusi ("Stato" mostra quali stati non sono disponibili per il ticket padre finché non sono chiusi tutti i figli).',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Attiva il meccanismo di blinking della coda che contiene il ticket più vecchio.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Attiva la funzione password dimenticata per gli agenti, nell\'interfaccia per agenti.',
        'Activates lost password feature for customers.' => 'Attiva la funzione di password dimenticata per i clienti.',
        'Activates support for customer groups.' => 'Attiva il supporto per i gruppi di clienti.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Attiva il filtro degil articoli nella visualizzazione zoom per specificare quali articolo devono essere mostrati.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Attiva i temi disponibili sul sistema. Il valore 1 significa attivi, 0 significa inattivi.',
        'Activates the ticket archive system search in the customer interface.' =>
            '',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Attiva il sistema di archivio dei ticket per avere un sistema più veloce spostando alcuni ticket fuori dallo scopo giornaliero. Per cercare questi ticket, la flag archivio deve essere abilitata nella ricerca dei ticket.',
        'Activates time accounting.' => 'Attiva l\'acconto del tempo.',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            'Aggiunge un suffisso con l\'attuale anno e mese nel log di OTRS. Verrà creato un log per ogni mese.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface.' =>
            'Aggiunge gli indirizzi email dei clienti per i destinatari nella schermata di composizione del ticket dell\'interfaccia dell\'agente.',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza singoli. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza permanenti. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Agent Notifications' => 'Notifiche degli agenti',
        'Agent interface article notification module to check PGP.' => 'Modulo di notifica degli articoli dell\'interfaccia agente per il controllo PGP',
        'Agent interface article notification module to check S/MIME.' =>
            'Modulo di notifica degli articoli dell\'interfaccia agente per il controllo S/MIME',
        'Agent interface module to access fulltext search via nav bar.' =>
            'Modulo dell\'interfaccia degli agenti per accedere alla ricerca fulltext tramite barra di navigazione',
        'Agent interface module to access search profiles via nav bar.' =>
            'Modulo dell\'interfaccia degli agenti per accedere ai profili di ricerca tramite barra di navigazione',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Modulo dell\'interfaccia degli agenti per controllare le email in entrata nella visualizzazione ticket zoom se S/MIME è disponibile e attivo',
        'Agent interface notification module to check the used charset.' =>
            'Modulo dell\'interfaccia degli agenti per controllare il charset usato.',
        'Agent interface notification module to see the number of tickets an agent is responsible for.' =>
            'Modulo dell\'interfaccia degli agenti per vedere il numero di ticket di cui è responsabile l\'agente.',
        'Agent interface notification module to see the number of watched tickets.' =>
            'Modulo dell\'interfaccia degli agenti per vedere il numero di ticket sotto osservazione.',
        'Agents <-> Groups' => 'Agenti <-> Gruppi',
        'Agents <-> Roles' => 'Agenti <-> Ruoli',
        'Allows adding notes in the close ticket screen of the agent interface.' =>
            'Permette di aggiungere note nella schermata di chiusura ticket dell\'interfaccia agente.',
        'Allows adding notes in the ticket free text screen of the agent interface.' =>
            'Permette di aggiungere note nella schermata di free text dei ticket dell\'interfaccia agente.',
        'Allows adding notes in the ticket note screen of the agent interface.' =>
            'Permette di aggiungere note nella schermata di note dei ticket dell\'interfaccia agente.',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Permette di aggiungere note nella schermata di responsabilità di un ticket sotto zoom da parte dell\'agente',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Permette di aggiungere note nella schermata di attesa di un ticket sotto zoom da parte dell\'agente',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Permette di aggiungere note nella schermata di priorità di un ticket sotto zoom da parte dell\'agente',
        'Allows adding notes in the ticket responsible screen of the agent interface.' =>
            'Permette di aggiungere note nella schermata di responsabilità di un ticket da parte dell\'agente',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Permette agli agenti di scambiare le assi di una statistica che generano',
        'Allows agents to generate individual-related stats.' => 'Permette agli agenti di generare statistiche individuali',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Permette di scegliere tra mostrare gli allegati nel browser o renderli scaricabili',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Permete di scegliere il prossimo stato di composizione nella schermata dei ticket dei clienti.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Permette ai clienti di cambiare la priorità dei ticket nell\'interfaccia cliente.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Permette ai clienti di impostare la SLA dei ticket nell\'interfaccia cliente.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Permette ai clienti di impostare la priorità dei ticket nell\'interfaccia cliente.',
        'Allows customers to set the ticket queue in the customer interface. If this is set to \'No\', QueueDefault should be configured.' =>
            'Permette ai clienti di impostare la coda dei ticket nell\'interfaccia cliente. Se impostato su No, si deve configurare QueueDefault',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Permette ai clienti di impostare il servizio dei ticket nell\'interfaccia cliente.',
        'Allows defining new types for ticket (if ticket type feature is enabled).' =>
            'Permette di definire nuovi tipi di ticket (se è abilitata la funzione ticket type)',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Permette di definire servizi e SLA per i ticket (e.g. email, desktop, network, ...), e attributi di scalo per gli SLA (se è abilitata la funzione servizio/SLA)',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search w. g. with this kind of conditions like "(key1&&key2)" or "(key1||key2)".' =>
            'Permette di usare le condizioni avanzate di ricerca nell\'interfaccia degli agenti. Con questa funzione si può cercare con condizioni del tipo "(chiave1&&chiave2)" o "(chiave1||chiave2)"',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search w. g. with this kind of conditions like "(key1&&key2)" or "(key1||key2)".' =>
            'Permette di usare le condizioni avanzate di ricerca nell\'interfaccia dei clienti. Con questa funzione si può cercare con condizioni del tipo "(chiave1&&chiave2)" o "(chiave1||chiave2)"',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Permette di avere il formato medio nella visualizzazione dei ticket (CustomerInfo =>1 - mostra anche le informazioni del cliente)',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Permette di avere il formato piccolo nella visualizzazione dei ticket (CustomerInfo =>1 - mostra anche le informazioni del cliente)',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Permette agli amministratori di effettuare l\'accesso come altri utenti, tramite il pannelo di amministrazione.',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Permette di impostare un nuovo stato di ticket nella schermata di movimento ticket dell\'interfaccia degli agenti.',
        'Attachments <-> Responses' => 'Allegati <-> Risposte',
        'Auto Responses <-> Queues' => 'Risposte automatiche <-> Code',
        'Automated line break in text messages after x number of chars.' =>
            'A capo automatico nelle linee dopo X caratteri',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Prendi in carico automaticamente sull\'agente corrente dopo aver selezionato un\'azione in blocco.',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled).' =>
            'Imposta automaticamente il proprietario di un ticket come responsabile del ticket (se la funzione di responsabilità è abilitata).',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Imposta automaticamente la responsabilità del ticket (se non è già impostata) dopo il primo cambio di proprietà.',
        'Balanced white skin by Felix Niklas.' => 'Tema Balanced White by Felix Niklas.',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Blocca tutte le email in entrata che non hanno un numero di ticket valdo nell\'oggetto con indirizzi Da: @esempio.com',
        'Builds an article index right after the article\'s creation.' =>
            'Costruisce un indice degli articoli subito dopo la creazione dell\'articolo.',
        'CMD example setup. Ignores emails where external CMD returns some output on STDOUT (email will be piped into STDIN of some.bin).' =>
            'Setup di esempio di CMD. Ignora le email dove il comando esterno CMD ritorna un certo output in STDOUT (le email verranno messe in pipe STDIN a qualcosa.bin).',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for the web service config backend.' => '',
        'Change password' => 'Cambio password',
        'Change queue!' => 'Cambio coda!',
        'Change the customer for this ticket' => '',
        'Change the free fields for this ticket' => '',
        'Change the priority for this ticket' => '',
        'Change the responsible person for this ticket' => '',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Cambia il proprietario del ticket a tutti (utile per ASP). Normalmente solo gli agenti con permessi R/W sulla coda del ticket verranno mostrati.',
        'Checkbox' => '',
        'Checks the SystemID in ticket number detection for follow-ups (use "No" if SystemID has been changed after using the system).' =>
            'Controlla il SystemID nel rilevamento del numero di ticket per i follow-up (usare "No" se il SystemID è stato cambiato dopo aver usato il sistema).',
        'Closed tickets of customer' => '',
        'Comment for new history entries in the customer interface.' => 'Commento per nuove entry nello storico dell\'interfaccia cliente.',
        'Companies' => 'Compagnie',
        'Company Tickets' => 'Ticket della compagnia',
        'Company name for the customer web interface. Will also be included in emails as an X-Header.' =>
            '',
        'Configure your own log text for PGP.' => '',
        'Configures a default TicketDynmicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (http://doc.otrs.org/), chapter "Ticket Event Module".' =>
            '',
        'Configures the full-text index. Execute "bin/otrs.RebuildFulltextIndex.pl" in order to generate a new index.' =>
            'Configura l\'indice full-text. Eseguire "bin/otrs.RebuildFulltextIndex.pl" per generare un nuovo indice.',
        'Controls if customers have the ability to sort their tickets.' =>
            'Controlla se i clienti hanno la possibilità di ordinare i loro ticket.',
        'Converts HTML mails into text messages.' => 'Converte la posta in HTML in messaggi di testo.',
        'Create and manage Service Level Agreements (SLAs).' => 'Crea e gestisce gli SLA',
        'Create and manage agents.' => 'Crea e gestisce gli agenti',
        'Create and manage attachments.' => 'Crea e gestisce gli allegati',
        'Create and manage companies.' => 'Crea e gestisce le compagnie',
        'Create and manage customers.' => 'Crea e gestisce i clienti',
        'Create and manage dynamic fields.' => '',
        'Create and manage event based notifications.' => 'Crea e gestisce le notifiche basate su eventi',
        'Create and manage groups.' => 'Crea e gestisce i gruppi',
        'Create and manage notifications that are sent to agents.' => 'Crea e gestisce le notifiche che vengono inviate agli agenti.',
        'Create and manage queues.' => 'Crea e gestisce le code.',
        'Create and manage response templates.' => 'Crea e gestisce i template di risposta.',
        'Create and manage responses that are automatically sent.' => 'Crea e gestisce le risposte che vengono inviate automaticamente.',
        'Create and manage roles.' => 'Crea e gestisce i ruoli.',
        'Create and manage salutations.' => 'Crea e gestisce i saluti.',
        'Create and manage services.' => 'Crea e gestisce i servizi.',
        'Create and manage signatures.' => 'Crea e gestisce le firme.',
        'Create and manage ticket priorities.' => 'Crea e gestisce le priorità dei ticket.',
        'Create and manage ticket states.' => 'Crea e gestisce gli stati dei ticket.',
        'Create and manage ticket types.' => 'Crea e gestisce i tipi di ticket.',
        'Create and manage web services.' => '',
        'Create new email ticket and send this out (outbound)' => 'Crea un nuovo ticket email e invia questo (esternamente)',
        'Create new phone ticket (inbound)' => 'Crea un nuovo ticket telefonico (internamente)',
        'Custom text for the page shown to customers that have no tickets yet.' =>
            '',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customers <-> Groups' => 'Clienti <-> Gruppi',
        'Customers <-> Services' => 'Clienti <-> Servizi',
        'DEPRECATED! This setting is not used any more and will be removed in a future version of OTRS.' =>
            '',
        'Data used to export the search result in CSV format.' => 'Dati usati per esportare i risultati di ricerca in formato CSV',
        'Date / Time' => '',
        'Debugs the translation set. If this is set to "Yes" all strings (text) without translations are written to STDERR. This can be helpful when you are creating a new translation file. Otherwise, this option should remain set to "No".' =>
            'Debug del set di traduzione. Se questo è impostato a "Sì" tutte le stringhe (testo) non tradotte sono scritte su STDERR. Può essere utile quando si crea un nuovo file di traduzione. Altrimenti, questa opzione dovrebbe rimanere impostata su "No".',
        'Default ACL values for ticket actions.' => 'ACL di default per le azioni sui ticket.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            '',
        'Default loop protection module.' => 'Modulo di default per la protezione dei loop',
        'Default queue ID used by the system in the agent interface.' => 'ID di coda di default usato dal sistema nell\'interfaccia degli agenti',
        'Default skin for OTRS 3.0 interface.' => 'Tema di default per l\'interfaccia OTRS 3.0.',
        'Default skin for interface.' => 'Tema di default per l\'interfaccia.',
        'Default ticket ID used by the system in the agent interface.' =>
            'Ticked ID di default usato dal sistema nell\'interfaccia agenti.',
        'Default ticket ID used by the system in the customer interface.' =>
            'Ticked ID di default usato dal sistema nell\'interfaccia clienti.',
        'Default value for NameX' => '',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definisce un filtro per l\'output HTML per aggiungere link dietro una determinata stringa. L\'elemento Image permette due tipi di input. Uno è il nome di una certa immagine (ad es. faq.png). In questo caso verrà usata la path delle immagini di OTRS. La seconda possibilità è inserire un link all\'immagine.',
        'Define the start day of the week for the date picker.' => 'Definire il giorno di inizio settimana per il selezionatore di date.',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Definire un oggetto cliente, che genera l\'icona LinkedIn alla fine di un blocco di informazioni cliente.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Definire un oggetto cliente, che genera l\'icona XING alla fine di un blocco di informazioni cliente.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Definire un oggetto cliente, che genera l\'icona Google alla fine di un blocco di informazioni cliente.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Definire un oggetto cliente, che genera l\'icona Google Maps alla fine di un blocco di informazioni cliente.',
        'Defines a default list of words, that are ignored by the spell checker.' =>
            'Definire una lista di parole che vengono ignorate dal controllo ortografico.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definire un filtro per l\'output HTML per aggiungere i link dietro ai numeri CVE. L\'elemento Image permette due tipi di input. Uno è il nome di una certa immagine (ad es. faq.png). In questo caso verrà usata la path delle immagini di OTRS. La seconda possibilità è inserire un link all\'immagine.',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definire un filtro per l\'output HTML per aggiungere i link dietro ai numeri MSBulletin. L\'elemento Image permette due tipi di input. Uno è il nome di una certa immagine (ad es. faq.png). In questo caso verrà usata la path delle immagini di OTRS. La seconda possibilità è inserire un link all\'immagine.',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definire un filtro per l\'output HTML per aggiungere i link dietro una determinata stringa. L\'elemento Image permette due tipi di input. Uno è il nome di una certa immagine (ad es. faq.png). In questo caso verrà usata la path delle immagini di OTRS. La seconda possibilità è inserire un link all\'immagine.',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definire un filtro per l\'output HTML per aggiungere i link dietro ai numeri bugtraq. L\'elemento Image permette due tipi di input. Uno è il nome di una certa immagine (ad es. faq.png). In questo caso verrà usata la path delle immagini di OTRS. La seconda possibilità è inserire un link all\'immagine.',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            'Definire un filtro per analizzare il testo negli articoli, in modo da evidenziare certe parole chiave.',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            'Definire un\'espressione regolare che esclude alcuni indirizzi dal controllo sintattico (se "CheckEmailAddress" è impostato a "Sì"). Inserire una regex in qeusto campo per gli indirizzi email, che non sono sintatticamente validi, ma che sono necessari per il sistema (ad es. "root@localhost").',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            'Definisce un\'espressione regolare che filtra tutti gli indirizzi email che non dovrebbero essere usati nell\'applicazione.',
        'Defines a useful module to load specific user options or to display news.' =>
            'Definisce un modulo utile per caricare opzioni utente specifiche o per mostrare notizie.',
        'Defines all the X-headers that should be scanned.' => 'Definisce tutti gli X-Header che dovrebbero essere esaminati.',
        'Defines all the languages that are available to the application. The Key/Content pair links the front-end display name to the appropriate language PM file. The "Key" value should be the base-name of the PM file (i.e. de.pm is the file, then de is the "Key" value). The "Content" value should be the display name for the front-end. Specify any own-defined language here (see the developer documentation http://doc.otrs.org/ for more infomation). Please remember to use the HTML equivalents for non-ASCII characters (i.e. for the German oe = o umlaut, it is necessary to use the &ouml; symbol).' =>
            'Definisce i linguaggi disponibili nel programma. Le coppie Chiave/Contenuto collegano il nome da mostrare nel frontend al giusto file PM di lingua. Il valore "Key" dovrebbe essere il nome del file PM (ad es. de.pm è il file, quindi de è il corrispondente valore di "Key"). Il valore "Content" dovrebbe essere il nome da mostrare nel frontend. Specificare una lingua personalizzata qui (vedere la documentazione per sviluppatori su http://doc.otrs.org/ per maggiori informazioni). Tenere a mente di usare gli equivalenti HTML per caratteri non-ASCII (ad es. per l\'umlaut tedesco oe = o, è necessario usare il simbolo &ouml;).',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            'Definire tutti i parametri per l\'oggetto RefreshTime nelle preferenze del cliente nell\'interfaccia dei clienti.',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            'Definire tutti i parametri per l\'oggetto ShownTickets nelle preferenze del cliente nell\'interfaccia dei clienti.',
        'Defines all the parameters for this item in the customer preferences.' =>
            'Definire tutti i parametri per questo oggetto nelle preferenze del cliente.',
        'Defines all the possible stats output formats.' => 'Definisce tutti i possibili formati di output delle statistiche.',
        'Defines an alternate URL, where the login link refers to.' => 'Definisce un URL alternativo, a cui si riferisce il link di accesso.',
        'Defines an alternate URL, where the logout link refers to.' => 'Definisce un URL alternativo, a cui si riferisce il link di uscita.',
        'Defines an alternate login URL for the customer panel..' => 'Definisce un URL alternativo, a cui si riferisce il link di accesso del pannello dei clienti.',
        'Defines an alternate logout URL for the customer panel.' => 'Definisce un URL alternativo, a cui si riferisce il link di uscita del pannello dei clienti.',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=$Data{"CustomerID"}\' or \'\').' =>
            'Definisce un link esterno al database del cliente (e.g. \'http://yourhost/customer.php=CID=$Data{"CustomerID"}\' o \'\'.',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'Definisce l\'aspetto del campo Da: delle email (inviate come risposte nei ticket email).',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di chiusura ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di rispedizione ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di composizione ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di inoltro ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di free text dei ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di unione di un ticket sotto zoom dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di note dei ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di proprietà di un ticket sotto zoom dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di attesa di un ticket sotto zoom dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di ticket telefonico in uscita dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di priorità di un ticket sotto zoom dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di responsabilità ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria per un cambio di cliente di un ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l\'agente viene automaticamente impostato come proprietario).',
        'Defines if composed messages have to be spell checked in the agent interface.' =>
            'Definisce se i messaggi composti devono essere controllati ortograficamente nell\'interfaccia degli agenti.',
        'Defines if time accounting is mandatory in the agent interface.' =>
            'Definisce se l\'acconto del tempo è necessario nell\'interfaccia degli agenti.',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            '',
        'Defines scheduler PID update time in seconds (floating point number).' =>
            '',
        'Defines scheduler sleep time in seconds after processing all available tasks (floating point number).' =>
            '',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            'Definisce l\'espressione regolare di IP per accedere al repository locale. E\' necessario abilitare questa funzione per avere accesso al tuo repository locale e il pacchetto package::RepositoryList è richiesto sull\'host remoto.',
        'Defines the URL CSS path.' => 'Definisce la path CSS dell\'URL',
        'Defines the URL base path of icons, CSS and Java Script.' => 'Definisce la path URL di icone, CSS e Java Script.',
        'Defines the URL image path of icons for navigation.' => 'Definisce la path URL delle icone di navigazione.',
        'Defines the URL java script path.' => 'Definisce la path URL dei java script.',
        'Defines the URL rich text editor path.' => 'Definisce la path URL del rich text editor.',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            'Definisce l\'indirizzo di un server DNS dedicato, se necessario, per i look-up di "CheckMXRecord".',
        'Defines the body text for notification mails sent to agents, about new password (after using this link the new password will be sent).' =>
            'Definisce il corpo del testo per le email di notifica inviate agli agenti, riguardo alla nuova password (dopo aver usato questo link la nuova password verrà inviata).',
        'Defines the body text for notification mails sent to agents, with token about new requested password (after using this link the new password will be sent).' =>
            'Definisce il corpo delle email di notifica inviate agli agenti, con il token riguardante la nuova password richiesta (dopo aver usato questo link la nuova password verrà inviata).',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            'Definisce il corpo delle email di notifica inviate ai clienti, circa i nuovi account',
        'Defines the body text for notification mails sent to customers, about new password (after using this link the new password will be sent).' =>
            'Definisce il corpo delle email di notifica inviate ai clienti, circa le nuove password',
        'Defines the body text for notification mails sent to customers, with token about new requested password (after using this link the new password will be sent).' =>
            'Definisce il corpo delle email di notifica inviate ai clienti, con token per la nuova password richiesta (dopo aver usato questo link la nuova password verrà inviata)',
        'Defines the body text for rejected emails.' => 'Definisce il corpo delle email rifiutate.',
        'Defines the boldness of the line drawed by the graph.' => 'Definisce lo spessore della linea disegnata dal grafico.',
        'Defines the colors for the graphs.' => 'Definsice i colori per il grafico.',
        'Defines the column to store the keys for the preferences table.' =>
            'Definisce le colonne in cui memorizzare le chiavi per la tabella delle preferenze.',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            'Definsice i parametri di configurazione per questo oggetto, in modo che vengano mostrate nella schermata delle preferenze.',
        'Defines the config parameters of this item, to be shown in the preferences view. Take care to maintain the dictionaries installed in the system in the data section.' =>
            'Definsice i parametri di configurazione per questo oggetto, in modo che vengano mostrate nella schermata delle preferenze. Ricordarsi di mantenere i dizionari installati nel sistema nella sezione dati.',
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
        'Email Addresses' => 'Indirizzi Email',
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
        'GenericAgent' => 'OperatoreGenerico',
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
        'My Tickets' => 'I miei ticket',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            '',
        'NameX' => '',
        'New email ticket' => '',
        'New phone ticket' => '',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Notifications (Event)' => 'Notifica (Event)',
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
        'Responses <-> Queues' => 'Risposte <-> Code',
        'Restores a ticket from the archive (only if the event is a state change, from closed to any open available state).' =>
            '',
        'Roles <-> Groups' => 'Ruoli <-> Gruppi',
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
        'Select your frontend Theme.' => 'Scegli il tema per la tua interfaccia.',
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
        'Tickets' => 'Richieste',
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
            'La vostra selezione delle code preferite. Se attivato, sarete anche notificati delle modifiche su questa coda',

        #
        # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
        #
        '%s Tickets affected! Do you really want to use this job?' => '%s Tickets affetti! Vuoi veramente usare questo ? ',
        '(Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behinde a dial-up line $!)' =>
            '(Controlla il record MX per i domini degli indirizzi email quando si compone un messaggio. Non usare se il vostro server con OTRS ha una connessione dial-up!)',
        '(Email of the system admin)' => '(Indirizzo email dell\'amministratore di sistema)',
        '(Full qualified domain name of your system)' => '(Nome di dominio completo (FQDN) del sistema)',
        '(Logfile just needed for File-LogModule!)' => '(File di log --- necessario solo per il log su file (File-LogModule))',
        '(Note: It depends on your installation how many dynamic objects you can use)' =>
            '(nota:Dipende dalla tua installazione quanti sono usabili)',
        '(Note: Useful for big databases and low performance server)' => 'Nota: utile con grossi data base e basse performance ',
        '(The identify of the system. Each ticket number and each http session id starts with this number)' =>
            '(ID del sistema. Ogni ID di sessione e numero di ticket inizia con questo numero)',
        '(Ticket identifier. Some people want toset this to e. g. \'Ticket#\', \'Call#\' or \'MyTicket#\')' =>
            '(Prefisso per il numero di ticket --- es. "N.ro Ticket:" o "Ticket#" ecc.)',
        '(Used default language)' => '(Lingua predefinita)',
        '(Used log backend)' => '(Modulo da usare per il log)',
        '(Used ticket number format)' => '(Formato del numero dei ticket)',
        'A article should have a title!' => 'Manca il titolo!',
        'A message must be spell checked!' => 'Il messaggio necessita di correzione ortografica!',
        'A message should have a To: recipient!' => 'Manca il destinatario del messaggio!',
        'A message should have a body!' => 'Un messaggio deve avere un contenuto!',
        'A message should have a subject!' => 'Il messaggio deve avere un oggetto!',
        'A required field is:' => 'Un campo richiesto :',
        'A response is default text to write faster answer (with default text) to customers.' =>
            'Una risposta è un testo predefinito usato per compilare più rapidamente le risposte per i clienti.',
        'A web calendar' => 'Calendario web',
        'A web file manager' => 'Un gestore dei file via web',
        'A web mail client' => 'Un client di web mail',
        'Absolut Period' => 'Periodo assoluto',
        'Activates TypeAhead for the autocomplete feature, that enables users to type in whatever speed they desire, without losing any information. Often this means that keystrokes entered will not be displayed on the screen immediately.' =>
            'Attiva TypeAhead per la funzione di autocompletamento, che permette agli utenti di scrivere alla velocità che vogliono, senza perdere informazioni. Spesso questo significa che i tasti battuti non verranno mostrati sullo schermo immediatamente.',
        'Add Customer User' => 'Inserisci un nuovo Cliente',
        'Add System Address' => 'Inserisci Email di sistema',
        'Add User' => 'inserisci utente ',
        'Add a new Agent.' => 'inserisci nuovo Agente',
        'Add a new Customer Company.' => 'Aggiungi una nuova Azienda Cliente',
        'Add a new Group.' => 'Inserisci un nuovo gruppo',
        'Add a new Notification.' => 'Aggiungi nuova Notifica.',
        'Add a new Priority.' => 'Aggiungi nuova Priorita\' ',
        'Add a new Role.' => 'Aggiungi nuovo Ruolo',
        'Add a new SLA.' => 'Aggiungi nuova SLA.',
        'Add a new Salutation.' => 'aggiungi un nuovo modello di saluti ',
        'Add a new Service.' => 'inserisci un nuovo servizio',
        'Add a new Signature.' => 'inserisci nuova firma',
        'Add a new State.' => 'Aggiungi un nuovo stato',
        'Add a new System Address.' => 'Inserisci nuova Email di sistema',
        'Add a new Type.' => 'Aggiungi nuovo tipo',
        'Add a note to this ticket!' => 'Aggiungi una nota a questa richiesta',
        'Add note to ticket' => 'Aggiungi una nota alla richiesta',
        'Added User "%s"' => 'Utente "%s" aggiunto',
        'Adds the one time vacation days for the calendar number 1. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza singoli per il calendario numero 1. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the one time vacation days for the calendar number 2. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza singoli per il calendario numero 2. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the one time vacation days for the calendar number 3. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza singoli per il calendario numero 3. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the one time vacation days for the calendar number 4. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza singoli per il calendario numero 4. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the one time vacation days for the calendar number 5. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza singoli per il calendario numero 5. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the one time vacation days for the calendar number 6. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza singoli per il calendario numero 6. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the one time vacation days for the calendar number 7. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza singoli per il calendario numero 7. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the one time vacation days for the calendar number 8. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza singoli per il calendario numero 8. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the one time vacation days for the calendar number 9. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza singoli per il calendario numero 9. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the permanent vacation days for the calendar number 1. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza permanenti per il calendario numero 1. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the permanent vacation days for the calendar number 2. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza permanenti per il calendario numero 2. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the permanent vacation days for the calendar number 3. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza permanenti per il calendario numero 3. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the permanent vacation days for the calendar number 4. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza permanenti per il calendario numero 4. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the permanent vacation days for the calendar number 5. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza permanenti per il calendario numero 5. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the permanent vacation days for the calendar number 6. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza permanenti per il calendario numero 6. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the permanent vacation days for the calendar number 7. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza permanenti per il calendario numero 7. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the permanent vacation days for the calendar number 8. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza permanenti per il calendario numero 8. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Adds the permanent vacation days for the calendar number 9. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Aggiunge i giorni di vacanza permanenti per il calendario numero 9. Si prega di usare una cifra sola per i numeri da 1 a 9 (invece di 01 - 09).',
        'Admin-Area' => 'Area Amministrazione',
        'Admin-Email' => 'Invia messaggio agli operatori',
        'Admin-Password' => 'Password Amministratore',
        'Admin-User' => 'Utente amministratore',
        'Advisory' => 'Avviso',
        'Agent Mailbox' => 'Casella dell\' Operatore',
        'Agent Preferences' => 'Impostazione preferenze per l\'operatore',
        'Agent-Area' => 'Area Operatore',
        'All Agents' => 'Tutti gli operatori',
        'All Customer variables like defined in config option CustomerUser.' =>
            'Tutte le variabili del cliente come definite nella configurazione',
        'All customer tickets.' => 'Tutte le richieste del cliente.',
        'All email addresses get excluded on replaying on composing an email.' =>
            'Tutte gli indirizzi di Email sono esclusi se in risposta a una mail ',
        'All incoming emails with this "Email" (To:) will be dispatched in the selected queue!' =>
            'Tutte le email in arrivo indirizzate a questo indirizzo (campo To:) saranno smistate nella coda selezionata!',
        'All messages' => 'Tutti i messaggi',
        'All new tickets!' => 'Tutti nuovi tickets!',
        'All tickets where the reminder date has reached!' => 'Tutti i tickets con data di avviso superata!',
        'All tickets which are escalated!' => 'Tutti i tickets in gestione!',
        'Allocate CustomerUser to service' => 'Associa utente a servizio',
        'Allocate services to CustomerUser' => 'assegna servizio a utente ',
        'Answer' => 'Risposta',
        'Artefact' => 'Artefatto',
        'Article Create Times' => 'Tempo di creazione Articolo',
        'Article created' => 'Articolo creato',
        'Article created between' => 'Articolo creato fra',
        'Article free text options shown in the close ticket screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Mostrare le opzioni di free text nella schermata di chiusura ticket dell\'interfaccia degli agenti. Possibili impostazioni: 0 = Disabilitato, 1 = Abilitato, 2 = Abilitato e obbligatorio.',
        'Article free text options shown in the email ticket screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Mostrare le opzioni di free text nella schermata di apertura ticket email dell\'interfaccia degli agenti. Possibili impostazioni: 0 = Disabilitato, 1 = Abilitato, 2 = Abilitato e obbligatorio.',
        'Article free text options shown in the phone ticket screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Mostrare le opzioni di free text nella schermata di apertura ticket telefonico dell\'interfaccia degli agenti. Possibili impostazioni: 0 = Disabilitato, 1 = Abilitato, 2 = Abilitato e obbligatorio.',
        'Article free text options shown in the ticket compose screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Mostrare le opzioni di free text nella schermata di composizione ticket dell\'interfaccia degli agenti. Possibili impostazioni: 0 = Disabilitato, 1 = Abilitato, 2 = Abilitato e obbligatorio.',
        'Article free text options shown in the ticket free text screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Mostrare le opzioni di free text nella schermata di free text dei ticket dell\'interfaccia degli agenti. Possibili impostazioni: 0 = Disabilitato, 1 = Abilitato, 2 = Abilitato e obbligatorio.',
        'Article free text options shown in the ticket note screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Mostrare le opzioni di free text nella schermata di note dei ticket dell\'interfaccia degli agenti. Possibili impostazioni: 0 = Disabilitato, 1 = Abilitato, 2 = Abilitato e obbligatorio.',
        'Article free text options shown in the ticket owner screen of a zoomed ticket in the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Mostrare le opzioni di free text nella schermata di proprietà dei ticket sotto zoom dell\'interfaccia degli agenti. Possibili impostazioni: 0 = Disabilitato, 1 = Abilitato, 2 = Abilitato e obbligatorio.',
        'Article free text options shown in the ticket pending screen of a zoomed ticket in the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Mostrare le opzioni di free text nella schermata di attesa ticket sotto zoom dell\'interfaccia degli agenti. Possibili impostazioni: 0 = Disabilitato, 1 = Abilitato, 2 = Abilitato e obbligatorio.',
        'Article free text options shown in the ticket phone outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Mostrare le opzioni di free text nella schermata di  ticket telefonico in uscita dell\'interfaccia degli agenti. Possibili impostazioni: 0 = Disabilitato, 1 = Abilitato, 2 = Abilitato e obbligatorio.',
        'Article free text options shown in the ticket priority screen of a zoomed ticket in the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Mostrare le opzioni di free text nella schermata di priorità dei ticket sotto zoom dell\'interfaccia degli agenti. Possibili impostazioni: 0 = Disabilitato, 1 = Abilitato, 2 = Abilitato e obbligatorio.',
        'Article free text options shown in the ticket responsible screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Mostrare le opzioni di free text nella schermata di responsabilità ticket dell\'interfaccia degli agenti. Possibili impostazioni: 0 = Disabilitato, 1 = Abilitato, 2 = Abilitato e obbligatorio.',
        'ArticleID' => 'Codice articolo',
        'Attach' => 'Allega',
        'Attribute' => 'Attributi',
        'Auto Response From' => 'Risposta automatica da',
        'Bounce Ticket: ' => 'Rispedisci ticket: ',
        'Bounce ticket' => 'Rispedisci richiesta',
        'Can not create link with %s!' => 'Impossibile creare un collegamento con %s!',
        'Can not delete link with %s!' => 'Non e\' possibile cancellare il collegamento con %s !',
        'Can\'t update password, invalid characters!' => 'Non posso aggiornare la password, alcuni dei caratteri utilizzati non sono consentiti',
        'Can\'t update password, must be at least %s characters!' => 'Non posso aggiornare la password, deve essere di almeno %s caratteri ',
        'Can\'t update password, must contain 2 lower and 2 upper characters!' =>
            'Non posso aggiornare la password, dev contenere 2 caratteri maiuscoli e 2 minuscoli',
        'Can\'t update password, needs at least 1 digit!' => 'Non posso aggiornare la password, deve contenere almeno 1 numero',
        'Can\'t update password, needs at least 2 characters!' => 'Non posso aggiornare la password, deve contenere almeno 2 caratteri',
        'Can\'t update password, your new passwords do not match! Please try again!' =>
            'Non posso aggiornare la password, le password digitate non coincidono',
        'Category Tree' => 'Albero delle Categorie',
        'Change %s settings' => 'Modifica impostazioni di %s',
        'Change Times' => 'modifiche tempo ',
        'Change free text of ticket' => 'Cambia il testo della richiesta',
        'Change owner of ticket' => 'Assegna la richiesta ad un altro operatore',
        'Change priority of ticket' => 'Modifica la priorità della richiesta',
        'Change responsible of ticket' => 'Cambia il responsabile del Ticket',
        'Change the ticket customer!' => 'Cambia il cliente della richiesta',
        'Change the ticket owner!' => 'Cambia il proprietario della richiesta',
        'Change the ticket priority!' => 'Cambia la priorità della richiesta',
        'Change the ticket responsible!' => 'Cambio responsabile ticket!',
        'Change user <-> group settings' => 'Modifica impostazioni Utente <-> Gruppo',
        'Child-Object' => 'Oggetto Figlio',
        'Clear From' => 'Cancella il campo mittente',
        'Clear To' => 'Cancella destinatario',
        'Click here to report a bug!' => 'Clicca qui per segnalare un bug!',
        'Close Times' => 'data di chiusura',
        'Close this ticket!' => 'Chiudi questa richiesta',
        'Close ticket' => 'Chiudi richiesta',
        'Close type' => 'Tipologia chiusura',
        'Close!' => 'Chiuso!',
        'Collapse View' => 'riduci report',
        'Comment (internal)' => 'Commento (interno)',
        'CompanyTickets' => 'TicketAzienda',
        'Compose Answer' => 'Componi risposta',
        'Compose Email' => 'Componi email',
        'Compose Follow up' => 'Componi risposta',
        'Config Options' => 'Opzioni di Configurazione',
        'Config options (e. g. &lt;OTRS_CONFIG_HttpType&gt;)' => 'Opzioni di configurazione (es. &lt;OTRS_CONFIG_HttpType&gt;)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>)' => 'Opzioni di configurazione (per es. <OTRS_CONFIG_HttpType>)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>).' => 'Opzioni di Config (es. <OTRS_CONFIG_HttpType>).',
        'Configures a default TicketFreeField setting. "Counter" defines the free text field which should be used, "Key" is the TicketFreeKey, "Value" is the TicketFreeText and "Event" defines the trigger event.' =>
            'Configura un\'impostazione di default per TicketFreeField. "Counter" definisce un campo di testo libero che deve essere usato, "Key" è la TicketFreeKey, "Value" è il TicketFreeText e "Event" definisce l\'evento trigger.',
        'Configures a default TicketFreeField setting. "Counter" defines the free text field which should be used, "Key" is the TicketFreeKey, "Value" is the TicketFreeText and "Event" defines the trigger event. Please check the developer manual (http://doc.otrs.org/), chapter "Ticket Event Module".' =>
            'Configura un\'impostazione di default per TicketFreeField. "Counter" definisce un campo di testo libero che deve essere usato, "Key" è la TicketFreeKey, "Value" è il TicketFreeText e "Event" definisce l\'evento trigger. Si prega di controllare il manuale per sviluppatori (http://doc.otrs.org/), capitolo "Ticket Event Module".',
        'Contact customer' => 'Contatta il cliente',
        'Create Times' => 'Data di Creazione',
        'Create new Phone Ticket' => 'Crea una nuova richiesta in seguito ad una chiamata telefonica',
        'Create new database' => 'Crea un nuovo database',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...).' =>
            'Creare nuovi gruppi per gestire i permessi di accesso per diversi gruppi di agenti (es. sezione vendite, supporto tecnico, ecc.)',
        'Create your first Ticket' => 'Creazione primo ticket',
        'Create/Expires' => 'Creazione/Scadenza',
        'CreateTicket' => 'CreaRichiesta',
        'Customer Move Notify' => 'Notifica il cliente degli spostamenti',
        'Customer Owner Notify' => 'Notifica il cliente del cambio operatore',
        'Customer State Notify' => 'Notifica il cliente del cambio di stato',
        'Customer User' => 'Clienti',
        'Customer User Management' => 'Gestione clienti',
        'Customer Users' => 'Utenti Clienti',
        'Customer Users <-> Groups' => 'Utenti Clienti <-> Gruppi',
        'Customer Users <-> Groups Management' => 'Utente <-> Gruppi',
        'Customer Users <-> Services Management' => 'Utenti <-> Servizi',
        'Customer history' => 'Storico del cliente',
        'Customer history search' => 'Ricerca storico cliente',
        'Customer history search (e. g. "ID342425").' => 'Ricerca storico cliente (per es. "ID342425")',
        'Customer item (icon) which shows the open tickets of this customer as info block.' =>
            'Oggetto cliente (icona) che mostra i ticket aperti di questo utente come blocco di informazioni.',
        'Customer user will be needed to have a customer history and to login via customer panel.' =>
            'Il Cliente sarà necessario per mantenere uno storico e per autenticarsi dal pannello cliente.',
        'CustomerUser' => 'Cliente',
        'DB Admin Password' => 'Password del DB Admin',
        'DB Admin User' => 'Nome utente DB Admin',
        'DB Type' => 'Tipo di DBMS',
        'DB connect host' => 'Host per connessione al DB',
        'Days' => 'Giorni',
        'Default' => 'Predefinito',
        'Default Charset' => 'Set di caratteri predefinito',
        'Default Language' => 'Lingua predefinita',
        'Defines the =hHeight for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Definisce il valore =hHeight per il componente Rich Text editor. Inserire il numero (pixel) o la percentuale (relativa).',
        'Delete old database' => 'Cancella il vecchio database',
        'Delete this ticket!' => 'Cancella questa richiesta',
        'Detail' => 'Dettaglio',
        'Discard all changes and return to the compose screen' => 'Annulla tutte le modifiche e torna alla composizione del messaggio',
        'Do dispatch or filter incoming emails based on email X-Headers! RegExp is also possible.' =>
            'Effettua lo smistamento o filtra la posta in ingresso in base all\'X-Header! Sono accettate anche espressioni regolari.',
        'Do you really want to delete this Object?' => 'Vuoi davvero cancellare questo oggetto?',
        'Do you really want to reinstall this package (all manual changes get lost)?' =>
            'Vuoi veramente reinstallare questo Package (tutte i relativi settaggi manuali saranno persi) ? ',
        'Don\'t forget to add a new response a queue!' => 'Non dimenticare di aggiungere una risposta per ogni coda!',
        'Don\'t forget to add a new user to groups and/or roles!' => 'Non dimenticare di inserire anche il gruppo e/o regole ',
        'Don\'t forget to add a new user to groups!' => 'Non dimenticare di aggiungere i nuovi operatori ad un gruppo!',
        'Don\'t work with UserID 1 (System account)! Create new users!' =>
            'Non lavorare con l\'operatore con ID 1 (System account)! Crea dei nuovi utenti!',
        'Download Settings' => 'Scarica config.',
        'Download all system config changes.' => 'Scarica tutte le modifiche config. di sistema.',
        'Drop Database' => 'Cancella database',
        'Dynamic-Object' => 'Oggetto-Dinamico',
        'Edit Article' => 'Modifica Articolo',
        'Edit default services.' => 'Edita il servizio di default',
        'Escalation - First Response Time' => 'Gestione - tempo di prima risposta ',
        'Escalation - Solution Time' => 'Gestione - tempo per soluzione ',
        'Escalation - Update Time' => 'Tempo di gestione - Aggiorna',
        'Escalation Times' => 'Tempo di gestione ',
        'Escalation time' => 'Tempo di escalation',
        'Event is required!' => 'Evento e\' richiesto !',
        'Expand View' => 'espandi report',
        'Explanation' => 'Descrizione',
        'Export Config' => 'esporta config',
        'Filter for Language' => 'Filtri per linguaggio',
        'Filtername' => 'Nome del filtro',
        'Follow up' => 'Risposta',
        'Follow up notification' => 'Notifica di risposta',
        'For very complex stats it is possible to include a hardcoded file.' =>
            'Per statistiche complesse si possono includere file statici precompilati',
        'Forward ticket: ' => 'Inoltra ticket: ',
        'Frontend' => 'Interfaccia',
        'Fulltext-Search in Article (e. g. "Mar*in" or "Baue*")' => 'Ricerca a testo libero nel testo dell\'articolo (per esempio \'Ro*si\' o \'Ma*io\')',
        'Go' => 'Esegui SQL script',
        'Go to group %s' => 'Vai al gruppo %s',
        'Group %s' => 'Gruppo %s',
        'Group selection' => 'Selezione del gruppo',
        'Have a lot of fun!' => 'Divertiti con OTRS!',
        'Here you can define the value series. You have the possibility to select one or two elements. Then you can select the attributes of elements. Each attribute will be shown as single value series. If you don\'t select any attribute all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Qui puoi definire i valori della serie .E\' posibile definire attributi agli elementi.Ogni attributo e\' rappresentato singolarmente . Se manca la selezione tutti gli attributi di questo elemento verranno utilizzati nel generare le stat.Un nuovo attributo viene aggiunto alla precedente configurazione .',
        'Here you can define the x-axis. You can select one element via the radio button. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Qui puoi definire x-axis . Puoi selezionare un elemento usando i radio-button. Di seguito devi selezionare uno o piu attributi per questo elemento . Mancando la selezione tutti gli attributi di questo elemento verranno utilizzati nel generare le stat.Un nuovo attributo viene aggiunto alla precedente configurazione .',
        'Here you can define the x-axis. You can select one element via the radio button. Then you have to select two or more attributes of the element. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Qui puoi definire x-axis . Puoi selezionare un elemento usando i radio-button. Di seguito devi selezionare uno o piu attributi per questo elemento . Mancando la selezione tutti gli attributi di questo elemento verranno utilizzati nel generare le stat.Un nuovo attributo viene aggiunto alla precedente configurazione .',
        'Here you can insert a description of the stat.' => 'Qui descrivi la tipologia di stat.',
        'Here you can select the dynamic object you want to use.' => 'Seleziona i Dynamic-Object che vuoi usare ',
        'Here you can the value series. You have the possibility to select one or two elements. Then you can select the attributes of elements. Each attribute will be shown as single value series. If you don\'t select any attribute all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Qui puoi definire i valori della serie .E\' posibile definire attributi agli elementi.Ogni attributo e\' rappresentato singolarmente . Se manca la selezione tutti gli attributi di questo elemento verranno utilizzati nel generare le stat.Un nuovo attributo viene aggiunto alla precedente configurazione .',
        'If Secure Mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Se la Modalita Sicura non e\' settata ,si deve configurare via SysConfig l\' applicativo e\' gia\' attivo .',
        'If a new hardcoded file is available this attribute will be shown and you can select one.' =>
            'Se i file precompilati sono presenti questo possibilita viene mostrata e si puo selezionare ',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked for the old owner.' =>
            'Se una richiesta è chiusa e il cliente invia una risposta, la richiesta viene assegnata al vecchio operatore.',
        'If a ticket will not be answered in this time, just only this ticket will be shown.' =>
            'Se ad una richiesta non viene risposto entro questo limite di tempo, sarà l\'unica richiesta ad essere visualizzata.',
        'If an agent locks a ticket and he/she will not send an answer within this time, the ticket will be unlock automatically. So the ticket is viewable for all other agents.' =>
            'Se un operatore prende in gestione una richiesta ma non risponde entro il tempo specificato, la richiesta viene sbloccata in modo da essere accessibile agli altri operatori.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the user).' =>
            'Se non viene selezionata nessuna opzione, non verranno dati permessi a questo gruppo (le richieste non saranno disponibili).',
        'If you need the sum of every column select yes.' => 'Se vuoi la somma sulle colonne seleziona si',
        'If you need the sum of every row select yes' => 'Se vuoi la somma sulle righe seleziona si',
        'If you use RegExp, you also can use the matched value in () as [***] in \'Set\'.' =>
            'Se usi espressioni regolari, puoi anche utilizzare il valore corrispondente a () come [***] negli insiemi',
        'Important' => 'Importante',
        'In this form you can select the basic specifications.' => 'In questa From si possono compilare parametri generali',
        'In this way you can directly edit the keyring configured in Kernel/Config.pm.' =>
            'In questo modo puoi modificare direttamente il \'keyring\' configurato nel file Kernel/Config.pm',
        'Incident' => 'Incidente',
        'Information about the Stat' => 'Informazione sul report di Stat',
        'Insert of the common specifications' => 'iserisci le specifiche di base ',
        'Is Job Valid' => 'L\' attività è normale',
        'Is Job Valid?' => 'L\' attività è normale?',
        'It\'s useful for ASP solutions.' => 'È utile per soluzioni ASP',
        'It\'s useful for a lot of users and groups.' => 'E\' utile per molti utenti e gruppi',
        'Job-List' => 'Lista attività',
        'Keyword' => 'Parola chiave',
        'Keywords' => 'Parole chiave',
        'Last update' => 'Ultimo aggiornamento',
        'Link this ticket to an other objects!' => 'Collega questa richiesta ad un altro oggetto',
        'Link to Parent' => 'Collega a genitore',
        'Linked as' => 'Collegato come',
        'Load Settings' => 'Carica config.',
        'Lock it to work on it!' => 'Prendi in gestione per lavorarci',
        'Logfile' => 'File di log',
        'Logfile too large, you need to reset it!' => 'Il log file e troppo grande serve svuotarlo',
        'Login failed! Your username or password was entered incorrectly.' =>
            'Accesso fallito! Nome utente o password non corretti.',
        'Lookup' => 'Ricerca',
        'Mail Management' => 'Gestione posta',
        'Mailbox' => 'Casella postale',
        'Match' => 'Corrispondenza',
        'Max. shown Tickets a page' => 'Ticket massimi visualizzati in una pagina',
        'Merge this ticket!' => 'Unisci questa richiesta',
        'Message for new Owner' => 'Messaggio per l\'operatore',
        'Message sent to' => 'Messaggio inviato a',
        'Misc' => 'Varie',
        'Modified' => 'Modificato',
        'Modules' => 'Moduli',
        'Move notification' => 'Notifica spostamento',
        'Multiple selection of the output format.' => 'selezione multipla dei formati di output ',
        'MyTickets' => 'I miei Tickets',
        'Name is required!' => 'Manca il nome!',
        'New Agent' => 'Nuovo Operatore',
        'New Customer' => 'Nuovo Cliente',
        'New Group' => 'Nuovo gruppo',
        'New Priority' => 'Nuova Priorità',
        'New Service' => 'Nuovo Servizio',
        'New State' => 'Nuovo stato',
        'New Ticket Lock' => 'Nuovo gestore della richiesta',
        'New TicketFreeFields' => 'Nuovo TicketCampiLiberi',
        'New Title' => 'Nuovo Titolo',
        'New Type' => 'Nuovo Tipo',
        'New account created. Sent Login-Account to %s.' => 'Nuove Credenziali create . Inviato Login-Account a %s .',
        'New messages' => 'Nuovi messaggi',
        'New password again' => 'Ripetere Nuova Password',
        'Next Week' => 'Prossima settimana',
        'No * possible!' => 'Qui non è possibile usare l\'asterisco (*)!',
        'No Packages for requested Framework in this Online Repository, but Packages for other Frameworks!' =>
            'Nessun pacchetto per il Framework richiesto in questo Archivio Online, ma esistono altri Pacchetti per altri Frameworks ',
        'No Packages or no new Packages in selected Online Repository!' =>
            'Nessun Pacchetto o nessun nuovo pacchetto disponibile nell\' Archivio Online ',
        'No Permission' => 'Autorizzazione negata',
        'No means, send agent and customer notifications on changes.' => 'No- significa , invia notifiche ad agenti e utenti dopo modifiche ',
        'No time settings.' => 'Non ci sono impostazioni di orario.',
        'Note Text' => 'Nota',
        'Notification (Customer)' => 'Nofitifica ( utente )',
        'Notifications' => 'Notifiche',
        'OTRS sends an notification email to the customer if the ticket is moved.' =>
            'OTRS invia una notifica via email al cliente se la richiesta viene spostata.',
        'OTRS sends an notification email to the customer if the ticket owner has changed.' =>
            'OTRS invia una notifica via email al cliente se l\'operatore assegnato alla richiesta cambia.',
        'OTRS sends an notification email to the customer if the ticket state has changed.' =>
            'OTRS invia una notifica via email al cliente se lo stato della richiesta cambia.',
        'Object already linked as %s.' => 'Gia\' collegato come %s .',
        'Of couse this feature will take some system performance it self!' =>
            'attenzione questa funzionalita impegna diverse risorse di sistema',
        'Open Tickets' => 'Richieste Aperte',
        'Options ' => 'Opzioni',
        'Options of the current customer user data (e. g. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)' =>
            'Opzioni per utente corrente (es. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>)' =>
            'Per ottenere i dati del cliente (per es. <OTRS_CUSTOMER_DATA_UserFirstname>)',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>).' =>
            'Opzioni per dati utente corrente (es: <OTRS_CUSTOMER_DATA_UserFirstname>).',
        'Options of the current user who requested this action (e. g. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)' =>
            'Opzioni per il corrente utente di questa richiesta (e. g. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>)' =>
            'Per ottenere l\'utente che ha richiesto l\'azione (per es. <OTRS_CURRENT_UserFirstname>)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>).' =>
            'Opzioni dell\' utente correte e richiedente  (es. <OTRS_CURRENT_UserFirstname>).',
        'Options of the ticket data (e. g. &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)' =>
            'Opzioni per i dati nel ticket (es.  &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)',
        'Options of the ticket data (e. g. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Opzioni per i dati nel ticket (es. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Opzioni per i dati nel ticket (es. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Opzioni per i dati nel ticket (es. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).' =>
            'Opzioni per i dati nel ticket (es. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).',
        'Other Options' => 'Altre opzioni',
        'Out Of Office' => 'Fuori Sede',
        'POP3 Account Management' => 'Gestione accessi POP3',
        'Package' => 'Pacchetto',
        'Package not correctly deployed! You should reinstall the Package again!' =>
            'Errore ! si deve reinstallare il Pacchetto! ',
        'Package not correctly deployed! You should reinstall the package again!' =>
            'Pacchetto non installato correttamente! Dovresti reinstallarlo!',
        'Param 1' => 'Parametro 1',
        'Param 2' => 'Parametro 2',
        'Param 3' => 'Parametro 3',
        'Param 4' => 'Parametro 4',
        'Param 5' => 'Parametro 5',
        'Param 6' => 'Parametro 6',
        'Parent-Object' => 'Oggetto Genitore',
        'Password is already in use! Please use an other password!' => 'La password è già in uso. Per favore provare con un\' altra password',
        'Password is already used! Please use an other password!' => 'La password è già stata usata! Provare con un\' altra password',
        'Passwords doesn\'t match! Please try it again!' => 'La password non corrisponde! Per favore, prova di nuovo',
        'Pending Times' => 'Tempo di attesa ',
        'Pending messages' => 'Messaggi in attesa',
        'Pending type' => 'Tipo di attesa',
        'Permission settings. You can select one or more groups to make the configurated stat visible for different agents.' =>
            'Permessi . E\' possibile selezionare uno o piu gruppi per permettere la visualizzazione delle stat. a piu agenti',
        'Permissions to change the ticket owner in this group/queue.' => 'Autorizzazione a cambiare il gestore di una richiesta in questo gruppo/coda.',
        'PhoneView' => 'RichiestaTelefonica',
        'Please command us.' => 'Prego ci comandi.',
        'Please contact your admin' => 'Per favore contatta il tuo amministratore',
        'Please fill out this form to recieve login credentials.' => 'Si prega di riempire questo modulo per ricevere le credenziali di accesso.',
        'Print this ticket!' => 'Stampa questa richiesta',
        'Problem' => 'Problema',
        'Queue <-> Auto Responses Management' => 'Code <-> Risposta automatica ',
        'Queue ID' => 'Identificativo coda',
        'Queue Management' => 'Gestione delle code',
        'Queues <-> Auto Responses' => 'Code <-> Risposte Automatiche',
        'Realname' => 'Nome',
        'Rebuild' => 'Ricrea',
        'Recipients' => 'Destinatari',
        'Reminder' => 'Promemoria',
        'Reminder messages' => 'Messaggio di promemoria',
        'Required Field' => 'Campi richiesti',
        'Response Management' => 'Gestione risposte',
        'Responses <-> Attachments Management' => 'Risposte <-> Gestione Allegati',
        'Responses <-> Queue Management' => 'Risposte <-> Gestione Code',
        'Return to the compose screen' => 'Torna alla composizione del messaggio',
        'Role' => 'Ruolo',
        'Roles <-> Groups Management' => 'Ruoli <-> Gruppi Gestione',
        'Roles <-> Users' => 'Ruoli <-> Utenti',
        'Roles <-> Users Management' => 'Ruoli <-> Gestione Utenti',
        'Run Search' => 'Esegui ricerca',
        'Save Job as?' => 'Salva attività con nome?',
        'Save Search-Profile as Template?' => 'Salvare il profilo di ricerca come modello?',
        'Schedule' => 'Programma',
        'Search Result' => 'Risultato ricerca',
        'Search for' => 'Cerca',
        'Search for customers (wildcards are allowed).' => 'Ricerca clienti (wildcard consentite).',
        'Search-Profile as Template?' => 'Profilo di ricerca come template?',
        'Secure Mode need to be enabled!' => 'Modalita Sicura deve essere abilitata!',
        'Select Box' => 'Selezionare una funzione',
        'Select Box Result' => 'Seleziona il risultato',
        'Select Source (for add)' => 'Seleziona sorgente (da aggiungere)',
        'Select the customeruser:service relations.' => 'Seleziona per l\' utentei le :service relations.',
        'Select the element, which will be used at the X-axis' => 'Seleziona un elemento usato come valore sul asse delle X ',
        'Select the restrictions to characterise the stat' => 'Seleziona le regole filtro per le stat',
        'Select the role:user relations.' => 'Seleziona le relazioni ruolo:utente.',
        'Select the user:group permissions.' => 'Seleziona i permessi della coppia utente:gruppo.',
        'Select your QueueView refresh time.' => 'Scegli il tempo di aggiornamento della lista delle richieste.',
        'Select your default spelling dictionary.' => 'Seleziona il dizionario predefinito',
        'Select your frontend Charset.' => 'Seleziona il set di caratteri da usare.',
        'Select your frontend QueueView.' => 'Scegli l\'interfaccia per la lista messaggi.',
        'Select your frontend language.' => 'Scegli la lingua per la tua interfaccia.',
        'Select your out of office time.' => 'Seleziona il tempo di assenza.',
        'Select your screen after creating a new ticket.' => 'Scegli la pagina da mostrare dopo una nuova richiesta',
        'Selection needed' => 'Selezioni richieste',
        'Send Administrative Message to Agents' => 'Inviare messaggio amministrativo agli agenti',
        'Send Notification' => 'Invio Notifiche ',
        'Send me a notification if a customer sends a follow up and I\'m the owner of this ticket.' =>
            'Mandami una notifica se un cliente risponde ad una richiesta che ho io in gestione.',
        'Send me a notification of an watched ticket like an owner of an ticket.' =>
            'Mandami una notifica come gestore del ticket .',
        'Send no notifications' => 'Non inviare notifiche ',
        'Sent new password to: %s' => 'Inviata la nuova password a: %s ',
        'Sent password token to: %s' => 'Inviata password a : %s ',
        'Sessions' => 'Sessioni',
        'Set customer user and customer id of a ticket' => 'Imposta l\'id cliente di una richiesta',
        'Set this ticket to pending!' => 'Imposta questa richiesta come sospesa',
        'Show' => 'Mostra',
        'Shows the ticket history!' => 'Visualizza lo storico della richiesta',
        'Site' => 'Pagina',
        'Solution' => 'Soluzione',
        'Sort by' => 'Ordina per',
        'Source' => 'catalogo',
        'Spell Check' => 'Verifica ortografica',
        'Split' => 'Spezza',
        'State Type' => 'Tipologia stato',
        'Static-File' => 'File fisso',
        'Stats-Area' => 'Area Statistiche',
        'Sub-Queue of' => 'Sottocoda di',
        'Sub-Service of' => 'Servizio dipendente da',
        'Symptom' => 'Sintomi',
        'System History' => 'Storico del sistema',
        'System State Management' => 'Gestione stati richieste',
        'System Status' => 'Stato sistema',
        'Systemaddress' => 'Indirizzo di sistema',
        'Take care that you also updated the default states in you Kernel/Config.pm!' =>
            'Assicurati di aver aggiornato gli stati pre-impostati (default) nel file Kernel/Config.pm!',
        'The Ticket was locked' => 'Il ticket è stato preso in carico',
        'The User Name you wish to have' => 'L\'user name che si desidera',
        'The message being composed has been closed.  Exiting.' => 'La finestra con il messaggio che si stava componendo è stata chiusa. Sto uscendo.',
        'The ticket was locked' => 'Il ticket è stato preso in carico',
        'These values are read-only.' => 'Questi valori non sono modificabili',
        'These values are required.' => 'Questi valori sono richiesti',
        'This account exists.' => 'Questo account esiste ',
        'This is useful if you want that no one can get the result of the stat or the stat isn\'t ready configurated.' =>
            'questo serve quando non si vuole mostrare il risultato della stat. o quando la config non finita di compilare',
        'This window must be called from compose window' => 'Questa finestra deve essere aperta dalla finestra di composizione dei messaggi',
        'Ticket Hook' => 'Prefisso richieste',
        'Ticket Lock' => 'Gestione Richiesta',
        'Ticket Number Generator' => 'Generatore numero ticket',
        'Ticket Search' => 'Ricerca richiesta',
        'Ticket Status View' => 'Visualizzazione Stato delle richieste',
        'Ticket Type is required!' => 'Tipologia Ticket richiesta!',
        'Ticket escalation!' => 'Richiesta escalation!',
        'Ticket locked!' => 'Richiesta già presa in gestione!',
        'Ticket owner options (e. g. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)' =>
            'Opzioni per il proprietario del Ticket (ie. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>)' => 'Per ottenere il gestore della richiesta (per es. <OTRS_OWNER_UserFirstname>)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>).' => 'Opzioni proprietario Ticket ( es. <OTRS_OWNER_UserFirstname>).',
        'Ticket responsible options (e. g. <OTRS_RESPONSIBLE_UserFirstname>).' =>
            'Opzioni di risposta Ticket (es: <OTRS_RESPONSIBLE_UserFirstname>).',
        'Ticket selected for bulk action!' => 'Richiesta selezionata per azione multipla!',
        'Ticket unlock!' => 'Richiesta abbandonata!',
        'Ticket-Area' => 'Area Richieste',
        'TicketFreeFields' => 'TicketCampiLiberi',
        'TicketFreeText' => 'Ricerca a testo libero nella richiesta',
        'TicketID' => 'Codice richiesta',
        'TicketZoom' => 'DettagliRichiesta',
        'Tickets available' => 'Richieste disponibili',
        'Tickets shown' => 'Richieste mostrate',
        'Tickets which need to be answered!' => 'Tickets che richiedono una risposta!',
        'Timeover' => 'Tempo scaduto',
        'Times' => 'n. Volte',
        'Title of the stat.' => 'Titolo della stat.',
        'To get the article attribute (e. g. (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).' =>
            'Usa gli attributi presenti nel testo ( esempio  (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).',
        'To get the article attribute (e. g. <OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).' =>
            'Per avere gli attributi Articolo ( es: <OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).',
        'Top of Page' => 'Inizio Pagina',
        'Total hits' => 'Totale risultati',
        'U' => 'C',
        'Unable to parse Online Repository index document!' => 'Impossibile analizzare il documento dell\' indice dell\' Archivio Online ',
        'Unlock Tickets' => 'Sblocca il Tickets',
        'Unlock to give it back to the queue!' => 'Abbandona la gestione per ri-inserirla nella coda',
        'Use utf-8 it your database supports it!' => 'Usa la codifica utf-8 se il tuo DB permette! ',
        'Useable options' => 'Opzioni disponibili',
        'User Management' => 'Gestione operatori',
        'User will be needed to handle tickets.' => 'Gli operatori sono necessari per gestire le richieste.',
        'Users' => 'Utenti',
        'Users <-> Groups' => 'Utenti <-> Gruppi',
        'Users <-> Groups Management' => 'Utente <-> gestione gruppi',
        'Verion' => 'Versione',
        'Warning! This tickets will be removed from the database! This tickets are lost!' =>
            'Attenzione! Queste richieste verranno eliminate dal database! Queste richieste saranno perse!',
        'Watch notification' => 'Vedi notifica',
        'We stop eating if you wish us to do.' => 'Smettiamo di mangiare se lo desidera.',
        'Web-Installer' => 'Installazione guidata via web',
        'Welcome to OTRS' => 'Benvenuto in OTRS',
        'Wildcards are allowed.' => 'Wildcard consentite.',
        'With an invalid stat it isn\'t feasible to generate a stat.' => 'Se invalido non serve la generazione delle stat .',
        'With the input and select fields you can configurate the stat at your needs. Which elements of a stat you can edit depends on your stats administrator who configurated the stat.' =>
            'Selezionando i campi puoi visualizzare le stat a tuo piacimento. Gli elementi che puoi editare dipendono dalla configurazione del tuo administrator . ',
        'Yes means, send no agent and customer notifications on changes.' =>
            'Si- significa , non inviare notifiche anche dopo modifiche',
        'Yes, save it with name' => 'Sì, salva con nome',
        'You as the customer have the ability to let us support staff people jump around as you wish because it\'s all about you.' =>
            'Lei come cliente ha la possibilità di far saltellare noi staff di supporto come desidera poiché è al centro dell\'attenzione.',
        'You got new message!' => 'Hai un nuovo messaggio!',
        'You have not created a ticket yet.' => 'Non è stato ancora creato alcun ticket',
        'You have to select two or more attributes from the select field!' =>
            'Devi selezionare uno o piu attributi m',
        'You need a email address (e. g. customer@example.com) in To:!' =>
            'È necessario inserire un indirizzo email (per .es. cliente@esempio.it) come destinatario!',
        'You need min. one selected Ticket!' => 'Devi selezionare almeno una richiesta!',
        'You need to account time!' => 'Devi inserire il tempo impiegato per la risposta!',
        'You need to activate %s first to use it!' => 'Devi prima attivare %s per poterlo usare',
        'Your email address is new' => 'Il tuo indirizzo di email è nuovo',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'La tua email con il numero di richiesta "<OTRS_TICKET>" è stata rispedita a "<OTRS_BOUNCE_TO>". Contattare questo indirizzo per ulteriori informazioni.',
        'Your own Ticket' => 'Le tue richieste',
        'Your way to communicate with us is this thing called \'ticket\'.' =>
            'Il suo modo di comunicare con noi è questo coso chiamato \'ticke\'.',
        'accept license' => 'accetto la licenza',
        'customer realname' => 'nome del cliente',
        'don\'t accept license' => 'non accetto la licenza',
        'down' => 'decrescente',
        'false' => 'falso',
        'for agent firstname' => 'per il nome dell\'operatore',
        'for agent lastname' => 'per il cognome dell\'operatore',
        'for agent login' => 'per il nome utente dell\'operatore',
        'for agent user id' => 'per l\'id utente dell\'operatore',
        'kill all sessions' => 'Termina tutte le sessioni',
        'kill session' => 'Termina sessione',
        'maximal period form' => 'Massimo periodo da ',
        'modified' => 'modificato',
        'new ticket' => 'nuova richiesta',
        'next step' => 'Fase successiva',
        'send' => 'invia',
        'sort downward' => 'ordine decrescente',
        'sort upward' => 'ordine crescente',
        'to get the first 20 character of the subject' => 'per avere i primi 20 caratteri dell\'oggetto',
        'to get the first 5 lines of the email' => 'per avere le prime 5 linee del messaggio',
        'to get the from line of the email' => 'per avere il mittente del messaggio',
        'to get the realname of the sender (if given)' => 'per avere il nome completo del mittente (se indicato)',
        'up' => 'crescente',

    };
    # $$STOP$$
    return;
}

1;
