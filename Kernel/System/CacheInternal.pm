# --
# Kernel/System/CacheInternal.pm - all cache functions
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: CacheInternal.pm,v 1.1 2010/05/26 22:49:06 cr Exp $
# $OldId: CacheInternal.pm,v 1.3 2010/02/26 20:48:21 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::CacheInternal;

use strict;
use warnings;
use Kernel::System::Cache;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

=head1 NAME

Kernel::System::CacheInternal - cache lib

=head1 SYNOPSIS

All cache functions for internal cache management.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::Main;
    use Kernel::System::CacheInternal;

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
    my $CacheInternalObject = Kernel::System::CacheInternal->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
        EncodeObject => $EncodeObject,
        Type         => 'ObjectName', # only A-z chars usable
        TTL          => 60 * 60 * 24,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # 0=off; 1=set+get_cache; 2=+delete+get_request;
    $Self->{Debug} = $Param{Debug} || 0;

    # check needed objects
    for (qw(MainObject ConfigObject LogObject EncodeObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    for (qw(Type TTL)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    $Self->{Type} = 'CacheInternal' . $Self->{Type};

    my $CachePermanent = 1;

    #    $CachePermanent = 0;

    if ($CachePermanent) {
        $Self->{CacheObject} = Kernel::System::Cache->new(%Param);
    }

    return $Self;
}

=item Set()

set a new cache

    $CacheInternalObject->Set(
        Key   => 'SomeKey',
        Value => 'Some Value',
    );

=cut

sub Set {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Key Value)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # set runtime cache
    $Self->{Cache}->{ $Param{Key} } = $Param{Value};

    # set permanent cache
    if ( $Self->{CacheObject} ) {
        $Self->{CacheObject}->Set(
            Type  => $Self->{Type},
            Key   => $Param{Key},
            Value => $Param{Value},
            TTL   => $Self->{TTL},
        );
    }

    return 1;
}

=item Get()

return a cache

    my $Value = $CacheInternalObject->Get(
        Key  => 'SomeKey',
    );

=cut

sub Get {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Key)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # check runtime cache
    return $Self->{Cache}->{ $Param{Key} } if exists $Self->{Cache}->{ $Param{Key} };

    # check permanent cache
    my $Cache;
    if ( $Self->{CacheObject} ) {
        $Cache = $Self->{CacheObject}->Get(
            Type => $Self->{Type},
            Key  => $Param{Key},
        );
    }
    return if !defined $Cache;

    # set runtime cache
    $Self->{Cache}->{ $Param{Key} } = $Cache;

    return $Cache;
}

=item Delete()

delete a cache

    $CacheInternalObject->Delete(
        Key  => 'SomeKey',
    );

=cut

sub Delete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Key)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # delete runtime cache
    delete $Self->{Cache}->{ $Param{Key} };

    # check permanent cache
    if ( $Self->{CacheObject} ) {
        $Self->{CacheObject}->Delete(
            Type => $Self->{Type},
            Key  => $Param{Key},
        );
    }

    return 1;
}

=item CleanUp()

delete all caches

    $CacheInternalObject->CleanUp();

=cut

sub CleanUp {
    my ( $Self, %Param ) = @_;

    # delete all runtime cache
    $Self->{Cache} = undef;

    # delete permanent cache
    if ( $Self->{CacheObject} ) {
        return if !$Self->{CacheObject}->CleanUp( Type => $Self->{Type} );
    }

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=cut

=head1 VERSION

$Revision: 1.1 $ $Date: 2010/05/26 22:49:06 $

=cut
