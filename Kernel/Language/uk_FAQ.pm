# --
# Kernel/Language/uk_FAQ.pm - the ukrainian translation of FAQ
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2009 Belskii Artem
# --
# $Id: uk_FAQ.pm,v 1.12 2010/12/01 20:14:02 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.
# --

package Kernel::Language::uk_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.12 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'You have already voted!'}           = '�� ��� ����������!';
    $Lang->{'No rate selected!'}                 = '���� ������ �������!';
    $Lang->{'Thanks for your vote!'}             = '������, �� ��, �� �������������!';
    $Lang->{'Votes'}                             = '������';
    $Lang->{'LatestChangedItems'}                = '������� ������ ������';
    $Lang->{'LatestCreatedItems'}                = '������� �������� ������';
    $Lang->{'Top10Items'}                        = '��� 10 �������';
    $Lang->{'ArticleVotingQuestion'}             = '';
    $Lang->{'SubCategoryOf'}                     = 'ϳ��������';
    $Lang->{'QuickSearch'}                       = '������� �����';
    $Lang->{'DetailSearch'}                      = '������������ �����';
    $Lang->{'Categories'}                        = '�������';
    $Lang->{'SubCategories'}                     = 'ϳ��������';
    $Lang->{'New FAQ Article'}                   = '���� ������ ��';
    $Lang->{'FAQ Category'}                      = '������� ��';
    $Lang->{'A category should have a name!'}    = '�������� ������� ���� ��\'�';
    $Lang->{'A category should have a comment!'} = '�������� ������� ���� ��������';
    $Lang->{'FAQ News (new created)'}            = '������ ��(��� �����)';
    $Lang->{'FAQ News (recently changed)'}       = '������ ��(������� �����)';
    $Lang->{'FAQ News (Top 10)'}                 = '������ ��(��� 10)';
    $Lang->{'StartDay'}                          = '������� ����';
    $Lang->{'StartMonth'}                        = '������� �����';
    $Lang->{'StartYear'}                         = '������� ����';
    $Lang->{'EndDay'}                            = 'ʳ���� ���';
    $Lang->{'EndMonth'}                          = 'ʳ���� �����';
    $Lang->{'EndYear'}                           = 'ʳ���� ����';
    $Lang->{'Approval'}                          = '�������� ����� � ��������(Approval)';
    $Lang->{'internal'}                          = '';
    $Lang->{'external'}                          = '';
    $Lang->{'public'}                            = '';

    $Lang->{
        'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'
        } = '���� ��������� ��������. ��� �������� ������ ��� ��������� �������� ������, �������� �� ���� �������. ���� �����, �������� ���� �����/�������� ������� ��� -������� ����-!';
    $Lang->{'Agent groups which can access this category.'} = '������ �����, ��� ������ �������� ������ �� �������';
    $Lang->{'A category needs at least one permission group!'}   = '������� ���������� ������� ����� ������� � �����';
    $Lang->{'Will be shown as comment in Explorer.'}         = '���� ��������, �� �������� � ���������';
    $Lang->{'FAQ'}                          = '���� �����';
    $Lang->{'FAQ-Area'}                     = '���� �����';
    $Lang->{'Explorer'}                       = '��������';
    $Lang->{'����������'}                   = '³����';

    $Lang->{'Default category name.'}                                      = '';
    $Lang->{'Rates for voting. Key must be in percent.'}                   = '';
    $Lang->{'Show voting in defined interfaces.'}                          = '';
    $Lang->{'Languagekey which is defined in the language file *_FAQ.pm.'} = '';
    $Lang->{'Show FAQ path yes/no.'}                                       = '';
    $Lang->{'Decimal places of the voting result.'}                        = '';
    $Lang->{'CSS color for the voting result.'}                            = '';
    $Lang->{'FAQ path separator.'}                                         = '';
    $Lang->{'Interfaces where the quicksearch should be shown.'}           = '';
    $Lang->{'Show items of subcategories.'}                                = '';
    $Lang->{'Show last change items in defined interfaces.'}               = '';
    $Lang->{'Number of shown items in last changes.'}                      = '';
    $Lang->{'Show last created items in defined interfaces.'}              = '';
    $Lang->{'Number of shown items in last created.'}                      = '';
    $Lang->{'Show top 10 items in defined interfaces.'}                    = '';
    $Lang->{'Number of shown items in the top 10 feature.'}                = '';
    $Lang->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'}
        = '';
    $Lang->{'Default state for FAQ entry.'}                                = '';
    $Lang->{'Show WYSIWYG editor in agent interface.'}                     = '';
    $Lang->{'New FAQ articles need approval before they get published.'}   = '';
    $Lang->{'Group for the approval of FAQ articles.'}                     = '';
    $Lang->{'Queue for the approval of FAQ articles.'}                     = '';
    $Lang->{'Ticket subject for approval of FAQ article.'}                 = '';
    $Lang->{'Ticket body for approval of FAQ article.'}                    = '';
    $Lang->{'Default priority of tickets for the approval of FAQ articles.'}
        = '';
    $Lang->{'Default state of tickets for the approval of FAQ articles.'}  = '';
    $Lang->{'Definition of FAQ item free text field.'}                     = '';
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
    $Lang->{'FAQ Explorer'}             = '';
    $Lang->{'Subcategories'}            = '';
    $Lang->{'Articles'}                 = '';
    $Lang->{'No subcategories found.'}  = '';
    $Lang->{'No FAQ data found.'}       = '';

    # template: AgentFAQAdd
    $Lang->{'Add FAQ Article'}         = '';
    $Lang->{'The title is required.'}  = '';
    $Lang->{'A category is required.'} = '';

   # template: AgentFAQJournal
    $Lang->{'FAQ Journal'} = '';

    # template: AgentFAQLanguage
    $Lang->{'FAQ Language Management'}                               = '';
    $Lang->{'Add Language'}                                          = '';
    $Lang->{'Add language'}                                          = '';
    $Lang->{'Edit Language'}                                         = '';
    $Lang->{'Delete Language'}                                       = '';
    $Lang->{'The name is required!'}                                 = '';
    $Lang->{'This language already exists!'}                         = '';
    $Lang->{'FAQ language added!'}                                   = '';
    $Lang->{'FAQ language updated!'}                                 = '';
    $Lang->{'Do you really want to delete this Language?'}           = '';
    $Lang->{'This Language is used in the following FAQ Article(s)'} = '';
    $Lang->{'You can not delete this Language. It is used in at least one FAQ Article!'}
        = '';

    # template: AgentFAQCategory
    $Lang->{'FAQ Category Management'}                         = '';
    $Lang->{'Add Category'}                                    = '';
    $Lang->{'Add category'}                                    = '';
    $Lang->{'Edit Category'}                                   = '';
    $Lang->{'Delete Category'}                                 = '';
    $Lang->{'A category should have a name!'}                  = '';
    $Lang->{'A category should have a comment!'}                = '';
    $Lang->{'A category needs at least one permission group!'} = '';
    $Lang->{'This category already exists!'}                   = '';
    $Lang->{'FAQ category updated!'}                           = '';
    $Lang->{'FAQ category added!'}                             = '';
    $Lang->{'Do you really want to delete this Category?'}     = '';
    $Lang->{'This Category is used in the following FAQ Artice(s)'}
        = '';
    $Lang->{'This Category is parent of the following SubCategories'}
        = '';
    $Lang->{'You can not delete this Category. It is used in at least one FAQ Article! and/or is parent of at least another Category'}
        = '';

    # template: AgentFAQZoom
    $Lang->{'FAQ Information'}                      = '';
    $Lang->{'Rating'}                               = '';
    $Lang->{'No votes found!'}                      = '';
    $Lang->{'Details'}                              = '';
    $Lang->{'Edit this FAQ'}                        = '';
    $Lang->{'History of this FAQ'}                  = '';
    $Lang->{'Print this FAQ'}                       = '';
    $Lang->{'Link another object to this FAQ item'} = '';
    $Lang->{'Delete this FAQ'}                      = '';
    $Lang->{'not helpful'}                          = '';
    $Lang->{'very helpful'}                         = '';
    $Lang->{'out of 5'}                             = '';
    $Lang->{'No votes found! Be the first one to rate this FAQ article.'}
         = '';

    # template: AgentFAQHistory
    $Lang->{'History Content'} = '';
    $Lang->{'Updated'}         = '';

    # template: AgentFAQDelete
    $Lang->{'Do you really want to delete this FAQ article?'} = '';

    # template: AgentFAQPrint
    $Lang->{'FAQ Article Print'} = '';

    # template: CustomerFAQSearch
    $Lang->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'}
         = '';

    return 1;
}

1;
