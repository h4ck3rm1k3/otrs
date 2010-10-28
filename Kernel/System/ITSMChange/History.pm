# --
# Kernel/System/ITSMChange/History.pm - all change and workorder history functions
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: History.pm,v 1.28 2010/10/28 12:31:07 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::History;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.28 $) [1];

=head1 NAME

Kernel::System::ITSMChange::History - all change and workorder history functions

=head1 SYNOPSIS

All history functions.

=head1 PUBLIC INTERFACE

=over 4

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::DB;
    use Kernel::System::Main;
    use Kernel::System::Time;
    use Kernel::System::ITSMChange::History;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
    my $TimeObject = Kernel::System::Time->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $HistoryObject = Kernel::System::ITSMChange::History->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        TimeObject   => $TimeObject,
        MainObject   => $MainObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (
        qw(DBObject ConfigObject EncodeObject LogObject UserObject MainObject TimeObject)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    # set default debug flag
    $Self->{Debug} ||= 0;

    return $Self;
}

=item HistoryAdd()

Adds a single history entry to the history. Returns 1 on success, C<undef> otherwise.

    my $Success = $HistoryObject->HistoryAdd(
        ChangeID      => 1234,            # either ChangeID or WorkOrderID is needed
        WorkOrderID   => 123,             # either ChangeID or WorkOrderID is needed
        HistoryType   => 'WorkOrderAdd',  # either HistoryType or HistoryTypeID is needed
        HistoryTypeID => 1,               # either HistoryType or HistoryTypeID is needed
        Fieldname     => 'Justification', # optional
        ContentNew    => 'Any useful information', # optional
        ContentOld    => 'Old value of field',     # optional
        UserID        => 1,
    );

=cut

sub HistoryAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    # ChangeID is always needed, workorder id is only needed for workorder events
    for my $Needed (qw(UserID ChangeID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # either HistoryType or HistoryTypeID is needed
    if ( !( $Param{HistoryType} || $Param{HistoryTypeID} ) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need HistoryType or HistoryTypeID!',
        );
        return;
    }

    # get history type id from history type if history type is given.
    if ( $Param{HistoryType} ) {
        my $ID = $Self->HistoryTypeLookup( HistoryType => $Param{HistoryType} );

        # no valid history type given
        if ( !$ID ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Invalid history type '$Param{HistoryType}' given!",
            );
            return;
        }

        $Param{HistoryTypeID} = $ID;
    }

    # insert history entry
    return if !$Self->{DBObject}->Do(
        SQL => 'INSERT INTO change_history ( change_id, workorder_id, content_new, '
            . 'content_old, create_by, create_time, type_id, fieldname ) '
            . 'VALUES ( ?, ?, ?, ?, ?, current_timestamp, ?, ? )',
        Bind => [
            \$Param{ChangeID},
            \$Param{WorkOrderID},
            \$Param{ContentNew},
            \$Param{ContentOld},
            \$Param{UserID},
            \$Param{HistoryTypeID},
            \$Param{Fieldname},
        ],
    );

    return 1;
}

=item WorkOrderHistoryGet()

Returns a list of all history entries that belong to the given WorkOrderID. The
list contains hash references with these information:

    $Info{HistoryEntryID}
    $Info{ChangeID}
    $Info{WorkOrderID}
    $Info{HistoryType}
    $Info{HistoryTypeID}
    $Info{Fieldname}
    $Info{ContentNew}
    $Info{ContentOld}
    $Info{CreateBy}
    $Info{CreateTime}
    $Info{UserID}
    $Info{UserLogin}
    $Info{UserLastname}
    $Info{UserFirstname}

    my $HistoryEntries = $HistoryObject->WorkOrderHistoryGet(
        WorkOrderID => 123,
        UserID   => 1,
    );

=cut

