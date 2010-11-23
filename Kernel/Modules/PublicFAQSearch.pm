# --
# Kernel/Modules/PublicFAQSearch.pm - Utilities for tickets
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: PublicFAQSearch.pm,v 1.3 2010/11/23 11:10:23 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::PublicFAQSearch;

use strict;
use warnings;

use Kernel::System::FAQ;
use Kernel::System::SearchProfile;
use Kernel::System::CSV;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for (qw(ParamObject DBObject LayoutObject LogObject ConfigObject)) {
        if ( !$Self->{$_} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        }
    }

    # set UserID to root because in public interface there is no user
    $Self->{UserID} = 1;

    # create additional objects
    $Self->{FAQObject}           = Kernel::System::FAQ->new(%Param);
    $Self->{SearchProfileObject} = Kernel::System::SearchProfile->new(%Param);
    $Self->{CSVObject}           = Kernel::System::CSV->new(%Param);

    # get config for frontend
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

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Output;

    # get confid data
    $Self->{StartHit} = int( $Self->{ParamObject}->GetParam( Param => 'StartHit' ) || 1 );
    $Self->{SearchLimit}     = $Self->{Config}->{SearchLimit}     || 200;
    $Self->{SearchPageShown} = $Self->{Config}->{SearchPageShown} || 40;
    $Self->{SortBy} = $Self->{ParamObject}->GetParam( Param => 'SortBy' )
        || $Self->{Config}->{'SortBy::Default'}
        || 'FAQID';
    $Self->{OrderBy} = $Self->{ParamObject}->GetParam( Param => 'Order' )
        || $Self->{Config}->{'Order::Default'}
        || 'Down';

    # remember exclude attributes
    my @Excludes = $Self->{ParamObject}->GetArray( Param => 'Exclude' );

    my %GetParam;

    # get single params
    for my $ParamName (qw(Number Title Keyword Fulltext ResultForm)) {

        # get search string params (get submitted params)
        $GetParam{$ParamName} = $Self->{ParamObject}->GetParam( Param => $ParamName );

        # remove whitespace on the start and end
        if ( $GetParam{$ParamName} ) {
            $GetParam{$ParamName} =~ s{ \A \s+ }{}xms;
            $GetParam{$ParamName} =~ s{ \s+ \z }{}xms;
        }

        # store non empty parameters on a local profile
        if ( $GetParam{$ParamName} ) {
            $Self->{Profile} .= "$ParamName=$GetParam{$ParamName};";
        }

    }

    # get array params
    for my $ParamName (qw(CategoryIDs LanguageIDs )) {

        # get search array params (get submitted params)
        my @Array = $Self->{ParamObject}->GetArray( Param => $ParamName );
        if (@Array) {
            $GetParam{$ParamName} = \@Array;

            # store parameters on a local profile
            for my $Element (@Array) {
                $Self->{Profile} .= "$ParamName=$Element;";
            }
        }
    }

    # check if item need to get excluded
    for my $Exclude (@Excludes) {
        if ( $GetParam{$Exclude} ) {
            delete $GetParam{$Exclude};
        }
    }

    # set result form env
    if ( !$GetParam{ResultForm} ) {
        $GetParam{ResultForm} = '';
    }
    if ( $GetParam{ResultForm} eq 'Print' ) {
        $Self->{SearchPageShown} = $Self->{SearchLimit};
    }

    # check request
    if ( $Self->{Subaction} eq 'OpenSearchDescription' ) {
        my $Output = $Self->{LayoutObject}->Output(
            TemplateFile => 'PublicFAQSearchOpenSearchDescription',
            Data         => {%Param},
        );
        return $Self->{LayoutObject}->Attachment(
            Filename    => 'OpenSearchDescription.xml',
            ContentType => 'text/xml',
            Content     => $Output,
            Type        => 'inline',
        );
    }

    # show result page
    if ( $Self->{Subaction} eq 'Search' && !$Self->{EraseTemplate} ) {

        # prepare fulltext search
        if ( $GetParam{Fulltext} ) {
            $GetParam{ContentSearch} = 'OR';
            $GetParam{What}          = $GetParam{Fulltext};
        }

        # perform FAQ search
        my @ViewableFAQIDs = $Self->{FAQObject}->FAQSearch(
            OrderBy             => [ $Self->{SortBy} ],
            OrderByDirection    => [ $Self->{OrderBy} ],
            Limit               => $Self->{SearchLimit},
            UserID              => $Self->{UserID},
            States              => $Self->{InterfaceStates},
            Interface           => $Self->{Interface},
            ContentSearchPrefix => '*',
            ContentSearchSuffix => '*',
            %GetParam,
        );

        # CSV output
        if ( $GetParam{ResultForm} eq 'CSV' ) {
            my @CSVHead;
            my @CSVData;

            for my $FAQID (@ViewableFAQIDs) {

                # get FAQ data details
                my %FAQData = $Self->{FAQObject}->FAQGet(
                    FAQID  => $FAQID,
                    UserID => $Self->{UserID},
                );

                my $Changed = $Self->{LayoutObject}->Output(
                    Template => '$TimeLong{"$Data{"Changed"}"}',
                    Data     => \%FAQData,
                );

                # get info fo CSV output
                my %CSVInfo = (
                    FAQNumber => $FAQData{Number},
                    Title     => $FAQData{Title},
                    Category  => $FAQData{CategoryName},
                    Language  => $FAQData{Language},
                    State     => $FAQData{State},
                    Changed   => $Changed,
                );

                # csv quote
                if ( !@CSVHead ) {
                    @CSVHead = qw( FAQNumber Title Category Language State Changed );
                }
                my @Data;
                for my $Header (@CSVHead) {
                    push @Data, $CSVInfo{$Header};
                }
                push @CSVData, \@Data;
            }

            # replace FAQNumber header with the current FAQHook from config
            $CSVHead[0] = $Self->{ConfigObject}->Get('FAQ::FAQHook');

            # assable CSV data
            my $CSV = $Self->{CSVObject}->Array2CSV(
                Head      => \@CSVHead,
                Data      => \@CSVData,
                Separator => $Self->{UserCSVSeparator},
            );

            # return csv to download
            my $CSVFile = 'FAQ_search';
            my ( $s, $m, $h, $D, $M, $Y ) = $Self->{TimeObject}->SystemTime2Date(
                SystemTime => $Self->{TimeObject}->SystemTime(),
            );
            $M = sprintf( "%02d", $M );
            $D = sprintf( "%02d", $D );
            $h = sprintf( "%02d", $h );
            $m = sprintf( "%02d", $m );
            return $Self->{LayoutObject}->Attachment(
                Filename    => $CSVFile . "_" . "$Y-$M-$D" . "_" . "$h-$m.csv",
                ContentType => "text/csv; charset=" . $Self->{LayoutObject}->{UserCharset},
                Content     => $CSV,
            );
        }
        elsif ( $GetParam{ResultForm} eq 'Print' ) {
            for my $FAQID (@ViewableFAQIDs) {

                # get FAQ data details
                my %FAQData = $Self->{FAQObject}->FAQGet(
                    FAQID  => $FAQID,
                    UserID => $Self->{UserID},
                );

                # add table block
                $Self->{LayoutObject}->Block(
                    Name => 'Record',
                    Data => {%FAQData},
                );
            }

            # output header
            my $Output = $Self->{LayoutObject}->PrintHeader( Width => 800 );
            if ( @ViewableFAQIDs == $Self->{SearchLimit} ) {
                $Param{Warning} = '$Text{"Reached max. count of %s search hits!", "'
                    . $Self->{SearchLimit} . '"}';
            }
            $Output .= $Self->{LayoutObject}->Output(
                TemplateFile => 'CustomerFAQSearchResultPrint',
                Data         => \%Param,
            );

            # add footer
            $Output .= $Self->{LayoutObject}->PrintFooter();

            # return output
            return $Output;

        }

        my $Counter = 0;
        for my $FAQID (@ViewableFAQIDs) {
            $Counter++;

            # get FAQ data details
            my %FAQData = $Self->{FAQObject}->FAQGet(
                FAQID  => $FAQID,
                UserID => $Self->{UserID},
            );

            # build search result
            if (
                $Counter >= $Self->{StartHit}
                && $Counter < ( $Self->{SearchPageShown} + $Self->{StartHit} )
                )
            {

                # add blocks to template
                $Self->{LayoutObject}->Block(
                    Name => 'Record',
                    Data => {
                        %FAQData,
                    },
                );
            }
        }

        # build search navigation bar
        my %PageNav = $Self->{LayoutObject}->PageNavBar(
            Limit     => $Self->{SearchLimit},
            StartHit  => $Self->{StartHit},
            PageShown => $Self->{SearchPageShown},
            AllHits   => $Counter,
            Action    => "Action=PublicFAQSearch",
            Link =>
                "$Self->{Profile}SortBy=$Self->{SortBy};Order=$Self->{OrderBy};",
            IDPrefix => "PublicFAQSearch",
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

        # start html page
        my $Output = $Self->{LayoutObject}->CustomerHeader();

        my %NewOrder = (
            Down => 'Up',
            Up   => 'Down',
        );

        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'PublicFAQSearchResultShort',
            Data         => {
                %Param,
                %PageNav,
                Order   => $NewOrder{ $Self->{OrderBy} },
                Profile => $Self->{Profile},
            },
        );

        # build footer
        $Output .= $Self->{LayoutObject}->CustomerFooter();
        return $Output;
    }

    # empty search site
    else {

        # generate search mask
        my $Output = $Self->{LayoutObject}->CustomerHeader();
        $Output .= $Self->MaskForm(
            %GetParam,
            Profile => $Self->{Profile},
            Area    => 'Public',
        );
        $Output .= $Self->{LayoutObject}->CustomerFooter();
        return $Output;
    }
}

