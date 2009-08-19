# --
# Kernel/System/ITSMConfigItem/History.pm - module for ITSMConfigItem.pm with history functions
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: History.pm,v 1.7 2009/08/19 22:32:16 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::History;

use strict;
use warnings;

use Kernel::System::User;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

=head1 NAME

Kernel::System::ITSMConfigItem::History - module for ITSMConfigItem.pm with history functions

=head1 SYNOPSIS

All history functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::DB;
    use Kernel::System::Main;
    use Kernel::System::Time;
    use Kernel::System::ITSMConfigItem;
    use Kernel::System::ITSMConfigItem::History;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $TimeObject = Kernel::System::Time->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $ConfigItemObject = Kernel::System::ITSMConfigItem->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        MainObject   => $MainObject,
    );
    my $HistoryObject = Kernel::System::ITSMConfigItem::History->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        EncodeObject => $EncodeObject,
        MainObject   => $MainObject,
        TimeObject   => $TimeObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(DBObject ConfigObject LogObject MainObject EncodeObject TimeObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    # create user object that is needed for more details of the created_by column
    $Self->{UserObject} = Kernel::System::User->new( %{$Self} );

    return $Self;
}

=item HistoryGet()

Returns an array reference with all history entries for the given config item.
Each array element is a hash reference representing one history entry.

These hash references contain information about:

    $Info{HistoryEntryID}
    $Info{ConfigItemID}
    $Info{HistoryType}
    $Info{HistoryTypeID}
    $Info{Comment}
    $Info{CreatedBy}
    $Info{CreatedTime}
    $Info{UserID}
    $Info{UserLogin}
    $Info{UserLastname}
    $Info{UserFirstname}

    my $Info = $HistoryObject->HistoryGet(
        ConfigItemID => 1234,
    );

=cut

sub HistoryGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ConfigItemID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # if cached result exists, return that result
    return $Self->{Cache}->{CIVersions}->{ $Param{ConfigItemID} }
        if $Self->{Cache}->{CIVersions}->{ $Param{ConfigItemID} };

    # fetch some data from history for given config item
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT ch.id, ch.configitem_id, ch.content, ch.type_id, '
            . 'ch.create_by, ch.create_time, cht.name '
            . 'FROM configitem_history ch, configitem_history_type cht '
            . 'WHERE ch.type_id = cht.id AND ch.configitem_id = ? '
            . 'ORDER BY ch.id',
        Bind => [ \$Param{ConfigItemID} ],
    );

    # save data from history in array
    my @Entries;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        my %Tmp = (
            HistoryEntryID => $Row[0],
            ConfigItemID   => $Row[1],
            Comment        => $Row[2],
            HistoryTypeID  => $Row[3],
            CreateBy       => $Row[4],
            CreateTime     => $Row[5],
            HistoryType    => $Row[6],
        );

        push @Entries, \%Tmp;
    }

    # get more information about user who created history entries
    for my $Entry (@Entries) {

        # get user information
        my %UserInfo = $Self->{UserObject}->GetUserData(
            UserID => $Entry->{CreateBy},
            Cached => 1,
        );

        # save additional information for history entry
        $Entry->{UserID}        = $UserInfo{UserID};
        $Entry->{UserLogin}     = $UserInfo{UserLogin};
        $Entry->{UserFirstname} = $UserInfo{UserFirstname};
        $Entry->{UserLastname}  = $UserInfo{UserLastname};
    }

    # save result in cache
    $Self->{Cache}->{CIVersions}->{ $Param{ConfigItemID} } = \@Entries;

    return \@Entries;
}

=item HistoryEntryGet()

Returns a hash reference with information about a single history entry.
The hash reference contain information about:

    $Info{HistoryEntryID}
    $Info{ConfigItemID}
    $Info{HistoryType}
    $Info{HistoryTypeID}
    $Info{Comment}
    $Info{CreateBy}
    $Info{CreateTime}
    $Info{UserID}
    $Info{UserLogin}
    $Info{UserLastname}
    $Info{UserFirstname}

    my $Info = $HistoryObject->HistoryEntryGet(
        HistoryEntryID => 1234,
    );

=cut

sub HistoryEntryGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(HistoryEntryID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # if cached result exists, return that result
    if ( $Self->{Cache}->{Versions}->{ $Param{HistoryEntryID} } ) {
        my ($ConfigItemID) = keys %{ $Self->{Cache}->{Versions}->{ $Param{HistoryEntryID} } };
        return $Self->{Cache}->{Versions}->{ $Param{HistoryEntryID} }->{$ConfigItemID};
    }

    # fetch a single entry from history
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT ch.id, ch.configitem_id, ch.content, ch.type_id, '
            . 'ch.create_by, ch.create_time, cht.name '
            . 'FROM configitem_history ch, configitem_history_type cht '
            . 'WHERE ch.type_id = cht.id AND ch.id = ?',
        Bind  => [ \$Param{HistoryEntryID} ],
        Limit => 1,
    );

    my %Entry;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        %Entry = (
            HistoryEntryID => $Row[0],
            ConfigItemID   => $Row[1],
            Comment        => $Row[2],
            HistoryTypeID  => $Row[3],
            CreateBy       => $Row[4],
            CreateTime     => $Row[5],
            HistoryType    => $Row[6],
        );
    }

    # get user data for this entry
    my %UserInfo = $Self->{UserObject}->GetUserData(
        UserID => $Entry{CreateBy},
        Cached => 1,
    );

    $Entry{UserID}        = $UserInfo{UserID};
    $Entry{UserLogin}     = $UserInfo{UserLogin};
    $Entry{UserFirstname} = $UserInfo{UserFirstname};
    $Entry{UserLastname}  = $UserInfo{UserLastname};

    $Self->{Cache}->{Versions}->{ $Param{HistoryEntryID} }->{ $Entry{ConfigItemID} } = \%Entry;

    return \%Entry;
}