sub WorkOrderHistoryGet {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(WorkOrderID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # run the sql statement to get history
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT ch.id, change_id, workorder_id, content_new, content_old, '
            . 'ch.create_by, ch.create_time, type_id, cht.name, fieldname '
            . 'FROM change_history ch, change_history_type cht '
            . 'WHERE ch.type_id = cht.id '
            . 'AND workorder_id = ? ORDER BY ch.create_time, ch.id',
        Bind => [ \$Param{WorkOrderID} ],
    );

    # fetch the entries and save information in array
    my @HistoryEntries;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        my %HistoryEntry = (
            HistoryEntryID => $Row[0],
            ChangeID       => $Row[1],
            WorkOrderID    => $Row[2],
            ContentNew     => defined( $Row[3] ) ? $Row[3] : '',
            ContentOld     => defined( $Row[4] ) ? $Row[4] : '',
            CreateBy       => $Row[5],
            CreateTime     => $Row[6],
            HistoryTypeID  => $Row[7],
            HistoryType    => $Row[8],
            Fieldname      => $Row[9],
        );

        push @HistoryEntries, \%HistoryEntry;
    }

    # get more information about user who created entry
    for my $HistoryEntry (@HistoryEntries) {

        # get user name
        my %User = $Self->{UserObject}->GetUserData(
            UserID => $HistoryEntry->{CreateBy},
            Cache  => 1,
        );

        # save user info in history entry
        if (%User) {
            $HistoryEntry->{UserID}        = $User{UserID};
            $HistoryEntry->{UserLogin}     = $User{UserLogin};
            $HistoryEntry->{UserFirstname} = $User{UserFirstname};
            $HistoryEntry->{UserLastname}  = $User{UserLastname};
        }
    }

    return \@HistoryEntries;
}

=item ChangeHistoryGet()

Returns a list of all history entries that belong to the given ChangeID - including
history entries for workorders. The list contains hash references with these information:

    $Info{HistoryEntryID}
    $Info{ChangeID}
    $Info{WorkOrderID}
    $Info{HistoryType}
    $Info{HistoryTypeID}
    $Info{Fieldname}
    $Info{ContentNew}
    $Info{ContentOld}
    $Info{CreateBy}
    $Info{CreateTime}
    $Info{UserID}
    $Info{UserLogin}
    $Info{UserLastname}
    $Info{UserFirstname}

    my $HistoryEntries = $HistoryObject->ChangeHistoryGet(
        ChangeID => 123,
        UserID   => 1,
    );

=cut

sub ChangeHistoryGet {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(ChangeID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # run the sql statement to get history
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT ch.id, change_id, workorder_id, content_new, content_old, '
            . 'ch.create_by, ch.create_time, type_id, cht.name, fieldname '
            . 'FROM change_history ch, change_history_type cht '
            . 'WHERE ch.type_id = cht.id '
            . 'AND change_id = ? ORDER BY ch.create_time, ch.id',
        Bind => [ \$Param{ChangeID} ],
    );

    # fetch the entries and save information in array
    my @HistoryEntries;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        my %HistoryEntry = (
            HistoryEntryID => $Row[0],
            ChangeID       => $Row[1],
            WorkOrderID    => $Row[2],
            ContentNew     => defined( $Row[3] ) ? $Row[3] : '',
            ContentOld     => defined( $Row[4] ) ? $Row[4] : '',
            CreateBy       => $Row[5],
            CreateTime     => $Row[6],
            HistoryTypeID  => $Row[7],
            HistoryType    => $Row[8],
            Fieldname      => $Row[9],
        );

        # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000)
        $HistoryEntry{CreateTime}
            =~ s{ \A ( \d\d\d\d - \d\d - \d\d \s \d\d:\d\d:\d\d ) \. .+? \z }{$1}xms;

        push @HistoryEntries, \%HistoryEntry;
    }

    # get more information about user who created entry
    for my $HistoryEntry (@HistoryEntries) {

        # get user name
        my %User = $Self->{UserObject}->GetUserData(
            UserID => $HistoryEntry->{CreateBy},
            Cache  => 1,
        );

        # save user info in history entry
        if (%User) {
            $HistoryEntry->{UserID}        = $User{UserID};
            $HistoryEntry->{UserLogin}     = $User{UserLogin};
            $HistoryEntry->{UserFirstname} = $User{UserFirstname};
            $HistoryEntry->{UserLastname}  = $User{UserLastname};
        }
    }

    return \@HistoryEntries;
}

=item HistoryEntryGet()

Returns a single history entry. The hash reference has these information:

    $Info{HistoryEntryID}
    $Info{ChangeID}
    $Info{WorkOrderID}
    $Info{HistoryType}
    $Info{HistoryTypeID}
    $Info{Fieldname}
    $Info{ContentNew}
    $Info{ContentOld}
    $Info{CreateBy}
    $Info{CreateTime}
    $Info{UserID}
    $Info{UserLogin}
    $Info{UserLastname}
    $Info{UserFirstname}

    my $HistoryEntry = $HistoryObject->HistoryEntryGet(
        HistoryEntryID => 123,
        UserID         => 1,
    );

