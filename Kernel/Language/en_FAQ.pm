# --
# Kernel/Language/en_FAQ.pm - the english translation of FAQ
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: en_FAQ.pm,v 1.6 2008/08/20 12:13:06 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::en_FAQ;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'You have already voted!'}           = 'You have already vote!';
    $Lang->{'No rate selected!'}                 = 'No rate selected!';
    $Lang->{'Thanks for vote!'}                  = '';
    $Lang->{'Votes'}                             = '';
    $Lang->{'LatestChangedItems'}                = 'latest changed article';
    $Lang->{'LatestCreatedItems'}                = 'latest created article';
    $Lang->{'ArticleVotingQuestion'}             = 'Did this article help?';
    $Lang->{'SubCategoryOf'}                     = 'Unterkategorie von';
    $Lang->{'QuickSearch'}                       = 'Quick Search';
    $Lang->{'DetailSearch'}                      = 'Detail Search';
    $Lang->{'Categories'}                        = '';
    $Lang->{'SubCategories'}                     = 'Subcategories';
    $Lang->{'A category should have a name!'}    = '';
    $Lang->{'A category should have a comment!'} = '';
    $Lang->{'FAQ News (new created)'}            = '';
    $Lang->{'FAQ News (recently changed)'}       = '';
    $Lang->{
        'No category accesable. To create an article you need have at lease access to min. one category. Please check your group/category permission under -category menu-!'
        } = '';
    $Lang->{'Agent Groups which can access this category.'} = '';
    $Lang->{'A category need min. one permission group!'}   = '';
    $Lang->{'Will be shown as comment in Explore.'}         = '';

    return 1;
}

1;