=item HistoryAdd()

Adds a single history entry to the history.

    $HistoryObject->HistoryAdd(
        ConfigItemID  => 1234,
        HistoryType   => 'NewConfigItem', # either HistoryType or HistoryTypeID is needed
        HistoryTypeID => 1,
        UserID        => 1,
        Comment       => 'Any useful information',
    );

=cut

sub HistoryAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ConfigItemID UserID Comment)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    if ( !( $Param{HistoryType} || $Param{HistoryTypeID} ) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need HistoryType or HistoryTypeID!',
        );
        return;
    }

    # get history type id from history type if history type is given.
    if ( $Param{HistoryType} ) {
        my $Id = $Self->HistoryTypeLookup( HistoryType => $Param{HistoryType} );

        if ( !$Id ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => 'Invalid history type given!',
            );
            return;
        }

        $Param{HistoryTypeID} = $Id;
    }

    # if history type is given
    elsif ( $Param{HistoryTypeID} ) {
        my $Name = $Self->HistoryTypeLookup( HistoryTypeID => $Param{HistoryTypeID} );

        if ( !$Name ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => 'Invalid history type id given!',
            );
            return;
        }
    }

    # check if given config item id points to an existing config item id
    if ( $Param{ConfigItemID} ) {
        my $Id = $Self->ConfigItemLookup( ConfigItemID => $Param{ConfigItemID} );

        if ( !$Id ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => 'Invalid config item id given!',
            );
            return;
        }
    }

    # delete cached results
    delete $Self->{Cache}->{CIVersions}->{ $Param{ConfigItemID} };

    # insert history entry
    return $Self->{DBObject}->Do(
        SQL => 'INSERT INTO configitem_history ( configitem_id, content, create_by, '
            . 'create_time, type_id ) VALUES ( ?, ?, ?, current_timestamp, ? )',
        Bind => [
            \$Param{ConfigItemID},
            \$Param{Comment},
            \$Param{UserID},
            \$Param{HistoryTypeID},
        ],
    );
}

=item HistoryDelete()

Deletes complete history for a given config item

    $HistoryObject->HistoryDelete(
        ConfigItemID => 123,
    );

=cut

sub HistoryDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ConfigItemID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # delete cached results
    delete $Self->{Cache}->{CIVersion}->{ $Param{ConfigItemID} };
    for my $VersionNr ( keys %{ $Self->{Cache}->{Versions} } ) {
        my ($CacheConfigItem) = keys %{ $Self->{Cache}->{Versions}->{$VersionNr} };
        delete $Self->{Cache}->{Versions}->{$VersionNr} if $CacheConfigItem eq $Param{ConfigItemID};
    }

    # delete history for given config item
    return $Self->{DBObject}->Do(
        SQL  => 'DELETE FROM configitem_history WHERE configitem_id = ?',
        Bind => [ \$Param{ConfigItemID} ],
    );
}

=item HistoryEntryDelete()

Deletes a single history entry.

    $HistoryObject->HistoryEntryDelete(
        HistoryEntryID => 123,
    );

=cut

sub HistoryEntryDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(HistoryEntryID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # delete single entry
    return $Self->{DBObject}->Do(
        SQL  => 'DELETE FROM configitem_history WHERE id = ?',
        Bind => [ \$Param{HistoryEntryID} ],
    );
}

=item HistoryTypeLookup()

This method does a lookup for a history type. If a history type id is given,
it returns the name of the history type. If a history type is given, the appropriate
id is returned.

    my $Name = $HistoryObject->HistoryTypeLookup(
        HistoryTypeID => 1234,
    );

    my $Id = $HistoryObject->HistoryTypeLookup(
        HistoryType => 'ConfigItemCreate',
    );

=cut

sub HistoryTypeLookup {
    my ( $Self, %Param ) = @_;

    my ($Key) = grep { $Param{$_} } qw(HistoryTypeID HistoryType);

    # check for needed stuff
    if ( !$Key ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need HistoryTypeID or HistoryType!',
        );
        return;
    }

    # if result is cached return that result
    return $Self->{Cache}->{HistoryTypeLookup}->{ $Param{$Key} }
        if $Self->{Cache}->{HistoryTypeLookup}->{ $Param{$Key} };

    # set the appropriate SQL statement
    my $SQL = 'SELECT name FROM configitem_history_type WHERE id = ?';

    if ( $Key eq 'HistoryType' ) {
        $SQL = 'SELECT id FROM configitem_history_type WHERE name = ?';
    }

    # fetch the requested value
    my $Value;
    return if !$Self->{DBObject}->Prepare(
        SQL   => $SQL,
        Bind  => [ \$Param{$Key} ],
        Limit => 1,
    );

    my %Entry;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Value = $Row[0];
    }

    return $Value;
}

=item ConfigItemLookup()

=cut

sub ConfigItemLookup {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    if ( !$Param{ConfigItemID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ConfigItemID!',
        );
        return;
    }

    # if result is cached return that result
    return $Self->{Cache}->{ConfigItemLookup}->{ $Param{ConfigItemID} }
        if $Self->{Cache}->{ConfigItemLookup}->{ $Param{ConfigItemID} };

    # fetch the requested value
    my $Value;
    return if !$Self->{DBObject}->Prepare(
        SQL   => 'SELECT id FROM configitem WHERE id = ?',
        Bind  => [ \$Param{ConfigItemID} ],
        Limit => 1,
    );

    my %Entry;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Value = $Row[0];
    }

    return $Value;
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

$Revision: 1.7 $ $Date: 2009/08/19 22:32:16 $

=cut
