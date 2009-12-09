# --
# Kernel/Language/de_FAQ.pm - the german translation of FAQ
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: de_FAQ.pm,v 1.16 2009/12/09 10:24:11 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::de_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.16 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'You have already voted!'} = 'Sie haben bereits bewertet!';
    $Lang->{'No rate selected!'}       = 'Keine Bewertung ausw�hlt!';
    $Lang->{'Thanks for your vote!'}   = 'Danke f�r Ihre Bewertungen!';
    $Lang->{'Votes'}                   = 'Bewertungen';
    $Lang->{'LatestChangedItems'}      = 'zuletzt ge�nderte Artikel';
    $Lang->{'LatestCreatedItems'}      = 'zuletzt erstellte Artikel';
    $Lang->{'Top10Items'}              = 'Top 10 Artikel';
    $Lang->{'ArticleVotingQuestion'}   = 'Wie gut wurde mit diesem Artikel Ihre Frage beantwortet?';
    $Lang->{'SubCategoryOf'}           = 'Unterkategorie von';
    $Lang->{'QuickSearch'}             = 'Schnellsuche';
    $Lang->{'DetailSearch'}            = 'Detailsuche';
    $Lang->{'Categories'}              = 'Kategorien';
    $Lang->{'SubCategories'}           = 'Subkategorien';
    $Lang->{'New FAQ Article'}         = 'Neuer FAQ Artikel';
    $Lang->{'FAQ Category'}            = 'FAQ Kategorie';
    $Lang->{'A category should have a name!'}        = 'Eine Kategorien sollte einen Namen haben!';
    $Lang->{'A category should have a comment!'}     = 'Eine Kategorien sollte einen Kommentar haben!';
    $Lang->{'FAQ Articles (new created)'}            = 'FAQ Articles (neu erstellte)';
    $Lang->{'FAQ Articles (recently changed)'}       = 'FAQ Articles (zuletzt ge�nderte)';
    $Lang->{'FAQ Articles (Top 10)'}                 = 'FAQ Articles (Top 10)';
    $Lang->{'StartDay'}                              = 'Start Tag';
    $Lang->{'StartMonth'}                            = 'Start Monat';
    $Lang->{'StartYear'}                             = 'Start Jahr';
    $Lang->{'EndDay'}                                = 'End Tag';
    $Lang->{'EndMonth'}                              = 'End Monat';
    $Lang->{'EndYear'}                               = 'End Jahr';
    $Lang->{'Approval'}                              = 'Freigabe';
    $Lang->{
        'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'
        }
        = 'Keine Kategorie-Auswahl m�glich. Um einen Artikel erstellen zu k�nnen, muss man min. Zugriff auf eine Kategorie haben. Bitte �berpr�fen Sie die Gruppen/Kategorie Berechtigung im Menupunkt -Kategorie-!';
    $Lang->{'Agent groups which can access this category.'}
        = 'Agenten Gruppe welche auf diese Kategorie Zugriff hat.';
    $Lang->{'A category needs min. one permission group!'}
        = 'Eine Kategorie muss min. eine Berechtigungs-Gruppe haben.';
    $Lang->{'Will be shown as comment in Explorer.'} = 'Wird im Explorer als Kommentar angezeigt.';

    return 1;
}

1;
