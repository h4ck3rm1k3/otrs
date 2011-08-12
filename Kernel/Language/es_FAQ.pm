# --
# Kernel/Language/es_FAQ.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: es_FAQ.pm,v 1.30 2011/08/12 21:48:22 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_FAQ;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAFAQ
    $Self->{Translation}->{'internal'} = 'interno';
    $Self->{Translation}->{'public'} = 'p�blico';
    $Self->{Translation}->{'external'} = 'externo';
    $Self->{Translation}->{'FAQ Number'} = 'N�mero de FAQ';
    $Self->{Translation}->{'Latest updated FAQ articles'} = 'Ultimos art�culos modificados';
    $Self->{Translation}->{'Latest created FAQ articles'} = 'Ultimos art�culos creados';
    $Self->{Translation}->{'Top 10 FAQ articles'} = 'Top 10 de art�culos';
    $Self->{Translation}->{'Subcategory of'} = 'Sub Categoria de';
    $Self->{Translation}->{'No rate selected!'} = 'No selecciono puntaje!';
    $Self->{Translation}->{'public (all)'} = 'p�blico (todos)';
    $Self->{Translation}->{'external (customer)'} = 'externo (cliente)';
    $Self->{Translation}->{'internal (agent)'} = 'interno (agente)';
    $Self->{Translation}->{'Start day'} = 'Start day';
    $Self->{Translation}->{'Start month'} = 'Start month';
    $Self->{Translation}->{'Start year'} = 'Start year';
    $Self->{Translation}->{'End day'} = 'End day';
    $Self->{Translation}->{'End month'} = 'End month';
    $Self->{Translation}->{'End year'} = 'End year';
    $Self->{Translation}->{'Thanks for your vote!'} = 'Gracias por su voto!';
    $Self->{Translation}->{'You have already voted!'} = 'Usted ya ha votado!';
    $Self->{Translation}->{'FAQ Article Print'} = 'Imprimir Art�culo FAQ';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'Noticias FAQ (Top 10)';
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'Noticias FAQ (creado nuevo)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'Noticias FAQ (Recientemente modificado)';
    $Self->{Translation}->{'FAQ category updated!'} = 'Categor�a de FAQ actualizada';
    $Self->{Translation}->{'FAQ category added!'} = 'Categor�a de FAQ agregada';
    $Self->{Translation}->{'A category should have a name!'} = 'Una categor�a debe tener un nombre!';
    $Self->{Translation}->{'This category already exists'} = '';
    $Self->{Translation}->{'FAQ language added!'} = 'Idioma de FAQ agregado';
    $Self->{Translation}->{'FAQ language updated!'} = 'Idioma de FAQ actualizado!';
    $Self->{Translation}->{'The name is required!'} = 'El nombre es requerido';
    $Self->{Translation}->{'This language already exists!'} = 'Este idioma ya existe!';

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'Agregar Art�culo FAQ.';
    $Self->{Translation}->{'A category is required.'} = 'La categor�a es requerida.';
    $Self->{Translation}->{'Approval'} = 'Aprovaci�n';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'Administraci�n de Categor�as de FAQ';
    $Self->{Translation}->{'Add category'} = 'Agregar categor�a';
    $Self->{Translation}->{'Delete Category'} = 'Borrar Categor�a';
    $Self->{Translation}->{'Ok'} = 'Aceptar';
    $Self->{Translation}->{'Add Category'} = 'Agregar Categor�a';
    $Self->{Translation}->{'Edit Category'} = 'Editar Categor�a';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Seran mostrados como comentarios en el explorador.';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'Por favor seleccione al menos un grupo de permisos';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'Grupos de agentes que pueden acceder a los art�culos de esta categor�a';
    $Self->{Translation}->{'Do you really want to delete this category?'} = '�Est� seguro de querer borrar esta categor�a?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} = 'No puede borrar esta categor�a. Est� siendo usada por al menos un art�culo FAQ y/o es padre de al menos otra categor�a';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'Esta categor�a esta siendo usada por los siguientes art�culos FAQ';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'Esta categor�a es padre de las siguientes SubCategor�as';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = '�Est� seguro de querer borrar este art�culo FAQ?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'Explorador FAQ';
    $Self->{Translation}->{'Quick Search'} = 'B�squeda R�pida';
    $Self->{Translation}->{'Advanced Search'} = 'B�squeda Avanzada';
    $Self->{Translation}->{'Subcategories'} = 'Subcategor�as';
    $Self->{Translation}->{'FAQ Articles'} = 'Art�culos FAQ';
    $Self->{Translation}->{'No subcategories found.'} = 'No se encontraron subcategor�as.';

    # Template: AgentFAQHistory

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'No se encontraron datos en la Bit�cora FAQ';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'Administraci�n de Idiomas de FAQ';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languges.'} = 'Utilice esta funcionalidad si desea trabajar con m�ltiples idiomas.';
    $Self->{Translation}->{'Add language'} = 'Agregar idioma';
    $Self->{Translation}->{'Delete Language'} = 'Borrar Idioma';
    $Self->{Translation}->{'Add Language'} = 'Agregar Idioma';
    $Self->{Translation}->{'Edit Language'} = 'Editar Idioma';
    $Self->{Translation}->{'Do you really want to delete this language?'} = '�Est� seguro de querer borrar este idioma?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} = 'No puede borrar este idioma. Est� siendo usado por al menos un art�culo FAQ';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'Este idioma esta siendo usado por los siguientes Art�culos FAQ';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Configuraciones del Contexto';
    $Self->{Translation}->{'FAQ articles per page'} = 'Art�culos FAQ por p�gina';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'No se encontraron registros FAQ.';

    # Template: AgentFAQPrint
    $Self->{Translation}->{'FAQ-Info'} = 'Informaci�n-FAQ';
    $Self->{Translation}->{'Votes'} = 'Votos';

    # Template: AgentFAQSearch

    # Template: AgentFAQSearchOpenSearchDescriptionFAQNumber

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'Texto Completo FAQ';

    # Template: AgentFAQSearchResultPrint

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'B�squeda FAQ';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'Informaci�n del Art�culo FAQ';
    $Self->{Translation}->{'Rating'} = 'Valoraci�n';
    $Self->{Translation}->{'Rating %'} = 'Valoracion %';
    $Self->{Translation}->{'out of 5'} = 'de 5';
    $Self->{Translation}->{'No votes found!'} = 'No se encontraron votos!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'No se encontraron votos! Sea el primero en valorar este art�culo FAQ';
    $Self->{Translation}->{'Download Attachment'} = 'Descargar Adjunto';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} = '�Qu� tan �til fue este art�culo? Por favor, d�nos su valoraci�n y ayude a mejorar la base de datos de FAQ. Gracias.';
    $Self->{Translation}->{'not helpful'} = 'poco �til';
    $Self->{Translation}->{'very helpful'} = 'muy �til';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Insert FAQ Text'} = 'Insertar Texto del FAQ';
    $Self->{Translation}->{'Insert FAQ Link'} = 'Insertar V�nculo al FAQ';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'Insertar Texto y V�nculo al FAQ';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'No se encontraron art�culos FAQ';

    # Template: CustomerFAQPrint

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'B�squeda de texto completo en art�culos FAQ (ej: "John*n" o "Will*")';

    # Template: CustomerFAQSearchOpenSearchDescription

    # Template: CustomerFAQSearchResultPrint

    # Template: CustomerFAQSearchResultShort

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Details'} = 'Detalles';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Buscar art�culos con la palabra clave';

    # Template: PublicFAQExplorer

    # Template: PublicFAQPrint

    # Template: PublicFAQSearch

    # Template: PublicFAQSearchOpenSearchDescription
    $Self->{Translation}->{'Public'} = 'P�blico';

    # Template: PublicFAQSearchResultPrint

    # Template: PublicFAQSearchResultShort

    # Template: PublicFAQZoom

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} = 'Filtro para el HTML resultante para agregar v�nculos a una cadena determinada. El elemento Imagen contempla dos tipos de registros. El primero es el nombre de una imagen (por ejemplo faq.png). En este caso se utilizar� la ruta de im�genes de OTRS. El segundo es un v�nculo a una imagen externa.';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'Color CSS para el resultado de la votaci�n.';
    $Self->{Translation}->{'Category Management'} = 'Administraci�n de Categor�as';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'N�mero de decimales para el resultado de la votaci�n';
    $Self->{Translation}->{'Default category name.'} = 'Nombre de categor�a por omisi�n';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = 'Idioma por omisi�n para los art�culos FAQ en modo idioma simple';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} = 'Prioridad por omisi�n de los tickets para aprobaci�n de los art�culos FAQ.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Estado por omisi�n para los art�culos FAQ.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'Estado por omisi�n de los tickets para aprobaci�n de los art�culos FAQ.';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} = 'Valor por omisi�n para el par�metro "Action" para el "fronend" p�blico. El par�metro "Action" es usado do en los "scripts" del sistema.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} = 'Define un m�dulo de tipo resumen para mostrar la vista corta de la bit�cora de FAQ';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} = 'Define un m�dulo tipo resumen para mostrar la vista corta de un listado de FAQs';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} = 'Define el atributo por omisi�n para ordenar los art�culos FAQ en una b�sqeda de FAQ en la interface del agente.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} = 'Define el atributo por omisi�n para ordenar los art�culos FAQ en una b�sqeda de FAQ en la interface del cliente.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} = 'Define el atributo por omisi�n para ordenar los art�culos FAQ en una b�sqeda de FAQ en la interface p�blica.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} = 'Define el sentido del orden por omisi�n en el resultado de una b�squeda en la interface del agente. Arriba: los m�s antiguos en la parte superior. Abajo: los �ltimos en la parte superior.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} = 'Define el sentido del orden por omisi�n en el resultado de una b�squeda en la interface del cliente. Arriba: los m�s antiguos en la parte superior. Abajo: los �ltimos en la parte superior.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} = 'Define el sentido del orden por omisi�n en el resultado de una b�squeda en la interface p�blica. Arriba: los m�s antiguos en la parte superior. Abajo: los �ltimos en la parte superior.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} = 'Define las columnas que se mostrar�n en el Explorador FAQ. Esta opci�n no tiene efectos en la posici�n de las columnas.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} = 'Define las columnas que se mostrar�n en la bit�cora de FAQ. Esta opci�n no tiene efectos en la posici�n de las columnas.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} = 'Define las columnas que se mostrar�n en la b�squeda FAQ. Esta opci�n no tiene efectos en la posici�n de las columnas.';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed. Note: AgentTicketActionCommon includes AgentTicketNote, AgentTicketClose, AgentTicketFreeText, AgentTicketOwner, AgentTicketPending, AgentTicketPriority and AgentTicketResponsible.'} = 'Define d�nde se mostrar� el v�nculo \'Insertar FAQ\'. Nota: AgentTicketActionCommon incluye AgentTicketNote, AgentTicketClose, AgentTicketFreeText, AgentTicketOwner, AgentTicketPending, AgentTicketPriority y AgentTicketResponsible.';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'Definici�n del campo "free text" para los art�culos FAQ.';
    $Self->{Translation}->{'Delete this FAQ'} = 'Borrar este art�culo FAQ';
    $Self->{Translation}->{'Edit this FAQ'} = 'Editar este art�culo FAQ';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = 'Habilitar m�ltiples idiomas en el m�dulo FAQ';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = 'Habilitar el mecanismo de valoraci�n en el m�dulo FAQ';
    $Self->{Translation}->{'FAQ Journal'} = 'Bit�cora de FAQ';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = 'L�mite para la vista tipo resumen "Corto" de la Bit�cora de FAQ';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = 'L�mite para la vista tipo resumen "Corto" de FAQ';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = 'L�mite por p�gina para la vista tipo resumen "Corto" de la Bit�cora de FAQ';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = 'L�mite por p�gina para la vista tipo resumen "Corto" de FAQ';
    $Self->{Translation}->{'FAQ path separator.'} = 'Separador de la ruta de FAQ.';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = 'Enrutador para la b�squeda de FAQ en la interface del agente.';
    $Self->{Translation}->{'FAQ-Area'} = '�rea-FAQ';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'Registro de m�dulo "Frontend" en la interface p�blica.';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'Grupo para la aprobaci�n de los art�culos FAQ.';
    $Self->{Translation}->{'History of this FAQ'} = 'Historia de este art�culo FAQ';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = 'Incluir campos internos en los tickets basados en un art�culo FAQ';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = 'Incluir el nombre de cada campo en los tickets basados en un art�culo FAQ';
    $Self->{Translation}->{'Interfaces where the quicksearch should be shown.'} = 'Interfaces donde la Busqueda R�pida debe ser mostrada.';
    $Self->{Translation}->{'Journal'} = 'Bit�cora';
    $Self->{Translation}->{'Language Management'} = 'Administraci�n de Idiomas';
    $Self->{Translation}->{'Languagekey which is defined in the language file *_FAQ.pm.'} = 'La clave se encuentra definida en el archivo de idioma *_FAQ.pm.';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'Vincular otro objecto a este art�culo FAQ';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} = 'N�mero m�ximo de art�culos FAQ a ser mostrados en la bit�cora de FAQ en la interface del agente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} = 'N�mero m�ximo de art�culos FAQ a ser mostrados como resultado de una b�squeda en la interface del agente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} = 'N�mero m�ximo de art�culos FAQ a ser mostrados como resultado de una b�squeda en la interface del cliente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} = 'N�mero m�ximo de art�culos FAQ a ser mostrados como resultado de una b�squeda en la interface p�blica.';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short faq search.'} = 'M�dulo para generar el perfil html "OpenSearch" para b�squedas cortas de FAQ.';
    $Self->{Translation}->{'New FAQ Article'} = 'Nuevo FAQ';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = '�Los nuevos art�culos FAQ requieren aprobaci�n antes de ser publicados?';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} = '';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'N�mero de �ltimos art�culos actualizados que se mostrar�n.';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'N�mero de �ltimos art�culos creados que se mostrar�n.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'N�mero de art�culos que se mostrar�n en el Top 10.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} = 'Par�metros de las p�ginas (donde se muestran los art�culos FAQ) de la vista tipo resumen corto de la bit�cora de FAQ.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} = 'Par�metros de las p�ginas (donde se muestran los art�culos FAQ) de la vista tipo resumen corto.';
    $Self->{Translation}->{'Print this FAQ'} = 'Imprimir este art�culo FAQ';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'Fila para la aprobaci�n de los art�culos FAQ.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = 'Rangos para la votaci�n. La llave debe estar expresada en porcentajes.';
    $Self->{Translation}->{'Search FAQ'} = 'B�squeda FAQ';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert FAQ Text" Button in AgentFAQZoomSmall.'} = '';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = '�Mostrar contenido HTML en los art�culos FAQ?.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = '�Mostrar la ruta del FAQ? si/no.';
    $Self->{Translation}->{'Show WYSIWYG editor in agent interface.'} = 'Mostrar el editor WYSIWYG en la interface del agente.';
    $Self->{Translation}->{'Show items of subcategories.'} = '�Mostrar los art�culos de las subcategor�as? si/no.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'Mostrar los �ltimos art�culos actualizados en las interfaces definidas.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'Mostrar los �ltimos art�culos creados en las interfaces definidas.';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'Mostrar art�culos Top 10 en las interfaces definidas.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'Mostrar la votaci�n en las interfaces definidas.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} = 'Muestra un v�nculo en el men� que permite v�nculor un art�culo FAQ con otros objetos en su vista de detalles en la interface del agente.';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} = 'Muestra un v�nculo en el men� que permite borrar un art�culo FAQ en su vista de detalles en la interface del agente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} = 'Muestra un v�nculo en el men� para acceder al historial de un art�culo FAQ en su vista de detalles en la interface del agente.';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} = 'Muestra un v�nculo en el men� para editar un art�culo FAQ en su vista de detalles en la interface del agente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} = 'Muestra un v�nculo en el men� para ir hacia atras en la vista de detalles de FAQ en la interface del agente.';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} = 'Muestra un v�nculo en el men� para imprimir un art�culo FAQ en su vista de detalles en la interface del agente.';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} = 'El identificador para un FAQ, por ejemplo FAQ#, KB#, MiFAQ#. FAQ# es la opci�n por omisi�n';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} = 'Este ajuste define que un objeto \'FAQ\' puede vincularse con otros objetos \'FAQ\' utilizando el tipo de v�nculo \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} = 'Este ajuste define que un objeto \'FAQ\' puede vincularse con otros objetos \'FAQ\' utilizando el tipo de v�nculo \'ParentChild\'.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} = 'Este ajuste define que un objeto \'FAQ\' puede vincularse con otros objetos \'Ticket\' utilizando el tipo de v�nculo \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} = 'Este ajuste define que un objeto \'FAQ\' puede vincularse con otros objetos \'Ticket\' utilizando el tipo de v�nculo \'ParentChild\'.';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'Cuepo del Ticket para aprobaci�n de art�culos FAQ.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'Asunto del Ticket para aprobaci�n de art�culos FAQ.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'A category needs at least one permission group!'} = 'Una categor�a debe tener al menos un grupo de permisos';
    $Self->{Translation}->{'A category should have a comment!'} = 'Una categor�a debe tener un comentario!';
    $Self->{Translation}->{'Agent groups which can access this category.'} = 'Los grupos agentes pueden acceder a esta categor�a';
    $Self->{Translation}->{'Articles'} = 'Art�culos';
    $Self->{Translation}->{'Categories'} = 'Categorias';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ Explorer of the agent interface.'} = 'Define el atributo por omisi�n para ordenar los art�culos FAQ en el Explorador FAQ en la interface del agente.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the explorer in the customer interface.'} = 'Define el atributo por omisi�n para ordenar los art�culos FAQ en el Explorador FAQ en la interface del cliente.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the explorer in the public interface.'} = 'Define el atributo por omisi�n para ordenar los art�culos FAQ en el Explorador FAQ en la interface p�blica.';
    $Self->{Translation}->{'Defines the default FAQ order in the explorer in the customer interface. Up: oldest on top. Down: latest on top.'} = 'Define el sentido del orden por omisi�n en el resultado del Explorador FAQ en la interface del cliente. Arriba: los m�s antiguos en la parte superior. Abajo: los �ltimos en la parte superior.';
    $Self->{Translation}->{'Defines the default FAQ order in the explorer in the public interface. Up: oldest on top. Down: latest on top.'} = 'Define el sentido del orden por omisi�n en el resultado del Explorador FAQ en la interface p�blica. Arriba: los m�s antiguos en la parte superior. Abajo: los �ltimos en la parte superior.';
    $Self->{Translation}->{'Defines the default FAQ order of a Explorer result in the agent interface. Up: oldest on top. Down: latest on top.'} = 'Define el sentido del orden por omisi�n en el resultado del Explorador FAQ en la interface del agente. Arriba: los m�s antiguos en la parte superior. Abajo: los �ltimos en la parte superior.';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed.'} = 'Define d�nde es que la liga \'Insertar FAQ\' ser� desplegada.';
    $Self->{Translation}->{'Delete: '} = 'Borrar: ';
    $Self->{Translation}->{'DetailSearch'} = 'Busqueda detallada';
    $Self->{Translation}->{'Do you really want to delete this Category?'} = '�Est� seguro de querer borrar esta Categor�a?';
    $Self->{Translation}->{'Do you really want to delete this Language?'} = '�Est� seguro de querer borrar este Idioma?';
    $Self->{Translation}->{'FAQ Category'} = 'Categor�a de FAQ';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the explorer in the customer interface.'} = 'N�mero m�ximo de art�culos FAQ a ser mostrados dentro del explorador en la interface del cliente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the explorer in the public interface.'} = 'N�mero m�ximo de art�culos FAQ a ser mostrados dentro del explorador en la interface p�blica.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a Explorer in the agent interface.'} = 'N�mero m�ximo de art�culos FAQ a ser mostrados como resultado del Explorador FAQ en la interface del agente.';
    $Self->{Translation}->{'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'} = 'No se puede acceder a ninguna categor�a. Para crear un articulo usted debe tener acceso a m�nimo una categor�a. Por favor revise sus permisos de grupo/categor�a en el -men� categor�a-!';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in each page of a search result in the customer interface.'} = 'N�mero de art�culos FAQ a ser mostrados por cada p�gina como resultado de una b�squeda en la interface del cliente.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in each page of a search result in the public interface.'} = 'N�mero de art�culos FAQ a ser mostrados por cada p�gina como resultado de una b�squeda en la interface p�blica.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the explorer in the customer interface.'} = 'N�mero de art�culos FAQ a ser mostrados dentro del explorador en la interface del cliente.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the explorer in the public interface.'} = 'N�mero de art�culos FAQ a ser mostrados dentro del explorador en la interface p�blica.';
    $Self->{Translation}->{'QuickSearch'} = 'Busqueda r�pida';
    $Self->{Translation}->{'Show "Insert Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = 'Mostrar el Bot�n "Insertar V�nculo" en AgentFAQZoomSmall para art�culos FAQ p�blicos';
    $Self->{Translation}->{'Show "Insert Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = 'Mostrar el Bot�n "Insertar Texto & V�nculo" en AgentFAQZoomSmall para art�culos FAQ p�blicos';
    $Self->{Translation}->{'Show "Insert Text" Button in AgentFAQZoomSmall.'} = 'Mostrar el Bot�n "Insertar Texto" en AgentFAQZoomSmall para art�culos FAQ p�blicos';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface'} = 'Muestra un liga en el men� para acceder al historial de un art�culo FAQ en su vista de detalles en la interface del agente.';
    $Self->{Translation}->{'SubCategories'} = 'Subcategorias';
    $Self->{Translation}->{'The title is required.'} = 'El t�tulo es requerido.';
    $Self->{Translation}->{'This Category is parent of the following SubCategories'} = 'Esta Categor�a es padre de las siguientes SubCategor�as';
    $Self->{Translation}->{'This Category is used in the following FAQ Artice(s)'} = 'Esta Categor�a esta siendo usada por los siguientes Art�culos FAQ';
    $Self->{Translation}->{'This Language is used in the following FAQ Article(s)'} = 'Este Idioma esta siendo usado por los siguientes Art�culos FAQ';
    $Self->{Translation}->{'This category already exists!'} = 'Esta categor�a ya existe';
    $Self->{Translation}->{'Updated'} = 'Actualizado';
    $Self->{Translation}->{'You can not delete this Category. It is used in at least one FAQ Article! and/or is parent of at least another Category'} = 'No puede borrar esta Categor�a. Est� siendo usada por al menos un Art�culo FAQ y/o es padre de al menos otra Categor�a';
    $Self->{Translation}->{'You can not delete this Language. It is used in at least one FAQ Article!'} = 'No puede borrar este Idioma. Est� siendo usado por al menos un Art�culo FAQ';

}

1;
