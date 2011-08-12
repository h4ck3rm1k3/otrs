# --
# Kernel/Language/hu_FAQ.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: hu_FAQ.pm,v 1.2 2011/08/12 21:48:23 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::hu_FAQ;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAFAQ
    $Self->{Translation}->{'internal'} = 'bels�';
    $Self->{Translation}->{'public'} = 'publikus';
    $Self->{Translation}->{'external'} = 'k�ls�';
    $Self->{Translation}->{'FAQ Number'} = 'FAQ-sorsz�m';
    $Self->{Translation}->{'Latest updated FAQ articles'} = 'Legut�bb v�ltozott elemek';
    $Self->{Translation}->{'Latest created FAQ articles'} = 'Legut�bb l�trehozott elemek';
    $Self->{Translation}->{'Top 10 FAQ articles'} = 'Top 10 elemek';
    $Self->{Translation}->{'Subcategory of'} = 'Alkateg�ri�ja';
    $Self->{Translation}->{'No rate selected!'} = 'Nincs �rt�kel�s kiv�lasztva!';
    $Self->{Translation}->{'public (all)'} = 'nyilv�nos (�sszes)';
    $Self->{Translation}->{'external (customer)'} = 'k�ls� (�gyf�l)';
    $Self->{Translation}->{'internal (agent)'} = 'bels� (�gyint�z�)';
    $Self->{Translation}->{'Start day'} = 'Kezd� nap';
    $Self->{Translation}->{'Start month'} = 'Kezd� h�nap';
    $Self->{Translation}->{'Start year'} = 'Kezd� �v';
    $Self->{Translation}->{'End day'} = 'Z�r� nap';
    $Self->{Translation}->{'End month'} = 'Z�r� h�nap';
    $Self->{Translation}->{'End year'} = 'Z�r� �v';
    $Self->{Translation}->{'Thanks for your vote!'} = 'Szavazat�t k�sz�nj�k!';
    $Self->{Translation}->{'You have already voted!'} = 'M�r szavazott!';
    $Self->{Translation}->{'FAQ Article Print'} = 'FAQ cikk nyomtat�s';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'FAQ cikk (Top 10)';
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'FAQ cikk (�j)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'FAQ cikk (v�ltozott)';
    $Self->{Translation}->{'FAQ category updated!'} = 'FAQ kateg�ria m�dosult!';
    $Self->{Translation}->{'FAQ category added!'} = 'FAQ kateg�ria hozz�adva!';
    $Self->{Translation}->{'A category should have a name!'} = 'Sz�ks�ges, hogy a kateg�ri�t elnevezze!';
    $Self->{Translation}->{'This category already exists'} = 'A kateg�ria m�r l�tezik!';
    $Self->{Translation}->{'FAQ language added!'} = 'FAQ nyelv hozz�adva!';
    $Self->{Translation}->{'FAQ language updated!'} = 'FAQ nyelv m�dosult!';
    $Self->{Translation}->{'The name is required!'} = 'A n�v sz�ks�ges!';
    $Self->{Translation}->{'This language already exists!'} = 'A nyelv m�r l�tezik!';

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'FAQ cikk hozz�ad�sa';
    $Self->{Translation}->{'A category is required.'} = 'A kateg�ria sz�ks�ges.';
    $Self->{Translation}->{'Approval'} = 'J�v�hagy�s';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'FAQ kateg�ria kezel�s';
    $Self->{Translation}->{'Add category'} = 'Kateg�ria hozz�ad�sa';
    $Self->{Translation}->{'Delete Category'} = 'Kateg�ria t�rl�se';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = 'Kateg�ria hozz�ad�sa';
    $Self->{Translation}->{'Edit Category'} = 'Kateg�ria szerkeszt�se';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'A b�ng�sz�ben megjegyz�sk�nt fog megjelenni.';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'K�rem, v�lasszon legal�bb egy jogosults�g csoportot.';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = '�gyint�z� csoport, amelyik hozz�f�r a cikkekhez ebben a kateg�ri�ban.';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'Val�ban t�r�lni akarja a kateg�ri�t?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} = 'A kateg�ria nem t�r�lhet�. FAQ cikk haszn�lja vagy m�s kateg�ria sz�l�je!';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'A kateg�ria a k�vetkez� FAQ cikkekn�l haszn�lt';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'A kateg�ria a k�vetkez� kateg�ri�k sz�l�je';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Val�ban t�r�lni akarja ezt a FAQ cikket?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'FAQ-B�ng�sz�';
    $Self->{Translation}->{'Quick Search'} = 'Gyorskeres�s';
    $Self->{Translation}->{'Advanced Search'} = '�sszetett keres�s';
    $Self->{Translation}->{'Subcategories'} = 'Alkateg�ria';
    $Self->{Translation}->{'FAQ Articles'} = 'FAQ cikk';
    $Self->{Translation}->{'No subcategories found.'} = 'Nincs alkateg�ria.';

    # Template: AgentFAQHistory

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'Nincs FAQ-Journal adat.';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'FAQ nyelv kezel�s';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languges.'} = 'Haszn�lja ezt a szolg�ltat�st, ha t�bb nyelvvel szeretne dolgozni.';
    $Self->{Translation}->{'Add language'} = 'Nyelv hozz�ad�sa';
    $Self->{Translation}->{'Delete Language'} = 'Nyelv t�rl�se';
    $Self->{Translation}->{'Add Language'} = 'Nyelv hozz�ad�sa';
    $Self->{Translation}->{'Edit Language'} = 'Nyelv szerkeszt�se';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'Val�ban t�r�lni szeretn� ezt a nyelvet?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} = 'A nyelv nem t�r�lhet�, legal�bb egy FAQ cikk haszn�lja!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'Ez a nyelv haszn�latban van a k�vetkez� FAQ cikkn�l';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Tartalom be�ll�t�sok';
    $Self->{Translation}->{'FAQ articles per page'} = 'FAQ cikkek oldalank�nt';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'Nincs FAQ adat.';

    # Template: AgentFAQPrint
    $Self->{Translation}->{'FAQ-Info'} = 'FAQ-inf�';
    $Self->{Translation}->{'Votes'} = 'Szavazatok';

    # Template: AgentFAQSearch

    # Template: AgentFAQSearchOpenSearchDescriptionFAQNumber

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'FAQ teljes sz�veg';

    # Template: AgentFAQSearchResultPrint

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'FAQ keres�s';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'FAQ inform�ci�';
    $Self->{Translation}->{'Rating'} = '�rt�kel�s';
    $Self->{Translation}->{'Rating %'} = '�rt�kel�s %';
    $Self->{Translation}->{'out of 5'} = '5-b�l';
    $Self->{Translation}->{'No votes found!'} = 'Nincs szavazat!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'Nincs szavazat! Legyen az els�, aki �rt�keli a FAQ cikket.';
    $Self->{Translation}->{'Download Attachment'} = 'Mell�klet let�lt�se';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} = 'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!';
    $Self->{Translation}->{'not helpful'} = 'nem seg�t';
    $Self->{Translation}->{'very helpful'} = 'nagyon seg�t';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Insert FAQ Text'} = 'FAQ sz�veg be�r�sa';
    $Self->{Translation}->{'Insert FAQ Link'} = 'FAQ link be�r�sa';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'FAQ sz�veg �s link be�r�sa';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'Nem tal�lhat� FAQ cikk.';

    # Template: CustomerFAQPrint

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Teljes sz�veges keres�s a FAQ cikkekben (pl. "J*nos" or "Kov*")';

    # Template: CustomerFAQSearchOpenSearchDescription

    # Template: CustomerFAQSearchResultPrint

    # Template: CustomerFAQSearchResultShort

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Details'} = 'R�szletek';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Cikkek keres�se kulcsszavakkal';

    # Template: PublicFAQExplorer

    # Template: PublicFAQPrint

    # Template: PublicFAQSearch

    # Template: PublicFAQSearchOpenSearchDescription
    $Self->{Translation}->{'Public'} = 'Nyilv�nos';

    # Template: PublicFAQSearchResultPrint

    # Template: PublicFAQSearchResultShort

    # Template: PublicFAQZoom

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} = 'Egy sz�r� a HTML kimenethez, hogy hozz�adjon linkeket a defini�lt sz�vegekhez. Az Image elem k�tf�le bemenetet enged. A k�p neve az els� (pl. faq.png). Ebben az esetben az OTRS k�pek �tvonala ker�l felhaszn�l�sra. A m�sodik lehet�s�g a k�pre mutat� link belilleszt�se.';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'CSS szinek a szavaz�s eredm�ny�hez.';
    $Self->{Translation}->{'Category Management'} = 'Kateg�riakezel�s';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'A szavaz�si eredm�ny tizedesjegyeinek sz�ma.';
    $Self->{Translation}->{'Default category name.'} = 'Alap�rtelmezett kateg�ria neve.';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = 'Egynyelv� m�d eset�n a FAQ cikkek alap�rtelmezett nyelve.';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} = 'FAQ cikkek j�v�hagy�s�hoz a jegyek alap�rtelmezett priorit�sa.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'A FAQ cikk alap�rtelmezett �llapota.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'FAQ cikkek j�v�hagy�s�hoz a jegyek alap�rtelmezett �llapota.';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} = 'A public frontend Action parameter�nek alap�rtelmezett �rt�ke. Az Action parameter a rendszer sciprt-jeiben ker�l felhaszn�l�sra.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} = 'Egy �ttekint� modult defini�l a FAQ journal kicsi n�zet�nek megmutat�s�hoz.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} = 'Egy �ttekint� modult defini�l a FAQ lista kicsi n�zet�nek megmutat�s�hoz.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} = 'Az alap�rtelmezett FAQ attrib�tumokat defini�lja a FAQ rendez�shez az �gyint�z� fel�let�n a FAQ keres�sn�l.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} = 'Az alap�rtelmezett FAQ attrib�tumokat defini�lja a FAQ rendez�shez az �gyf�l fel�let�n a FAQ keres�sn�l.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} = 'Az alap�rtelmezett FAQ attrib�tumokat defini�lja a FAQ rendez�shez a nyilv�nos fel�leten a FAQ keres�sn�l.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} = 'Az alap�rtelmezett FAQ attrib�tumokat defini�lja a FAQ rendez�shez az �gyint�z� fel�let�n a FAQ b�ng�sz�n�l.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} = 'Az alap�rtelmezett FAQ attrib�tumokat defini�lja a FAQ rendez�shez az �gyf�l fel�let�n a FAQ b�ng�sz�n�l.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} = 'Az alap�rtelmezett FAQ attrib�tumokat defini�lja a FAQ rendez�shez a nyilv�nos fel�leten a FAQ b�ng�sz�n�l.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} = 'Az alap�rtelmezett FAQ sorrendet defini�lja a FAQ b�ng�sz�ben az �gyint�z� fel�let�n. Up: r�gebbiek fel�l, Down: legfrissebb fel�l.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} = 'Az alap�rtelmezett FAQ sorrendet defini�lja a FAQ b�ng�sz�ben az �gyf�l fel�let�n. Up: r�gebbiek fel�l, Down: legfrissebb fel�l.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} = 'Az alap�rtelmezett FAQ sorrendet defini�lja a FAQ b�ng�sz�ben a nyilv�nos fel�leten. Up: r�gebbiek fel�l, Down: legfrissebb fel�l.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} = 'Az alap�rtelmezett FAQ sorrendet defini�lja a keres�sn�l az �gyint�z� fel�let�n. Up: r�gebbiek fel�l, Down: legfrissebb fel�l.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} = 'Az alap�rtelmezett FAQ sorrendet defini�lja a keres�sn�l az �gyf�l fel�let�n. Up: r�gebbiek fel�l, Down: legfrissebb fel�l.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} = 'Az alap�rtelmezett FAQ sorrendet defini�lja a keres�sn�l a nyilv�nos fel�leten. Up: r�gebbiek fel�l, Down: legfrisesbb fel�l.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} = 'A FAQ b�ng�sz�ben l�that� oszlopokat defini�lja. A param�ter nincs hat�ssal az oszlop poz�ci�j�ra.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} = 'A FAQ journal-ban l�that� oszlopokat defini�lja. A param�ter nincs hat�ssal az oszlop poz�ci�j�ra.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} = 'A FAQ keres�sn�l l�that� oszlopokat defini�lja. A param�ter nincs hat�ssal az oszlop poz�ci�j�ra.';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed. Note: AgentTicketActionCommon includes AgentTicketNote, AgentTicketClose, AgentTicketFreeText, AgentTicketOwner, AgentTicketPending, AgentTicketPriority and AgentTicketResponsible.'} = 'Defini�lja, hogy a \'Insert FAQ\' link hol l�that�. Megjegyz�s: AgentTicketActionCommon tartalmazza az AgentTicketNote, AgentTicketClose, AgentTicketFreeText, AgentTicketOwner, AgentTicketPending, AgentTicketPriority �s  AgentTicketResponsible.';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'A FAQ cikk szabad-sz�veges mez�j�t defini�lja.';
    $Self->{Translation}->{'Delete this FAQ'} = 'T�r�ld ezt a FAQ-t';
    $Self->{Translation}->{'Edit this FAQ'} = 'Szerkeszd ezt a FAQ-t';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = 'T�bb nyelv haszn�lat�t enged�lyezi a FAQ modulban.';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = 'A szavaz�s enged�lyez�se a FAQ modulban.';
    $Self->{Translation}->{'FAQ Journal'} = 'FAQ Journal';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = 'FAQ Journal �ttekint� "kicsi n�zet" limit';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = 'FAQ �ttekint� "Kicsi n�zet" limit';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = 'FAQ limit oldalank�nt a FAQ Journal �ttekint� "kicsi n�zet�hez"';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = 'FAQ limit oldalank�nt a FAQ  �ttekint� "kicsi n�zet�hez"';
    $Self->{Translation}->{'FAQ path separator.'} = 'FAQ �tvonal elv�laszt�.';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = 'FAQ search backend router of the agent interface.';
    $Self->{Translation}->{'FAQ-Area'} = 'FAQ-ter�let';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'A nyilv�nos interface frontend module regisztr�ci�ja.';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'Csoport a FAQ cikk j�v�hagy�shoz.';
    $Self->{Translation}->{'History of this FAQ'} = 'FAQ t�rt�nete';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = 'Bels� mez�ket tartalmaz a FAQ alap� jegyekhez.';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = 'Minden mez� nev�t tartalmazza a FAQ alap� jegyekben.';
    $Self->{Translation}->{'Interfaces where the quicksearch should be shown.'} = 'Fel�let, ahol a gyorskeres�s l�that�.';
    $Self->{Translation}->{'Journal'} = 'Journal';
    $Self->{Translation}->{'Language Management'} = 'Nyelvek kezel�se';
    $Self->{Translation}->{'Languagekey which is defined in the language file *_FAQ.pm.'} = 'A *_FAQ.pm f�jlban defini�lt nyelv kulcsa.';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'A FAQ elemben m�s objektumra val� hivatkoz�s.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} = 'A megjelen� FAQ cikkek maxim�lis sz�ma a FAQ b�ng�sz� �gyint�z� fel�let�n.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} = 'A megjelen� FAQ cikkek maxim�lis sz�ma a FAQ b�ng�sz� �gyf�l fel�let�n.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} = 'A megjelen� FAQ cikkek maxim�lis sz�ma a FAQ b�ng�sz� nyilv�nos fel�let�n.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} = 'A megjelen� FAQ cikkek maxim�lis sz�ma a FAQ journal �gyint�z� fel�let�n.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} = 'A megjelen� FAQ cikkek maxim�lis sz�ma a keres�sn�l az �gyint�z� fel�let�n.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} = 'A megjelen� FAQ cikkek maxim�lis sz�ma a keres�sn�l az �gyf�l fel�let�n.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} = 'A megjelen� FAQ cikkek maxim�lis sz�ma a keres�sn�l a nyilv�nos fel�leten.';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short faq search.'} = 'Modul html OpenSearch profile l�trehoz�s�hoz r�vid FAQ keres�sn�l.';
    $Self->{Translation}->{'New FAQ Article'} = '�j FAQ cikk';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'Az �j FAQ cikk j�v�hagy�sa sz�ks�ges a publik�l�s el�tt.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} = 'A megjelen� FAQ cikkek sz�ma a FAQ b�ng�sz� �gyint�z� fel�let�n.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} = 'A megjelen� FAQ cikkek sz�ma a FAQ b�ng�sz� nyilv�nos fel�let�n.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} = 'A megjelen� FAQ cikkek sz�ma minden lapon a keres�sn�l az �gyf�l fel�let�n.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} = 'A megjelen� FAQ cikkek sz�ma minden lapon a keres�sn�l a nyilv�nos fel�leten.';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'A megjelen� elemek sz�ma az utols�  m�dosultakn�l.';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'A megjelen� elemek sz�ma az utols� l�trehozottakn�l.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'A megjelen� elemek sz�ma a TOP10-n�l.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} = 'Param�terek a lapokhoz (amelyeken a FAQ elemek megjelennek) a kicsi FAQ journal �ttekint�s�n�l.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} = 'Param�terek a lapokhoz (amelyeken a FAQ elemek megjelennek) a kicsi FAQ �ttekint�s�n�l.';
    $Self->{Translation}->{'Print this FAQ'} = 'Nyomtasd ezt a FAQ-t';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'V�r�lista a FAQ cikkek j�v�hagy�s�hoz';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = '�rt�kek a szavaz�shoz. A kulcs sz�zal�k kell legyen!';
    $Self->{Translation}->{'Search FAQ'} = 'FAQ keres�s';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = 'Megmutatja a "FAQ link besz�r�s" gombot az AgentFAQZoomSmall a nyilv�nos FAQ cikkekhez.';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = 'Megmutatja a "FAQ link �s sz�veg besz�r�s" gombot az AgentFAQZoomSmall a nyilv�nos FAQ cikkekhez.';
    $Self->{Translation}->{'Show "Insert FAQ Text" Button in AgentFAQZoomSmall.'} = 'Megmutatja a "FAQ sz�veg besz�r�s" gombot az AgentFAQZoomSmall.';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'FAQ cikk megjelen�t�se HTML-ben';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'FAQ �tvonal megjelen�t�se igen/nem.';
    $Self->{Translation}->{'Show WYSIWYG editor in agent interface.'} = 'WYSIWYG editor megjelen�t�se az �gyint�z� fel�let�n.';
    $Self->{Translation}->{'Show items of subcategories.'} = 'Az alkateg�ria elemeinek megjelen�t�se';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'Az utols� m�dos�tott elemek megjelen�t�se a defini�lt fel�leten.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'Az utols� l�trehozott elemek megjelen�t�se a defini�lt fel�leten.';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'A TOP 10 elemek megjelen�t�se a defini�lt fel�leten.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'Szavaz�s megjelen�t�se a defini�lt fel�leten.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} = 'Link megjelen�t�se a men�ben ami engedi a FAQ linkel�s�t m�s objektumokkal a FAQ r�szletein�l az �gyint�z� fel�let�n.';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} = 'Link megjelen�t�se a men�ben ami engedi a FAQ t�rl�s�t a FAQ r�szletein�l az �gyint�z� fel�let�n.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} = 'Link megjelen�t�se a men�ben ami el�ri a FAQ t�rt�net�t a FAQ r�szletein�l az �gyint�z� fel�let�n.';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} = 'Link megjelen�t�se a men�ben ami engedi a FAQ szerkeszt�s�t a FAQ r�szletein�l az �gyint�z� fel�let�n.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} = 'Link megjelen�t�se a men�ben ami engedi a visszal�p�st a FAQ r�szletein�l az �gyint�z� fel�let�n.';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} = 'Link megjelen�t�se a men�ben ami engedi a FAQ nyomtat�s�t a FAQ r�szletein�l az �gyint�z� fel�let�n.';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} = 'A FAQ azonos�t�ja, pl. FAQ#, KB#, MyFAQ#. Az alap�rtelmezett: FAQ#.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} = 'Ez a be�ll�t�s defini�lja, hogy a \'FAQ\' objektum �sszekapcsolhat� m�s \'FAQ\' objektummal \'Normal\' link t�pus haszn�lat�val.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} = 'Ez a be�ll�t�s defini�lja, hogy a \'FAQ\' objektum �sszekapcsolhat� m�s \'FAQ\' objektummal \'ParentChild\' link t�pus haszn�lat�val.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} = 'Ez a be�ll�t�s defini�lja, hogy a \'FAQ\' objektum �sszekapcsolhat� m�s \'Jegy\' objektummal \'Normal\' link t�pus haszn�lat�val.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} = 'Ez a be�ll�t�s defini�lja, hogy a \'FAQ\' objektum �sszekapcsolhat� m�s \'Jegy\' objektummal \'ParentChild\' link t�pus haszn�lat�val.';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'Jegy t�rzse a FAQ cikk j�v�hagy�s�hoz.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'Jegy t�rgya a FAQ cikk j�v�hagy�s�hoz.';

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
