# --
# Kernel/System/GeneralCatalog.pm - all general catalog functions
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: GeneralCatalog.pm,v 1.43 2008/07/23 09:02:02 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::GeneralCatalog;

use strict;
use warnings;

use Kernel::System::Valid;
use Kernel::System::CheckItem;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.43 $) [1];

=head1 NAME

Kernel::System::GeneralCatalog - general catalog lib

=head1 SYNOPSIS

All general catalog functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::DB;
    use Kernel::System::GeneralCatalog;
    use Kernel::System::Log;
    use Kernel::System::Main;

    my $ConfigObject = Kernel::Config->new();
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $GeneralCatalogObject = Kernel::System::GeneralCatalog->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        MainObject   => $MainObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(DBObject ConfigObject LogObject MainObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }
    $Self->{ValidObject}     = Kernel::System::Valid->new( %{$Self} );
    $Self->{CheckItemObject} = Kernel::System::CheckItem->new( %{$Self} );

    return $Self;
}

=item ClassList()

return an array reference of all general catalog classes

    my $ArrayRef = $GeneralCatalogObject->ClassList();

=cut

sub ClassList {
    my ( $Self, %Param ) = @_;

    # ask database
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT DISTINCT(general_catalog_class) '
            . 'FROM general_catalog ORDER BY general_catalog_class',
    );

    # fetch the result
    my @ClassList;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @ClassList, $Row[0];
    }

    return \@ClassList;
}

=item ClassRename()

rename a general catalog class

    my $True = $GeneralCatalogObject->ClassRename(
        ClassOld => 'ITSM::ConfigItem::State',
        ClassNew => 'ITSM::ConfigItem::DeploymentState',
    );

=cut

sub ClassRename {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ClassOld ClassNew)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # cleanup given params
    for my $Argument (qw(ClassOld ClassNew)) {
        $Self->{CheckItemObject}->StringClean(
            StringRef         => \$Param{$Argument},
            RemoveAllNewlines => 1,
            RemoveAllTabs     => 1,
            RemoveAllSpaces   => 1,
        );
    }

    return 1 if $Param{ClassNew} eq $Param{ClassOld};

    # check if new class name already exists
    $Self->{DBObject}->Prepare(
        SQL   => 'SELECT id FROM general_catalog WHERE general_catalog_class = ?',
        Bind  => [ \$Param{ClassNew} ],
        Limit => 1,
    );

    # fetch the result
    my $AlreadyExists = 0;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $AlreadyExists = 1;
    }

    if ($AlreadyExists) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't rename class $Param{ClassOld}! New classname already exists."
        );
        return;
    }

    # reset cache
    delete $Self->{Cache}->{ItemGet}->{Class}->{ $Param{ClassOld} };
    delete $Self->{Cache}->{ItemGet}->{Class}->{ $Param{ClassNew} };
    delete $Self->{Cache}->{ItemGet}->{ItemID};
    delete $Self->{Cache}->{ItemList};

    # rename general catalog class
    return $Self->{DBObject}->Do(
        SQL => 'UPDATE general_catalog SET general_catalog_class = ? '
            . 'WHERE general_catalog_class = ?',
        Bind => [ \$Param{ClassNew}, \$Param{ClassOld} ],
    );
}

=item ItemList()

return a list as hash reference of one general catalog class

    my $HashRef = $GeneralCatalogObject->ItemList(
        Class         => 'ITSM::Service::Type',
        Functionality => 'active',               # (optional) string or array reference
        Valid         => 0,                      # (optional) default 1
    );

=cut

sub ItemList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Class} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Class!'
        );
        return;
    }

    # set default value
    if ( !defined $Param{Valid} ) {
        $Param{Valid} = 1;
    }

    # create sql string
    my $SQL  = 'SELECT id, name FROM general_catalog WHERE general_catalog_class = ? ';
    my @BIND = ( \$Param{Class} );

    # add valid string to sql string
    if ( $Param{Valid} ) {
        $SQL .= 'AND valid_id = 1 ';
    }

    # create cache key
    my $CacheKey = $Param{Class} . '####' . $Param{Valid} . '####';

    # add functionality to sql string
    if ( $Param{Functionality} ) {

        # create array reference, if functionality is give as sting
        if ( ref $Param{Functionality} ne 'ARRAY' ) {
            $Param{Functionality} = [ $Param{Functionality} ];
        }

        # create functionality string
        my $FunctionalityString = join q{, }, map {'?'} @{ $Param{Functionality} };

        # add functionality list to cache key
        $CacheKey .= join q{####}, map {$_} @{ $Param{Functionality} };

        # create and add bind parameters
        my @BindParams = map { \$_ } @{ $Param{Functionality} };
        push @BIND, @BindParams;

        # add functionality string to sql string
        $SQL .= "AND functionality IN ($FunctionalityString)";
    }

    # check if result is already cached
    return $Self->{Cache}->{ItemList}->{$CacheKey}
        if $Self->{Cache}->{ItemList}->{$CacheKey};

    # ask database
    $Self->{DBObject}->Prepare(
        SQL  => $SQL,
        Bind => \@BIND,
    );

    # fetch the result
    my %Data;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Data{ $Row[0] } = $Row[1];
    }

    # check item
    if ( !%Data ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Class not found in database!',
        );
        return;
    }

    # cache the result
    $Self->{Cache}->{ItemList}->{$CacheKey} = \%Data;

    return \%Data;
}

