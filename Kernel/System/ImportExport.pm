# --
# Kernel/System/ImportExport.pm - all import and export functions
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: ImportExport.pm,v 1.4 2008/01/24 16:33:56 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::ImportExport;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

=head1 NAME

Kernel::System::ImportExport - import, export lib

=head1 SYNOPSIS

All import and export functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create a object

    use Kernel::Config;
    use Kernel::System::Log;
    use Kernel::System::DB;
    use Kernel::System::Priority;

    my $ConfigObject = Kernel::Config->new();
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $ImportExportObject = Kernel::System::ImportExport->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject LogObject DBObject MainObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    return $Self;
}

=item ObjectList()

return a list of available objects as hash reference

    my $ObjectList = $ImportExportObject->ObjectList();

=cut

sub ObjectList {
    my ( $Self, %Param ) = @_;

    # get config
    my $ModuleList = $Self->{ConfigObject}->Get('ImportExport::ObjectBackendRegistration');

    return if !$ModuleList;
    return if ref $ModuleList ne 'HASH';

    # create the object list
    my $ObjectList = {};
    for my $Module (sort keys %{$ModuleList}) {
        $ObjectList->{$Module} = $ModuleList->{$Module}->{Name};
    }

    return $ObjectList;
}

=item FormatList()

return a list of available formats as hash reference

    my $FormatList = $ImportExportObject->FormatList();

=cut

sub FormatList {
    my ( $Self, %Param ) = @_;

    # get config
    my $ModuleList = $Self->{ConfigObject}->Get('ImportExport::FormatBackendRegistration');

    return if !$ModuleList;
    return if ref $ModuleList ne 'HASH';

    # create the format list
    my $FormatList = {};
    for my $Module (sort keys %{$ModuleList}) {
        $FormatList->{$Module} = $ModuleList->{$Module}->{Name};
    }

    return $FormatList;
}

=item TemplateList()

return a list of templates as array reference

    my $TemplateList = $ImportExportObject->TemplateList(
        Object   => 'Ticket',
        UserID  => 1,
    );

=cut

sub TemplateList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Object UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # quote
    $Param{Object} = $Self->{DBObject}->Quote( $Param{Object} );
    $Param{UserID} = $Self->{DBObject}->Quote( $Param{UserID}, 'Integer' );

    # ask database
    $Self->{DBObject}->Prepare(
        SQL => "SELECT id FROM importexport_template WHERE "
            . "im_ex_object = '$Param{Object}' "
            . "ORDER BY name",
    );

    # fetch the result
    my @TemplateList;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @TemplateList, $Row[0];
    }

    return \@TemplateList;
}

=item TemplateGet()

get a import export template

Return
    $TemplateData{TemplateID}
    $TemplateData{Object}
    $TemplateData{Format}
    $TemplateData{Name}
    $TemplateData{ValidID}
    $TemplateData{Comment}
    $TemplateData{CreateTime}
    $TemplateData{CreateBy}
    $TemplateData{ChangeTime}
    $TemplateData{ChangeBy}

    my $TemplateDataRef = $ImportExportObject->TemplateGet(
        TemplateID => 3,
        UserID     => 1,
    );

=cut

sub TemplateGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # quote
    $Param{TemplateID} = $Self->{DBObject}->Quote( $Param{TemplateID}, 'Integer' );

    # create sql string
    my $SQL = "SELECT id, im_ex_object, im_ex_format, name, valid_id, comments, "
        . "create_time, create_by, change_time, change_by FROM importexport_template WHERE "
        . "id = $Param{TemplateID}";

    # ask database
    $Self->{DBObject}->Prepare(
        SQL   => $SQL,
        Limit => 1,
    );

    # fetch the result
    my %TemplateData;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $TemplateData{TemplateID} = $Row[0];
        $TemplateData{Object}     = $Row[1];
        $TemplateData{Format}     = $Row[2];
        $TemplateData{Name}       = $Row[3];
        $TemplateData{ValidID}    = $Row[4];
        $TemplateData{Comment}    = $Row[5] || '';
        $TemplateData{CreateTime} = $Row[6];
        $TemplateData{CreateBy}   = $Row[7];
        $TemplateData{ChangeTime} = $Row[8];
        $TemplateData{ChangeBy}   = $Row[9];
    }

    return \%TemplateData;
}

=item TemplateAdd()

add a new import/export template

    my $TemplateID = $ImportExportObject->TemplateAdd(
        Object  => 'Ticket',
        Format  => 'CSV',
        Name    => 'Template Name',
        ValidID => 1,
        Comment => 'Comment',       # (optional)
        UserID  => 1,
    );

=cut

