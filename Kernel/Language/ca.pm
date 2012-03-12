# --
# Kernel/Language/ca.pm - provides Catalan language translation
# Copyright (C) 2012 Sistemes OTIC (ibsalut) - Antonio Linde
# --
# $Id: ca.pm,v 1.6 2012/03/07 10:33:08 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ca;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    # $$START$$
    # Last translation file sync: 2012-03-07 11:28:36

    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D.%M.%Y %T';
    $Self->{DateFormatLong}      = '%A %D %B %T %Y';
    $Self->{DateFormatShort}     = '%D.%M.%Y';
    $Self->{DateInputFormat}     = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';

    # csv separator
    $Self->{Separator} = '';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Si',
        'No' => 'No',
        'yes' => 'si',
        'no' => 'no',
        'Off' => 'Off',
        'off' => 'off',
        'On' => 'On',
        'on' => 'on',
        'top' => 'inici',
        'end' => 'fi',
        'Done' => 'Fet',
        'Cancel' => 'Cancel·lar',
        'Reset' => 'Reiniciar',
        'last' => 'darrer',
        'before' => 'abans',
        'Today' => 'Avui',
        'Tomorrow' => 'Demà',
        'Next week' => 'Pròxima setmana',
        'day' => 'dia',
        'days' => 'dias',
        'day(s)' => 'dia(s)',
        'd' => 'd',
        'hour' => 'hora',
        'hours' => 'hores',
        'hour(s)' => 'hora(es)',
        'Hours' => 'Hores',
        'h' => 'h',
        'minute' => 'minut',
        'minutes' => 'minuts',
        'minute(s)' => 'minut(s)',
        'Minutes' => 'Minuts',
        'm' => 'm',
        'month' => 'mes',
        'months' => 'mesos',
        'month(s)' => 'mes(os)',
        'week' => 'setmana',
        'week(s)' => 'setmana(es)',
        'year' => 'any',
        'years' => 'anys',
        'year(s)' => 'any(s)',
        'second(s)' => 'segon(s)',
        'seconds' => 'segons',
        'second' => 'segon',
        's' => 's',
        'wrote' => 'va escriure',
        'Message' => 'Missatje',
        'Error' => 'Error',
        'Bug Report' => 'Informe d\'errors',
        'Attention' => 'Atenció',
        'Warning' => 'Atenció',
        'Module' => 'Mòdul',
        'Modulefile' => 'Arxiu de mòdul',
        'Subfunction' => 'Subfuncions',
        'Line' => 'Línia',
        'Setting' => 'Configuració',
        'Settings' => 'Configuracións',
        'Example' => 'Exemple',
        'Examples' => 'Exemples',
        'valid' => 'vàlid',
        'Valid' => 'Vàlid',
        'invalid' => 'invàlid',
        'Invalid' => 'Invàlid',
        '* invalid' => '* invàlid',
        'invalid-temporarily' => 'invàlid-temporalment',
        ' 2 minutes' => ' 2 minuts',
        ' 5 minutes' => ' 5 minuts',
        ' 7 minutes' => ' 7 minuts',
        '10 minutes' => '10 minuts',
        '15 minutes' => '15 minuts',
        'Mr.' => 'Sr.',
        'Mrs.' => 'Sra.',
        'Next' => 'Següent',
        'Back' => 'Tornar',
        'Next...' => 'Següent...',
        '...Back' => '..Tornar',
        '-none-' => '-no res-',
        'none' => 'no res',
        'none!' => 'no res!',
        'none - answered' => 'no res  - respost',
        'please do not edit!' => 'Per favor no ho editi!',
        'Need Action' => 'Necessita acció',
        'AddLink' => 'Afegir enllaç',
        'Link' => 'Enllaç',
        'Unlink' => 'Llevar enllaç',
        'Linked' => 'Enllaçat',
        'Link (Normal)' => 'Enllaç (Normal)',
        'Link (Parent)' => 'Enllaç (Pare)',
        'Link (Child)' => 'Enllaç (Fill)',
        'Normal' => 'Normal',
        'Parent' => 'Pare',
        'Child' => 'Fill',
        'Hit' => 'Resultat',
        'Hits' => 'Resultats',
        'Text' => 'Text',
        'Standard' => 'Estàndard',
        'Lite' => 'Petit',
        'User' => 'Usuari',
        'Username' => 'Nom d\'Usuari',
        'Language' => 'Idioma',
        'Languages' => 'Idiomes',
        'Password' => 'Contrasenya',
        'Preferences' => 'Preferències',
        'Salutation' => 'Salutació',
        'Salutations' => 'Salutacions',
        'Signature' => 'Signaturas',
        'Signatures' => 'Signatures',
        'Customer' => 'Client',
        'CustomerID' => 'Nombre de client',
        'CustomerIDs' => 'Nombres de client',
        'customer' => 'client',
        'agent' => 'agent',
        'system' => 'Sistema',
        'Customer Info' => 'Informació del client',
        'Customer Information' => 'Informació del client',
        'Customer Company' => 'Empresa del client',
        'Customer Companies' => 'Empreses del client',
        'Company' => 'Empresa',
        'go!' => 'anar!',
        'go' => 'anar',
        'All' => 'Tot',
        'all' => 'tot',
        'Sorry' => 'Disculpi',
        'update!' => 'Actualitzar!',
        'update' => 'actualitzar',
        'Update' => 'Actualitzar',
        'Updated!' => 'Actualizat!',
        'submit!' => 'enviar!',
        'submit' => 'enviar',
        'Submit' => 'Enviar',
        'change!' => 'camviar!',
        'Change' => 'Camviar',
        'change' => 'camviar',
        'click here' => 'faci clic aquí',
        'Comment' => 'Comentari',
        'Invalid Option!' => 'Opció no valida',
        'Invalid time!' => 'Hora no valida',
        'Invalid date!' => 'Data no valida',
        'Name' => 'Nom',
        'Group' => 'Grup',
        'Description' => 'Descripció',
        'description' => 'descripció',
        'Theme' => 'Tema',
        'Created' => 'Creat',
        'Created by' => 'Creat per',
        'Changed' => 'Modificat',
        'Changed by' => 'Modificat per',
        'Search' => 'Cercar',
        'and' => 'i',
        'between' => 'entre',
        'Fulltext Search' => 'Recerca de text complet',
        'Data' => 'Dades',
        'Options' => 'Opcions',
        'Title' => 'Títol',
        'Item' => 'Article',
        'Delete' => 'Esborrar',
        'Edit' => 'Editar',
        'View' => 'Veure',
        'Number' => 'Nombre',
        'System' => 'Sistema',
        'Contact' => 'Contacte',
        'Contacts' => 'Contactes',
        'Export' => 'Exportar',
        'Up' => 'Amunt',
        'Down' => 'Avall',
        'Add' => 'Afegir',
        'Added!' => 'Afegit!',
        'Category' => 'Categoria',
        'Viewer' => 'Visualitzador',
        'Expand' => 'Expandir',
        'Small' => 'Petit',
        'Medium' => 'Mitjà',
        'Large' => 'Gran',
        'Date picker' => 'Seleccionador de data',
        'New message' => 'Nou missatge',
        'New message!' => 'Nou missatge!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Per favor respongui al tiquet per a regressar a la vista normal de la cua.',
        'You have %s new message(s)!' => 'Vostè té %s un nou(s) missatge(s)!',
        'You have %s reminder ticket(s)!' => 'Vostè té %s tiquets recordatoris',
        'The recommended charset for your language is %s!' => 'El joc de caràcters recomanat per al seu idioma és %s!',
        'Change your password.' => 'Canviï la seva contrasenya',
        'Please activate %s first!' => 'Per favor, en primer lloc, activi %s!',
        'No suggestions' => 'Sense suggeriments',
        'Word' => 'Paraula',
        'Ignore' => 'Ignorar',
        'replace with' => 'reemplaçar amb',
        'There is no account with that login name.' => 'No existeix un compte amb aquest login',
        'Login failed! Your user name or password was entered incorrectly.' =>
            'Connexió fallida! El seu nom d\'usuari o contrasenya van ser entrats incorrectament.',
        'There is no acount with that user name.' => 'No hi ha cap compta amb aquest nom d\'usuari.',
        'Please contact your administrator' => 'Per favor contacti amb el seu administrador',
        'Logout' => 'Desconnectar-se',
        'Logout successful. Thank you for using OTRS!' => 'Desconnexió reeixida. Gràcies per utilitzar OTRS!',
        'Invalid SessionID!' => 'Sessió no vàlida',
        'Feature not active!' => 'Característica no activa',
        'Agent updated!' => 'Agent actualitzat!',
        'Create Database' => 'Crear Base de dades',
        'System Settings' => 'Configuració del sistema',
        'Mail Configuration' => 'Configuració de correu.',
        'Finished' => 'Finalitzat',
        'Install OTRS' => 'Instal·lar OTRS',
        'Intro' => 'Intro',
        'License' => 'Llicència',
        'Database' => 'Base de dades',
        'Configure Mail' => 'Configurar el correu',
        'Database deleted.' => 'Base de dades esborrada.',
        'Database setup succesful!' => 'Base de dades de configurada amb èxit!',
        'Login is needed!' => 'Es requereix login',
        'Password is needed!' => 'Falta la contrasenya!',
        'Take this Customer' => 'Utilitzar aquest client',
        'Take this User' => 'Utilitzar aquest usuari',
        'possible' => 'possible',
        'reject' => 'rebutjar',
        'reverse' => 'capgirar',
        'Facility' => 'Facilitat',
        'Time Zone' => 'Zona horària',
        'Pending till' => 'Pendent fins a',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            'No utilitzi el compte de superusuari per treballar amb OTRS! Crear nous agents i treballar amb aquests comptes en el seu lloc.',
        'Dispatching by email To: field.' => 'Despatxar pel camp To: del correu',
        'Dispatching by selected Queue.' => 'Despatxar per la cua seleccionada',
        'No entry found!' => 'No es va trobar!',
        'Session has timed out. Please log in again.' => 'La sessió ha expirat. Per favor iniciï una sessió novament.',
        'No Permission!' => 'No té Permís!',
        'To: (%s) replaced with database email!' => 'To: (%s) substituït amb email de la base de dades!',
        'Cc: (%s) added database email!' => 'Cc: (%s) Afegit a la base de correu!',
        '(Click here to add)' => '(Faci clic aqui per a afegir)',
        'Preview' => 'Vista Prèvia',
        'Package not correctly deployed! Please reinstall the package.' =>
            'El paquet no s\'ha desplegat correctament! Per favor, torni a instal·lar el paquet.',
        '%s is not writable!' => '%s no té permisos d\'escriptura!',
        'Cannot create %s!' => 'No pot crear %s!',
        'Check to activate this date' => 'Marcar per activar aquesta data',
        'You have Out of Office enabled, would you like to disable it?' =>
            'Vostè té Fora de l\'Oficina habilitat, vol desactivar-ho?',
        'Customer %s added' => 'Client %s afegit',
        'Role added!' => 'Rol afegit!',
        'Role updated!' => 'Rol actualitzat',
        'Attachment added!' => 'Adjunt afegit!',
        'Attachment updated!' => 'Adjunt actualitzat!',
        'Response added!' => 'Resposta afegida!',
        'Response updated!' => 'Resposta actualitzada!',
        'Group updated!' => 'Grup afegit!',
        'Queue added!' => 'Cua afegida!',
        'Queue updated!' => 'Cua actualitzada!',
        'State added!' => 'Estat afegit!',
        'State updated!' => 'Estat actualitzat!',
        'Type added!' => 'Tipus afegit!',
        'Type updated!' => 'Tipus actualitzat!',
        'Customer updated!' => 'Client actualitzat!',
        'Customer company added!' => 'Empresa del client afegida!',
        'Customer company updated!' => 'Empresa del client actualitzada!',
        'Mail account added!' => 'Compte de correu afegida!',
        'Mail account updated!' => 'Compte de correu actualitzada!',
        'System e-mail address added!' => 'Adreça de correu electrònic de sistema afegida!',
        'System e-mail address updated!' => 'Adreça de correu electrònic de sistema actualitzada!',
        'Contract' => 'Contracte',
        'Online Customer: %s' => 'Client connectat: %s',
        'Online Agent: %s' => 'Agent connectat: %s',
        'Calendar' => 'Calendari',
        'File' => 'Arxiu',
        'Filename' => 'Nom de l\'arxiu',
        'Type' => 'Tipus',
        'Size' => 'Tamany',
        'Upload' => 'Penjar',
        'Directory' => 'Directori',
        'Signed' => 'Signat',
        'Sign' => 'Signatura',
        'Crypted' => 'Encriptat',
        'Crypt' => 'Encriptar',
        'PGP' => 'PGP',
        'PGP Key' => 'Clau PGP',
        'PGP Keys' => 'Claus PGP',
        'S/MIME' => 'S/MIME',
        'S/MIME Certificate' => 'Certificat S/MIME',
        'S/MIME Certificates' => 'Certificats S/MIME',
        'Office' => 'Oficina',
        'Phone' => 'Telèfono',
        'Fax' => 'Fax',
        'Mobile' => 'Mòbil',
        'Zip' => 'CP',
        'City' => 'Ciutat',
        'Street' => 'Carrer',
        'Country' => 'Pais',
        'Location' => 'Localitat',
        'installed' => 'instal·lat',
        'uninstalled' => 'desinstal·lat',
        'Security Note: You should activate %s because application is already running!' =>
            'Nota de seguretat: Vostè ha d\'activar %s perquè l\'aplicació ja està corrent!',
        'Unable to parse repository index document.' => 'No es pot analitzar el repositori de documents de l\'índex.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'No hi ha paquets per a la seva versió de Framework en aquest repositori, aquest només conté els paquets per a altres versions de Framework.',
        'No packages, or no new packages, found in selected repository.' =>
            'Cap paquet, o cap nou paquet, trobat en el repositori seleccionat.',
        'Edit the system configuration settings.' => 'Editar els paràmetres de configuració del sistema.',
        'printed at' => 'imprès en',
        'Loading...' => 'Carregant...',
        'Dear Mr. %s,' => 'Benvolgut Sr. %s',
        'Dear Mrs. %s,' => 'Benvolguda Sra. %s',
        'Dear %s,' => 'Benvolgut %s',
        'Hello %s,' => 'Hola %s,',
        'This email address already exists. Please log in or reset your password.' =>
            'Aquesta adreça de correu electrònic ja existeix. Per favor iniciï sessió o restableixi la seva contrasenya.',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Nou compte creat. Enviada la informació d\'accés a %s. Per favor, consulti el seu correu electrònic.',
        'Please press Back and try again.' => 'Per favor premi Tornar i provi de nou.',
        'Sent password reset instructions. Please check your email.' => 'Enviades les instruccions per restablir la contrasenya. Per favor, consulti el seu correu electrònic.',
        'Sent new password to %s. Please check your email.' => 'Enviada nova contrasenya per a %s. Per favor, consulti el seu correu electrònic.',
        'Upcoming Events' => 'Propers esdeveniments',
        'Event' => 'Esdeveniment',
        'Events' => 'Esdeveniments',
        'Invalid Token!' => '\'Token\' invàlid!',
        'more' => 'més',
        'For more info see:' => 'Para més informació vegi:',
        'Package verification failed!' => 'Verificació del paquet ha fallat!',
        'Collapse' => 'Contreure',
        'Shown' => 'Mostra',
        'News' => 'Notícies',
        'Product News' => 'Notícies de productes',
        'OTRS News' => 'Novetats de OTRS',
        '7 Day Stats' => 'Estadístiques Setmanals',
        'Bold' => 'Negreta',
        'Italic' => 'Cursiva',
        'Underline' => 'Subratllat',
        'Font Color' => 'Color de la lletra',
        'Background Color' => 'Color de fons',
        'Remove Formatting' => 'Suprimir format',
        'Show/Hide Hidden Elements' => 'Mostrar/Ocultar elements ocults',
        'Align Left' => 'Alinea a l\'esquerra',
        'Align Center' => 'Alinea al centre',
        'Align Right' => 'Alinea a la dreta',
        'Justify' => 'Justificat',
        'Header' => 'Capçalera',
        'Indent' => 'Augmenta el sagnat',
        'Outdent' => 'Redueix el sagnat',
        'Create an Unordered List' => 'Crear una llista desordenada',
        'Create an Ordered List' => 'Crear una llista ordenada',
        'HTML Link' => 'Enllaç HTML',
        'Insert Image' => 'Insereix imatge',
        'CTRL' => 'CRTL',
        'SHIFT' => 'SHIFT',
        'Undo' => 'Desfer',
        'Redo' => 'Tornar a fer',
        'Scheduler process is registered but might not be running.' => 'El planificador de processos s\'ha registrat però no pot estar en funcionament.',
        'Scheduler is not running.' => 'El planificador no està funcionant.',

        # Template: AAACalendar
        'New Year\'s Day' => 'Dia d\'Any Nou',
        'International Workers\' Day' => 'Dia Internacional dels treballadors',
        'Christmas Eve' => 'Nit de Nadal',
        'First Christmas Day' => 'Nadal',
        'Second Christmas Day' => 'Segona festa de Nadal',
        'New Year\'s Eve' => 'Cap d\'any',

        # Template: AAAGenericInterface
        'OTRS as requester' => '',
        'OTRS as provider' => '',
        'Webservice "%s" created!' => '',
        'Webservice "%s" updated!' => '',

        # Template: AAAMonth
        'Jan' => 'Gen',
        'Feb' => 'Feb',
        'Mar' => 'Mar',
        'Apr' => 'Abr',
        'May' => 'Mai',
        'Jun' => 'Jun',
        'Jul' => 'Jul',
        'Aug' => 'Ago',
        'Sep' => 'Set',
        'Oct' => 'Oct',
        'Nov' => 'Nov',
        'Dec' => 'Des',
        'January' => 'Gener',
        'February' => 'Febrer',
        'March' => 'Març',
        'April' => 'Abril',
        'May_long' => 'Maig',
        'June' => 'Juny',
        'July' => 'Juliol',
        'August' => 'Agost',
        'September' => 'Setembre',
        'October' => 'Octubre',
        'November' => 'Novembre',
        'December' => 'Desembre',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'Les preferències van ser actualitzades!',
        'User Profile' => 'Perfil d\'usuari',
        'Email Settings' => 'Configuració del correu electrònic',
        'Other Settings' => 'Altres configuracions',
        'Change Password' => 'Canviar contrasenya',
        'Current password' => 'Contrasenya actual',
        'New password' => 'Nova contrasenya',
        'Verify password' => 'Verificar la contrasenya',
        'Spelling Dictionary' => 'Diccionari Ortogràfic',
        'Default spelling dictionary' => 'Diccionari ortogràfic predeterminat',
        'Max. shown Tickets a page in Overview.' => 'Quantitat de Tiquets a mostrar en Resum',
        'The current password is not correct. Please try again!' => 'La contrasenya actual no és correcta. Per favor, intenti-ho de nou!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'No es pot actualitzar la contrasenya, les contrasenyes noves no coincideixen. Per favor, intenti-ho de nou!',
        'Can\'t update password, it contains invalid characters!' => 'No es pot actualitzar la contrasenya, conté caràcters no vàlids!',
        'Can\'t update password, it must be at least %s characters long!' =>
            'No es pot actualitzar la contrasenya, ha de tenir almenys %s caràcters!',
        'Can\'t update password, it must contain at least 2 lowercase  and 2 uppercase characters!' =>
            'No es pot actualitzar la contrasenya, ha de contenir almenys 2 lletres minúscules i 2 majúscules!',
        'Can\'t update password, it must contain at least 1 digit!' => 'No es pot actualitzar la contrasenya, ha de contenir almenys un dígit 1!',
        'Can\'t update password, it must contain at least 2 characters!' =>
            'No es pot actualitzar la contrasenya, ha de contenir almenys dues lletres!',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            'No es pot actualitzar la contrasenya, aquesta contrasenya ja s\'ha utilitzat. Per favor, triï una nova!',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Seleccioni el caràcter de separació utilitzat en els arxius CSV (estadístiques i recerques). Si vostè no selecciona un separador aquí, s\'utilitzarà el predeterminat per al seu idioma.',
        'CSV Separator' => 'Separador CSV',

        # Template: AAAStats
        'Stat' => 'Estadístiques',
        'Sum' => 'Suma',
        'Please fill out the required fields!' => 'Per favor empleni els camps requerits',
        'Please select a file!' => 'Per favor seleccioni un arxiu',
        'Please select an object!' => 'Per favor seleccioni un objecte',
        'Please select a graph size!' => 'Per favor, seleccioni una grandària de gràfic',
        'Please select one element for the X-axis!' => 'Per favor, seleccioni un element per a l\'eix X',
        'Please select only one element or turn off the button \'Fixed\' where the select field is marked!' =>
            'Per favor, seleccioni un sol element o desactivi el botó \'Fixat\' on el camp seleccionat està marcat!',
        'If you use a checkbox you have to select some attributes of the select field!' =>
            'Si usa una casella de selecció, ha de seleccionar alguns atributs del camp seleccionat',
        'Please insert a value in the selected input field or turn off the \'Fixed\' checkbox!' =>
            'Per favor introdueixi un valor en el camp d\'entrada o desactivi la selecció \'Fixat\'',
        'The selected end time is before the start time!' => 'La data de final és prèvia a la inicial!',
        'You have to select one or more attributes from the select field!' =>
            'Ha de seleccionar un o més atributs del camp seleccionat!',
        'The selected Date isn\'t valid!' => 'La data seleccionada no és vàlida',
        'Please select only one or two elements via the checkbox!' => 'Per favor seleccioni només un o dos elements usant la casella de selecció!',
        'If you use a time scale element you can only select one element!' =>
            'Si utilitza l\'escala de temps només pot seleccionar un element!',
        'You have an error in your time selection!' => 'Té un error en la selecció de temps!',
        'Your reporting time interval is too small, please use a larger time scale!' =>
            'L\'interval de temps per a informes és massa petit, per favor utilitzi una escala de temps major!',
        'The selected start time is before the allowed start time!' => 'El període de temps inicial és anterior al permès!',
        'The selected end time is after the allowed end time!' => 'El període de temps final és posterior al permès!',
        'The selected time period is larger than the allowed time period!' =>
            'El període de temps és major que el permès!',
        'Common Specification' => 'Especificació comuna',
        'X-axis' => 'EixX',
        'Value Series' => 'Sèrie de Valors',
        'Restrictions' => 'Restriccions',
        'graph-lines' => 'gràfica-de-línies',
        'graph-bars' => 'gràfica-de-barres',
        'graph-hbars' => 'gràfica-de-barreshor',
        'graph-points' => 'gràfica-de-punts',
        'graph-lines-points' => 'gràfica-de-línies-punts',
        'graph-area' => 'gráfica-de-àrea',
        'graph-pie' => 'gráfica-de-pastís',
        'extended' => 'estès',
        'Agent/Owner' => 'Agent/Propietari',
        'Created by Agent/Owner' => 'Creat per Agent/Propietari',
        'Created Priority' => 'Prioritat de Creació',
        'Created State' => 'Estat al Crear-se',
        'Create Time' => 'Data de Creació',
        'CustomerUserLogin' => 'Login de Client',
        'Close Time' => 'Data de Tancament',
        'TicketAccumulation' => 'AcumulacioDeTiquets',
        'Attributes to be printed' => 'Atributs a imprimir',
        'Sort sequence' => 'Ordenar seqüència',
        'Order by' => 'Ordenar per',
        'Limit' => 'Límit',
        'Ticketlist' => 'Llista de tiquets',
        'ascending' => 'ascendent',
        'descending' => 'descendent',
        'First Lock' => 'Primer bloqueig',
        'Evaluation by' => 'Avaluació per',
        'Total Time' => 'Temps total',
        'Ticket Average' => 'Tiquet-Mitjana',
        'Ticket Min Time' => 'Tiquet-Temps Mín',
        'Ticket Max Time' => 'Tiquet-Temps Màx',
        'Number of Tickets' => 'Nombre de tiquets',
        'Article Average' => 'Article-Mitjana',
        'Article Min Time' => 'Article-Temps Mín',
        'Article Max Time' => 'Article-Temps Màx',
        'Number of Articles' => 'Nombre d\'articles',
        'Accounted time by Agent' => 'Temps utilitzat per l\'agent',
        'Ticket/Article Accounted Time' => 'Temps utilitzat pel tiquet/article',
        'TicketAccountedTime' => 'TempsUtilitzatTiquet',
        'Ticket Create Time' => 'Creació del tiquet',
        'Ticket Close Time' => 'Finalització del tiquet',

        # Template: AAATicket
        'Status View' => 'Vista d\'estat',
        'Bulk' => 'Volum',
        'Lock' => 'Bloquejar',
        'Unlock' => 'Desbloquejar',
        'History' => 'Història',
        'Zoom' => 'Detall',
        'Age' => 'Antiguitat',
        'Bounce' => 'Retornar',
        'Forward' => 'Reexpedir',
        'From' => 'De',
        'To' => 'A',
        'Cc' => 'Còpia ',
        'Bcc' => 'Còpia Invisible',
        'Subject' => 'Assumpte',
        'Move' => 'Moure',
        'Queue' => 'Cues',
        'Queues' => 'Cues',
        'Priority' => 'Prioritat',
        'Priorities' => 'Prioritats',
        'Priority Update' => 'Actualitzar la prioritat',
        'Priority added!' => 'Prioritat afegida!',
        'Priority updated!' => 'Prioritat actualitzada!',
        'Signature added!' => 'Signatura afegida!',
        'Signature updated!' => 'Signatura actualitzada!',
        'SLA' => 'SLA',
        'Service Level Agreement' => 'Acord de Nivell de Servei',
        'Service Level Agreements' => 'Acords de Nivell de Servei',
        'Service' => 'Servei',
        'Services' => 'Serveis',
        'State' => 'Estat',
        'States' => 'Estats',
        'Status' => 'Estat',
        'Statuses' => 'Estats',
        'Ticket Type' => 'Tipus de tiquet',
        'Ticket Types' => 'Tipus de tiquets',
        'Compose' => 'Redactar',
        'Pending' => 'Pendent',
        'Owner' => 'Propietari',
        'Owner Update' => 'Actualitzar Propietari',
        'Responsible' => 'Responsable',
        'Responsible Update' => 'Actualitzar Responsable',
        'Sender' => 'Remitent',
        'Article' => 'Article',
        'Ticket' => 'Tiquet',
        'Createtime' => 'Data de creació',
        'plain' => 'text',
        'Email' => 'Correu',
        'email' => 'correu',
        'Close' => 'Tancar',
        'Action' => 'Acció',
        'Attachment' => 'Adjunt',
        'Attachments' => 'Adjunts',
        'This message was written in a character set other than your own.' =>
            'Aquest missatge va ser escrit usant un joc de caràcters distint al seu',
        'If it is not displayed correctly,' => 'Si no es mostra correctament',
        'This is a' => 'Aquest és un',
        'to open it in a new window.' => 'Per a obrir en una nova finestra',
        'This is a HTML email. Click here to show it.' => 'Aquest és un missatge HTML. Faci clic aquí per a mostrar-lo.',
        'Free Fields' => 'Camps lliures',
        'Merge' => 'Fusionar',
        'merged' => 'fusionat',
        'closed successful' => 'tancat amb èxit',
        'closed unsuccessful' => 'tancat sense èxit ',
        'Locked Tickets Total' => 'Tiquets bloquejats-Total',
        'Locked Tickets Reminder Reached' => 'Tiquets bloquejats-Recordatori aconseguit',
        'Locked Tickets New' => 'Tiquets bloquejats-Nou',
        'Responsible Tickets Total' => 'Tiquets responsables-Total',
        'Responsible Tickets New' => 'Tiquets responsables-Nou',
        'Responsible Tickets Reminder Reached' => 'Tiquets responsables-Recordatori aconseguit',
        'Watched Tickets Total' => 'Tiquets vistos-Total',
        'Watched Tickets New' => 'Tiquets vistos-Nou',
        'Watched Tickets Reminder Reached' => 'Tiquets vistos-Recordatori aconseguit',
        'All tickets' => 'Tots els tiquets',
        'Available tickets' => 'Tiquets disponibles',
        'Escalation' => 'Escalat',
        'last-search' => 'última recerca',
        'QueueView' => 'Veure la cua',
        'Ticket Escalation View' => 'Vista escalat de tiquet',
        'Message from' => 'Missatge de',
        'End message' => 'Final del missatge',
        'Forwarded message from' => 'Missatge reexpedit de',
        'End forwarded message' => 'Final del missatge reexpedit',
        'new' => 'nou',
        'open' => 'obert',
        'Open' => 'Obert',
        'Open tickets' => 'Tiquets oberts',
        'closed' => 'tancat',
        'Closed' => 'Tancat',
        'Closed tickets' => 'Tiquets tancats',
        'removed' => 'eliminat',
        'pending reminder' => 'recordatori pendent',
        'pending auto' => 'pendent auto',
        'pending auto close+' => 'pendent auto close+',
        'pending auto close-' => 'pendent auto close-',
        'email-external' => 'correu-extern',
        'email-internal' => 'correu-intern',
        'note-external' => 'nota-externa',
        'note-internal' => 'nota-interna',
        'note-report' => 'nota-informe',
        'phone' => 'telèfon',
        'sms' => 'sms',
        'webrequest' => 'Sol·licitud via web',
        'lock' => 'bloquejat',
        'unlock' => 'desbloquejat',
        'very low' => 'molt baix',
        'low' => 'baix',
        'normal' => 'normal',
        'high' => 'alt',
        'very high' => 'molt alt',
        '1 very low' => '1 molt baix',
        '2 low' => '2 baix',
        '3 normal' => '3 normal',
        '4 high' => '4 alt',
        '5 very high' => '5 molt alt',
        'auto follow up' => 'auto seguiment',
        'auto reject' => 'auto rebuig',
        'auto remove' => 'auto eliminar',
        'auto reply' => 'auto respondre',
        'auto reply/new ticket' => 'auto respondre/nou tiquet',
        'Ticket "%s" created!' => 'Tiquet "%s" creat!',
        'Ticket Number' => 'Nombre tiquet',
        'Ticket Object' => 'Objecte tiquet',
        'No such Ticket Number "%s"! Can\'t link it!' => 'No existeix el tiquet Nombre "%s"! No pot vincular-lo!',
        'You don\'t have write access to this ticket.' => 'No té accés d\'escriptura a aquest tiquet.',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'Ho sentim, necessita ser el propietari del tiquet per realitzar aquesta acció.',
        'Ticket selected.' => 'Tiquet seleccionat.',
        'Ticket is locked by another agent.' => 'Tiquet bloquejat per un altre agent.',
        'Ticket locked.' => 'Tiquet bloquejat',
        'Don\'t show closed Tickets' => 'No mostrar els tiquets tancats',
        'Show closed Tickets' => 'Mostrar Tiquets tancats',
        'New Article' => 'Nou article',
        'Unread article(s) available' => 'Article(s) no llegit(s) disponible(s)',
        'Remove from list of watched tickets' => 'Eliminar de la llista de tiquets vists',
        'Add to list of watched tickets' => 'Afegir a la llista de tiquets vists',
        'Email-Ticket' => 'Tiquet-Correu',
        'Create new Email Ticket' => 'Crea nou tiquet de correu',
        'Phone-Ticket' => 'Tiquet-Telefònic',
        'Search Tickets' => 'Cercar tiquets',
        'Edit Customer Users' => 'Editar els usuaris del client',
        'Edit Customer Company' => 'Editar empresa del client',
        'Bulk Action' => 'Acció múltiple',
        'Bulk Actions on Tickets' => 'Acció múltiple en tiquets',
        'Send Email and create a new Ticket' => 'Enviar un correu i crear un nou tiquet',
        'Create new Email Ticket and send this out (Outbound)' => 'Crea nou tiquet de correu i ho envia (sortida)',
        'Create new Phone Ticket (Inbound)' => 'Crea nou tiquet telefònic (entrada)',
        'Overview of all open Tickets' => 'Resum de tots els tiquets oberts',
        'Locked Tickets' => 'Tiquets bloquejats',
        'My Locked Tickets' => 'Els meus tiquets bloquejats',
        'My Watched Tickets' => 'Els meus tiquets vists',
        'My Responsible Tickets' => 'Els meus tiquets responsables',
        'Watched Tickets' => 'Tiquets observats',
        'Watched' => 'Observat',
        'Watch' => 'Veure',
        'Unwatch' => 'No veure',
        'Lock it to work on it' => 'Bloquejar-lo per a treballar en ell',
        'Unlock to give it back to the queue' => '',
        'Show the ticket history' => 'Mostrar la història del tiquet',
        'Print this ticket' => 'Imprimir aquest tiquet',
        'Print this article' => '',
        'Split this article' => '',
        'Forward article via mail' => '',
        'Change the ticket priority' => 'Canviar la prioritat del tiquet',
        'Change the ticket free fields!' => 'Canviar els camps lliures del tiquet!',
        'Link this ticket to other objects' => 'Enllaçar aquest tiquet a altres objectes',
        'Change the owner for this ticket' => 'Canviar el propietari de aquest tiquet',
        'Change the  customer for this ticket' => '',
        'Add a note to this ticket' => 'Afegir una nota a aquest tiquet',
        'Merge into a different ticket' => 'Unir amb un tiquet diferent',
        'Set this ticket to pending' => 'Col·locar aquest tiquet com pendent',
        'Close this ticket' => 'Tancar aquest tiquet',
        'Look into a ticket!' => 'Revisar un tiquet',
        'Delete this ticket' => 'Eliminar aquest tiquet',
        'Mark as Spam!' => 'Marcar com correu no desitjat!',
        'My Queues' => 'Les meves Cues',
        'Shown Tickets' => 'Mostrar tiquets',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'El seu correu amb nombre de tiquet "<OTRS_TICKET>" es va unir a "<OTRS_MERGE_TO_TICKET>".',
        'Ticket %s: first response time is over (%s)!' => 'Tiquet %s: Temps per a primera resposta ha vençut (%s)!',
        'Ticket %s: first response time will be over in %s!' => 'Tiquet %s: Temps per a primera resposta està per vèncer en %s!',
        'Ticket %s: update time is over (%s)!' => 'Tiquet %s: Temps per a actualització ha vençut (%s)!',
        'Ticket %s: update time will be over in %s!' => 'Tiquet %s: Temps per a actualització està per vèncer en %s!',
        'Ticket %s: solution time is over (%s)!' => 'Tiquet %s: Temps per a solució ha vençut (%s)!',
        'Ticket %s: solution time will be over in %s!' => 'Tiquet %s: Temps per a solució està per vèncer en %s!',
        'There are more escalated tickets!' => 'No hi ha més tiquets escalats',
        'Plain Format' => 'Sense format',
        'Reply All' => 'Respondre a tots',
        'Direction' => 'Direcció',
        'Agent (All with write permissions)' => 'Agent (tots amb permisos d\'escriptura)',
        'Agent (Owner)' => 'Agent (Propietari)',
        'Agent (Responsible)' => 'Agent (Responsable)',
        'New ticket notification' => 'Notificació de nous tiquets',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Notifiqui\'m si hi ha un nou tiquet en "Les meves Cues".',
        'Send new ticket notifications' => 'Enviar notificacions de nous tiquets',
        'Ticket follow up notification' => 'Notificació de seguiment de tiquet',
        'Ticket lock timeout notification' => 'Notificació de bloqueig de tiquets per temps',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Notifiqui\'m si un tiquet és desbloquejat pel sistema',
        'Send ticket lock timeout notifications' => 'Enviar notificacions de temps d\'espera de tiquets bloquejats',
        'Ticket move notification' => 'Notificació de tiquets moguts',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Notifiqui\'m si un tiquet és mogut en una de "Les meves Cues". ',
        'Send ticket move notifications' => 'Enviar notificacions de tiquets moguts',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            'Cua de selecció de cues favorites. Vostè també pot ser notificat d\'aquestes cues per correu si està habilitat',
        'Custom Queue' => 'Cua personal',
        'QueueView refresh time' => 'Temps d\'actualització de la vista de cues',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            'Si s\'activa, la vista de cues s\'actualitzarà automàticament després del temps especificat.',
        'Refresh QueueView after' => 'Actualitzar la vista de cues després',
        'Screen after new ticket' => 'Pantalla posterior a nou tiquet',
        'Show this screen after I created a new ticket' => 'Mostrar aquesta pantalla després d\'haver creat un nou tiquet',
        'Closed Tickets' => 'Tiquets tancats',
        'Show closed tickets.' => 'Mostrar tiquets tancats',
        'Max. shown Tickets a page in QueueView.' => 'Quantitat de Tiquets a mostrar en la Vista de Cua',
        'Ticket Overview "Small" Limit' => 'Límit descripció "Petita" de tiquet',
        'Ticket limit per page for Ticket Overview "Small"' => 'Límit de tiquets per pàgina per a descripció "Petita" de tiquet',
        'Ticket Overview "Medium" Limit' => 'Límit descripció "Mitjana" de tiquet',
        'Ticket limit per page for Ticket Overview "Medium"' => 'Límit de tiquets per pàgina per a descripció "Mitjana" de tiquet',
        'Ticket Overview "Preview" Limit' => 'Límit descripció "Vista prèvia" de tiquet',
        'Ticket limit per page for Ticket Overview "Preview"' => 'Límit de tiquets per pàgina per a descripció "Vista prèvia" de tiquet',
        'Ticket watch notification' => 'Notificació de rellotge de tiquet',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            'Enviï\'m les mateixes notificacions que rebran els propietaris dels tiquets que veig.',
        'Send ticket watch notifications' => 'Enviar notificacions de tiquets vists',
        'Out Of Office Time' => 'Fora de l\'oficina',
        'New Ticket' => 'NouTiquet',
        'Create new Ticket' => 'Crear un nou tiquet',
        'Customer called' => 'Client cridat ',
        'phone call' => 'Cridada telefònica',
        'Phone Call Outbound' => 'Telèfon de trucades sortints',
        'Phone Call Inbound' => 'Telèfon de trucades entrants',
        'Reminder Reached' => 'Recordatori aconseguit',
        'Reminder Tickets' => 'Tiquets de recordatoris',
        'Escalated Tickets' => 'Tiquets escalats',
        'New Tickets' => 'Nous tiquets',
        'Open Tickets / Need to be answered' => 'Tiquets Oberts / Que necessiten d\'una resposta',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            'Tots els tiquets oberts, ja s\'ha treballat en aquests tiquets, però necessiten una resposta',
        'All new tickets, these tickets have not been worked on yet' => 'Totes els tiquets nous, en aquests tiquets encara no s\'ha treballat',
        'All escalated tickets' => 'Tots els tiquets escalats',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Totes els tiquet amb un conjunt de recordatoris on s\'ha arribat a la data de recordatori',
        'Archived tickets' => 'Tiquets arxivats',
        'Unarchived tickets' => 'Tiquets sense arxivar',
        'History::Move' => 'Tiquet mogut a la cua "%s" (%s) de la cua "%s" (%s).',
        'History::TypeUpdate' => 'Tipus actualitzat a %s (ANEU=%s).',
        'History::ServiceUpdate' => 'Servei actualitzat a %s (ANEU=%s).',
        'History::SLAUpdate' => 'SLA actualitzada a %s (ANEU=%s).',
        'History::NewTicket' => 'Nou tiquet [s] creat (Q=%s;P=%s;S=%s).',
        'History::FollowUp' => 'Seguiment per a [s]. %s',
        'History::SendAutoReject' => 'Rebuig automàtic enviat a "%s".',
        'History::SendAutoReply' => 'Resposta automàtica enviada a "%s".',
        'History::SendAutoFollowUp' => 'Seguiment automàtic enviat a "%s".',
        'History::Forward' => 'Reexpedit a "%s".',
        'History::Bounce' => 'Retornar a "%s".',
        'History::SendAnswer' => 'Correu enviat a "%s".',
        'History::SendAgentNotification' => '"%s"-notificació enviada a "%s".',
        'History::SendCustomerNotification' => 'Notificació; enviada a "%s".',
        'History::EmailAgent' => 'Correu enviat al agent.',
        'History::EmailCustomer' => 'Afegit correu. %s',
        'History::PhoneCallAgent' => 'El agent va cridar al client.',
        'History::PhoneCallCustomer' => 'El client va cridar.',
        'History::AddNote' => 'Anota afegida (%s)',
        'History::Lock' => 'Tiquet bloquejat.',
        'History::Unlock' => 'Tiquet desbloquejat.',
        'History::TimeAccounting' => '%s unitat(s) de temps comptabilitzades. Nou total : %s unitat(s) de temps.',
        'History::Remove' => '%s',
        'History::CustomerUpdate' => 'Actualitzat: %s',
        'History::PriorityUpdate' => 'Canviar prioritat de "%s" (%s) a "%s" (%s).',
        'History::OwnerUpdate' => 'El nou propietari és "%s" (ID=%s).',
        'History::LoopProtection' => 'Protecció de llaç! NO es va enviar auto-resposta a "%s".',
        'History::Misc' => '%s',
        'History::SetPendingTime' => 'Actualitzat: %s',
        'History::StateUpdate' => 'Antic: "%s" Nou: "%s"',
        'History::TicketDynamicFieldUpdate' => 'Actualitzat: %s=%s;%s=%s;',
        'History::WebRequestCustomer' => 'Sol·licitud de client per web.',
        'History::TicketLinkAdd' => 'Afegit enllaç al tiquet "%s".',
        'History::TicketLinkDelete' => 'Eliminat enllaç al tiquet "%s".',
        'History::Subscribe' => 'Subscriure\'s',
        'History::Unsubscribe' => 'Cancel·lar subscripció',
        'History::SystemRequest' => 'Petició de sistema',
        'History::ResponsibleUpdate' => 'Actualització del responsable',
        'History::ArchiveFlagUpdate' => 'Actualització de l\'opció d\'arxiu',

        # Template: AAAWeekDay
        'Sun' => 'Diu',
        'Mon' => 'Dil',
        'Tue' => 'Dim',
        'Wed' => 'DiM',
        'Thu' => 'Dij',
        'Fri' => 'Div',
        'Sat' => 'Dis',

        # Template: AdminAttachment
        'Attachment Management' => 'gestió d\'adjunts',
        'Actions' => 'Accions',
        'Go to overview' => 'Anar a la descripció',
        'Add attachment' => 'Afegir arxiu adjunt',
        'List' => 'Llista',
        'Validity' => 'Validesa',
        'No data found.' => 'No es van trobar dades.',
        'Download file' => 'Descarregar fitxer',
        'Delete this attachment' => 'Esborrar aquest arxiu adjunt',
        'Add Attachment' => 'Afegir arxiu adjunt',
        'Edit Attachment' => 'Editar arxiu adjunt',
        'This field is required.' => 'Aquest camp és obligatori.',
        'or' => 'o',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Gestió de respostes automàtiques',
        'Add auto response' => 'Afegir resposta automàtica',
        'Add Auto Response' => 'Afegir resposta automàtica',
        'Edit Auto Response' => 'Editar resposta automàtica',
        'Response' => 'Resposta',
        'Auto response from' => 'Resposta automática de',
        'Reference' => 'Referència',
        'You can use the following tags' => 'Pot utilitzar les següents etiquetes',
        'To get the first 20 character of the subject.' => 'Per a obtenir els primers 20 caràcters de l\'assumpte.',
        'To get the first 5 lines of the email.' => 'Per a obtenir les primeres 5 línies del correu.',
        'To get the realname of the sender (if given).' => 'Per a obtenir el nom real del remitent (si existeix).',
        'To get the article attribute' => 'Per obtenir l\'atribut article',
        ' e. g.' => ' p. ex.',
        'Options of the current customer user data' => 'Opcions de les dades dels usuaris actuals dels clients',
        'Ticket owner options' => 'Opcions de propietari del tiquet',
        'Ticket responsible options' => 'Opcions de responsable del tiquet',
        'Options of the current user who requested this action' => 'Opcions de l\'usuari actual que va sol·licitar aquesta acció',
        'Options of the ticket data' => 'Opcions de les dades del tiquet',
        'Config options' => 'Opcions de configuració',
        'Example response' => 'Resposta d\'exemple',

        # Template: AdminCustomerCompany
        'Customer Company Management' => 'Administració de empresa del client',
        'Wildcards like \'*\' are allowed.' => 'Es permeten comodins com \'*\'.',
        'Add customer company' => 'Afegir empresa del client',
        'Please enter a search term to look for customer companies.' => 'Per favor, introdueixi un terme de recerca per buscar empreses clients.',
        'Add Customer Company' => 'Afegir empresa del client',

        # Template: AdminCustomerUser
        'Customer Management' => 'Gestió de Clients',
        'Add customer' => 'Afegir al client',
        'Select' => 'Seleccionar',
        'Hint' => 'Indici',
        'Customer will be needed to have a customer history and to login via customer panel.' =>
            'El client haurà de comptar amb un historial de client i accedir a través del panell de clients.',
        'Please enter a search term to look for customers.' => 'Per favor, introdueixi un terme de recerca per buscar clients.',
        'Last Login' => 'Darrera conexió',
        'Add Customer' => 'Afegir client',
        'Edit Customer' => 'Editar client',
        'This field is required and needs to be a valid email address.' =>
            'Aquest camp és obligatori i ha de ser una adreça vàlida de correu electrònic.',
        'This email address is not allowed due to the system configuration.' =>
            'Aquesta adreça de correu electrònic no està permesa, a causa de la configuració del sistema.',
        'This email address failed MX check.' => 'Aquesta adreça de correu electrònic va fallar la comprovació de MX.',
        'DNS problem, please check your configuration and the error log.' =>
            'Problema de DNS, per favor revisi la seva configuració i el registre d\'errors.',
        'The syntax of this email address is incorrect.' => 'La sintaxi d\'aquesta adreça de correu electrònic és incorrecta.',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => 'Gestionar relacions Grup-Client',
        'Notice' => 'Notícia',
        'This feature is disabled!' => 'Aquesta característica està desactivada!',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Només utilitzar aquesta funció si desitja definir permisos de grup per als clients.',
        'Enable it here!' => 'Activar aquí',
        'Search for customers.' => 'Recerca de clients.',
        'Edit Customer Default Groups' => 'Edición de grupos predeterminados del cliente',
        'These groups are automatically assigned to all customers.' => 'Aquests grups s\'assignen automàticament a tots els clients.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'Pot administrar aquests grups a través del paràmetre "CustomerGroupAlwaysGroups".',
        'Filter for Groups' => 'Filtre per als grups',
        'Select the customer:group permissions.' => 'Seleccioni el client: permisos de grup.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Si no se selecciona gens, llavors no hi ha permisos en aquest grup (els tiquets no estaran disponibles per al client).',
        'Search Result:' => 'Resultats de la recerca:',
        'Customers' => 'Clients',
        'Groups' => 'Grups',
        'No matches found.' => 'No es va trobar resultat.',
        'Change Group Relations for Customer' => 'Canviar les relacions de grup per al client',
        'Change Customer Relations for Group' => 'Canviar les relacions de client per al grup',
        'Toggle %s Permission for all' => 'Canviar %s permisos per a tots',
        'Toggle %s permission for %s' => 'Canviar %s permisos per a %s',
        'Customer Default Groups:' => 'Grups per defecte del client',
        'No changes can be made to these groups.' => 'No es poden fer canvis a aquests grups.',
        'ro' => 'ro',
        'Read only access to the ticket in this group/queue.' => 'Accés de només lectura als tiquets en aquest grup/cua.',
        'rw' => 'rw',
        'Full read and write access to the tickets in this group/queue.' =>
            'Accés complet de lectura i escriptura als tiquets en aquest grup/cua.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => 'Gestionar relacions Client-Serveis',
        'Edit default services' => 'Editar serveis predeterminats',
        'Filter for Services' => 'Filtre per al serveis',
        'Allocate Services to Customer' => 'Assignar serveis al client',
        'Allocate Customers to Service' => 'Assignar clients al servei',
        'Toggle active state for all' => 'Canviar estat actiu per a tots',
        'Active' => 'Actiu',
        'Toggle active state for %s' => 'Canviar estat actiu per a %s',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => 'Gestió de camps dinàmics',
        'Add new field for object' => '',
        'To add a new field, select the field type form one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'Per agregar un camp nou, seleccioni el tipus de camp d\'una de les llistes de l\'objecte. L\'objecte defineix el límit del camp i no pot ser canviat després de la creació de camp.',
        'Dynamic Fields List' => 'Llista de camps dinàmics',
        'Dynamic fields per page' => 'Camps dinàmics per pàgina',
        'Label' => 'Etiqueta',
        'Order' => 'Ordenar',
        'Object' => 'Objecte',

        # Template: AdminDynamicFieldCheckbox
        'Dynamic Fields' => 'Camps dinàmics',
        'Field' => 'Camp',
        'Go back to overview' => 'Tornar a la pàgina principal',
        'General' => 'General',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Aquest camp és obligatori, i el valor han de ser caràcters alfabètics i numèrics.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Ha de ser únic i només s\'accepten caràcters alfabètics i numèrics.',
        'Changing this value will require manual changes in the system.' =>
            'El canvi d\'aquest valor requerirà canvis manuals del sistema.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Aquest és el nom que es mostrarà en les pantalles on el camp estigui actiu.',
        'Field order' => 'Ordre dels camps',
        'This field is required and must be numeric.' => 'Aquest camp és obligatori i ha de ser numèric.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Aquest és l\'ordre en què aquest camp es mostrarà en les pantalles on estigui actiu.',
        'Field type' => 'Tipus de camp',
        'Object type' => 'Tipus d\'objecte',
        'Field Settings' => ' Configuració de camp',
        'Default value' => 'Valor predeterminat',
        'This is the default value for this field.' => 'Aquest és el valor predeterminat per a aquest camp.',
        'Save' => 'Guardar',

        # Template: AdminDynamicFieldDateTime
        'Default date difference' => 'Diferència de data per defecte',
        'This field must be numeric.' => 'Aquest camp ha de ser numèric.',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'La diferència a partir d\'ara (en segons) per calcular el valor predeterminat del camp (per exemple 3600 o -60).',
        'Define years period' => 'Defineixi Període d\'Anys',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            '',
        'Years in the past' => 'Anys en el passat',
        'Years in the past to display (default: 5 years).' => 'Anys en el passat per mostrar (per defecte: 5 anys).',
        'Years in the future' => 'Anys en el futur',
        'Years in the future to display (default: 5 years).' => 'Anys en el futur per mostrar (per defecte: 5 anys).',
        'Show link' => 'Mostrar enllaç',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'Aquí pot especificar un enllaç HTTP opcional per al valor del camp en les pantalles de Detall i Resum.',

        # Template: AdminDynamicFieldDropdown
        'Possible values' => 'Valors possibles',
        'Key' => 'Clau',
        'Value' => 'Valor',
        'Remove value' => 'Treure valor',
        'Add value' => 'Afegir valor',
        'Add Value' => 'Afegir valor',
        'Add empty value' => 'Afegir valor buit',
        'Activate this option to create an empty selectable value.' => 'Activar aquesta opció per crear un valor seleccionable buit.',
        'Translatable values' => 'Valors traduïbles',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Si s\'activa aquesta opció, els valors seran traduïts al llenguatge definit per l\'usuari.',
        'Note' => 'Nota',
        'You need to add the translations manually into the language translation files.' =>
            'És necessari afegir les traduccions de forma manual en els arxius de traducció d\'idiomes.',

        # Template: AdminDynamicFieldMultiselect

        # Template: AdminDynamicFieldText
        'Number of rows' => 'Nombre de files',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'Especificar l\'altura (en línies) per a aquest camp en el mode d\'edició.',
        'Number of cols' => 'Nombre de columnes',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'Especificar l\'ample (en caràcters) per a aquest camp en el mode d\'edició.',

        # Template: AdminEmail
        'Admin Notification' => 'Notificació a l\'administrador',
        'With this module, administrators can send messages to agents, group or role members.' =>
            'Amb aquest mòdul, els administradors poden enviar missatges als agents, grups o rols.',
        'Create Administrative Message' => 'Crear missatge administratiu',
        'Your message was sent to' => 'El seu missatge ha estat enviat a',
        'Send message to users' => 'Enviar un missatge als usuaris',
        'Send message to group members' => 'Enviar un missatge als membres del grup',
        'Group members need to have permission' => 'Els membres del grup han de tenir permís',
        'Send message to role members' => 'Enviar un missatge a membres del rol',
        'Also send to customers in groups' => 'També enviar als clients en grups',
        'Body' => 'Cos',
        'Send' => 'Enviar',

        # Template: AdminGenericAgent
        'Generic Agent' => 'Agent genèric',
        'Add job' => 'Afegir tasca',
        'Last run' => 'Última execució',
        'Run Now!' => 'Executar ara',
        'Delete this task' => 'Eliminar aquesta tasca',
        'Run this task' => 'Executar aquesta tasca',
        'Job Settings' => 'Configuració de tasques',
        'Job name' => 'Nom de tasca',
        'Currently this generic agent job will not run automatically.' =>
            'Actualment aquesta tasca d\'agent genèric no s\'executarà automàticament.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Per habilitar l\'execució automàtica seleccionar almenys un valor de minuts, hores i dies!',
        'Schedule minutes' => 'Horari minuts',
        'Schedule hours' => 'Horari hores',
        'Schedule days' => 'Horari dies',
        'Toggle this widget' => 'Canviar aquest widget',
        'Ticket Filter' => 'Filtre de tiquet',
        '(e. g. 10*5155 or 105658*)' => '(ex: 10*5155 o 105658*)',
        '(e. g. 234321)' => '(ex: 234321)',
        'Customer login' => 'Connexió de client',
        '(e. g. U5150)' => '(ex: U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Recerca de text completa en article (p. ex. "Mar*in" " o "Baue*").',
        'Agent' => 'Agent',
        'Ticket lock' => 'Bloqueig de tiquet',
        'Create times' => 'Temps de creació',
        'No create time settings.' => 'No hi ha valors per a temps de creació',
        'Ticket created' => 'Tiquet creat',
        'Ticket created between' => 'Tiquet creat entre',
        'Change times' => 'Temps de canvi',
        'No change time settings.' => 'No hi ha ajustos de temps de canvi.',
        'Ticket changed' => 'Tiquet canviat',
        'Ticket changed between' => 'Tiquet canviat entre',
        'Close times' => 'Temps de tancat',
        'No close time settings.' => 'Sense configuració de temps tancat',
        'Ticket closed' => 'Tiquet tancat',
        'Ticket closed between' => 'Tiquet tancat entre',
        'Pending times' => 'Temps de pendent',
        'No pending time settings.' => 'No hi ha valors per a temps de pendent',
        'Ticket pending time reached' => 'Temps de Pendent del Tiquet arribat',
        'Ticket pending time reached between' => 'Temps de Pendent del Tiquet arribat entre',
        'Escalation times' => 'Temps d\'escalat',
        'No escalation time settings.' => 'No hi ha valors de temps d\'escalat.',
        'Ticket escalation time reached' => 'Es va aconseguir el temps d\'escalat del tiquet',
        'Ticket escalation time reached between' => 'Es va aconseguir el temps d\'escalat del tiquet entre',
        'Escalation - first response time' => 'Escalat - temps de primera resposta',
        'Ticket first response time reached' => 'Es va aconseguir el temps de primera resposta del tiquet',
        'Ticket first response time reached between' => 'Es va aconseguir el temps de primera resposta del tiquet entre',
        'Escalation - update time' => 'Escalat - temps d\'actualització',
        'Ticket update time reached' => 'Es va aconseguir el temps d\'actualització del tiquet',
        'Ticket update time reached between' => 'Es va aconseguir el temps d\'actualització del tiquet entre',
        'Escalation - solution time' => 'Escalat - temps de solució',
        'Ticket solution time reached' => 'Es va aconseguir el temps de solució del tiquet',
        'Ticket solution time reached between' => 'Es va aconseguir el temps de solució del tiquet entre',
        'Archive search option' => 'Opció de recerca d\'arxiu',
        'Ticket Action' => 'Acció de tiquet',
        'Set new service' => 'Establir un nou servei',
        'Set new Service Level Agreement' => 'Establir un nou Acord de Nivell de Serveis',
        'Set new priority' => 'Establir una nova prioritat',
        'Set new queue' => 'Establir una nova cua',
        'Set new state' => 'Establir un nou estat',
        'Set new agent' => 'Establir un nou agent',
        'new owner' => 'now propietari',
        'new responsible' => 'nou responsable',
        'Set new ticket lock' => 'Establir un nou bloqueig de ticket',
        'New customer' => 'Nou client',
        'New customer ID' => 'Nou ID de client',
        'New title' => 'Nou títol',
        'New type' => 'Nou tipus',
        'New Dynamic Field Values' => 'Nous valors de camp dinàmic',
        'Archive selected tickets' => 'Guardar tiquets seleccionats',
        'Add Note' => 'Afegir Nota',
        'Time units' => 'Unitats de temps',
        ' (work units)' => ' (unitats de treball)',
        'Ticket Commands' => 'Ordres de tiquet',
        'Send agent/customer notifications on changes' => 'Enviar a l\'agent/client notificacions sobre els canvis',
        'CMD' => 'CMD',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'S\'executarà el comandament. ARG%[0] el nombre del tiquet. ARG%[0] l\'id del tiquet.',
        'Delete tickets' => 'Eliminar tiquets',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Advertiment: Tots els tiquets afectats seran eliminats de la base de dades i no es podran recuperar!',
        'Execute Custom Module' => 'Executar el mòdul personalitzat',
        'Param %s key' => 'Paràm %s clau',
        'Param %s value' => 'Paràm %s valor',
        'Save Changes' => 'Guardar canvis',
        'Results' => 'Resultats',
        '%s Tickets affected! What do you want to do?' => '%s Tiquets afectats! Què vol fer?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Advertiment: Vostè va usar l\'opció ESBORRAR. Tots els tiquets eliminats es perdran!',
        'Edit job' => 'Editar tasca',
        'Run job' => 'Executar tasca',
        'Affected Tickets' => 'Tiquets afectats',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => 'Depurador d\'interfície genèrica per al servei web %s',
        'Web Services' => 'Serveis Web',
        'Debugger' => 'Depurador',
        'Go back to web service' => 'Tornar a serveis web',
        'Clear' => 'Esborrar',
        'Do you really want to clear the debug log of this web service?' =>
            'Realment desitja esborrar el registre de depuració d\'aquest servei web?',
        'Request List' => 'Llista de sol·licituds',
        'Time' => 'Temps',
        'Remote IP' => 'IP remota',
        'Loading' => 'Carregant',
        'Select a single request to see its details.' => 'Seleccioni una única sol·licitud per veure els seus detalls.',
        'Filter by type' => 'Filtrar per tipus',
        'Filter from' => 'Filtrar de',
        'Filter to' => 'para',
        'Filter by remote IP' => 'Filtrar per IP remota',
        'Refresh' => 'Actualitzar',
        'Request Details' => 'Detalls de la sol·licitud',
        'An error occurred during communication.' => 'Es va produir un error durant la comunicació.',
        'Show or hide the content' => 'Mostrar o ocultar el contingut',
        'Clear debug log' => 'Esborrar registre de depuració',

        # Template: AdminGenericInterfaceInvokerDefault
        'Add new Invoker to Web Service %s' => 'Afegir nou invocador al servei web %s',
        'Change Invoker %s of Web Service %s' => 'Canviar invocador %s del servei web %s',
        'Add new invoker' => 'Afegir nou invocador',
        'Change invoker %s' => 'Canviar invocador %s',
        'Do you really want to delete this invoker?' => 'Realment desitja eliminar aquest invocador?',
        'All configuration data will be lost.' => 'Totes les dades de configuració es perdran.',
        'Invoker Details' => 'Detalls de l\'invocador',
        'The name is typically used to call up an operation of a remote web service.' =>
            'El nom se sol utilitzar per cridar a una operació d\'un servei web remot.',
        'Please provide a unique name for this web service invoker.' => 'Per favor, proporcioni un nom únic per aquest invocador de serveis web.',
        'The name you entered already exists.' => 'El nom introduït ja existeix.',
        'Invoker backend' => 'Motor de l\'invocador',
        'This OTRS invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            'Aquest mòdul del motor de l\'invocador de OTRS es dirà per preparar les dades per ser enviats al sistema remot, i per processar les seves dades de resposta.',
        'Mapping for outgoing request data' => 'Assignació per a les dades de petició sortints',
        'Configure' => 'Configurar',
        'The data from the invoker of OTRS will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Les dades de l\'invocador de OTRS seran processats ​​per aquesta assignació, per transformar-la en el tipus de dades que el sistema remot espera.',
        'Mapping for incoming response data' => 'Assignació per a les dades de petició entrants',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of OTRS expects.' =>
            'Les dades de resposta seran processats per aquesta assignació, per transformar-los en el tipus de dades que l\'invocador de OTRS espera.',
        'Event Triggers' => 'Gallets d\'esdeveniment',
        'Asynchronous' => 'Asíncron',
        'Delete this event' => 'Eliminar aquest esdeveniment',
        'This invoker will be triggered by the configured events.' => 'Aquest invocador s\'activarà pels esdeveniments configurats.',
        'Do you really want to delete this event trigger?' => 'Realment desitja eliminar aquest gallet d\'esdeveniments?',
        'Add Event Trigger' => 'Afegir gallet d\'esdeveniment',
        'To add a new event select the event object and event name and click on the "+" button' =>
            'Per agregar un nou esdeveniment seleccioni l\'objecte d\'esdeveniment i el nom de l\'esdeveniment i faci clic en el botó "+"',
        'Asynchronous event triggers are handled by the OTRS Scheduler in background (recommended).' =>
            'Els gallets d\'esdeveniments asíncrons són gestionats pel programador de OTRS en segon pla (recomanat).',
        'Synchronous event triggers would be processed directly during the web request.' =>
            'Els gallets d\'esdeveniments síncrons es processen directament en les peticions web.',
        'Save and continue' => 'Guardar i continuar',
        'Save and finish' => 'Guardar i finalitzar',
        'Delete this Invoker' => 'Esborrar aquest invocador',
        'Delete this Event Trigger' => 'Esborrar aquest gallet d\'esdeveniment',

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
        'Import' => 'Importar',
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
        'Version' => 'Version',
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
            'ADVERTIMENT: Quan es canvia el nom del grup \'admin\', abans de fer els canvis apropiats en SysConfig, se li bloqueja l\'accés al panell d\'administració! Si això ocorre, per favor, canviï el nom del grup de nou a admin amb una sentència SQL.',
        'Group Management' => 'Administració de grups',
        'Add group' => 'Afegir grup',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'El grup admin és per a usar l\'àrea d\'administració i el grup stats per a usar l\'àrea estadisticas.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Crear nous grups per gestionar permisos d\'accés per als diferents grups d\'agents (per exemple, el departament de compres, departament de suport, el departament de vendes, ...).',
        'It\'s useful for ASP solutions. ' => 'És útil per a les solucions ASP.',
        'Add Group' => 'Afegir grup',
        'Edit Group' => 'Editar grup',

        # Template: AdminLog
        'System Log' => 'Traces del Sistema',
        'Here you will find log information about your system.' => 'Aquí trobarà informació de registre sobre el seu sistema.',
        'Hide this message' => '',
        'Recent Log Entries' => '',

        # Template: AdminMailAccount
        'Mail Account Management' => 'Gestió de comptes de correu',
        'Add mail account' => 'Afegir compte de correu',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Tots els correus d\'entrada seran enviats a la cua seleccionada',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Si es pot confiar en el seu compte, els camps X-OTRS ja existents en la capçalera en el moment de l\'arribada (per a prioritat, ...) s\'utilitzaran! El filtre PostMaster s\'utilitzarà de totes maneres.',
        'Host' => 'Amfitrió',
        'Delete account' => 'Eliminar compte',
        'Fetch mail' => 'Recuperar el correu',
        'Add Mail Account' => 'Afegir compte de correu',
        'Example: mail.example.com' => 'Exemple: mail.example.com',
        'IMAP Folder' => '',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            '',
        'Trusted' => 'Es pot confiar',
        'Dispatching' => 'Remetent',
        'Edit Mail Account' => 'Editar compte de correu',

        # Template: AdminNavigationBar
        'Admin' => 'Admin',
        'Agent Management' => 'Administració d\'agent',
        'Queue Settings' => 'Configuració de les cues',
        'Ticket Settings' => 'Configuració dels tiquets',
        'System Administration' => 'Administració del sistema',

        # Template: AdminNotification
        'Notification Management' => 'Gestió de Notificacions',
        'Select a different language' => '',
        'Filter for Notification' => 'Filtre per a la notificació',
        'Notifications are sent to an agent or a customer.' => 'Les notificacions se li envian a un agent o client',
        'Notification' => 'Notificacions',
        'Edit Notification' => 'Editar notificació',
        'e. g.' => 'p. ex.',
        'Options of the current customer data' => 'Opcions de les dades dels clients actuals',

        # Template: AdminNotificationEvent
        'Add notification' => 'Afegir notificació',
        'Delete this notification' => 'Eliminar aquesta notificació',
        'Add Notification' => 'Afegir notificació',
        'Recipient groups' => 'Grups de destinataris',
        'Recipient agents' => 'Agents de destinataris',
        'Recipient roles' => 'Rols de destinataris',
        'Recipient email addresses' => 'Correu electrònic del destinatari',
        'Article type' => 'Tipus d\'article',
        'Only for ArticleCreate event' => 'Només per a l\'esdeveniment ArticleCreate',
        'Subject match' => 'L\'assumpte coincideix',
        'Body match' => 'El cos coincideix',
        'Include attachments to notification' => 'Incloure els arxius adjunts en la notificació',
        'Notification article type' => 'Notificació tipus d\'article',
        'Only for notifications to specified email addresses' => 'Només per a les notificacions a les adreces de correu electrònic especificades',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Per obtenir els primers 20 caràcters de l\'assumpte (de l\'article més recent de l\'agent).',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Per obtenir les primeres 5 línies del cos (de l\'article més recent de l\'agent).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Per obtenir els primers 20 caràcters de l\'assumpte (de l\'article més recent del client).',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Per obtenir les primeres 5 línies del cos (de l\'article més recent del client).',

        # Template: AdminPGP
        'PGP Management' => 'Administració PGP',
        'Use this feature if you want to work with PGP keys.' => 'Faci servir aquesta funció si desitja treballar amb claus *PGP.',
        'Add PGP key' => 'Afegir clau de PGP',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'D\'aquesta forma pot editar directament l\'anell de Claus configurat en SysConfig',
        'Introduction to PGP' => 'Introducció a PGP',
        'Result' => 'Resultat',
        'Identifier' => 'Identificador',
        'Bit' => 'Bit',
        'Fingerprint' => 'Empremta digital',
        'Expires' => 'Expira',
        'Delete this key' => 'Eliminar aquesta clau',
        'Add PGP Key' => 'Afegir Clau de PGP',
        'PGP key' => 'Clau de PGP',

        # Template: AdminPackageManager
        'Package Manager' => 'Gestor de paquets',
        'Uninstall package' => 'Desinstal·lar paquet',
        'Do you really want to uninstall this package?' => 'Segur que desitja desinstal·lar aquest paquet?',
        'Reinstall package' => 'Tornar a instal·lar paquet',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'De debò vol tornar a instal·lar aquest paquet? Qualsevol canvi manual es perdrà.',
        'Continue' => 'Continua',
        'Install' => 'Instal·lar',
        'Install Package' => 'Instal·lar paquet',
        'Update repository information' => 'Actualització de la informació del repositori',
        'Did not find a required feature? OTRS Group provides their subscription customers with exclusive Add-Ons:' =>
            '',
        'Online Repository' => 'Repositori en línia',
        'Vendor' => 'Venedor',
        'Module documentation' => 'Documentació de mòdul',
        'Upgrade' => 'Actualitzer',
        'Local Repository' => 'Repositori Local',
        'Uninstall' => 'Desinstal·lar',
        'Reinstall' => 'Reinstal·lar',
        'Feature Add-Ons' => '',
        'Download package' => 'Descarregar paquet',
        'Rebuild package' => 'Reconstruir paquet',
        'Metadata' => 'Metadata',
        'Change Log' => 'Registre de canvis',
        'Date' => 'Data',
        'List of Files' => 'Llista d\'Arxius',
        'Permission' => 'Permisos',
        'Download' => 'Descarregar',
        'Download file from package!' => 'Descarregar arxiu del paquet!',
        'Required' => 'Requerit',
        'PrimaryKey' => 'ClauPrimària',
        'AutoIncrement' => 'AutoIncrementar',
        'SQL' => 'SQL',
        'File differences for file %s' => 'Diferències d\'arxiu per %s',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Registre de rendiment',
        'This feature is enabled!' => 'Aquesta característica està habilitada',
        'Just use this feature if you want to log each request.' => 'Usi aquesta característica només si desitja registrar cada petició.',
        'Activating this feature might affect your system performance!' =>
            'L\'activació d\'aquesta característica pot afectar el rendiment del sistema!',
        'Disable it here!' => 'Desactivar aquí!',
        'Logfile too large!' => 'Registre molt gran',
        'The logfile is too large, you need to reset it' => 'L\'arxiu de registre és massa gran, vostè ha de reiniciar-ho',
        'Overview' => 'Resum',
        'Range' => 'Rang',
        'Interface' => 'Interfície',
        'Requests' => 'Sol·licituds',
        'Min Response' => 'Resposta Mínima',
        'Max Response' => 'Resposta Màxima',
        'Average Response' => 'Resposta Promig',
        'Period' => 'Període',
        'Min' => 'Mín',
        'Max' => 'Màx',
        'Average' => 'Promig',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'Gestió del filtre PostMaster',
        'Add filter' => 'Afegir filtre',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Per enviar o filtrar els missatges entrants basant-se en els encapçalats de correu electrònic. També és possible utilitzar expressions regulars.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Si vol fer coincidir només l\'adreça de correu, usi EMAILADDRESS:info@example.com en el camp From, To o Cc.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Si s\'utilitza expressions regulars, també pot utilitzar el valor coincident en () com [***] en l\'acció \'Conjunt\'.',
        'Delete this filter' => 'Eliminar aquest filtre',
        'Add PostMaster Filter' => 'Afegir filtre PostMaster',
        'Edit PostMaster Filter' => 'Editar filtre PostMaster',
        'Filter name' => 'Nom de filtre',
        'The name is required.' => '',
        'Stop after match' => 'Parar després de coincidència',
        'Filter Condition' => 'Condició de filtre',
        'The field needs to be a valid regular expression or a literal word.' =>
            '',
        'Set Email Headers' => 'Establir encapçalats de correu electrònic',
        'The field needs to be a literal word.' => '',

        # Template: AdminPriority
        'Priority Management' => 'Gestió de prioritat',
        'Add priority' => 'Afegir prioritat',
        'Add Priority' => 'Afegir prioritat',
        'Edit Priority' => 'Editar prioritat',

        # Template: AdminQueue
        'Manage Queues' => 'Gestionar cues',
        'Add queue' => 'Afegir cua',
        'Add Queue' => 'Afegir cua',
        'Edit Queue' => 'Editar cua',
        'Sub-queue of' => 'Sub-cua de',
        'Unlock timeout' => 'Temps per a desbloqueig automàtic',
        '0 = no unlock' => '0 = sense bloqueig',
        'Only business hours are counted.' => 'Només es conta l\'horari laboral',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Si un agent bloqueja un tiquet i no ho tanca abans que hagi passat el temps d\'espera de desbloquejo, el tiquet s\'obrirà i estarà disponible per a altres agents.',
        'Notify by' => 'Notificat per',
        '0 = no escalation' => '0 = sense escalat',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Si no s\'agrega un contacte del client, ja sigui correu electrònic extern o telèfon, a un nou tiquet abans que expiri el temps definit aquí, el tiquet és escalat.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Si un article és afegit, com un seguiment via correu electrònic o portal del client, el temps d\'actualització d\'escalat es restableix. Si no hi ha contacte del client, ja sigui correu electrònic extern o telèfon, afegit a un tiquet abans que expiri el temps definit aquí, el tiquet és escalat.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Si el tiquet no és posat a tancat abans que expiri el temps aquí definit, el tiquet és escalat.',
        'Follow up Option' => 'Opció de seguiment',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Especifica si el seguiment de tiquets tancats tornaria a obrir el tiquet, ho rebutjaria o donaria lloc a un nou tiquet.',
        'Ticket lock after a follow up' => 'Bloquejar un tiquet després del seguiment',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Si un tiquet està tancat i el client envia un seguiment el tiquet serà bloquejat per a l\'antic propietari.',
        'System address' => 'Adreça de sistema',
        'Will be the sender address of this queue for email answers.' => 'Serà l\'adreça de l\'emissor en aquesta cua per a respostes per correu.',
        'Default sign key' => 'Clau de signatura predeterminada',
        'The salutation for email answers.' => 'Salutació per a les respostes per correu.',
        'The signature for email answers.' => 'Signatura per a respostes per correu.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => 'Gestionar relacions Cua-Resposta automàtica',
        'Filter for Queues' => 'Filtre per cues',
        'Filter for Auto Responses' => 'Filter per respostes automàtiques',
        'Auto Responses' => 'Respostes Automàtiques',
        'Change Auto Response Relations for Queue' => 'Canviar les relacions de resposta automàtica per a la cua',
        'settings' => 'configuració',

        # Template: AdminQueueResponses
        'Manage Response-Queue Relations' => 'Gestionar relacions Resposta-Cua',
        'Filter' => 'Filtre',
        'Filter for Responses' => 'Filtre per respostes',
        'Responses' => 'Respostes',
        'Change Queue Relations for Response' => 'Canviar les relacions de cua per a la resposta',
        'Change Response Relations for Queue' => 'Canviar les relacions de resposta per a la cua',

        # Template: AdminResponse
        'Manage Responses' => 'Gestionar respostes',
        'Add response' => 'Afegir resposta',
        'A response is a default text which helps your agents to write faster answers to customers.' =>
            'Una resposta és un text predeterminat que ajuda als seus agents a escriure respostes més ràpides als clients.',
        'Don\'t forget to add new responses to queues.' => 'No oblidi afegir noves respostes a les cues.',
        'Delete this entry' => 'Eliminar aquesta entrada',
        'Add Response' => 'Afegir resposta',
        'Edit Response' => 'Editar resposta',
        'The current ticket state is' => 'L\'estat actual del tiquet és',
        'Your email address is' => 'La vostra adreça de correu electrònic és',

        # Template: AdminResponseAttachment
        'Manage Responses <-> Attachments Relations' => 'Gestionar relacions respostes <-> arxius adjunts',
        'Filter for Attachments' => 'Filtrar per arxius adjunts',
        'Change Response Relations for Attachment' => 'Canviar les relacions de resposta per a l\'arxiu adjunt',
        'Change Attachment Relations for Response' => 'Canviar les relacions de arxiu adjunt per a la resposta',
        'Toggle active for all' => 'Canviar actiu per a tots',
        'Link %s to selected %s' => 'Enllaçar %s a el %s seleccionat',

        # Template: AdminRole
        'Role Management' => 'Gestió de Rols',
        'Add role' => 'Afegir rol',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Crea un rol i col·loca grups en el mateix. Després afegix el rol als usuaris.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'No hi ha rols definits. Per favor, utilitzi el botó \'Agregar\' per crear un nou rol.',
        'Add Role' => 'Afegir rol',
        'Edit Role' => 'Editar rol',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => 'Gestionar relacions Rol-Grup',
        'Filter for Roles' => 'Filtrar per rols',
        'Roles' => 'Rols',
        'Select the role:group permissions.' => 'Seleccioni els permisos rol:grup.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Si no se selecciona gens, llavors no hi ha permisos en aquest grup (els tiquets no estaran disponibles per al rol).',
        'Change Role Relations for Group' => 'Canviar les relacions de rol per al grup',
        'Change Group Relations for Role' => 'Canviar les relacions de grup per a la cua',
        'Toggle %s permission for all' => 'Caviar %s permisos per a tots',
        'move_into' => 'moure_a',
        'Permissions to move tickets into this group/queue.' => 'Permís per a moure tiquets a aquest grup/cua',
        'create' => 'crear',
        'Permissions to create tickets in this group/queue.' => 'Permís per a crear tiquets en aquest grup/cua',
        'priority' => 'prioritat',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Permís per a canviar la prioritat del tiquet en aquest grup/cua',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => 'Gestionar relacions Agent-Rol',
        'Filter for Agents' => 'Filtar per agents',
        'Agents' => 'Agents',
        'Manage Role-Agent Relations' => 'Gestionar relacions Rol-Agent',
        'Change Role Relations for Agent' => 'Canviar les relacions de rol per a l\'agent',
        'Change Agent Relations for Role' => 'Canviar les relacions de agent per al rol',

        # Template: AdminSLA
        'SLA Management' => 'Gestió de SLA',
        'Add SLA' => 'Afegir SLA',
        'Edit SLA' => 'Editar SLA',
        'Please write only numbers!' => 'Per favor escrigui només nombres!',

        # Template: AdminSMIME
        'S/MIME Management' => 'Gestió S/MIME',
        'Add certificate' => 'Afegir certificat',
        'Add private key' => 'Afegir clau privada',
        'Filter for certificates' => '',
        'Filter for SMIME certs' => '',
        'Here you can add relations to your private certificate, these will be embedded to the SMIME signature every time you use this certificate to sign an email.' =>
            '',
        'See also' => 'Vegi també',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'D\'aquesta forma pot editar directament la certificació i claus privades en el sistema de fitxers.',
        'Hash' => 'Hash',
        'Create' => 'Crear',
        'Handle related certificates' => '',
        'Delete this certificate' => 'Eliminar aquest certificat',
        'Add Certificate' => 'Afegir certificat',
        'Add Private Key' => 'Afegir clau privada',
        'Secret' => 'Secret',
        'Related Certificates for' => '',
        'Delete this relation' => '',
        'Available Certificates' => '',
        'Relate this certificate' => '',

        # Template: AdminSalutation
        'Salutation Management' => 'Gestió de salutacions',
        'Add salutation' => 'Afegir salutació',
        'Add Salutation' => 'Afegir salutació',
        'Edit Salutation' => 'Editar salutació',
        'Example salutation' => 'Exemple salutació',

        # Template: AdminScheduler
        'This option will force Scheduler to start even if the process is still registered in the database' =>
            '',
        'Start scheduler' => '',
        'Scheduler could not be started. Check if scheduler is not running and try it again with Force Start option' =>
            '',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => 'El mode segur ha d\'estar habilitat!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'El mode segur que (normalment) es fixarà després de la instal·lació inicial s\'ha completat.',
        'Secure mode must be disabled in order to reinstall using the web-installer.' =>
            'El mode segur ha d\'estar desactivat per tornar a instal·lar mitjançant la pàgina d\'instal·lació.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Si la manera segur no s\'activa, activi-ho a través de SysConfig perquè la seva aplicació ja s\'està executant.',

        # Template: AdminSelectBox
        'SQL Box' => 'SQL',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Aquí pot introduir SQL per enviar-ho directament a la base de dades d\'aplicació.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'La sintaxi de la consulta *SQL conté un error. Per favor revisi-la.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'Hi ha almenys un paràmetre que falta per a l\'enllaç. Per favor revisi-ho.',
        'Result format' => 'Format de resultat',
        'Run Query' => 'Executar consulta',

        # Template: AdminService
        'Service Management' => 'Gestió de serveis',
        'Add service' => 'Afegir servei',
        'Add Service' => 'Afegir servei',
        'Edit Service' => 'Editar servei',
        'Sub-service of' => 'Sub-servei de',

        # Template: AdminSession
        'Session Management' => 'Gestió de sessions',
        'All sessions' => 'Totes les sessions',
        'Agent sessions' => 'Sessions d\'agent',
        'Customer sessions' => 'Sessions de client',
        'Unique agents' => 'Agents únics',
        'Unique customers' => 'Clients únics',
        'Kill all sessions' => 'Finalitzar totes les sessions',
        'Kill this session' => 'Matar aquesta sessió',
        'Session' => 'Sessió',
        'Kill' => 'Matar',
        'Detail View for SessionID' => 'Vista detallada per SessionID',

        # Template: AdminSignature
        'Signature Management' => 'Gestió de signatures',
        'Add signature' => 'Afegir signatura',
        'Add Signature' => 'Afegir signatura',
        'Edit Signature' => 'Editar signatura',
        'Example signature' => 'Exemple signatura',

        # Template: AdminState
        'State Management' => 'Gestió d\'estat',
        'Add state' => 'Afegir Estat',
        'Please also update the states in SysConfig where needed.' => '',
        'Add State' => 'Afegir estat',
        'Edit State' => 'Editar estat',
        'State type' => 'Tipus d\'estat',

        # Template: AdminSysConfig
        'SysConfig' => 'Configuració del sistema',
        'Navigate by searching in %s settings' => 'Navegui per buscar en %s configuracions',
        'Navigate by selecting config groups' => '',
        'Download all system config changes' => 'Descarregar tots els canvis en la configuració del sistema',
        'Export settings' => 'Exportar configuració',
        'Load SysConfig settings from file' => 'Carregar configuració del sistema des d\'arxiu',
        'Import settings' => 'Importar configuració',
        'Import Settings' => 'Importar configuració',
        'Please enter a search term to look for settings.' => 'Per favor, introdueixi un terme de recerca per buscar valors.',
        'Subgroup' => 'Subgrup',
        'Elements' => 'Elements',

        # Template: AdminSysConfigEdit
        'Edit Config Settings' => 'Editar opcions de configuració',
        'This config item is only available in a higher config level!' =>
            'Aquest element de configuració només està disponible en una configuració de nivell més alt!',
        'Reset this setting' => 'Restablir aquesta configuració',
        'Error: this file could not be found.' => 'Error: aquest arxiu no es va poder trobar.',
        'Error: this directory could not be found.' => 'Error: aquest directori no es va poder trobar.',
        'Error: an invalid value was entered.' => 'Error: un valor no vàlid va ser introduït.',
        'Content' => 'Contingut',
        'Remove this entry' => 'Llevar aquesta entrada',
        'Add entry' => 'Afegir entrada',
        'Remove entry' => 'Llevar entrada',
        'Add new entry' => 'Afegir nova entrada',
        'Create new entry' => 'Crear nova entrada',
        'New group' => 'Nou grup',
        'Group ro' => 'Grup ro',
        'Readonly group' => 'Grup de només lectura',
        'New group ro' => 'Nou grup ro',
        'Loader' => 'Carregador',
        'File to load for this frontend module' => 'xiu per a la càrrega d\'aquest mòdul d\'interfície',
        'New Loader File' => 'Nou arxiu de carregador',
        'NavBarName' => 'NomBarNav',
        'NavBar' => 'BarNav',
        'LinkOption' => 'OpcióEnllaç',
        'Block' => 'Bloquejar',
        'AccessKey' => 'ClauAccés',
        'Add NavBar entry' => 'Afegir entrada BarNav',
        'Year' => 'Any',
        'Month' => 'Mes',
        'Day' => 'Dia',
        'Invalid year' => 'Any invàlid',
        'Invalid month' => 'Mes invàlid',
        'Invalid day' => 'Dia invàlid',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Gestió d\'adreces de correu del sistema',
        'Add system address' => 'Afegir adreça de sistema',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Tot el correu entrant amb aquesta adreça en el Para o CC, s\'enviarà a la cua seleccionada.',
        'Email address' => 'Adreça de correu electrònic',
        'Display name' => 'Nom de pantalla',
        'Add System Email Address' => 'Afegir adreça de correu electrònic del sistema',
        'Edit System Email Address' => 'Editar adreça de correu electrònic del sistema',
        'The display name and email address will be shown on mail you send.' =>
            'El nom de la pantalla i l\'adreça de correu electrònic seran mostrats en els correus que enviï.',

        # Template: AdminType
        'Type Management' => 'Gestió de tipus',
        'Add ticket type' => 'Afegir tipus de tiquet',
        'Add Type' => 'Afegir tipus',
        'Edit Type' => 'Editar tipus',

        # Template: AdminUser
        'Add agent' => 'Afegir agent',
        'Agents will be needed to handle tickets.' => 'Els agents es necessiten per manejar tiquets.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'No s\'oblidi d\'afegir un nou agent a grups i/o rols!',
        'Please enter a search term to look for agents.' => 'Per favor, introdueixi un terme de recerca per buscar agents.',
        'Last login' => 'Últim accés',
        'Login as' => 'Connectar-se com',
        'Switch to agent' => 'Canviar a agent',
        'Add Agent' => 'Afegir agent',
        'Edit Agent' => 'Editar agent',
        'Firstname' => 'Nom',
        'Lastname' => 'Cognom',
        'Password is required.' => '',
        'Start' => 'Començar',
        'End' => 'Fi',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => 'Gestionar relacions Agent-Grup',
        'Change Group Relations for Agent' => 'Canviar les relacions de grup per a l\'agent',
        'Change Agent Relations for Group' => 'Canviar les relacions de agent per al grup',
        'note' => 'nota',
        'Permissions to add notes to tickets in this group/queue.' => 'Permisos per afegir notes als tiquets d\'aquest grup/cua.',
        'owner' => 'propietari',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Permisos per canviar el propietari dels tiquets en aquest grup/cua.',

        # Template: AgentBook
        'Address Book' => 'Llibreta d\'Adreces',
        'Search for a customer' => 'Recerca d\'un client',
        'Add email address %s to the To field' => 'Afegir adreça de correu %s en el camp Para',
        'Add email address %s to the Cc field' => 'Afegir adreça de correu %s en el camp Cc',
        'Add email address %s to the Bcc field' => 'Afegir adreça de correu %s en el camp Bcc',
        'Apply' => 'Aplicar',

        # Template: AgentCustomerSearch
        'Search Customer' => 'Recerques del client',
        'Duplicated entry' => '',
        'This address already exists on the address list.' => '',

        # Template: AgentCustomerTableView

        # Template: AgentDashboard
        'Dashboard' => 'Panell principal',

        # Template: AgentDashboardCalendarOverview
        'in' => 'en',

        # Template: AgentDashboardIFrame

        # Template: AgentDashboardImage

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s està disponible!',
        'Please update now.' => 'Per favor, actualitzi ara.',
        'Release Note' => 'Nota de la versió',
        'Level' => 'Nivell',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Publicat %s fa.',

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
        'The ticket has been locked' => 'Aquest tiquet ha estat bloquejat',
        'Undo & close window' => 'Desfer i tancar la finestra',

        # Template: AgentInfo
        'Info' => 'Informació',
        'To accept some news, a license or some changes.' => 'Per acceptar una notícia, una llicència o alguns canvis.',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Enllaçar l\'objecte: %s',
        'Close window' => 'Tancar la finestra',
        'go to link delete screen' => 'anar a l\'enllaç esborrar la pantalla',
        'Select Target Object' => 'Seleccioni Objecte Objectiu',
        'Link Object' => 'Enllaçar Objecte',
        'with' => 'amb',
        'Unlink Object: %s' => 'Llevar enllaç de l\'objecte: %s',
        'go to link add screen' => 'anar a l\'enllaç afegir pantalla',

        # Template: AgentNavigationBar

        # Template: AgentPreferences
        'Edit your preferences' => 'Editar les seves preferències',

        # Template: AgentSpelling
        'Spell Checker' => 'Verificació Ortogràfica',
        'spelling error(s)' => 'errors gramaticals',
        'Apply these changes' => 'Aplicar aquests canvis',

        # Template: AgentStatsDelete
        'Delete stat' => 'Eliminar estadístiques',
        'Stat#' => 'Estat#',
        'Do you really want to delete this stat?' => 'De debò vol eliminar aquesta estadística?',

        # Template: AgentStatsEditRestrictions
        'Step %s' => 'Pas %s',
        'General Specifications' => 'Especificacions generals',
        'Select the element that will be used at the X-axis' => 'Seleccioni l\'element que s\'utilitzarà en l\'eix X',
        'Select the elements for the value series' => 'Seleccioni els elements per als valors de la sèrie',
        'Select the restrictions to characterize the stat' => 'Seleccioni les restriccions per caracteritzar l\'estadística',
        'Here you can make restrictions to your stat.' => 'Aquí pot declarar restriccions a les seves estadístiques.',
        'If you remove the hook in the "Fixed" checkbox, the agent generating the stat can change the attributes of the corresponding element.' =>
            'Si elimina la marca en la casella "Fix", l\'agent que genera l\'estadística pot canviar els atributs de l\'element corresponent',
        'Fixed' => 'Fixat',
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Per favor seleccioni un element de desactivi el botó \'Fixat\'',
        'Absolute Period' => 'Període absolut',
        'Between' => 'Entre',
        'Relative Period' => 'Període Relatiu',
        'The last' => 'L\'últim',
        'Finish' => 'Finalitzar',

        # Template: AgentStatsEditSpecification
        'Permissions' => 'Permisos',
        'You can select one or more groups to define access for different agents.' =>
            'Vostè pot seleccionar un o més grups per definir l\'accés als diferents agents.',
        'Some result formats are disabled because at least one needed package is not installed.' =>
            'Alguns formats de resultat estan desactivats perquè almenys un paquet necessari no està instal·lat.',
        'Please contact your administrator.' => 'Per favor, contacti amb el seu administrador.',
        'Graph size' => 'Grandària del gràfic',
        'If you use a graph as output format you have to select at least one graph size.' =>
            'Si utilitza un gràfic com format de sortida ha de seleccionar almenys una tamany de gràfic.',
        'Sum rows' => 'Sumar files',
        'Sum columns' => 'Sumar columnes',
        'Use cache' => 'Usar caché',
        'Most of the stats can be cached. This will speed up the presentation of this stat.' =>
            'La majoria de les estadístiques poden ser conservades en memòria cau. Això accelera la presentació d\'aquesta estadística.',
        'If set to invalid end users can not generate the stat.' => 'Si s\'estableix per a usuaris finals invàlids no es poden generar estadístiques.',

        # Template: AgentStatsEditValueSeries
        'Here you can define the value series.' => 'Aquí pot definir la sèrie de valors.',
        'You have the possibility to select one or two elements.' => 'Vostè té la possibilitat de seleccionar un o dos elements.',
        'Then you can select the attributes of elements.' => 'A continuació, pot seleccionar els atributs dels elements.',
        'Each attribute will be shown as single value series.' => 'Cada atribut es mostra com una sèrie de valor únic.',
        'If you don\'t select any attribute all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            'Si vostè no selecciona cap atribut tots els atributs de l\'element seran usats si vostè genera una estadística, així com els nous atributs que van ser afegits des de l\'última configuració.',
        'Scale' => 'Escala',
        'minimal' => 'mínim',
        'Please remember, that the scale for value series has to be larger than the scale for the X-axis (e.g. X-Axis => Month, ValueSeries => Year).' =>
            'Recordi, que l\'escala per als valors de la sèrie necessita ser major que l\'escala per a l\'eix-X (ej: eix-X => Mes, ValorSeries => Any).',

        # Template: AgentStatsEditXaxis
        'Here you can define the x-axis. You can select one element via the radio button.' =>
            'Aquí pot definir l\'eix x. Vostè pot seleccionar un element a través del botó d\'opció.',
        'maximal period' => 'període màxim',
        'minimal scale' => 'escala mínima',

        # Template: AgentStatsImport
        'Import Stat' => 'Importar estadístiques',
        'File is not a Stats config' => 'L\'arxiu no és una configuració d\'estadístiques',
        'No File selected' => 'No hi ha arxiu seleccionat',

        # Template: AgentStatsOverview
        'Stats' => 'Estadístiques',

        # Template: AgentStatsPrint
        'Print' => 'Imprimir',
        'No Element selected.' => 'No hi ha element seleccionat',

        # Template: AgentStatsView
        'Export config' => 'Exportar configuració',
        'With the input and select fields you can influence the format and contents of the statistic.' =>
            'Amb l\'entrada i camps seleccionats vostè pot influir en el format i el contingut de l\'estadística.',
        'Exactly what fields and formats you can influence is defined by the statistic administrator.' =>
            'Exactament que camps i formats pot influir estan definits per l\'administrador de l\'estadística.',
        'Stat Details' => 'Detalls d\'estadístiques',
        'Format' => 'Format',
        'Graphsize' => 'TamanyGràfic',
        'Cache' => 'Memòria cau',
        'Exchange Axis' => 'Intercanviar Eixos',
        'Configurable params of static stat' => 'Paràmetre configurable d\'estadística estàtica',
        'No element selected.' => 'No hi ha element seleccionat',
        'maximal period from' => 'període màxim de',
        'to' => 'a',

        # Template: AgentTicketActionCommon
        'Change Free Text of Ticket' => 'Canviar el text lliure del tiquet',
        'Change Owner of Ticket' => 'Canviar el propietari del tiquet',
        'Close Ticket' => 'Tancar tiquet',
        'Add Note to Ticket' => 'Afegir nota al tiquet',
        'Set Pending' => 'Establir com a pendent',
        'Change Priority of Ticket' => 'Canviar la prioritat del tiquet',
        'Change Responsible of Ticket' => 'Canviar el responsable del tiquet',
        'Cancel & close window' => 'Cancel·lar i tancar la finestra',
        'Service invalid.' => 'Servei no vàlid.',
        'New Owner' => 'Nou Propietari',
        'Please set a new owner!' => 'Per favor, estableixi un nou propietari!',
        'Previous Owner' => 'Propietari Anterior',
        'Inform Agent' => 'Notificar Agent',
        'Optional' => 'Opcional',
        'Inform involved Agents' => 'Notificar Agents involucrats',
        'Spell check' => 'Correcció ortogràfica',
        'Note type' => 'Tipus de nota',
        'Next state' => 'Següent estat',
        'Pending date' => 'Data pendent',
        'Date invalid!' => 'Data no vàlida!',

        # Template: AgentTicketActionPopupClose

        # Template: AgentTicketBounce
        'Bounce Ticket' => 'Retornar tiquet',
        'Bounce to' => 'Retornar a',
        'You need a email address.' => 'Es necessita una adreça de correu electrònic.',
        'Need a valid email address or don\'t use a local email address.' =>
            'Necessita una adreça de correu electrònic vàlida o no utilitzi una adreça de correu electrònic local.',
        'Next ticket state' => 'Nou estat del tiquet',
        'Inform sender' => 'Informar a l\'emissor',
        'Send mail!' => 'Enviar correu!',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Acció múltiple amb Tiquets',
        'Send Email' => '',
        'Merge to' => 'Fusionar amb',
        'Invalid ticket identifier!' => 'Identificador de tiquet no vàlid!',
        'Merge to oldest' => 'Combinar amb el més antic',
        'Link together' => 'Vincular',
        'Link to parent' => 'Vincular al pare',
        'Unlock tickets' => 'Desbloquejar tiquets',

        # Template: AgentTicketClose

        # Template: AgentTicketCompose
        'Compose answer for ticket' => 'Redacti una resposta al tiquet',
        'Remove Ticket Customer' => '',
        'Please remove this entry and enter a new one with the correct value.' =>
            '',
        'Please include at least one recipient' => '',
        'Remove Cc' => '',
        'Remove Bcc' => '',
        'Address book' => 'Adreces',
        'Pending Date' => 'Data pendent',
        'for pending* states' => 'per a estats pendents*',
        'Date Invalid!' => 'Data no vàlida!',

        # Template: AgentTicketCustomer
        'Change customer of ticket' => 'Canviar client del tiquet',
        'Customer Data' => 'Informació del client',
        'Customer user' => 'Usuari del client',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => 'Crear nou tiquet correu electrònic',
        'From queue' => 'De la cua',
        'To customer' => '',
        'Please include at least one customer for the ticket.' => '',
        'Get all' => 'Obtenir tots',

        # Template: AgentTicketEscalation

        # Template: AgentTicketForward
        'Forward ticket: %s - %s' => 'Reexpedir tiquet: %s - %s',
        'Need a valid email address or don\'t use a local email address' =>
            'Necessita una adreça de correu electrònic vàlida o no utilitzi una adreça de correu electrònic local.',

        # Template: AgentTicketFreeText

        # Template: AgentTicketHistory
        'History of' => 'Historial de',
        'History Content' => 'Contingut de l\'historial',
        'Zoom view' => 'Vista de zoom',

        # Template: AgentTicketMerge
        'Ticket Merge' => 'Fusionar tiquet',
        'You need to use a ticket number!' => 'Necessita usar un nombre de tiquet! ',
        'A valid ticket number is required.' => 'És necessari un nombre de tiquet vàlid',
        'Need a valid email address.' => '',

        # Template: AgentTicketMove
        'Move Ticket' => 'Moure tiquet',
        'New Queue' => 'Nova cua',

        # Template: AgentTicketNote

        # Template: AgentTicketOverviewMedium
        'Select all' => 'Seleccionar tot',
        'No ticket data found.' => 'No s\'han trobat dades del tiquet',
        'First Response Time' => 'Temps de resposta',
        'Service Time' => 'Temps de servei',
        'Update Time' => 'Temps d\'actualització',
        'Solution Time' => 'Temps de resolució',
        'Move ticket to a different queue' => 'Moure tiquet a una altra cua',
        'Change queue' => 'Canviar cua',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Canviar opcions de recerca',
        'Tickets per page' => 'Tiquets per pàgina',

        # Template: AgentTicketOverviewPreview
        '","26' => '',

        # Template: AgentTicketOverviewSmall
        'Escalation in' => 'Escalat en',
        'Locked' => 'Bloquejat',
        '","30' => '',

        # Template: AgentTicketOwner

        # Template: AgentTicketPending

        # Template: AgentTicketPhone
        'Create New Phone Ticket' => 'Crear nou tiquet telefònic',
        'From customer' => 'Del client',
        'To queue' => 'A la cua',

        # Template: AgentTicketPhoneCommon
        'Phone call' => 'Cridada telefònica',

        # Template: AgentTicketPlain
        'Email Text Plain View' => 'Veure text sense format de correu electrònic',
        'Plain' => 'Text pla',
        'Download this email' => 'Descarregar aquest e-mail',

        # Template: AgentTicketPrint
        'Ticket-Info' => 'Informació-Tiquet',
        'Accounted time' => 'Temps comptabilitzat',
        'Linked-Object' => 'Objecte-enllaçat',
        'by' => 'per',

        # Template: AgentTicketPriority

        # Template: AgentTicketQueue

        # Template: AgentTicketResponsible

        # Template: AgentTicketSearch
        'Search template' => 'Buscar-Plantilla',
        'Create Template' => 'Crear plantilla',
        'Create New' => 'Crear nou',
        'Profile link' => '',
        'Save changes in template' => 'Guardar els canvis en la plantilla',
        'Add another attribute' => 'Afegir un altre atribut',
        'Output' => 'Formulari de resultats',
        'Fulltext' => 'Text Complet',
        'Remove' => 'Eliminar',
        'Customer User Login' => 'Identificador del client',
        'Created in Queue' => 'Creat en Cua',
        'Lock state' => 'Estat de bloqueig',
        'Watcher' => 'Observador',
        'Article Create Time (before/after)' => 'Temps de creació de l\'article (abans/després)',
        'Article Create Time (between)' => 'Temps de creació de l\'article (entre)',
        'Ticket Create Time (before/after)' => 'Temps de creació del tiquet (abans/després)',
        'Ticket Create Time (between)' => 'Temps de creació del tiquet (entre)',
        'Ticket Change Time (before/after)' => 'Temps de modificació del tiquet (abans/després)',
        'Ticket Change Time (between)' => 'Temps de modificació del tiquet (entre)',
        'Ticket Close Time (before/after)' => 'Temps de tancament del tiquet (abans/després)',
        'Ticket Close Time (between)' => 'Temps de tancament del tiquet (entre)',
        'Archive Search' => 'Recerca d\'arxius',
        'Run search' => 'Executar recerca',

        # Template: AgentTicketSearchOpenSearchDescriptionFulltext

        # Template: AgentTicketSearchOpenSearchDescriptionTicketNumber

        # Template: AgentTicketSearchResultPrint

        # Template: AgentTicketZoom
        'Article filter' => 'Filtre d\'article',
        'Article Type' => '',
        'Sender Type' => '',
        'Save filter settings as default' => 'Guardar la configuració del filtre com a predeterminat',
        'Ticket Information' => 'Informació sobre els tiquets',
        'Linked Objects' => 'Objectes vinculats',
        'Article(s)' => 'Article(s)',
        'Change Queue' => 'Caviar cua',
        'Article Filter' => 'Filtre d\'article',
        'Add Filter' => 'Afegir filtre',
        'Set' => 'Ajustar',
        'Reset Filter' => 'Restablir filtre',
        'Show one article' => 'Mostrar un article',
        'Show all articles' => 'Mostrar tots els articles',
        'Unread articles' => 'Articles no llegits',
        'No.' => 'No.',
        'Unread Article!' => 'Article sense llegir!',
        'Incoming message' => 'Missatge entrant',
        'Outgoing message' => 'Missatge sortint',
        'Internal message' => 'Missatge intern',
        'Resize' => 'Canviar la grandària',

        # Template: AttachmentBlocker
        'To protect your privacy, active or/and remote content has blocked.' =>
            'Per protegir la seva privadesa, el contingut actiu i/o remot s\'ha bloquejat.',
        'Load blocked content.' => 'Carregar el contingut bloquejat.',

        # Template: Copyright

        # Template: CustomerAccept

        # Template: CustomerError
        'Traceback' => 'Rastrejar',

        # Template: CustomerFooter
        'Powered by' => 'Funciona con',
        'One or more errors occurred!' => 'Han ocorregut un o més errors!',
        'Close this dialog' => 'Tancar aquest quadre de diàleg',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'No es va poder obrir una finestra emergent. Per favor, deshabiliti qualsevol bloqueig de finestres emergents per a aquesta aplicació.',

        # Template: CustomerHeader

        # Template: CustomerLogin
        'Login' => 'Identificador',
        'User name' => 'Nom d\'usuari',
        'Your user name' => 'El seu nom d\'usuari',
        'Your password' => 'La seva contrasenya',
        'Forgot password?' => 'Va oblidar la seva contrasenya?',
        'Log In' => 'Entrar',
        'Not yet registered?' => 'Encara no s\'ha registrat?',
        'Sign up now' => 'Registri\'s ara',
        'Request new password' => 'Sol·licitar una nova contrasenya',
        'Your User Name' => 'El seu nom d\'usuari',
        'A new password will be sent to your email address.' => 'Una nova contrasenya li serà enviada a la seva adreça de correu electrònic.',
        'Create Account' => 'Crear Compte',
        'Please fill out this form to receive login credentials.' => 'Per favor, empleni aquest formulari per rebre les credencials d\'accés.',
        'How we should address you' => 'Com li hauríem d\'adreçar',
        'Your First Name' => 'El seu nom',
        'Please supply a first name' => 'Si us plau introdueixi un nom de pila',
        'Your Last Name' => 'El seu cognom',
        'Please supply a last name' => 'Si us plau introdueixi un cognom',
        'Your email address (this will become your username)' => '',
        'Please supply a' => 'Per favor, faciliti una',

        # Template: CustomerNavigationBar
        'Edit personal preferences' => 'Editar les preferències personals',
        'Logout %s' => '',

        # Template: CustomerPreferences

        # Template: CustomerRichTextEditor

        # Template: CustomerTicketMessage
        'Service level agreement' => 'Acord de nivell de servei',

        # Template: CustomerTicketOverview
        'Welcome!' => '',
        'Please click the button below to create your first ticket.' => '',
        'Create your first ticket' => '',

        # Template: CustomerTicketPrint
        'Ticket Print' => '',

        # Template: CustomerTicketSearch
        'Profile' => 'Perfil',
        'e. g. 10*5155 or 105658*' => 'p. ex. 10*5155 o 10558*',
        'Customer ID' => 'ID de client',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => 'Recerca de text complet en tiquets (p. ex. "John*n" o "Will*")',
        'Recipient' => 'Destinatari',
        'Carbon Copy' => 'Còpia',
        'Time restrictions' => 'Restriccions de temps',
        'No time settings' => '',
        'Only tickets created' => 'Només tiquets creats',
        'Only tickets created between' => 'Només tiquets creats entre',
        'Ticket archive system' => '',
        'Save search as template?' => 'Guardar recerca com a Plantilla?',
        'Save as Template?' => 'Guardar com a plantilla?',
        'Save as Template' => 'Guardar com a plantilla',
        'Template Name' => 'Nom de la plantilla',
        'Pick a profile name' => '',
        'Output to' => 'Sortida a',

        # Template: CustomerTicketSearchOpenSearchDescription

        # Template: CustomerTicketSearchResultPrint

        # Template: CustomerTicketSearchResultShort
        'of' => 'de',
        'Page' => 'Pàgina',
        'Search Results for' => 'Resultats de la recerca para',
        '","18' => '',

        # Template: CustomerTicketZoom
        'Expand article' => '',
        'Reply' => 'Resposta',

        # Template: CustomerWarning

        # Template: Datepicker
        'Invalid date (need a future date)!' => 'Data incorrecta (es necessita una data futura)!',
        'Previous' => 'Anterior',
        'Sunday' => 'Diumenge',
        'Monday' => 'Dilluns',
        'Tuesday' => 'Dimarts',
        'Wednesday' => 'Dimecres',
        'Thursday' => 'Dijous',
        'Friday' => 'Divendres',
        'Saturday' => 'Dissabte',
        'Su' => 'Dm',
        'Mo' => 'Dl',
        'Tu' => 'Dm',
        'We' => 'Dx',
        'Th' => 'Dj',
        'Fr' => 'Dv',
        'Sa' => 'Ds',
        'Open date selection' => 'Selecció de data d\'obertura',

        # Template: Error
        'Oops! An Error occurred.' => 'Oops! Es va produir un error.',
        'Error Message' => 'Missatge d\'error',
        'You can' => 'Vostè pot',
        'Send a bugreport' => 'Enviar un informe d\'error',
        'go back to the previous page' => 'tornar a la pàgina anterior',
        'Error Details' => 'Detalls de l\'error',

        # Template: Footer
        'Top of page' => 'A dalt de la pàgina',

        # Template: FooterJS
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Si ara surt d\'aquesta pàgina, totes les finestres emergents obertes es tancaran, també!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'Una finestra d\'aquesta pantalla ja està oberta. Vol tancar-la i carregar aquesta?',
        'Please enter at least one search value or * to find anything.' =>
            '',

        # Template: FooterSmall

        # Template: HTMLHead

        # Template: HTMLHeadBlockEvents

        # Template: Header
        'You are logged in as' => 'Està connectat com',

        # Template: HeaderSmall

        # Template: Installer
        'JavaScript not available' => 'Javascript no està disponible',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            'Amb la finalitat de millorar la seva experiència amb OTRS, haurà d\'habilitar Javascript en el seu navegador.',
        'Database Settings' => 'Configuració de la base de dades',
        'General Specifications and Mail Settings' => 'Especificacions generals i de correu',
        'Registration' => '',
        'Welcome to %s' => 'Benvingut a %s',
        'Web site' => 'Web',
        'Database check successful.' => 'Comprovació de base de dades finalitzada amb èxit.',
        'Mail check successful.' => 'Comprovació de correu finalitzada amb èxit.',
        'Error in the mail settings. Please correct and try again.' => 'Error en la configuració de correu. Per favor, corregeixi i torni a intentar-ho.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => 'Configurar el correu sortint',
        'Outbound mail type' => 'Tipus de correu sortint',
        'Select outbound mail type.' => 'Seleccioni el tipus de correu sortint.',
        'Outbound mail port' => 'Port de correu sortint',
        'Select outbound mail port.' => 'Seleccionar el port de correu sortint.',
        'SMTP host' => 'Servidor SMTP',
        'SMTP host.' => 'Servidor SMTP.',
        'SMTP authentication' => 'Autenticació SMTP',
        'Does your SMTP host need authentication?' => 'Requereix autenticació el seu servidor SMTP?',
        'SMTP auth user' => 'Usuari autenticació SMTP',
        'Username for SMTP auth.' => 'Nom d\'usuari per a autenticació SMTP.',
        'SMTP auth password' => 'Contrasenya autenticació SMTP',
        'Password for SMTP auth.' => 'Contrasenya per a autenticació SMTP.',
        'Configure Inbound Mail' => 'Configurar el correu entrant',
        'Inbound mail type' => 'Tipus de correu entrant',
        'Select inbound mail type.' => 'Seleccioni el tipus de correu entrant.',
        'Inbound mail host' => 'Servidor de correu entrant',
        'Inbound mail host.' => 'Servidor de correu entrant',
        'Inbound mail user' => 'Usuari de correu entrant',
        'User for inbound mail.' => 'Usuari per al correu entrant.',
        'Inbound mail password' => 'Contrasenya de correu entrant',
        'Password for inbound mail.' => 'Contrasenya per al correu entrant.',
        'Result of mail configuration check' => 'Resultat de comprovar la configuració de correu',
        'Check mail configuration' => 'Comprovar la configuració de correu',
        'Skip this step' => 'Saltar aquest pas',
        'Skipping this step will automatically skip the registration of your OTRS. Are you sure you want to continue?' =>
            '',

        # Template: InstallerDBResult
        'False' => 'Fals',

        # Template: InstallerDBStart
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty. For security reasons we do recommend setting a root password. For more information please refer to your database documentation.' =>
            'Si la seva base de dades té una contrasenya per a root, ha d\'introduir-la aquí. Si no, deixi aquest camp en blanc. Per raons de seguretat és recomanable posar una contrasenya a l\'usuari root. Per a més informació per favor refereixi\'s a la documentació de la seva base de dades.',
        'Currently only MySQL is supported in the web installer.' => 'Actualment només se suporta MySQL en l\'instal·lador web.',
        'If you want to install OTRS on another database type, please refer to the file README.database.' =>
            'Si desitja instal·lar *OTRS en un altre tipus de bases de dades, per favor consulti l\'arxiu README.database.',
        'Database-User' => 'Usuari-Base de dades',
        'New' => 'Nou',
        'A new database user with limited rights will be created for this OTRS system.' =>
            'Un nou usuari de base de dades amb drets limitats serà creat per a aquest sistema OTRS.',
        'default \'hot\'' => 'per defecte \'hot\'',
        'DB--- host' => 'BD--- servidor',
        'Check database settings' => 'Comprovar la configuració de la base de dades',
        'Result of database check' => 'Resultat de la verificació de bases de dades',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Per a poder utilitzar OTRS ha d\'escriure la següent linea de comandos (Terminal/Shell) com root',
        'Restart your webserver' => 'Reiniciï el seu servidor web',
        'After doing so your OTRS is up and running.' => 'Després de fer això el seu OTRS estarà actiu i executant-se',
        'Start page' => 'Pàgina d\'inici',
        'Your OTRS Team' => 'El seu equip OTRS',

        # Template: InstallerLicense
        'Accept license' => 'Acceptar llicència',
        'Don\'t accept license' => 'No acceptar llicència',

        # Template: InstallerLicenseText

        # Template: InstallerRegistration
        'Organization' => 'Organizació',
        'Position' => '',
        'Complete registration and continue' => '',
        'Please fill in all fields marked as mandatory.' => '',

        # Template: InstallerSystem
        'SystemID' => 'ID de sistema',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'L\'identificador del sistema. Cada nombre de tiquet i cada identificador de sessió HTTP contenen aquest nombre.',
        'System FQDN' => 'FQDN del sistema',
        'Fully qualified domain name of your system.' => 'Nom complet de domini del seu sistema.',
        'AdminEmail' => 'Correu de l\'administrador',
        'Email address of the system administrator.' => 'Adreça de correu electrònic de l\'administrador del sistema.',
        'Log' => 'Traça',
        'LogModule' => 'Mòdul de traces',
        'Log backend to use.' => 'Registre de servidor per usar.',
        'LogFile' => 'Arxiu de registre',
        'Log file location is only needed for File-LogModule!' => 'La ubicació de l\'arxiu de registre només és necessària per a Arxiu-LogModule!',
        'Webfrontend' => 'Interfície web',
        'Default language' => 'Llengua per defecte',
        'Default language.' => 'Llengua per defecte.',
        'CheckMXRecord' => 'Revisar registre MX',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'Les adreces de correu electrònic que s\'introdueixen manualment es comparen amb els registres MX en DNS. No utilitzi aquesta opció si la seva DNS és lent i no es resol adreces públiques.',

        # Template: LinkObject
        'Object#' => 'Objecte#',
        'Add links' => 'Afegir enllaços',
        'Delete links' => 'Eliminar enllaços',

        # Template: Login
        'JavaScript Not Available' => 'Javascript no està disponible',
        'Browser Warning' => 'Avís de navegador',
        'The browser you are using is too old.' => 'El navegador que està utilitzant és massa vell.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            'OTRS s\'executa amb una llista enorme de navegadors, per favor, actualitzi a una d\'aquestes.',
        'Please see the documentation or ask your admin for further information.' =>
            'Per favor, consulti la documentació o consulti amb el seu administrador per obtenir més informació.',
        'Lost your password?' => 'Va oblidar la seva contrasenya?',
        'Request New Password' => 'Sol·licitar una nova contrasenya',
        'Back to login' => 'Tornar a identificar-se',

        # Template: Motd
        'Message of the Day' => 'Missatge del dia',

        # Template: NoPermission
        'Insufficient Rights' => 'Permisos insuficients',
        'Back to the previous page' => 'Tornar a la pàgina anterior',

        # Template: Notify

        # Template: Pagination
        'Show first page' => 'Mostrar la primera pàgina',
        'Show previous pages' => 'Mostrar les pàgines anteriors',
        'Show page %s' => 'Mostrar pàgina %s',
        'Show next pages' => 'Mostrar pàgines següents',
        'Show last page' => 'Mostrar l\'última pàgina',

        # Template: PictureUpload
        'Need FormID!' => 'Necessita ID de formulari!',
        'No file found!' => 'No es troba l\'arxiu!',
        'The file is not an image that can be shown inline!' => 'L\'arxiu no és una imatge que pugui mostrar-se íntegrament!',

        # Template: PrintFooter
        'URL' => 'URL',

        # Template: PrintHeader
        'printed by' => 'imprès per',

        # Template: PublicDefault

        # Template: Redirect

        # Template: RichTextEditor

        # Template: SpellingInline

        # Template: Test
        'OTRS Test Page' => 'Pàgina de prova de OTRS ',
        'Welcome %s' => 'Benvingut %s',
        'Counter' => 'Comptador',

        # Template: Warning
        'Go back to the previous page' => 'Tornar a la pàgina anterior',

        # SysConfig
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'Mòdul de ACL que permet tancar els tiquets pare només si tots els seus fills ja estan tancats ("Estat" mostra que estats no estan disponibles per al tiquet pare fins que tots els tiquets fill estiguin tancats).',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Activa un mecanisme de parpalleig de la cua que conté els tiquets més antics.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Activa la funció de contrasenya perduda per als agents, en la interfície de l\'agent.',
        'Activates lost password feature for customers.' => 'Activa la funció de contrasenya perduda per als clients.',
        'Activates support for customer groups.' => 'Activa el suport per a grups de clients.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Activa el filtre d\'article en la vista de zoom per especificar què articles s\'han de mostrar.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Activa els temes disponibles en el sistema. 1 significa actiu, 0 significa inactiu.',
        'Activates the ticket archive system search in the customer interface.' =>
            '',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Activa el sistema d\'arxiu de tiquet per tenir un sistema més ràpid, movent alguns tiquets fora dels objectius diaris. Per realitzar una recerca d\'aquests tiquets, l\'opció d\'arxiu ha d\'estar habilitada en la recerca de tiquets.',
        'Activates time accounting.' => 'Activa la comptabilitat de temps.',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            'Afegeix un sufix amb l\'any actual i el mes en el fitxer de registre de OTRS. Es crearà un arxiu per cada mes.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface.' =>
            'Afegeix les adreces de correu electrònic dels clients als destinataris en la pantalla de creació de tiquet de la interfície de l\'agent.',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Afegeix un dia lliure per al calendari indicat. Per favor usi el model d\'un sol dígit per als nombres d\'1 a 9 (en comptes de 01 - 09).',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Afegeix un dia lliure. Per favor usi el model d\'un sol dígit per als nombres d\'1 a 9 (en comptes de 01 - 09).',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Afegeix els dies lliures permanents per al calendari indicat. Per favor usi el model d\'un sol dígit per als nombres d\'1 a 9 (en comptes de 01 - 09).',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Afegeix els dies lliures permanents. Per favor usi el model d\'un sol dígit per als nombres d\'1 a 9 (en comptes de 01 - 09).',
        'Agent Notifications' => 'Notificacions agent',
        'Agent interface article notification module to check PGP.' => 'Mòdul de notificació d\'article d\'interfície d\'agent per comprovar PGP.',
        'Agent interface article notification module to check S/MIME.' =>
            'Mòdul de notificació d\'article d\'interfície d\'agent per comprovar S/MIME.',
        'Agent interface module to access fulltext search via nav bar.' =>
            'Mòdul d\'interfície d\'agent per tenir accés a la recerca de text completa via la barra de navegació.',
        'Agent interface module to access search profiles via nav bar.' =>
            'Mòdul d\'interfície d\'agent per tenir accés a la recerca de perfils via la barra de navegació.',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Mòdul d\'interfície d\'agent per comprovar els emails entrants en Vista-Zoom-Tiquet si la clau S/ACARONI està disponible i veritable.',
        'Agent interface notification module to check the used charset.' =>
            'Mòdul de notificació d\'interfície d\'agent per comprovar el mapa de caràcters usat.',
        'Agent interface notification module to see the number of tickets an agent is responsible for.' =>
            'Mòdul de notificació d\'interfície d\'agent per veure el nombre de tiquet del que és responsable un agent.',
        'Agent interface notification module to see the number of watched tickets.' =>
            'Mòdul de notificació d\'interfície d\'agent per veure el nombre de tiquets vist.',
        'Agents <-> Groups' => 'Agents <-> Grups',
        'Agents <-> Roles' => 'Agents <-> Rols',
        'Allows adding notes in the close ticket screen of the agent interface.' =>
            'Permet afegir notes en la pantalla de tancament del tiquet de la interfície de l\'agent.',
        'Allows adding notes in the ticket free text screen of the agent interface.' =>
            'Permet afegir notes en la pantalla de text lliure del tiquet de la interfície de l\'agent.',
        'Allows adding notes in the ticket note screen of the agent interface.' =>
            'Permet afegir notes en la pantalla de notes del tiquet de la interfície de l\'agent.',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Permet afegir notes en la pantalla del propietari del tiquet d\'una vista ampliada del tiquet de la interfície de l\'agent.',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Permet afegir notes en la pantalla de tiquet pendiente d\'una vista ampliada del tiquet de la interfície de l\'agent.',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Permet afegir notes en la pantalla de prioritat del tiquet d\'una vista ampliada del tiquet de la interfície de l\'agent.',
        'Allows adding notes in the ticket responsible screen of the agent interface.' =>
            'Permet afegir notes en la pantalla del responsable del tiquet d\'una vista ampliada del tiquet de la interfície de l\'agent.',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Permet als agents intercanviar els eixos d\'una estadística, si generen una.',
        'Allows agents to generate individual-related stats.' => 'Permet als agents generar estadístiques individualitzades.',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Permet triar entre mostrar els arxius adjunts d\'un tiquet en el navegador (en línia) o simplement fer-los descarregable (adjunt).',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Permet triar el següent estat de compondre per als tiquets del client en la interfície de client.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Permet als clients canviar la prioritat d\'entrada en la interfície del client.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Permet als clients establir el SLA del tiquet en la interfície del client.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Permet als clients establir la prioritat del tiquet en la interfície del client.',
        'Allows customers to set the ticket queue in the customer interface. If this is set to \'No\', QueueDefault should be configured.' =>
            'Permet als clients establir la cua del tiquet en la interfície del client. Si això s\'estableix en \'No\', QueueDefault ha de ser configurat.',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Permet als clients establir el servei del tiquet en la interfície del client.',
        'Allows defining new types for ticket (if ticket type feature is enabled).' =>
            'Permet la definició de nous tipus de tiquet (si la funció tipus de tiquet està activada).',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Permet la definició de serveis i SLAs de tiquets (per exemple, correu electrònic, escriptori, xarxa, ...), i atributs d\'escalat dels SLA (si la funció servei/SLA de tiquet està activada)',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search w. g. with this kind of conditions like "(key1&&key2)" or "(key1||key2)".' =>
            'Permet condicions de recerca ampliades en la recerca de tiquets de la interfície de l\'agent. Amb aquesta funció pot buscar amb condicions com "(clau1&&clau2)" o "(clau1||clau2)".',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search w. g. with this kind of conditions like "(key1&&key2)" or "(key1||key2)".' =>
            'Permet condicions de recerca ampliades en la recerca de tiquets de la interfície del client. Amb aquesta funció pot buscar amb condicions com "(clau1&&clau2)" o "(clau1||clau2)".',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Permet tenir una visió de format mitjà del tiquet (CustomerInfo => 1 - mostra també la informació del client).',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Permet tenir una visió de format petit del tiquet (CustomerInfo => 1 - mostra també la informació del client).',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Permet als administradors iniciar una sessió com un altre usuari, a través del panell d\'administració d\'usuaris.',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Permet posar un nou estat de tiquet en la pantalla de moviment de tiquet en l\'interfície d\'agent.',
        'Attachments <-> Responses' => 'Adjunts <-> Respostes',
        'Auto Responses <-> Queues' => 'Auto Respostes <-> Cues',
        'Automated line break in text messages after x number of chars.' =>
            'Salt de línia automàtic en missatges de text després de x nombre de caràcters.',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Bloquejar automàticament i establir el propietari a l\'Agent actual després de la selecció d\'una acció massiva.',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled).' =>
            'Estableix automàticament el propietari d\'un tiquet com el responsable del mateix (si la característica responsable del tiquet està habilitada).',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Estableix automàticament el responsable d\'un tiquet (si encara no ho està) després de l\'actualització de primer propietari.',
        'Balanced white skin by Felix Niklas.' => 'Apariencia blanco balanceado por Felix Niklas.',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Bloqueja tots els missatges de correu electrònic entrants que no tenen un nombre de tiquet vàlid en l\'assumpte amb adreça De: @example.com.',
        'Builds an article index right after the article\'s creation.' =>
            'Construeix un índex d\'articles immediatament després de la creació de l\'article.',
        'CMD example setup. Ignores emails where external CMD returns some output on STDOUT (email will be piped into STDIN of some.bin).' =>
            'Configuració d\'exemple de CMD. Fa cas omís de correus electrònics on els comandos externs retornen alguna cosa en la sortida estàndard (el correu electrònic serà enviat a l\'entrada estàndard de some.bin).',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for the web service config backend.' => '',
        'Change password' => 'Canviar la contrasenya',
        'Change queue!' => 'Canviar la cua!',
        'Change the customer for this ticket' => '',
        'Change the free fields for this ticket' => '',
        'Change the priority for this ticket' => '',
        'Change the responsible person for this ticket' => '',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Canvia el propietari del tiquet a Tots (útil per a ASP). Normalment, només l\'agent amb permisos rw en la cua del tiquet serà mostrat.',
        'Checkbox' => 'Casella de verificació',
        'Checks the SystemID in ticket number detection for follow-ups (use "No" if SystemID has been changed after using the system).' =>
            'Comprova l\'ID del sistema en la detecció del nombre de tiquet per a seguiment (Usi "No" si l\'ID del sistema ha canviat després d\'usar el sistema).',
        'Closed tickets of customer' => '',
        'Comment for new history entries in the customer interface.' => 'Comentari per a noves entrades d\'històric en l\'interfície de client.',
        'Companies' => 'Empreses',
        'Company Tickets' => 'Tiquets d\'empresa',
        'Company name for the customer web interface. Will also be included in emails as an X-Header.' =>
            '',
        'Configure your own log text for PGP.' => '',
        'Configures a default TicketDynmicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (http://doc.otrs.org/), chapter "Ticket Event Module".' =>
            'Configura un valor CampDinamicDeTiquet per defecte. "Nom", defineix el camp dinàmic que s\'ha d\'utilitzar, "Valor" són les dades que es crearà, i "Esdeveniment" defineix l\'esdeveniment de gallet. Per favor, consulti el manual del desenvolupador (http://doc.otrs.org/), en el capítol "Mòdul d\'esdeveniments de tiquet".',
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
        'Date / Time' => 'Data / Hora',
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
        'Email Addresses' => 'Adreces de Correu',
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
        'GenericAgent' => 'AgentGenèric',
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
        'Roles <-> Groups' => 'Rols <-> Grups',
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
        'Select your frontend Theme.' => 'Seleccioni el seu tema',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            '',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            '',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            'Notifiqui\'m si un client envia un seguiment i jo sóc el propietari del tiquet.',
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
        'Tickets' => 'Tiquets',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            '',
        'Toggles display of OTRS FeatureAddons list in PackageManager.' =>
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
            'Cua de selecció de cues favorites. Vostè també pot ser notificat d\'aquestes cues per correu si està habilitat',

        #
        # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
        #
        '"}' => '"}',
        '%s Tickets affected! Do you really want to use this job?' => '%s Tiquets Modificats! Realment desitja utilitzar aquesta tasca?',
        '(Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behinde a dial-up line $!)' =>
            '(Chequear registre MX d\'adreces utilitzades al respondre. No usar-lo si la màquina amb OTRS està darrere d\'una linea commutada $!)',
        '(Email of the system admin)' => '(correu de l\'administrador del sistema)',
        '(Full qualified domain name of your system)' => '(Nom complet del domini del seu sistema)',
        '(Logfile just needed for File-LogModule!)' => '(Arxiu de traces només necessari para File-LogModule)',
        '(Note: It depends on your installation how many dynamic objects you can use)' =>
            '(Nota: Depèn de la seva instal·lació quants objectes dinàmics pot utilitzar)',
        '(Note: Useful for big databases and low performance server)' => '(Nota: Útil per a bases de dades grans i servidors de baix rendiment)',
        '(The identify of the system. Each ticket number and each http session id starts with this number)' =>
            '(La identitat del sistema. Cada nombre de tiquet i cada id de sessió http comença amb aquest nombre)',
        '(Ticket identifier. Some people want toset this to e. g. \'Ticket#\', \'Call#\' or \'MyTicket#\')' =>
            '(Identificador de Ticker. Algunes persones agraden d\'usar per exemple \'Tiquet#\', \'Cridada#\' o \'ElMeuTiquet#\')',
        '(Used default language)' => '(Idioma per defecte)',
        '(Used log backend)' => '(Interfície de traces utilitzada)',
        '(Used ticket number format)' => '(Format de tiquet usat)',
        'A article should have a title!' => 'Un article ha de tenir un títol!',
        'A message must be spell checked!' => 'Un missatge ha de ser verificat ortograficamente!',
        'A message should have a To: recipient!' => 'Un missatge hauria de tenir un destinatari en el camp To:!',
        'A message should have a body!' => 'Un missatge ha de tenir un contingut',
        'A message should have a subject!' => 'Un missatge ha de tenir un assumpte!',
        'A response is default text to write faster answer (with default text) to customers.' =>
            'Una resposta és el text per defecte per a escriure respostes més ràpid (amb el text per defecte) als clients.',
        'A web calendar' => 'Calendari Web',
        'A web file manager' => 'Administrador web d\'arxius',
        'A web mail client' => 'Un client de correu web',
        'Absolut Period' => 'Període Absolut',
        'Account Type' => 'Tipus compte',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year selection of the field.' =>
            'Activar aquesta funció per definir un rang determinat d\'anys (en el futur i en el passat) que es mostrarà en la selecció d\'any del camp.',
        'Add Customer User' => 'Agregar Client Usuari',
        'Add System Address' => 'Afegir adreça del sistema',
        'Add User' => 'Afegir usuari',
        'Add a new Agent.' => 'Afegir un usuari nou',
        'Add a new Customer Company.' => 'Agregar una nova empresa del client',
        'Add a new Group.' => 'Afegir nou grup',
        'Add a new Priority.' => 'Afegir una nova prioritat',
        'Add a new Role.' => 'Afegir un rol nou',
        'Add a new SLA.' => 'Afegir una SLA nova',
        'Add a new Salutation.' => 'Afegir una salutació nova',
        'Add a new Service.' => 'Afegir un servei nou',
        'Add a new Signature.' => 'Afegir una signatura nova',
        'Add a new State.' => 'Afegir un estat nou',
        'Add a new System Address.' => 'Afegir una adreça del sistema nova',
        'Add a new Type.' => 'Afegir un tipus nou',
        'Add a note to this ticket!' => 'Afegir una nota a aquest tiquet!',
        'Add new field for object:' => 'Agregar nou camp per a l\'objecte:',
        'Add note to ticket' => 'Afegir nota al tiquet',
        'Added User "%s"' => 'Afegit Usuari "%s"',
        'Admin-Area' => 'Area d\'administració',
        'Admin-Email' => 'Correu-Admin',
        'Admin-Password' => 'Contrasenya-Admin',
        'Admin-User' => 'Usuari-Admin',
        'Advisory' => 'Advertiment',
        'Agent Mailbox' => 'Bústia d\'Agent',
        'Agent Preferences' => 'Preferències d\'Agent',
        'Agent-Area' => 'Area-Agent',
        'All Agent variables.' => 'Totes les variables d\'agent',
        'All Agents' => 'Tots els Agents',
        'All Customer variables like defined in config option CustomerUser.' =>
            'Totes les variables de client com apareixen declarades en l\'opció de configuració del client',
        'All customer tickets.' => 'Tots els tiquets d\'un client',
        'All incoming emails with this "Email" (To:) will be dispatched in the selected queue!' =>
            'Tots els missatges entrants amb aquest "correu" (To:) seran enviats a la cua seleccionada!',
        'All messages' => 'Tots els missatges',
        'Allocate CustomerUser to service' => 'Assignar clients a serveis',
        'Allocate services to CustomerUser' => 'Assignar serveis a clients',
        'Answer' => 'Respondre',
        'Artefact' => 'Artefacte',
        'ArticleID' => 'Identificador d\'article',
        'Attach' => 'Annex',
        'Attribute' => 'Atribut',
        'Auto Response From' => 'Resposta automàtica de ',
        'Auto Responses <-> Queue' => 'Respostes Automàtiques <-> Cues',
        'Bounce ticket' => 'Tiquet retornat',
        'Can not create link with %s!' => 'No es pot crear enllaç amb %s! ',
        'Can not delete link with %s!' => 'No es pot suprimir enllaç amb %s! ',
        'Can\'t update password, invalid characters!' => 'No es pot actualitzar la contrasenya, caràcters invàlids!',
        'Can\'t update password, must be at least %s characters!' => 'No es pot actualitzar la contrasenya, es necessiten almenys %s caràcters',
        'Can\'t update password, must contain 2 lower and 2 upper characters!' =>
            'No es pot actualitzar la contrasenya, es necessiten almenys 2 en minúscula i 2 en majúscula!',
        'Can\'t update password, needs at least 1 digit!' => 'No es pot actualitzar la contrasenya, es necessita almenys 1 dígit!',
        'Can\'t update password, needs at least 2 characters!' => 'No es pot actualitzar la contrasenya, es necessiten almenys 2 caràcters!',
        'Can\'t update password, your new passwords do not match! Please try again!' =>
            'No es pot actualitzar la contrasenya, no coincideixen! Per favor intenti\'l de nou!',
        'Category Tree' => 'Arbre de categories',
        'Change %s settings' => 'Canviar %s especificacions',
        'Change free text of ticket' => 'Canviar el text lliure del tiquet',
        'Change owner of ticket' => 'Canviar el propietari del tiquet',
        'Change priority of ticket' => 'Canviar la prioritat del tiquet',
        'Change responsible of ticket' => 'Canviar responsable del tiquet',
        'Change the ticket customer!' => 'Canviar el client del tiquet!',
        'Change the ticket owner!' => 'Canviar el propietari del tiquet!',
        'Change the ticket priority!' => 'Canviar la prioritat del tiquet!',
        'Change users <-> roles settings' => 'Canviar Usuaris <-> Configuració de Rols',
        'ChangeLog' => 'CanviLog',
        'Child-Object' => 'Objecte-fill',
        'Clear From' => 'Esborrar de',
        'Clear To' => 'Còpia Oculta a',
        'Click here to report a bug!' => 'Faci clic aqui per a reportar un error!',
        'Close Times' => 'Temps tancats',
        'Close this ticket!' => 'Tancar aquest tiquet!',
        'Close ticket' => 'Tancar el tiquet',
        'Close type' => 'Tipus de tancament',
        'Close!' => 'Tancar!',
        'Collapse View' => 'Reduir vista',
        'Comment (internal)' => 'Comentari (intern)',
        'CompanyTickets' => 'TiquetsEmpresa',
        'Compose Answer' => 'Respondre',
        'Compose Email' => 'Redactar Correu',
        'Compose Follow up' => 'Redactar seguiment',
        'Config Options' => 'Opcions de Configuració',
        'Config options (e. g. &lt;OTRS_CONFIG_HttpType&gt;)' => 'Opcions de configuració (ex. &lt;OTRS_CONFIG_HttpType&gt;)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>)' => 'Opcions de configuració (ej: <OTRS_CONFIG_HttpType>)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>).' => 'Opcions de configuració (p.e., <OTRS_CONFIG_HttpType>).',
        'Contact customer' => 'Contactar amb el client',
        'Create Times' => 'Temps de Creació',
        'Create new Phone Ticket' => 'Crear un nou Tiquet Telefònic',
        'Create new database' => 'Crear nova base de dades',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...).' =>
            'Crear nous grups per a manipular els permisos d\'accés per diferents grups d\'agent (exemple: departament de compra, departament de suport, departament de vendes,...).',
        'Create your first Ticket' => 'Creï el seu primer tiquet',
        'CreateTicket' => 'CrearTiquet',
        'Customer Move Notify' => 'Notificar al Client al Moure',
        'Customer Owner Notify' => 'Notificar al propietari al Moure',
        'Customer State Notify' => 'Notificació d\'estat al Client',
        'Customer User' => 'Client',
        'Customer User Management' => 'Gestió de clients',
        'Customer Users' => 'Clients',
        'Customer Users <-> Groups' => 'Clients <-> Grups',
        'Customer Users <-> Groups Management' => 'Clients <-> Gestió de Grups',
        'Customer Users <-> Services Management' => 'Clients <-> Gestió de serveis',
        'Customer history' => 'Història del client',
        'Customer history search' => 'Història de recerques del client',
        'Customer history search (e. g. "ID342425").' => 'Història de recerques del client (exemple: "ID342425").',
        'Customer user will be needed to have a customer history and to login via customer panel.' =>
            'El client necessita tenir una història i connectar-se via panell de clients',
        'CustomerUser' => 'UsuariClient',
        'D' => 'D',
        'DB Admin Password' => 'Contrasenya de l\'administrador de la BD',
        'DB Admin User' => 'Usuari Admin de la BD',
        'DB Type' => 'Tipus de BD',
        'DB connect host' => 'Amfitrió BD',
        'Days' => 'Dies',
        'Default' => 'Predeterminat',
        'Default Charset' => 'Joc de caràcters per defecte',
        'Default Language' => 'Idioma per defecte',
        'Delete old database' => 'Eliminar la base de dades antiga',
        'Delete this ticket!' => 'Eliminar aquest tiquet!',
        'Detail' => 'Detall',
        'Diff' => 'Diff',
        'Discard all changes and return to the compose screen' => 'Descartar tots els canvis i tornar a la pantalla de redacció',
        'Do dispatch or filter incoming emails based on email X-Headers! RegExp is also possible.' =>
            'Classificar o filtrar correus entrants basat en el camp X-Headers del correu! Pot utilitzar expressions regulars.',
        'Do you really want to delete this Object?' => 'Segur que desitja eliminar aquest objecte?',
        'Do you really want to reinstall this package (all manual changes get lost)?' =>
            'Realment desitja reinstal·lar aquest paquet (tots els canvis manuals es perdran)?',
        'Don\'t forget to add a new response a queue!' => 'No oblidi incloure una nova resposta en la cua!',
        'Don\'t forget to add a new user to groups and/or roles!' => 'No oblidi afegir els nous usuaris als grups i/o rols',
        'Don\'t forget to add a new user to groups!' => 'No oblidi incloure l\'usuari en grups!',
        'Don\'t work with UserID 1 (System account)! Create new users!' =>
            'No treballi amb l\'Identificador 1 (compte de sistema)! Creï nous usuaris!',
        'Download Settings' => 'Descarregar Configuració',
        'Download all system config changes.' => 'Descarregar tots els canvis de configuració',
        'Drop Database' => 'Eliminar Base de dades',
        'Dynamic-Object' => 'Objecte-Dinàmic',
        'Edit Article' => 'Editar article',
        'Edit default services.' => 'Editar serveis predeterminats',
        'Escalation - First Response Time' => 'Escalat - Temps per a Primera Resposta',
        'Escalation - Solution Time' => 'Escalat - Temps per a Solució',
        'Escalation - Update Time' => 'Escalat - Temps per a Actualització',
        'Escalation time' => 'Temps d\'escalat',
        'Expand View' => 'Expandir vista',
        'Explanation' => 'Explicació',
        'Export Config' => 'Exportar Configuració',
        'FileManager' => 'Administrador d\'Arxius',
        'Filelist' => 'LlistaFitxer',
        'Filtername' => 'NombreFiltre',
        'Follow up' => 'Seguiment',
        'Follow up notification' => 'Seguir notificació',
        'For very complex stats it is possible to include a hardcoded file.' =>
            'Per a una estadística molt complexa és possible incloure un arxiu prefixat',
        'Frontend' => 'Frontal',
        'Fulltext-Search in Article (e. g. "Mar*in" or "Baue*")' => 'Recerca de text en Article (ex. "Mar*in" or "Baue*") ',
        'Go' => 'Anar',
        'Group Ro' => 'Grup Ro',
        'Group selection' => 'Selecció de Grup',
        'Have a lot of fun!' => 'Gaudeixi\'l!',
        'Here you can define the value series. You have the possibility to select one or two elements. Then you can select the attributes of elements. Each attribute will be shown as single value series. If you don\'t select any attribute all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Aquí pot seleccionar el valor de la sèrie. Té la possibilitat de seleccionar un o més elements. Després pot seleccionar els atributs dels elements. Cada atribut serà mostrat com un element de la sèrie. Si no selecciona cap atribut, tots els atributs de l\'element seran utilitzats si genera una estadística.',
        'Here you can define the x-axis. You can select one element via the radio button. Then you you have to select two or more attributes of the element. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Aquí pot definir l\'eix-x. Pot seleccionar un element usant la casella de selecció. Després ha de seleccionar dos o més atributs de l\'element. Si no selecciona cap, tots els atributs de l\'element s\'utilitzaran per a generar una estadística. Així com un nou atribut és afegit des de l\'última configuració',
        'Here you can insert a description of the stat.' => 'Aquí pot inserir una descripció de l\'estadística.',
        'Here you can select the dynamic object you want to use.' => 'Aquí pot seleccionar l\'element dinàmic que desitgi utilitzar',
        'Home' => 'Inici',
        'If a new hardcoded file is available this attribute will be shown and you can select one.' =>
            'Si un nou arxiu prefixat està disponible, aquest atribut se li mostrarà i pot seleccionar un',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked for the old owner.' =>
            'Si el tiquet està tancat i el client envia un seguiment al mateix, aquest serà bloquejat per a l\'antic propietari',
        'If a ticket will not be answered in this time, just only this ticket will be shown.' =>
            'Si un tiquet no ha estat respost en aquest temps, només aquest tiquet es mostrarà',
        'If an agent locks a ticket and he/she will not send an answer within this time, the ticket will be unlock automatically. So the ticket is viewable for all other agents.' =>
            'Si un agent bloqueja un tiquet i ell/ella no envia una resposta en aquest temps, el tiquet serà desbloquejat automàticament',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the user).' =>
            'Si no se selecciona alguna cosa, no haurà permisos en aquest grup (Els tiquets no estaran disponibles per a aquest client).',
        'If you need the sum of every column select yes.' => 'Si necessita la suma de cada columna seleccioni Si',
        'If you need the sum of every row select yes' => 'Si necessita la suma de cada fila seleccioni Si',
        'If you use RegExp, you also can use the matched value in () as [***] in \'Set\'.' =>
            'Si utilitza una expressió regular, pot també usar el valor trobat en () com [***] en \'Set\'.',
        'Image' => 'Imatge',
        'Important' => 'Important',
        'In this form you can select the basic specifications.' => 'En aquesta pantalla pot seleccionar les especificacions bàsiques',
        'In this way you can directly edit the keyring configured in Kernel/Config.pm.' =>
            'D\'aquesta forma pot editar directament les claus configurades en Kernel/Config.pm.',
        'Incident' => 'Incident',
        'Incident Management (OTIC)' => 'Gestió D\'Incidències (OTIC)',
        'Information about the Stat' => 'Informacions sobre l\'estadística',
        'Insert of the common specifications' => 'Insereixi les especificacions ordinàries',
        'Is Job Valid' => 'És una tasca Vàlida',
        'Is Job Valid?' => 'És una tasca Vàlida?',
        'It\'s useful for ASP solutions.' => 'Això és útil per a solucions ASP.',
        'It\'s useful for a lot of users and groups.' => 'És útil per a gestionar molts usuaris i grups.',
        'Job-List' => 'Llista de Tasques',
        'Keyword' => 'paraula clau',
        'Keywords' => 'Paraules clau',
        'Last update' => 'Darrera actualització',
        'Link this ticket to an other objects!' => 'Enllaçar aquest tiquet a altres objectes',
        'Linked as' => 'Enllaçat com',
        'Load Settings' => 'Carregar Configuració',
        'Lock it to work on it!' => 'Bloquejar-lo per a treballar en ell!',
        'Logfile' => 'Arxiu de traces',
        'Logfile too large, you need to reset it!' => 'Registre molt gran, necessita reinicialitzar-lo!',
        'Login failed! Your username or password was entered incorrectly.' =>
            'Identificació incorrecta. El seu nom d\'usuari o contrasenya ha estat introduït incorrectament',
        'Lookup' => 'Cercar',
        'Mail Management' => 'Gestió de Correus',
        'Mailbox' => 'Bústia',
        'Match' => 'Coincidir',
        'Merge this ticket!' => 'Unir aquest tiquet!',
        'Message for new Owner' => 'Missatge per al nou propietari',
        'Message sent to' => 'Missatge enviat a',
        'Misc' => 'Miscel·lànies',
        'Modified' => 'Modificat',
        'Modules' => 'Mòduls',
        'Move notification' => 'Notificació de moviments',
        'Multiple selection of the output format.' => 'Selecció múltiple del format de sortida',
        'MyTickets' => 'ElsMeusTiquets',
        'Name is required!' => 'Ha d\'especificar nom!',
        'New Agent' => 'Nou Agent',
        'New Customer' => 'Nou Client',
        'New Group' => 'Nou grup',
        'New Group Ro' => 'Nou Grup Ro',
        'New Priority' => 'Nova prioritat',
        'New SLA' => 'Nova SLA',
        'New Service' => 'Nou servei',
        'New State' => 'Nou estat',
        'New Ticket Lock' => 'Nou bloqueig de tiquet',
        'New TicketFreeFields' => 'Nou CampsLliuresDeTiquet',
        'New Title' => 'Nou títol',
        'New Type' => 'Nou tipus',
        'New account created. Sent Login-Account to %s.' => 'Nou compte creat. Dades d\'inici de sessió enviats a %s.',
        'New messages' => 'Nou missatge',
        'New password again' => 'Repetir Contrasenya',
        'Next Week' => 'Pròxima setmana',
        'No * possible!' => 'No * possible!',
        'No Packages for requested Framework in this Online Repository, but Packages for other Frameworks!' =>
            'No hi ha paquets per al Framework sol·licitat en aquest repositori en línia, però si hi ha per a altres Frameworks',
        'No Packages or no new Packages in selected Online Repository!' =>
            'No hi ha paquets o no hi ha paquets nous en el repositori en línia seleccionat',
        'No Permission' => 'No té autorització',
        'No means, send agent and customer notifications on changes.' => 'No, significa enviar als agents i clients notificacions al realitzar canvis.',
        'No time settings.' => 'Sense especificació de data',
        'Note Text' => 'Nota!',
        'Notification (Customer)' => 'Notificació (Client)',
        'Notification (Event)' => 'Notificacions (Event)',
        'Notifications' => 'Notificacions',
        'OTRS DB Name' => 'Nom de la BD OTRS',
        'OTRS DB Password' => 'Contrasenya per a BD de l\'usuari OTRS',
        'OTRS DB User' => 'Usuari de BD OTRS',
        'OTRS sends an notification email to the customer if the ticket is moved.' =>
            'OTRS envia una notificació per correu si el tiquet es mou',
        'OTRS sends an notification email to the customer if the ticket owner has changed.' =>
            'OTRS envia una notificació per correu al client si el propietari del tiquet canvia',
        'OTRS sends an notification email to the customer if the ticket state has changed.' =>
            'OTRS envia una notificació per correu al client si l\'estat del tiquet canvia',
        'Object already linked as %s.' => 'Objecte ja enllaçat com %s.',
        'Of couse this feature will take some system performance it self!' =>
            'Evidentment aquesta característica afectarà al rendiment del sistema per si mateixa!',
        'Open Tickets' => 'Tiquets Oberts',
        'Options ' => 'Opcions',
        'Options of the current customer user data (e. g. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)' =>
            'Opcions de dades d\'usuari del client actual (ex. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>)' =>
            'Opcions de dades d\'usuari de l\'usuari actual (ex.: <OTRS_CUSTOMER_DATA_UserFirstname>)',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>).' =>
            'Opcions de dades de l\'actual usuari client (p.e., <OTRS_CUSTOMER_DATA_UserFirstname>).',
        'Options of the current user who requested this action (e. g. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)' =>
            'Opcions de l\'usuari actual qui ha sol·licitat aquesta acció (ex.: &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>)' =>
            'Opcions de l\'usuari actiu que sol·licita aquesta acció (ex. <OTRS_CURRENT_UserFirstname>)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>).' =>
            'Opcions de l\'actual usuari qui va requerir aquesta acció (p.e., <OTRS_CURRENT_UserFirstname>).',
        'Options of the ticket data (e. g. &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)' =>
            'Opcions de la data del tiquet (ex. &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)',
        'Options of the ticket data (e. g. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Opcions per a la informació de tiquet (ex.: <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Opcions per a la informació el tiquet (ex. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).' =>
            'Opcions de dades del tiquet (p.e., <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).',
        'Other Options' => 'Altres Opcions',
        'POP3 Account Management' => 'Gestió de compte POP3',
        'Package' => 'Paquet',
        'Package not correctly deployed! You should reinstall the Package again!' =>
            'Paquet no instal·lat correctament! Vostè ha de reinstal·lar el paquet novament!',
        'Package not correctly deployed, you need to deploy it again!' =>
            'El paquet no ha estat correctament instal·lat, necessita instal·lar-lo novament!',
        'Param 1' => 'Paràmetre 1',
        'Param 2' => 'Paràmetre 2',
        'Param 3' => 'Paràmetre 3',
        'Param 4' => 'Paràmetre 4',
        'Param 5' => 'Paràmetre 5',
        'Param 6' => 'Paràmetre 6',
        'Parent-Object' => 'Objecte-pare',
        'Password is already in use! Please use an other password!' => 'La contrasenya ja s\'està utilitzant! Per Favor utilitzi altra!',
        'Password is already used! Please use an other password!' => 'La contrasenya ja va ser usada! Per Favor utilitzi altra!',
        'Passwords doesn\'t match! Please try it again!' => 'Les contrasenyes no coincideixen. Per favor intenti\'l de nou !',
        'Pending Times' => 'Temps Pendents',
        'Pending messages' => 'Missatges pendents',
        'Pending type' => 'Tipus pendent',
        'Permission settings. You can select one or more groups to make the configurated stat visible for different agents.' =>
            'Configuració de permisos. Pot seleccionar un o més grups per a fer visible les estadístiques configurades a agents distints',
        'Permissions to change the ticket owner in this group/queue.' => 'Permís per a canviar el propietari del tiquet en aquest grup/cua',
        'PhoneView' => 'Vista telefònica',
        'Please contact your admin' => 'Per favor contacti amb ladministrador',
        'Print this ticket!' => 'Imprimir aquest tiquet!',
        'Prio' => 'Prio',
        'Problem' => 'Problema',
        'Queue <-> Auto Responses Management' => 'Cua <-> Gestió de respostes automàtiques',
        'Queue ID' => 'ID de la Cua',
        'Queue Management' => 'Gestió de Cues',
        'Realname' => 'Nom',
        'Rebuild' => 'Reconstruir',
        'Recipients' => 'Destinataris',
        'Reminder' => 'Recordatori',
        'Reminder messages' => 'Missatges recordatoris',
        'Required Field' => 'Camps obligatoris',
        'Response Management' => 'Gestió de Respostes',
        'Responses <-> Attachments Management' => 'Respostes <-> Gestió d\'Annexos',
        'Responses <-> Queue' => 'Respostes <-> Cues',
        'Responses <-> Queue Management' => 'Respostes <-> Gestió de Cues',
        'Return to the compose screen' => 'Tornar a la pantalla de redacció',
        'Role' => 'Rol',
        'Roles <-> Groups Management' => 'Rols <-> Gestió de Grups',
        'Roles <-> Users' => 'Rols <-> Usuaris',
        'Roles <-> Users Management' => 'Rols <-> Gestió d\'Usuaris',
        'Save Job as?' => 'Guardar Tasca com?',
        'Save Search-Profile as Template?' => 'Guardar perfil de recerca com plantilla?',
        'Schedule' => 'Horari',
        'Search Result' => 'Resultat de la recerca',
        'Search for' => 'Cercar per',
        'Select Box' => 'Finestra de selecció ',
        'Select Box Result' => 'Seleccioni tipus de resultat',
        'Select Source (for add)' => 'Seleccionar Font (per a afegir)',
        'Select the customeruser:service relations.' => 'Seleccioni el client:relacions de serveis',
        'Select the element, which will be used at the X-axis' => 'Seleccioni l\'element, que serà utilitzat en l\'eix-X',
        'Select the restrictions to characterise the stat' => 'Seleccioni les restriccions per a caracteritzar l\'estadística',
        'Select the role:user relations.' => 'Seleccionar les relacions Rol:Client',
        'Select the user:group permissions.' => 'Seleccionar els permisos d\'usuari:grup',
        'Select your QueueView refresh time.' => 'Seleccioni el temps d\'actualització de la vista de cues',
        'Select your default spelling dictionary.' => 'Seleccioni el seu diccionari per defecte',
        'Select your frontend Charset.' => 'Seleccioni el seu joc de caràcters',
        'Select your frontend QueueView.' => 'Seleccioni la seva Vista de cua de treball',
        'Select your frontend language.' => 'Seleccioni el seu idioma de treball',
        'Select your screen after creating a new ticket.' => 'Seleccioni la pantalla a mostrar després de crear un tiquet ',
        'Selection needed' => 'Selecció necessària',
        'Send Notification' => 'Enviar Notificació',
        'Send no notifications' => 'No enviar notificacions',
        'Sent new password to: %s' => 'Enviar nova contrasenya a: %s',
        'Sent password token to: %s' => 'Enviar el \'token\' de la contrasenya a: %s ',
        'Sessions' => 'Sessions',
        'Set customer user and customer id of a ticket' => 'Assignar agent i client d\'un tiquet',
        'Set this ticket to pending!' => 'Col·locar aquest tiquet com pendent!',
        'Show' => 'Mostrar',
        'Shows the ticket history!' => 'Mostrar la història del tiquet!',
        'Site' => 'Ubicació',
        'Solution' => 'Solució',
        'Sort by' => 'Ordenat per',
        'Source' => 'Origen',
        'Spell Check' => 'Verificació ortogràfica',
        'Split' => 'Dividir',
        'State Type' => 'Tipus d\'estat',
        'Static-File' => 'Arxiu-Estàtic',
        'Stats-Area' => 'Area-Estadístiques',
        'Sub-Queue of' => 'Sub-cua de',
        'Sub-Service of' => 'Sub-Servei de',
        'Subscribe' => 'Subscriure',
        'Symptom' => 'Símptoma',
        'System History' => 'Història del Sistema',
        'System State Management' => 'Gestió d\'estats del Sistema',
        'System Status' => 'Estat del sistema',
        'Systemaddress' => 'Adreces de correu del sistema ',
        'Take care that you also updated the default states in you Kernel/Config.pm!' =>
            'Recordi també actualitzar els estats en el seu arxiu Kernel/Config.pm!',
        'The message being composed has been closed.  Exiting.' => 'El missatge que s\'estava redactant ha estat tancat.  Sortint.',
        'This account exists.' => 'Aquest compte existeix',
        'This is useful if you want that no one can get the result of the stat or the stat isn\'t ready configurated.' =>
            'Això és útil si desitja que ningú pugui obtenir el resultat d\'una estadística o la mateixa encara no està configurada ',
        'This values are read only.' => 'Aquests valors són només de lectura',
        'This values are required.' => 'Aquests valors són obligatoris',
        'This window must be called from compose window' => 'Aquesta finestra ha de ser cridada des de la finestra de redacció',
        'Ticket Lock' => 'Tiquet Bloquejat',
        'Ticket Number Generator' => 'Generador de nombres de Tiquets',
        'Ticket Search' => 'Buscar tiquet',
        'Ticket Status View' => 'Veure l\'estat del tiquet ',
        'Ticket escalation!' => 'Escalat de tiquet!',
        'Ticket locked!' => 'Tiquet bloquejat!',
        'Ticket owner options (e. g. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)' =>
            'Opcions del propietari del tiquet (ex.: &lt;OTRS_OWNER_USERFIRSTNAME&gt;)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>)' => 'Opcions del propietari del tiquet (ex. <OTRS_OWNER_UserFirstname>)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>).' => 'Opcions del propietari del tiquet (p.e., <OTRS_OWNER_UserFirstname>).',
        'Ticket responsible options (e. g. <OTRS_RESPONSIBLE_UserFirstname>).' =>
            'Opcions del responsable del tiquet (p.e., <OTRS_RESPONSIBLE_UserFirstname>).',
        'Ticket selected for bulk action!' => 'Tiquet seleccionat per a acció múltiple!',
        'Ticket unlock!' => 'Tiquet desbloquejat!',
        'Ticket-Area' => 'Area-Tiquet',
        'TicketFreeFields' => 'CampsLliuresDeTiquet',
        'TicketFreeText' => 'TextLliureTiquet',
        'TicketID' => 'Identificador de Tiquet',
        'TicketZoom' => 'Detall del Tiquet',
        'Tickets available' => 'Tiquets disponibles',
        'Tickets shown' => 'Tiquets mostrats',
        'Timeover' => 'Vencimient',
        'Times' => 'Vegades',
        'Title of the stat.' => 'Títol de l\'estadística',
        'To get the article attribute (e. g. (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).' =>
            'Per a obtenir l\'atribut de l\'article (p.e.,
