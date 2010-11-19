# --
# Kernel/Language/es_FAQ.pm - the spanish translation of FAQ
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Aquiles Cohen
# --
# $Id: es_FAQ.pm,v 1.13 2010/11/19 10:34:46 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.
# --

package Kernel::Language::es_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.13 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'You have already voted!'}           = 'Usted ya ha votado!';
    $Lang->{'No rate selected!'}                 = 'No selecciono puntaje!';
    $Lang->{'Thanks for your vote!'}             = 'Gracias por su voto!';
    $Lang->{'Votes'}                             = 'Votos';
    $Lang->{'LatestChangedItems'}                = 'ultimo articulo modificado';
    $Lang->{'LatestCreatedItems'}                = 'ultimos articulo creado';
    $Lang->{'Top10Items'}                        = 'Top 10 articulos';
    $Lang->{'ArticleVotingQuestion'}             = 'Lo ayudo este articulo?';
    $Lang->{'SubCategoryOf'}                     = 'Sub Categoria de';
    $Lang->{'QuickSearch'}                       = 'Busqueda r�pida';
    $Lang->{'DetailSearch'}                      = 'Busqueda detallada';
    $Lang->{'Categories'}                        = 'Categorias';
    $Lang->{'SubCategories'}                     = 'Subcategorias';
    $Lang->{'New FAQ Article'}                   = '';
    $Lang->{'FAQ Category'}                      = '';
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
    $Lang->{'internal'}                          = '';
    $Lang->{'external'}                          = '';
    $Lang->{'public'}                            = '';
    $Lang->{
        'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'
        }
        = 'No se puede acceder a ninguna categor�a. Para crear un articulo usted debe tener acceso a m�nimo una categor�a. Por favor revise sus permisos de grupo/categor�a en el -men� categor�a-!';
    $Lang->{'Agent groups which can access this category.'}
        = 'Los grupos agentes pueden acceder a esta categor�a';
    $Lang->{'A category needs at least one permission group!'}
        = 'Una categoria necesita minimo un permiso de grupo!';
    $Lang->{'Will be shown as comment in Explorer.'} = 'Seran mostrados como comentarios en Explorer.';

    return 1;
}

1;
