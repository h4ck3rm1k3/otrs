# --
# Kernel/Language/nb_NO_FAQ.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: nb_NO_FAQ.pm,v 1.3 2011/01/24 18:06:53 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nb_NO_FAQ;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAFAQ
    $Self->{Translation}->{'internal'} = 'internt';
    $Self->{Translation}->{'public'} = 'publiseres';
    $Self->{Translation}->{'external'} = '';
    $Self->{Translation}->{'FAQ Number'} = '';
    $Self->{Translation}->{'LatestChangedItems'} = 'Sist oppdaterte OSS-artikler';
    $Self->{Translation}->{'LatestCreatedItems'} = 'Sist opprettede OSS-artikler';
    $Self->{Translation}->{'Top10Items'} = 'Topp 10 OSS';
    $Self->{Translation}->{'No rate selected!'} = 'Ingen rating valgt';
    $Self->{Translation}->{'public (all)'} = 'offentlig (alle)';
    $Self->{Translation}->{'external (customer)'} = 'kun til kunder';
    $Self->{Translation}->{'internal (agent)'} = 'kun internt (agenter)';
    $Self->{Translation}->{'StartDay'} = 'Startdag';
    $Self->{Translation}->{'StartMonth'} = 'Måned';
    $Self->{Translation}->{'StartYear'} = 'År';
    $Self->{Translation}->{'EndDay'} = 'Sluttdag';
    $Self->{Translation}->{'EndMonth'} = 'Måned';
    $Self->{Translation}->{'EndYear'} = 'År';
    $Self->{Translation}->{'Thanks for your vote!'} = 'Takk for din stemme!';
    $Self->{Translation}->{'You have already voted!'} = 'Du har allerede stemt';
    $Self->{Translation}->{'FAQ Article Print'} = 'Utskrift av OSS-artikkel';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'OSS-artikler (Topp 10)';
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'OSS-artikler (nylig opprettet)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'OSS-artikler (nylig endret)';
    $Self->{Translation}->{'FAQ category updated!'} = 'OSS-kategori oppdatert!';
    $Self->{Translation}->{'FAQ category added!'} = 'OSS-kategori lagt til';
    $Self->{Translation}->{'A category should have a name!'} = 'En kategori må ha et navn!';
    $Self->{Translation}->{'This category already exists'} = '';
    $Self->{Translation}->{'FAQ language added!'} = 'OSS-språk lagt til!';
    $Self->{Translation}->{'FAQ language updated!'} = 'OSS-språk oppdatert!';
    $Self->{Translation}->{'The name is required!'} = 'Navn er påkrevd!';
    $Self->{Translation}->{'This language already exists!'} = 'Dette språket finnes allerede!';

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'Legg til OSS-artikkel';
    $Self->{Translation}->{'A category is required.'} = 'Kategori er obligatorisk.';
    $Self->{Translation}->{'Approval'} = 'Godkjenning';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'Kategorioppsett for OSS';
    $Self->{Translation}->{'Add category'} = 'Legg til kategori';
    $Self->{Translation}->{'Delete Category'} = 'Slett kategori';
    $Self->{Translation}->{'Ok'} = '';
    $Self->{Translation}->{'Add Category'} = 'Legg til kategori';
    $Self->{Translation}->{'Edit Category'} = 'Endre kategori';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Vil vises som kommentar i utforskeren';
    $Self->{Translation}->{'Please select at least one permission group.'} = '';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = '';
    $Self->{Translation}->{'Do you really want to delete this category?'} = '';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} = '';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = '';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = '';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Vil du virkelig slette denne artikkelen?';

    # Template: AgentFAQEdit

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'Utforsker';
    $Self->{Translation}->{'Quick Search'} = '';
    $Self->{Translation}->{'Advanced Search'} = '';
    $Self->{Translation}->{'Subcategories'} = 'Underkategorier';
    $Self->{Translation}->{'FAQ Articles'} = 'Ofte Stilte Spørsmål';
    $Self->{Translation}->{'No subcategories found.'} = 'Ingen underkategorier funnet';

    # Template: AgentFAQHistory

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = '';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'Språkoppsett for OSS';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languges.'} = '';
    $Self->{Translation}->{'Add language'} = 'Legg til språk';
    $Self->{Translation}->{'Delete Language'} = 'Slett språk';
    $Self->{Translation}->{'Add Language'} = 'Legg til språk';
    $Self->{Translation}->{'Edit Language'} = 'Endre språk';
    $Self->{Translation}->{'Do you really want to delete this language?'} = '';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} = '';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = '';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '';
    $Self->{Translation}->{'FAQ articles per page'} = '';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'Ingen artikler funnet';

    # Template: AgentFAQPrint
    $Self->{Translation}->{'FAQ-Info'} = '';
    $Self->{Translation}->{'Votes'} = 'Stemmer';

    # Template: AgentFAQSearch

    # Template: AgentFAQSearchOpenSearchDescriptionFAQNumber

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = '';

    # Template: AgentFAQSearchResultPrint

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = '';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'Info om OSS';
    $Self->{Translation}->{'Rating'} = 'Rating';
    $Self->{Translation}->{'Rating %'} = '';
    $Self->{Translation}->{'out of 5'} = 'av 5';
    $Self->{Translation}->{'No votes found!'} = 'Ingen stemmer funnet!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'Ingen stemmer avgitt! Bli den første til å stemme på denne artikkelen.';
    $Self->{Translation}->{'Download Attachment'} = '';
    $Self->{Translation}->{'ArticleVotingQuestion'} = 'Var denne artikkelen til hjelp? Vær snill og gi oss din stemme, slik at vi kan forbedre databasen. Tusen takk!';
    $Self->{Translation}->{'not helpful'} = 'ikke til hjelp';
    $Self->{Translation}->{'very helpful'} = 'veldig nyttig';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Insert FAQ Text'} = '';
    $Self->{Translation}->{'Insert FAQ Link'} = '';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = '';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = '';

    # Template: CustomerFAQPrint

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Fulltekstsøk i OSS-artikler (f.eks. "Ol*" eller "Andreas*n"';

    # Template: CustomerFAQSearchOpenSearchDescription

    # Template: CustomerFAQSearchResultPrint

    # Template: CustomerFAQSearchResultShort

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Details'} = 'Detaljer';
    $Self->{Translation}->{'Search for articles with keyword'} = '';

    # Template: PublicFAQExplorer

    # Template: PublicFAQPrint

    # Template: PublicFAQSearch

    # Template: PublicFAQSearchOpenSearchDescription
    $Self->{Translation}->{'Public'} = '';

    # Template: PublicFAQSearchResultPrint

    # Template: PublicFAQSearchResultShort

    # Template: PublicFAQZoom

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} = '';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'CSS-farge for avstemningsresultat';
    $Self->{Translation}->{'Category Management'} = 'Kategorioppsett';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'Antall desimaler for avstemningsresultat';
    $Self->{Translation}->{'Default category name.'} = 'Forvalgt kategori';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = '';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} = 'Standard prioritet for saker for godkjenning av OSS-artikler.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Standard status for et OSS-objekt.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'Standard status for saker for godkjenning av OSS-artikler.';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} = '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} = '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} = '';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} = '';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} = '';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed. Note: AgentTicketActionCommon includes AgentTicketNote, AgentTicketClose, AgentTicketFreeText, AgentTicketOwner, AgentTicketPending, AgentTicketPriority and AgentTicketResponsible.'} = '';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'Definisjon av fritekstfelt for OSS-artikler';
    $Self->{Translation}->{'Delete this FAQ'} = 'Slett denne artikkelen';
    $Self->{Translation}->{'Edit this FAQ'} = 'Endre denne artikkelen';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = '';
    $Self->{Translation}->{'FAQ Journal'} = 'OSS-journal';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = '';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = '';
    $Self->{Translation}->{'FAQ path separator.'} = 'Separator for OSS-sti';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = '';
    $Self->{Translation}->{'FAQ-Area'} = '';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'Modulregistrering for den offentlige delen';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'Gruppe som skal godkjenne OSS-artikler.';
    $Self->{Translation}->{'History of this FAQ'} = 'Historikk over denne artikkelen';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Interfaces where the quicksearch should be shown.'} = 'Grensesnitt der hurtigsøket skal vises.';
    $Self->{Translation}->{'Journal'} = '';
    $Self->{Translation}->{'Language Management'} = 'Språkoppsett';
    $Self->{Translation}->{'Languagekey which is defined in the language file *_FAQ.pm.'} = 'LanguageKey definert i språkfilen *_FAQ.pm';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'Lenk opp et annet objekt til denne artikkelen';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} = '';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short faq search.'} = '';
    $Self->{Translation}->{'New FAQ Article'} = 'Ny OSS-artikkel';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'Nye artikler trenger godkjenning før de kan publiseres.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} = '';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'Antall objekter vist i siste endringer.';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'Antall viste objekter under sist opprettet.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'Antall viste artikler i "Topp 10"-funksjonen';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} = '';
    $Self->{Translation}->{'Print this FAQ'} = 'Skriv ut denne artikkelen';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'Kø for godkjenning av OSS-artikler.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = 'Rater for avstemming. Nøkkel må være i prosent.';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert FAQ Text" Button in AgentFAQZoomSmall.'} = '';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'Vis HTML i OSS-artikkel.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'Vis OSS-sti (ja/nei)';
    $Self->{Translation}->{'Show WYSIWYG editor in agent interface.'} = 'Vis WYSIWYG-redigerer i agent-delen.';
    $Self->{Translation}->{'Show items of subcategories.'} = 'Vis innhold i underkategorier.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'Vis sist endrede artikler i definerte grensesnitt.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'Vis sist opprettede artikler i definerte grensesnitt';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'Vis "Topp 10" i definerte grensesnitt.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'Vis avstemming i definerte grensensnitt';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows time use complete description (days, hours, minutes), if set to "Yes"; or just first letter (d, h, m), if set to "No".'} = '';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} = 'Identifikator for en OSS-artikkel, f.eks. FAQ#, KB#, OSS#, MinOSS#. Standard er FAQ#.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} = 'Denne innstillingen definerer at en OSS-artikkel kan lenkes til andre OSS-artikler med "Normal" lenketype.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} = 'Denne innstillingen definerer at en OSS-artikkel kan lenkes til andre OSS-artikler med "Foreldre/Barn"-lenketype.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} = 'Denne innstillingen definerer at en OSS-artikkel kan lenkes til andre saker med "Normal" lenketype.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} = 'Denne innstillingen definerer at en OSS-artikkel kan lenkes til andre saker med "Foreldre/Barn"-lenketype.';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'Saksinnhold for godkjenning av OSS-artikler.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'Saksemne for godkjenning av OSS-artikler.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'A category needs at least one permission group!'} = 'En kategori trenger minst én tilgangsgruppe';
    $Self->{Translation}->{'A category should have a comment!'} = 'En kategori må ha en kommentar!';
    $Self->{Translation}->{'Agent groups which can access this category.'} = 'Agent-grupper som har tilgang til denne kategorien';
    $Self->{Translation}->{'Categories'} = 'Kategorier';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed.'} = 'Definerer hvor "Sett inn OSS"-lenken skal vises.';
    $Self->{Translation}->{'DetailSearch'} = 'Detaljsøk';
    $Self->{Translation}->{'Do you really want to delete this Category?'} = 'Vil du virkelig slette denne katgorien?';
    $Self->{Translation}->{'Do you really want to delete this Language?'} = 'Vil du virkelig slette dette språket?';
    $Self->{Translation}->{'FAQ Category'} = 'OSS-kategori';
    $Self->{Translation}->{'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'} = 'Ingen tilgang til kategori. For å opprette en artikkel må du ha tilgang til minst én kategori. Vennligst sjekk dine gruppe-/kategori-tilganger under -kategorimeny-';
    $Self->{Translation}->{'QuickSearch'} = 'Hurtigsøk';
    $Self->{Translation}->{'SubCategories'} = 'Underkategorier';
    $Self->{Translation}->{'The title is required.'} = 'Emne er obligatorisk.';
    $Self->{Translation}->{'This Category is parent of the following SubCategories'} = 'Denne kategorien er forelder til følgende underkategorier';
    $Self->{Translation}->{'This Category is used in the following FAQ Artice(s)'} = 'Denne kategorien brukes i følgende OSS-artikler';
    $Self->{Translation}->{'This Language is used in the following FAQ Article(s)'} = 'Dette språket er i bruk på følgende artikler';
    $Self->{Translation}->{'This category already exists!'} = 'Denne kategorien finnes allerede!';
    $Self->{Translation}->{'Updated'} = 'Oppdatert';
    $Self->{Translation}->{'You can not delete this Category. It is used in at least one FAQ Article! and/or is parent of at least another Category'} = 'Du kan ikke slette denne kategorien. Den brukes av minst én artikkel og/eller av minst én underkategori';
    $Self->{Translation}->{'You can not delete this Language. It is used in at least one FAQ Article!'} = 'Du kan ikke slette dette språket, det er i bruk på minst én artikkel.';

}

1;