=cut

sub HistoryEntryGet {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(HistoryEntryID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # run the sql statement to get history
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT ch.id, change_id, workorder_id, content_new, content_old, '
            . 'ch.create_by, ch.create_time, type_id, cht.name, fieldname '
            . 'FROM change_history ch, change_history_type cht '
            . 'WHERE ch.type_id = cht.id '
            . 'AND ch.id = ?',
        Bind => [ \$Param{HistoryEntryID} ],
    );

    # fetch the entries and save information in array
    my %HistoryEntry;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        %HistoryEntry = (
            HistoryEntryID => $Row[0],
            ChangeID       => $Row[1],
            WorkOrderID    => $Row[2],
            ContentNew     => $Row[3],
            ContentOld     => $Row[4],
            CreateBy       => $Row[5],
            CreateTime     => $Row[6],
            HistoryTypeID  => $Row[7],
            HistoryType    => $Row[8],
            Fieldname      => $Row[9],
        );

        # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000)
        $HistoryEntry{CreateTime}
            =~ s{ \A ( \d\d\d\d - \d\d - \d\d \s \d\d:\d\d:\d\d ) \. .+? \z }{$1}xms;
    }

    # get user name
    my %User = $Self->{UserObject}->GetUserData(
        UserID => $HistoryEntry{CreateBy},
        Cache  => 1,
    );

    # save user info in history entry
    if (%User) {
        $HistoryEntry{UserID}        = $User{UserID};
        $HistoryEntry{UserLogin}     = $User{UserLogin};
        $HistoryEntry{UserFirstname} = $User{UserFirstname};
        $HistoryEntry{UserLastname}  = $User{UserLastname};
    }

    return \%HistoryEntry;
}

=item WorkOrderHistoryDelete()

Deletes all entries in history table that belongs to the given WorkOrderID.
The method returns 1 on success and C<undef> otherwise.

    my $Success = $HistoryObject->WorkOrderHistoryDelete(
        WorkOrderID => 123,
        UserID      => 1,
    );

=cut

