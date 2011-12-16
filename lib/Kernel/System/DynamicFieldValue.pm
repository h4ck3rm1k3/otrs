# --
# Kernel/System/DynamicFieldValue.pm - DynamicField values backend
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: DynamicFieldValue.pm,v 1.14 2011/10/26 02:14:45 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DynamicFieldValue;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);
use Kernel::System::Time;
use Kernel::System::Cache;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.14 $) [1];

=head1 NAME

Kernel::System::DynamicFieldValue

=head1 SYNOPSIS

DynamicField values backend

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create a DynamicFieldValue backend object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::Main;
    use Kernel::System::DB;
    use Kernel::System::DynamicFieldValue;

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
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $DynamicFieldValueObject = Kernel::System::DynamicFieldValue->new(
        ConfigObject        => $ConfigObject,
        EncodeObject        => $EncodeObject,
        LogObject           => $LogObject,
        MainObject          => $MainObject,
        DBObject            => $DBObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
    for my $Needed (qw(ConfigObject EncodeObject LogObject MainObject DBObject)) {
        die "Got no $Needed!" if !$Param{$Needed};

        $Self->{$Needed} = $Param{$Needed};
    }

    # create additional objects
    $Self->{TimeObject}  = Kernel::System::Time->new( %{$Self} );
    $Self->{CacheObject} = Kernel::System::Cache->new( %{$Self} );

    # get the cache TTL (in seconds)
    $Self->{CacheTTL}
        = int( $Self->{ConfigObject}->Get('DynamicField::CacheTTL') || 3600 );

    return $Self;
}

=item ValueSet()

sets a dynamic field value. This is represented by one or more rows in the dynamic_field_value
table, each storing one text, date and int field. Please see how they will be returned by
L<ValueGet()>.

    my $Success = $DynamicFieldValueObject->ValueSet(
        FieldID  => $FieldID,                 # ID of the dynamic field
        ObjectID => $ObjectID,                # ID of the current object that the field
                                              #   must be linked to, e. g. TicketID
        Value    => [
            {
                ValueText          => 'some text',            # optional, one of these fields must be provided
                ValueDateTime      => '1977-12-12 12:00:00',  # optional
                ValueInt           => 123,                    # optional
            },
            ...
        ],
        UserID   => $UserID,
    );

=cut

sub ValueSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(FieldID ObjectID Value)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    # return if no Value was provided
    if ( ref $Param{Value} ne 'ARRAY' || !$Param{Value}->[0] )
    {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need Param{Value}!"
        );
        return;
    }

    my @Values;

    my $Counter = 0;
    while (1) {
        if ( ref $Param{Value}->[$Counter] ne 'HASH' ) {
            last;
        }

        if (
            !defined $Param{Value}->[$Counter]->{ValueText}
            && !defined $Param{Value}->[$Counter]->{ValueInt}
            && !defined $Param{Value}->[$Counter]->{ValueDateTime}
            )
        {
            last;
        }

        my %Value = (
            ValueText     => scalar $Param{Value}->[$Counter]->{ValueText},
            ValueInt      => scalar $Param{Value}->[$Counter]->{ValueInt},
            ValueDateTime => scalar $Param{Value}->[$Counter]->{ValueDateTime},
        );

        if ( exists $Value{ValueDateTime} ) {

            # validate date
            if ( $Value{ValueDateTime} ) {

                # convert the DateTime value to system time to check errors
                my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
                    String => $Value{ValueDateTime},
                );

                return if !$SystemTime;

                # convert back to time stamp to check errors
                my $TimeStamp = $Self->{TimeObject}->SystemTime2TimeStamp(
                    SystemTime => $SystemTime,
                );

                return if !$TimeStamp;

                # compare if the date is the same
                return if !( $Value{ValueDateTime} eq $TimeStamp )
            }
            else {

                # set ValueDateTime column to NULL
                $Value{ValueDateTime} = undef;
            }
        }

        # validate integer
        if ( $Value{ValueInt} ) {

            if ( $Value{ValueInt} !~ m{\A  -? \d+ \z}smx ) {
                $Self->{LogObject}->Log(
                    Priority => 'error', Message => "Invalid Integer '$Value{ValueInt}'!"
                );

                return;
            }
        }

        # validate Int Zero
        if ( defined $Value{ValueInt} && !$Value{ValueInt} ) {
            $Value{ValueInt} = '0';
        }

        push @Values, \%Value;
        $Counter++;
    }

    # delete existing value
    $Self->ValueDelete(
        FieldID  => $Param{FieldID},
        ObjectID => $Param{ObjectID},
        UserID   => $Param{UserID},
    );

    for my $Value (@Values) {

        # create a new value entry
        return if !$Self->{DBObject}->Do(
            SQL =>
                'INSERT INTO dynamic_field_value (field_id, object_id, value_text, value_date, value_int)'
                . ' VALUES (?, ?, ?, ?, ?)',
            Bind => [
                \$Param{FieldID}, \$Param{ObjectID},
                \$Value->{ValueText}, \$Value->{ValueDateTime}, \$Value->{ValueInt},
            ],
        );
    }

    # delete cache
    $Self->{CacheObject}->CleanUp(
        Type => 'DynamicFieldValue',
    );

    return 1;
}