sub TemplateAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Object Format Name ValidID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # cleanup template name
    for my $Element (qw(Object Format Name)) {
        $Param{$Element} =~ s{ [\n\r\f] }{}xmsg;    # RemoveAllNewlines
        $Param{$Element} =~ s{ \t       }{}xmsg;    # RemoveAllTabs
        $Param{$Element} =~ s{ \A \s+   }{}xmsg;    # TrimLeft
        $Param{$Element} =~ s{ \s+ \z   }{}xmsg;    # TrimRight
    }

    # set default values
    $Param{Comment} = $Param{Comment} || '';

    # quote
    for my $Argument (qw(Object Format Name Functionality Comment)) {
        $Param{$Argument} = $Self->{DBObject}->Quote( $Param{$Argument} );
    }
    for my $Argument (qw(ValidID UserID)) {
        $Param{$Argument} = $Self->{DBObject}->Quote( $Param{$Argument}, 'Integer' );
    }

    # find exiting template with same name
    $Self->{DBObject}->Prepare(
        SQL => "SELECT id FROM importexport_template "
            . "WHERE im_ex_object = '$Param{Object}' AND name = '$Param{Name}'",
        Limit => 1,
    );

    # fetch the result
    my $NoAdd;
    while ( $Self->{DBObject}->FetchrowArray() ) {
        $NoAdd = 1;
    }

    # abort insert of new template, if template name already exists
    if ($NoAdd) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message =>
                "Can't add new template! Template with same name already exists in this object.",
        );
        return;
    }

    # insert new template
    return if !$Self->{DBObject}->Do(
        SQL => "INSERT INTO importexport_template "
            . "(im_ex_object, im_ex_format, name, valid_id, comments, "
            . "create_time, create_by, change_time, change_by) VALUES "
            . "('$Param{Object}', '$Param{Format}', "
            . "'$Param{Name}', $Param{ValidID}, '$Param{Comment}', "
            . "current_timestamp, $Param{UserID}, current_timestamp, $Param{UserID})"
    );

    # find id of new template
    $Self->{DBObject}->Prepare(
        SQL => "SELECT id FROM importexport_template "
            . "WHERE im_ex_object = '$Param{Object}' AND name = '$Param{Name}'",
        Limit => 1,
    );

    # fetch the result
    my $TemplateID;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $TemplateID = $Row[0];
    }

    return $TemplateID;
}

=item TemplateUpdate()

update a existing import/export template

    my $True = $ImportExportObject->TemplateUpdate(
        TemplateID => 123,
        Name       => 'Template Name',
        ValidID    => 1,
        Comment    => 'Comment',        # (optional)
        UserID     => 1,
    );

=cut

sub TemplateUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID Name ValidID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # cleanup template name
    $Param{Name} =~ s{ [\n\r\f] }{}xmsg;    # RemoveAllNewlines
    $Param{Name} =~ s{ \t       }{}xmsg;    # RemoveAllTabs
    $Param{Name} =~ s{ \A \s+   }{}xmsg;    # TrimLeft
    $Param{Name} =~ s{ \s+ \z   }{}xmsg;    # TrimRight

    # set default values
    $Param{Comment} = $Param{Comment} || '';

    # quote
    for my $Argument (qw(Name Comment)) {
        $Param{$Argument} = $Self->{DBObject}->Quote( $Param{$Argument} );
    }
    for my $Argument (qw(TemplateID ValidID UserID)) {
        $Param{$Argument} = $Self->{DBObject}->Quote( $Param{$Argument}, 'Integer' );
    }

    # get the object of this template id
    $Self->{DBObject}->Prepare(
        SQL => "SELECT im_ex_object FROM importexport_template "
            . "WHERE id = '$Param{TemplateID}'",
        Limit => 1,
    );

    # fetch the result
    my $Object;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Object = $Row[0];
    }

    if ( !$Object ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message =>
                "Can't update template! I can't find the template.",
        );
        return;
    }

    # find exiting template with same name
    $Self->{DBObject}->Prepare(
        SQL => "SELECT id FROM importexport_template "
            . "WHERE im_ex_object = '$Object' AND name = '$Param{Name}'",
        Limit => 1,
    );

    # fetch the result
    my $Update = 1;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Param{TemplateID} ne $Row[0] ) {
            $Update = 0;
        }
    }

    if ( !$Update ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message =>
                "Can't update template! Template with same name already exists in this object.",
        );
        return;
    }

    # update template
    return $Self->{DBObject}->Do(
        SQL => "UPDATE importexport_template SET name = '$Param{Name}',"
            . "valid_id = $Param{ValidID}, comments = '$Param{Comment}', "
            . "change_time = current_timestamp, change_by = $Param{UserID} "
            . "WHERE id = $Param{TemplateID}",
    );
}

=item TemplateDelete()

delete existing import/export templates

    my $True = $ImportExportObject->TemplateDelete(
        TemplateID => 123,
        UserID => 1,
    );

    or

    my $True = $ImportExportObject->TemplateDelete(
        TemplateID => [1,44,166,5],
        UserID => 1,
    );

=cut

sub TemplateDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    if ( !ref $Param{TemplateID} ) {
        $Param{TemplateID} = [ $Param{TemplateID} ];
    }
    elsif ( ref $Param{TemplateID} ne 'ARRAY' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'TemplateID must be an array reference or a string!',
        );
        return;
    }

    # quote
    for my $TemplateID ( @{ $Param{TemplateID} } ) {
        $TemplateID = $Self->{DBObject}->Quote( $TemplateID, 'Integer' );
    }

    # create the template id string
    my $TemplateIDString = join ',', @{ $Param{TemplateID} };

    # delete templates
    return $Self->{DBObject}->Do(
        SQL => "DELETE FROM importexport_template WHERE id IN ( $TemplateIDString )",
    );
}

=item _LoadBackend()

to load a import/export backend module

    $HashRef = $ImportExportObject->_LoadBackend(
        Module => 'Kernel::System::ImportExport::ObjectBackend::Ticket',
    );

=cut

sub _LoadBackend {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Module} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Module!'
        );
        return;
    }

    # check if object is already cached
    return $Self->{Cache}->{ $Param{Module} } if $Self->{Cache}->{ $Param{Module} };

    # load object backend module
    if ( !$Self->{MainObject}->Require( $Param{Module} ) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't load backend module $Param{Module}!"
        );
        return;
    }

    # create new instance
    my $BackendObject = $Param{Module}->new( %{$Self}, %Param );

    if (!$BackendObject) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't create a new instance of backend module $Param{Module}!",
        );
        return;
    }

    # cache the object
    $Self->{Cache}->{ $Param{Module} } = $BackendObject;

    return $BackendObject;
}

1;

=back

=head1 TERMS AND CONDITIONS

This Software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.

=cut

=head1 VERSION

$Revision: 1.4 $ $Date: 2008/01/24 16:33:56 $

=cut
