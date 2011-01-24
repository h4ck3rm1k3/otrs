# --
# Kernel/Language/de_FAQ.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: de_FAQ.pm,v 1.39 2011/01/24 18:06:54 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_FAQ;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAFAQ
    $Self->{Translation}->{'internal'} = 'intern';
    $Self->{Translation}->{'public'} = '�ffentlich';
    $Self->{Translation}->{'external'} = 'extern';
    $Self->{Translation}->{'FAQ Number'} = 'FAQ-Nummer';
    $Self->{Translation}->{'LatestChangedItems'} = 'Zuletzt ge�nderte FAQ-Artikel';
    $Self->{Translation}->{'LatestCreatedItems'} = 'Zuletzt erstellte FAQ-Artikel';
    $Self->{Translation}->{'Top10Items'} = 'Top 10 FAQ-Artikel';
    $Self->{Translation}->{'SubCategoryOf'} = 'Unterkategorie von';
    $Self->{Translation}->{'No rate selected!'} = 'Keine Bewertung ausgew�hlt!';
    $Self->{Translation}->{'public (all)'} = '�ffentlich (Alle)';
    $Self->{Translation}->{'external (customer)'} = 'extern (Kunde)';
    $Self->{Translation}->{'internal (agent)'} = 'intern (Agent)';
    $Self->{Translation}->{'StartDay'} = 'Start Tag';
    $Self->{Translation}->{'StartMonth'} = 'Start Monat';
    $Self->{Translation}->{'StartYear'} = 'Start Jahr';
    $Self->{Translation}->{'EndDay'} = 'End Tag';
    $Self->{Translation}->{'EndMonth'} = 'End Monat';
    $Self->{Translation}->{'EndYear'} = 'End Jahr';
    $Self->{Translation}->{'Thanks for your vote!'} = 'Vielen Dank f�r Ihre Bewertung!';
    $Self->{Translation}->{'You have already voted!'} = 'Sie haben bereits abgestimmt!';
    $Self->{Translation}->{'FAQ Article Print'} = 'FAQ-Artikel-Ausdruck';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'FAQ-Artikel (Top 10)';
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'FAQ-Artikel (neu erstellte)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'FAQ-Artikel (aktualisierte)';
    $Self->{Translation}->{'FAQ category updated!'} = 'FAQ-Kategorie aktualisiert!';
    $Self->{Translation}->{'FAQ category added!'} = 'FAQ-Kategorie hinzugef�gt!';
    $Self->{Translation}->{'A category should have a name!'} = 'Eine Kategorie ben�tigt einen Namen!';
    $Self->{Translation}->{'This category already exists'} = 'Diese Kategorie existiert bereits!';
    $Self->{Translation}->{'FAQ language added!'} = 'FAQ-Sprache hinzugef�gt!';
    $Self->{Translation}->{'FAQ language updated!'} = 'FAQ-Sprache aktualisiert!';
    $Self->{Translation}->{'The name is required!'} = 'Der Name ist erforderlich!';
    $Self->{Translation}->{'This language already exists!'} = 'Diese Sprache existiert bereits!';

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'FAQ-Artikel Hinzuf�gen';
    $Self->{Translation}->{'A category is required.'} = 'Eine Kategorie ist erforderlich.';
    $Self->{Translation}->{'Approval'} = 'Freigabe';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'FAQ-Kategorien-Verwaltung';
    $Self->{Translation}->{'Add category'} = 'Kategorie hinzuf�gen';
    $Self->{Translation}->{'Delete Category'} = 'Kategorie l�schen';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = 'Kategorie hinzuf�gen';
    $Self->{Translation}->{'Edit Category'} = 'Kategorie bearbeiten';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Wird im Explorer als Kommentar angezeigt.';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'W�hlen Sie mindestens eine Berechtigungsgruppe.';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'Agenten-Gruppen die berechtigt sind auf FAQ-Artikel in dieser Kategorie zuzugreifen.';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'Wollen Sie diese Kategorie wirklich l�schen?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} = 'Sie k�nnen diese Kategorie nicht l�schen. Sie wird in mindestens einem FAQ-Artikel verwendet!';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'Diese Kategorie wird in den folgenden FAQ-Artikeln verwendet';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'Diese Kategorie ist eine Eltern-Kategorie f�r folgende Kategorien';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Wollen Sie diesen FAQ-Artikel wirklich l�schen?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'FAQ-Explorer';
    $Self->{Translation}->{'Quick Search'} = 'Schnellsuche';
    $Self->{Translation}->{'Advanced Search'} = 'Erweiterte Suche';
    $Self->{Translation}->{'Subcategories'} = 'Unter-Kategorien';
    $Self->{Translation}->{'FAQ Articles'} = 'FAQ-Artikel';
    $Self->{Translation}->{'No subcategories found.'} = 'Keine Unter-Kategorien gefunden.';

    # Template: AgentFAQHistory

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'Keine FAQ-Journaldaten gefunden.';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'FAQ-Sprachen-Verwaltung';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languges.'} = 'Verwenden Sie dieses Feature wenn Sie mit verschiedenen Sprachen arbeiten wollen.';
    $Self->{Translation}->{'Add language'} = 'Sprache Hinzuf�gen';
    $Self->{Translation}->{'Delete Language'} = 'Sprache L�schen';
    $Self->{Translation}->{'Add Language'} = 'Sprache Hinzuf�gen';
    $Self->{Translation}->{'Edit Language'} = 'Sprache Bearbeiten';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'Wollen Sie diese Sprache wirklich l�schen?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} = 'Sie k�nnen diese Sprache nicht l�schen. Sie wird in mindestens einem FAQ-Artikel verwendet!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'Diese Sprache wird in den folgenden FAQ-Artikeln verwendet';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Kontext-Einstellungen';
    $Self->{Translation}->{'FAQ articles per page'} = 'FAQ-Artikel pro Seite';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'Keine FAQ Daten gefunden.';

    # Template: AgentFAQPrint
    $Self->{Translation}->{'FAQ-Info'} = 'FAQ Informationen';
    $Self->{Translation}->{'Votes'} = 'Bewertungen';

    # Template: AgentFAQSearch

    # Template: AgentFAQSearchOpenSearchDescriptionFAQNumber

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'FAQ-Volltext';

    # Template: AgentFAQSearchResultPrint

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'FAQ Suche';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'FAQ-Information';
    $Self->{Translation}->{'Rating'} = 'Bewertung';
    $Self->{Translation}->{'Rating %'} = 'Bewertung %';
    $Self->{Translation}->{'out of 5'} = 'von 5';
    $Self->{Translation}->{'No votes found!'} = 'Keine Bewertungen gefunden!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'Keine Bewertungen gefunden! Seien Sie der erste der diesen FAQ-Artikel bewertet.';
    $Self->{Translation}->{'Download Attachment'} = 'Attachment Herunterladen';
    $Self->{Translation}->{'ArticleVotingQuestion'} = 'Wie hilfreich war dieser Artikel? Bitte geben Sie Ihre Bewertung ab und helfen Sie mit die Qualit�t der FAQ Datenbank zu verbessern. Vielen Dank!';
    $Self->{Translation}->{'not helpful'} = 'nicht hilfreich';
    $Self->{Translation}->{'very helpful'} = 'sehr hilfreich';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Insert FAQ Text'} = 'FAQ-Text einf�gen';
    $Self->{Translation}->{'Insert FAQ Link'} = 'FAQ-Link einf�gen';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'FAQ-Text & Link einf�gen';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'Keine FAQ-Artikel gefunden.';

    # Template: CustomerFAQPrint

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Volltext-Suche in FAQ-Artikeln (z. B. "John*n" or "Will*")';

    # Template: CustomerFAQSearchOpenSearchDescription

    # Template: CustomerFAQSearchResultPrint

    # Template: CustomerFAQSearchResultShort

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Details'} = 'Details';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Suche nach Artikeln mit Schl�sselw�rtern';

    # Template: PublicFAQExplorer

    # Template: PublicFAQPrint

    # Template: PublicFAQSearch

    # Template: PublicFAQSearchOpenSearchDescription
    $Self->{Translation}->{'Public'} = '�ffentlich';

    # Template: PublicFAQSearchResultPrint

    # Template: PublicFAQSearchResultShort

    # Template: PublicFAQZoom

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} = 'Ein Filter zur automatischen Generierung von FAQ-Links, wenn ein Hinweis auf einen FAQ-Artikel identifiziert wird. Das Element Image erlaubt zwei Eingabeformen: Erstens der Name eines Icons (z. B. faq.png). In diesem Fall wird auf das Grafik-Verzeichnis des OTRS zugegriffen. Als zweite M�glichkeit kann man aber auch den direkten Link zur Grafik angeben (z. B. http://otrs.org/faq.png).';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'CSS-Farbe f�r das Bewertungs-Ergebnis.';
    $Self->{Translation}->{'Category Management'} = 'Kategorien-Verwaltung';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'Dezimalstellen des Ergebnisses der Artikelbewertung.';
    $Self->{Translation}->{'Default category name.'} = 'Root-Kategorie-Name.';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = 'Standard-Sprache f�r FAQ-Artikel im Einzel-Sprach-Modus.';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} = 'Standard-Priorit�t von Tickets f�r die Freigabe von FAQ-Artikeln.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Standard Status eines FAQ-Eintrags.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'Standard-Status von Tickets f�r die Freigabe von FAQ-Artikeln.';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} = 'Standardwert des Action-Parameters f�r den �ffentlichen FAQ-Bereich. Der Action-Parameter wird von den Skripten des Systems benutzt.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} = 'Definiert ein �bersichts-Modul um die Small-Ansicht im FAQ-Journal anzuzeigen.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} = 'Definiert ein �bersichts-Modul um die Small-Ansicht einer FAQ-Liste anzuzeigen.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} = 'Definiert das Standard-FAQ-Attribut f�r die Sortierung der FAQ-Suche im Agenten-Interface.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} = 'Definiert das Standard-FAQ-Attribut f�r die Sortierung des FAQ-Suche im Kunden-Interface.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} = 'Definiert das Standard-FAQ-Attribut f�r die Sortierung des FAQ-Suche im Public-Interface.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} = 'Definiert die Standard-Sortierung der FAQ-Suche im Agenten-Interface. Auf: �ltester FAQ-Artikel oben. Ab: Neuester FAQ-Artikel oben.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} = 'Definiert die Standard-Sortierung der FAQ-Suche im Kunden-Interface. Auf: �ltester FAQ-Artikel oben. Ab: Neuester FAQ-Artikel oben.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} = 'Definiert die Standard-Sortierung der FAQ-Suche im Public-Interface. Auf: �ltester FAQ-Artikel oben. Ab: Neuester FAQ-Artikel oben.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} = 'Definert die angezeigten Spalten im FAQ-Explorer. Diese Option hat keine Auswirkung auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} = 'Definert die angezeigten Spalten im FAQ-Journal. Diese Option hat keine Auswirkung auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} = 'Definert die angezeigten Spalten in der FAQ-Suche. Diese Option hat keine Auswirkung auf die Position der Spalten.';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed. Note: AgentTicketActionCommon includes AgentTicketNote, AgentTicketClose, AgentTicketFreeText, AgentTicketOwner, AgentTicketPending, AgentTicketPriority and AgentTicketResponsible.'} = 'Definiert wo der \'FAQ Einf�gen\' link angezeigt wird. Hinweis: AgentTicketActionCommon beinhaltet AgentTicketNote, AgentTicketClose, AgentTicketFreeText, AgentTicketOwner, AgentTicketPending, AgentTicketPriority und AgentTicketResponsible.';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'Definition der freien Textfelder.';
    $Self->{Translation}->{'Delete this FAQ'} = 'Diese FAQ l�schen!';
    $Self->{Translation}->{'Edit this FAQ'} = 'FAQ bearbeiten';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = 'Multiple Sprachen im FAQ-Modul aktivieren.';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = 'Bewertungs-Mechanismus im FAQ-Modul aktivieren.';
    $Self->{Translation}->{'FAQ Journal'} = 'FAQ Journal';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = 'FAQ-Journal Anzaige-Limit f�r die Small-Ansicht';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = 'FAQ-�bersicht Anzeige-Limit';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = 'FAQ limit pro Seite f�r das FAQ-Journal in der Small-Ansicht.';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = 'FAQ limit pro Seite f�r die Small-Ansicht.';
    $Self->{Translation}->{'FAQ path separator.'} = 'Trennzeichen im FAQ Pfad.';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = 'Such-Backend-Router f�r die FAQ-Suche im Agenten-Interface.';
    $Self->{Translation}->{'FAQ-Area'} = 'FAQ-Bereich';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'Frontend-Modul-Registrierung f�r das Public-Interface';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'Gruppe f�r die Freigabe von FAQ-Artikeln.';
    $Self->{Translation}->{'History of this FAQ'} = 'FAQ-Historie';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = 'Interne FAQ-Felder in einem FAQ-basiertenTicket verwenden.';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = 'Den Namen jedes FAQ-Feldes einem FAQ-basierten Ticket verwenden.';
    $Self->{Translation}->{'Interfaces where the quicksearch should be shown.'} = 'Interfaces in denen das QuickSearch Feature angezeigt wird.';
    $Self->{Translation}->{'Journal'} = 'Journal';
    $Self->{Translation}->{'Language Management'} = 'Sprachen-Verwaltung';
    $Self->{Translation}->{'Languagekey which is defined in the language file *_FAQ.pm.'} = 'LanguageKey f�r die Frage bei der Artikelbewertung. Wird in den Sprachfiles definiert.';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'Diese FAQ mit einem anderen Objekt verkn�pfen';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} = 'Maximale Anzahl von FAQ-Artikeln die im FAQ-Journal im Agenten-Interface angezeigt werden.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} = 'Maximale Anzahl von FAQ-Artikeln die in der FAQ-Suche im Agenten-Interface angezeigt werden.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} = 'Maximale Anzahl von FAQ-Artikeln die in der FAQ-Suche im Kunden-Interface angezeigt werden.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} = 'Maximale Anzahl von FAQ-Artikeln die in der FAQ-Suche im Public-Interface angezeigt werden.';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short faq search.'} = 'Modul zum Generieren des HTML "OpenSearch" Profils zur FAQ-Suche �ber das Browser-Suchfeld.';
    $Self->{Translation}->{'New FAQ Article'} = 'Neuer FAQ-Artikel';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'Neue FAQ-Artikel ben�tigen eine Freigabe vor der Ver�ffentlichung.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} = '';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'Anzahl der zu anzeigenden Artikel in letzten �nderungen.';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'Anzahl der anzuzeigenden Artikel in zuletzt erstellte Artikel.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'Anzahl der anzuzeigenden Artikel im Top 10 Feature.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} = 'Parameter f�r die Seiten (in denen FAQ-Artikel angezeigt werden) f�r die Small-Ansicht des FAQ-Journals.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} = 'Parameter f�r die Seiten (in denen FAQ-Artikel angezeigt werden) f�r die Small-Ansicht des FAQ-Overiews.';
    $Self->{Translation}->{'Print this FAQ'} = 'FAQ drucken';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'Queue f�r die Freigabe von FAQ-Artikeln.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = 'Gewichtung f�r die Bewertung. Der Key muss in Prozent angegeben werden.';
    $Self->{Translation}->{'Search FAQ'} = 'FAQ durchsuchen';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert FAQ Text" Button in AgentFAQZoomSmall.'} = '';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'HTML Darstellung der FAQ-Artikel einschalten.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'FAQ Pfad anzeigen ja/nein.';
    $Self->{Translation}->{'Show WYSIWYG editor in agent interface.'} = 'Anzeige eines WYSIWYG Editors im Agenten-Interface.';
    $Self->{Translation}->{'Show items of subcategories.'} = 'Artikel aus Subkategorien anzeigen ja/nein.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'Interfaces in denen das LastChange Feature angezeigt werden soll.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'Interfaces in denen das LastCreate Feature angezeigt werden soll.';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'Interfaces in denen das Top 10 Feature angezeigt werden soll.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'Interfaces in denen das Voting Feature angezeigt werden soll.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} = 'Zeigt einen Link in der Menu-Leiste in der Zoom-Ansicht im Agenten-Interface an, der es erm�glicht einen FAQ-Artikel mit anderen Objekten zu verkn�pfen.';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} = 'Zeigt einen Link in der Menu-Leiste in der Zoom-Ansicht im Agenten-Interface an, der es erm�glicht einen FAQ-Artikel zu l�schen.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} = 'Zeigt einen Link in der Menu-Leiste in der Zoom-Ansicht im Agenten-Interface an, um die Historie eines FAQ-Artikels anzuzeigen.';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} = 'Zeigt einen Link in der Menu-Leiste in der Zoom-Ansicht im Agenten-Interface an, der es erm�glicht einen FAQ-Artikel zu bearbeiten.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} = 'Zeigt einen Link in der Menu-Leiste in der Zoom-Ansicht im Agenten-Interface an, der es erm�glicht zur vorherigen Seite zur�ck zu gehen.';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} = 'Zeigt einen Link in der Menu-Leiste in der Zoom-Ansicht im Agenten-Interface an, der es erm�glicht einen FAQ-Artikel zu drucken.';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} = 'Der Identifikator f�r einen FAQ-Artikel, z. B. FAQ#, KB#, MyFAQ#. Der Standardwert ist FAQ#.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} = 'Definiert, dass ein \'FAQ\'-Objekte mit dem Linktyp \'Normal\' mit anderen \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} = 'Definiert, dass ein \'FAQ\'-Objekte mit dem Linktyp \'ParentChild\' mit anderen \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} = 'Definiert, dass ein \'FAQ\'-Objekte mit dem Linktyp \'Normal\' mit anderen \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} = 'Definiert, dass ein \'FAQ\'-Objekte mit dem Linktyp \'ParentChild\' mit anderen \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'Body des Tickets zur Freigabe eines FAQ-Artikels.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'Betreff des Tickets zur Freigabe eines FAQ-Artikels.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ Explorer of the agent interface.'} = 'Definiert das Standard-FAQ-Attribut f�r die Sortierung des FAQ-Explorers im Agenten-Interface.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the explorer in the customer interface.'} = 'Definiert das Standard-FAQ-Attribut f�r die Sortierung des FAQ-Explorers im Kunden-Interface.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the explorer in the public interface.'} = 'Definiert das Standard-FAQ-Attribut f�r die Sortierung des FAQ-Explorers im Public-Interface.';
    $Self->{Translation}->{'Defines the default FAQ order in the explorer in the customer interface. Up: oldest on top. Down: latest on top.'} = 'Definiert die Standard-Sortierung des FAQ-Explorers im Kunden-Interface. Auf: �ltester FAQ-Artikel oben. Ab: Neuester FAQ-Artikel oben.';
    $Self->{Translation}->{'Defines the default FAQ order in the explorer in the public interface. Up: oldest on top. Down: latest on top.'} = 'Definiert die Standard-Sortierung des FAQ-Explorers im Public-Interface. Auf: �ltester FAQ-Artikel oben. Ab: Neuester FAQ-Artikel oben.';
    $Self->{Translation}->{'Defines the default FAQ order of a Explorer result in the agent interface. Up: oldest on top. Down: latest on top.'} = 'Definiert die Standard-Sortierung des FAQ-Explorers im Agenten-Interface. Auf: �ltester FAQ-Artikel oben. Ab: Neuester FAQ-Artikel oben.';
    $Self->{Translation}->{'Delete: '} = 'L�schen: ';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the explorer in the customer interface.'} = 'Maximale Anzahl von FAQ-Artikeln die im FAQ-Explorer im Kunden-Interface angezeigt werden.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the explorer in the public interface.'} = 'Maximale Anzahl von FAQ-Artikeln die im FAQ-Explorer im Public-Interface angezeigt werden.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a Explorer in the agent interface.'} = 'Maximale Anzahl von FAQ-Artikeln die im FAQ-Explorer im Agenten-Interface angezeigt werden.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in each page of a search result in the customer interface.'} = 'Anzahl von FAQ-Artikeln die in der FAQ-Suche im Kunden-Interface pro Seite angezeigt werden.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in each page of a search result in the public interface.'} = 'Anzahl von FAQ-Artikeln die in der FAQ-Suche im Public-Interface pro Seite angezeigt werden.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the explorer in the customer interface.'} = 'Anzahl von FAQ-Artikeln die im FAQ-Explorer im Kunden-Interface angezeigt werden.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the explorer in the public interface.'} = 'Anzahl von FAQ-Artikeln die im FAQ-Explorer im Public-Interface angezeigt werden.';
    $Self->{Translation}->{'Show "Insert Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = 'Zeige "Link Einf�gen"-Button in AgentFAQZoomSmall f�r �ffentliche FAQ-Artikel.';
    $Self->{Translation}->{'Show "Insert Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = 'Zeige "Text & Link Einf�gen"-Button in AgentFAQZoomSmall f�r �ffentliche FAQ-Artikel.';
    $Self->{Translation}->{'Show "Insert Text" Button in AgentFAQZoomSmall.'} = 'Zeige "Text Einf�gen"-Button in AgentFAQZoomSmall f�r �ffentliche FAQ-Artikel.';

}

1;
