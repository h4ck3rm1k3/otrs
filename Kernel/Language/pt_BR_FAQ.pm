# --
# Kernel/Language/pt_BR_FAQ.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: pt_BR_FAQ.pm,v 1.20 2011/05/24 11:18:02 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_FAQ;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAFAQ
    $Self->{Translation}->{'internal'} = 'interno';
    $Self->{Translation}->{'public'} = 'p�blico';
    $Self->{Translation}->{'external'} = 'externo';
    $Self->{Translation}->{'FAQ Number'} = 'N�mero FAQ';
    $Self->{Translation}->{'LatestChangedItems'} = 'Artigos modificados recentemente';
    $Self->{Translation}->{'LatestCreatedItems'} = '�ltimos artigos adicionados';
    $Self->{Translation}->{'Top10Items'} = 'Os 10 artigos mais acessados';
    $Self->{Translation}->{'SubCategoryOf'} = 'Subcategoria de';
    $Self->{Translation}->{'No rate selected!'} = 'Selecione a pontua��o!';
    $Self->{Translation}->{'public (all)'} = 'p�blico (todos)';
    $Self->{Translation}->{'external (customer)'} = 'externo (cliente)';
    $Self->{Translation}->{'internal (agent)'} = 'interno (atendente)';
    $Self->{Translation}->{'StartDay'} = 'Dia de in�cio';
    $Self->{Translation}->{'StartMonth'} = 'M�s de in�cio';
    $Self->{Translation}->{'StartYear'} = 'Ano de in�cio';
    $Self->{Translation}->{'EndDay'} = 'Dia de t�rmino';
    $Self->{Translation}->{'EndMonth'} = 'M�s de t�rmino';
    $Self->{Translation}->{'EndYear'} = 'Ano de t�rmino';
    $Self->{Translation}->{'Thanks for your vote!'} = 'Obrigado por seu Voto';
    $Self->{Translation}->{'You have already voted!'} = 'Voc� j� votou!';
    $Self->{Translation}->{'FAQ Article Print'} = 'Imprimir Artigo FAQ';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'Artigos FAQ (Top 10)';
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'Artigos FAQ (criado novo)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'Artigos FAQ (alterados recentemente)';
    $Self->{Translation}->{'FAQ category updated!'} = 'Categoria FAQ atualizada!';
    $Self->{Translation}->{'FAQ category added!'} = 'Categoria FAQ adicionada!';
    $Self->{Translation}->{'A category should have a name!'} = 'Uma categoria precisa ter um nome!';
    $Self->{Translation}->{'This category already exists'} = 'Esta categoria j� existe!';
    $Self->{Translation}->{'FAQ language added!'} = 'Idioma FAQ adicionado!';
    $Self->{Translation}->{'FAQ language updated!'} = 'Idioma FAQ  atualizado!';
    $Self->{Translation}->{'The name is required!'} = 'O nome � obrigat�rio!';
    $Self->{Translation}->{'This language already exists!'} = 'Esse idioma j� existe!';

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'Adicionar Artigo de FAQ';
    $Self->{Translation}->{'A category is required.'} = 'A categoria � necess�ria.';
    $Self->{Translation}->{'Approval'} = 'Aprova��o';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'Gerenciamento de Categoria de FAQ';
    $Self->{Translation}->{'Add category'} = 'Adicionar categoria';
    $Self->{Translation}->{'Delete Category'} = 'Excluir Categoria';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = 'Adicionar Categoria';
    $Self->{Translation}->{'Edit Category'} = 'Alterar Categoria';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Ser� exibido como coment�rio no Explorerador';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'Por favor, selecione pelo menos um grupo de permiss�o.';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'Grupos de atendentes que podem acessar artigos nesta categoria.';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'Voc� realmente quer apagar esta categoria?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ artigo and/or is parent of at least one other category'} = 'Voc� n�o pode excluir esta categoria. Ela � usada em pelo menos um artigo FAQ e/ou � pai de pelo menos uma outra categoria!';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'Esta categoria � utilizada no(s) seguinte(s) artigo(s) FAQ';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'Esta categoria � pai das seguintes subcategorias';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Voc� realmente quer excluir este artigo FAQ?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'Explorerador FAQ';
    $Self->{Translation}->{'Quick Search'} = 'Busca R�pida';
    $Self->{Translation}->{'Advanced Search'} = 'Pesquisa Avan�ada';
    $Self->{Translation}->{'Subcategories'} = 'Subcategorias';
    $Self->{Translation}->{'FAQ Articles'} = 'Artigos FAQ';
    $Self->{Translation}->{'No subcategories found.'} = 'Subcategorias n�o encontradas.';

    # Template: AgentFAQHistory

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'N�o foram encontrados dados de Jornal FAQ.';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'Gerenciamento de Idiomas FAQ';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languges.'} = 'Use esse recurso se voc� deseja trabalhar com m�ltiplos idiomas.';
    $Self->{Translation}->{'Add language'} = 'Adicionar idioma';
    $Self->{Translation}->{'Delete Language'} = 'Excluir idioma';
    $Self->{Translation}->{'Add Language'} = 'Adicionar idioma';
    $Self->{Translation}->{'Edit Language'} = 'Editar idioma';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'Voc� realmente quer excluir este idioma?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} = 'Voc� n�o pode excluir este idioma. Ele � usado em pelo menos um artigo FAQ!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'Este idioma � usado nos seguintes artigo(s) FAQ';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Configura��es de Contexto';
    $Self->{Translation}->{'FAQ articles per page'} = 'Artigos FAQ por p�gina';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'N�o foram encontrados dados de FAQ.';

    # Template: AgentFAQPrint
    $Self->{Translation}->{'FAQ-Info'} = 'FAQ Informa��o';
    $Self->{Translation}->{'Votes'} = 'Votos';

    # Template: AgentFAQSearch

    # Template: AgentFAQSearchOpenSearchDescriptionFAQNumber

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'FAQ-TextoCompleto';

    # Template: AgentFAQSearchResultPrint

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'Busca FAQ';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'Informa��o FAQ';
    $Self->{Translation}->{'Rating'} = 'Nota';
    $Self->{Translation}->{'Rating %'} = 'Nota %';
    $Self->{Translation}->{'out of 5'} = 'reduzido de 5';
    $Self->{Translation}->{'No votes found!'} = 'Nenhum voto encontrado!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'Nenhum voto encontrado! Seja o primeiro a avaliar este artigo FAQ.';
    $Self->{Translation}->{'Download Attachment'} = 'Baixar anexos';
    $Self->{Translation}->{'ArticleVotingQuestion'} = 'Este artigo te ajudou?';
    $Self->{Translation}->{'not helpful'} = 'n�o ajuda';
    $Self->{Translation}->{'very helpful'} = 'muito �til';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Insert FAQ Text'} = 'FAQ Inserir Texto';
    $Self->{Translation}->{'Insert FAQ Link'} = 'FAQ Inserir Link';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'FAQ Inserir Texto e Link';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'Nenhum artigo FAQ encontrado.';

    # Template: CustomerFAQPrint

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Pesquisa completa de textos em artigos FAQ (por exemplo, "Jo*o" or "Will*")';

    # Template: CustomerFAQSearchOpenSearchDescription

    # Template: CustomerFAQSearchResultPrint

    # Template: CustomerFAQSearchResultShort

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Details'} = 'Detathes';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Procure por artigos com palavras-chave';

    # Template: PublicFAQExplorer

    # Template: PublicFAQPrint

    # Template: PublicFAQSearch

    # Template: PublicFAQSearchOpenSearchDescription
    $Self->{Translation}->{'Public'} = 'P�blico';

    # Template: PublicFAQSearchResultPrint

    # Template: PublicFAQSearchResultShort

    # Template: PublicFAQZoom

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} = 'Um filtro de sa�da HTML para adicionar links para tr�s uma seq��ncia definida. O elemento de imagem permite dois tipos de entrada. Primeiro, o nome de uma imagem (faq.png, por exemplo). Neste caso, o caminho da imagem OTRS ser� usado. A segunda possibilidade � inserir o link para a imagem.';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'CSS cor para o resultado da vota��o.';
    $Self->{Translation}->{'Category Management'} = 'Gerenciamento de Categoria';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'Casas decimais do resultado da vota��o.';
    $Self->{Translation}->{'Default category name.'} = 'Nome padr�o da categoria.';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = 'Idioma padr�o para os artigos FAQ no modo de idioma �nico.';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} = 'Prioridade padr�o de chamados para a aprova��o dos artigos FAQ.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Estado padr�o de entrada FAQ.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'Estado padr�o de chamados para a aprova��o dos artigos FAQ.';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} = 'Valor padr�o para o par�metro de Recurso para a interface p�blica. O par�metro de a��o � usado nos scripts do sistema.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} = 'Define um m�dulo de resumo para mostrar a visualiza��o pequena de um jornal FAQ.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} = 'Define um m�dulo de resumo para mostrar a visualizar de uma pequena lista de FAQ.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} = 'Define o atributo padr�o FAQ para classificar o FAQ em uma pesquisa FAQ da interface do atendente.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} = 'Define o atributo padr�o FAQ para classificar o FAQ em uma pesquisa FAQ da interface do cliente.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} = 'Define o atributo padr�o FAQ para classificar o FAQ em uma pesquisa FAQ da interface p�blica.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} = 'Define o atributo padr�o FAQ para classificar o FAQ no Gerenciador FAQ da interface do atendente';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} = 'Define o atributo padr�o FAQ para classificar o FAQ no Gerenciador FAQ da interface do cliente';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} = 'Define o atributo padr�o FAQ para classificar o FAQ no Gerenciador FAQ da interface p�blica';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem padr�o de FAQ no resultado do Gerenciador FAQ da interface do atendente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem padr�o de FAQ no resultado do Gerenciador FAQ da interface do cliente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem padr�o de FAQ no resultado do Gerenciador FAQ da interface p�blica. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem padr�o de FAQ no resultado da pesquisa na interface do atendente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem padr�o de FAQ no resultado da pesquisa na interface do cliente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem padr�o de FAQ no resultado da pesquisa na interface p�blica. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} = 'Define as colunas mostradas no Gerenciador FAQ. Esta op��o n�o tem efeito sobre a posi��o da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} = 'Define as colunas mostradas no jornal FAQ. Esta op��o n�o tem efeito sobre a posi��o da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} = 'Define as colunas mostradas na pesquisa FAQ. Esta op��o n�o tem efeito sobre a posi��o da coluna.';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed. Note: AgentTicketActionCommon includes AgentTicketNote, AgentTicketClose, AgentTicketFreeText, AgentTicketOwner, AgentTicketPending, AgentTicketPriority and AgentTicketResponsible.'} = 'Define onde o link \'Inserir FAQ\' ser� exibido. Nota: Os Recurso comum do Atendente inclui Abrir Chamado, Fechar Chamado, Chamado de Texto Livre, Chamado do propriet�rio, Chamado pendente, Chamado priorit�rio e Respons�vel pelo Chamado.';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'Defini��o de campos de texto livre.';
    $Self->{Translation}->{'Delete this FAQ'} = 'Excluir este FAQ!';
    $Self->{Translation}->{'Edit this FAQ'} = 'Editar este FAQ';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = 'Permitir v�rios idiomas no m�dulo FAQ.';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = 'Permitir mecanismo de Avalia��o no m�dulo FAQ.';
    $Self->{Translation}->{'FAQ Journal'} = 'Jornal FAQ';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = 'Limite da Vis�o Geral "Pequeno" do Jornal FAQ';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = 'Limite da Vis�o Geral FAQ "Pequeno"';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = 'Limite de FAQs por p�gina da Vis�o Geral "Pequeno" do Jornal FAQ';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = 'Limite de FAQs por p�gina da Vis�o Geral "Pequeno" de FAQ';
    $Self->{Translation}->{'FAQ path separator.'} = 'Delimitador de caminho FAQ.';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = 'FAQ busca servidor roteador da interface do atendente.';
    $Self->{Translation}->{'FAQ-Area'} = '�rea FAQ';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'Frontend de registo do m�dulo para a interface p�blica.';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'Grupo para a aprova��o dos artigos FAQ.';
    $Self->{Translation}->{'History of this FAQ'} = 'Hist�rico deste FAQ';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = 'Incluir campos internos de um Chamado base FAQ.';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = 'Incluir o nome de cada campo em um Chamado base FAQ.';
    $Self->{Translation}->{'Interfaces where the quicksearch should be shown.'} = 'Interfaces onde a busca r�pida deve ser demonstrada.';
    $Self->{Translation}->{'Journal'} = 'Jornal';
    $Self->{Translation}->{'Language Management'} = 'Gest�o de idiomas';
    $Self->{Translation}->{'Languagekey which is defined in the language file *_FAQ.pm.'} = 'Idioma chave que est� definido no arquivo de idioma *_FAQ.pm.';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'Link de outro artigo para este item FAQ';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} = 'O n�mero m�ximo de artigos FAQ para ser exibido no resultado do Gerenciador FAQ da interface do atendente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} = 'O n�mero m�ximo de artigos FAQ para ser exibido no resultado do Gerenciador FAQ da interface do cliente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} = 'O n�mero m�ximo de artigos FAQ para ser exibido no resultado do Gerenciador FAQ da interface p�blica.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} = 'O n�mero m�ximo de artigos FAQ para ser exibido no jornal FAQ da interface do atendente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} = 'O n�mero m�ximo de artigos FAQ para ser exibido no resultado de uma pesquisa na interface do atendente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} = 'O n�mero m�ximo de artigos FAQ para ser exibido no resultado de uma pesquisa na interface do cliente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} = 'O n�mero m�ximo de artigos FAQ para ser exibido no resultado de uma pesquisa na interface publica.';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short faq search.'} = 'M�dulo para gerar html "OpenSearch" perfil de pesquisa faq curta.';
    $Self->{Translation}->{'New FAQ Article'} = 'Novo artigo FAQ';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'Novos artigos FAQ precisam de aprova��o antes de ser publicados.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} = 'N�mero de artigos FAQ para ser exibido no Gerenciador FAQ do interface do cliente';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} = 'N�mero de artigos FAQ para ser exibido no Gerenciador FAQ do interface publica';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} = 'N�mero de artigos FAQ para ser exibido em cada p�gina de um resultado de pesquisa na interface do cliente';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} = 'N�mero de artigos FAQ para ser exibido em cada p�gina de um resultado de pesquisa na interface publica';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'N�mero de itens mostrados em �ltimas altera��es.';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'N�mero de itens mostrados em �ltimas cria��es.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'N�mero de itens mostrados no recurso top 10.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} = 'Par�metros de p�ginas (nas quais os itens FAQ s�o mostrados) da vis�o geral pequena do jornal FAQ.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} = 'Par�metros de p�ginas (nas quais os itens FAQ s�o mostrados) da vis�o geral pequena de FAQ.';
    $Self->{Translation}->{'Print this FAQ'} = 'Imprimir este FAQ';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'Fila para a aprova��o dos artigos FAQ.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = 'Condi��o para a avalia��o. Chave deve ser em percentual.';
    $Self->{Translation}->{'Search FAQ'} = 'Pesquisa FAQ';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = 'Mostra bot�o "Inserir Link FAQ" em Amplia��o pequena para o artigos FAQ p�blicos';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = 'Mostra bot�o "Inserir texto e Link FAQ" em Amplia��o pequena para o artigos FAQ p�blicos';
    $Self->{Translation}->{'Show "Insert FAQ Text" Button in AgentFAQZoomSmall.'} = 'Mostrar bot�o "Inserir FAQ Texto" com pequena amplia��o para o atendente.';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'Mostrar artigo FAQ com HTML.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'Mostrar caminho FAQ sim / n�o.';
    $Self->{Translation}->{'Show WYSIWYG editor in agent interface.'} = 'Mostrar editor WYSIWYG na interface do atendente.';
    $Self->{Translation}->{'Show items of subcategories.'} = 'Mostrar itens de subcategorias.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'Mostrar as �ltimas altera��es de itens em interfaces definidas.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'Mostrar os �ltimos itens criados em interfaces definidas.';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'Mostrar os 10 itens superior em interfaces definidas.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'Mostrar vota��o em interfaces definidas.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} = 'Mostra um link no menu que permite ligar um FAQ com outro objeto no modo de exibi��o ampliada na interface do atendente.';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} = 'Mostra um link no menu que permite excluir um FAQ no modo de exibi��o ampliada na interface do atendente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} = 'Mostra um link no menu para acessar o hist�rico de um FAQ no modo de exibi��o ampliada na interface do atendente.';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} = 'Mostra um link no menu para editar um FAQ no modo de exibi��o ampliada na interface do atendente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} = 'Mostra um link no menu para voltar um FAQ no modo de exibi��o ampliada na interface do atendente.';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} = 'Mostra um link no menu para imprimir um FAQ no modo de exibi��o ampliada na interface do atendente.';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} = 'O identificador para um FAQ, exemplo FAQ # KB # # MyFAQ. O padr�o � FAQ #.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} = 'Essa configura��o define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'FAQ\' usando o tipo de v�nculo \'Normal\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} = 'Essa configura��o define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'FAQ\' usando o tipo de v�nculo \'Pai e filho\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} = 'Essa configura��o define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'Chamado\' usando o tipo de v�nculo \'Normal\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} = 'Essa configura��o define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'Chamado\' usando o tipo de v�nculo \'Pai e filho\'';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'Corpo do chamado para aprova��o de um artigo FAQ.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'O assunto do chamado para aprova��o de um artigo FAQ.';

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
