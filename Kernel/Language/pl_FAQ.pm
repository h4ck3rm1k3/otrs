# --
# Kernel/Language/pl_FAQ.pm - the polish translation of FAQ
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Patryk �ciborek <patryk@sciborek.com>
# Copyright (C) 2009 Artur Skalski <skal.ar at wp.pl>
# --
# $Id: pl_FAQ.pm,v 1.6 2010/11/08 15:41:12 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::pl_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'You have already voted!'}           = 'Ju� raz g�osowa�e�!';
    $Lang->{'No rate selected!'}                 = 'Nie wybra�e� oceny!';
    $Lang->{'Thanks for your vote!'}             = 'Dzi�kujemy za oddanie g�osu!';
    $Lang->{'Votes'}                             = 'G�osy';
    $Lang->{'LatestChangedItems'}                = 'ostatnio zmienione artyku�y';
    $Lang->{'LatestCreatedItems'}                = 'ostatnio utworzone artyku�y';
    $Lang->{'Top10Items'}                        = '10 najlepszych artyku��w';
    $Lang->{'ArticleVotingQuestion'}             = 'Czy ten artyku� pom�g� Ci??';
    $Lang->{'SubCategoryOf'}                     = 'Podkategoria';
    $Lang->{'QuickSearch'}                       = 'Szybkie wyszukiwanie';
    $Lang->{'DetailSearch'}                      = 'Dok�adne wyszukiwanie';
    $Lang->{'Categories'}                        = 'Kategorie';
    $Lang->{'SubCategories'}                     = 'Podkategorie';
    $Lang->{'New FAQ Article'}                   = 'Nowy artyku� FAQ';
    $Lang->{'FAQ Category'}                      = 'Kategoria FAQ';
    $Lang->{'A category should have a name!'}    = 'Kategoria musi posiada� nazw�!';
    $Lang->{'A category should have a comment!'} = 'Kategoria musi posiada� komentarz!';
    $Lang->{'FAQ Articles (new created)'}        = 'Zmiany w FAQ (nowe artyku�y)';
    $Lang->{'FAQ Articles (recently changed)'}   = 'Zmiany w FAQ (zmienione artyku�y)';
    $Lang->{'FAQ Articles (Top 10)'}             = 'Zmiany w FAQ (10 najlepszych artyku��w)';
    $Lang->{'StartDay'}                          = 'Dzie� pocz�tkowy';
    $Lang->{'StartMonth'}                        = 'Miesi�c pocz�tkowy';
    $Lang->{'StartYear'}                         = 'Rok pocz�tkowy';
    $Lang->{'EndDay'}                            = 'Dzie� ko�cowy';
    $Lang->{'EndMonth'}                          = 'Miesi�c ko�cowy';
    $Lang->{'EndYear'}                           = 'Rok ko�cowy';
    $Lang->{'Approval'}                          = 'Zatwierdzone';
    $Lang->{'FAQ-Area'}                 = 'FAQ: cz�sto zadawane pytania';
    $Lang->{'Result'}                 = 'Ocena';

    $Lang->{
        'No category accessible. To create an article you need access to at least one category. Please check your group/category permission under -category menu-!'
        } = 'Brak zdefiniowanych kategorii. Abu utworzy� artyku� musi istnie� co najmniej jedna kategoria. Sprawd� prosz� swoje uprawnienia w menu Kategorie.';
    $Lang->{'Agent groups which can access this category.'}  = 'Grupy agent�w, kt�re maj� dost�p do tej kategorii';
    $Lang->{'A category needs at least one permission group!'}   = 'Kategoria wymaga co najmniej jednej grupy uprawnie�!';
    $Lang->{'Will be shown as comment in Explorer.'}         = 'Zostanie pokazany jako komentarz w eksplorerze.';

    return 1;
}

1;
