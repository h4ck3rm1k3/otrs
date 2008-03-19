# --
# Kernel/Language/de_FAQ.pm - provides de language translation
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: de_FAQ.pm,v 1.3 2008/03/19 10:55:43 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --
package Kernel::Language::de_FAQ;

use strict;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub Data {
    my $Self = shift;
    my $Translation = $Self->{Translation};

    return if ref $Translation ne 'HASH';

    # $$START$$

    # own translations
    $Translation->{'You have already voted!'} = 'Sie haben bereits bewertet!';
    $Translation->{'No rate selected!'} = 'Keine Bewertung ausw�hlt!';
    $Translation->{'Thanks for vote!'} = 'Danke f�r Ihre Bewertungen!';
    $Translation->{Votes} = 'Bewertungen';
    $Translation->{LatestChangedItems} = 'zuletzt ge�nderte Artikel';
    $Translation->{LatestCreatedItems} = 'zuletzt erstellte Artikel';
    $Translation->{ArticleVotingQuestion} = 'Wie gut wurde mit diesem Artikel Ihre Frage beantwortet?';
    $Translation->{SubCategoryOf} = 'Unterkategorie von';
    $Translation->{QuickSearch} = 'Schnellsuche';
    $Translation->{DetailSearch} = 'Detailsuche';
    $Translation->{Categories} = 'Kategorien';
    $Translation->{SubCategories} = 'Subkategorien';
    $Translation->{'A category should have a name!'} = 'Eine Kategorien sollte einen Namen haben!';
    $Translation->{'A category should have a comment!'} = 'Eine Kategorien sollte einen Kommentar haben!';

    # $$STOP$$
    return 1;
}

1;
