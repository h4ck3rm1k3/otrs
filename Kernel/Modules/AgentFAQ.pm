# --
# Kernel/Modules/AgentFAQ.pm - faq module
# Copyright (C) 2001-2006 OTRS GmbH, http://otrs.org/
# --
# $Id: AgentFAQ.pm,v 1.7 2006/10/25 10:06:19 rk Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::Modules::AgentFAQ;

use strict;
use Kernel::System::FAQ;
use Kernel::System::LinkObject;
use Kernel::Modules::FAQ;

use vars qw($VERSION @ISA);
$VERSION = '$Revision: 1.7 $';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

@ISA = qw(Kernel::Modules::FAQ);

# --
sub new {
    my $Type = shift;
    my %Param = @_;

    # allocate new hash for object
    # ********************************************************** #
    my $Self = new Kernel::Modules::FAQ(%Param);
    bless ($Self, $Type);

    # interface settings
    # ********************************************************** #
    $Self->{Interface} = $Self->{FAQObject}->StateTypeGet(
        Name => 'internal'
    );
    $Self->{InterfaceStates} = $Self->{FAQObject}->StateTypeList(
        Types => ['internal','external','public']
    );

    # check needed Objects
    # ********************************************************** #
    foreach (qw(SessionObject)) {
        $Self->{LayoutObject}->FatalError(Message => "Got no $_!") if (!$Self->{$_});
    }

    return $Self;
}
# --
sub Run {

    my $Self = shift;
    my %Param = @_;

    # Paramter
    my @Params = ();
    my %GetParam = ();
    my %Frontend = ();
    my %Data = ();

    # Output
    my $Output = '';
    my $Header = '';
    my $HeaderTitle =  '';
    my $HeaderType =  '';
    my $Navigation = '';
    my $Notify = '';
    my $Content = '';
    my $Footer = '';
    my $FooterType =  '';

    my $DefaultHeader = '';
    my $DefaultNavigation = '';
    my $DefaultNotify = '';
    my $DefaultContent = '';
    my $DefaultFooter = '';

    # manage parameters
    # ********************************************************** #
    @Params = qw(ItemID ID Number Name Comment CategoryID ParentID StateID LanguageID Title UserID Field1 Field2 Field3 Field4 Field5 Field6 FreeKey1 FreeKey2 FreeKey3 Keywords Order Sort Nav);
    foreach (@Params) {
        $GetParam{$_} = $Self->{ParamObject}->GetParam(Param => $_) || '';
    }

    # navigation ON/OFF
    # ********************************************************** #
    $HeaderType = $Self->{LastFAQNav};
    if($GetParam{Nav} eq 'Normal') {
        $HeaderType = '';
    } elsif ($GetParam{Nav} eq 'None' || $Self->{LastFAQNav}) {
        $HeaderType = 'Small';
        $Navigation = ' ';
        $Notify    = ' ';
    } else {
        $HeaderType = '';
    }

    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key => 'LastFAQNav',
        Value => $HeaderType,
    );

    # store nav param
    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key => 'LastFAQNav',
        Value => $HeaderType,
    );

    # view small
    #$HeaderType = $Self->{LastFAQNav} || '';
    #my $Nav = $Self->{ParamObject}->GetParam(Param => 'Nav') || '';

    # output
    $Output  = '';

    # store search params
    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key => 'LastFAQWhat',
        Value => $Param{What},
    );
    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key => 'LastFAQKeyword',
        Value => $Param{Keyword},
    );

    # ---------------------------------------------------------- #
    # language add
    # ---------------------------------------------------------- #
    if ($Self->{Subaction} eq 'Language') {

        # permission check
        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # dtl
        $Frontend{Headline} = 'Add';
        $Frontend{AddLink} = '(Click here to add)';
        $Frontend{Subaction} = 'LanguageAdd';
        $Frontend{LanguageOption} = $Self->{LayoutObject}->OptionStrgHashRef(
            Data => { $Self->{FAQObject}->LanguageList(UserID => $Self->{UserID}) },
            Size => 10,
            Name => 'ID',
            HTMLQuote => 1,
            LanguageTranslation => 0,
        );

        $Self->{LayoutObject}->Block(
            Name => 'Language',
            Data => {%Param, %Frontend},
        );

    }

    # ---------------------------------------------------------- #
    # language add action
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'LanguageAction') {

        # permission check
        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        #get Data
        my %ParamData = ();
        $ParamData{UserID} = $Self->{UserID};
        foreach(qw(Name)) {
            if(!($ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_))) {
                $Self->{LayoutObject}->FatalError(Message => "Need $_ !");
            }
        }

        # db action
        if(!$Self->{FAQObject}->LanguageDuplicateCheck(Name=>$ParamData{Name})) {
            if ($Self->{FAQObject}->LanguageAdd(%ParamData, UserID => $Self->{UserID})) {
                return $Self->{LayoutObject}->Redirect(OP => "Action=AgentFAQ&Subaction=Language");
            }
            else {
                return $Self->{LayoutObject}->ErrorScreen();
            }
        }
        else {
            $Self->{LayoutObject}->FatalError(Message => "Language '$ParamData{Name}' already exists!");
        }

    }

    # ---------------------------------------------------------- #
    # language update
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'LanguageChange') {

        # permission check
        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        #get Data
        my %ParamData = ();
        foreach(qw(ID)) {
            if(!($ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_))) {
                $Self->{LayoutObject}->FatalError(Message => "Need $_ !");
            }
        }

        # db action
        my %LanguageData = $Self->{FAQObject}->LanguageGet(ID => $ParamData{ID}, UserID => $Self->{UserID});
        if (!%LanguageData) {
            return $Self->{LayoutObject}->ErrorScreen();
        }

        # dtl
        $Frontend{Headline} = 'Change';
        $Frontend{AddLink} = '';
        $Frontend{Subaction} = 'LanguageChange';
        $Frontend{LanguageOption} = $Self->{LayoutObject}->OptionStrgHashRef(
            Data => { $Self->{FAQObject}->LanguageList(UserID => $Self->{UserID}) },
            Size => 10,
            Name => 'ID',
            SelectedID => $LanguageData{LanguageID},
            HTMLQuote => 1,
            LanguageTranslation => 0,
        );

        $Self->{LayoutObject}->Block(
            Name => 'Language',
            Data => {%Param, %Frontend, %LanguageData},
        );

        $Content = $Self->{LayoutObject}->Output(
            Data => {%Param, %Frontend, %LanguageData},
            TemplateFile => 'AgentFAQ',
        );

    }

    # ---------------------------------------------------------- #
    # language update action
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'LanguageChangeAction') {

        # permission check
        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # get Data
        my %ParamData = ();
        $ParamData{UserID} = $Self->{UserID};
        foreach(qw(ID Name)) {
            if(!($ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_))) {
                $Self->{LayoutObject}->FatalError(Message => "Need $_ !");
            }
        }

        # duplicate check
        if(!$Self->{FAQObject}->LanguageDuplicateCheck(Name=>$ParamData{Name},ID=>$ParamData{ID})) {
            # db action
            if (!$Self->{FAQObject}->LanguageUpdate(%ParamData, UserID => $Self->{UserID})) {
                return $Self->{LayoutObject}->Redirect(OP => "Action=AgentFAQ&Subaction=Language");
            }
            else {
                return $Self->{LayoutObject}->ErrorScreen();
            }
        }
        else {
            $Self->{LayoutObject}->FatalError(Message => "Language '$ParamData{Name}' already exists!");
        }

    }

    # ---------------------------------------------------------- #
    # category update
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'CategoryChange') {

        @Params = qw(CategoryID);

        # permission check
        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # ceck parameters
        my %ParamData = ();
        foreach(qw(CategoryID)) {
            if(!($ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_))) {
                $Self->{LayoutObject}->FatalError(Message => "Need $_ !");
            }
        }

        # db action
        my %CategoryData = $Self->{FAQObject}->CategoryGet(CategoryID => $ParamData{CategoryID}, UserID => $Self->{UserID});
        if (!%CategoryData) {
            return $Self->{LayoutObject}->ErrorScreen();
        }

        # dtl
        $Frontend{CategoryLongOption} = $Self->{LayoutObject}->AgentFAQCategoryListOption(
            CategoryList => { %{$Self->{FAQObject}->CategoryList(UserID => $Self->{UserID})} },
            Size => 10,
            Name => 'CategoryID',
            SelectedID => $CategoryData{CategoryID},
            HTMLQuote => 1,
            LanguageTranslation => 0,
        );
        $Frontend{CategoryOption} = $Self->{LayoutObject}->AgentFAQCategoryListOption(
            CategoryList => { %{$Self->{FAQObject}->CategoryList(UserID => $Self->{UserID})} },
            Size => 1,
            Name => 'ParentID',
            SelectedID => $CategoryData{ParentID},
            HTMLQuote => 1,
            LanguageTranslation => 0,
            RootElement => 1,
        );
        # build ValidID string
        $Frontend{ValidOption} = $Self->{LayoutObject}->OptionStrgHashRef(
            Data => {
                $Self->{DBObject}->GetTableData(
                    What => 'id, name',
                    Table => 'valid',
                    Valid => 0,
                )
            },
            Name => 'ValidID',
            SelectedID => $CategoryData{ValidID},
        );
        $Self->{LayoutObject}->Block(
            Name => 'Category',
            Data => { %Param, %Frontend, %CategoryData },
        );

    }
    # ---------------------------------------------------------- #
    # category update action
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'CategoryChangeAction') {

        # permission check
        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # check parameters
        my %ParamData = ();
        my @RequiredParams = qw(CategoryID Name Comment);
        my @Params = qw(ParentID ValidID);
        foreach (@RequiredParams) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
            if(!$ParamData{$_}) {
                return $Self->{LayoutObject}->FatalError(Message => "Need $_!");
            }
        }
        foreach (@Params) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
            if(!defined($ParamData{$_})) {
                return $Self->{LayoutObject}->FatalError(Message => "Need $_!");
            }
        }

        # duplicate check
        if(!$Self->{FAQObject}->CategoryDuplicateCheck(Name=>$ParamData{Name},ID=>$ParamData{CategoryID},ParentID=>$ParamData{ParentID})) {
            # db action
            if ($Self->{FAQObject}->CategoryUpdate(%ParamData, UserID => $Self->{UserID})) {
                return $Self->{LayoutObject}->Redirect(OP => "Action=AgentFAQ&Subaction=Category");
            }
            else {
                return $Self->{LayoutObject}->ErrorScreen();
            }
        }
        else {
            $Self->{LayoutObject}->FatalError(Message => "Category '$ParamData{Name}' already exists!");
        }
    }

    # ---------------------------------------------------------- #
    # category add
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'Category') {

        # permission check

        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # dtl

        $Frontend{CategoryLongOption} = $Self->{LayoutObject}->AgentFAQCategoryListOption(
            CategoryList => { %{$Self->{FAQObject}->CategoryList(UserID => $Self->{UserID})} } ,
            Size => 10,
            Name => 'CategoryID',
            HTMLQuote => 1,
            LanguageTranslation => 0,
        );
        $Frontend{CategoryOption} = $Self->{LayoutObject}->AgentFAQCategoryListOption(
            CategoryList => { %{$Self->{FAQObject}->CategoryList(UserID => $Self->{UserID})} },
            Size => 1,
            Name => 'ParentID',
            HTMLQuote => 1,
            LanguageTranslation => 0,
            RootElement => 1,
        );
        # build ValidID string
        $Frontend{ValidOption} = $Self->{LayoutObject}->OptionStrgHashRef(
            Data => {
                $Self->{DBObject}->GetTableData(
                    What => 'id, name',
                    Table => 'valid',
                    Valid => 0,
                )
            },
            Name => 'ValidID',
        );
        $Self->{LayoutObject}->Block(
            Name => 'Category',
            Data => { %Param, %Frontend },
        );

    }
    # ---------------------------------------------------------- #
    # category add action
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'CategoryAddAction') {

        # permission check
        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # check parameters
        my %ParamData = ();
        my @RequiredParams = qw(Name Comment);
        my @Params = qw(ParentID ValidID);
        foreach (@RequiredParams) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
            if(!$ParamData{$_}) {
                return $Self->{LayoutObject}->FatalError(Message => "Need $_");
            }
        }
        foreach (@Params) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
            if(!defined($ParamData{$_})) {
                return $Self->{LayoutObject}->FatalError(Message => "Need $_");
            }
        }

        # duplicate check
        if(!$Self->{FAQObject}->CategoryDuplicateCheck(Name=>$ParamData{Name},ParentID=>$ParamData{ParentID})) {
            if ($Self->{FAQObject}->CategoryAdd(%ParamData, UserID => $Self->{UserID}) ) {
                return $Self->{LayoutObject}->Redirect(OP => "Action=AgentFAQ&Subaction=Category");
            }
            else {
                return $Self->{LayoutObject}->ErrorScreen();
            }
        }
        else {
            $Self->{LayoutObject}->FatalError(Message => "Category '$ParamData{Name}' already exists!");
        }
    }
    # ---------------------------------------------------------- #
    # item add
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'Add') {

        # permission check

        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # check parameters

        # dtl
        $Frontend{LanguageOption} = $Self->{LayoutObject}->OptionStrgHashRef(
            Data => { $Self->{FAQObject}->LanguageList() },
            Name => 'LanguageID',
            LanguageTranslation => 0,
            Selected => $Self->{UserLanguage},
        );
        $Frontend{CategoryOption} = $Self->{LayoutObject}->AgentFAQCategoryListOption(
            CategoryList => { %{$Self->{FAQObject}->CategoryList(Valid => 1)} },
            Name => 'CategoryID',
            LanguageTranslation => 0,
        );
        $Frontend{StateOption} = $Self->{LayoutObject}->OptionStrgHashRef(
            Data => { $Self->{FAQObject}->StateList() },
            Name => 'StateID',
            Selected => 'internal (agent)',
        );

        $Self->{LayoutObject}->Block(
            Name => 'Add',
            Data => { %Param, %Frontend },
        );

        # fields
        $Self->_GetItemFields(
            ItemData => {}
        );

    }
    # ---------------------------------------------------------- #
    # item add action
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'AddAction') {

        @Params = qw(Title);

        # permission check
        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # check parameters
        my %ParamData = ();
        my @RequiredParams = qw(CategoryID Title);
        my @Params = qw(StateID LanguageID Field1 Field2 Field3 Field4 Field5 Field6 Keywords Title);
        foreach (@RequiredParams) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
            if(!$ParamData{$_}) {
                return $Self->{LayoutObject}->FatalError(Message => "Need $_!");
            }
        }
        foreach (@Params) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
        }

        # get submit attachment
        my %UploadStuff = $Self->{ParamObject}->GetUploadAll(
            Param => 'file_upload',
            Source => 'String',
        );

        # insert item
        my $ItemID = $Self->{FAQObject}->FAQAdd(
            %ParamData,
            %UploadStuff,
            UserID => $Self->{UserID}
        );

        if ($ItemID) {
            if (!defined($ParamData{ItemID}) && !$ParamData{ItemID}) {
                $ParamData{ItemID} = '';
            }
            return $Self->{LayoutObject}->Redirect(OP => "Action=$Self->{Action}&Subaction=View&ItemID=$ParamData{ItemID}");
        }
        else {
            return $Self->{LayoutObject}->ErrorScreen();
        }
    }
    # ---------------------------------------------------------- #
    # item update
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'Update') {

        @Params = qw(ItemID);

        # permission check
        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # check parameters
        my %ParamData = ();
        my @RequiredParams = qw(CategoryID ItemID);
        foreach (@RequiredParams) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
            if(!$ParamData{$_}) {
                return $Self->{LayoutObject}->FatalError(Message => "Need $_!");
            }
        }

        # db action
        my %ItemData = $Self->{FAQObject}->FAQGet(ItemID => $ParamData{ItemID}, UserID => $Self->{UserID});
        if (!%ItemData) {
            return $Self->{LayoutObject}->ErrorScreen();
        }

        # dtl
        $Frontend{LanguageOption} = $Self->{LayoutObject}->OptionStrgHashRef(
            Data => { $Self->{FAQObject}->LanguageList() },
            Name => 'LanguageID',
            LanguageTranslation => 0,
            SelectedID => $ItemData{LanguageID},
        );
        $Frontend{CategoryOption} = $Self->{LayoutObject}->AgentFAQCategoryListOption(
            CategoryList => { %{$Self->{FAQObject}->CategoryList()} },
            Name => 'CategoryID',
            LanguageTranslation => 0,
            SelectedID => $ItemData{CategoryID},
        );
        $Frontend{StateOption} = $Self->{LayoutObject}->OptionStrgHashRef(
            Data => { $Self->{FAQObject}->StateList() },
            Name => 'StateID',
            SelectedID => $ItemData{StateID},
        );
        $Self->{LayoutObject}->Block(
            Name => 'Update',
            Data => { %ItemData, %Frontend },
        );

        # fields
        $Self->_GetItemFields(
            ItemData => \%ItemData
        );

        # output
        $HeaderTitle = 'Edit';
        $Header = $Self->{LayoutObject}->Header(Type => $HeaderType, Title => $HeaderTitle);

    }
    # ---------------------------------------------------------- #
    # item update action
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'UpdateAction') {

        @Params = qw(ItemID Title CategoryID StateID LanguageID);

        # permission check

        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # check parameters
        my %ParamData = ();
        my @RequiredParams = qw(Title CategoryID);
        my @Params = qw(ItemID StateID LanguageID Field1 Field2 Field3 Field4 Field5 Field6 Keywords);
        foreach (@RequiredParams) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
            if(!$ParamData{$_}) {
                return $Self->{LayoutObject}->FatalError(Message => "Need $_!");
            }
        }
        foreach (@Params) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
        }

        # db action

        # get submit attachment
        my %UploadStuff = $Self->{ParamObject}->GetUploadAll(
            Param => 'file_upload',
            Source => 'String',
        );

        # update item
        if ($Self->{FAQObject}->FAQUpdate(%ParamData, %UploadStuff, UserID => $Self->{UserID})) {
            return $Self->{LayoutObject}->Redirect(OP => "Action=$Self->{Action}&Subaction=View&ItemID=$GetParam{ItemID}");
        }
        else {
            return $Self->{LayoutObject}->ErrorScreen();
        }
    }
    # ---------------------------------------------------------- #
    # delete item screen
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'Delete') {

        @Params = qw(ItemID);

        # permission check

        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # check parameters
        my %ParamData = ();
        my @RequiredParams = qw(CategoryID ItemID);
        foreach (@RequiredParams) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
            if(!$ParamData{$_}) {
                return $Self->{LayoutObject}->FatalError(Message => "Need $_!");
            }
        }
        foreach (@Params) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
        }

        # db action

        my %ItemData = $Self->{FAQObject}->FAQGet(ItemID => $ParamData{ItemID}, UserID => $Self->{UserID});
        if (!%ItemData) {
            return $Self->{LayoutObject}->ErrorScreen();
        }

        # dtl

        $Self->{LayoutObject}->Block(
            Name => 'Delete',
            Data => {%ItemData},
        );

        # output
        $HeaderTitle = 'Delete';
        $Header = $Self->{LayoutObject}->Header(Type => $HeaderType, Title => $HeaderTitle);
    }

    # ---------------------------------------------------------- #
    # item delete action
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'DeleteAction') {

        @Params = qw(ItemID);

        # permission check
        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }

        # check parameters
        my %ParamData = ();
        my @RequiredParams = qw(CategoryID ItemID);
        foreach (@RequiredParams) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
            if(!$ParamData{$_}) {
                return $Self->{LayoutObject}->FatalError(Message => "Need $_!");
            }
        }

        # db action
        my %ItemData = $Self->{FAQObject}->FAQGet(ItemID => $ParamData{ItemID}, UserID => $Self->{UserID});
        if (!%ItemData) {
            return $Self->{LayoutObject}->ErrorScreen();
        }

        if ($Self->{FAQObject}->FAQDelete(%ItemData)) {
            return $Self->{LayoutObject}->Redirect(OP => "Action=$Self->{Action}&Subaction=Explorer&CategoryID=$ParamData{CategoryID}");
        }
        else {
            return $Self->{LayoutObject}->ErrorScreen();
        }
    }

    # ---------------------------------------------------------- #
    # download item
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'Download') {
        @Params = qw(ItemID);

        # permission check
        if (!$Self->{AccessRw}) {
            return $Self->{LayoutObject}->NoPermission(WithHeader => 'yes');
        }
        # manage parameters
        foreach (@Params) {
            if(!($GetParam{$_} = $Self->{ParamObject}->GetParam(Param => $_))) {
                return $Self->{LayoutObject}->FatalError(Message => "Need $_");
            }
        }
        # db action
        my %ItemData = $Self->{FAQObject}->FAQGet(ItemID => $GetParam{ItemID}, UserID => $Self->{UserID});
        if (!%ItemData) {
            return $Self->{LayoutObject}->ErrorScreen();
        }

        if (%ItemData) {
            return $Self->{LayoutObject}->Attachment(%ItemData);
        }
        else {
            return $Self->{LayoutObject}->ErrorScreen();
        }
    }

    # ---------------------------------------------------------- #
    # search a item
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'Search') {
        $Self->GetItemSearch();
        $HeaderTitle = 'Search';
        $Header = $Self->{LayoutObject}->Header(
            Title => $HeaderTitle,
            Type => $HeaderType,
        );
        $Content = $Self->{LayoutObject}->Output(
            TemplateFile => 'FAQ',
            Data => {%Frontend , %GetParam }
        );
    }

    # ---------------------------------------------------------- #
    # item history
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'History') {

        # check parameters
        my %ParamData = ();
        my @RequiredParams = qw(CategoryID ItemID);
        foreach (@RequiredParams) {
            $ParamData{$_} = $Self->{ParamObject}->GetParam(Param => $_);
            if(!$ParamData{$_}) {
                return $Self->{LayoutObject}->FatalError(Message => "Need $_!");
            }
        }

        # db action
        # ********************************************************** #
        my %ItemData = $Self->{FAQObject}->FAQGet(ItemID => $ParamData{ItemID}, UserID => $Self->{UserID});
        if (!%ItemData) {
            return $Self->{LayoutObject}->ErrorScreen();
        }

        # dtl
        # ********************************************************** #
        $Self->{LayoutObject}->Block(
            Name => 'History',
            Data => { %Param, %ItemData },
        );

        $HeaderTitle = 'History';
        $Frontend{CssRow} = 'searchactive';
        my @History = @{$Self->{FAQObject}->FAQHistoryGet(ItemID => $ItemData{ItemID})};
        foreach my $Row (@History) {

            # css configuration
            if($Frontend{CssRow} eq 'searchpassive') {
                $Frontend{CssRow} = 'searchactive';
            }
            else {
                $Frontend{CssRow} = 'searchpassive';
            }

            $Frontend{Name} = $Row->{Name};
            $Frontend{Created} = $Row->{Created};

            $Self->{LayoutObject}->Block(
                Name => 'HistoryRow',
                Data => { %Frontend }
            );

        }

    }

    # ---------------------------------------------------------- #
    # system history
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'SystemHistory') {
        $Self->GetSystemHistory();
        $HeaderTitle = 'History';
    }
    # ---------------------------------------------------------- #
    # item print
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'Print' && $Self->{ParamObject}->GetParam(Param => 'ItemID')) {
        $Self->GetItemPrint(Links => 1);
        $Header = $Self->{LayoutObject}->PrintHeader(
            Title => $Self->{ItemData}{Subject}
        );
        $Navigation = ' ';
        $Content = $Self->{LayoutObject}->Output(
            TemplateFile => 'FAQ',
            Data => {%Frontend , %GetParam }
        );
        $Footer = $Self->{LayoutObject}->PrintFooter();
    }

    # ---------------------------------------------------------- #
    # explorer
    # ---------------------------------------------------------- #
    elsif ($Self->{Subaction} eq 'Explorer') {
        $Self->GetExplorer();
        $HeaderTitle = 'Explorer';
        $Header = $Self->{LayoutObject}->Header(
            Type => $HeaderType,
            Title => $HeaderTitle
        );
        $Content = $Self->{LayoutObject}->Output(
            TemplateFile => 'FAQ',
            Data => {%Frontend , %GetParam }
        );

    }

    # ---------------------------------------------------------- #
    # item view
    # ---------------------------------------------------------- #
    elsif ($Self->{ParamObject}->GetParam(Param => 'ItemID')) {
        if($Self->{LastFAQNav}) {
            $Self->GetItemSmallView();
        } else {
            $Self->GetItemView(Links => 1);
        }
        $HeaderTitle = $Self->{ItemData}{Number};
        $Header = $Self->{LayoutObject}->Header(
            Type => $HeaderType,
            Title => $HeaderTitle
        );
    }

    # ---------------------------------------------------------- #
    # redirect to explorer
    # ---------------------------------------------------------- #
    else {
        if (!defined($Param{Nav})) {
            $Param{Nav} = '';
        }
        return $Self->{LayoutObject}->Redirect(OP => "Action=$Self->{Action}&Subaction=Explorer&Nav=".$Param{Nav});
    }

    # DEFAULT OUTPUT
    $DefaultHeader = $Self->{LayoutObject}->Header(
        Type => $HeaderType,
        Title => $HeaderTitle
    );
    $DefaultNavigation = $Self->{LayoutObject}->NavigationBar();
    $DefaultContent = $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentFAQ',
        Data => {%Frontend , %GetParam }
    );
    $DefaultFooter = $Self->{LayoutObject}->Footer(Type => $FooterType);

    # OUTPUT
    $Output .= $Header || $DefaultHeader;
    $Output .= $Navigation || $DefaultNavigation;
    if(!$Notify) {
        foreach my $Notify (@{$Self->{Notify}}) {
            $Output .= $Self->{LayoutObject}->Notify(
                Priority => $Notify->[0],
                Info => $Notify->[1],
            );
        }
    }
    $Output .= $Content || $DefaultContent;
    $Output .= $Footer || $DefaultFooter;

    return $Output;
}

1;
