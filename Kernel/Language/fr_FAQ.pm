# --
# Kernel/Language/fr_FAQ.pm - the french translation of FAQ
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2009 Jonathan Peyrot
# --
# $Id: fr_FAQ.pm,v 1.1 2009/08/04 22:16:35 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::fr_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'You have already voted!'}           = 'Vous avez d�j� vot� !';
    $Lang->{'No rate selected!'}                 = 'Pas de s�lection !';
    $Lang->{'Thanks for your vote!'}             = 'Merci pour votre vote !';
    $Lang->{'Votes'}                             = 'Votes';
    $Lang->{'LatestChangedItems'}                = 'Derni�res questions modifi�es';
    $Lang->{'LatestCreatedItems'}                = 'Derni�res questions cr��es';
    $Lang->{'Top10Items'}                        = 'Top 10 des questions';
    $Lang->{'ArticleVotingQuestion'}             = 'Voulez vous voter pour cette question ?';
    $Lang->{'SubCategoryOf'}                     = 'Sous cat�gorie de';
    $Lang->{'QuickSearch'}                       = 'Recherche rapide';
    $Lang->{'DetailSearch'}                      = 'D�tails de la recherche';
    $Lang->{'Categories'}                        = 'Cat�gories';
    $Lang->{'SubCategories'}                     = 'Sous-cat�gories';
    $Lang->{'New FAQ Article'}                   = 'Nouvelle question dans la FAQ';
    $Lang->{'FAQ Category'}                      = 'Cat�gorie FAQ';
    $Lang->{'A category should have a name!'}    = 'Une cat�gorie doit avoir un nom !';
    $Lang->{'A category should have a comment!'} = 'Une cat�gorie doit poss�der un commentaire';
    $Lang->{'FAQ News (new created)'}            = 'FAQ News (nouvelles questions)';
    $Lang->{'FAQ News (recently changed)'}       = 'FAQ News (derniers changements)';
    $Lang->{'FAQ News (Top 10)'}                 = 'FAQ News (Top 10)';
    $Lang->{'StartDay'}                          = 'Jour D�but';
    $Lang->{'StartMonth'}                        = 'Mois D�but';
    $Lang->{'StartYear'}                         = 'Ann�e D�but';
    $Lang->{'EndDay'}                            = 'Jour Fin';
    $Lang->{'EndMonth'}                          = 'Mois Fin';
    $Lang->{'EndYear'}                           = 'Ann�e Fin';
    $Lang->{'Approval'}                          = 'Autorisation';
    $Lang->{
        'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'
        }
        = 'Aucun cat�gorie accessible. Pour cr�er une question, vous devez avoir acc�s � au moins une cat�gorie. SVP v�rifiez les permissions de votre groupe/cat�gorie via le menu -cat�gorie- !';
    $Lang->{'Agent groups which can access this category.'}
        = 'Groupes d\'Agents pouvant acc�der � cette cat�gorie';
    $Lang->{'A category needs min. one permission group!'}
        = 'Une cat�gorie n�cessite au minimum une permission de groupe !';
    $Lang->{'Will be shown as comment in Explorer.'} = 'Sera affich� comme un commentaire dans l\'Explorer.';

    return 1;
}

1;