sub MaskForm {
    my ( $Self, %Param ) = @_;

    # set output formats list
    my %ResultForm = (
        Normal => 'Normal',
        Print  => 'Print',
        CSV    => 'CSV',
    );

    # build output formats list
    $Param{ResultFormStrg} = $Self->{LayoutObject}->BuildSelection(
        Data       => {%ResultForm},
        Name       => 'ResultForm',
        SelectedID => $Param{ResultForm} || 'Normal',
    );

    # get languages list
    my %Languages = $Self->{FAQObject}->LanguageList(
        UserID => $Self->{UserID},
    );

    # build languages output list
    $Param{LanguagesStrg} = $Self->{LayoutObject}->BuildSelection(
        Data       => {%Languages},
        Name       => 'LanguageIDs',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{LanguageIDs},
    );

    # get categories list
    my $Categories = $Self->{FAQObject}->GetPublicCategoriesLongNames(
        CustomerUser => $Self->{UserLogin},
        Type         => 'rw',
        UserID       => $Self->{UserID},
    );

    # build categories output list
    $Param{CategoriesStrg} = $Self->{LayoutObject}->BuildSelection(
        Data       => $Categories,
        Name       => 'CategoryIDs',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{CategoryIDs},
    );

    # html search mask output
    $Self->{LayoutObject}->Block(
        Name => 'Search',
        Data => {%Param},
    );

    # html search mask output
    return $Self->{LayoutObject}->Output(
        TemplateFile => 'PublicFAQSearch',
        Data         => {%Param},
    );
}

1;