=item FunctionalityList()

return an array reference of all functionalities of a general catalog class

    my $ArrayRef = $GeneralCatalogObject->FunctionalityList(
        Class => 'ITSM::Service::Type',
    );

=cut

sub FunctionalityList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Class} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Class!'
        );
        return;
    }

    # ask database
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT DISTINCT(functionality) FROM general_catalog '
            . 'WHERE general_catalog_class = ? ORDER BY functionality',
        Bind => [ \$Param{Class} ],
    );

    # fetch the result
    my @FunctionalityList;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Row[0] ||= '';
        push @FunctionalityList, $Row[0];
    }

    return \@FunctionalityList;
}

=item ItemGet()

get a general catalog item

Return
    $ItemData{ItemID}
    $ItemData{Class}
    $ItemData{Name}
    $ItemData{Functionality}
    $ItemData{ValidID}
    $ItemData{Comment}
    $ItemData{CreateTime}
    $ItemData{CreateBy}
    $ItemData{ChangeTime}
    $ItemData{ChangeBy}

    my $ItemDataRef = $GeneralCatalogObject->ItemGet(
        ItemID  => 3,
    );

    or

    my $ItemDataRef = $GeneralCatalogObject->ItemGet(
        Class => 'ITSM::Service::Type',
        Name  => 'Item Name',
    );

=cut

sub ItemGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ItemID} && ( !$Param{Class} || !$Param{Name} ) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ItemID OR Class and Name!'
        );
        return;
    }

    # create sql string
    my $SQL = 'SELECT id, general_catalog_class, name, functionality, valid_id, comments, '
        . 'create_time, create_by, change_time, change_by FROM general_catalog WHERE ';
    my @BIND;

    # add options to sql string
    if ( $Param{Class} && $Param{Name} ) {

        # check if result is already cached
        return $Self->{Cache}->{ItemGet}->{Class}->{ $Param{Class} }->{ $Param{Name} }
            if $Self->{Cache}->{ItemGet}->{Class}->{ $Param{Class} }->{ $Param{Name} };

        # add class and name to sql string
        $SQL .= 'general_catalog_class = ? AND name = ?';
        push @BIND, ( \$Param{Class}, \$Param{Name} );
    }
    else {

        # check if result is already cached
        return $Self->{Cache}->{ItemGet}->{ItemID}->{ $Param{ItemID} }
            if $Self->{Cache}->{ItemGet}->{ItemID}->{ $Param{ItemID} };

        # add item id to sql string
        $SQL .= 'id = ?';
        push @BIND, \$Param{ItemID};
    }

    # ask database
    $Self->{DBObject}->Prepare(
        SQL   => $SQL,
        Bind  => \@BIND,
        Limit => 1,
    );

    # fetch the result
    my %ItemData;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $ItemData{ItemID}        = $Row[0];
        $ItemData{Class}         = $Row[1];
        $ItemData{Name}          = $Row[2];
        $ItemData{Functionality} = $Row[3] || '';
        $ItemData{ValidID}       = $Row[4];
        $ItemData{Comment}       = $Row[5] || '';
        $ItemData{CreateTime}    = $Row[6];
        $ItemData{CreateBy}      = $Row[7];
        $ItemData{ChangeTime}    = $Row[8];
        $ItemData{ChangeBy}      = $Row[9];
    }

    # check item
    if ( !$ItemData{ItemID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Item not found in database!',
        );
        return;
    }

    # cache the result
    $Self->{Cache}->{ItemGet}->{Class}->{ $ItemData{Class} }->{ $ItemData{Name} } = \%ItemData;
    $Self->{Cache}->{ItemGet}->{ItemID}->{ $ItemData{ItemID} } = \%ItemData;

    return \%ItemData;
}

=item ItemAdd()

add a new general catalog item

    my $ItemID = $GeneralCatalogObject->ItemAdd(
        Class         => 'ITSM::Service::Type',
        Name          => 'Item Name',
        Functionality => 'Func3',                # (optional)
        ValidID       => 1,
        Comment       => 'Comment',              # (optional)
        UserID        => 1,
    );

=cut

