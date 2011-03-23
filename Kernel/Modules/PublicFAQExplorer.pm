# --
# Kernel/Modules/PublicFAQExplorer.pm - public FAQ explorer
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: PublicFAQExplorer.pm,v 1.7 2011/03/23 23:25:37 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::PublicFAQExplorer;

use strict;
use warnings;

use Kernel::System::FAQ;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (
        qw(ParamObject DBObject LayoutObject LogObject ConfigObject)
        )
    {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }

    # set UserID to root because in public interface there is no user
    $Self->{UserID} = 1;

    # create needed objects
    $Self->{FAQObject} = Kernel::System::FAQ->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("FAQ::Frontend::$Self->{Action}");

    # set default interface settings
    $Self->{Interface} = $Self->{FAQObject}->StateTypeGet(
        Name   => 'public',
        UserID => $Self->{UserID},
    );
    $Self->{InterfaceStates} = $Self->{FAQObject}->StateTypeList(
        Types  => ['public'],
        UserID => $Self->{UserID},
    );

    $Self->{MultiLanguage} = $Self->{ConfigObject}->Get('FAQ::MultiLanguage');

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get config data
    $Self->{StartHit} = int( $Self->{ParamObject}->GetParam( Param => 'StartHit' ) || 1 );
    $Self->{SearchLimit}     = $Self->{Config}->{SearchLimit}     || 200;
    $Self->{SearchPageShown} = $Self->{Config}->{SearchPageShown} || 3;
    $Self->{SortBy} = $Self->{ParamObject}->GetParam( Param => 'SortBy' )
        || $Self->{Config}->{'SortBy::Default'}
        || 'FAQID';
    $Self->{OrderBy} = $Self->{ParamObject}->GetParam( Param => 'Order' )
        || $Self->{Config}->{'Order::Default'}
        || 'Down';

    # get Item ID
    my $ItemID = $Self->{ParamObject}->GetParam( Param => 'ItemID' ) || 0;

    # check if ItemID parameter was sent and redirect to FAQ article zoom screen
    if ($ItemID) {

        # redirect to FAQ zoom
        return $Self->{LayoutObject}->Redirect( OP => 'Action=PublicFAQZoom;ItemID=' . $ItemID );
    }

    # get category id
    my $CategoryID = $Self->{ParamObject}->GetParam( Param => 'CategoryID' ) || 0;

    # check for non numeric CategoryID
    if ( $CategoryID !~ /\d+/ ) {
        $CategoryID = 0;
    }

    # try to get the category data
    my %CategoryData;
    if ($CategoryID) {

        # get category data
        %CategoryData = $Self->{FAQObject}->CategoryGet(
            CategoryID => $CategoryID,
            UserID     => $Self->{UserID},
        );
        if ( !%CategoryData ) {
            return $Self->{LayoutObject}->CustomerNoPermission( WithHeader => 'yes' );
        }
    }

    # add rss feed link for new FAQ articles in the browser URL bar
    $Self->{LayoutObject}->Block(
        Name => 'MetaLink',
        Data => {
            Rel   => 'alternate',
            Type  => 'application/rss+xml',
            Title => $Self->{LayoutObject}->{LanguageObject}->Get('FAQ Articles (new created)'),
            Href  => '$Env{"Baselink"}Action=PublicFAQRSS;Type=Created',
        },
    );

    # add rss feed link for changed FAQ articles in the browser URL bar
    $Self->{LayoutObject}->Block(
        Name => 'MetaLink',
        Data => {
            Rel  => 'alternate',
            Type => 'application/rss+xml',
            Title =>
                $Self->{LayoutObject}->{LanguageObject}->Get('FAQ Articles (recently changed)'),
            Href => '$Env{"Baselink"}Action=PublicFAQRSS;Type=Changed',
        },
    );

    # add rss feed link for Top10 FAQ articles in the browser URL bar
    $Self->{LayoutObject}->Block(
        Name => 'MetaLink',
        Data => {
            Rel   => 'alternate',
            Type  => 'application/rss+xml',
            Title => $Self->{LayoutObject}->{LanguageObject}->Get('FAQ Articles (Top 10)'),
            Href  => '$Env{"Baselink"}Action=PublicFAQRSS;Type=Top10',
        },
    );

    # output header
    my $Output = $Self->{LayoutObject}->CustomerHeader();

    # show FAQ path
    $Self->{LayoutObject}->FAQPathShow(
        FAQObject  => $Self->{FAQObject},
        CategoryID => $CategoryID,
        UserID     => $Self->{UserID},
    );

    # get all direct subcategories of the selected category
    my $CategoryIDsRef = $Self->{FAQObject}->PublicCategorySearch(
        ParentID => $CategoryID,
        Mode     => 'Public',
        UserID   => $Self->{UserID},
    );

    # show subcategories list
    $Self->{LayoutObject}->Block( Name => 'Subcategories' );
    $Self->{LayoutObject}->Block( Name => 'OverviewResult' );

    # check if there are subcategories
    if ( $CategoryIDsRef && ref $CategoryIDsRef eq 'ARRAY' && @{$CategoryIDsRef} ) {

        # show data for each subcategory
        for my $SubCategoryID ( @{$CategoryIDsRef} ) {

            # get the category data
            my %SubCategoryData = $Self->{FAQObject}->CategoryGet(
                CategoryID => $SubCategoryID,
                UserID     => $Self->{UserID},
            );

            # get the number of subcategories of this subcategory
            $SubCategoryData{SubCategoryCount} = $Self->{FAQObject}->CategoryCount(
                ParentIDs => [$SubCategoryID],
                UserID    => $Self->{UserID},
            );

            # get the number of faq articles in this category
            $SubCategoryData{ArticleCount} = $Self->{FAQObject}->FAQCount(
                CategoryIDs  => [$SubCategoryID],
                ItemStates   => $Self->{InterfaceStates},
                OnlyApproved => 1,
                UserID       => $Self->{UserID},
            );

            # output the category data
            $Self->{LayoutObject}->Block(
                Name => 'OverviewResultRow',
                Data => {%SubCategoryData},
            );
        }
    }

    # otherwise a no data found message is displayed
    else {
        $Self->{LayoutObject}->Block(
            Name => 'NoCategoryDataFoundMsg',
        );
    }

    # search all FAQ articles within the given category
    my @ViewableFAQIDs = $Self->{FAQObject}->FAQSearch(
        OrderBy          => [ $Self->{SortBy} ],
        OrderByDirection => [ $Self->{OrderBy} ],
        Limit            => $Self->{SearchLimit},
        UserID           => $Self->{UserID},
        States           => $Self->{InterfaceStates},
        Interface        => $Self->{Interface},
        CategoryIDs      => [$CategoryID],
    );

    # set the SortBy Class
    my $SortClass;

    # this sets the opposit to the OrderBy parameter
    if ( $Self->{OrderBy} eq 'Down' ) {
        $SortClass = 'SortAscending';
    }
    elsif ( $Self->{OrderBy} eq 'Up' ) {
        $SortClass = 'SortDescending';
    }

    # set the SortBy Class to the correct field
    my %CSSSort;
    my $SortBy = $Self->{SortBy} . 'Sort';
    $CSSSort{$SortBy} = $SortClass;

    my %NewOrder = (
        Down => 'Up',
        Up   => 'Down',
    );

    # show the FAQ article list
    $Self->{LayoutObject}->Block(
        Name => 'FAQItemList',
        Data => {
            CategoryID => $CategoryID,
            %CSSSort,
            Order => $NewOrder{ $Self->{OrderBy} },
        },
    );

    # show language header
    if ( $Self->{MultiLanguage} ) {
        $Self->{LayoutObject}->Block(
            Name => 'HeaderLanguage',
            Data => {
                CategoryID => $CategoryID,
                %CSSSort,
                Order => $NewOrder{ $Self->{OrderBy} },
            },
        );
    }

    my $Counter = 0;
    if (@ViewableFAQIDs) {

        for my $FAQID (@ViewableFAQIDs) {

            $Counter++;

            # build search result
            if (
                $Counter >= $Self->{StartHit}
                && $Counter < ( $Self->{SearchPageShown} + $Self->{StartHit} )
                )
            {

                # get FAQ data details
                my %FAQData = $Self->{FAQObject}->FAQGet(
                    FAQID  => $FAQID,
                    UserID => $Self->{UserID},
                );

                # add blocks to template
                $Self->{LayoutObject}->Block(
                    Name => 'Record',
                    Data => {
                        %FAQData,
                    },
                );

                # add language data
                if ( $Self->{MultiLanguage} ) {
                    $Self->{LayoutObject}->Block(
                        Name => 'RecordLanguage',
                        Data => {
                            %FAQData,
                        },
                    );
                }
            }
        }
    }

    # otherwise a no data found message is displayed
    else {
        $Self->{LayoutObject}->Block(
            Name => 'NoFAQDataFoundMsg',
        );
    }

    my $Link = 'SortBy=' . $Self->{LayoutObject}->LinkEncode( $Self->{SortBy} ) . ';';
    $Link .= 'Order=' . $Self->{LayoutObject}->LinkEncode( $Self->{OrderBy} ) . ';';

    # build search navigation bar
    my %PageNav = $Self->{LayoutObject}->PageNavBar(
        Limit     => $Self->{SearchLimit},
        StartHit  => $Self->{StartHit},
        PageShown => $Self->{SearchPageShown},
        AllHits   => $Counter,
        Action    => "Action=PublicFAQExplorer;CategoryID=$CategoryID",
        Link      => $Link,
        IDPrefix  => "PublicFAQExplorer",
    );

    # show footer filter - show only if more the one page is available
    if ( defined $PageNav{TotalHits} && ( $PageNav{TotalHits} > $Self->{SearchPageShown} ) ) {
        $Self->{LayoutObject}->Block(
            Name => 'Pagination',
            Data => {
                %Param,
                %PageNav,
            },
        );
    }

    # show QuickSearch
    $Self->{LayoutObject}->FAQShowQuickSearch(
        Mode            => 'Public',
        Interface       => $Self->{Interface},
        InterfaceStates => $Self->{InterfaceStates},
        UserID          => $Self->{UserID},
    );

    # show last added and last updated articles
    for my $Type (qw(LastCreate LastChange)) {

        my $ShowOk = $Self->{LayoutObject}->FAQShowLatestNewsBox(
            FAQObject       => $Self->{FAQObject},
            Type            => $Type,
            Mode            => 'Public',
            CategoryID      => $CategoryID,
            Interface       => $Self->{Interface},
            InterfaceStates => $Self->{InterfaceStates},
            UserID          => $Self->{UserID},
        );

        # check error
        if ( !$ShowOk ) {
            return $Self->{LayoutObject}->ErrorScreen();
        }
    }

    # show top ten articles
    my $ShowOk = $Self->{LayoutObject}->FAQShowTop10(
        FAQObject       => $Self->{FAQObject},
        Mode            => 'Public',
        CategoryID      => $CategoryID,
        Interface       => $Self->{Interface},
        InterfaceStates => $Self->{InterfaceStates},
        UserID          => $Self->{UserID},
    );

    # check error
    if ( !$ShowOk ) {
        return $Self->{LayoutObject}->ErrorScreen();
    }

    # start template output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'PublicFAQExplorer',
        Data         => {
            %Param,
            CategoryID => $CategoryID,
            %CategoryData,
        },
    );

    # add footer
    $Output .= $Self->{LayoutObject}->CustomerFooter();

    return $Output;
}

1;