(<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> i <OTRS_CUSTOMER_Body>).',
        'Top of Page' => 'Inici de pàgina',
        'Total hits' => 'Total de coincidències',
        'U' => 'A',
        'Unable to parse Online Repository index document!' => 'Incapaç d\'interpretar el document índex del Repositorio en Línia!',
        'Uniq' => 'Únic',
        'Unlock Tickets' => 'Desbloquejar Tiquets',
        'Unlock to give it back to the queue!' => 'Desbloquejar-lo per a regressar-lo a la cua!',
        'Unsubscribe' => 'Cancel·lar subscripció',
        'Use utf-8 it your database supports it!' => 'Usar utf-8 si la seva base de dades ho permet!',
        'Useable options' => 'Opcions accessibles',
        'User Management' => 'Gestió d\'usuaris',
        'User will be needed to handle tickets.' => 'Es necessita un usuari per a manipular els tiquets.',
        'Users' => 'Usuaris',
        'Users <-> Groups' => 'Usuaris <-> Grups',
        'Users <-> Groups Management' => 'Usuaris <-> Gestió de Grups',
        'Warning! This tickets will be removed from the database! This tickets are lost!' =>
            'Avís! Aquests tiquets seran eliminats de la base de dades! Aquests tiquets es perdran!',
        'Web-Installer' => 'Instal·lador-Web',
        'WebMail' => 'Correu web',
        'WebWatcher' => 'ObservadorWeb',
        'Welcome to OTRS' => 'Benvingut a OTRS',
        'With an invalid stat it isn\'t feasible to generate a stat.' => 'Amb una estadística invàlida, no és possible generar estadístiques.',
        'With the input and select fields you can configurate the stat at your needs. Which elements of a stat you can edit depends on your stats administrator who configurated the stat.' =>
            'Amb l\'entrada i camps seleccionats pot configurar les estadístiques a les seves necessitats. Que elements d\'estadístiques pot editar depèn de com hagi estat configurat per l\'administrador.',
        'Yes means, send no agent and customer notifications on changes.' =>
            'Si, significa no enviar notificacions als agents i clients al realitzar-se canvis.',
        'Yes, save it with name' => 'Si, guardar-lo amb nom',
        'You got new message!' => 'Vostè té un nou missatge',
        'You have to select two or more attributes from the select field!' =>
            'Ha de seleccionar dos o més atributs del camp seleccionat',
        'You need a email address (e. g. customer@example.com) in To:!' =>
            'Necessita una adreça de correu (exemple: client@exemple.com) en To:!',
        'You need min. one selected Ticket!' => 'Necessita almenys seleccionar un Tiquet!',
        'You need to account time!' => 'Necessita comptabilitzar el temps!',
        'You need to activate %s first to use it!' => 'Necessita activar %s primer per a usar-lo!',
        'Your email address is new' => 'La seva adreça de correu és nova',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'El seu correu amb el tiquet nombre "<OTRS_TICKET>" va ser retornat a "<OTRS_BOUNCE_TO>". Contacti aquesta adreça para mes informació',
        'Your own Ticket' => 'Els seus tiquets',
        'accept license' => 'acceptar llicència',
        'closed with workaround' => 'tancat amb solució temporal',
        'customer realname' => 'Nom del client',
        'don\'t accept license' => 'no accepto la llicència',
        'down' => 'avall',
        'false' => 'fals',
        'for agent firstname' => 'nom de l\'agent',
        'for agent lastname' => 'cognom de l\'agent',
        'for agent login' => 'login de l\'agent',
        'for agent user id' => 'id de l\'agent',
        'kill all sessions' => 'Finalitzar totes les sessions',
        'kill session' => 'Finalitzar una sessió',
        'maximal period form' => 'màxim període del formulari',
        'modified' => 'modificat',
        'new ticket' => 'nou tiquet',
        'next step' => 'pròxim pas',
        'send' => 'enviar',
        'sort downward' => 'ordenar descendent',
        'sort upward' => 'ordenar ascendent',
        'to get the first 20 character of the subject' => 'per a obtenir els primers 20 caràcters de l\'assumpte',
        'to get the first 5 lines of the email' => 'per a obtenir les primeres 5 línies del correu',
        'to get the from line of the email' => 'per a obtenir la línia del registre from: del correu',
        'to get the realname of the sender (if given)' => 'per a obtenir el nom de l\'emissor (si ho va proporcionar)',
        'up' => 'amunt',
        'utf8' => 'utf8',
        'x' => 'x',

    };
    # $$STOP$$
    return;
}

1;
