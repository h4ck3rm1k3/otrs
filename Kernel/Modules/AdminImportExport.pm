# --
# Kernel/Modules/AdminImportExport.pm - admin frontend of import export module
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: AdminImportExport.pm,v 1.7 2008/01/31 19:28:47 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Modules::AdminImportExport;

use strict;
use warnings;

use Kernel::System::ImportExport;
use Kernel::System::Valid;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = { %Param };
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject ParamObject LogObject LayoutObject)) {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }
    $Self->{ImportExportObject} = Kernel::System::ImportExport->new( %{$Self} );
    $Self->{ValidObject}        = Kernel::System::Valid->new( %{$Self} );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # ------------------------------------------------------------ #
    # template edit (common)
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'TemplateEdit1' ) {

        # get object list
        my $ObjectList = $Self->{ImportExportObject}->ObjectList();

        return $Self->{LayoutObject}->FatalError( Message => 'No object backend found!' )
            if !$ObjectList;

        # get format list
        my $FormatList = $Self->{ImportExportObject}->FormatList();

        return $Self->{LayoutObject}->FatalError( Message => 'No format backend found!' )
            if !$FormatList;

        # get params
        my $TemplateData = {};
        $TemplateData->{TemplateID} = $Self->{ParamObject}->GetParam( Param => 'TemplateID' );
        if ( $TemplateData->{TemplateID} eq 'NEW' ) {

            # get object and format
            $TemplateData->{Object} = $Self->{ParamObject}->GetParam( Param => 'Object' );
            $TemplateData->{Format} = $Self->{ParamObject}->GetParam( Param => 'Format' );

            # redirect to overview
            return $Self->{LayoutObject}->Redirect( OP => "Action=$Self->{Action}" )
                if !$TemplateData->{Object} || !$TemplateData->{Format};
        }
        else {

            # get template data
            $TemplateData = $Self->{ImportExportObject}->TemplateGet(
                TemplateID => $TemplateData->{TemplateID},
                UserID     => $Self->{UserID},
            );
        }

        # generate ObjectOptionStrg
        my $ObjectOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ObjectList,
            Name         => 'Object',
            SelectedID   => $TemplateData->{Object},
            PossibleNone => 1,
            Translation  => 1,
        );

        # generate FormatOptionStrg
        my $FormatOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $FormatList,
            Name         => 'Format',
            SelectedID   => $TemplateData->{Format},
            PossibleNone => 1,
            Translation  => 1,
        );

        # output overview
        $Self->{LayoutObject}->Block(
            Name => 'Overview',
            Data => {
                %Param,
                ObjectOptionStrg => $ObjectOptionStrg,
                FormatOptionStrg => $FormatOptionStrg,
            },
        );

        # generate ValidOptionStrg
        my %ValidList        = $Self->{ValidObject}->ValidList();
        my %ValidListReverse = reverse %ValidList;
        my $ValidOptionStrg  = $Self->{LayoutObject}->BuildSelection(
            Name       => 'ValidID',
            Data       => \%ValidList,
            SelectedID => $TemplateData->{ValidID} || $ValidListReverse{valid},
        );

        # output list
        $Self->{LayoutObject}->Block(
            Name => 'TemplateEdit1',
            Data => {
                %{$TemplateData},
                ObjectName      => $ObjectList->{ $TemplateData->{Object} },
                FormatName      => $FormatList->{ $TemplateData->{Format} },
                ValidOptionStrg => $ValidOptionStrg,
            },
        );

        # output header and navbar
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # start template output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminImportExport',
            Data         => \%Param,
        );

        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # template save
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'TemplateSave1' ) {
        my $TemplateData = {};

        # get params
        for my $Param (qw(TemplateID Object Format Name ValidID Comment)) {
            $TemplateData->{$Param} = $Self->{ParamObject}->GetParam( Param => $Param ) || '';
        }

        my %Submit = (
            SubmitNext => 'TemplateEdit2',
            Reload     => 'TemplateEdit1',
        );

        # get submit action
        my $Subaction = $Submit{Reload};

        PARAM:
        for my $SubmitKey ( keys %Submit ) {
            next PARAM if !$Self->{ParamObject}->GetParam( Param => $SubmitKey );

            $Subaction = $Submit{$SubmitKey};
            last PARAM;
        }

        # save to database
        my $Success;
        if ( $TemplateData->{TemplateID} eq 'NEW' ) {
            $TemplateData->{TemplateID} = $Self->{ImportExportObject}->TemplateAdd(
                %{$TemplateData},
                UserID => $Self->{UserID},
            );

            $Success = $TemplateData->{TemplateID};
        }
        else {
            $Success = $Self->{ImportExportObject}->TemplateUpdate(
                %{$TemplateData},
                UserID => $Self->{UserID},
            );
        }

        return $Self->{LayoutObject}->FatalError( Message => "Can't insert/update template!" )
            if !$Success;

        # redirect to overview object list
        return $Self->{LayoutObject}->Redirect(
            OP =>
                "Action=$Self->{Action}&Subaction=TemplateEdit2&TemplateID=$TemplateData->{TemplateID}",
        );
    }

    # ------------------------------------------------------------ #
    # template edit (object)
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'TemplateEdit2' ) {

        # get object list
        my $ObjectList = $Self->{ImportExportObject}->ObjectList();

        return $Self->{LayoutObject}->FatalError( Message => 'No object backend found!' )
            if !$ObjectList;

        # get format list
        my $FormatList = $Self->{ImportExportObject}->FormatList();

        return $Self->{LayoutObject}->FatalError( Message => 'No format backend found!' )
            if !$FormatList;

        # get params
        my $TemplateData = {};
        $TemplateData->{TemplateID} = $Self->{ParamObject}->GetParam( Param => 'TemplateID' );

        # get template data
        $TemplateData = $Self->{ImportExportObject}->TemplateGet(
            TemplateID => $TemplateData->{TemplateID},
            UserID     => $Self->{UserID},
        );

        # generate ObjectOptionStrg
        my $ObjectOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ObjectList,
            Name         => 'Object',
            SelectedID   => $TemplateData->{Object},
            PossibleNone => 1,
            Translation  => 1,
        );

        # generate FormatOptionStrg
        my $FormatOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $FormatList,
            Name         => 'Format',
            SelectedID   => $TemplateData->{Format},
            PossibleNone => 1,
            Translation  => 1,
        );

        # output overview
        $Self->{LayoutObject}->Block(
            Name => 'Overview',
            Data => {
                %Param,
                ObjectOptionStrg => $ObjectOptionStrg,
                FormatOptionStrg => $FormatOptionStrg,
            },
        );

        # output list
        $Self->{LayoutObject}->Block(
            Name => 'TemplateEdit2',
            Data => {
                %{$TemplateData},
                ObjectName => $ObjectList->{ $TemplateData->{Object} },
            },
        );

        # get object attributes
        my $ObjectAttributeList = $Self->{ImportExportObject}->ObjectAttributesGet(
            TemplateID => $TemplateData->{TemplateID},
            UserID     => $Self->{UserID},
        );

        # get object data
        my $ObjectData = $Self->{ImportExportObject}->ObjectDataGet(
            TemplateID => $TemplateData->{TemplateID},
            UserID     => $Self->{UserID},
        );

        # output object attributes
        for my $Item ( @{$ObjectAttributeList} ) {

            # create form input
            my $InputString = $Self->{LayoutObject}->ImportExportFormInputCreate(
                Item  => $Item,
                Value => $ObjectData->{ $Item->{Key} },
            );

            # output attribute row
            $Self->{LayoutObject}->Block(
                Name => 'TemplateEdit2Row',
                Data => {
                    Name => $Item->{Name} || '',
                    InputStrg => $InputString,
                },
            );
        }

        # output header and navbar
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # start template output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminImportExport',
            Data         => \%Param,
        );

        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # template save (object)
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'TemplateSave2' ) {

        # get template id
        my $TemplateID = $Self->{ParamObject}->GetParam( Param => 'TemplateID' );

        my %Submit = (
            SubmitNext => 'TemplateEdit3',
            SubmitBack => 'TemplateEdit1',
            Reload     => 'TemplateEdit2',
        );

        # get submit action
        my $Subaction = $Submit{Reload};

        PARAM:
        for my $SubmitKey ( keys %Submit ) {
            next PARAM if !$Self->{ParamObject}->GetParam( Param => $SubmitKey );

            $Subaction = $Submit{$SubmitKey};
            last PARAM;
        }

        # get object attributes
        my $ObjectAttributeList = $Self->{ImportExportObject}->ObjectAttributesGet(
            TemplateID => $TemplateID,
            UserID     => $Self->{UserID},
        );

        # get attribute values from form
        my %AttributeValues;
        for my $Item ( @{$ObjectAttributeList} ) {

            # get form data
            $AttributeValues{ $Item->{Key} } = $Self->{LayoutObject}->ImportExportFormDataGet(
                Item => $Item,
            );
        }

        $Self->{ImportExportObject}->ObjectDataSave(
            TemplateID => $TemplateID,
            ObjectData => \%AttributeValues,
            UserID     => $Self->{UserID},
        );

        return $Self->{LayoutObject}->Redirect(
            OP => "Action=$Self->{Action}&Subaction=$Subaction&TemplateID=$TemplateID",
        );
    }

    # ------------------------------------------------------------ #
    # template edit (format)
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'TemplateEdit3' ) {

        # get object list
        my $ObjectList = $Self->{ImportExportObject}->ObjectList();

        return $Self->{LayoutObject}->FatalError( Message => 'No object backend found!' )
            if !$ObjectList;

        # get format list
        my $FormatList = $Self->{ImportExportObject}->FormatList();

        return $Self->{LayoutObject}->FatalError( Message => 'No format backend found!' )
            if !$FormatList;

        # get params
        my $TemplateData = {};
        $TemplateData->{TemplateID} = $Self->{ParamObject}->GetParam( Param => 'TemplateID' );

        # get template data
        $TemplateData = $Self->{ImportExportObject}->TemplateGet(
            TemplateID => $TemplateData->{TemplateID},
            UserID     => $Self->{UserID},
        );

        # generate ObjectOptionStrg
        my $ObjectOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ObjectList,
            Name         => 'Object',
            SelectedID   => $TemplateData->{Object},
            PossibleNone => 1,
            Translation  => 1,
        );

        # generate FormatOptionStrg
        my $FormatOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $FormatList,
            Name         => 'Format',
            SelectedID   => $TemplateData->{Format},
            PossibleNone => 1,
            Translation  => 1,
        );

        # output overview
        $Self->{LayoutObject}->Block(
            Name => 'Overview',
            Data => {
                %Param,
                ObjectOptionStrg => $ObjectOptionStrg,
                FormatOptionStrg => $FormatOptionStrg,
            },
        );

        # output list
        $Self->{LayoutObject}->Block(
            Name => 'TemplateEdit3',
            Data => {
                %{$TemplateData},
                FormatName => $FormatList->{ $TemplateData->{Format} },
            },
        );

        # get format attributes
        my $FormatAttributeList = $Self->{ImportExportObject}->FormatAttributesGet(
            TemplateID => $TemplateData->{TemplateID},
            UserID     => $Self->{UserID},
        );

        # get format data
        my $FormatData = $Self->{ImportExportObject}->FormatDataGet(
            TemplateID => $TemplateData->{TemplateID},
            UserID     => $Self->{UserID},
        );

        # output format attributes
        for my $Item ( @{$FormatAttributeList} ) {

            # create form input
            my $InputString = $Self->{LayoutObject}->ImportExportFormInputCreate(
                Item  => $Item,
                Value => $FormatData->{ $Item->{Key} },
            );

            # output attribute row
            $Self->{LayoutObject}->Block(
                Name => 'TemplateEdit3Row',
                Data => {
                    Name      => $Item->{Name} || '',
                    InputStrg => $InputString,
                },
            );
        }

        # output header and navbar
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # start template output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminImportExport',
            Data         => \%Param,
        );

        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # template save (format)
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'TemplateSave3' ) {

        # get template id
        my $TemplateID = $Self->{ParamObject}->GetParam( Param => 'TemplateID' );

        my %Submit = (
            SubmitNext => 'TemplateEdit4',
            SubmitBack => 'TemplateEdit2',
            Reload     => 'TemplateEdit1',
        );

        # get submit action
        my $Subaction = $Submit{Reload};

        PARAM:
        for my $SubmitKey ( keys %Submit ) {
            next PARAM if !$Self->{ParamObject}->GetParam( Param => $SubmitKey );

            $Subaction = $Submit{$SubmitKey};
            last PARAM;
        }

        # get format attributes
        my $FormatAttributeList = $Self->{ImportExportObject}->FormatAttributesGet(
            TemplateID => $TemplateID,
            UserID     => $Self->{UserID},
        );

        # get attribute values from form
        my %AttributeValues;
        for my $Item ( @{$FormatAttributeList} ) {

            # get form data
            $AttributeValues{ $Item->{Key} } = $Self->{LayoutObject}->ImportExportFormDataGet(
                Item => $Item,
            );
        }

        $Self->{ImportExportObject}->FormatDataSave(
            TemplateID => $TemplateID,
            FormatData => \%AttributeValues,
            UserID     => $Self->{UserID},
        );

        return $Self->{LayoutObject}->Redirect(
            OP => "Action=$Self->{Action}&Subaction=$Subaction&TemplateID=$TemplateID",
        );
    }

    # ------------------------------------------------------------ #
    # template delete
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'TemplateDelete' ) {

        # get template id
        my $TemplateID = $Self->{ParamObject}->GetParam( Param => 'TemplateID' );

        # delete template from database
        $Self->{ImportExportObject}->TemplateDelete(
            TemplateID => $TemplateID,
            UserID     => $Self->{UserID},
        );

        # redirect to overview
        return $Self->{LayoutObject}->Redirect( OP => "Action=$Self->{Action}" );
    }

    # ------------------------------------------------------------ #
    # overview
    # ------------------------------------------------------------ #
    else {

        # get object list
        my $ObjectList = $Self->{ImportExportObject}->ObjectList();

        return $Self->{LayoutObject}->FatalError( Message => 'No object backend found!' )
            if !$ObjectList;

        # get format list
        my $FormatList = $Self->{ImportExportObject}->FormatList();

        return $Self->{LayoutObject}->FatalError( Message => 'No format backend found!' )
            if !$FormatList;

        # generate ObjectOptionStrg
        my $ObjectOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ObjectList,
            Name         => 'Object',
            PossibleNone => 1,
            Translation  => 1,
        );

        # generate FormatOptionStrg
        my $FormatOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $FormatList,
            Name         => 'Format',
            PossibleNone => 1,
            Translation  => 1,
        );

        # output overview
        $Self->{LayoutObject}->Block(
            Name => 'Overview',
            Data => {
                %Param,
                ObjectOptionStrg => $ObjectOptionStrg,
                FormatOptionStrg => $FormatOptionStrg,
            },
        );

        # get valid list
        my %ValidList = $Self->{ValidObject}->ValidList();

        my $EmptyDatabase = 1;

        CLASS:
        for my $Object ( sort { $ObjectList->{$a} cmp $ObjectList->{$b} } keys %{$ObjectList} ) {

            # get template list
            my $TemplateList = $Self->{ImportExportObject}->TemplateList(
                Object => $Object,
                UserID => $Self->{UserID},
            );

            next CLASS if !$TemplateList;
            next CLASS if ref $TemplateList ne 'ARRAY';
            next CLASS if !@{$TemplateList};

            $EmptyDatabase = 0;

            # output list
            $Self->{LayoutObject}->Block(
                Name => 'OverviewList',
                Data => {
                    ObjectName => $ObjectList->{$Object},
                },
            );

            my $CssClass = '';
            for my $TemplateID ( @{$TemplateList} ) {

                # set output object
                $CssClass = $CssClass eq 'searchactive' ? 'searchpassive' : 'searchactive';

                # get template data
                my $TemplateData = $Self->{ImportExportObject}->TemplateGet(
                    TemplateID => $TemplateID,
                    UserID     => $Self->{UserID},
                );

                # output row
                $Self->{LayoutObject}->Block(
                    Name => 'OverviewListRow',
                    Data => {
                        %{$TemplateData},
                        FormatName => $FormatList->{ $TemplateData->{Format} },
                        CssClass   => $CssClass,
                        Valid      => $ValidList{ $TemplateData->{ValidID} },
                    },
                );
            }
        }

        # output an empty list
        if ($EmptyDatabase) {

            # output list
            $Self->{LayoutObject}->Block(
                Name => 'OverviewList',
                Data => {
                    ObjectName => 'Template',
                },
            );
        }

        # output header and navbar
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # start template output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminImportExport',
            Data         => \%Param,
        );

        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }
}

1;