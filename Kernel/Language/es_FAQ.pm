# --
# Kernel/Language/es_FAQ.pm - the spanish translation of FAQ
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Aquiles Cohen
# --
# $Id: es_FAQ.pm,v 1.1 2008/08/20 12:02:54 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::es_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'You have already voted!'}                      = 'Usted ya ha votado!';
    $Lang->{'No rate selected!'}                            = 'No selecciono puntaje!';
    $Lang->{'Thanks for vote!'}                             = 'Gracias por su voto!';
    $Lang->{'Votes'}                                        = 'Votos';
    $Lang->{'LatestChangedItems'}                           = 'ultimo articulo modificado';
    $Lang->{'LatestCreatedItems'}                           = 'ultimos articulo creado';
    $Lang->{'ArticleVotingQuestion'}                        = 'Lo ayudo este articulo?';
    $Lang->{'SubCategoryOf'}                                = '';
    $Lang->{'QuickSearch'}                                  = 'Busqueda r�pida';
    $Lang->{'DetailSearch'}                                 = 'Busqueda detallada';
    $Lang->{'Categories'}                                   = 'Categorias';
    $Lang->{'SubCategories'}                                = 'Subcategorias';
    $Lang->{'A category should have a name!'}               = '';
    $Lang->{'A category should have a comment!'}            = '';
    $Lang->{'FAQ News (new created)'}                       = '';
    $Lang->{'FAQ News (recently changed)'}                  = '';
    $Lang->{'No category accesable. To create an article you need have at lease access to min. one category. Please check your group/category permission under -category menu-!'} = '';
    $Lang->{'Agent Groups which can access this category.'} = '';
    $Lang->{'A category need min. one permission group!'}   = '';
    $Lang->{'Will be shown as comment in Explore.'}         = '';

    return 1;
}

1;
