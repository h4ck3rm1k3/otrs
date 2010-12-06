# --
# Kernel/Language/zh_CN_FAQ.pm - the Chinese simple translation for FAQ
# Copyright (C) 2009 Never Min <never at qnofae.org>
# --
# $Id: zh_CN_FAQ.pm,v 1.16 2010/12/06 09:51:50 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.
# --

package Kernel::Language::zh_CN_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.16 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Explorer'}                 = '���';
    $Lang->{'You have already voted!'}           = '���Ѿ�����!';
    $Lang->{'No rate selected!'}                 = 'û��ѡ������!';
    $Lang->{'Thanks for your vote!'}             = '��л��������';
    $Lang->{'Votes'}                             = '����';
    $Lang->{'LatestChangedItems'}                = '����޸ĵ�����';
    $Lang->{'LatestCreatedItems'}                = '���´���������';
    $Lang->{'Top10Items'}                        = '��õ�����';
    $Lang->{'ArticleVotingQuestion'}             = '';
    $Lang->{'SubCategoryOf'}                     = '��Ŀ¼��';
    $Lang->{'QuickSearch'}                       = '��������';
    $Lang->{'DetailSearch'}                      = '�߼�����';
    $Lang->{'Categories'}                        = 'Ŀ¼';
    $Lang->{'SubCategories'}                     = '��Ŀ¼';
    $Lang->{'New FAQ Article'}                   = '���������';
    $Lang->{'FAQ Category'}                      = 'FAQ Ŀ¼';
    $Lang->{'A category should have a name!'}    = 'Ŀ¼������Ϊ��!';
    $Lang->{'A category should have a comment!'} = '��Ϊ��Ŀ¼д��ע��!';
    $Lang->{'FAQ Articles (new created)'}        = 'FAQ ����(�´���)';
    $Lang->{'FAQ Articles (recently changed)'}   = 'FAQ ����(�������)';
    $Lang->{'FAQ Articles (Top 10)'}             = 'FAQ ����';
    $Lang->{'StartDay'}                          = '��ʼ����';
    $Lang->{'StartMonth'}                        = '��ʼ�·�';
    $Lang->{'StartYear'}                         = '��ʼ���';
    $Lang->{'EndDay'}                            = '��������';
    $Lang->{'EndMonth'}                          = '��ʼ�·�';
    $Lang->{'EndYear'}                           = '�������';
    $Lang->{'Approval'}                          = '�Ͽɶ�';
    $Lang->{'internal'}                          = '�ڲ�';
    $Lang->{'external'}                          = '�ⲿ';
    $Lang->{'public'}                            = '����';

    $Lang->{'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'} = 'û�й��ൽĿ¼. Ҫ����һƪ������Ҫ���ൽĿ¼��, ���� -Ŀ¼�˵�- ��ѡ������Ȩ�޴������µ�Ŀ¼';
    $Lang->{'Agent groups which can access this category.'} = '��һ��Ⱥ����Է��ʴ�Ŀ¼.';
    $Lang->{'A category needs at least one permission group!'}   = 'һ��Ŀ¼����Ҫ����һ��Ȩ��Ⱥ��';
    $Lang->{'Will be shown as comment in Explorer.'}         = 'ע�ͽ����ʱ��ʾ.';

    $Lang->{'Default category name.'}                                      = 'Ĭ�ϵ�Ŀ¼��.';
    $Lang->{'Rates for voting. Key must be in percent.'}                   = '������, ��ֵ�����ڰٷֱ�����.';
    $Lang->{'Show voting in defined interfaces.'}                          = '������ʾ���ֵĽ���.';
    $Lang->{'Languagekey which is defined in the language file *_FAQ.pm.'} = '';
    $Lang->{'Show FAQ path yes/no.'}                                       = '��/����ʾ FAQ ·��.';
    $Lang->{'Decimal places of the voting result.'}                        = '��ʮ������ʾ���ֽ��.';
    $Lang->{'CSS color for the voting flag.'}                              = '���ֱ�ǵ� CSS ��ɫ.';
    $Lang->{'FAQ path separator.'}                                         = 'FAQ ·���ָ���.';
    $Lang->{'Interfaces where the quicksearch should be shown.'}           = '�ڽ����������ʾ��������.';
    $Lang->{'Show items of subcategories.'}                                = '��ʾ��Ŀ¼������.';
    $Lang->{'Show last change items in defined interfaces.'}               = '�ڽ�������ʾ������ĵ���Ŀ.';
    $Lang->{'Number of shown items in last changes.'}                      = '��ʾ���������Ŀ������.';
    $Lang->{'Show last created items in defined interfaces.'}              = '�ڽ�������ʾ���´�������Ŀ.';
    $Lang->{'Number of shown items in last created.'}                      = '��ʾ���´�����Ŀ������.';
    $Lang->{'Show top 10 items in defined interfaces.'}                    = '�ڽ�������ʾ�����ǰʮλ.';
    $Lang->{'Number of shown items in the top 10 feature.'}                = '��ʾ�����ǰʮλ��Ŀ������.';
    $Lang->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'}
        = 'FAQ �ı�ʶ��, ���� (��������)FAQ#, (֪ʶ��)KB#, Ĭ��Ϊ FAQ#';
    $Lang->{'Default state for FAQ entry.'}                                = 'Ĭ�ϵ� FAQ ͳ����Ŀ.';
    $Lang->{'Show WYSIWYG editor in agent interface.'}                     = '�ڷ�����Ա������ʾ WYSIWYG(����������)�༭��.';
    $Lang->{'New FAQ articles need approval before they get published.'}   = '�µ� FAQ �����ڷ���ǰ��Ҫ��׼.';
    $Lang->{'Group for the approval of FAQ articles.'}                     = '��׼ FAQ ���������Ⱥ��.';
    $Lang->{'Queue for the approval of FAQ articles.'}                     = '��׼ FAQ ��������Ķ���.';
    $Lang->{'Ticket subject for approval of FAQ article.'}                 = 'FAQ ������׼����� Ticket ����.';
    $Lang->{'Ticket body for approval of FAQ article.'}                    = 'FAQ ������׼����� Ticket ����.';
    $Lang->{'Default priority of tickets for the approval of FAQ articles.'}
        = 'FAQ ������׼����� Ticket �����ȼ�.';
    $Lang->{'Default state of tickets for the approval of FAQ articles.'}  = 'FAQ ������׼����� Ticket ��Ĭ��״̬.';
    $Lang->{'Definition of FAQ item free text field.'}                     = '���� FAQ ��Ŀ�Ĳ����������ֶ�.';
    $Lang->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'}
        = '';
    $Lang->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'}
        = '';
    $Lang->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'}
        = '';
    $Lang->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'}
        = '';
    $Lang->{'Frontend module registration for the agent interface.'}    = '';
    $Lang->{'Frontend module registration for the customer interface.'} = '';
    $Lang->{'Frontend module registration for the public interface.'}   = '';
    $Lang->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'}
        = '';
    $Lang->{'Show FAQ Article with HTML.'}                              = '';
    $Lang->{'Module to generate html OpenSearch profile for short faq search.'}
        = '';
    $Lang->{'Defines where the \'Insert FAQ\' link will be displayed.'} = '';
    $Lang->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'}
        = '';
    $Lang->{'FAQ search backend router of the agent interface.'} = '';
    $Lang->{'Defines an overview module to show the small view of a FAQ list.'}
        = '';
    $Lang->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'}
        = '';
    $Lang->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'}
        = '';
    $Lang->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'}
        = '';
    $Lang->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'}
        = '';
    $Lang->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'}
        = '';
    $Lang->{'Defines the default FAQ attribute for FAQ sorting in a FAQ Explorer of the agent interface.'}
        = '';
    $Lang->{'Defines the default FAQ order of a Explorer result in the agent interface. Up: oldest on top. Down: latest on top.'}
        = '';
    $Lang->{'Maximum number of FAQ articles to be displayed in the result of a Explorer in the agent interface.'}
        = '';
    $Lang->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'}
        = '';
    $Lang->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'}
        = '';
    $Lang->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'}
        = '';
    $Lang->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface'}
        = '';
    $Lang->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'}
        = '';
    $Lang->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'}
        = '';
    $Lang->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'}
        = '';
    $Lang->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'}
        = '';
    $Lang->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'}
        = '';
    $Lang->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'}
        = '';
    $Lang->{'Number of FAQ articles to be displayed in each page of a search result in the customer interface.'}
        = '';
    $Lang->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'}
        = '';
    $Lang->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'}
        = '';
    $Lang->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'}
        = '';
    $Lang->{'Number of FAQ articles to be displayed in each page of a search result in the public interface.'}
        = '';
    $Lang->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'}
        = '';
    $Lang->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'}
        = '';
    $Lang->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'}
        = '';
    $Lang->{'Defines an overview module to show the small view of a FAQ journal.'}
        = '';

    # template: AgentFAQExplorer
    $Lang->{'FAQ Explorer'}             = 'FAQ �����';
    $Lang->{'Subcategories'}            = '��Ŀ¼';
    $Lang->{'Articles'}                 = '����';
    $Lang->{'No subcategories found.'}  = 'û���ҵ���Ŀ¼.';
    $Lang->{'No FAQ data found.'}       = 'û���ҵ� FAQ ����.';

    # template: AgentFAQAdd
    $Lang->{'Add FAQ Article'}         = '���� FAQ ����';
    $Lang->{'The title is required.'}  = '�����Ǳ����.';
    $Lang->{'A category is required.'} = 'Ŀ¼�Ǳ����.';

   # template: AgentFAQJournal
    $Lang->{'FAQ Journal'} = 'FAQ ��־';

    # template: AgentFAQLanguage
    $Lang->{'FAQ Language Management'}                               = 'FAQ ���Թ���';
    $Lang->{'Add Language'}                                          = '��������';
    $Lang->{'Edit Language'}                                         = '�༭����';
    $Lang->{'Delete Language'}                                       = 'ɾ������';
    $Lang->{'The name is required!'}                                 = '����Ҫ��һ����������!';
    $Lang->{'This language already exists!'}                         = '�������Ѿ�����!';
    $Lang->{'FAQ language added!'}                                   = 'FAQ �����Ѿ�����!';
    $Lang->{'FAQ language updated!'}                                 = 'FAQ �����Ѿ�����!';
    $Lang->{'Do you really want to delete this Language?'}           = '���Ҫɾ����������?';
    $Lang->{'This Language is used in the following FAQ Article(s)'} = '�������������µ� FAQ ������ʹ��';
    $Lang->{'You can not delete this Language. It is used in at least one FAQ Article!'}
        = '����ɾ��������. �����ٻ���һƪ FAQ ������ʹ��!';

    # template: AgentFAQCategory
    $Lang->{'FAQ Category Management'}                         = 'FAQ Ŀ¼����';
    $Lang->{'Add Category'}                                    = '����Ŀ¼';
    $Lang->{'Edit Category'}                                   = '�༭Ŀ¼';
    $Lang->{'Delete Category'}                                 = 'ɾ��Ŀ¼';
    $Lang->{'A category should have a name!'}                  = 'Ŀ¼Ӧ��Ҫ��һ������!';
    $Lang->{'A category should have a comment!'}               = 'Ŀ¼Ӧ��Ҫ��һ��ע��!';
    $Lang->{'A category needs at least one permission group!'} = '����Ҫָ��һ��Ⱥ��Ը�Ŀ¼ӵ��Ȩ��!';
    $Lang->{'This category already exists!'}                   = '��Ŀ¼�Ѿ��ڴ���!';
    $Lang->{'FAQ category updated!'}                           = 'FAQ Ŀ¼�Ѹ���!';
    $Lang->{'FAQ category added!'}                             = 'FAQ Ŀ¼������!';
    $Lang->{'Do you really want to delete this Category?'}     = '���Ҫɾ����Ŀ¼��?';
    $Lang->{'This Category is used in the following FAQ Artice(s)'}
        = '��Ŀ¼�������µ� FAQ ������ʹ��';
    $Lang->{'This Category is parent of the following SubCategories'}
        = '��Ŀ¼��������Ŀ¼�ĸ�Ŀ¼';
    $Lang->{'You can not delete this Category. It is used in at least one FAQ Article! and/or is parent of at least another Category'}
        = '����ɾ����Ŀ¼. �����ٻ���һƪ FAQ ������ʹ�� ��/�� ��������Ŀ¼�ĸ�Ŀ¼!';

    # template: AgentFAQZoom
    $Lang->{'FAQ Information'}                      = 'FAQ ��ϸ��Ϣ';
    $Lang->{'Rating'}                               = '����';
    $Lang->{'No votes found!'}                      = 'û���ҵ�����!';
    $Lang->{'Details'}                              = '��ϸ';
    $Lang->{'Edit this FAQ'}                        = '�༭';
    $Lang->{'History of this FAQ'}                  = '��ʷ';
    $Lang->{'Print this FAQ'}                       = '��ӡ';
    $Lang->{'Link another object to this FAQ item'} = '����';
    $Lang->{'Delete this FAQ'}                      = 'ɾ��';
    $Lang->{'not helpful'}                          = 'û�а���';
    $Lang->{'very helpful'}                         = '���а���';
    $Lang->{'out of 5'}                             = '��������';
    $Lang->{'No votes found! Be the first one to rate this FAQ article.'}
         = 'û���ҵ�����! �⽫�Ǹ� FAQ ���µĵ�һ������.';

    # template: AgentFAQHistory
    $Lang->{'History Content'} = '��ʷ';
    $Lang->{'Updated'}         = '����';

    # template: AgentFAQDelete
    $Lang->{'Do you really want to delete this FAQ article?'} = '���Ҫɾ���� FAQ ������?';

    return 1;
}

1;
