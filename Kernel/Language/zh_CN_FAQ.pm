# --
# Kernel/Language/zh_CN_FAQ.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: zh_CN_FAQ.pm,v 1.20 2011/01/24 18:06:53 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_FAQ;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAFAQ
    $Self->{Translation}->{'internal'} = '�ڲ�';
    $Self->{Translation}->{'public'} = '����';
    $Self->{Translation}->{'external'} = '�ⲿ';
    $Self->{Translation}->{'FAQ Number'} = '';
    $Self->{Translation}->{'LatestChangedItems'} = '����޸ĵ�����';
    $Self->{Translation}->{'LatestCreatedItems'} = '���´���������';
    $Self->{Translation}->{'Top10Items'} = '��õ�����';
    $Self->{Translation}->{'SubCategoryOf'} = '��Ŀ¼��';
    $Self->{Translation}->{'No rate selected!'} = 'û��ѡ������!';
    $Self->{Translation}->{'public (all)'} = '';
    $Self->{Translation}->{'external (customer)'} = '';
    $Self->{Translation}->{'internal (agent)'} = '';
    $Self->{Translation}->{'StartDay'} = '��ʼ����';
    $Self->{Translation}->{'StartMonth'} = '��ʼ�·�';
    $Self->{Translation}->{'StartYear'} = '��ʼ���';
    $Self->{Translation}->{'EndDay'} = '��������';
    $Self->{Translation}->{'EndMonth'} = '��ʼ�·�';
    $Self->{Translation}->{'EndYear'} = '�������';
    $Self->{Translation}->{'Thanks for your vote!'} = '��л��������';
    $Self->{Translation}->{'You have already voted!'} = '���Ѿ�����!';
    $Self->{Translation}->{'FAQ Article Print'} = '';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'FAQ ����';
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'FAQ ����(�´���)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'FAQ ����(�������)';
    $Self->{Translation}->{'FAQ category updated!'} = 'FAQ Ŀ¼�Ѹ���!';
    $Self->{Translation}->{'FAQ category added!'} = 'FAQ Ŀ¼������!';
    $Self->{Translation}->{'A category should have a name!'} = 'Ŀ¼Ӧ��Ҫ��һ������!';
    $Self->{Translation}->{'This category already exists'} = '';
    $Self->{Translation}->{'FAQ language added!'} = 'FAQ �����Ѿ�����!';
    $Self->{Translation}->{'FAQ language updated!'} = 'FAQ �����Ѿ�����!';
    $Self->{Translation}->{'The name is required!'} = '����Ҫ��һ����������!';
    $Self->{Translation}->{'This language already exists!'} = '�������Ѿ�����!';

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = '���� FAQ ����';
    $Self->{Translation}->{'A category is required.'} = 'Ŀ¼�Ǳ����.';
    $Self->{Translation}->{'Approval'} = '�Ͽɶ�';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'FAQ Ŀ¼����';
    $Self->{Translation}->{'Add category'} = '';
    $Self->{Translation}->{'Delete Category'} = 'ɾ��Ŀ¼';
    $Self->{Translation}->{'Ok'} = '';
    $Self->{Translation}->{'Add Category'} = '����Ŀ¼';
    $Self->{Translation}->{'Edit Category'} = '�༭Ŀ¼';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'ע�ͽ����ʱ��ʾ.';
    $Self->{Translation}->{'Please select at least one permission group.'} = '';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = '';
    $Self->{Translation}->{'Do you really want to delete this category?'} = '';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} = '';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = '';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = '';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = '���Ҫɾ���� FAQ ������?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = '';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'FAQ �����';
    $Self->{Translation}->{'Quick Search'} = '';
    $Self->{Translation}->{'Advanced Search'} = '';
    $Self->{Translation}->{'Subcategories'} = '��Ŀ¼';
    $Self->{Translation}->{'FAQ Articles'} = '';
    $Self->{Translation}->{'No subcategories found.'} = 'û���ҵ���Ŀ¼.';

    # Template: AgentFAQHistory

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = '';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'FAQ ���Թ���';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languges.'} = '';
    $Self->{Translation}->{'Add language'} = '';
    $Self->{Translation}->{'Delete Language'} = 'ɾ������';
    $Self->{Translation}->{'Add Language'} = '��������';
    $Self->{Translation}->{'Edit Language'} = '�༭����';
    $Self->{Translation}->{'Do you really want to delete this language?'} = '';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} = '';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = '';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '';
    $Self->{Translation}->{'FAQ articles per page'} = '';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'û���ҵ� FAQ ����.';

    # Template: AgentFAQPrint
    $Self->{Translation}->{'FAQ-Info'} = '';
    $Self->{Translation}->{'Votes'} = '����';

    # Template: AgentFAQSearch

    # Template: AgentFAQSearchOpenSearchDescriptionFAQNumber

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = '';

    # Template: AgentFAQSearchResultPrint

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = '';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'FAQ ��ϸ��Ϣ';
    $Self->{Translation}->{'Rating'} = '����';
    $Self->{Translation}->{'Rating %'} = '';
    $Self->{Translation}->{'out of 5'} = '��������';
    $Self->{Translation}->{'No votes found!'} = 'û���ҵ�����!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'û���ҵ�����! �⽫�Ǹ� FAQ ���µĵ�һ������.';
    $Self->{Translation}->{'Download Attachment'} = '';
    $Self->{Translation}->{'ArticleVotingQuestion'} = '';
    $Self->{Translation}->{'not helpful'} = 'û�а���';
    $Self->{Translation}->{'very helpful'} = '���а���';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Insert FAQ Text'} = '';
    $Self->{Translation}->{'Insert FAQ Link'} = '';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = '';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = '';

    # Template: CustomerFAQPrint

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = '';

    # Template: CustomerFAQSearchOpenSearchDescription

    # Template: CustomerFAQSearchResultPrint

    # Template: CustomerFAQSearchResultShort

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Details'} = '��ϸ';
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
    $Self->{Translation}->{'Article free text options shown in the ticket message screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###AttributesView.'} = '';
    $Self->{Translation}->{'CSS color for the voting result.'} = '';
    $Self->{Translation}->{'Category Management'} = '';
    $Self->{Translation}->{'Configure your own log text for PGP.'} = '';
    $Self->{Translation}->{'Custom text for the page shown to customers that have no tickets yet.'} = '';
    $Self->{Translation}->{'Decimal places of the voting result.'} = '��ʮ������ʾ���ֽ��.';
    $Self->{Translation}->{'Default category name.'} = 'Ĭ�ϵ�Ŀ¼��.';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = '';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} = 'FAQ ������׼����� Ticket �����ȼ�.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Ĭ�ϵ� FAQ ͳ����Ŀ.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'FAQ ������׼����� Ticket ��Ĭ��״̬.';
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
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = '���� FAQ ��Ŀ�Ĳ����������ֶ�.';
    $Self->{Translation}->{'Delete this FAQ'} = 'ɾ��';
    $Self->{Translation}->{'Edit this FAQ'} = '�༭';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = '';
    $Self->{Translation}->{'FAQ Journal'} = 'FAQ ��־';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = '';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = '';
    $Self->{Translation}->{'FAQ path separator.'} = 'FAQ ·���ָ���.';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = '';
    $Self->{Translation}->{'FAQ-Area'} = '';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = '';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = '��׼ FAQ ���������Ⱥ��.';
    $Self->{Translation}->{'History of this FAQ'} = '��ʷ';
    $Self->{Translation}->{'Ignore article with system sender type for new article feature (e. g. auto responses or email notifications).'} = '';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Interfaces where the quicksearch should be shown.'} = '�ڽ����������ʾ��������.';
    $Self->{Translation}->{'Journal'} = '';
    $Self->{Translation}->{'Language Management'} = '';
    $Self->{Translation}->{'Languagekey which is defined in the language file *_FAQ.pm.'} = '';
    $Self->{Translation}->{'Link another object to this FAQ item'} = '����';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} = '';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short faq search.'} = '';
    $Self->{Translation}->{'New FAQ Article'} = '���������';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = '�µ� FAQ �����ڷ���ǰ��Ҫ��׼.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} = '';
    $Self->{Translation}->{'Number of shown items in last changes.'} = '��ʾ���������Ŀ������.';
    $Self->{Translation}->{'Number of shown items in last created.'} = '��ʾ���´�����Ŀ������.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = '��ʾ�����ǰʮλ��Ŀ������.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} = '';
    $Self->{Translation}->{'Print this FAQ'} = '��ӡ';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = '��׼ FAQ ��������Ķ���.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = '������, ��ֵ�����ڰٷֱ�����.';
    $Self->{Translation}->{'Search FAQ'} = '';
    $Self->{Translation}->{'Set this to yes if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.'} = '';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert FAQ Text" Button in AgentFAQZoomSmall.'} = '';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = '';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = '��/����ʾ FAQ ·��.';
    $Self->{Translation}->{'Show WYSIWYG editor in agent interface.'} = '�ڷ�����Ա������ʾ WYSIWYG(����������)�༭��.';
    $Self->{Translation}->{'Show items of subcategories.'} = '��ʾ��Ŀ¼������.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = '�ڽ�������ʾ������ĵ���Ŀ.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = '�ڽ�������ʾ���´�������Ŀ.';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = '�ڽ�������ʾ�����ǰʮλ.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = '������ʾ���ֵĽ���.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows time use complete description (days, hours, minutes), if set to "Yes"; or just first letter (d, h, m), if set to "No".'} = '';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} = 'FAQ �ı�ʶ��, ���� (��������)FAQ#, (֪ʶ��)KB#, Ĭ��Ϊ FAQ#';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} = '';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} = '';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'FAQ ������׼����� Ticket ����.';
    $Self->{Translation}->{'Ticket free text options shown in the ticket message screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###AttributesView.'} = '';
    $Self->{Translation}->{'Ticket free time options shown in the ticket message screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###AttributesView.'} = '';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'FAQ ������׼����� Ticket ����.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'A category needs at least one permission group!'} = '����Ҫָ��һ��Ⱥ��Ը�Ŀ¼ӵ��Ȩ��!';
    $Self->{Translation}->{'A category should have a comment!'} = 'Ŀ¼Ӧ��Ҫ��һ��ע��!';
    $Self->{Translation}->{'Agent groups which can access this category.'} = '��һ��Ⱥ����Է��ʴ�Ŀ¼.';
    $Self->{Translation}->{'Articles'} = '����';
    $Self->{Translation}->{'CSS color for the voting flag.'} = '���ֱ�ǵ� CSS ��ɫ.';
    $Self->{Translation}->{'Categories'} = 'Ŀ¼';
    $Self->{Translation}->{'DetailSearch'} = '�߼�����';
    $Self->{Translation}->{'Do you really want to delete this Category?'} = '���Ҫɾ����Ŀ¼��?';
    $Self->{Translation}->{'Do you really want to delete this Language?'} = '���Ҫɾ����������?';
    $Self->{Translation}->{'Explorer'} = '���';
    $Self->{Translation}->{'FAQ Category'} = 'FAQ Ŀ¼';
    $Self->{Translation}->{'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'} = 'û�й��ൽĿ¼. Ҫ����һƪ������Ҫ���ൽĿ¼��, ���� -Ŀ¼�˵�- ��ѡ������Ȩ�޴������µ�Ŀ¼';
    $Self->{Translation}->{'SubCategories'} = '��Ŀ¼';
    $Self->{Translation}->{'The title is required.'} = '�����Ǳ����.';
    $Self->{Translation}->{'This Category is parent of the following SubCategories'} = '��Ŀ¼��������Ŀ¼�ĸ�Ŀ¼';
    $Self->{Translation}->{'This Category is used in the following FAQ Artice(s)'} = '��Ŀ¼�������µ� FAQ ������ʹ��';
    $Self->{Translation}->{'This Language is used in the following FAQ Article(s)'} = '�������������µ� FAQ ������ʹ��';
    $Self->{Translation}->{'This category already exists!'} = '��Ŀ¼�Ѿ��ڴ���!';
    $Self->{Translation}->{'Updated'} = '����';
    $Self->{Translation}->{'You can not delete this Category. It is used in at least one FAQ Article! and/or is parent of at least another Category'} = '����ɾ����Ŀ¼. �����ٻ���һƪ FAQ ������ʹ�� ��/�� ��������Ŀ¼�ĸ�Ŀ¼!';
    $Self->{Translation}->{'You can not delete this Language. It is used in at least one FAQ Article!'} = '����ɾ��������. �����ٻ���һƪ FAQ ������ʹ��!';

}

1;
