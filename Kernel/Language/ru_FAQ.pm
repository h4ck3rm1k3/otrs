# --
# Kernel/Language/ru_FAQ.pm - translation file
# Copyright (C) 2011 Alex Savvin <savvin at mail.ru>
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: ru_FAQ.pm,v 1.2 2011/08/12 21:48:22 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ru_FAQ;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAFAQ
    $Self->{Translation}->{'internal'} = '���������';
    $Self->{Translation}->{'public'} = '�������������';
    $Self->{Translation}->{'external'} = '��������';
    $Self->{Translation}->{'FAQ Number'} = '����� FAQ';
    $Self->{Translation}->{'Latest updated FAQ articles'} = '��������� ���������� ������ FAQ';
    $Self->{Translation}->{'Latest created FAQ articles'} = '����� ������ FAQ';
    $Self->{Translation}->{'Top 10 FAQ articles'} = 'Top 10 ������ FAQ';
    $Self->{Translation}->{'Subcategory of'} = '���������';
    $Self->{Translation}->{'No rate selected!'} = '������ �����������!';
    $Self->{Translation}->{'public (all)'} = '������������� (����)';
    $Self->{Translation}->{'external (customer)'} = '�������� (��������)';
    $Self->{Translation}->{'internal (agent)'} = '��������� (�������)';
    $Self->{Translation}->{'Start day'} = '������ ���';
    $Self->{Translation}->{'Start month'} = '������ ������';
    $Self->{Translation}->{'Start year'} = '������ ����';
    $Self->{Translation}->{'End day'} = '����� ���';
    $Self->{Translation}->{'End month'} = '����� ������';
    $Self->{Translation}->{'End year'} = '����� ����';
    $Self->{Translation}->{'Thanks for your vote!'} = '������� �� ���� ������!';
    $Self->{Translation}->{'You have already voted!'} = '�� ��� ��������� ������!';
    $Self->{Translation}->{'FAQ Article Print'} = '������ ������ FAQ';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = '������ FAQ (Top 10)';
    $Self->{Translation}->{'FAQ Articles (new created)'} = '������ FAQ (�����)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = '������ FAQ (����������)';
    $Self->{Translation}->{'FAQ category updated!'} = '��������� FAQ ��������!';
    $Self->{Translation}->{'FAQ category added!'} = '��������� FAQ ���������!';
    $Self->{Translation}->{'A category should have a name!'} = '� ��������� ������ ���� ��������!';
    $Self->{Translation}->{'This category already exists'} = '����� ��������� ��� ����������!';
    $Self->{Translation}->{'FAQ language added!'} = '���� ��� FAQ ��������!';
    $Self->{Translation}->{'FAQ language updated!'} = '���� ��� FAQ ������!';
    $Self->{Translation}->{'The name is required!'} = '���������� ������ ��������!';
    $Self->{Translation}->{'This language already exists!'} = '����� ���� ��� ����������!';

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = '�������� ������ FAQ';
    $Self->{Translation}->{'A category is required.'} = '����� ������� ���������.';
    $Self->{Translation}->{'Approval'} = '��������';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = '���������� ����������� FAQ';
    $Self->{Translation}->{'Add category'} = '�������� ���������';
    $Self->{Translation}->{'Delete Category'} = '������� ���������';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = '�������� ���������';
    $Self->{Translation}->{'Edit Category'} = '������� ���������';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = '����� �������� � Explorer ��� �����������.';
    $Self->{Translation}->{'Please select at least one permission group.'} = '������� ���� �� ���� ������.';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = '������ �������, ������� ������ � ������� ���� ���������.';
    $Self->{Translation}->{'Do you really want to delete this category?'} = '����������� �������� ���� ���������!';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} = '��� ��������� ������� ������! � ��� ���������� ��� ������� ���� ������ FAQ �/��� ��� �������� ������������ ��� ������ ���������';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = '� ���� ��������� ������� ��������� ������ FAQ';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = '��� ��������� �������� ������������ ��� ��������� �����������';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = '����������� �������� ���� ������ FAQ!';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'FAQ Explorer';
    $Self->{Translation}->{'Quick Search'} = '������� �����';
    $Self->{Translation}->{'Advanced Search'} = '����������� �����';
    $Self->{Translation}->{'Subcategories'} = '����������';
    $Self->{Translation}->{'FAQ Articles'} = '������ FAQ';
    $Self->{Translation}->{'No subcategories found.'} = '���������� �� �������.';

    # Template: AgentFAQHistory

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = '������ ������� FAQ ���.';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = '���������� ������� FAQ';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languges.'} = '����������� ��� ������� ��� ������������� ������ � ����������� �������.';
    $Self->{Translation}->{'Add language'} = '�������� ����';
    $Self->{Translation}->{'Delete Language'} = '������� ����';
    $Self->{Translation}->{'Add Language'} = '�������� ����';
    $Self->{Translation}->{'Edit Language'} = '�������� ����';
    $Self->{Translation}->{'Do you really want to delete this language?'} = '����������� �������� ����� �����!';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} = '���� ���� ������� ������. �� �� �������� ��� ������� ���� ������ FAQ!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = '���� ���� ����������� � ��������� ������� FAQ';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '��������� ���������';
    $Self->{Translation}->{'FAQ articles per page'} = '���������� ������ �� ��������';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = '������ FAQ �� �������.';

    # Template: AgentFAQPrint
    $Self->{Translation}->{'FAQ-Info'} = '���������� FAQ';
    $Self->{Translation}->{'Votes'} = '������';

    # Template: AgentFAQSearch

    # Template: AgentFAQSearchOpenSearchDescriptionFAQNumber

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = '';

    # Template: AgentFAQSearchResultPrint

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = '����� � FAQ';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = '���������� FAQ';
    $Self->{Translation}->{'Rating'} = '������';
    $Self->{Translation}->{'Rating %'} = '������ %';
    $Self->{Translation}->{'out of 5'} = '�� 5';
    $Self->{Translation}->{'No votes found!'} = '������ �� �������!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = '������ �� �������! ������� ��� ������ FAQ ������.';
    $Self->{Translation}->{'Download Attachment'} = '������� ��������';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} = '��������� ���� ������� ��� ������? ����������, ������� �, ����� �� ����� �������� ���� FAQ. �������!';
    $Self->{Translation}->{'not helpful'} = '�����������';
    $Self->{Translation}->{'very helpful'} = '����� ��������';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Insert FAQ Text'} = '�������� ����� FAQ';
    $Self->{Translation}->{'Insert FAQ Link'} = '�������� ������ �� FAQ';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = '�������� ����� FAQ � ������';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = '������ FAQ �� �������.';

    # Template: CustomerFAQPrint

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = '�������������� ����� � ������� FAQ (��������, "�����*��" ��� "����*")';

    # Template: CustomerFAQSearchOpenSearchDescription

    # Template: CustomerFAQSearchResultPrint

    # Template: CustomerFAQSearchResultShort

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Details'} = '���������';
    $Self->{Translation}->{'Search for articles with keyword'} = '����� ������ �� ��������� �����';

    # Template: PublicFAQExplorer

    # Template: PublicFAQPrint

    # Template: PublicFAQSearch

    # Template: PublicFAQSearchOpenSearchDescription
    $Self->{Translation}->{'Public'} = '�������������';

    # Template: PublicFAQSearchResultPrint

    # Template: PublicFAQSearchResultShort

    # Template: PublicFAQZoom

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} = 'Ein Filter zur automatischen Generierung von FAQ-Links, wenn ein Hinweis auf einen FAQ-Artikel identifiziert wird. Das Element Image erlaubt zwei Eingabeformen: Erstens der Name eines Icons (z. B. faq.png). In diesem Fall wird auf das Grafik-Verzeichnis des OTRS zugegriffen. Als zweite M�glichkeit kann man aber auch den direkten Link zur Grafik angeben (z. B. http://otrs.org/faq.png).';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'CSS-Farbe f�r das Bewertungs-Ergebnis.';
    $Self->{Translation}->{'Category Management'} = '���������� �����������';
    $Self->{Translation}->{'Decimal places of the voting result.'} = '';
    $Self->{Translation}->{'Default category name.'} = '�������� ��������� ��-���������.';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = '���� ������ FAQ ��-��������� � ����������� ������.';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} = '��������� ������ �� ��������� ������ FAQ ��-���������.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = '������ ������ FAQ ��-���������.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = '������ ������ �� ��������� ������ FAQ ��-���������.';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} = '�������� �� ��������� ��������� Action ��� �������������� ���������. �������� Action ������������ � �������� �������.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} = '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} = '������� ����������� �������� �������� FAQ ��� ���������� ����������� ������ � FAQ � ���������� ������.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} = '������� ����������� �������� �������� FAQ ��� ���������� ����������� ������ � FAQ � ���������� �������.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} = '������� ����������� �������� �������� ���������� ���������� ������ � ������������� ����������.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} = '������� ����������� �������� �������� ���������� � FAQ Explorere ���������� ������.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} = '������� ����������� �������� �������� ���������� � FAQ Explorere ���������� �������.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} = '������� ����������� �������� �������� ���������� � FAQ Explorere � �������������  ����������.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} = '������� ����������� ������� � ����������� FAQ Explorer ���������� ������. Up: ������� �������. Down: ����� �������.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} = '������� ����������� ������� � ����������� FAQ Explorer ���������� �������. Up: ������� �������. Down: ����� �������.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} = '������� ����������� ������� � ����������� FAQ Explorer � ������������� ����������. Up: ������� �������. Down: ����� �������.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} = '';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} = '';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} = '';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed. Note: AgentTicketActionCommon includes AgentTicketNote, AgentTicketClose, AgentTicketFreeText, AgentTicketOwner, AgentTicketPending, AgentTicketPriority and AgentTicketResponsible.'} = '';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = '';
    $Self->{Translation}->{'Delete this FAQ'} = '������� ���� FAQ';
    $Self->{Translation}->{'Edit this FAQ'} = '�������� ���� FAQ';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = '��������� �������������� � ������ FAQ.';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = '��������� ������� ������ � ������ FAQ.';
    $Self->{Translation}->{'FAQ Journal'} = '������ FAQ';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = '';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = '';
    $Self->{Translation}->{'FAQ path separator.'} = '����������� ���� FAQ.';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = '';
    $Self->{Translation}->{'FAQ-Area'} = '';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = '';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = '������ ��� ��������� ������ FAQ.';
    $Self->{Translation}->{'History of this FAQ'} = '������� ����� FAQ';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Interfaces where the quicksearch should be shown.'} = '����������, � ������� ������������ ������� �����.';
    $Self->{Translation}->{'Journal'} = '������';
    $Self->{Translation}->{'Language Management'} = '���������� �������';
    $Self->{Translation}->{'Languagekey which is defined in the language file *_FAQ.pm.'} = '���� �����, ��������� � �������� ����� *_FAQ.pm.';
    $Self->{Translation}->{'Link another object to this FAQ item'} = '��������� ������ ������ � ����� �������� FAQ';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} = '������������ ���������� ������, ��������� � FAQ Explorer � ���������� ������.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} = '������������ ���������� ������, ��������� � FAQ Explorer � ���������� �������.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} = '������������ ���������� ������, ��������� � FAQ Explorer � ������������� ����������.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} = '������������ ���������� ������, ��������� � ������� FAQ � ���������� ������.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} = '������������ ���������� ������, ��������� � ���������� ������ � ���������� ������.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} = '������������ ���������� ������, ��������� � ���������� ������ � ���������� �������.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} = '������������ ���������� ������, ��������� � ���������� ������ � ������������� ����������.';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short faq search.'} = '';
    $Self->{Translation}->{'New FAQ Article'} = '����� ������ � FAQ';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = '����� ������ FAQ ����� ����������� ������� ���������.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} = '���������� ������, ��������� � FAQ Explorer � ���������� �������.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} = '���������� ������, ��������� � FAQ Explorer � ������������� ����������.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} = '���������� ������, ��������� �� ������ �������� ���������� ������ �  ���������� �������.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} = '���������� ������, ��������� �� ������ �������� ���������� ������ � ������������� ����������.';
    $Self->{Translation}->{'Number of shown items in last changes.'} = '���������� ������������ ������� � ��������� ����������.';
    $Self->{Translation}->{'Number of shown items in last created.'} = '���������� ������������ ������� � ����� �������.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = '���������� ������������ ������� � ������� Top 10.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} = '';
    $Self->{Translation}->{'Print this FAQ'} = '������ ����� FAQ';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = '������� �� ��������� ������ FAQ.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = '';
    $Self->{Translation}->{'Search FAQ'} = '����� � FAQ';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert FAQ Text" Button in AgentFAQZoomSmall.'} = '';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = '���������� ������ FAQ � HTML.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = '���������� ���� FAQ ��/���.';
    $Self->{Translation}->{'Show WYSIWYG editor in agent interface.'} = '���������� WYSIWYG �������� � ���������� ������.';
    $Self->{Translation}->{'Show items of subcategories.'} = '���������� ���������� �����������.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = '���������� ��������� ��������� � �������� �����������.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = '���������� ����� ������ � ��������� �����������.';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = '���������� Top 10 � ��������� �����������.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = '���������� ������ � ��������� �����������.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} = '������������� FAQ, ��������, FAQ#, KB#, MyFAQ#. �� ��������� - FAQ#.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} = '';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = '���� ������ �� ��������� ������ FAQ.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = '���� ������ �� ��������� ������ FAQ.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ Explorer of the agent interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the explorer in the customer interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the explorer in the public interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the explorer in the customer interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the explorer in the public interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order of a Explorer result in the agent interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Delete: '} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the explorer in the customer interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the explorer in the public interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a Explorer in the agent interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in each page of a search result in the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in each page of a search result in the public interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the explorer in the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the explorer in the public interface.'} = '';
    $Self->{Translation}->{'Show "Insert Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert Text" Button in AgentFAQZoomSmall.'} = '';

}

1;