sub WorkOrderHistoryDelete {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(WorkOrderID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # delete entries for the given workorder
    return if !$Self->{DBObject}->Do(
        SQL  => 'DELETE FROM change_history WHERE workorder_id = ?',
        Bind => [ \$Param{WorkOrderID} ],
    );

    # success
    return 1;
}

=item ChangeHistoryDelete()

Deletes all entries in history table that belongs to the given ChangeID.
The method returns 1 on success and C<undef> otherwise.

    my $Success = $HistoryObject->ChangeHistoryDelete(
        ChangeID => 123,
        UserID   => 1,
    );

=cut

sub ChangeHistoryDelete {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(ChangeID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # delete entries for the given change
    return if !$Self->{DBObject}->Do(
        SQL  => 'DELETE FROM change_history WHERE change_id = ?',
        Bind => [ \$Param{ChangeID} ],
    );

    # success
    return 1;
}

=item HistoryUpdate()

This method updates a history entry. It returns 1 on success, and C<undef> otherwise.

    my $Success = $HistoryObject->HistoryUpdate(
        HistoryEntryID => 123,
        WorkOrderID    => 3451,         # optional
        ChangeID       => 1235,         # optional
        ContentNew     => 'new value',  # optional
        ContentOld     => 'old value',  # optional
        UserID         => 1,
    );

=cut

sub HistoryUpdate {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(HistoryEntryID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # get history entry id and user id
    my $HistoryEntryID = delete $Param{HistoryEntryID};
    my $UserID         = delete $Param{UserID};

    # we have to update at least one column
    if ( !keys %Param ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need at least one column to update!',
        );
        return;
    }

    # what columns should be updated
    my @Columns = keys %Param;
    my @Bind;

    # get bind variables
    for my $Column (@Columns) {
        push @Bind, \$Param{$Column};
    }

    # get bind string
    my %ParamKey2ColumnName = (
        ChangeID      => 'change_id',
        WorkOrderID   => 'workorder_id',
        ContentNew    => 'content_new',
        ContentOld    => 'content_old',
        HistoryTypeID => 'type_id',
        Fieldname     => 'fieldname',
    );
    my $Binds = join ', ', map { $ParamKey2ColumnName{$_} . ' = ? ' } @Columns;

    # do the update
    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE change_history SET ' . $Binds . ' '
            . 'WHERE id = ?',
        Bind => [ @Bind, \$HistoryEntryID ],
    );

    return 1;
}

=item HistorySearch()

Searches for changes/workorders that matches the given search criteria. It returns
an array reference with change or workorder IDs. If "Result => 'COUNT'" then the
number of found changes is returned.

    my $IDs = $HistoryObject->HistorySearch(
        Type                => 'Change',       # Change|Workorder which IDs should be returned
        Attribute           => 'ChangeState',
        OldValues           => [ 'rejected' ], # optional - OldValues OR NewValues is needed
        NewValues           => [ 'approved' ], # optional - OldValues OR NewValues is needed
        ChangeBy            => [ 1, 2, 3 ],    # optional
        ChangeDateNewerDate => '2009-01-13 00:00:01', #optional
        ChangeDateOlderDate => '2009-01-13 00:00:01', #optional
        UserID              => 1,
        UsingWildcards      => 0,              # 0|1 - default 1
        Result              => 'ARRAY',        # ARRAY|COUNT - default ARRAY
    );

=cut

sub HistorySearch {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(Type Attribute UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # verify that all passed array parameters contain an arrayref
    ARGUMENT:
    for my $Argument (
        qw(
        OldValues
        NewValues
        ChangeBy
        )
        )
    {
        if ( !defined $Param{$Argument} ) {
            $Param{$Argument} ||= [];

            next ARGUMENT;
        }

        if ( ref $Param{$Argument} ne 'ARRAY' ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "$Argument must be an array reference!",
            );
            return;
        }
    }

    # set default values
    if ( !defined $Param{UsingWildcards} ) {
        $Param{UsingWildcards} = 1;
    }

    # set the default behaviour for the return type
    my $Result = $Param{Result} || 'ARRAY';

    my @SQLWhere;    # assemble the conditions used in the WHERE clause

    # add string params to the WHERE clause
    my %StringParams = (

        # strings in change_history
        Attribute => 'ch.fieldname',
    );

    # add string params to sql-where-array
    STRINGPARAM:
    for my $StringParam ( keys %StringParams ) {

        # check string params for useful values, the string '0' is allowed
        next STRINGPARAM if !exists $Param{$StringParam};
        next STRINGPARAM if !defined $Param{$StringParam};
        next STRINGPARAM if $Param{$StringParam} eq '';

        # quote
        $Param{$StringParam} = $Self->{DBObject}->Quote( $Param{$StringParam} );

        # wildcards are used
        if ( $Param{UsingWildcards} ) {

            # Quote
            $Param{$StringParam} = $Self->{DBObject}->Quote( $Param{$StringParam}, 'Like' );

            # replace * with %
            $Param{$StringParam} =~ s{ \*+ }{%}xmsg;

            # do not use string params which contain only %
            next STRINGPARAM if $Param{$StringParam} =~ m{ \A %* \z }xms;

            push @SQLWhere,
                "LOWER($StringParams{$StringParam}) LIKE LOWER('$Param{$StringParam}')";
        }

        # no wildcards are used
        else {
            push @SQLWhere,
                "LOWER($StringParams{$StringParam}) = LOWER('$Param{$StringParam}')";
        }
    }

    # set array params
    my %ArrayParams = (
        OldValues => 'ch.content_old',
        NewValues => 'ch.content_new',
        ChangeBy  => 'ch.create_by',
    );

    # add array params to sql-where-array
    ARRAYPARAM:
    for my $ArrayParam ( keys %ArrayParams ) {

        # ignore empty lists
        next ARRAYPARAM if !@{ $Param{$ArrayParam} };

        # quote
        for my $OneParam ( @{ $Param{$ArrayParam} } ) {
            $OneParam = $Self->{DBObject}->Quote($OneParam);

            # for strings we need single quotes
            if ( $OneParam !~ m{ \A [+-]? \d+ (?:\.\d+)? \z }xms ) {
                $OneParam = "'$OneParam'";
            }
        }

        # create string
        my $InString = join ', ', @{ $Param{$ArrayParam} };

        push @SQLWhere, "$ArrayParams{$ArrayParam} IN ($InString)";
    }

    # set time params
    my %TimeParams = (

        # times in change_history
        ChangeTimeNewerDate => 'ch.create_time >=',
        ChangeTimeOlderDate => 'ch.create_time <=',
    );

    # check and add time params to WHERE
    TIMEPARAM:
    for my $TimeParam ( keys %TimeParams ) {

        next TIMEPARAM if !$Param{$TimeParam};

        if ( $Param{$TimeParam} !~ m{ \A \d\d\d\d-\d\d-\d\d \s \d\d:\d\d:\d\d \z }xms ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The parameter $TimeParam has an invalid date format!",
            );

            return;
        }

        $Param{$TimeParam} = $Self->{DBObject}->Quote( $Param{$TimeParam} );

        # the time attributes of change_history show up in the WHERE clause
        push @SQLWhere, "$TimeParams{$TimeParam} '$Param{$TimeParam}'";
    }

    # create SQL statement
    my $Type = lc $Param{Type};
    my $SQL  = "SELECT DISTINCT ch.${Type}_id FROM change_history ch ";

    if ( $Result eq 'COUNT' ) {
        $SQL = "SELECT COUNT( DISTINCT( ch.${Type}_id ) ) FROM change_history ch ";
    }

    # add the WHERE clause
    if (@SQLWhere) {
        $SQL .= 'WHERE ';
        $SQL .= join ' AND ', map {"( $_ )"} @SQLWhere;
        $SQL .= ' ';
    }

    # ignore the parameter 'Limit' when result type is 'COUNT'
    if ( $Result eq 'COUNT' ) {
        delete $Param{Limit};
    }

    # ask database
    return if !$Self->{DBObject}->Prepare(
        SQL   => $SQL,
        Limit => $Param{Limit},
    );

    # fetch the result
    my @IDs;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @IDs, $Row[0];
    }

    if ( $Result eq 'COUNT' ) {

        # return the COUNT(c.id) attribute
        return $IDs[0];
    }
    else {
        return \@IDs;
    }
}

