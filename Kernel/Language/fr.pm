# --
# Kernel/Language/fr.pm - provides French language translation
# Copyright (C) 2002 Bernard Choppy <choppy at imaginet.fr>
# Copyright (C) 2002 Nicolas Goralski <ngoralski at oceanet-technology.com>
# Copyright (C) 2004 Igor Genibel <igor.genibel at eds-opensource.com>
# Copyright (C) 2007 Remi Seguy <remi.seguy at laposte.net>
# Copyright (C) 2007 Massimiliano Franco <max-lists at ycom.ch>
# Copyright (C) 2004-2008 Yann Richard <ze at nbox.org>
# Copyright (C) 2009-2010 Olivier Sallou <olivier.sallou at irisa.fr>
# --
# $Id: fr.pm,v 1.161 2012/02/27 08:26:13 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fr;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.161 $) [1];

sub Data {
    my $Self = shift;

    # $$START$$
    # Last translation file sync: 2012-02-02 17:08:26

    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D.%M.%Y %T';
    $Self->{DateFormatLong}      = '%A %D %B %T %Y';
    $Self->{DateFormatShort}     = '%D.%M.%Y';
    $Self->{DateInputFormat}     = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';

    # csv separator
    $Self->{Separator} = ';';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Oui',
        'No' => 'Non',
        'yes' => 'oui',
        'no' => 'non',
        'Off' => 'Désactivé',
        'off' => 'désactivé',
        'On' => 'Activé',
        'on' => 'activé',
        'top' => 'haut',
        'end' => 'fin',
        'Done' => 'Fait',
        'Cancel' => 'Annuler',
        'Reset' => 'Remise à zéro',
        'last' => 'dernier',
        'before' => 'avant',
        'Today' => 'Aujourd\'hui',
        'Tomorrow' => 'Demain',
        'Next week' => '',
        'day' => 'jour',
        'days' => 'jours',
        'day(s)' => 'jour(s)',
        'd' => 'j',
        'hour' => 'heure',
        'hours' => 'heures',
        'hour(s)' => 'heure(s)',
        'Hours' => 'Heures',
        'h' => '',
        'minute' => 'minute',
        'minutes' => 'minutes',
        'minute(s)' => 'minute(s)',
        'Minutes' => '',
        'm' => '',
        'month' => 'mois',
        'months' => 'mois',
        'month(s)' => 'mois',
        'week' => 'semaine',
        'week(s)' => 'semaine(s)',
        'year' => 'année',
        'years' => 'années',
        'year(s)' => 'année(s)',
        'second(s)' => 'seconde(s)',
        'seconds' => 'secondes',
        'second' => 'seconde',
        's' => '',
        'wrote' => 'a écrit',
        'Message' => 'Message',
        'Error' => 'Erreur',
        'Bug Report' => 'Rapport d\'anomalie',
        'Attention' => 'Attention',
        'Warning' => 'Attention',
        'Module' => 'Module',
        'Modulefile' => 'Fichier de module',
        'Subfunction' => 'sous-fonction',
        'Line' => 'Ligne',
        'Setting' => 'Paramètre',
        'Settings' => 'Paramètres',
        'Example' => 'Exemple',
        'Examples' => 'Exemples',
        'valid' => 'valide',
        'Valid' => 'Valide',
        'invalid' => 'invalide',
        'Invalid' => '',
        '* invalid' => '* invalide',
        'invalid-temporarily' => 'temporairement invalide',
        ' 2 minutes' => ' 2 minutes',
        ' 5 minutes' => ' 5 minutes',
        ' 7 minutes' => ' 7 minutes',
        '10 minutes' => '10 minutes',
        '15 minutes' => '15 minutes',
        'Mr.' => 'M.',
        'Mrs.' => 'Mme',
        'Next' => 'Suivant',
        'Back' => 'Retour',
        'Next...' => 'Suivant...',
        '...Back' => '...Retour',
        '-none-' => '-aucun-',
        'none' => 'aucun',
        'none!' => 'aucun !',
        'none - answered' => 'aucun - réponse faite',
        'please do not edit!' => 'Ne pas modifier !',
        'Need Action' => 'Requiert une action',
        'AddLink' => 'Ajouter un lien',
        'Link' => 'Lier',
        'Unlink' => 'Délier',
        'Linked' => 'Lié',
        'Link (Normal)' => 'Lien (Normal)',
        'Link (Parent)' => 'Lien (Parent)',
        'Link (Child)' => 'Lien (Enfant)',
        'Normal' => 'Normal',
        'Parent' => 'Parent',
        'Child' => 'Enfant',
        'Hit' => 'Occurence',
        'Hits' => 'Occurences',
        'Text' => 'Texte',
        'Standard' => 'Standard',
        'Lite' => 'Allégée',
        'User' => 'Utilisateur',
        'Username' => 'Nom d\'utilisateur',
        'Language' => 'Langue',
        'Languages' => 'Langues',
        'Password' => 'Mot de Passe',
        'Preferences' => 'Préférences',
        'Salutation' => 'En-tête',
        'Salutations' => 'En-têtes',
        'Signature' => 'Signature',
        'Signatures' => 'Signatures',
        'Customer' => 'Client',
        'CustomerID' => 'Numéro de client',
        'CustomerIDs' => 'Numéro de client (Groupe)',
        'customer' => 'client',
        'agent' => 'opérateur',
        'system' => 'système',
        'Customer Info' => 'Information client',
        'Customer Information' => 'Information client',
        'Customer Company' => 'Entreprise du client',
        'Customer Companies' => 'Entreprises clientes',
        'Company' => 'Entreprise',
        'go!' => 'c\'est parti !',
        'go' => 'aller',
        'All' => 'Tout',
        'all' => 'tout',
        'Sorry' => 'Désolé',
        'update!' => 'mettre à jour !',
        'update' => 'mettre à jour',
        'Update' => 'Mettre à jour',
        'Updated!' => 'Mis(e) à jour !',
        'submit!' => 'soumettre !',
        'submit' => 'soumettre',
        'Submit' => 'Soumettre',
        'change!' => 'modifier !',
        'Change' => 'Modifier',
        'change' => 'modifier',
        'click here' => 'Cliquer ici',
        'Comment' => 'Commentaire',
        'Invalid Option!' => 'Option invalide !',
        'Invalid time!' => 'Heure/Durée invalide !',
        'Invalid date!' => 'Date invalide !',
        'Name' => 'Nom',
        'Group' => 'Groupe',
        'Description' => 'Description',
        'description' => 'description',
        'Theme' => 'Thème',
        'Created' => 'Créé',
        'Created by' => 'Créé par',
        'Changed' => 'Changé',
        'Changed by' => 'Changé par',
        'Search' => 'Chercher',
        'and' => 'et le',
        'between' => 'entre',
        'Fulltext Search' => 'Recherche sur tout le texte',
        'Data' => 'Données',
        'Options' => 'Options',
        'Title' => 'Titre',
        'Item' => 'Élément',
        'Delete' => 'Effacer',
        'Edit' => 'Éditer',
        'View' => 'Vue',
        'Number' => 'Nombre',
        'System' => 'Système',
        'Contact' => 'Contact',
        'Contacts' => 'Contacts',
        'Export' => 'Exporter',
        'Up' => 'Haut',
        'Down' => 'Bas',
        'Add' => 'Ajouter',
        'Added!' => 'Ajouté !',
        'Category' => 'Catégorie',
        'Viewer' => 'Visionneuse',
        'Expand' => 'Etendre',
        'Small' => 'Petit',
        'Medium' => 'Moyen',
        'Large' => 'Grand',
        'Date picker' => 'Selection de date',
        'New message' => 'Nouveau message',
        'New message!' => 'Nouveau message !',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Veuillez répondre à ce(s) ticket(s) pour revenir à une vue normale de la file !',
        'You have %s new message(s)!' => 'Vous avez %s nouveau(x) message(s) !',
        'You have %s reminder ticket(s)!' => 'Vous avez %s rappel(s) de ticket(s) !',
        'The recommended charset for your language is %s!' => 'Le jeu de caractère correspondant à votre langue est %s !',
        'Change your password.' => 'Modifier votre mot de passe',
        'Please activate %s first!' => 'Merci d\'activer %s en premier lieu',
        'No suggestions' => 'Pas de suggestions',
        'Word' => 'Mot',
        'Ignore' => 'Ignorer',
        'replace with' => 'remplacer par',
        'There is no account with that login name.' => 'Il n\'y a aucun compte avec ce nom de connexion',
        'Login failed! Your user name or password was entered incorrectly.' =>
            'Mauvaise authentification! Votre nom de compte ou mot de passe étaient erronés',
        'There is no acount with that user name.' => 'Il n\'y a aucun compte avec ce nom d\'utilisateur',
        'Please contact your administrator' => 'SVP contactez votre administrateur',
        'Logout' => 'Déconnexion',
        'Logout successful. Thank you for using OTRS!' => 'Déconnexion réussie. Merci d\'avoir utilisé OTRS !',
        'Invalid SessionID!' => 'ID de session invalide !',
        'Feature not active!' => 'Cette fonctionnalité n\'est pas activée !',
        'Agent updated!' => 'Information de l\'opérateur mises à jour',
        'Create Database' => 'Créer la base de données',
        'System Settings' => 'Paramètres Système',
        'Mail Configuration' => 'Configuration de la messagerie',
        'Finished' => 'Fini',
        'Install OTRS' => '',
        'Intro' => '',
        'License' => 'Licence',
        'Database' => 'Base de donnée',
        'Configure Mail' => '',
        'Database deleted.' => '',
        'Database setup succesful!' => '',
        'Login is needed!' => 'Authentification requise !',
        'Password is needed!' => 'Le mot de passe est requis !',
        'Take this Customer' => 'Choisir ce client',
        'Take this User' => 'Choisir cet utilisateur',
        'possible' => 'possible',
        'reject' => 'rejeté',
        'reverse' => 'inverse',
        'Facility' => 'Service',
        'Time Zone' => 'Fuseau horaire',
        'Pending till' => 'En attendant jusqu\'à',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            '',
        'Dispatching by email To: field.' => 'Répartition par le champ \'À:\' du courriel',
        'Dispatching by selected Queue.' => 'Répartition selon la file sélectionnée',
        'No entry found!' => 'Aucun résultat n\'a été trouvé !',
        'Session has timed out. Please log in again.' => 'Le délai de votre session est dépassé, veuillez vous ré-authentifier.',
        'No Permission!' => 'Pas de permission !',
        'To: (%s) replaced with database email!' => 'Le champ \'À:\' (%s) a été remplacé avec la valeur de la base de données des adresses électroniques !',
        'Cc: (%s) added database email!' => 'Cc: (%s) a été ajouté à la base de donnée d\'adresses électroniques !',
        '(Click here to add)' => '(Cliquez içi pour ajouter)',
        'Preview' => 'Aperçu',
        'Package not correctly deployed! Please reinstall the package.' =>
            '',
        '%s is not writable!' => '% n\'est pas accessible en écriture',
        'Cannot create %s!' => 'Impossible de créer %s',
        'Check to activate this date' => '',
        'You have Out of Office enabled, would you like to disable it?' =>
            '',
        'Customer %s added' => 'Client %s ajouté',
        'Role added!' => 'Rôle ajouté!',
        'Role updated!' => 'Rôle mis à jour!',
        'Attachment added!' => 'Pièce jointe ajoutée!',
        'Attachment updated!' => 'Pièce jointe mise à jour!',
        'Response added!' => 'Réponse ajoutée!',
        'Response updated!' => 'Réponse mise à jour!',
        'Group updated!' => 'Groupe ajouté!',
        'Queue added!' => 'File ajoutée!',
        'Queue updated!' => 'File mise à jour!',
        'State added!' => 'État ajouté!',
        'State updated!' => 'État mis à jour!',
        'Type added!' => 'Type ajouté!',
        'Type updated!' => 'Type mis à jour!',
        'Customer updated!' => 'Client mis à jour!',
        'Customer company added!' => '',
        'Customer company updated!' => '',
        'Mail account added!' => '',
        'Mail account updated!' => '',
        'System e-mail address added!' => '',
        'System e-mail address updated!' => '',
        'Contract' => 'Contrat',
        'Online Customer: %s' => 'Clients en ligne: %s',
        'Online Agent: %s' => 'Opérateurs en ligne: %s',
        'Calendar' => 'Calendrier',
        'File' => 'Fichier',
        'Filename' => 'Nom de fichier',
        'Type' => 'Type',
        'Size' => 'Taille',
        'Upload' => 'Uploader',
        'Directory' => 'Répertoire',
        'Signed' => 'Signé',
        'Sign' => 'Signer',
        'Crypted' => 'Crypté',
        'Crypt' => 'Crypter',
        'PGP' => 'PGP',
        'PGP Key' => 'Clé PGP',
        'PGP Keys' => 'Clés PGP',
        'S/MIME' => 'S/MIME',
        'S/MIME Certificate' => 'Certificat S/MIME',
        'S/MIME Certificates' => 'Certificats S/MIME',
        'Office' => 'Bureau',
        'Phone' => 'Téléphone',
        'Fax' => 'Fax',
        'Mobile' => 'Téléphone portable',
        'Zip' => 'Code postal',
        'City' => 'Ville',
        'Street' => 'Rue',
        'Country' => 'Pays',
        'Location' => 'Plan',
        'installed' => 'installé',
        'uninstalled' => 'désinstallé',
        'Security Note: You should activate %s because application is already running!' =>
            'Note de Sécurité: Vous devriez activer %s parce que l\'application est déjà lancée !',
        'Unable to parse repository index document.' => '',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            '',
        'No packages, or no new packages, found in selected repository.' =>
            '',
        'Edit the system configuration settings.' => 'Modifier la configuration du système.',
        'printed at' => 'imprimé à',
        'Loading...' => 'Chargement...',
        'Dear Mr. %s,' => 'Cher M. %s',
        'Dear Mrs. %s,' => 'Cher Mme %s',
        'Dear %s,' => 'Cher %s',
        'Hello %s,' => 'Bonjour %s',
        'This email address already exists. Please log in or reset your password.' =>
            'Cette adresse de messagerie existe déjà. Veuillez vous authentifier ou re-initialiser votre mot de passe',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Nouveau compte créé. Informations de connexion envoyées à %s. SVP veuillez vérifier votre messagerie.',
        'Please press Back and try again.' => 'SVP, reculez d\'une page et rééssayez.',
        'Sent password reset instructions. Please check your email.' => 'Instructions d\initialisation du mot de passe envoyées. SVP veuillez vérifier votre messagerie.',
        'Sent new password to %s. Please check your email.' => 'Nouveau mot de passe envoyé à %s. SVP veuillez vérifier votre messagerie.',
        'Upcoming Events' => 'Évènements à venir',
        'Event' => 'Évènement',
        'Events' => 'Évènements',
        'Invalid Token!' => 'Jeton invalide !',
        'more' => 'plus',
        'For more info see:' => 'Pour plus d\'informations, allez à',
        'Package verification failed!' => 'Vérification du paquet échouée !',
        'Collapse' => 'Réduire',
        'Shown' => 'Affiché(s)',
        'News' => 'Nouvelles',
        'Product News' => 'Nouvelles du produit',
        'OTRS News' => 'Nouvelles d\'OTRS',
        '7 Day Stats' => 'Stats sur 7 jours',
        'Bold' => 'Gras',
        'Italic' => 'Italique',
        'Underline' => 'Souligné',
        'Font Color' => 'Couleur de police',
        'Background Color' => 'Couleur de fond',
        'Remove Formatting' => 'Supprimer le formattage',
        'Show/Hide Hidden Elements' => 'Montrer/Cacher les éléments cachés',
        'Align Left' => 'Aligner à Gauche',
        'Align Center' => 'Aligner au Centre',
        'Align Right' => 'Aligner à Droite',
        'Justify' => 'Justifier',
        'Header' => 'En-tête',
        'Indent' => 'Ajouter indentation',
        'Outdent' => 'Supprimer indentation',
        'Create an Unordered List' => 'Créer une liste non ordonnée',
        'Create an Ordered List' => 'Créer une liste ordonnée',
        'HTML Link' => 'Lien HTML',
        'Insert Image' => 'Insérer image',
        'CTRL' => 'Contrôle',
        'SHIFT' => 'Shift',
        'Undo' => 'Annuler',
        'Redo' => 'Refaire',
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
        'Feb' => 'Fév',
        'Mar' => 'Mar',
        'Apr' => 'Avr',
        'May' => 'Mai',
        'Jun' => 'Juin',
        'Jul' => 'Juil',
        'Aug' => 'Aoû',
        'Sep' => 'Sep',
        'Oct' => 'Oct',
        'Nov' => 'Nov',
        'Dec' => 'Déc',
        'January' => 'Janvier',
        'February' => 'Février',
        'March' => 'Mars',
        'April' => 'Avril',
        'May_long' => 'Mai',
        'June' => 'Juin',
        'July' => 'Juillet',
        'August' => 'Août',
        'September' => 'Septembre',
        'October' => 'Octobre',
        'November' => 'Novembre',
        'December' => 'Décembre',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'Les préférences ont bien été mises à jour !',
        'User Profile' => 'Profil utilisateur',
        'Email Settings' => 'Paramétrage email',
        'Other Settings' => 'Autres paramétrages',
        'Change Password' => 'Changer de mot de passe',
        'Current password' => 'Mot de passe actuel',
        'New password' => 'Nouveau mot de passe',
        'Verify password' => '',
        'Spelling Dictionary' => 'Correcteur orthographique',
        'Default spelling dictionary' => 'Dictionnaire d\'orthographe par défaut.',
        'Max. shown Tickets a page in Overview.' => 'Nombre maximum de tickets affichés sur la page d\'aperçu des tickets',
        'The current password is not correct. Please try again!' => 'Le mot de passe actuel n\'est pas correct. Merci d\'essayer à nouveau!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Impossible de mettre à jour le mot de passe, votre nouveau mot de passe ne correspond pas. Merci d\'essayer à nouveau!',
        'Can\'t update password, it contains invalid characters!' => 'Impossible de mettre à jour le mot de passe, il contienti des caractères invalides!',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Impossible de mettre à jour le mot de passe,, il doit contenir au moins %s caractères!',
        'Can\'t update password, it must contain at least 2 lowercase  and 2 uppercase characters!' =>
            'Impossible de mettre à jour le mot de passe, il doit contenir au moins 2 lettres en minuscule et 2 en majuscule!',
        'Can\'t update password, it must contain at least 1 digit!' => 'Impossible de mettre à jour le mot de passe, il doit contenir au moins 1 chiffre!',
        'Can\'t update password, it must contain at least 2 characters!' =>
            'Impossible de mettre à jour le mot de passe, il doit contenir au moins 2 caractères!',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            'Impossible de mettre à jour le mot de passe, ce mot de passe a déjà été utilisé. Merci d\'en choisir un autre!',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Sélectionner le caractère séparateur pour les fichiers CSV (stats et recherches). Si rien n\'est indiqué ici, le séparateur par défaut pour votre langage est utilisé.',
        'CSV Separator' => 'Séparateur CSV',

        # Template: AAAStats
        'Stat' => 'Stat',
        'Sum' => 'Somme',
        'Please fill out the required fields!' => 'Remplissez les champs obligatoires svp !',
        'Please select a file!' => 'Sélectionnez un fichier svp !',
        'Please select an object!' => 'Sélectionnez un objet svp !',
        'Please select a graph size!' => 'Sélectionnez une taille pour le graphique svp !',
        'Please select one element for the X-axis!' => 'Sélectionnez un élément pour l\'axe X svp !',
        'Please select only one element or turn off the button \'Fixed\' where the select field is marked!' =>
            'Merci de sélectionner un seul élément ou de désactiver le bouton \'Fixe\' où le bouton de sélection est marqué',
        'If you use a checkbox you have to select some attributes of the select field!' =>
            'Si vous cochez une case, vous devez indiquer des attributs du champ sélectionné !',
        'Please insert a value in the selected input field or turn off the \'Fixed\' checkbox!' =>
            'Veuillez donner une valeur pour le champ sélectionné ou décochez la case \'Fixed\' !',
        'The selected end time is before the start time!' => 'La date de fin est antérieure à la date de début !',
        'You have to select one or more attributes from the select field!' =>
            'Vous devez sélectionner un ou plusieurs attributs du champ sélectionné !',
        'The selected Date isn\'t valid!' => 'La date sélectionnée n\'est pas valide !',
        'Please select only one or two elements via the checkbox!' => 'Sélectionnez uniquement un ou deux éléments via les cases à cocher !',
        'If you use a time scale element you can only select one element!' =>
            'Si vous employez un élément d\'échelle de temps vous ne pouvez choisir qu\'un seul élément',
        'You have an error in your time selection!' => 'Vous avez une erreur dans le choix de la date !',
        'Your reporting time interval is too small, please use a larger time scale!' =>
            'La période choisie pour le rapport est trop courte, veuillez indiquer une plage plus grande !',
        'The selected start time is before the allowed start time!' => 'La date de début choisie est antérieure à la date de début autorisée !',
        'The selected end time is after the allowed end time!' => 'La date de fin choisie est posterieure à la date de fin autorisée !',
        'The selected time period is larger than the allowed time period!' =>
            'La plage de temps choisie est supérieure à la période de temps autorisée !',
        'Common Specification' => 'Caractéristiques Communes',
        'X-axis' => 'Axe X',
        'Value Series' => 'Séries de valeurs',
        'Restrictions' => 'Restrictions',
        'graph-lines' => 'Graphique-Lignes',
        'graph-bars' => 'Graphique-Barres',
        'graph-hbars' => 'Graphique-Barres horizontales',
        'graph-points' => 'Graphique-Points',
        'graph-lines-points' => 'Graphique-Lignes-Points',
        'graph-area' => 'Graphique-Surface',
        'graph-pie' => 'Graphique-Camembert',
        'extended' => 'étendu',
        'Agent/Owner' => 'Opérateur/Propriétaire',
        'Created by Agent/Owner' => 'Créé par le Opérateur/Propriétaire',
        'Created Priority' => 'Priorité créée',
        'Created State' => 'État créé',
        'Create Time' => 'Date de création',
        'CustomerUserLogin' => 'Identifiant Client',
        'Close Time' => 'Date de clôture',
        'TicketAccumulation' => 'Cumul de ticket',
        'Attributes to be printed' => 'Attributs à imprimer',
        'Sort sequence' => 'Ordre de tri',
        'Order by' => 'Trier par',
        'Limit' => 'Limite',
        'Ticketlist' => 'Liste des tickets',
        'ascending' => 'ascendant',
        'descending' => 'descendant',
        'First Lock' => 'Premier verrou',
        'Evaluation by' => 'Evaluation par',
        'Total Time' => 'Temps Total',
        'Ticket Average' => 'Moyenne des tickets',
        'Ticket Min Time' => 'Temps minimum du ticket',
        'Ticket Max Time' => 'Temps maximum du ticket',
        'Number of Tickets' => 'Nombre de tickets',
        'Article Average' => 'Moyenne des articles',
        'Article Min Time' => 'Temps minimum des articles',
        'Article Max Time' => 'Temps maximum des articles',
        'Number of Articles' => 'Nombre d\'articles',
        'Accounted time by Agent' => 'Temps passé par opérateur',
        'Ticket/Article Accounted Time' => 'Temps passé par Ticket/Article',
        'TicketAccountedTime' => 'Temps passé sur le ticket',
        'Ticket Create Time' => 'Heure de création du ticket',
        'Ticket Close Time' => 'Heure de fermeture du ticket',

        # Template: AAATicket
        'Status View' => 'Vue des statuts',
        'Bulk' => 'Combiné',
        'Lock' => 'Verrouiller',
        'Unlock' => 'Déverrouiller',
        'History' => 'Historique',
        'Zoom' => 'Détails',
        'Age' => 'Âge',
        'Bounce' => 'Renvoyer',
        'Forward' => 'Transmettre',
        'From' => 'De',
        'To' => 'À',
        'Cc' => 'Copie ',
        'Bcc' => 'Copie Invisible',
        'Subject' => 'Sujet',
        'Move' => 'Déplacer',
        'Queue' => 'File',
        'Queues' => 'Files',
        'Priority' => 'Priorité',
        'Priorities' => 'Priorités',
        'Priority Update' => 'Mise à jour de la priorité',
        'Priority added!' => '',
        'Priority updated!' => '',
        'Signature added!' => '',
        'Signature updated!' => '',
        'SLA' => 'SLA',
        'Service Level Agreement' => 'Contrat de niveau de support',
        'Service Level Agreements' => 'Contrats de niveau de support',
        'Service' => 'Service',
        'Services' => 'Services',
        'State' => 'État',
        'States' => 'États',
        'Status' => 'Statut',
        'Statuses' => 'Status',
        'Ticket Type' => 'Type de ticket',
        'Ticket Types' => 'Types de tickets',
        'Compose' => 'Composer',
        'Pending' => 'En attente',
        'Owner' => 'Propriétaire',
        'Owner Update' => 'Mise à jour du propriétaire',
        'Responsible' => 'Responsable',
        'Responsible Update' => 'Mise à jour du responsable',
        'Sender' => 'émetteur',
        'Article' => 'Article',
        'Ticket' => 'Ticket',
        'Createtime' => 'Création du',
        'plain' => 'tel quel',
        'Email' => 'Courriel',
        'email' => 'courriel',
        'Close' => 'Fermer',
        'Action' => 'Action',
        'Attachment' => 'Pièce jointe',
        'Attachments' => 'Pièces jointes',
        'This message was written in a character set other than your own.' =>
            'Ce courriel a été écrit dans un jeu de caractères différent du vôtre.',
        'If it is not displayed correctly,' => 'S\'il n\'est pas affiché correctement',
        'This is a' => 'Ceci est un',
        'to open it in a new window.' => 'L\'ouvrir dans une nouvelle fenêtre',
        'This is a HTML email. Click here to show it.' => 'Ceci est un courriel au format HTML ; cliquer ici pour l\'afficher.',
        'Free Fields' => 'Champs libres',
        'Merge' => 'Fusionner',
        'merged' => 'Fusionné',
        'closed successful' => 'clôture (résolue)',
        'closed unsuccessful' => 'clôture (non résolue)',
        'Locked Tickets Total' => 'Total des tickets verrouillés',
        'Locked Tickets Reminder Reached' => '',
        'Locked Tickets New' => '',
        'Responsible Tickets Total' => '',
        'Responsible Tickets New' => '',
        'Responsible Tickets Reminder Reached' => '',
        'Watched Tickets Total' => '',
        'Watched Tickets New' => '',
        'Watched Tickets Reminder Reached' => '',
        'All tickets' => 'tous les tickets',
        'Available tickets' => '',
        'Escalation' => 'Remontée',
        'last-search' => 'dernière-recherche',
        'QueueView' => 'Vue file',
        'Ticket Escalation View' => 'Vue des remontées du ticket',
        'Message from' => '',
        'End message' => '',
        'Forwarded message from' => '',
        'End forwarded message' => '',
        'new' => 'nouveau',
        'open' => 'ouvrir',
        'Open' => 'Ouvert',
        'Open tickets' => '',
        'closed' => 'fermé',
        'Closed' => 'Fermé',
        'Closed tickets' => '',
        'removed' => 'supprimé',
        'pending reminder' => 'Attente du rappel',
        'pending auto' => 'En attente auto',
        'pending auto close+' => 'En attente de la fermeture automatique(+)',
        'pending auto close-' => 'En attente de la fermeture automatique(-)',
        'email-external' => 'courriel externe',
        'email-internal' => 'courriel interne',
        'note-external' => 'Note externe',
        'note-internal' => 'Note interne',
        'note-report' => 'Note rapport',
        'phone' => 'téléphone',
        'sms' => 'SMS',
        'webrequest' => 'Requête par le web',
        'lock' => 'verrouiller',
        'unlock' => 'déverrouiller',
        'very low' => 'très basse',
        'low' => 'confort de fonctionnement',
        'normal' => 'normal',
        'high' => 'important',
        'very high' => 'très haut',
        '1 very low' => '1 très bas',
        '2 low' => '2 bas',
        '3 normal' => '3 normal',
        '4 high' => '4 important',
        '5 very high' => '5 très important',
        'auto follow up' => '',
        'auto reject' => '',
        'auto remove' => '',
        'auto reply' => '',
        'auto reply/new ticket' => '',
        'Ticket "%s" created!' => 'Le ticket %s a été créé !',
        'Ticket Number' => 'Numéro de ticket',
        'Ticket Object' => 'Objet ticket',
        'No such Ticket Number "%s"! Can\'t link it!' => 'Pas de ticket numéro "%s" ! Impossible de le lier !',
        'You don\'t have write access to this ticket.' => '',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            '',
        'Ticket selected.' => '',
        'Ticket is locked by another agent.' => '',
        'Ticket locked.' => '',
        'Don\'t show closed Tickets' => 'Ne pas montrer les tickets cloturés',
        'Show closed Tickets' => 'Voir les tickets cloturés',
        'New Article' => 'Nouvel Article',
        'Unread article(s) available' => '',
        'Remove from list of watched tickets' => '',
        'Add to list of watched tickets' => '',
        'Email-Ticket' => 'Écrire un courriel',
        'Create new Email Ticket' => 'Créer un nouveau ticket en envoyant un courriel',
        'Phone-Ticket' => 'Vue téléphone',
        'Search Tickets' => 'Recherche de tickets',
        'Edit Customer Users' => 'Editer clients',
        'Edit Customer Company' => 'Éditer l\'entreprise cliente',
        'Bulk Action' => 'Action groupée',
        'Bulk Actions on Tickets' => 'Action groupées sur les tickets',
        'Send Email and create a new Ticket' => 'Envoyer un courriel et créer un nouveau Ticket',
        'Create new Email Ticket and send this out (Outbound)' => 'Créer un ticket Courriel et l\'envoyer (Sortant)',
        'Create new Phone Ticket (Inbound)' => 'Créer un ticket Téléphone (Entrant)',
        'Overview of all open Tickets' => 'Vue de tous les Tickets',
        'Locked Tickets' => 'Tickets verrouillés',
        'My Locked Tickets' => 'Mes tickets vérrouillés',
        'My Watched Tickets' => 'Mes tickets surveillés',
        'My Responsible Tickets' => 'Mes tickets en responsabilité',
        'Watched Tickets' => 'Tickets surveillés',
        'Watched' => 'Surveillé',
        'Watch' => 'Surveiller',
        'Unwatch' => 'Arrêter le suivi',
        'Lock it to work on it' => '',
        'Unlock to give it back to the queue' => '',
        'Show the ticket history' => '',
        'Print this ticket' => '',
        'Print this article' => '',
        'Split this article' => '',
        'Forward article via mail' => '',
        'Change the ticket priority' => '',
        'Change the ticket free fields!' => 'Changer les champs libres du ticket !',
        'Link this ticket to other objects' => '',
        'Change the owner for this ticket' => '',
        'Change the  customer for this ticket' => '',
        'Add a note to this ticket' => '',
        'Merge into a different ticket' => '',
        'Set this ticket to pending' => '',
        'Close this ticket' => '',
        'Look into a ticket!' => 'Voir le détail du ticket !',
        'Delete this ticket' => '',
        'Mark as Spam!' => 'Marquer comme Spam !',
        'My Queues' => 'Mes files',
        'Shown Tickets' => 'Tickets affichés',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Votre courriel avec le numéro de ticket "<OTRS_TICKET>" a été fusionné avec le ticket numéro "<OTRS_MERGE_TO_TICKET>".',
        'Ticket %s: first response time is over (%s)!' => 'Ticket %s: le temps imparti pour la première réponse est dépassé (%s) !',
        'Ticket %s: first response time will be over in %s!' => 'Ticket %s: le temps imparti pour la première réponse sera dépassé dans %s !',
        'Ticket %s: update time is over (%s)!' => 'Ticket %s: le temps imparti pour la révision est dépassé (%s) !',
        'Ticket %s: update time will be over in %s!' => 'Ticket %s: le temps imparti pour la révision sera dépassé dans %s !',
        'Ticket %s: solution time is over (%s)!' => 'Ticket %s: le temps imparti pour fournir une solution est dépassé (%s) !',
        'Ticket %s: solution time will be over in %s!' => 'Ticket %s: le temps imparti pour fournir une solution sera dépassé dans %s !',
        'There are more escalated tickets!' => 'Il y a d\'autres tickets en escalade !',
        'Plain Format' => 'Format texte',
        'Reply All' => 'Répondre à tous',
        'Direction' => '',
        'Agent (All with write permissions)' => '',
        'Agent (Owner)' => '',
        'Agent (Responsible)' => '',
        'New ticket notification' => 'Notification de nouveau ticket',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Me prévenir si il y a un nouveau ticket dans une de "Mes files".',
        'Send new ticket notifications' => '',
        'Ticket follow up notification' => '',
        'Ticket lock timeout notification' => 'Prévenir du dépassement du délai d\'un verrou',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Me prévenir si un ticket est déverrouillé par le système',
        'Send ticket lock timeout notifications' => '',
        'Ticket move notification' => 'Notification de déplacement de Ticket',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Me prévenir si un ticket est déplacé dans une de "Mes files".',
        'Send ticket move notifications' => '',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            '',
        'Custom Queue' => 'File d\'attente personnalisée',
        'QueueView refresh time' => 'Temps de rafraîchissement de la vue des files',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            '',
        'Refresh QueueView after' => 'Rafraichir la vue des files après',
        'Screen after new ticket' => 'Écran après un nouveau ticket',
        'Show this screen after I created a new ticket' => '',
        'Closed Tickets' => 'Tickets fermés',
        'Show closed tickets.' => 'Voir les tickets fermés',
        'Max. shown Tickets a page in QueueView.' => 'Nombre maximum de tickets affichés sur la page de la vue d\'une file',
        'Ticket Overview "Small" Limit' => '',
        'Ticket limit per page for Ticket Overview "Small"' => '',
        'Ticket Overview "Medium" Limit' => '',
        'Ticket limit per page for Ticket Overview "Medium"' => '',
        'Ticket Overview "Preview" Limit' => '',
        'Ticket limit per page for Ticket Overview "Preview"' => '',
        'Ticket watch notification' => 'Notification de surveillance de Ticket',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            '',
        'Send ticket watch notifications' => '',
        'Out Of Office Time' => '',
        'New Ticket' => 'Nouveau ticket',
        'Create new Ticket' => 'Création d\'un nouveau ticket',
        'Customer called' => 'Client appellé',
        'phone call' => 'Appel téléphonique',
        'Phone Call Outbound' => '',
        'Phone Call Inbound' => '',
        'Reminder Reached' => 'Rappel atteint',
        'Reminder Tickets' => 'Tickets de rappel',
        'Escalated Tickets' => 'Tickets escaladés',
        'New Tickets' => 'Nouveaux tickets',
        'Open Tickets / Need to be answered' => 'Tickets ouverts en attente de réponse',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            '',
        'All new tickets, these tickets have not been worked on yet' => '',
        'All escalated tickets' => '',
        'All tickets with a reminder set where the reminder date has been reached' =>
            '',
        'Archived tickets' => '',
        'Unarchived tickets' => '',
        'History::Move' => 'Le ticket a été déplacé dans la file "%s" (%s) - Ancienne file: "%s" (%s).',
        'History::TypeUpdate' => 'Type positionné à %s (ID=%s).',
        'History::ServiceUpdate' => 'Service positionné à %s (ID=%s).',
        'History::SLAUpdate' => 'SLA positionné à %s (ID=%s).',
        'History::NewTicket' => 'Un nouveau ticket a été crée: [%s] created (Q=%s;P=%s;S=%s).',
        'History::FollowUp' => 'Un suivi du ticket [%s]. %s',
        'History::SendAutoReject' => 'Rejet automatique envoyé à "%s".',
        'History::SendAutoReply' => 'Réponse automatique envoyée à "%s".',
        'History::SendAutoFollowUp' => 'Suivi automatique envoyé à "%s".',
        'History::Forward' => 'Transféré vers "%s".',
        'History::Bounce' => 'Redirigé vers "%s".',
        'History::SendAnswer' => 'Courriel envoyé à "%s".',
        'History::SendAgentNotification' => '"%s"-notification envoyé à "%s".',
        'History::SendCustomerNotification' => 'Notification envoyé à "%s".',
        'History::EmailAgent' => 'Courriel envoyé au client.',
        'History::EmailCustomer' => 'Ajout d\'une adresse mèl. %s',
        'History::PhoneCallAgent' => 'L\'opérateur a appellé le client.',
        'History::PhoneCallCustomer' => 'Le client nous a appellé.',
        'History::AddNote' => 'Ajout d\'une note (%s)',
        'History::Lock' => 'Ticket verrouillé.',
        'History::Unlock' => 'Ticket déverrouillé.',
        'History::TimeAccounting' => 'Temps passé sur l\'action: %s . Total du temps passé pour ce ticket: %s unité(s).',
        'History::Remove' => 'Supprimer %s',
        'History::CustomerUpdate' => 'Mise à jour: %s',
        'History::PriorityUpdate' => 'Changement de priorité de "%s" (%s) pour "%s" (%s).',
        'History::OwnerUpdate' => 'Le nouveau propriétaire est "%s" (ID=%s).',
        'History::LoopProtection' => 'Protection anti-boucle ! Pas d\'auto réponse envoyé à "%s".',
        'History::Misc' => '%s',
        'History::SetPendingTime' => 'Mise à jour: %s',
        'History::StateUpdate' => 'État Avant: "%s" Après: "%s"',
        'History::TicketDynamicFieldUpdate' => 'Mise à jour: %s=%s;%s=%s;',
        'History::WebRequestCustomer' => 'Requête du client via le web.',
        'History::TicketLinkAdd' => 'Ajout d\'un lien vers le ticket "%s".',
        'History::TicketLinkDelete' => 'Suppression du lien vers le ticket "%s".',
        'History::Subscribe' => 'Abonnement pour l\'utilisateur "%s".',
        'History::Unsubscribe' => 'Désabonnement pour l\'utilisateur "%s".',
        'History::SystemRequest' => 'Requête système',
        'History::ResponsibleUpdate' => 'Mise à jour du responsable',
        'History::ArchiveFlagUpdate' => '',

        # Template: AAAWeekDay
        'Sun' => 'Dim',
        'Mon' => 'Lun',
        'Tue' => 'Mar',
        'Wed' => 'Mer',
        'Thu' => 'Jeu',
        'Fri' => 'Ven',
        'Sat' => 'Sam',

        # Template: AdminAttachment
        'Attachment Management' => 'Gestion des pièces jointes',
        'Actions' => 'Actions',
        'Go to overview' => 'Aller au résumé',
        'Add attachment' => '',
        'List' => 'Lister',
        'Validity' => '',
        'No data found.' => 'Aucune donnée trouvée',
        'Download file' => 'Télécharger fichier',
        'Delete this attachment' => 'Supprimer cet attachement',
        'Add Attachment' => 'Ajouter attachement',
        'Edit Attachment' => 'Editer attachement',
        'This field is required.' => 'Ce champ est requis',
        'or' => 'ou',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Gestion des réponses automatiques',
        'Add auto response' => 'Ajouter réponse automatique',
        'Add Auto Response' => 'Ajouter Réponse Automatique',
        'Edit Auto Response' => 'Editer Réponse Automatique',
        'Response' => 'Réponse',
        'Auto response from' => 'Réponse automatique de',
        'Reference' => 'Référence',
        'You can use the following tags' => 'Vous pouvez utiliser les tags suivants',
        'To get the first 20 character of the subject.' => 'Pour avoir les 20 premiers caractères du sujet',
        'To get the first 5 lines of the email.' => 'Pour avoir les 5 premières lignes du courriel',
        'To get the realname of the sender (if given).' => 'Pour avoir le nom de l\'expéditeur s\'il est fourni.',
        'To get the article attribute' => 'Pour avoir l\'attribut de l\'article',
        ' e. g.' => 'i.e.',
        'Options of the current customer user data' => 'Options des données du client actuel',
        'Ticket owner options' => 'Options du propriétaire du ticket',
        'Ticket responsible options' => 'Options du responsable du ticket',
        'Options of the current user who requested this action' => 'Options de l\'utilisateur actuel qui a demandé cette action',
        'Options of the ticket data' => 'Options des données du ticket',
        'Config options' => 'Options de confguration',
        'Example response' => 'Exemple de réponse',

        # Template: AdminCustomerCompany
        'Customer Company Management' => 'Gestion des services clients',
        'Wildcards like \'*\' are allowed.' => '',
        'Add customer company' => 'Ajouter une entreprise cliente',
        'Please enter a search term to look for customer companies.' => 'Merci d\'entrer un motif de recherche pour chercher les entreprises clients',
        'Add Customer Company' => 'Ajouter un client au service',

        # Template: AdminCustomerUser
        'Customer Management' => 'Gestion des clients',
        'Add customer' => 'Ajouter client',
        'Select' => 'Sélectionner',
        'Hint' => '',
        'Customer will be needed to have a customer history and to login via customer panel.' =>
            'Le client devra avoir un historique et se connecter via le panneau utilisateur',
        'Please enter a search term to look for customers.' => 'Merci d\'entrer un motif pour rechercher des clients',
        'Last Login' => 'Dernière connexion',
        'Add Customer' => 'Ajouter client',
        'Edit Customer' => 'Editer client',
        'This field is required and needs to be a valid email address.' =>
            '',
        'This email address is not allowed due to the system configuration.' =>
            '',
        'This email address failed MX check.' => '',
        'DNS problem, please check your configuration and the error log.' =>
            '',
        'The syntax of this email address is incorrect.' => '',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => 'Gérer les relations Client-Group',
        'Notice' => 'Note',
        'This feature is disabled!' => 'Cette fonctionnalité est désactivée !',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Utiliser cette fonction uniquement si vous shouhaitez définir des permissions de groupe pour les clients',
        'Enable it here!' => 'Activez la ici !',
        'Search for customers.' => '',
        'Edit Customer Default Groups' => 'Editer les groupes par défault client',
        'These groups are automatically assigned to all customers.' => 'Ces groupes sont automatiquement assignés à tous les clients',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            '',
        'Filter for Groups' => 'Filtre pour les Groupes',
        'Select the customer:group permissions.' => 'Selectionner les permissions client::groupe',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Si rien n\'est sélectionné, alors il n\'y aura aucune permission dans ce groupe (les tickets ne seront pas accessibles au client).',
        'Search Result:' => 'Résultat de recherche:',
        'Customers' => 'Clients',
        'Groups' => 'Groupes',
        'No matches found.' => 'Aucun résultat.',
        'Change Group Relations for Customer' => '',
        'Change Customer Relations for Group' => '',
        'Toggle %s Permission for all' => 'Sélectionner la Permission %s pour tous',
        'Toggle %s permission for %s' => 'Sélectionner la permission %s pour %s',
        'Customer Default Groups:' => 'Groupes par défaut du client',
        'No changes can be made to these groups.' => 'Aucun changement possible pour ces groupes',
        'ro' => 'lecture seule',
        'Read only access to the ticket in this group/queue.' => 'Accès en lecture seulement aux tickets de cette file/groupe.',
        'rw' => 'lecture/écriture',
        'Full read and write access to the tickets in this group/queue.' =>
            'Accès complet en lecture et écriture aux tickets dans cette file/groupe.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => 'Gérer les Relations Client-Services',
        'Edit default services' => 'Editer les services par défaut',
        'Filter for Services' => 'Filtre pour les Services',
        'Allocate Services to Customer' => '',
        'Allocate Customers to Service' => '',
        'Toggle active state for all' => 'Sélectionner l\'état actif pour tous',
        'Active' => 'Actif',
        'Toggle active state for %s' => 'Sélectionner l\'état actif pour %s',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => '',
        'Add new field for object' => '',
        'To add a new field, select the field type form one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            '',
        'Dynamic Fields List' => '',
        'Dynamic fields per page' => '',
        'Label' => '',
        'Order' => 'Ordre',
        'Object' => 'Objet',

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
        'Default value' => 'Valeur par défaut',
        'This is the default value for this field.' => '',
        'Save' => 'Sauver',

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
        'Key' => 'Clé',
        'Value' => 'Valeur',
        'Remove value' => '',
        'Add value' => '',
        'Add Value' => '',
        'Add empty value' => '',
        'Activate this option to create an empty selectable value.' => '',
        'Translatable values' => '',
        'If you activate this option the values will be translated to the user defined language.' =>
            '',
        'Note' => 'Note',
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
        'Admin Notification' => 'Notification des administrateurs',
        'With this module, administrators can send messages to agents, group or role members.' =>
            '',
        'Create Administrative Message' => '',
        'Your message was sent to' => 'Votre message a éét envoyé à',
        'Send message to users' => 'Envoyer message aux utilisateurs',
        'Send message to group members' => 'Envoyer message aux membre du gorupe',
        'Group members need to have permission' => 'Les membres du groupe ont besoin de la permission',
        'Send message to role members' => 'Envoyer message aux membres du rôle',
        'Also send to customers in groups' => 'Envoyer aussi aux clients dans les groupes',
        'Body' => 'Corps',
        'Send' => 'Envoyer',

        # Template: AdminGenericAgent
        'Generic Agent' => 'Agent générique',
        'Add job' => 'Ajouter tâche',
        'Last run' => 'Dernier lancement',
        'Run Now!' => 'Lancer maintenant !',
        'Delete this task' => 'Supprimer cette tâche',
        'Run this task' => 'Exécuter cette tâche',
        'Job Settings' => 'Configuration de la tâche',
        'Job name' => 'Nom de la tâche',
        'Currently this generic agent job will not run automatically.' =>
            'Actuellement, cet agent générique ne s\'exécutera pas automatiquement',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Pour permettre l\'exécution automatique, sélectionnez au moins une valeur dans minutes, heures et jours !',
        'Schedule minutes' => 'Planification Minutes',
        'Schedule hours' => 'Planification Heures',
        'Schedule days' => 'Planification Jours',
        'Toggle this widget' => '',
        'Ticket Filter' => 'Filtre ticket',
        '(e. g. 10*5155 or 105658*)' => '(ex: 10*5155 or 105658*)',
        '(e. g. 234321)' => '(ex: 234321)',
        'Customer login' => 'Login Client',
        '(e. g. U5150)' => '(ex: U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Recherche plein texte dans article (i.e. "Mar*in" ou "Baue*").',
        'Agent' => 'Opérateur',
        'Ticket lock' => 'Verrouillage ticket',
        'Create times' => 'Dates de création',
        'No create time settings.' => 'Pas de critère de date de création',
        'Ticket created' => 'Ticket créé',
        'Ticket created between' => 'Ticket créé entre le',
        'Change times' => '',
        'No change time settings.' => 'Paramètrage de non modification d\'heure',
        'Ticket changed' => 'Ticket modifié',
        'Ticket changed between' => 'Ticket modifié entre',
        'Close times' => 'Dates de clotûre',
        'No close time settings.' => 'Pas de paramètre de temps de fermeture',
        'Ticket closed' => 'Ticket fermé',
        'Ticket closed between' => 'Ticket fermé entre',
        'Pending times' => 'Dates de mise en attente',
        'No pending time settings.' => 'pas de critère de date d\'échéance',
        'Ticket pending time reached' => 'Date d\'échéance atteinte le',
        'Ticket pending time reached between' => 'Date d\'échéance atteinte entre le',
        'Escalation times' => 'Dates d\'escalade',
        'No escalation time settings.' => 'Pas de paramètres de temps d\'escalade',
        'Ticket escalation time reached' => 'Temps d\'escalade du ticket atteinte',
        'Ticket escalation time reached between' => 'Temps d\'escalade du ticket atteinte entre',
        'Escalation - first response time' => 'Escalade - Date de première réponse',
        'Ticket first response time reached' => 'Premier temps de réponse du ticket atteint',
        'Ticket first response time reached between' => 'Premier temps de réponse du ticket atteint entre',
        'Escalation - update time' => 'Escalade - Date de mise à jour',
        'Ticket update time reached' => 'Temps de mise à jour du ticket atteint',
        'Ticket update time reached between' => 'Temps de mise à jour du ticket atteint entre',
        'Escalation - solution time' => 'Escalade - Date de solution',
        'Ticket solution time reached' => 'Temps de résolution du ticket atteint',
        'Ticket solution time reached between' => 'Temps de résolution du ticket atteint entre',
        'Archive search option' => 'Option de recherche Archive',
        'Ticket Action' => 'Action sur Ticket',
        'Set new service' => 'Définir un nouveau service',
        'Set new Service Level Agreement' => 'Définir un nouveau contrat de niveau de support ',
        'Set new priority' => 'Définir une nouvelle priorité',
        'Set new queue' => 'Définir une nouvelle file',
        'Set new state' => 'Définir un nouvel état',
        'Set new agent' => 'Définir un nouveà l\'opérateur',
        'new owner' => 'Nouveau propriétaire',
        'new responsible' => '',
        'Set new ticket lock' => 'Placer un nouveau verrou sur le ticket',
        'New customer' => 'Nouveau client',
        'New customer ID' => 'Nouvel ID client',
        'New title' => 'Nouveau titre',
        'New type' => 'Nouveau type',
        'New Dynamic Field Values' => '',
        'Archive selected tickets' => 'Archiver tickets sélectionnés',
        'Add Note' => 'Ajouter une note',
        'Time units' => 'Unité de temps',
        ' (work units)' => ' Unité de travail',
        'Ticket Commands' => '',
        'Send agent/customer notifications on changes' => 'Envoyer des notifications à l\'opérateur/au client sur changement',
        'CMD' => 'CMD',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Cette commande sera exécuté. ARG[0] sera le numéro du ticket et ARG[1] son identifiant.',
        'Delete tickets' => 'Effacer les tickets',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Attention: Tous les tickets impactés seront supprimés de la base de donnée et ne pourront être restaurés!',
        'Execute Custom Module' => 'Exécuter le Module Client',
        'Param %s key' => '',
        'Param %s value' => '',
        'Save Changes' => '',
        'Results' => 'Résultat',
        '%s Tickets affected! What do you want to do?' => '% Tickets impactés! Que voulez vous faire?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Attention: Vous devriez utiliser l\'option DELETE. Tous les tickets effacés seront perdus!',
        'Edit job' => 'Editer tâche',
        'Run job' => 'Exécuter tâche',
        'Affected Tickets' => 'Tickets impactés',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => '',
        'Web Services' => '',
        'Debugger' => '',
        'Go back to web service' => '',
        'Clear' => '',
        'Do you really want to clear the debug log of this web service?' =>
            '',
        'Request List' => '',
        'Time' => 'Date et heure',
        'Remote IP' => '',
        'Loading' => 'En cours de chargement',
        'Select a single request to see its details.' => '',
        'Filter by type' => '',
        'Filter from' => '',
        'Filter to' => '',
        'Filter by remote IP' => '',
        'Refresh' => 'Rafraîchir',
        'Request Details' => '',
        'An error occurred during communication.' => '',
        'Show or hide the content' => 'Montrer ou cacher le contenu',
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
        'Import' => 'Importer',
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
            'ATTENTION: Lorsque vous modifier le nom du group \'admin\', avant de faire les changements appropriés dans SysConfig, vous serez déconnecté du panneau d\'administration. Si cela arrive, veuillez renommer à nouveau le groupe admin par une requête SQL.',
        'Group Management' => 'Administration des groupes',
        'Add group' => 'Ajouter groupe',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Le groupe admin permet d\'accéder à la zone d\'administration et le groupe stats à la zone de statistiques.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Créer de nouveux groupes pour gérer des permissions d\'accès pour les différents groupes de opérateurs (i.e. achats, support, ventes,...). ',
        'It\'s useful for ASP solutions. ' => 'C\'est utilie pour les solutions ASP',
        'Add Group' => 'Ajouter un groupe',
        'Edit Group' => 'Editer Groupe',

        # Template: AdminLog
        'System Log' => 'Journaux du Système',
        'Here you will find log information about your system.' => 'Vous trouverez ici les informations de log sur votre système',
        'Hide this message' => '',
        'Recent Log Entries' => '',

        # Template: AdminMailAccount
        'Mail Account Management' => 'Gestion du compte de messagerie',
        'Add mail account' => 'Ajouter compte mail',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Tous les courriels entrants avec un compte associé seront répartis dans la file sélectionnée !',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Si votre compte est vérifié, les ent&ecirc;tes X-OTRS (pour les priorités,...) seront utilisés !',
        'Host' => 'Hôte',
        'Delete account' => 'Supprimer compte',
        'Fetch mail' => 'Parcourir mail',
        'Add Mail Account' => 'Aouter compte mail',
        'Example: mail.example.com' => '',
        'IMAP Folder' => '',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            '',
        'Trusted' => 'Vérifié',
        'Dispatching' => 'Répartition',
        'Edit Mail Account' => 'Editer compte mail',

        # Template: AdminNavigationBar
        'Admin' => 'Administrateur',
        'Agent Management' => 'Gestion Opérateur',
        'Queue Settings' => 'Configuration File',
        'Ticket Settings' => 'Configuration Ticket',
        'System Administration' => 'Administration Système',

        # Template: AdminNotification
        'Notification Management' => 'Gestion des notifications',
        'Select a different language' => '',
        'Filter for Notification' => 'Filtre pour Notification',
        'Notifications are sent to an agent or a customer.' => 'Des notifications sont envoyées à un opérateur ou à un client.',
        'Notification' => 'Notification',
        'Edit Notification' => 'Editer Notification',
        'e. g.' => 'i.e.',
        'Options of the current customer data' => 'Options des données du cient actuel',

        # Template: AdminNotificationEvent
        'Add notification' => 'Ajouter notification',
        'Delete this notification' => 'Supprimer cette notification',
        'Add Notification' => 'Ajouter Notification',
        'Recipient groups' => 'Groupes destinataires',
        'Recipient agents' => 'Opérateurs destinataires',
        'Recipient roles' => 'Rôles destinaires',
        'Recipient email addresses' => 'Adresses email destinataires',
        'Article type' => 'Type d\'article',
        'Only for ArticleCreate event' => 'Seulement pour l\'évenement CréationArticle',
        'Subject match' => 'Correspondance du sujet',
        'Body match' => 'Correspondance du corps du courriel',
        'Include attachments to notification' => 'Inclure les attachements à la notification',
        'Notification article type' => '',
        'Only for notifications to specified email addresses' => '',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Pour avoir les 20 premiers caractères du sujet (du dernier article de l\'opérateur).',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Pour avoir les 5 premières ligne du corps (du dernier article de l\'opérateur).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Pour avoir les 20 premiers caractères du sujet (du dernier article du client).',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Pour avoir les 5 premières lignes du sujet (du dernier article du client).',

        # Template: AdminPGP
        'PGP Management' => 'Gestion de PGP',
        'Use this feature if you want to work with PGP keys.' => '',
        'Add PGP key' => 'Ajouter clé PGP',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'Dans ce cas vous pouvez directement éditer le trousseau configuré dans SysConfig.',
        'Introduction to PGP' => '',
        'Result' => 'Résultat',
        'Identifier' => 'Identifiant',
        'Bit' => 'Bit',
        'Fingerprint' => 'Empreinte',
        'Expires' => 'Expiration',
        'Delete this key' => 'Supprimer cette clé',
        'Add PGP Key' => 'Ajouter Clé PGP',
        'PGP key' => '',

        # Template: AdminPackageManager
        'Package Manager' => 'Gestionnaire de paquet',
        'Uninstall package' => 'Désinstaller package',
        'Do you really want to uninstall this package?' => 'Voulez-vous vraiment déinstaller ce paquet ?',
        'Reinstall package' => 'Réinstaller package',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'Voulez-vous vraiment réinstaller ce package? Un quelconque changement manuel sera perdu. ',
        'Continue' => 'Continuer',
        'Install' => 'Installation',
        'Install Package' => 'Installer Package',
        'Update repository information' => 'Mettre à jour les informations du dépot',
        'Did not find a required feature? OTRS Group provides their subscription customers with exclusive Add-Ons:' =>
            '',
        'Online Repository' => 'Dépot en ligne',
        'Vendor' => 'Vendeur',
        'Module documentation' => 'Documentation du module',
        'Upgrade' => 'Mise à jour',
        'Local Repository' => 'Dépôt local',
        'Uninstall' => 'Déinstallation',
        'Reinstall' => 'Ré-installation',
        'Download package' => 'Télécharger package',
        'Rebuild package' => 'Reconsruire package',
        'Metadata' => 'Metadata',
        'Change Log' => 'Log de modification',
        'Date' => 'Date',
        'List of Files' => 'iListe de fichiers',
        'Permission' => 'Droits',
        'Download' => 'Téléchargement',
        'Download file from package!' => 'Télécharger le fichier depuis le paquet !',
        'Required' => 'Obligatoire',
        'PrimaryKey' => 'Clé primaire',
        'AutoIncrement' => 'Auto incrémentation',
        'SQL' => 'SQL',
        'File differences for file %s' => 'Différences de fichier pour le fichier %s',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Enregistrement des indicateurs de performance',
        'This feature is enabled!' => 'Cette fonctionnalité est activée',
        'Just use this feature if you want to log each request.' => 'N\'employer cette fonction que si vous voulez enregitrer chaque requête',
        'Activating this feature might affect your system performance!' =>
            'Activer cette fonctionnalité peut avoir un impact sur les performances de votre système !',
        'Disable it here!' => 'Désactivez là ici !',
        'Logfile too large!' => 'Fichier de log trop grand !',
        'The logfile is too large, you need to reset it' => 'Le fichier de log est trop grand, vous devez le réinitialiser',
        'Overview' => 'Aperçu',
        'Range' => 'Plage',
        'Interface' => 'Interface',
        'Requests' => 'Requêtes',
        'Min Response' => 'Temps de réponse minimum',
        'Max Response' => 'Temps de réponse maximun',
        'Average Response' => 'Temps de réponse moyen',
        'Period' => 'Période',
        'Min' => 'Min',
        'Max' => 'Max',
        'Average' => 'Moyenne',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'Gestion des filtres PostMaster',
        'Add filter' => 'Ajouter filtre',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            '',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Si vous voulez tester uniquement l\'adresse électronique, utiliser EMAILADDRESS:info@example.com dans De, À ou Copie.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            '',
        'Delete this filter' => 'Supprimer ce filtre',
        'Add PostMaster Filter' => 'Ajouter un filtre PostMaster',
        'Edit PostMaster Filter' => 'EditerFiltre PostMaster',
        'Filter name' => '',
        'The name is required.' => '',
        'Stop after match' => 'Stopper après correspondance',
        'Filter Condition' => 'Condition de filtre',
        'The field needs to be a valid regular expression or a literal word.' =>
            '',
        'Set Email Headers' => 'Mettre les entêtes email',
        'The field needs to be a literal word.' => '',

        # Template: AdminPriority
        'Priority Management' => 'Gestion de la priorité',
        'Add priority' => 'Ajouter priorité',
        'Add Priority' => 'Ajouter la priorité',
        'Edit Priority' => 'Editer priorité',

        # Template: AdminQueue
        'Manage Queues' => 'Gérer les Files',
        'Add queue' => 'Ajouter une file',
        'Add Queue' => 'Ajouter une File',
        'Edit Queue' => 'Editer une File',
        'Sub-queue of' => 'Sous-file de',
        'Unlock timeout' => 'Délai du déverrouillage',
        '0 = no unlock' => '0 = pas de verrouillage',
        'Only business hours are counted.' => 'Seules les plages horaires de bureau sont prises en compte.',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Si un opérateur vérouille un ticket et ne le ferme pas avant le délai de dévérouillage, le ticket sera dévérouillé et sera disponible pour un autre opérateur.',
        'Notify by' => 'Notification par',
        '0 = no escalation' => '0 = pas de remontée du ticket',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Si un contact client n\'est pas ajouté à un nouveau ticket, soit par email externe ou téléphone, avant que le temps défini ici expire, le ticket sera escaladé.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            '',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Si le ticket n\'est pas clôturé avant que le délai défini ici n\'expire, le ticket est escaladé.',
        'Follow up Option' => 'Option des suivis',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Défini si le suivi des tickets clôturés doit réouvrir le ticket, être rejeté ou créer un nouveau ticket.',
        'Ticket lock after a follow up' => 'Ticket verrouillé après un suivi',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Si le tiket est clos and que le client envoie un suivi, le ticket sera vérouillé sur l\'ancien propriétaire.',
        'System address' => 'Adresse Système',
        'Will be the sender address of this queue for email answers.' => 'Sera l\'adresse d\'expédition pour les réponses par courriel pour cette file.',
        'Default sign key' => 'Clé de signature par défaut',
        'The salutation for email answers.' => 'La formule de politesse pour les réponses par courriel',
        'The signature for email answers.' => 'La signature pour les réponses par courriel',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => 'Gérer les relations entre les files et les réponses automatiques',
        'Filter for Queues' => 'Filtre pour les files',
        'Filter for Auto Responses' => 'Filtre pour les réponses automatiques',
        'Auto Responses' => 'Réponses automatiques',
        'Change Auto Response Relations for Queue' => 'Modifier les réponses automatiques pour la file',
        'settings' => 'Paramètres',

        # Template: AdminQueueResponses
        'Manage Response-Queue Relations' => 'Gérer les relations entre les files et les réponses',
        'Filter' => 'Filtre',
        'Filter for Responses' => 'Filtre pour réponses',
        'Responses' => 'Réponses',
        'Change Queue Relations for Response' => 'Modifier les files pour la réponse',
        'Change Response Relations for Queue' => 'Modifier les réponses pour la file',

        # Template: AdminResponse
        'Manage Responses' => 'Gérer les Réponses',
        'Add response' => 'Ajouter réponse',
        'A response is default text to write faster answer (with default text) to customers.' =>
            'Une réponse est un texte par défaut destiné à rédiger plus rapidement des réponses standards aux clients.',
        'Don\'t forget to add a new response a queue!' => 'Ne pas oublier d\'affecter une file à une nouvelle réponse !',
        'Delete this entry' => 'Supprimer cette entrée',
        'Add Response' => 'Ajouter Réponse',
        'Edit Response' => 'Editer Réponse',
        'The current ticket state is' => 'L\'état actuel du ticket est',
        'Your email address is' => 'Votre adresse email est',

        # Template: AdminResponseAttachment
        'Manage Responses <-> Attachments Relations' => 'Gérer Réponses <-> Relations attachement',
        'Filter for Attachments' => '',
        'Change Response Relations for Attachment' => '',
        'Change Attachment Relations for Response' => '',
        'Toggle active for all' => 'Sélectionner actif pour tous',
        'Link %s to selected %s' => 'Lien %s vers sélection %s',

        # Template: AdminRole
        'Role Management' => 'Gestion des Rôles',
        'Add role' => 'Ajouter Rôle',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Crée un rôle et y ajoute des groupes. Ajoute alors le rôle aux utilisateurs.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'Il n\'y a pas de rôle défini. Utilisez le bouton \'Ajouter\' pour créer un nouveau rôle.',
        'Add Role' => 'Ajouter un rôle',
        'Edit Role' => 'Editer rôle',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => 'Gérer Relations Rôle-Groupe',
        'Filter for Roles' => 'Filtre pour Rôles',
        'Roles' => 'Rôles',
        'Select the role:group permissions.' => 'Sélectionner les permissions rôle:groupe',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Si rien n\'est sélectionné, alors il n\'y a aucune permission pour ce groupe (les tickets ne seront pas disponibles pour ce rôle).',
        'Change Role Relations for Group' => '',
        'Change Group Relations for Role' => '',
        'Toggle %s permission for all' => 'Sélectionner permission %s pour tous',
        'move_into' => 'déplacer dans',
        'Permissions to move tickets into this group/queue.' => 'Permission de déplacer un ticket dans cette file/ce groupe.',
        'create' => 'créer',
        'Permissions to create tickets in this group/queue.' => 'Permission de créer un ticket dans cette file/ce groupe.',
        'priority' => 'priorité',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Permission de changer la priorité d\'un ticket dans cette file/ce groupe.',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => 'Gérer les relations Opérateur-Rôle',
        'Filter for Agents' => 'Filtre pour opérateurs',
        'Agents' => 'Agents',
        'Manage Role-Agent Relations' => 'Gérer Relations Rôle-Opérateur',
        'Change Role Relations for Agent' => 'Changer les rôles pour un opérateur',
        'Change Agent Relations for Role' => 'Changer les opérateurs pour un rôle ',

        # Template: AdminSLA
        'SLA Management' => 'Gestion des Accords sur la qualité de service (Service Level Agreement)',
        'Add SLA' => 'Ajouter un SLA',
        'Edit SLA' => 'Editer SLA',
        'Please write only numbers!' => '',

        # Template: AdminSMIME
        'S/MIME Management' => 'Gestion S/MIME',
        'Add certificate' => 'Ajouter certificat',
        'Add private key' => 'Ajouter clé privé',
        'Filter for certificates' => '',
        'Filter for SMIME certs' => '',
        'Here you can add relations to your private certificate, these will be embedded to the SMIME signature every time you use this certificate to sign an email.' =>
            '',
        'See also' => 'Voir aussi',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'Dans ce cas vous pouvez directement éditer le certificat et la clé privée dans le système de fichier',
        'Hash' => 'Hashage',
        'Create' => 'Création',
        'Handle related certificates' => '',
        'Delete this certificate' => 'Supprimer ce certificat',
        'Add Certificate' => 'Ajouter un certificat',
        'Add Private Key' => 'Ajouter une clé privée',
        'Secret' => 'Secret',
        'Related Certificates for' => '',
        'Delete this relation' => '',
        'Available Certificates' => '',
        'Relate this certificate' => '',

        # Template: AdminSalutation
        'Salutation Management' => 'Préfixes des courriels',
        'Add salutation' => '',
        'Add Salutation' => 'Ajouter un en-tête',
        'Edit Salutation' => 'Editer en-tête',
        'Example salutation' => 'Exemple d\'en-tête',

        # Template: AdminScheduler
        'This option will force Scheduler to start even if the process is still registered in the database' =>
            '',
        'Start scheduler' => '',
        'Scheduler could not be started. Check if scheduler is not running and try it again with Force Start option' =>
            '',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => 'Le mode sécurisé doit être activé',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'Le mode sécurisé sera (normallement) activé lorsque l\'installation initiale sera terminée.',
        'Secure mode must be disabled in order to reinstall using the web-installer.' =>
            'Le mode sécurisé doit être désactivé dans le but de réinstaller en utilisant le web-installer (installateur web)',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Si le mode sécurisé n\'est pas activé, activez le via SysConfig car votre application est en train de tourner',

        # Template: AdminSelectBox
        'SQL Box' => 'Reqêtes SQL',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Ici vous pouvez entrez du SQL pour l\'envoyer directement à la base de donnée',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            '',
        'There is at least one parameter missing for the binding. Please check it.' =>
            '',
        'Result format' => 'Format du résultat',
        'Run Query' => 'Exécuter requête',

        # Template: AdminService
        'Service Management' => 'Gestion des Services',
        'Add service' => 'Ajouter service',
        'Add Service' => 'Ajouter un Service',
        'Edit Service' => 'Editer service',
        'Sub-service of' => 'Sous-service de',

        # Template: AdminSession
        'Session Management' => 'Gestion des sessions',
        'All sessions' => 'Toutes les sessions',
        'Agent sessions' => 'Sessions Opérateurs',
        'Customer sessions' => 'Session Clients',
        'Unique agents' => 'Opérateurs uniques',
        'Unique customers' => 'Clients uniques',
        'Kill all sessions' => 'Supprimer toutes les sessions',
        'Kill this session' => 'tuer cette session',
        'Session' => 'Session',
        'Kill' => 'Tuer',
        'Detail View for SessionID' => 'Vue détaillée pour SessionID',

        # Template: AdminSignature
        'Signature Management' => 'Gestion des signatures',
        'Add signature' => 'Ajouter une signature',
        'Add Signature' => 'Ajouter une signature',
        'Edit Signature' => 'Editer signature',
        'Example signature' => 'Exemple de signature',

        # Template: AdminState
        'State Management' => 'Gestion des états',
        'Add state' => 'Ajouter un état',
        'Please also update the states in SysConfig where needed.' => '',
        'Add State' => 'Ajouter un état',
        'Edit State' => 'Editer état',
        'State type' => 'Type d\'état',

        # Template: AdminSysConfig
        'SysConfig' => 'Configuration Système',
        'Navigate by searching in %s settings' => 'Naviguer en cherchant dans la configuration %s',
        'Navigate by selecting config groups' => 'Naviguer en sélectionnant les groupes de configuration',
        'Download all system config changes' => 'Télécharger toutes les modifications de configuration système',
        'Export settings' => 'Configuration d\'export',
        'Load SysConfig settings from file' => 'Charger la configuration SysConfig à partir du fichier',
        'Import settings' => 'configuration d\'import',
        'Import Settings' => 'Configuration d\'Import',
        'Please enter a search term to look for settings.' => 'Merci d\'entrer un motif de recherche pour chercher dans la configuration',
        'Subgroup' => 'Sous-groupe',
        'Elements' => 'Éléments',

        # Template: AdminSysConfigEdit
        'Edit Config Settings' => 'Editer les éléments de configuration',
        'This config item is only available in a higher config level!' =>
            'Cet élément de configuration n\'est disponible que dans un niveau supérieur de configuration',
        'Reset this setting' => 'Réinitialiser cet élément',
        'Error: this file could not be found.' => 'Erreur: ce fichier ne peut pas être trouvé',
        'Error: this directory could not be found.' => 'Erreur: ce répertoire ne peut pas être trouvé',
        'Error: an invalid value was entered.' => 'Erreur: valeur incorrecte',
        'Content' => 'Contenu',
        'Remove this entry' => 'Supprimer cette entrée',
        'Add entry' => 'Ajouter une entrée',
        'Remove entry' => 'Supprimer l\'entrée',
        'Add new entry' => 'Ajouter une nouvelle entrée',
        'Create new entry' => 'Créer une nouvelle entrée',
        'New group' => 'Nouveau groupe',
        'Group ro' => 'Groupe ro',
        'Readonly group' => 'Group en lecture seule',
        'New group ro' => 'Nouveau groupe ro',
        'Loader' => 'Chargeur',
        'File to load for this frontend module' => 'Fichier à charger pour ce module "frontend"',
        'New Loader File' => 'Nouveau Fichier de Chargeur',
        'NavBarName' => 'Nom de la barre de navigation',
        'NavBar' => 'Barre de navigation',
        'LinkOption' => '',
        'Block' => 'Bloc',
        'AccessKey' => 'Accès clavier',
        'Add NavBar entry' => 'Ajouter entrée de barre de navigation',
        'Year' => 'Année',
        'Month' => 'Mois',
        'Day' => 'Jour',
        'Invalid year' => 'Année incorrecte',
        'Invalid month' => 'Mois incorrect',
        'Invalid day' => 'Jour incorrect',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Gestion des adresses électroniques du système',
        'Add system address' => 'Ajouter adresse système',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Tous les messages entrants avec cette adresse en To(A) ou Cc(copie) seront ventilés dans la file sélectionnée',
        'Email address' => 'Adresse de messagerie',
        'Display name' => 'Nom à afficher',
        'Add System Email Address' => 'Ajouter adresse de messagerie du système',
        'Edit System Email Address' => 'Editer adresse de messagerie du système',
        'The display name and email address will be shown on mail you send.' =>
            'Le nom à afficher et l\'adresse demessagerie seront affichés dans les messages que vous envoyez.',

        # Template: AdminType
        'Type Management' => 'Gestion des Types',
        'Add ticket type' => 'Ajouter type de ticket',
        'Add Type' => 'Ajouter un Type',
        'Edit Type' => 'Editer Type',

        # Template: AdminUser
        'Add agent' => 'Ajouter opérateur',
        'Agents will be needed to handle tickets.' => 'Des opérateurs seront requis pour gérer les tickets',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'N\'oubliez pas d\'ajouter un nouvel opérateur aux groupes et/ou rôles',
        'Please enter a search term to look for agents.' => 'Merci d\'entrer un motid de recherche pour chercher des opérateurs',
        'Last login' => 'Dernière connexion',
        'Login as' => 'Connecté en tant que',
        'Switch to agent' => 'Changer d\'opérateur vers',
        'Add Agent' => 'Ajouter un opérateur',
        'Edit Agent' => 'Modifier l\'opérateur ',
        'Firstname' => 'Prénom',
        'Lastname' => 'Nom',
        'Password is required.' => '',
        'Start' => 'Démarrer',
        'End' => 'Fin',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => 'Gérer Relations opérateur-Groupe',
        'Change Group Relations for Agent' => '',
        'Change Agent Relations for Group' => '',
        'note' => 'note',
        'Permissions to add notes to tickets in this group/queue.' => 'Permissions d\'ajouter des notes aux tickets dans ce groupe/cette file',
        'owner' => 'propriétaire',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Permissions de changer le propriétaire des tickets dans ce gorupe/cette file.',

        # Template: AgentBook
        'Address Book' => 'Carnet d\'adresses',
        'Search for a customer' => 'Chercher un client',
        'Add email address %s to the To field' => '',
        'Add email address %s to the Cc field' => '',
        'Add email address %s to the Bcc field' => '',
        'Apply' => 'Appliquer',

        # Template: AgentCustomerSearch
        'Search Customer' => 'Recherche de client',
        'Duplicated entry' => '',
        'This address already exists on the address list.' => '',

        # Template: AgentCustomerTableView

        # Template: AgentDashboard
        'Dashboard' => 'Tableau de bord',

        # Template: AgentDashboardCalendarOverview
        'in' => 'in',

        # Template: AgentDashboardIFrame

        # Template: AgentDashboardImage

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s est disponible !',
        'Please update now.' => 'Merci de mettre à jour maintenant',
        'Release Note' => 'Note de version',
        'Level' => 'Niveau',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Envoyé il y a %s',

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
        'The ticket has been locked' => 'Le ticket a été verrouillé',
        'Undo & close window' => 'Annuler et fermer la fenêtre',

        # Template: AgentInfo
        'Info' => 'Information',
        'To accept some news, a license or some changes.' => 'Pour accepter des nouvelles, une licence ou des modifications.',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Lier l\'Objet: %s',
        'Close window' => 'Fermer fenêtre',
        'go to link delete screen' => '',
        'Select Target Object' => 'Sélectionner l\'Objet cible',
        'Link Object' => 'Lier l\'objet',
        'with' => 'avec',
        'Unlink Object: %s' => 'Délier l\'objet: %s',
        'go to link add screen' => '',

        # Template: AgentNavigationBar

        # Template: AgentPreferences
        'Edit your preferences' => 'Editer vos préférences',

        # Template: AgentSpelling
        'Spell Checker' => 'Vérificateur orthographique',
        'spelling error(s)' => 'erreurs d\'orthographe',
        'Apply these changes' => 'Appliquer ces changements',

        # Template: AgentStatsDelete
        'Delete stat' => 'Supprimer stat',
        'Stat#' => 'Stat#',
        'Do you really want to delete this stat?' => 'Voulez-vous vraiment supprimer cette statistique?',

        # Template: AgentStatsEditRestrictions
        'Step %s' => '',
        'General Specifications' => 'Spécifications Générales',
        'Select the element that will be used at the X-axis' => 'Sélectionner l\'élement qui sera utilisé pour l\'axe X',
        'Select the elements for the value series' => 'Sélectionnez les éléments de la série de données',
        'Select the restrictions to characterize the stat' => 'Sélectionner les restrictions pour caractériser cette statistique',
        'Here you can make restrictions to your stat.' => 'Vous pouvez ici appliquer des restrictions à vos statistiques.',
        'If you remove the hook in the "Fixed" checkbox, the agent generating the stat can change the attributes of the corresponding element.' =>
            'Si vous enlevez la coche dans la case, l\'opérateur generant les statistiques peut changer les attributs de l\élement correspondant',
        'Fixed' => 'Fixé',
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Sélectionnez un seul élément ou désactivez le bouton \'Fixé\'',
        'Absolute Period' => 'Période Absolue',
        'Between' => 'Entre',
        'Relative Period' => 'Période relative',
        'The last' => 'Le dernier',
        'Finish' => 'Terminer',

        # Template: AgentStatsEditSpecification
        'Permissions' => 'Permissions',
        'You can select one or more groups to define access for different agents.' =>
            '',
        'Some result formats are disabled because at least one needed package is not installed.' =>
            '',
        'Please contact your administrator.' => '',
        'Graph size' => 'Taille du graphique',
        'If you use a graph as output format you have to select at least one graph size.' =>
            'Si vous choisissez Graphe comme format de sortie, vous devez choisir la taille',
        'Sum rows' => 'Ligne de somme',
        'Sum columns' => 'Colonnes de somme',
        'Use cache' => 'Utiliser le cache',
        'Most of the stats can be cached. This will speed up the presentation of this stat.' =>
            'La plus grande part des stats peuvent être mise en cache. Cela accèlere leur présentation',
        'If set to invalid end users can not generate the stat.' => 'Si mis à invalide, les utilisateurs finaux ne pourront pas générer la statistique.',

        # Template: AgentStatsEditValueSeries
        'Here you can define the value series.' => '',
        'You have the possibility to select one or two elements.' => '',
        'Then you can select the attributes of elements.' => '',
        'Each attribute will be shown as single value series.' => '',
        'If you don\'t select any attribute all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            '',
        'Scale' => 'Échelle',
        'minimal' => 'minimale',
        'Please remember, that the scale for value series has to be larger than the scale for the X-axis (e.g. X-Axis => Month, ValueSeries => Year).' =>
            'SVP, rappelez vous que la plage pour la série de données doit être plus grande que l\'echelle de l\'axe des X (ex. axe des X => Mois, Série => Année',

        # Template: AgentStatsEditXaxis
        'Here you can define the x-axis. You can select one element via the radio button.' =>
            '',
        'maximal period' => 'période minimale',
        'minimal scale' => 'Échelle minimale',

        # Template: AgentStatsImport
        'Import Stat' => 'Importer Statistique',
        'File is not a Stats config' => 'Ce n\'est pas un fichier de configuration de statistiques',
        'No File selected' => 'Aucun fichier sélectionné',

        # Template: AgentStatsOverview
        'Stats' => 'Statistiques',

        # Template: AgentStatsPrint
        'Print' => 'Imprimer',
        'No Element selected.' => 'Aucun élément sélectionné.',

        # Template: AgentStatsView
        'Export config' => 'Exporter la configuration',
        'With the input and select fields you can influence the format and contents of the statistic.' =>
            '',
        'Exactly what fields and formats you can influence is defined by the statistic administrator.' =>
            '',
        'Stat Details' => 'Details de la statistique',
        'Format' => 'Format',
        'Graphsize' => 'Taille du graphique',
        'Cache' => 'Cache',
        'Exchange Axis' => 'Échangez les axes',
        'Configurable params of static stat' => 'Paramètres modifiables des statistiques',
        'No element selected.' => 'Aucun élément sélectionné.',
        'maximal period from' => 'Période maximale de',
        'to' => 'vers',

        # Template: AgentTicketActionCommon
        'Change Free Text of Ticket' => 'Changer le Texte Libre du Ticket',
        'Change Owner of Ticket' => 'Changer le propriétaire du Ticket',
        'Close Ticket' => 'Fermer le Ticket',
        'Add Note to Ticket' => 'Ajouter une Note au Ticket',
        'Set Pending' => 'Définir la mise en attente',
        'Change Priority of Ticket' => 'Changer la priorité du Ticket',
        'Change Responsible of Ticket' => 'Changer le responsable du Ticket',
        'Cancel & close window' => 'Annuler et fermer la fenêtre',
        'Service invalid.' => 'Service invalide',
        'New Owner' => 'Nouveau Propriétaire',
        'Please set a new owner!' => 'Merci de renseigner un propriétaire',
        'Previous Owner' => 'Propriétaire Précédent',
        'Inform Agent' => 'Informer l\'opérateur',
        'Optional' => 'Optionnel',
        'Inform involved Agents' => 'Informer les opérateurs impliqués',
        'Spell check' => 'Vérifier orthographe',
        'Note type' => 'Type de note',
        'Next state' => 'État suivant',
        'Pending date' => 'Délais d\'attente',
        'Date invalid!' => 'Date invalide',

        # Template: AgentTicketActionPopupClose

        # Template: AgentTicketBounce
        'Bounce Ticket' => '',
        'Bounce to' => 'Renvoyer à',
        'You need a email address.' => 'Vous devez avoir une adresse email',
        'Need a valid email address or don\'t use a local email address.' =>
            'Une adresse email valide est nécessaire ou n\'utilisez pas d\'adresse email locale.',
        'Next ticket state' => 'Prochain état du ticket',
        'Inform sender' => 'Informer l\'emetteur',
        'Send mail!' => 'Envoyer le courriel!',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Ticket en action groupée',
        'Send Email' => '',
        'Merge to' => 'Fusionner avec',
        'Invalid ticket identifier!' => 'Identifiant de ticket invalide',
        'Merge to oldest' => 'Fusionner avec le plus ancien',
        'Link together' => 'Lier ensemble',
        'Link to parent' => 'Lier au parent',
        'Unlock tickets' => '',

        # Template: AgentTicketClose

        # Template: AgentTicketCompose
        'Compose answer for ticket' => 'Rédiger une réponse pour le ticket',
        'Remove Ticket Customer' => '',
        'Please remove this entry and enter a new one with the correct value.' =>
            '',
        'Please include at least one recipient' => '',
        'Remove Cc' => '',
        'Remove Bcc' => '',
        'Address book' => 'Carnet d\'adresse',
        'Pending Date' => 'En attendant la date',
        'for pending* states' => 'pour tous les états de mise en attente',
        'Date Invalid!' => 'Date invalide',

        # Template: AgentTicketCustomer
        'Change customer of ticket' => 'Changer le client du ticket',
        'Customer Data' => 'Données client',
        'Customer user' => 'Client Utilisateur',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => 'Créer un nouveau Ticket Email',
        'From queue' => 'De la file',
        'To customer' => '',
        'Please include at least one customer for the ticket.' => '',
        'Get all' => 'Tout prendre',

        # Template: AgentTicketEscalation

        # Template: AgentTicketForward
        'Forward ticket: %s - %s' => '',
        'Need a valid email address or don\'t use a local email address' =>
            'Une adresse email valide est nécessaire ou n\'utilisez pas d\'adresse email locale',

        # Template: AgentTicketFreeText

        # Template: AgentTicketHistory
        'History of' => 'Historique de',
        'History Content' => 'Contenu de l\'historique',
        'Zoom view' => 'Zoomer sur la vue',

        # Template: AgentTicketMerge
        'Ticket Merge' => 'Fusion de Ticket',
        'You need to use a ticket number!' => 'Vous devez utiliser un numéro de ticket !',
        'A valid ticket number is required.' => 'Un numéro de ticket valide est requis',
        'Need a valid email address.' => 'Une adresse email valide est nécessaire',

        # Template: AgentTicketMove
        'Move Ticket' => 'Changer la file du ticket',
        'New Queue' => 'Nouvelle File',

        # Template: AgentTicketNote

        # Template: AgentTicketOverviewMedium
        'Select all' => 'Tout sélectionner',
        'No ticket data found.' => '',
        'First Response Time' => 'Temps pour fournir la première réponse (prise en compte)',
        'Service Time' => 'Temps pour le service',
        'Update Time' => 'Temps pour fournir un point d\'avancement',
        'Solution Time' => 'Temps pour fournir la réponse',
        'Move ticket to a different queue' => 'Déplacer ticket vers une autre file',
        'Change queue' => 'Changer de file',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Changer les options de recherche',
        'Tickets per page' => '',

        # Template: AgentTicketOverviewPreview
        '","26' => '',

        # Template: AgentTicketOverviewSmall
        'Escalation in' => 'Remontée dans',
        'Locked' => 'Verrouillé',
        '","30' => '',

        # Template: AgentTicketOwner

        # Template: AgentTicketPending

        # Template: AgentTicketPhone
        'Create New Phone Ticket' => 'Créer un nouveau Ticket téléphonique',
        'From customer' => 'Du client',
        'To queue' => 'Vers la file',

        # Template: AgentTicketPhoneCommon
        'Phone call' => 'Appel téléphonique',

        # Template: AgentTicketPlain
        'Email Text Plain View' => 'Vue complète du texte de l\'email',
        'Plain' => 'Tel quel',
        'Download this email' => 'Téléchargé cet email',

        # Template: AgentTicketPrint
        'Ticket-Info' => 'Information du Ticket',
        'Accounted time' => 'Temp passé',
        'Linked-Object' => 'Objet lié',
        'by' => 'par',

        # Template: AgentTicketPriority

        # Template: AgentTicketQueue

        # Template: AgentTicketResponsible

        # Template: AgentTicketSearch
        'Search template' => 'Profil de recherche',
        'Create Template' => 'Créer Template',
        'Create New' => 'Créer nouveau',
        'Profile link' => '',
        'Save changes in template' => '',
        'Add another attribute' => 'Ajouter un autre attribut',
        'Output' => 'Format du résultat',
        'Fulltext' => 'Texte Complet',
        'Remove' => 'Supprimer',
        'Customer User Login' => 'Nom de connexion du client',
        'Created in Queue' => 'Créé dans la file',
        'Lock state' => 'État verrouillé',
        'Watcher' => 'Surveillance',
        'Article Create Time (before/after)' => '',
        'Article Create Time (between)' => '',
        'Ticket Create Time (before/after)' => '',
        'Ticket Create Time (between)' => '',
        'Ticket Change Time (before/after)' => '',
        'Ticket Change Time (between)' => '',
        'Ticket Close Time (before/after)' => '',
        'Ticket Close Time (between)' => '',
        'Archive Search' => 'Recherche Archive',
        'Run search' => '',

        # Template: AgentTicketSearchOpenSearchDescriptionFulltext

        # Template: AgentTicketSearchOpenSearchDescriptionTicketNumber

        # Template: AgentTicketSearchResultPrint

        # Template: AgentTicketZoom
        'Article filter' => 'Filtre Archive',
        'Article Type' => 'Type d\'Article',
        'Sender Type' => '',
        'Save filter settings as default' => 'Sauvegarder les paramètres de filtrage comme paramètres par défaut',
        'Ticket Information' => '',
        'Linked Objects' => 'Objets liés',
        'Article(s)' => 'Article(s)',
        'Change Queue' => 'Modifier file',
        'Article Filter' => '',
        'Add Filter' => 'Ajouter filtre',
        'Set' => 'Assigner',
        'Reset Filter' => 'Réinitialiser filtre',
        'Show one article' => 'Montrer un article',
        'Show all articles' => 'Montrer tous les articles',
        'Unread articles' => 'Articles non lus',
        'No.' => 'Non.',
        'Unread Article!' => 'Article non lu!',
        'Incoming message' => '',
        'Outgoing message' => '',
        'Internal message' => '',
        'Resize' => '',

        # Template: AttachmentBlocker
        'To protect your privacy, active or/and remote content has blocked.' =>
            'Pour protéger votre vie privée, les contenus actifs ou distants ont été bloqués.',
        'Load blocked content.' => 'Charger contenu bloqué',

        # Template: Copyright

        # Template: CustomerAccept

        # Template: CustomerError
        'Traceback' => 'Trace du retour d\'erreur',

        # Template: CustomerFooter
        'Powered by' => 'Fonction assurée par',
        'One or more errors occurred!' => '',
        'Close this dialog' => 'Fermer cette fenêtre de dialogue',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            '',

        # Template: CustomerHeader

        # Template: CustomerLogin
        'Login' => 'S\'authentifier',
        'User name' => '',
        'Your user name' => '',
        'Your password' => '',
        'Forgot password?' => 'Mot de passe oublié?',
        'Log In' => '',
        'Not yet registered?' => 'Pas encore enregistré?',
        'Sign up now' => 'Enregistrez-vous maintenant',
        'Request new password' => 'Demande de nouveau mot de passe',
        'Your User Name' => 'Votre nom',
        'A new password will be sent to your email address.' => '',
        'Create Account' => 'Créer un compte',
        'Please fill out this form to receive login credentials.' => '',
        'How we should address you' => '',
        'Your First Name' => 'Votre prénom',
        'Please supply a first name' => '',
        'Your Last Name' => 'Votre nom de famille',
        'Please supply a last name' => '',
        'Your email address (this will become your username)' => '',
        'Please supply a' => '',

        # Template: CustomerNavigationBar
        'Edit personal preferences' => 'Editer les préférences',
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
        'e. g. 10*5155 or 105658*' => 'i.e. 10*5155 or 105658*',
        'Customer ID' => 'ID Client',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => 'Recherche plein texte dans les tickets (i.e. "John*n" or "Will*")',
        'Recipient' => 'Destinataire',
        'Carbon Copy' => 'Copie Carbone',
        'Time restrictions' => 'Restrictions de temps',
        'No time settings' => '',
        'Only tickets created' => 'Seulement les tickets créés',
        'Only tickets created between' => 'Seulement les tickets créés entre',
        'Ticket archive system' => '',
        'Save search as template?' => '',
        'Save as Template?' => 'Sauver comme Template',
        'Save as Template' => '',
        'Template Name' => 'Nom du Template',
        'Pick a profile name' => '',
        'Output to' => 'Sortie vers',

        # Template: CustomerTicketSearchOpenSearchDescription

        # Template: CustomerTicketSearchResultPrint

        # Template: CustomerTicketSearchResultShort
        'of' => 'de',
        'Page' => 'Page',
        'Search Results for' => 'Résultats de recherche pour',
        '","18' => '',

        # Template: CustomerTicketZoom
        'Expand article' => '',
        'Reply' => 'Répondre',

        # Template: CustomerWarning

        # Template: Datepicker
        'Invalid date (need a future date)!' => '',
        'Previous' => 'Précédent',
        'Sunday' => 'Dimanche',
        'Monday' => 'Lundi',
        'Tuesday' => 'Mardi',
        'Wednesday' => 'Mercredi',
        'Thursday' => 'Jeudi',
        'Friday' => 'Vendredi',
        'Saturday' => 'Samedi',
        'Su' => 'Di',
        'Mo' => 'Lu',
        'Tu' => 'Ma',
        'We' => 'Me',
        'Th' => 'Je',
        'Fr' => 'Ve',
        'Sa' => 'Sa',
        'Open date selection' => 'Selection date d\'ouverture',

        # Template: Error
        'Oops! An Error occurred.' => 'Oups! Une erreur est survenue.',
        'Error Message' => 'Message d\'Erreur',
        'You can' => 'Vous pouvez',
        'Send a bugreport' => 'Envoyer un rapport de bug',
        'go back to the previous page' => 'iRevenir à la page précédente',
        'Error Details' => 'Détails de l\'erreur',

        # Template: Footer
        'Top of page' => 'Haut de la page',

        # Template: FooterJS
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Si vous quittez cette page maintenant, toutes les fenêtres popup seront closes également!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            '',
        'Please enter at least one search value or * to find anything.' =>
            '',

        # Template: FooterSmall

        # Template: HTMLHead

        # Template: HTMLHeadBlockEvents

        # Template: Header
        'You are logged in as' => 'Vous êtes connecté en',

        # Template: HeaderSmall

        # Template: Installer
        'JavaScript not available' => 'JavaScript non disponible',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            'Pour utiliser OTRS, vous devez activer le JavaScript dans votre navigateur.',
        'Database Settings' => '',
        'General Specifications and Mail Settings' => '',
        'Registration' => '',
        'Welcome to %s' => 'Bienvenue dans %s',
        'Web site' => '',
        'Database check successful.' => 'Contrôle de base de donnée effectué avec succès.',
        'Mail check successful.' => 'Contrôle de mail effectué avec succès.',
        'Error in the mail settings. Please correct and try again.' => 'Erreur dans la configuration email. Merci de corriger et de réessayer.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => 'Configurer le mail sortant',
        'Outbound mail type' => 'Type de mail sortant',
        'Select outbound mail type.' => 'Sélectionner le type de mail sortant',
        'Outbound mail port' => '',
        'Select outbound mail port.' => '',
        'SMTP host' => 'Hôte SMTP',
        'SMTP host.' => 'Hôte SMTP.',
        'SMTP authentication' => 'Authentification SMTP',
        'Does your SMTP host need authentication?' => 'Est-ce-que votre hôte SMTP supporte l\'authentification?',
        'SMTP auth user' => 'Utilisateur auth SMTP',
        'Username for SMTP auth.' => 'Nom utilisateur pour auth SMTP.',
        'SMTP auth password' => 'Mot de passe auth SMTP',
        'Password for SMTP auth.' => 'Mot de passe pour autgh SMTP.',
        'Configure Inbound Mail' => 'Configurer mail entrant',
        'Inbound mail type' => 'Type de mail entrant',
        'Select inbound mail type.' => 'Sélectionner le type de mail entrant',
        'Inbound mail host' => 'Hôte mail entrant',
        'Inbound mail host.' => 'Hôte mail entrant.',
        'Inbound mail user' => 'Utilisateur mail entrant',
        'User for inbound mail.' => 'Utilisateuyr pour mail entrant.',
        'Inbound mail password' => 'Mot de passe mail entrant',
        'Password for inbound mail.' => 'Mot de passe pour mail entrant.',
        'Result of mail configuration check' => 'Résultat du contrôle de configuration mail',
        'Check mail configuration' => 'Vérifier la configuration mail',
        'Skip this step' => 'Passer cette étape',
        'Skipping this step will automatically skip the registration of your OTRS. Are you sure you want to continue?' =>
            '',

        # Template: InstallerDBResult
        'False' => 'Faux',

        # Template: InstallerDBStart
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty. For security reasons we do recommend setting a root password. For more information please refer to your database documentation.' =>
            'Si vous avez un mot de passe pour le compte root de votre base de données, il doit être saisi ici. Sinon, laissez ce champ vide. Pour des raisons de sécurité, nous vous recommandons de mettre un mot de passe pour le compte root. Pour plus d\'information, referez vous svp à la documentation de votre gestionnaire de base de données.',
        'Currently only MySQL is supported in the web installer.' => 'Pour le moment, seul MySQL est supporté pour cet installateur web.',
        'If you want to install OTRS on another database type, please refer to the file README.database.' =>
            '',
        'Database-User' => 'Nom de l\'utilisateur de la base de donnée',
        'New' => 'Nouveau',
        'A new database user with limited rights will be created for this OTRS system.' =>
            'Un nouvel utilisateur de la base de données sera créé avec des droits limités pour ce système OTRS.',
        'default \'hot\'' => '\'hot\' par défaut',
        'DB--- host' => '',
        'Check database settings' => 'Vérifier la configuration base de données',
        'Result of database check' => 'Résultat du contrôle de la base de données',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Pour pouvoir utiliser OTRS, vous devez entrer les commandes suivantes dans votre terminal en tant que root.',
        'Restart your webserver' => 'Redémarrer votre serveur web',
        'After doing so your OTRS is up and running.' => 'Après avoir fait ceci votre OTRS est en service',
        'Start page' => 'Page de démarrage',
        'Your OTRS Team' => 'Votre Équipe OTRS',

        # Template: InstallerLicense
        'Accept license' => 'Accepter la licence',
        'Don\'t accept license' => 'Ne pas accepter la licence',

        # Template: InstallerLicenseText

        # Template: InstallerRegistration
        'Organization' => 'Société',
        'Position' => '',
        'Complete registration and continue' => '',
        'Please fill in all fields marked as mandatory.' => '',

        # Template: InstallerSystem
        'SystemID' => 'ID Système',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            '',
        'System FQDN' => 'Nom de Domaine complet du système',
        'Fully qualified domain name of your system.' => '',
        'AdminEmail' => 'Adresse électronique de l\'administrateur.',
        'Email address of the system administrator.' => '',
        'Log' => 'Log',
        'LogModule' => 'Module de log',
        'Log backend to use.' => '',
        'LogFile' => 'Fichier de log',
        'Log file location is only needed for File-LogModule!' => '',
        'Webfrontend' => 'Frontal web',
        'Default language' => 'Langue par défaut',
        'Default language.' => '',
        'CheckMXRecord' => 'Vérifier les enregistrements MX',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            '',

        # Template: LinkObject
        'Object#' => '',
        'Add links' => '',
        'Delete links' => 'Supprimer les liens',

        # Template: Login
        'JavaScript Not Available' => 'JavaScript non disponible',
        'Browser Warning' => 'Avertissement du novagateur',
        'The browser you are using is too old.' => 'Votre navigateur est trop ancien.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            'OTRS tourne sur un grand nombre de navigateurs, merci de mettre à jour votre navigateur vers l\'un de ceux-ci.',
        'Please see the documentation or ask your admin for further information.' =>
            'Merci de se référer à la documentation ou demander à votre administrateur système pour de plus amples informations.',
        'Lost your password?' => 'Mot de passe oublié ?',
        'Request New Password' => 'Demander un nouveau mot de passe',
        'Back to login' => 'Retour à la page de connexion',

        # Template: Motd
        'Message of the Day' => 'Message du jour',

        # Template: NoPermission
        'Insufficient Rights' => 'Droits insuffisants',
        'Back to the previous page' => 'Revenir à la page précédente',

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
        'URL' => 'URL',

        # Template: PrintHeader
        'printed by' => 'Imprimé par :',

        # Template: PublicDefault

        # Template: Redirect

        # Template: RichTextEditor

        # Template: SpellingInline

        # Template: Test
        'OTRS Test Page' => 'Page de test d\'OTRS',
        'Welcome %s' => 'Bienvenue %s',
        'Counter' => 'Compteur',

        # Template: Warning
        'Go back to the previous page' => 'Revenir à la page précédente',

        # SysConfig
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'Module ACL qui autorise la fermture du ticket parent uniquement si tout ses enfants sont déjà clos("Etat" montre quels états ne sont pas disponibles pour le ticket parent tant que ses enfants ne sont pas clos).',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Active un méchanisme de clignotement du nom de la file qui contient le plus vieux ticket.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Active la fonction de mot de passe perdu pour les opérateurs, dans l\'interface des opérateurs.',
        'Activates lost password feature for customers.' => 'Active la fonction fr mot de passe perdu pour les clients.',
        'Activates support for customer groups.' => 'Active le support pour les groupes de client.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Active le filtre d\'article dans la vue de zoom pour spécifier quels articles doivent être montrés.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Active les thèmes disponibles sur le système. La valeur 1 le rend actif, 0 le désactive.',
        'Activates the ticket archive system search in the customer interface.' =>
            '',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Active le système d\'archive de ticket pour accélérer le système en déplaçant des tickets qui ne sont pas du jour. Pour chercher dans ces tickets, le flag archive doit être activé dans la recherche de ticket.',
        'Activates time accounting.' => 'Active la comptabilisation du temps',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            '',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface.' =>
            'Ajoute l\'adresse email des clients en destinataire dans l\'écran de création de l\'interface opérateur.',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances permanentes. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Agent Notifications' => 'Notifications pour les opérateurs',
        'Agent interface article notification module to check PGP.' => 'Module de notification d\'article dans l\'interface opérateur pour vérifier le PGP',
        'Agent interface article notification module to check S/MIME.' =>
            'Module de notification d\'article dans l\'interface opérateur pour vérifier le S/MIME',
        'Agent interface module to access fulltext search via nav bar.' =>
            'Module de l\'interface opérateur pour accéder à la recherche plein texte dans la barre de navigation.',
        'Agent interface module to access search profiles via nav bar.' =>
            'Module de l\'interface opérateur pour accéder à la recherche des profiles dans la barre de navigation.',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            '',
        'Agent interface notification module to check the used charset.' =>
            '',
        'Agent interface notification module to see the number of tickets an agent is responsible for.' =>
            '',
        'Agent interface notification module to see the number of watched tickets.' =>
            '',
        'Agents <-> Groups' => 'Opérateurs <-> Groupes',
        'Agents <-> Roles' => '',
        'Allows adding notes in the close ticket screen of the agent interface.' =>
            'Autorise l\'ajout de notes dans l\'écran de fermeture du ticket dans l\'interface opérateur.',
        'Allows adding notes in the ticket free text screen of the agent interface.' =>
            'Autorise l\'ajout de notes dans l\'écran de champ libre du ticket dans l\'interface opérateur.',
        'Allows adding notes in the ticket note screen of the agent interface.' =>
            'Autorise l\'ajout de notes dans l\'écran de note du ticket dans l\'interface opérateur.',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Autorise l\'ajout de notes dans l\'écran de propriétaire d\'un ticket zoomé dans l\'interface opérateur.',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Autorise l\'ajout de notes dans l\'écran de mise en attente d\'un ticket zoomé dans l\'interface opérateur.',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Autorise l\'ajout de notes dans l\'écran de priorité d\'un ticket zoomé dans l\'interface opérateur.',
        'Allows adding notes in the ticket responsible screen of the agent interface.' =>
            'Autorise l\'ajout de notes dans l\'écran de responsable d\'un ticket dans l\'interface opérateur.',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Autorise les opérateurs à échanger les axes d\'une statistique si ils en génèrent une.',
        'Allows agents to generate individual-related stats.' => 'Autorise les opérateurs à générer des statistiques relatives à un individu.',
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
        'Attachments <-> Responses' => 'Pièces jointes <-> Réponses',
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
        'Create and manage Service Level Agreements (SLAs).' => 'Créer et gérer les contrats de niveau de support (SLAs).',
        'Create and manage agents.' => 'Créer et gérer les opérateurs.',
        'Create and manage attachments.' => 'Créer et gérer les attachements.',
        'Create and manage companies.' => 'Créer et gérer les entreprises.',
        'Create and manage customers.' => 'Créer et gérer les clients.',
        'Create and manage dynamic fields.' => '',
        'Create and manage event based notifications.' => 'Créer et gérer les notifications évenementielles.',
        'Create and manage groups.' => 'Créer et gérer les groupes.',
        'Create and manage notifications that are sent to agents.' => 'Créer et gérer les notifications envoyées aux opérateurs.',
        'Create and manage queues.' => 'Créer et gérer les files.',
        'Create and manage response templates.' => 'Créer et gérer les templates de réponse.',
        'Create and manage responses that are automatically sent.' => 'Créer et gérer  les réponses envoyées automatiquement.',
        'Create and manage roles.' => 'Créer et gérer les rôles.',
        'Create and manage salutations.' => 'Créer et gérer les en-têtes.',
        'Create and manage services.' => 'Créer et gérer les services.',
        'Create and manage signatures.' => 'Créer et gérer les signatures.',
        'Create and manage ticket priorities.' => 'Créer et gérer les priorités de ticket.',
        'Create and manage ticket states.' => 'Créer et gérer les états de ticket.',
        'Create and manage ticket types.' => 'Créer et gérer les types de ticket.',
        'Create and manage web services.' => '',
        'Create new email ticket and send this out (outbound)' => 'Créer un nouvel ticket par email et l\'envoyer (sortant)',
        'Create new phone ticket (inbound)' => 'Créer un nouveau ticket par téléphone (entrant)',
        'Custom text for the page shown to customers that have no tickets yet.' =>
            '',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customers <-> Groups' => 'Clients <-> Groupes',
        'Customers <-> Services' => 'Clients <-> Services',
        'DEPRECATED! This setting is not used any more and will be removed in a future version of OTRS.' =>
            '',
        'Data used to export the search result in CSV format.' => 'Données utilisées pour exporter les résultats de recherche dans le format CSV.',
        'Date / Time' => '',
        'Debugs the translation set. If this is set to "Yes" all strings (text) without translations are written to STDERR. This can be helpful when you are creating a new translation file. Otherwise, this option should remain set to "No".' =>
            '',
        'Default ACL values for ticket actions.' => 'ACL par défaut pour les actions du ticket.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            '',
        'Default loop protection module.' => '',
        'Default queue ID used by the system in the agent interface.' => 'ID de file par défaut utilisée par le système dans l\'interface opérateur.',
        'Default skin for OTRS 3.0 interface.' => '',
        'Default skin for interface.' => 'Habillage par défaut pour l\'interface.',
        'Default ticket ID used by the system in the agent interface.' =>
            'ID de ticket par défaut utilisé par le système dans l\'interface opérateur.',
        'Default ticket ID used by the system in the customer interface.' =>
            'ID de ticket par défaut utilisé par le système dans l\'interface client.',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Define the start day of the week for the date picker.' => '',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Défini un élément client qui génère un icone LinkedIn à la fin du bloc d\'information client.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Défini un élément client qui génère un icone XING à la fin du bloc d\'information client.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Défini un élément client qui génère un icone Google à la fin du bloc d\'information client.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Défini un élément client qui génère un icone Google Maps à la fin du bloc d\'information client.',
        'Defines a default list of words, that are ignored by the spell checker.' =>
            'Défini une liste de mots ignorés par le correcteur orthographique.',
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
        'Defines all the X-headers that should be scanned.' => 'Défini tous les X-headers qui doivent être analysés',
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
        'Email Addresses' => 'Adresses électroniques',
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
        'GenericAgent' => 'Automate générique',
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
        'Notifications (Event)' => 'Notification (Evenement)',
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
        'Responses <-> Queues' => 'Réponses <-> Files',
        'Restores a ticket from the archive (only if the event is a state change, from closed to any open available state).' =>
            '',
        'Roles <-> Groups' => 'Rôles <-> Groupes',
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
        'Select your frontend Theme.' => 'Choix du thème de l\'interface',
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
        'Ticket overview' => 'Résumé du Ticket',
        'Tickets' => 'Ticket',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            'Temps en secondes à ajouter à l\'heure actuelle dans le cas dans état en attente (défaut: 86400 = 1 jour)',
        'Toolbar Item for a shortcut.' => '',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            '',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            '',
        'Types' => 'Types',
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
        'View performance benchmark results.' => 'Voir les résultats du benchmark de performance.',
        'View system log messages.' => 'Voir les messages de log système',
        'Wear this frontend skin' => '',
        'Webservice path separator.' => '',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. In this text area you can define this text (This text cannot be changed by the agent).' =>
            '',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            '',
        'Your language' => 'Votre langue',
        'Your queue selection of your favorite queues. You also get notified about those queues via email if enabled.' =>
            'Votre sélection des files préférées. Vous recevrez une information par courriel si disponible',

        #
        # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
        #
        ' Param 1 value' => 'Valeur Paramètre 1',
        ' Param 2 value' => 'Valeur Paramètre 2',
        ' Param 3 value' => 'Valeur Paramètre 3',
        ' Param 4 value' => 'Valeur Paramètre 4',
        ' Param 5 value' => 'Valeur Paramètre 5',
        ' Param 6 value' => 'Valeur Paramètre 6',
        '"}' => '"}',
        '%s Tickets affected! Do you really want to use this job?' => '%s tickets affectés ! Voulez vous vraiment utiliser cette commande ?',
        '(Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behinde a dial-up line $!)' =>
            '(Verifie les enregistrements MX des adresses électroniques utilisées lors de la rédaction d\'une réponse. N\'utilisez pas la "Vérification des enregistrements MX" si votre serveur OTRS est derrière une ligne modem $!',
        '(Email of the system admin)' => '(Adresse électronique de l\'administrateur système)',
        '(Full qualified domain name of your system)' => '(Nom de domaine complet de votre machine)',
        '(Logfile just needed for File-LogModule!)' => '(fichier de log nécessaire pour le Module File-Log !)',
        '(Note: It depends on your installation how many dynamic objects you can use)' =>
            'Note: Le nombre d\'objets dynamiques que vous pouvez utiliser dépend de votre configuration technique',
        '(Note: Useful for big databases and low performance server)' => 'Note: utile pour les bases de données volumineuses et les serveurs peu performants',
        '(The identify of the system. Each ticket number and each http session id starts with this number)' =>
            '(L\'identité du système. Chaque numéro de ticket et chaque id de session http commence avec ce nombre)',
        '(Ticket identifier. Some people want toset this to e. g. \'Ticket#\', \'Call#\' or \'MyTicket#\')' =>
            '(Identifiant des tickets. Certaines personnes veulent le configurer avec par ex: \'Ticket#\', \'Appel#\' ou \'MonTicket#\')',
        '(Used default language)' => '(Langage par défaut utilisé)',
        '(Used log backend)' => '(Backend de log utilisé)',
        '(Used ticket number format)' => '(Format numérique utilisé pour les tickets)',
        'A article should have a title!' => 'Un article doit avoir un titre !',
        'A message must be spell checked!' => 'L\'orthographe d\'un courriel doit être vérifiée !',
        'A message should have a To: recipient!' => 'Un courriel doit avoir un destinataire (À:) !',
        'A message should have a body!' => 'Un courriel doit avoir un corps !',
        'A message should have a customer!' => 'Un message doit avoir un client',
        'A message should have a subject!' => 'Un courriel doit avoir un sujet !',
        'A message should have a subject! .' => 'Un message doit avoir un sujet',
        'A new password will be sent to your e-mail adress.' => 'Un nouveau mot de passe sera envoyé à votre adresse email.',
        'A required field is:' => 'Un champ requis est:',
        'A ticket should be associated with a queue!' => 'Un ticket doit être associé à une file',
        'A ticket should have a type!' => 'Un ticket devrait avoir un type',
        'A web calendar' => 'Un calendrier Web',
        'A web file manager' => 'Un gestionnaire de fichier via le web',
        'A web mail client' => 'Un client de messagerie via le web',
        'About OTRS' => 'Au sujet \'OTRS',
        'Absolut Period' => 'Période absolue',
        'Account Type' => 'Type de compte',
        'Activates TypeAhead for the autocomplete feature, that enables users to type in whatever speed they desire, without losing any information. Often this means that keystrokes entered will not be displayed on the screen immediately.' =>
            'Active la fonction TypeAhead pour l\'autocomplétion. Ceci permet à l\'utilisateur de taper à la vitesse désirée sans perte d\'information. Souvent cela signifie que les caractères frappés ne seront pas affichés à l\'écran immédiatement.',
        'Add Customer User' => 'Ajouter un client',
        'Add System Address' => 'Ajouter une adresse système',
        'Add User' => 'Ajouter un utilisateur',
        'Add a new Agent.' => 'Ajoute un nouvel opérateur.',
        'Add a new Customer Company.' => 'Ajouter un nouveau service',
        'Add a new Group.' => 'Ajouter un nouveau groupe',
        'Add a new Notification.' => 'Ajouter une nouvelle notification',
        'Add a new Priority.' => 'Ajouter une nouvelle priorité',
        'Add a new Role.' => 'Ajoute un nouveau rôle.',
        'Add a new SLA.' => 'Ajouter un nouveau SLA',
        'Add a new Salutation.' => 'Ajoute un nouvel en-tête.',
        'Add a new Service.' => 'Ajoute un nouveau Service.',
        'Add a new Signature.' => 'Ajouter une nouvelle signature.',
        'Add a new State.' => 'Ajoute un nouvel état.',
        'Add a new System Address.' => 'Ajoute une nouvelle adresse système',
        'Add a new Type.' => 'Ajoute un nouveau Type.',
        'Add a new salutation' => 'Ajouter un nouvel en-tête',
        'Add a note to this ticket!' => 'Ajouter une note au ticket !',
        'Add mail adress %s to the Bcc field' => 'Ajouter adresse email %s a     u champ Bcc',
        'Add mail adress %s to the Cc field' => 'Ajouter adresse email %s a     u champ Cc',
        'Add mail adress %s to the To field' => 'Ajouter adresse email %s au champ To',
        'Add new attachment' => 'Ajouter un nouvel attachement',
        'Add note to ticket' => 'Ajouter une note au ticket',
        'Add to list of subscribed tickets' => 'iAjouter à la liste des tickets abonnés',
        'Added User "%s"' => 'Ajout de l\'utilisateur "%s"',
        'Adds a suffix with the actual year and month to the otrs log file. A logfile for every month will be created.' =>
            'Ajoute un suffix avec l\'année et le mois actuel au fichier de log otrs. Un fichier sera créé pour chaque mois.',
        'Adds the one time vacation days for the calendar number 1. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances pour le calendrier 1. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the one time vacation days for the calendar number 2. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances pour le calendrier 2. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the one time vacation days for the calendar number 3. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances pour le calendrier 3. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the one time vacation days for the calendar number 4. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances pour le calendrier 4. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the one time vacation days for the calendar number 5. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances pour le calendrier 5. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the one time vacation days for the calendar number 6. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances pour le calendrier 6. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the one time vacation days for the calendar number 7. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances pour le calendrier 7. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the one time vacation days for the calendar number 8. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances pour le calendrier 8. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the one time vacation days for the calendar number 9. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances pour le calendrier 9. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the permanent vacation days for the calendar number 1. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances permanentes pour le calendrier 1. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the permanent vacation days for the calendar number 2. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances permanentes pour le calendrier 2. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the permanent vacation days for the calendar number 3. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances permanentes pour le calendrier 3. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the permanent vacation days for the calendar number 4. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances permanentes pour le calendrier 4. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the permanent vacation days for the calendar number 5. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances permanentes pour le calendrier 5. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the permanent vacation days for the calendar number 6. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances permanentes pour le calendrier 6. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the permanent vacation days for the calendar number 7. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances permanentes pour le calendrier 7. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the permanent vacation days for the calendar number 8. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances permanentes pour le calendrier 8. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Adds the permanent vacation days for the calendar number 9. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Ajoute les jour de vacances permanentes pour le calendrier 9. Merci d\'utiliser un seul chiffre pour les nombres de 1 à 9 (au lieu de 01 - 09).',
        'Admin-Area' => 'Zone d\'administration',
        'Admin-Email' => 'Adresse électronique de l\'administrateur',
        'Admin-Password' => 'Mot de passe de l\'administrateur',
        'Admin-User' => 'Administrateur',
        'Admin-password' => 'Mot de passe Administrateur',
        'Advisory' => 'Avertissement',
        'Agent Mailbox' => 'Boîte aux lettres de l\'opérateur',
        'Agent Preferences' => 'Préférences de l\'opérateur',
        'Agent based' => 'Basé sur l\'opérateur',
        'Agent-Area' => 'Interface de l\'opérateur',
        'All Agents' => 'Tous les opérateurs',
        'All Customer variables like defined in config option CustomerUser.' =>
            'Toutes les variables client tels que définies dans les options "Client utilisateur"',
        'All customer tickets.' => 'Tous les tickets du client',
        'All email addresses get excluded on replaying on composing an email.' =>
            'Toutes les adresses électroniques sont enlevées lors du rejeu de la rédaction d\'un courriel',
        'All email addresses get excluded on replaying on composing and email.' =>
            'Toutes les adresses électroniques sont enlevées lors du rejeu de la rédaction d\'un courriel',
        'All incoming emails with this "Email" (To:) will be dispatched in the selected queue!' =>
            'Tous les courriels avec cette adresse électronique en destinataire (À:) seront répartis dans la file sélectionnée !',
        'All messages' => 'Tous les messages',
        'All new tickets!' => 'Tous les nouveaux tickets !',
        'All tickets where the reminder date has reached!' => 'Tous les tickets dont la date de rappel est atteinte',
        'All tickets which are escalated!' => 'Tous les tickets en escalade !',
        'Allocate %s to' => 'Allouer %s à',
        'Allocate CustomerUser to service' => 'Allouer le client utilisateur au service',
        'Allocate services to CustomerUser' => 'Allouer les services au client utilisateur',
        'An' => 'Un',
        'Answer' => 'Réponse',
        'Article Create Times' => 'Heures de création d\'article',
        'Article created' => 'Article créé',
        'Article created between' => 'Article créé entre',
        'Article filter settings' => 'Paramètres de filtrage d\'article',
        'ArticleID' => 'Identifiant de l\'Article',
        'Attach' => 'Attacher',
        'Attribute' => 'Attributs',
        'Auto Response From' => 'Réponse automatique de ',
        'Bounce Ticket: ' => 'Renvoyer Ticket',
        'Bounce ticket' => 'Renvoyer le ticket',
        'CSV' => 'CSV',
        'Can not create link with %s!' => 'Impossible de créer un lien avec %s !',
        'Can not delete link with %s!' => 'Impossible d\'effacer le lien avec %s !',
        'Can\'t update password, invalid characters!' => 'Mise à jour du mot de passe impossible, caractères invalides !',
        'Can\'t update password, must be at least %s characters!' => 'Mise à jour du mot de passe impossible, Le mot de passe doit avoir au moins %s caractères !',
        'Can\'t update password, must contain 2 lower and 2 upper characters!' =>
            'Mise à jour du mot de passe impossible, Le mot de passe doit comporter 2 majuscules et 2 minuscules !',
        'Can\'t update password, needs at least 1 digit!' => 'Mise à jour du mot de passe impossible, Le mot de passe doit comporter un chiffre minimum !',
        'Can\'t update password, needs at least 2 characters!' => 'Mise à jour du mot de passe impossible, Le mot de passe doit comporter 2 caractères minimum !',
        'Can\'t update password, your new passwords do not match! Please try again!' =>
            'Mise à jour du mot de passe impossible, les mots de passe sont différents ! Essayez à nouveau svp !',
        'Category Tree' => 'Liste des catégories',
        'Change %s Relations for' => 'Modifier les Relations %s pour',
        'Change %s Relations for %s' => 'Modifier Relations %s pour %s',
        'Change %s settings' => 'Changer les param&ecirc;tres de %s',
        'Change Times' => 'Heures de modification',
        'Change free text of ticket' => 'Changer le texte libre du ticket',
        'Change owner of ticket' => 'Changer le propriétaire du ticket',
        'Change priority of ticket' => 'Modification de la priorité du ticket',
        'Change responsible of ticket' => 'Changer le responsable du ticket',
        'Change roles <-> groups settings' => 'Changer les rôles <-> paramètres des groupes',
        'Change the ticket customer!' => 'Changer le client du ticket !',
        'Change the ticket owner!' => 'Changer le propriétaire du ticket !',
        'Change the ticket priority!' => 'Changer la priorité du ticket !',
        'Change user <-> group settings' => 'Modifier les paramètres utilisateurs <-> groupes',
        'Change users <-> roles settings' => 'Changement d\'utilisateur <-> paramètres des rôles',
        'ChangeLog' => 'Enregistrement des changements',
        'Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behind a dial-up line!' =>
            'Vérifier les enregistrements MX des adresses email utilisées en créant une réponse. N\'utilisez pas CheckMXRecord si votre machine OTRS se trouve derrière une ligne téléphonique.',
        'Child-Object' => 'Objet Enfant',
        'City{CustomerUser}' => 'Ville{CustomerUser}',
        'Clear From' => 'Vider le formulaire',
        'Clear To' => 'Effacer la zone de saisie "De:"',
        'Click here to report a bug!' => 'Cliquer ici pour signaler une anomalie !',
        'Close Times' => 'Temps de fermeture',
        'Close this ticket!' => 'Fermer ce ticket !',
        'Close ticket' => 'Ticket clos',
        'Close type' => 'Type de clôture',
        'Close!' => 'Clôture!',
        'Collapse View' => 'Réduire',
        'Comment (internal)' => 'Commentaire interne',
        'Comment{CustomerUser}' => 'Commentaire{CustomerUser}',
        'CompanyTickets' => 'Tickets de l\'entreprise cliente',
        'Compose Answer' => 'Rédiger une réponse',
        'Compose Email' => 'Écrire un courriel',
        'Compose Follow up' => 'Rédiger une note de suivi',
        'Config Options' => 'Options de configuration',
        'Config options (e. g. &lt;OTRS_CONFIG_HttpType&gt;)' => 'Options de configuration (ex: &lt;OTRS_CONFIG_HttpType&gt;)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>)' => 'Options de configuration (ex: <OTRS_CONFIG_HttpType>)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>).' => 'Propriétés de la configuration',
        'Contact customer' => 'Contacter le client',
        'Country{CustomerUser}' => 'Pays{CustomerUser}',
        'Create New Template' => 'Créer nouveau Template',
        'Create Times' => 'Dates de création',
        'Create new Phone Ticket' => 'Saisie d\'une demande téléphonique',
        'Create new database' => 'Créer une nouvelle base de données',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...).' =>
            'Créer de nouveaux groupes permettra de gérer les droits d\'accès pour les différents groupes de l\'opérateur (exemple: achats, comptabilité, support, ventes...).',
        'Create your first Ticket' => 'Créer votre premier Ticket',
        'Create/Expires' => 'Créer/Expirer',
        'CreateTicket' => 'Créer Ticket',
        'Customer Move Notify' => 'Notification lors d\'un changement de file',
        'Customer Owner Notify' => 'Notification lors d\'un changement de propriétaire',
        'Customer State Notify' => 'Notification lors d\'un changement d\'état',
        'Customer User' => 'Client Utilisateur',
        'Customer User Management' => 'Gestion des clients',
        'Customer Users' => 'Clients',
        'Customer Users <-> Groups' => 'Clients <-> Groupes',
        'Customer Users <-> Groups Management' => 'Clients <-> Gestion des groupes',
        'Customer Users <-> Services Management' => 'Client utilisateur <-> Gestion des Services',
        'Customer history' => 'Historique du client',
        'Customer history search' => 'Recherche dans l\'historique client',
        'Customer history search (e. g. "ID342425").' => 'Recherche dans l\'historique client (ex: "ID342425")',
        'Customer item (icon) which shows the open tickets of this customer as info block.' =>
            'Icon de l\'entreprise à montrer dnas le ticket pour ce client dnas le bloc d\'information.',
        'Customer user will be needed to have a customer history and to login via customer panel.' =>
            'Les clients seront invités à se connecter sur la page client.',
        'CustomerID{CustomerUser}' => 'ID client{CustomerUser}',
        'CustomerUser' => 'Client utilisateur',
        'D' => 'Z-A',
        'DB Admin Password' => 'Mot de passe administrateur base de données',
        'DB Admin User' => 'nom de connexion de l\'administrateur base de donnée',
        'DB Host' => 'Nom d\'hôte de la base',
        'DB Type' => 'Type de SGBD',
        'DB connect host' => 'Nom d\'hôte de la base de donnée',
        'Days' => 'Jours',
        'Default' => 'Défaut',
        'Default Charset' => 'Charset par défaut',
        'Default Language' => 'Langage par défaut ',
        'Defines the default selection of the free field number 1 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 1 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 10 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 10 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 11 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 11 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 12 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 12 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 13 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 13 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 14 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 14 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 15 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 15 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 16 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 16 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 2 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 2 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 3 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 3 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 4 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 4 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 5 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 5 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 6 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 6 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 7 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 7 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 8 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 8 (si plus d\'une option est fournie).',
        'Defines the default selection of the free field number 9 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ libre numéro 9 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 1 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 1 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 10 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 10 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 11 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 11 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 12 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 12 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 13 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 13 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 14 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 14 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 15 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 15 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 16 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 16 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 2 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 2 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 3 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 3 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 4 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 4 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 5 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 5 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 6 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 6 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 7 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 7 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 8 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 8 (si plus d\'une option est fournie).',
        'Defines the default selection of the free text field number 9 (if more than one option is provided).' =>
            'Défini la sélection par défaut pour le champ texte libre numéro 9 (si plus d\'une option est fournie).',
        'Delete old database' => 'Effacer l\'ancienne base de données',
        'Delete this ticket!' => 'Effacer ce ticket !',
        'Detail' => 'Détail',
        'Diff' => 'Diff',
        'Discard all changes and return to the compose screen' => 'Annuler tous les changements et retourner à l\'écran de saisie',
        'Do dispatch or filter incoming emails based on email X-Headers! RegExp is also possible.' =>
            'Répartir ou filtrer les courriels entrants en se basant sur les en-têtes (X-*) ! L\'utilisation d\'expressions régulières est aussi possible.',
        'Do you really want to delete this Object?' => 'Voulez vous vraiment effacer cet objet ?',
        'Do you really want to reinstall this package (all manual changes get lost)?' =>
            'Voulez-vous vraiment réinstaller ce paquet (Tous les changements manuels seront perdus) ?',
        'Don\'t forget to add a new user to groups and/or roles!' => 'N\'oubliez pas d\'ajouter un nouvel utilisateur à des groupes et/ou des rôles !',
        'Don\'t forget to add a new user to groups!' => 'Ne pas oublier d\'ajouter un nouvel utilisateur aux groupes !',
        'Don\'t work with UserID 1 (System account)! Create new users!' =>
            'Cela ne fonctionne pas avec l\'identifiant utilisateur 1 (Compte Système) ! Veuillez créer un nouvel utilisateur !',
        'Download Settings' => 'Paramètres de téléchargement',
        'Download all system config changes.' => 'Télécharger tous les changements de la configuration système.',
        'Drop Database' => 'Effacer la base de données',
        'Dynamic-Object' => 'Objet dynamique',
        'Edit Article' => 'Éditer l\'article',
        'Edit default services.' => 'Éditer le Service par défaut',
        'Email based' => 'Basé sur le courriel',
        'Email of the system admin.' => 'Email de l\'administrateur système.',
        'Email{CustomerUser}' => 'Email{CustomerUser}',
        'Escaladed Tickets' => 'Tickets escaladés',
        'Escalation - First Response Time' => 'Rémontée du ticket - Premier temps de réponse',
        'Escalation - Solution Time' => 'Escalade - échéance pour la solution',
        'Escalation - Update Time' => 'Escalade - échéance pour le suivi',
        'Escalation Times' => 'Temps d\'escalade',
        'Escalation time' => 'Délai avant remontée du ticket',
        'Event is required!' => 'Un evenement est requis',
        'Expand View' => 'Afficher plus',
        'Explanation' => 'Explication',
        'Export Config' => 'Exporter la configuration',
        'FAQ Category' => 'Catégorie dans la FAQ',
        'FAQ History' => 'Historique de la FAQ',
        'FAQ Language' => 'Langue dans la FAQ',
        'FAQ Overview' => 'Vue d\'ensemble de la FAQ',
        'FAQ Search' => 'Chercher dans la FAQ',
        'FAQ Search Result' => 'Résultat de la recherche dans la FAQ',
        'FAQ System History' => 'Historique système de la FAQ',
        'FAQ-Area' => 'Foire Aux Questions',
        'FAQ-Article' => '(FAQ) Article',
        'FAQ-Search' => '(FAQ) Rechercher',
        'FAQ-State' => 'État FAQ',
        'Fax{CustomerUser}' => 'Fax{CustomerUser}',
        'FileManager' => 'Gestionnaire de fichiers',
        'Filelist' => 'Liste des fichiers',
        'Filter for Language' => 'Filtre pour Langue',
        'Filtername' => 'Nom du filtre',
        'Firstname{CustomerUser}' => 'Prénom{CustomerUser}',
        'Follow up' => 'Note de suivi',
        'Follow up notification' => 'Notification de suivi',
        'For very complex stats it is possible to include a hardcoded file.' =>
            'Pour des statistiques très complexes, il est possible d\'inclure un fichier déjà encodé',
        'Form' => 'Formulaire',
        'Foward ticket: ' => 'Faire suivre le ticket:',
        'Frontend' => 'Interface',
        'Full qualified domain name of your system.' => 'FQDN nom de domaine complet du système.',
        'Fulltext-Search in Article (e. g. "Mar*in" or "Baue*")' => 'Recherche sur le texte d\'un article (ex: "Mar*in" or "Baue*")',
        'Go' => 'Valider',
        'Group Ro' => 'Groupe lecture seule',
        'Group based' => 'Basé sur le Groupe',
        'Group selection' => 'Sélection du groupe',
        'HTML' => 'HTML',
        'Hash/Fingerprint' => 'Hash/Empreinte',
        'Have a lot of fun!' => 'Amusez vous bien !',
        'Have you lost your password?' => 'Perdu votre mot de passe?',
        'Help' => 'Aide',
        'Here you can define the value series. You have the possibility to select one or two elements. Then you can select the attributes of elements. Each attribute will be shown as single value series. If you don\'t select any attribute all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            'Ici vous pouvez définir les valeurs de séries. Vous pouvez sélectionner un ou deux éléments. Puis vous pouvez sélectionner les attributs de ces éléments. Chaque attribut sera affiché comme une série de valeur unique. Si vous ne sélectionner aucun attribut, tous les attributs de l\'élément seront utilisés pour générer la statistique inasi que les nouveaux attributs ajoutés depuis la dernière configuration.',
        'Here you can define the value series. You have the possibility to select one or two elements. Then you can select the attributes of elements. Each attribute will be shown as single value series. If you don\'t select any attribute all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Ici vous pouvez définir les séries de valeurs. Vous avez la possibilité de sélectionner un ou deux éléments. Ensuite vous pouvez sélectionner les attributs des éléments. Chaque attribut sera affiché comme une série à une valeur. Si vous ne sélectionnez aucun attribut, tous les attributs de l\'élément seront utilisés si vous générez une statistique. De la même façon si un nouvel attribut est ajouté depuis la dernière configuration.',
        'Here you can define the x-axis. You can select one element via the radio button. If you make no selection all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            'Ici vous pouvez définir l\'axe x. Vous pouvez sélectionner un élement via les boutons radio. Si aucune sélection n\'est faite, tous les attributs seront utilisés si vous générer une statistique ainsi que les nouveaux attributs ajoutés depuis la dernière configuration.',
        'Here you can define the x-axis. You can select one element via the radio button. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Ici vous pouvez définir l\'axe x. Vous pouvez séléectionner un élément par le bouton radio. Si aucune sélection n\'est faite, tous les attributs de l\'élément seront utilisés si vous générez une statistique. De la même façon si un nouvel attribut est ajouté depuis la dernière configuration.',
        'Here you can define the x-axis. You can select one element via the radio button. Then you you have to select two or more attributes of the element. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Ici vous pouvez définir l\'axe des abcisses. Vous pouvez sélectionner un élement via le bouton radio. Ensuite vous devez sélectionner 2 attributs ou plus de cet élement',
        'Here you can insert a description of the stat.' => 'Vous pouvez insérer ici une description des statistiques.',
        'Here you can select the dynamic object you want to use.' => 'Ici vous pouvez sélectionner l\'objet dynamique que vous voulez utiliser',
        'Home' => 'Accueil',
        'How we should adress you' => 'Comment doit-on vous contacter',
        'If Secure Mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Si le mode sécurisé n\'est pas activé, activer le via le SysConfig car votre application est déjà en train de tourner.',
        'If a new hardcoded file is available this attribute will be shown and you can select one.' =>
            'Si un nouveau fichier encodé est disponible, cet attribut sera visible et vous pourrez le sélectionner',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked for the old owner.' =>
            'Si un ticket est clôturé et que le client envoie une suite, le ticket sera verrouillé pour l\'ancien propriétaire',
        'If a ticket will not be answered in this time, just only this ticket will be shown.' =>
            'Si une réponse n\'est pas apportée au ticket dans le temps imparti, seul ce ticket sera affiché',
        'If an agent locks a ticket and he/she will not send an answer within this time, the ticket will be unlock automatically. So the ticket is viewable for all other agents.' =>
            'Si un opérateur verrouille un ticket et qu\'il/elle n\'envoie pas une réponse dans le temps imparti, le ticket sera déverrouillé automatiquement. Le ticket sera alors visible par tous les autres opérateurs',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the user).' =>
            'Si rien n\'est sélectionné, il n\'y aura pas de droits dans ce groupe (Les tickets ne seront plus disponible pour l\'utilisateur).',
        'If there is an article added, such as a follow-up via e-mail or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Si un article est ajouté, tel un suivi par email ou via le portail client, le délai d\'escalade est remis à zéro. Si un contact client n\'est pas ajouté à un ticket, soit par email externe ou téléphone, avant que le temps défini ici expire, le ticket sera escaladé.',
        'If you need the sum of every column select yes.' => 'Si vous avez besoin de la somme pour chaque colonne, choisissez Oui',
        'If you need the sum of every row select yes' => 'Si vous avez besoin de la somme pour chaque ligne, choisissez Oui',
        'If you use RegExp, you also can use the matched value in () as [***] in \'Set\'.' =>
            'Si vous utilisez RegExp, vous pouvez aussi tester la valeur entre () comme [***] dans \'Set\'.',
        'If you want to account time, please provide Subject and Text!' =>
            'Si vous voulez comptabiliser le temps, merci de fournir un sujet et un texte',
        'If you want to install OTRS on other database systems, please refer to the file README.database.' =>
            'Si vous souhaitez installer OTRS sur une autre base de données, merci de se référer au fichier README.database.',
        'Image' => 'Image',
        'Important' => 'Important',
        'In order to experience OTRS, you\'ll need to enable Javascript in your browser.' =>
            'Pour utiliser OTRS, vous devez activer le JavaScript dans votre navigateur.',
        'In this form you can select the basic specifications.' => 'Dans ce formulaire, vous pouvez choisir les caractéristiques de base',
        'In this way you can directly edit the keyring configured in Kernel/Config.pm.' =>
            'Dans ce cas vous pouvez directement éditer le trousseau de clé dans Kernel/Config.pm',
        'Information about the Stat' => 'Informations à propos de la statistique',
        'Insert of the common specifications' => 'Insertion des caractéristiques communes',
        'Is Job Valid' => 'Cette tâche est-elle valide',
        'Is Job Valid?' => 'Cette tâche est-elle valide?',
        'It\'s useful for ASP solutions.' => 'C\'est utile pour les fournisseurs d\'applications.',
        'It\'s useful for a lot of users and groups.' => 'Pratique lorsqu\'on a beaucoup d\'utilisateurs et de groupes',
        'Job-List' => 'Liste de tâches',
        'Keyword' => 'Mot clé',
        'Keywords' => 'Mots clés',
        'Last update' => 'Dernière mise à jour',
        'Lastname{CustomerUser}' => 'Nom{CustomerUser}',
        'Link Table' => 'Talbe des liens',
        'Link this ticket to an other objects!' => 'Lier ce ticket à un autre objet !',
        'Link to Parent' => 'Lier au Parent',
        'LinkType' => 'Type de lien',
        'Linked as' => 'Liée en tant que',
        'Load Settings' => 'Charger les paramètres',
        'Lock it to work on it!' => 'Verrouillez-le pour travailler dessus !',
        'Logfile' => 'fichier de log',
        'Logfile just needed for File-LogModule!' => 'Fichier de log nécessaire pour le File-LogModule',
        'Logfile too large, you need to reset it!' => 'Fichier de log trop grand, une remise à zéro est nécessaire !',
        'Login failed! Your username or password was entered incorrectly.' =>
            'La connexion a échoué ! Votre nom d\'utilisateur ou votre mot de passe sont erronés.',
        'Lookup' => 'Consulter',
        'Mail Management' => 'Gestion des courriels',
        'Mailbox' => 'Boîte aux lettres',
        'Match' => 'Correspond',
        'Max. shown Tickets a page' => 'Nombre maximum de Tickets per page',
        'Merge this ticket!' => 'Fusionner ce ticket !',
        'Message for new Owner' => 'Courriel pour le nouveau propriétaire',
        'Message sent to' => 'Courriel envoyé à',
        'Misc' => 'Divers',
        'Mobile{CustomerUser}' => 'Mobile{CustomerUser}',
        'Modified' => 'Modifié',
        'Modules' => 'Modules',
        'Move notification' => 'Notification de mouvement',
        'Multiple selection of the output format.' => 'Selection multiple du format de sortie',
        'MyTickets' => 'Mes tickets',
        'Name is required!' => 'Un nom est requis!',
        'Need a valid email address or don\'t use a local address!' => 'Une adresse email valide est nécessaire ou n\'utilisez pas d\'adresse email locale!',
        'Need a valid mail address or don\'t use a local email address' =>
            'Une adresse mail valide est nécessaire ou n\'utilisez pas d\'adresse email locale',
        'Need a valid mail address or don\'t use a local email address.' =>
            'Une adresse email valide est nécessaire ou n\'utilisez pas d\'adresse email locale.',
        'Need valid email address or don\'t use local address' => 'Une adresse memail valide est requise ou bien n\'utilisez pas d\'adresse locale',
        'New Agent' => 'Nouveau Opérateur',
        'New Customer' => 'Nouveau Client',
        'New FAQ Article' => '(FAQ) Nouvel article',
        'New Group' => 'Nouveau groupe',
        'New Group Ro' => 'Nouveau groupe (lecture seule)',
        'New Password' => 'Nouveau mot de passe',
        'New Priority' => 'Nouvelle Priorité',
        'New SLA' => 'Nouveau SLA',
        'New Service' => 'Nouveau Service',
        'New State' => 'Nouvel État',
        'New Ticket Lock' => 'Nouveau Verrou',
        'New TicketFreeFields' => 'Nouveau champs libres',
        'New Title' => 'Nouveau Titre',
        'New Type' => 'Nouveau Type',
        'New account created. Sent Login-Account to %s.' => 'Nouveau compte crée. Identifiant envoyé à %s',
        'New messages' => 'Nouveaux messages',
        'New password again' => 'Nouveau mot de passe (encore)',
        'Next Week' => 'La semaine prochaine',
        'No * possible!' => 'Pas de * possible!',
        'No Packages for requested Framework in this Online Repository, but Packages for other Frameworks!' =>
            'Aucun paquet pour le Framework sélectionné dans ce dépôt en ligne, mais des paquets pour d\'autres Frameworks !',
        'No Packages or no new Packages in selected Online Repository!' =>
            'Pas de paquets ou de nouveaux paquets dans le dépot en ligne sélectionné !',
        'No Permission' => 'Pas d\'autorisation',
        'No Ticket has been written yet.' => 'Aucun Ticket créé pour le moment',
        'No matches found' => 'Aucun résultat',
        'No means, send agent and customer notifications on changes.' => 'Non signifie : Envoyer un courriel à l\'opérateur et au client sur changement.',
        'No time settings.' => 'Pas de paramètre de temps',
        'Note Text' => 'Note',
        'Notification (Customer)' => 'Notification (Client)',
        'Notifications' => 'Notifications',
        'OTRS DB Name' => 'Nom de la base OTRS',
        'OTRS DB Password' => 'Mot de passe de la base OTRS',
        'OTRS DB User' => 'Utilisateur de la base OTRS',
        'OTRS DB connect host' => 'Hôte de la base OTRS',
        'OTRS sends an notification email to the customer if the ticket is moved.' =>
            'OTRS envoi un courriel au client lorsque le ticket change de file.',
        'OTRS sends an notification email to the customer if the ticket owner has changed.' =>
            'OTRS envoi un courriel au client lorsque le ticket change de propriétaire.',
        'OTRS sends an notification email to the customer if the ticket state has changed.' =>
            'OTRS envoi un courriel au client lorsque le ticket change d\'état.',
        'Object already linked as %s.' => 'Objet déjà lié en tant que %s',
        'Of couse this feature will take some system performance it self!' =>
            'Bien évidemment, cette fonction consomme des ressources système !',
        'One or more errors occured!' => 'Une ou plusieurs erreurs sont survenues',
        'Only for ArticleCreate Event.' => 'Seulement pour l\'évènement Création d\'article',
        'Open Tickets' => 'Tickets ouverts',
        'Options ' => 'Options',
        'Options of the current customer user data (e. g. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)' =>
            'Options des données du client actuel (ex:  &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>)' =>
            'Options concernant les données du client actuel (ex: <OTRS_CUSTOMER_DATA_UserFirstname>)',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>).' =>
            'Propriétés des données personnelles du client',
        'Options of the current user who requested this action (e. g. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)' =>
            'Options concernant l\'utilisateur actuel ayant effectué cet action (ex: &lt;OTRS_CURRENT_UserFirstname&gt;)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>)' =>
            'Options concernant l\'utilisateur actuel ayant effectué cet action (ex: <OTRS_CURRENT_UserFirstname>)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>).' =>
            'Propriétés du client qui a demandé cette action (e. g. <OTRS_CURRENT_UserFirstname>).',
        'Options of the ticket data (e. g. &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)' =>
            'Options des données du ticket (ex: &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)',
        'Options of the ticket data (e. g. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Options des données du ticket (ex: <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Options des données du ticket (ex: <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Options des données du ticket (ex:  <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).' =>
            'Propriétés du ticket',
        'Other Options' => 'Autres options',
        'Out Of Office' => 'Absent du bureau',
        'POP3 Account Management' => 'Gestion du compte POP3',
        'Package' => 'Paquet',
        'Package not correctly deployed! You should reinstall the Package again!' =>
            'Le paquet n\'a pas été correctement déployé ! Vous devez l\'installer à nouveau !',
        'Package not correctly deployed! You should reinstall the package again!' =>
            'Package incorrectement déployé! Vous devriez réinstaller le package!',
        'Param 1' => 'Paramètre 1',
        'Param 1 key' => 'Clé Paramètre 1',
        'Param 2' => 'Paramètre 2',
        'Param 2 key' => 'Clé Paramètre 2',
        'Param 3' => 'Paramètre 3',
        'Param 3 key' => 'Clé Paramètre 3',
        'Param 4' => 'Paramètre 4',
        'Param 4 key' => 'Clé Paramètre 4',
        'Param 5' => 'Paramètre 5',
        'Param 5 key' => 'Clé Paramètre 5',
        'Param 6' => 'Paramètre 6',
        'Param 6 key' => 'Clé Paramètre 6',
        'Parent-Object' => 'Objet Parent',
        'Password is already in use! Please use an other password!' => 'Mot de passe déjà utilisé ! Essayez en un autre svp !',
        'Password is already used! Please use an other password!' => 'Ce mot de passe a déjà été utilisé ! Essayez en un autre svp !',
        'Passwords doesn\'t match! Please try it again!' => 'Les mots de passes diffèrent! Essayez de nouveau svp !',
        'Pending Times' => 'Dates d\'échéance',
        'Pending messages' => 'Message en attente',
        'Pending type' => 'Type d\'attente',
        'Permission settings. You can select one or more groups to make the configurated stat visible for different agents.' =>
            'Permissions. Vous pouvez sélectionner un ou plusieurs groupes pour autoriser la consultation des statistiques pour différents opérateurs.',
        'Permissions to change the ticket owner in this group/queue.' => 'Permission de changer le propriétaire d\'un ticket dans cette file/ce groupe.',
        'PhoneView' => 'Vue téléphone',
        'Phone{CustomerUser}' => 'Téléphone{CustomerUser}',
        'Please contact your admin' => 'Veuillez contacter votre admnistrateur',
        'Please enter subject.' => 'Merci d\'entrer le sujet',
        'Please provide a name.' => 'Merci de fournir un nom',
        'Please select a value' => 'Merci de choisir une valeur',
        'Please select only one element or turn off the button \'Fixed\' where the select field is marked !' =>
            'Veuillez sélectionner un seul élément ou désactiver le bouton \'Fixe\' là où le champ sélectionné est en surbrillance ! ',
        'Print this ticket!' => 'Imprimer ce ticket !',
        'Prio' => 'Priorité',
        'Problem' => 'Problème',
        'Queue <-> Auto Responses Management' => 'Files <-> Gestion des réponses automatiques',
        'Queue ID' => 'Identifiant de la File',
        'Queue Management' => 'Gestion des files',
        'Queue is required.' => 'Une file est requise',
        'Queues <-> Auto Responses' => 'Files <-> Réponses automatiques',
        'Realname' => 'Véritable Nom',
        'Rebuild' => 'Re-construction',
        'Recipients' => 'Destinataires',
        'Reminder' => 'Rappel',
        'Reminder messages' => 'Message de rappel',
        'Remove from list of subscribed tickets' => 'Retirer de la liste des tickets abonnés',
        'Remove this Search Term.' => 'Supprimer ce terme de recherche.',
        'Required Field' => 'Champ requis',
        'Required!' => 'Requis',
        'Response Management' => 'Gestion des réponses',
        'Responses <-> Attachments Management' => 'Réponses <-> Gestion des pièces jointes',
        'Responses <-> Queue Management' => 'Réponses <-> Gestion des files',
        'Return to the compose screen' => 'Retourner à l\'écran de saisie',
        'Role' => 'Rôles',
        'Roles <-> Groups Management' => 'Rôles <-> Gestion des groupes',
        'Roles <-> Users' => 'Rôles <-> opérateurs',
        'Roles <-> Users Management' => 'Rôles <-> Gestion des utilisateurs',
        'Run Search' => 'Exécuter recherche',
        'Save Job as?' => 'Sauver la tâche en tant que?',
        'Save Search-Profile as Template?' => 'Sauver le profil de recherche ?',
        'Schedule' => 'Planifier',
        'Search Result' => 'Résultat de la recherche',
        'Search for' => 'Chercher à',
        'Search for customers (wildcards are allowed).' => 'Chercher des clients (les étoiles sont autorisées)',
        'Search-Profile as Template?' => 'Profile de recherche comme Template?',
        'Secure Mode need to be enabled!' => 'Le mode sécurisé doit être activé !',
        'Select Box' => 'Requête SQL libre.',
        'Select Box Result' => 'Choisissez le résultat',
        'Select Group' => 'Sélectionner Groupe',
        'Select Source (for add)' => 'Sélectionnez une source (pour ajout)',
        'Select group' => 'Sélectionner le groupe',
        'Select the customeruser:service relations.' => 'Sélectionnez les relations client:service.',
        'Select the element, which will be used at the X-axis' => 'Sélectionnez l\'élément qui sera utilisé pour l\'axe X',
        'Select the restrictions to characterise the stat' => 'Sélectionnez les restrictions pour affiner les statistiques',
        'Select the role:user relations.' => 'Sélection des relations role/utilisateur',
        'Select the user:group permissions.' => 'Sélectionnez les permissions pour l\'utilisateur:groupe.',
        'Select your QueueView refresh time.' => 'Choix du délai de rafraîchissement de la vue des files',
        'Select your default spelling dictionary.' => 'Sélectionnez votre correcteur orthographique par défaut',
        'Select your frontend Charset.' => 'Choix du jeu de caractères de l\'interface',
        'Select your frontend QueueView.' => 'Choisissez votre interface de vue des files',
        'Select your frontend language.' => 'Choix de la langue de l\'interface',
        'Select your out of office time.' => 'Sélectionnez vos heures d\'absence du bureau',
        'Select your screen after creating a new ticket.' => 'Sélectionnez l\'écran qui sera affiché après avoir créé un nouveau ticket.',
        'Selection needed' => 'Sélection requise',
        'Send Administrative Message to Agents' => 'Envoyer un Message Administratif aux opérateurs',
        'Send Notification' => 'Envoyer une notification',
        'Send me a notification if a customer sends a follow up and I\'m the owner of this ticket.' =>
            'Me prévenir si un client envoie un suivi (follow-up) sur un ticket dont je suis propriétaire.',
        'Send me a notification of an watched ticket like an owner of an ticket.' =>
            'Envoyer une notification sur un ticked surveillé comme pour un propriétaire d\'un ticket',
        'Send no notifications' => 'Ne pas envoyer de notifications',
        'Sent new password to: %s' => 'Envoit du nouveau mot de passe à: %s',
        'Sent password token to: %s' => 'Envoit du jeton à: %s',
        'Sessions' => 'Sessions',
        'Set customer user and customer id of a ticket' => 'Assigner un utilisateur client et un identifiant client pour le ticket.',
        'Set new SLA' => 'Mettre nouvel SLA',
        'Set this ticket to pending!' => 'Mettre le ticket en attente !',
        'Show' => 'Voir',
        'Shows the ticket history!' => 'Voir l\'historique du ticket !',
        'Site' => 'Site',
        'Solution' => 'Solution',
        'Sort by' => 'Trier par',
        'Source' => 'Source',
        'Spell Check' => 'Vérification orthographique',
        'Split' => 'Scinder',
        'State Type' => 'Type d\'état',
        'Static-File' => 'Fichier statique',
        'Stats-Area' => 'Statistiques',
        'Step %s of %s' => 'Etape %s de %s',
        'Street{CustomerUser}' => 'Rue{CustomerUser}',
        'Sub-Queue of' => 'Sous-file',
        'Sub-Service of' => 'Sous-service de',
        'Subscribe' => 'S\'abonner',
        'Symptom' => 'Symptôme',
        'System History' => 'Historique du système',
        'System State Management' => 'Gestion des états du système',
        'System Status' => 'État du système',
        'Systemaddress' => 'Adresse du Système',
        'Take care that you also updated the default states in you Kernel/Config.pm!' =>
            'Prenez garde de bien mettre à jour les états par défaut dans votre Kernel/Config.pm !',
        'Termin1' => 'Termin1',
        'Text is required!' => 'Texte requis',
        'The Ticket was locked' => 'Le Ticket a été verrouillé',
        'The User Name you wish to have' => 'Le nom d\'utilisateur que vous souhaitez avoir',
        'The customer id is required!' => 'L\'identifiant client est requis!',
        'The customer is required!' => 'Le client est requis!',
        'The customer is required.' => 'Le client est requis.',
        'The field is required.' => 'Le champ est obligatoire',
        'The identify of the system. Each ticket number and each http session id starts with this number.' =>
            'L\'idéntité de ce système. Chaque numéro de ticket et chaque id de session http commence avec ce numéro',
        'The message being composed has been closed.  Exiting.' => 'Le courriel en cours de rédaction a été clôturé. Sortie.',
        'The subject is required!' => 'Sujet requis',
        'The subject is required.' => 'Le sujet est requis',
        'The text is required!' => 'Texte requis',
        'The text is required.' => 'Le texte est requis',
        'These values are read-only.' => 'Ces valeurs sont en lecture seule.',
        'These values are required.' => 'Ces valeurs sont obligatoires.',
        'They can be administrered through the configuration setting "CustomerGroupAlwaysGroups".' =>
            'Ils peuvent être gérer via l\'option de configuration "CustomerGroupAlwaysGroups".',
        'This account exists.' => 'Ce compte existe déjà.',
        'This is useful if you want that no one can get the result of the stat or the stat isn\'t ready configurated.' =>
            'Ceci est utilie si vous voulez que personne n\'obtienne les statistiques ou si elles ne sont pas encore configurées',
        'This value is required' => 'Cette valeur est requise',
        'This window must be called from compose window' => 'Cette fenêtre doit être appelée depuis la fenêtre de rédaction',
        'Ticket Change Times (between)' => 'Date de modification du ticket (entre)',
        'Ticket Change Times (from moment)' => 'Date de modification du ticket (à partir de)',
        'Ticket Close Times (between)' => 'Date de fermeture du ticket (entre)',
        'Ticket Close Times (from moment)' => 'Date de fermeture du ticket (à partir de)',
        'Ticket Comands' => 'Commandes Ticket',
        'Ticket Create Times (between)' => 'Date de création du ticket (entre)',
        'Ticket Create Times (from moment)' => 'Date de création du ticket (à partir de)',
        'Ticket Lock' => 'Ticket verrouillé',
        'Ticket Number Generator' => 'Générateur de numéro pour les tickets',
        'Ticket Search' => 'Recherche de ticket',
        'Ticket Status View' => 'Vue de l\'état du ticket',
        'Ticket Type is required!' => 'Le Type du Ticket est requis !',
        'Ticket add note' => 'Ajouter note au Ticket',
        'Ticket escalation!' => 'Remontée du ticket !',
        'Ticket locked!' => 'Ticket verrouillé !',
        'Ticket owner options (e. g. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)' =>
            'Options du propriétaire du ticket (ex: &lt;OTRS_OWNER_USERFIRSTNAME&gt;)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>)' => 'Options du propriétaire d\'un ticket (ex: <OTRS_OWNER_UserFirstname>)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>).' => 'Propriétés du propriétaire du ticket',
        'Ticket responsible options (e. g. <OTRS_RESPONSIBLE_UserFirstname>).' =>
            'Propriétés du responsable du ticket',
        'Ticket selected for bulk action!' => 'Ticket sélectionné pour une action groupée !',
        'Ticket type is required.' => 'Le type du Ticket est requis',
        'Ticket unlock!' => 'Déverrouiller le ticket !',
        'Ticket#' => 'Ticket#',
        'Ticket-Area' => 'Tickets',
        'TicketFreeFields' => 'Champs libres du ticket',
        'TicketFreeText' => 'Texte Libre du Ticket',
        'TicketID' => 'Identifiant du Ticket',
        'TicketZoom' => 'Vue en détails',
        'Tickets available' => 'Tickets disponibles',
        'Tickets shown' => 'Tickets affichés',
        'Tickets which need to be answered!' => 'Tickets en attente de réponse !',
        'Time units is a required field!' => 'L\'unité de temps est un champ obligatoire!',
        'Time units is a required field.' => 'L\'unité de temps est un champ obligatoire.',
        'Time units is required field.' => 'L\'unité de temps est un champ obligatoire',
        'Timeover' => 'Temp écoulé',
        'Times' => 'Fois',
        'Title is required.' => 'Un titre est requis',
        'Title of the stat.' => 'Titre des statistiques',
        'Title{CustomerUser}' => 'Titre{CustomerUser}',
        'Title{user}' => 'Titre{user}',
        'To get the article attribute (e. g. (<OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).' =>
            'Pour avoir l\'attribut d\'article (i.e. (<OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).',
        'To get the article attribute (e. g. (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).' =>
            'pour avoir les attributs de l\'article (par ex. (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> et <OTRS_CUSTOMER_Body>)',
        'Top of Page' => 'Haut de page',
        'Total hits' => 'Nombre de résultats trouvés',
        'Type:' => 'Type:',
        'U' => 'A-Z',
        'Unable to parse Online Repository index document!' => 'Impossible d\'analyser l\'index du dépôt en ligne !',
        'Uniq' => 'Unique',
        'Unlock Tickets' => 'Déverrouiller les Tickets',
        'Unlock to give it back to the queue!' => 'Déverrouillez-le pour qu\'il retourne dans sa file !',
        'Unsubscribe' => 'Se désabonner',
        'Use utf-8 it your database supports it!' => 'Utilisez UTF-8 si votre base de donnée le supporte !',
        'Useable options' => 'Options accessibles',
        'Used default language.' => 'Langue par défaut utilisée.',
        'Used log backend.' => 'Backend de log utilisé.',
        'User Management' => 'Administration des utilisateurs',
        'User will be needed to handle tickets.' => 'Un utilisateur sera nécessaire pour gérer les tickets.',
        'Username{CustomerUser}' => 'Nom utilisateur{CustomerUser}',
        'Users' => 'Utilisateurs',
        'Users <-> Groups' => 'Utilisateurs <-> Groupes',
        'Users <-> Groups Management' => 'Utilisateurs <-> Gestion des groupes',
        'Verify New Password' => 'Vérifier le nouveau mot de passe',
        'Warning! This tickets will be removed from the database! This tickets are lost!' =>
            'Attention, ces tickets seront éffacés de la base de donnée ! Ils seront définitivement perdus !',
        'Watch notification' => 'Notification de suivi',
        'Web-Installer' => 'Installeur Web',
        'WebMail' => 'Webmail',
        'WebWatcher' => 'WebWatcher',
        'Welcome to OTRS' => 'Bienvenue dans OTRS',
        'Wildcards are allowed.' => 'Les étoiles sont autorisées',
        'With an invalid stat it isn\'t feasible to generate a stat.' => 'Il est impossible de produire des statistiques avec des données invalides.',
        'With the input and select fields you can configurate the stat at your needs. Which elements of a stat you can edit depends on your stats administrator who configurated the stat.' =>
            'Avec les champs de saisies et de sélection vous pouvez configurer les statistiques selon vos besoins. Le fait de pouvoir éditer ou non un élement d\'une requête de statistique dépend de l\'administrateur qui a configuré cette requête.',
        'Yes means, send no agent and customer notifications on changes.' =>
            'Oui signifie : ne rien envoyer sur changement à l\'opérateur et au client.',
        'Yes, save it with name' => 'Oui, le sauver avec le nom',
        'You got new message!' => 'Vous avez un nouveau message !',
        'You have to select two or more attributes from the select field!' =>
            'Vous devez sélectionner deux attributs ou plus !',
        'You need a To: recipient!' => 'Un destinaire To: est nécessaire!',
        'You need a To: recipient!.' => 'Un destinaire To: est nécessaire!.',
        'You need a email address (e. g. customer@example.com) in To:!' =>
            'Il faut une adresse &ecute;lectronique dans le champ &Agrave;: (ex&nbsp;: client@exemple.fr)&nbsp;!',
        'You need a to: recipient!.' => 'Un destinataire to: est nécessaire',
        'You need min. one selected Ticket!' => 'Vous devez nommer au moins un Ticket !',
        'You need to account time!' => 'Vous devez comptabiliser le temps !',
        'You need to activate %s first to use it!' => 'Vous devez d\'abord activer %s pour l\'utiliser !',
        'Your Password' => 'Votre mot de passe',
        'Your email address is new' => 'Votre adresse électronique est nouvelle',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Votre courriel concernant le ticket numéro "<OTRS_TICKET> est réémis à "<OTRS_BOUNCE_TO>". Contactez cette adresse pour de plus amples renseignements',
        'Your own Ticket' => 'Votre propre ticket',
        'Zip{CustomerUser}' => 'Code postal{CustomerUser}',
        'accept license' => 'Accepter la licence',
        'customer realname' => 'nom réel du client',
        'delete' => 'supprimer',
        'delete links' => 'supprimer liens',
        'don\'t accept license' => 'Ne pas accepter la licence',
        'down' => 'vers le bas',
        'false' => 'faux',
        'for agent firstname' => 'pour le prénom de l\'opérateur',
        'for agent lastname' => 'pour le nom de l\'opérateur',
        'for agent login' => 'pour le nom de connexion (login) de l\'opérateur',
        'for agent user id' => 'pour l\'identifiant de l\'opérateur',
        'go back' => 'Retour arrière',
        'kill all sessions' => 'Terminer toutes les sessions',
        'kill session' => 'Supprimer la session',
        'maximal period form' => 'Formulaire de durée maximum',
        'modified' => 'modifié',
        'new ticket' => 'nouveau ticket',
        'next step' => 'étape suivante',
        'send' => 'envoyer',
        'sort downward' => 'Tri décroissant',
        'sort upward' => 'Tri croissant',
        'to get the first 20 character of the subject' => 'pour avoir les 20 premiers caractères du sujet ',
        'to get the first 5 lines of the email' => 'pour avoir les 5 premières lignes du courriel',
        'to get the from line of the email' => 'pour avoir les lignes \'De\' du courriel',
        'to get the realname of the sender (if given)' => 'pour avoir le nom réel de l\'utilisateur (s\il est donné)',
        'up' => 'vers le haut',
        'utf8' => 'UTF-8',
        'x' => 'x',

    };
    # $$STOP$$
    return;
}

1;
