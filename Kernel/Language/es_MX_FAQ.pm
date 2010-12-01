# --
# Kernel/Language/es_MX_FAQ.pm - the spanish (Mexico) translation of FAQ
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Aquiles Cohen
# --
# $Id: es_MX_FAQ.pm,v 1.9 2010/12/01 18:07:45 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.
# --

package Kernel::Language::es_MX_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.9 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'You have already voted!'}           = 'Usted ya ha votado!';
    $Lang->{'No rate selected!'}                 = 'No selecciono puntaje!';
    $Lang->{'Thanks for your vote!'}             = 'Gracias por su voto!';
    $Lang->{'Votes'}                             = 'Votos';
    $Lang->{'LatestChangedItems'}                = 'Ultimos art�culos modificados';
    $Lang->{'LatestCreatedItems'}                = 'Ultimos art�culos creados';
    $Lang->{'Top10Items'}                        = 'Top 10 art�culos';
    $Lang->{'ArticleVotingQuestion'}             = '�Qu� tan �til fue este art�culo? Por favor, d�nos su valoraci�n y ayude a mejorar la base de datos de FAQ. Gracias.';
    $Lang->{'SubCategoryOf'}                     = 'Sub Categoria de';
    $Lang->{'QuickSearch'}                       = 'Busqueda r�pida';
    $Lang->{'DetailSearch'}                      = 'Busqueda detallada';
    $Lang->{'Categories'}                        = 'Categorias';
    $Lang->{'SubCategories'}                     = 'Subcategorias';
    $Lang->{'New FAQ Article'}                   = 'Nuevo FAQ';
    $Lang->{'FAQ Category'}                      = 'Categor�a de FAQ';
    $Lang->{'A category should have a name!'}    = 'Cada categor�a debe tener un nombre!';
    $Lang->{'A category should have a comment!'} = 'Cada categoria debe tener un comentario';
    $Lang->{'FAQ Articles (new created)'}        = 'Noticias FAQ (creado nuevo)';
    $Lang->{'FAQ Articles (recently changed)'}   = 'Noticias FAQ (Recientemente modificado)';
    $Lang->{'FAQ Articles (Top 10)'}             = 'Noticias FAQ (Top 10)';
    $Lang->{'StartDay'}                          = 'Start day';
    $Lang->{'StartMonth'}                        = 'Start month';
    $Lang->{'StartYear'}                         = 'Start year';
    $Lang->{'EndDay'}                            = 'End day';
    $Lang->{'EndMonth'}                          = 'End month';
    $Lang->{'EndYear'}                           = 'End year';
    $Lang->{'Approval'}                          = 'Approval';
    $Lang->{'internal'}                          = 'interno';
    $Lang->{'external'}                          = 'externo';
    $Lang->{'public'}                            = 'p�blico';
    $Lang->{
        'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'
        }
        = 'No se puede acceder a ninguna categor�a. Para crear un articulo usted debe tener acceso a m�nimo una categor�a. Por favor revise sus permisos de grupo/categor�a en el -men� categor�a-!';
    $Lang->{'Agent groups which can access this category.'}
        = 'Los grupos agentes pueden acceder a esta categor�a';
    $Lang->{'A category needs at least one permission group!'}
        = 'Una categoria necesita minimo un permiso de grupo!';
    $Lang->{'Will be shown as comment in Explorer.'} = 'Seran mostrados como comentarios en Explorer.';

    $Lang->{'Default category name.'}                            = 'Nombre de categor�a por omisi�n';
    $Lang->{'Rates for voting. Key must be in percent.'}         = 'Rangos para la votaci�n. La llave debe estar expresada en porcentajes.';
    $Lang->{'Show voting in defined interfaces.'}                = 'Mostrar la votaci�n en las interfaces definidas.';
    $Lang->{'Languagekey which is defined in the language file *_FAQ.pm.'}
        = 'La clave se encuentra definida en el archivo de idioma *_FAQ.pm.';
    $Lang->{'Show FAQ path yes/no.'}                             = '�Mostrar la ruta del FAQ? si/no.';
    $Lang->{'Decimal places of the voting result.'}              = 'N�mero de decimales para el resultado de la votaci�n';
    $Lang->{'CSS color for the voting result.'}                  = 'Color CSS para el resultado de la votaci�n.';
    $Lang->{'FAQ path separator.'}                               = 'Separador de la ruta del FAQ.';
    $Lang->{'Interfaces where the quicksearch should be shown.'} = 'Interfaces donde la Busqueda R�pida debe ser mostrada.';
    $Lang->{'Show items of subcategories.'}                      = '�Mostrar los art�culos de las subcategor�as? si/no.';
    $Lang->{'Show last change items in defined interfaces.'}     = 'Mostrar los �ltimos art�culos actualizados en las interfaces definidas.';
    $Lang->{'Number of shown items in last changes.'}            = 'N�mero de �ltimos art�culos actualizados que se mostrar�n.';
    $Lang->{'Show last created items in defined interfaces.'}    = 'Mostrar los �ltimos art�culos creados en las interfaces definidas.';
    $Lang->{'Number of shown items in last created.'}            = 'N�mero de �ltimos art�culos creados que se mostrar�n.';
    $Lang->{'Show top 10 items in defined interfaces.'}          = 'Mostrar art�culos Top 10 en las interfaces definidas.';
    $Lang->{'Number of shown items in the top 10 feature.'}      = 'N�mero de art�culos que se mostrar�n en el Top 10.';
    $Lang->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'}
        = 'El identificador para un FAQ, por ejemplo FAQ#, KB#, MiFAQ#. FAQ# es la opci�n por omisi�n';
    $Lang->{'Default state for FAQ entry.'}                      = 'Estado por omisi�n para los art�culos FAQ.';
    $Lang->{'Show WYSIWYG editor in agent interface.'}           = 'Mostrar el editor WYSIWYG en la interface del agente.';
    $Lang->{'New FAQ articles need approval before they get published.'}
        = '�Los nuevos art�culos FAQ requieren aprobaci�n antes de ser publicados?';
    $Lang->{'Group for the approval of FAQ articles.'}           = 'Grupo para la aprobaci�n de los art�culos FAQ.';
    $Lang->{'Queue for the approval of FAQ articles.'}           = 'Fila para la aprobaci�n de los art�culos FAQ.';
    $Lang->{'Ticket subject for approval of FAQ article.'}       = 'Asunto del Ticket para aprobaci�n de art�culos FAQ.';
    $Lang->{'Ticket body for approval of FAQ article.'}          = 'Cuepo del Ticket para aprobaci�n de art�culos FAQ.';
    $Lang->{'Default priority of tickets for the approval of FAQ articles.'}
        = 'Prioridad por omisi�n de los tickets para aprobaci�n de los art�culos FAQ.';
    $Lang->{'Default state of tickets for the approval of FAQ articles.'}
        = 'Estado por omisi�n de los tickets para aprobaci�n de los art�culos FAQ.';
    $Lang->{'Definition of FAQ item free text field.'}           = 'Definici�n del campo "free text" para los art�culos FAQ.';
    $Lang->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'}
        = 'Este ajuste define que un objeto \'FAQ\' puede ligarse con otros objetos \'FAQ\' utilizando el tipo de liga \'Normal\'.';
    $Lang->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'}
        = 'Este ajuste define que un objeto \'FAQ\' puede ligarse con otros objetos \'FAQ\' utilizando el tipo de liga \'ParentChild\'.';
    $Lang->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'}
        = 'Este ajuste define que un objeto \'FAQ\' puede ligarse con otros objetos \'Ticket\' utilizando el tipo de liga \'Normal\'.';
    $Lang->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'}
        = 'Este ajuste define que un objeto \'FAQ\' puede ligarse con otros objetos \'Ticket\' utilizando el tipo de liga \'ParentChild\'.';
    $Lang->{'Frontend module registration for the agent interface.'}    = 'Registro de m�dulo "Frontend" en la interface del agente.';
    $Lang->{'Frontend module registration for the customer interface.'} = 'Registro de m�dulo "Frontend" en la interface del cliente.';
    $Lang->{'Frontend module registration for the public interface.'}   = 'Registro de m�dulo "Frontend" en la interface p�blica.';
    $Lang->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'}
        = 'Valor por omisi�n para el par�metro "Action" para el "fronend" p�blico. El par�metro "Action" es usado do en los "scripts" del sistema.';
    $Lang->{'Show FAQ Article with HTML.'}                              = '�Mostrar contenido HTML en los art�culos FAQ?.';
    $Lang->{'Module to generate html OpenSearch profile for short faq search.'}
        = 'M�dulo para generar el perfil html "OpenSearch" para b�squedas cortas de FAQ.';
    $Lang->{'Defines where the \'Insert FAQ\' link will be displayed.'} = 'Define d�nde es que la liga \'Insertar FAQ\' ser� desplegada.';
    $Lang->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'}
        = 'Filtro para el HTML resultante para agregar ligas a una cadena determinada. El elemento Imagen contempla dos tipos de registros. El primero es el nombre de una imagen (por ejemplo faq.png). En este caso se utilizar� la ruta de im�genes de OTRS. El segundo es una liga a una imagen externa.';
    $Lang->{'FAQ search backend router of the agent interface.'} = 'Enrutador para la b�squeda de FAQ en la interface del agente.';
    $Lang->{'Defines an overview module to show the small view of a FAQ list.'}
        = 'Define un m�dulo tipo resumen para mostrar la vista corta de un listado de FAQs';
    $Lang->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'}
        = 'Define las columnas que se mostrar�n en la b�squeda FAQ. Esta opci�n no tiene efectos en la posici�n de las columnas.';
    $Lang->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'}
        = 'Define el atributo por omisi�n para ordenar los art�culos FAQ en una b�sqeda de FAQ en la interface del agente.';
    $Lang->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'}
        = 'Define el sentido del orden por omisi�n en el resultado de una b�squeda en la interface del agente. Arriba: los m�s antiguos en la parte superior. Abajo: los �ltimos en la parte superior.';
    $Lang->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'}
        = 'N�mero m�ximo de art�culos FAQ a ser mostrados como resultado de una b�squeda en la interface del agente.';
    $Lang->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'}
        = 'Define las columnas que se mostrar�n en el Explorador FAQ. Esta opci�n no tiene efectos en la posici�n de las columnas.';
    $Lang->{'Defines the default FAQ attribute for FAQ sorting in a FAQ Explorer of the agent interface.'}
        = 'Define el atributo por omisi�n para ordenar los art�culos FAQ en el Explorador FAQ en la interface del agente.';
    $Lang->{'Defines the default FAQ order of a Explorer result in the agent interface. Up: oldest on top. Down: latest on top.'}
        = 'Define el sentido del orden por omisi�n en el resultado del Explorador FAQ en la interface del agente. Arriba: los m�s antiguos en la parte superior. Abajo: los �ltimos en la parte superior.';
    $Lang->{'Maximum number of FAQ articles to be displayed in the result of a Explorer in the agent interface.'}
        = 'N�mero m�ximo de art�culos FAQ a ser mostrados como resultado del Explorador FAQ en la interface del agente.';
    $Lang->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'}
        = 'Par�metros de las p�ginas (donde se muestran los art�culos FAQ) de la vista tipo resumen corto.';
    $Lang->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'}
        = 'Muestra un liga en el men� para ir hacia atras en la vista de detalles de FAQ en la interface del agente.';
    $Lang->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'}
        = 'Muestra un liga en el men� para editar un art�culo FAQ en su vista de detalles en la interface del agente.';
    $Lang->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface'}
        = 'Muestra un liga en el men� para acceder al historial de un art�culo FAQ en su vista de detalles en la interface del agente.';
    $Lang->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'}
        = 'Muestra un liga en el men� para imprimir un art�culo FAQ en su vista de detalles en la interface del agente.';
    $Lang->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'}
        = 'Muestra un liga en el men� que permite ligar un art�culo FAQ con otros objetos en su vista de detalles en la interface del agente.';
    $Lang->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'}
        = 'Muestra un liga en el men� que permite borrar un art�culo FAQ en su vista de detalles en la interface del agente.';
    $Lang->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'}
        = 'Define el atributo por omisi�n para ordenar los art�culos FAQ en una b�sqeda de FAQ en la interface del cliente.';
    $Lang->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'}
        = 'Define el sentido del orden por omisi�n en el resultado de una b�squeda en la interface del cliente. Arriba: los m�s antiguos en la parte superior. Abajo: los �ltimos en la parte superior.';
    $Lang->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'}
        = 'N�mero m�ximo de art�culos FAQ a ser mostrados como resultado de una b�squeda en la interface del cliente.';
    $Lang->{'Number of FAQ articles to be displayed in each page of a search result in the customer interface.'}
        = 'N�mero de art�culos FAQ a ser mostrados por cada p�gina como resultado de una b�squeda en la interface del cliente.';
    $Lang->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'}
        = 'Define el atributo por omisi�n para ordenar los art�culos FAQ en una b�sqeda de FAQ en la interface p�blica.';
    $Lang->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'}
        = 'Define el sentido del orden por omisi�n en el resultado de una b�squeda en la interface p�blica. Arriba: los m�s antiguos en la parte superior. Abajo: los �ltimos en la parte superior.';
    $Lang->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'}
        = 'N�mero m�ximo de art�culos FAQ a ser mostrados como resultado de una b�squeda en la interface p�blica.';
    $Lang->{'Number of FAQ articles to be displayed in each page of a search result in the public interface.'}
        = 'N�mero de art�culos FAQ a ser mostrados por cada p�gina como resultado de una b�squeda en la interface p�blica.';
    $Lang->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'}
        = 'Define las columnas que se mostrar�n en la bit�cora de FAQ. Esta opci�n no tiene efectos en la posici�n de las columnas.';
    $Lang->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'}
        = 'N�mero m�ximo de art�culos FAQ a ser mostrados como en la bit�cora de FAQ en la interface del agente.';
    $Lang->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'}
        = 'Par�metros de las p�ginas (donde se muestran los art�culos FAQ) de la vista tipo resumen corto de la bit�cora de FAQ.';
    $Lang->{'Defines an overview module to show the small view of a FAQ journal.'}
        = 'Define un m�dulo de tipo resumen para mostrar la vista corta de la bit�cora de FAQ';

    # template: AgentFAQExplorer
    $Lang->{'FAQ Explorer'}             = 'Explorador FAQ';
    $Lang->{'Subcategories'}            = 'Subcategor�as';
    $Lang->{'Articles'}                 = 'Art�culos';
    $Lang->{'No subcategories found.'}  = 'No se encontraron subcategor�as.';
    $Lang->{'No FAQ data found.'}       = 'No se encontraron registros FAQ.';

    # template: AgentFAQAdd
    $Lang->{'Add FAQ Article'}         = 'Agregar FAQ.';
    $Lang->{'The title is required.'}  = 'El t�tulo es requerido.';
    $Lang->{'A category is required.'} = 'La categor�a es requerida.';

    # template: AgentFAQJournal
    $Lang->{'FAQ Journal'} = 'Bit�cora de FAQ';

    # template: AgentFAQLanguage
    $Lang->{'FAQ Language Management'}                               = 'Administraci�n de Idiomas de FAQ';
    $Lang->{'Add Language'}                                          = 'Agregar Idioma';
    $Lang->{'Add language'}                                          = 'Agregar idioma';
    $Lang->{'Edit Language'}                                         = 'Editar Idioma';
    $Lang->{'Delete Language'}                                       = 'Borrar Idioma';
    $Lang->{'The name is required!'}                                 = 'El nombre es requerido';
    $Lang->{'This language already exists!'}                         = 'Este idioma ya existe!';
    $Lang->{'FAQ language added!'}                                   = 'Idioma de FAQ agregado';
    $Lang->{'FAQ language updated!'}                                 = 'Idioma de FAQ actualizado!';

    $Lang->{'Do you really want to delete this Language?'}           = '�Est� seguro de querer borrar este Idioma?';
    $Lang->{'This Language is used in the following FAQ Article(s)'} = 'Este Idioma esta siendo usado por los siguientes Art�culos FAQ';
    $Lang->{'You can not delete this Language. It is used in at least one FAQ Article!'}
        = 'No puede borrar este Idioma. Est� siendo usado por al menos un Art�culo FAQ';

    # template: AgentFAQCategory
    $Lang->{'FAQ Category Management'}                         = 'Administraci�n de Categor�as de FAQ';
    $Lang->{'Add Category'}                                    = 'Agregar Categor�a';
    $Lang->{'Add category'}                                    = 'Agregar categor�a';
    $Lang->{'Edit Category'}                                   = 'Editar Categor�a';
    $Lang->{'Delete Category'}                                 = 'Borrar Categor�a';
    $Lang->{'A category should have a name!'}                  = 'Una categor�a debe tener un nombre!';
    $Lang->{'A category should have a comment!'}               = 'Una categor�a debe tener un comentario!';
    $Lang->{'A category needs at least one permission group!'} = 'Una categor�a debe tener al menos un grupo de permisos';
    $Lang->{'This category already exists!'}                   = 'Esta categor�a ya existe';
    $Lang->{'FAQ category updated!'}                           = 'Categor�a de FAQ actualizada';
    $Lang->{'FAQ category added!'}                             = 'Categor�a de FAQ agregada';
    $Lang->{'Do you really want to delete this Category?'}     = '�Est� seguro de querer borrar esta Categor�a?';
    $Lang->{'This Category is used in the following FAQ Artice(s)'}
        = 'Esta Categor�a esta siendo usada por los siguientes Art�culos FAQ';
    $Lang->{'This Category is parent of the following SubCategories'}
        = 'Esta Categor�a es padre de las siguientes SubCategor�as';
    $Lang->{'You can not delete this Category. It is used in at least one FAQ Article! and/or is parent of at least another Category'}
        = 'No puede borrar esta Categor�a. Est� siendo usada por al menos un Art�culo FAQ y/o es padre de al menos otra Categor�a';

    # template: AgentFAQZoom
    $Lang->{'FAQ Information'}                      = 'Informaci�n del Art�culo FAQ';
    $Lang->{'Rating'}                               = 'Valoraci�n';
    $Lang->{'No votes found!'}                      = 'No se encontraron votos!';
    $Lang->{'Details'}                              = 'Detalles';
    $Lang->{'Edit this FAQ'}                        = 'Editar este art�culo FAQ';
    $Lang->{'History of this FAQ'}                  = 'Historia de este art�culo FAQ';
    $Lang->{'Print this FAQ'}                       = 'Imprimir este art�culo FAQ';
    $Lang->{'Link another object to this FAQ item'} = 'Vincular otro objecto a este art�culo FAQ';
    $Lang->{'Delete this FAQ'}                      = 'Borrar este art�culo FAQ';
    $Lang->{'not helpful'}                          = 'poco �til';
    $Lang->{'very helpful'}                         = 'muy �til';
    $Lang->{'out of 5'}                             = 'de 5';
    $Lang->{'No votes found! Be the first one to rate this FAQ article.'}
         = 'No se encontraron votos! Sea el primero en valorar este art�culo FAQ';

    # template: AgentFAQHistory
    $Lang->{'History Content'} = 'Historial';
    $Lang->{'Updated'}         = 'Actualizado';

    # template: AgentFAQDelete
    $Lang->{'Do you really want to delete this FAQ article?'} = '�Est� seguro de querer borrar este art�culo FAQ?';

    return 1;
}

1;