=item HistoryTypeLookup()

This method does a lookup for a history type. If a history type id is given,
it returns the name of the history type. If a history type is given, the appropriate
id is returned.

    my $Name = $HistoryObject->HistoryTypeLookup(
        HistoryTypeID => 1234,
    );

    my $ID = $HistoryObject->HistoryTypeLookup(
        HistoryType => 'WorkOrderAdd',
    );

=cut

sub HistoryTypeLookup {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    if ( !$Param{HistoryTypeID} && !$Param{HistoryType} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need HistoryTypeID or HistoryType!',
        );
        return;
    }

    # if both valid keys are given, return
    if ( $Param{HistoryTypeID} && $Param{HistoryType} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need either HistoryTypeID OR HistoryType - not both!',
        );
        return;
    }

    # find out what the used key is
    my $Key = 'HistoryType';

    if ( $Param{HistoryTypeID} ) {
        $Key = 'HistoryTypeID';
    }

    # if result is cached return that result
    return $Self->{Cache}->{HistoryTypeLookup}->{ $Param{$Key} }
        if $Self->{Cache}->{HistoryTypeLookup}->{ $Param{$Key} };

    # set the appropriate SQL statement
    my $SQL = 'SELECT name FROM change_history_type WHERE id = ?';

    if ( $Key eq 'HistoryType' ) {
        $SQL = 'SELECT id FROM change_history_type WHERE name = ?';
    }

    # fetch the requested value
    return if !$Self->{DBObject}->Prepare(
        SQL   => $SQL,
        Bind  => [ \$Param{$Key} ],
        Limit => 1,
    );

    my $Value;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Value = $Row[0];
    }

    # save value in cache
    $Self->{Cache}->{HistoryTypeLookup}->{ $Param{$Key} } = $Value;

    return $Value;
}

=item HistoryTypeList()

returns an array reference with hashreferences. The key of the hashreference is the id
of an recipient and the name is the value.

=cut

sub HistoryTypeList {
    my ( $Self, %Param ) = @_;

    # prepare db query
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT id, name FROM change_history_type ORDER BY name',
    );

    # retrieve data
    my @HistoryTypes;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        my $Entry = {
            Key   => $Row[0],
            Value => $Row[1],
        };
        push @HistoryTypes, $Entry;
    }

    return \@HistoryTypes;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut

=head1 VERSION

$Revision: 1.28 $ $Date: 2010/10/28 12:31:07 $

=cut