=item ValueGet()

get a dynamic field value. For each table row there will be one entry in the
result list.

    my $Value = $DynamicFieldValueObject->ValueGet(
        FieldID            => $FieldID,                 # ID of the dynamic field
        ObjectID           => $ObjectID,                # ID of the current object that the field
                                                        #   is linked to, e. g. TicketID
    );

    Returns [
        {
            ID                 => 437,
            ValueText          => 'some text',
            ValueDateTime      => '1977-12-12 12:00:00',
            ValueInt           => 123,
        },
    ];

=cut

sub ValueGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(FieldID ObjectID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    my @Result;

    return if !$Self->{DBObject}->Prepare(
        SQL =>
            'SELECT id, value_text, value_date, value_int
            FROM dynamic_field_value
            WHERE field_id = ? AND object_id = ?
            ORDER BY id',
        Bind => [ \$Param{FieldID}, \$Param{ObjectID} ],
    );

    while ( my @Data = $Self->{DBObject}->FetchrowArray() ) {

        # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000
        # and 0000-00-00 00:00:00 time stamps)
        if ( $Data[2] ) {
            if ( $Data[2] eq '0000-00-00 00:00:00' ) {
                $Data[2] = undef;
            }
            $Data[2] =~ s/^(\d\d\d\d-\d\d-\d\d\s\d\d:\d\d:\d\d)\..+?$/$1/;
        }

        push @Result, {
            ID            => $Data[0],
            ValueText     => $Data[1],
            ValueDateTime => $Data[2],
            ValueInt      => $Data[3],
        };
    }

    return \@Result;
}

=item ValueDelete()

delete a Dynamic field value entry. All associated rows will be deleted.

    my $Success = $DynamicFieldValueObject->ValueDelete(
        FieldID            => $FieldID,                 # ID of the dynamic field
        ObjectID           => $ObjectID,                # ID of the current object that the field
                                                        #   is linked to, e. g. TicketID
        UserID  => 123,
    );

    Returns 1.

=cut

sub ValueDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(FieldID ObjectID UserID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    # delete dynamic field value
    return if !$Self->{DBObject}->Do(
        SQL => 'DELETE FROM dynamic_field_value WHERE field_id = ? AND object_id = ?',
        Bind => [ \$Param{FieldID}, \$Param{ObjectID} ],
    );

    # delete cache
    $Self->{CacheObject}->CleanUp(
        Type => 'DynamicFieldValue',
    );

    return 1;
}

=item HistoricalValueGet()

get all distinct values from a field stored on the database

    my $HistoricalValues = $DynamicFieldValueObject->HistoricalValueGet(
        FieldID   => $FieldID,                  # ID of the dynamic field
        ValueType => 'Text',                    # or 'Date' or 'Integer'. Default 'Text'
    );

    Returns:

    $HistoricalValues{
        ValueA => 'ValueA',
        ValueB => 'ValueB',
        ValueC => 'ValueC'
    };
=cut

sub HistoricalValueGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(FieldID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    my $ValueType = 'value_text';
    if ( $Param{ValueType} && $Param{ValueType} eq 'DateTime' ) {
        $ValueType = 'value_date';
    }
    elsif ( $Param{ValueType} && $Param{ValueType} eq 'Integer' ) {
        $ValueType = 'value_int';
    }

    # check cache
    my $CacheKey = 'HistoricalValueGet::FieldID::' . $Param{FieldID} . '::ValueType::' . $ValueType;

    my $Cache = $Self->{CacheObject}->Get(
        Type => 'DynamicFieldValue',
        Key  => $CacheKey,
    );

    # get data from cache
    if ($Cache) {
        return $Cache;
    }

    return if !$Self->{DBObject}->Prepare(
        SQL =>
            "SELECT DISTINCT($ValueType) FROM dynamic_field_value WHERE field_id = ?",
        Bind => [ \$Param{FieldID} ],
    );

    my %Data;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        # check if the value is already stored
        if ( $Row[0] && !$Data{ $Row[0] } ) {

            if ( $ValueType eq 'Date' ) {

                # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000
                # and 0000-00-00 00:00:00 time stamps)
                if ( $Row[0] eq '0000-00-00 00:00:00' ) {
                    $Row[0] = undef;
                }
                $Row[0] =~ s/^(\d\d\d\d-\d\d-\d\d\s\d\d:\d\d:\d\d)\..+?$/$1/;
            }

            # store the results
            $Data{ $Row[0] } = $Row[0];
        }
    }

    # set cache
    $Self->{CacheObject}->Set(
        Type  => 'DynamicFieldValue',
        Key   => $CacheKey,
        Value => \%Data,
        TTL   => $Self->{CacheTTL},
    );

    return \%Data;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut

=head1 VERSION

$Revision: 1.14 $ $Date: 2011/10/26 02:14:45 $

=cut