sub ItemAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Class Name ValidID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # set default values
    for my $Argument (qw(Functionality Comment)) {
        $Param{$Argument} ||= '';
    }

    # cleanup given params
    for my $Argument (qw(Class Functionality)) {
        $Self->{CheckItemObject}->StringClean(
            StringRef         => \$Param{$Argument},
            RemoveAllNewlines => 1,
            RemoveAllTabs     => 1,
            RemoveAllSpaces   => 1,
        );
    }
    for my $Argument (qw(Name Comment)) {
        $Self->{CheckItemObject}->StringClean(
            StringRef         => \$Param{$Argument},
            RemoveAllNewlines => 1,
            RemoveAllTabs     => 1,
        );
    }

    # find exiting item with same name
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT id FROM general_catalog '
            . 'WHERE general_catalog_class = ? AND name = ?',
        Bind => [ \$Param{Class}, \$Param{Name} ],
        Limit => 1,
    );

    # fetch the result
    my $NoAdd;
    while ( $Self->{DBObject}->FetchrowArray() ) {
        $NoAdd = 1;
    }

    # abort insert of new item, if item name already exists
    if ($NoAdd) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message =>
                "Can't add new item! General catalog item with same name already exists in this class.",
        );
        return;
    }

    # reset cache
    delete $Self->{Cache}->{ItemList};

    # insert new item
    return if !$Self->{DBObject}->Do(
        SQL => 'INSERT INTO general_catalog '
            . '(general_catalog_class, name, functionality, valid_id, comments, '
            . 'create_time, create_by, change_time, change_by) VALUES '
            . '(?, ?, ?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{Class},         \$Param{Name},
            \$Param{Functionality}, \$Param{ValidID},
            \$Param{Comment},       \$Param{UserID},
            \$Param{UserID},
        ],
    );

    # find id of new item
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT id FROM general_catalog '
            . 'WHERE general_catalog_class = ? AND name = ?',
        Bind => [ \$Param{Class}, \$Param{Name} ],
        Limit => 1,
    );

    # fetch the result
    my $ItemID;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $ItemID = $Row[0];
    }

    return $ItemID;
}

=item ItemUpdate()

update a existing general catalog item

    my $True = $GeneralCatalogObject->ItemUpdate(
        ItemID        => 123,
        Name          => 'Item Name',
        Functionality => 'Func3',      # (optional)
        ValidID       => 1,
        Comment       => 'Comment',    # (optional)
        UserID        => 1,
    );

=cut

sub ItemUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ItemID Name ValidID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # set default values
    for my $Argument (qw(Functionality Comment)) {
        $Param{$Argument} ||= '';
    }

    # cleanup given params
    for my $Argument (qw(Class Functionality)) {
        $Self->{CheckItemObject}->StringClean(
            StringRef         => \$Param{$Argument},
            RemoveAllNewlines => 1,
            RemoveAllTabs     => 1,
            RemoveAllSpaces   => 1,
        );
    }
    for my $Argument (qw(Name Comment)) {
        $Self->{CheckItemObject}->StringClean(
            StringRef         => \$Param{$Argument},
            RemoveAllNewlines => 1,
            RemoveAllTabs     => 1,
        );
    }

    # get class of item
    $Self->{DBObject}->Prepare(
        SQL   => 'SELECT general_catalog_class, functionality FROM general_catalog WHERE id = ?',
        Bind  => [ \$Param{ItemID} ],
        Limit => 1,
    );

    # fetch the result
    my $Class;
    my $OldFunctionality;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Class = $Row[0];
        $OldFunctionality = $Row[1] || '';
    }

    if ( !$Class ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't update item! General catalog item not found in this class.",
        );
        return;
    }

    # find exiting item with same name
    $Self->{DBObject}->Prepare(
        SQL   => 'SELECT id FROM general_catalog WHERE general_catalog_class = ? AND name = ?',
        Bind  => [ \$Class, \$Param{Name} ],
        Limit => 1,
    );

    # fetch the result
    my $Update = 1;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Param{ItemID} ne $Row[0] ) {
            $Update = 0;
        }
    }

    if ( !$Update ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message =>
                "Can't update item! General catalog item with same name already exists in this class.",
        );
        return;
    }

    # count the functionality
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT COUNT(functionality) FROM general_catalog '
            . 'WHERE general_catalog_class = ? AND functionality = ?',
        Bind => [ \$Class, \$OldFunctionality ],
        Limit => 1,
    );

    # fetch the result
    my $LastFunctionality = 1;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Row[0] > 1 || $Param{Functionality} eq $OldFunctionality ) {
            $LastFunctionality = 0;
        }
    }

    # abort update, if functionality is the last one
    if ($LastFunctionality) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message =>
                "Can't update item! The functionality of this item is the last in this class.",
        );
        return;
    }

    # reset cache
    delete $Self->{Cache}->{ItemGet}->{Class}->{$Class}->{ $Param{Name} };
    delete $Self->{Cache}->{ItemGet}->{ItemID}->{ $Param{ItemID} };
    delete $Self->{Cache}->{ItemList};

    return $Self->{DBObject}->Do(
        SQL => 'UPDATE general_catalog SET '
            . 'name = ?, functionality = ?,'
            . 'valid_id = ?, comments = ?, '
            . 'change_time = current_timestamp, change_by = ? '
            . 'WHERE id = ?',
        Bind => [
            \$Param{Name},    \$Param{Functionality},
            \$Param{ValidID}, \$Param{Comment},
            \$Param{UserID},  \$Param{ItemID},
        ],
    );
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

$Revision: 1.43 $ $Date: 2008/07/23 09:02:02 $

=cut
