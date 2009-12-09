# --
# Kernel/Language/pt_BR_FAQ.pm - the portuguese brazillian translation of FAQ
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2009 Ronaldo Richieri <richieri@gmail.com>
# --
# $Id: pt_BR_FAQ.pm,v 1.3 2009/12/09 10:24:11 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::pt_BR_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'You have already voted!'}           = 'Voc� j� votou!';
    $Lang->{'No rate selected!'}                 = 'Selecione a pontua��o!';
    $Lang->{'Thanks for your vote!'}             = 'Obrigado por seu Voto';
    $Lang->{'Votes'}                             = 'Votos';
    $Lang->{'LatestChangedItems'}                = 'Artigos modificados recentemente';
    $Lang->{'LatestCreatedItems'}                = '�ltimos artigos adicionados';
    $Lang->{'Top10Items'}                        = 'Os 10 artigos mais acessados';
    $Lang->{'ArticleVotingQuestion'}             = 'Este artigo te ajudou?';
    $Lang->{'SubCategoryOf'}                     = 'Subcategoria de';
    $Lang->{'QuickSearch'}                       = 'Pesquisa';
    $Lang->{'DetailSearch'}                      = 'Pesquisa Avan�ada';
    $Lang->{'Categories'}                        = 'Categorias';
    $Lang->{'SubCategories'}                     = 'Subcategorias';
    $Lang->{'A category should have a name!'}    = 'Uma categoria precisa ter um nome!';
    $Lang->{'A category should have a comment!'} = 'Uma categoria precisa ter um coment�rio!';
    $Lang->{'FAQ Articles (new created)'}        = 'FAQ Articles (rec�m criados)';
    $Lang->{'FAQ Articles (recently changed)'}   = 'FAQ Articles (alterados recentemente)';
    $Lang->{'FAQ Articles (Top 10)'}             = 'FAQ Articles (as 10 mais)';
    $Lang->{'StartDay'}                          = 'Dia de in�cio';
    $Lang->{'StartMonth'}                        = 'M�s de in�cio';
    $Lang->{'StartYear'}                         = 'Ano de in�cio';
    $Lang->{'EndDay'}                            = 'Dia de t�rmino';
    $Lang->{'EndMonth'}                          = 'M?s de t�rmino';
    $Lang->{'EndYear'}                           = 'Ano de t�rmino';
    $Lang->{'Approval'}                          = 'Aprova��o';

    $Lang->{
        'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'
        } = 'Voc� est� sem acesso a nenhuma categoria. Para criar um artigo, voc� precisa ter acesso a pelo menos uma categoria. Por favor, confira as permiss�es de seu grupo no menu Categoria!';
    $Lang->{'Agent groups which can access this category.'} = 'Grupo de agentes que podem acessar esta categoria.';
    $Lang->{'A category needs min. one permission group!'}   = 'Selecione pelo menos um grupo que poder� acessar esta categoria!';
    $Lang->{'Will be shown as comment in Explorer.'}         = 'Ser� exibido como coment�rio no Explorer';

    return 1;
}

1;
