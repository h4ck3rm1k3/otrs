# --
# Cache.t - Cache tests
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: Cache.t,v 1.22 2011/08/12 09:06:15 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use vars (qw($Self));
use utf8;
use Kernel::System::Cache;

my $ConfigObject = Kernel::Config->new();

for my $Module qw(FileStorable FileRaw) {
    $ConfigObject->Set(
        Key   => 'Cache::Module',
        Value => "Kernel::System::Cache::$Module"
    );

    my $CacheObject = Kernel::System::Cache->new(
        %{$Self},
        ConfigObject => $ConfigObject,
    );

    my $CacheSet = $CacheObject->Set(
        Type  => 'CacheTest2',
        Key   => 'Test',
        Value => '1234',
        TTL   => 24 * 60 * 60,
    );
    $Self->True(
        $CacheSet,
        "#1 - $Module - CacheSet(), TTL 24*60*60",
    );

    my $CacheGet = $CacheObject->Get(
        Type => 'CacheTest2',
        Key  => 'Test',
    );
    $Self->Is(
        $CacheGet || '',
        '1234',
        "#1 - $Module - CacheGet()",
    );

    # test charset specific situations
    $CacheSet = $CacheObject->Set(
        Type  => 'CacheTest2',
        Key   => 'Test',
        Value => {
            Key1 => 'Value1',
            Key2 => 'Value2äöüß',
            Key3 => 'Value3',
            Key4 => [
                'äöüß',
                '123456789',
                'ÄÖÜß',
                {
                    KeyA  => 'ValueA',
                    KeyB  => 'ValueBäöüßタ',
                    KeyC  => 'ValueC',
                    Value => '9ßüß-カスタ1234',
                },
            ],
        },
        TTL => 24 * 60 * 60,
    );

    $Self->True(
        $CacheSet,
        "#2 - $Module - CacheSet()",
    );

    $CacheGet = $CacheObject->Get(
        Type => 'CacheTest2',
        Key  => 'Test',
    );

    $Self->Is(
        $CacheGet->{Key2} || '',
        'Value2äöüß',
        "#2 - $Module - CacheGet() - {Key2}",
    );
    $Self->True(
        Encode::is_utf8( $CacheGet->{Key2} ) || '',
        "#2 - $Module - CacheGet() - {Key2} Encode::is_utf8",
    );
    $Self->Is(
        $CacheGet->{Key4}->[0] || '',
        'äöüß',
        "#2 - $Module - CacheGet() - {Key4}->[0]",
    );
    $Self->True(
        Encode::is_utf8( $CacheGet->{Key4}->[0] ) || '',
        "#2 - $Module - CacheGet() - {Key4}->[0] Encode::is_utf8",
    );
    $Self->Is(
        $CacheGet->{Key4}->[3]->{KeyA} || '',
        'ValueA',
        "#2 - $Module - CacheGet() - {Key4}->[3]->{KeyA}",
    );
    $Self->Is(
        $CacheGet->{Key4}->[3]->{KeyB} || '',
        'ValueBäöüßタ',
        "#2 - $Module - CacheGet() - {Key4}->[3]->{KeyB}",
    );
    $Self->True(
        Encode::is_utf8( $CacheGet->{Key4}->[3]->{KeyB} ) || '',
        "#2 - $Module - CacheGet() - {Key4}->[3]->{KeyB} Encode::is_utf8",
    );

    $CacheSet = $CacheObject->Set(
        Type  => 'CacheTest2',
        Key   => 'Test',
        Value => 'ü',
        TTL   => 2,
    );

    $Self->True(
        $CacheSet,
        "#3 - $Module - CacheSet(), TTL 2",
    );

    $CacheGet = $CacheObject->Get(
        Type => 'CacheTest2',
        Key  => 'Test',
    );

    $Self->Is(
        $CacheGet || '',
        'ü',
        "#3 - $Module - CacheGet()",
    );

    $Self->True(
        Encode::is_utf8($CacheGet) || '',
        "#3 - $Module - CacheGet() - Encode::is_utf8",
    );

    $CacheSet = $CacheObject->Set(
        Type  => 'CacheTest2',
        Key   => 'Test',
        Value => '9ßüß-カスタ1234',
        TTL   => 2,
    );

    $Self->True(
        $CacheSet,
        "#4 - $Module - CacheSet(), TTL 2",
    );

    $CacheGet = $CacheObject->Get(
        Type => 'CacheTest2',
        Key  => 'Test',
    );

    $Self->Is(
        $CacheGet || '',
        '9ßüß-カスタ1234',
        "#4 - $Module - CacheGet()",
    );
    $Self->True(
        Encode::is_utf8($CacheGet) || '',
        "#4 - $Module - CacheGet() - Encode::is_utf8",
    );
    sleep 4;

    $CacheGet = $CacheObject->Get(
        Type => 'CacheTest2',
        Key  => 'Test',
    );

    $Self->True(
        !$CacheGet || '',
        "#4 - $Module - CacheGet() - sleep6 - TTL of 5 expired",
    );

    $CacheSet = $CacheObject->Set(
        Type  => 'CacheTest2',
        Key   => 'Test',
        Value => '123456',
        TTL   => 60 * 60,
    );

    $Self->True(
        $CacheSet,
        "#5 - $Module - CacheSet()",
    );

    $CacheGet = $CacheObject->Get(
        Type => 'CacheTest2',
        Key  => 'Test',
    );

    $Self->Is(
        $CacheGet || '',
        '123456',
        "#5 - $Module - CacheGet()",
    );
    my $CacheDelete = $CacheObject->Delete(
        Type => 'CacheTest2',
        Key  => 'Test',
    );
    $Self->True(
        $CacheDelete,
        "#5 - $Module - CacheDelete()",
    );

    # A-z char type test
    $CacheSet = $CacheObject->Set(
        Type  => 'Value2äöüß',
        Key   => 'Test',
        Value => '1',
        TTL   => 60,
    );
    $Self->True(
        !$CacheSet || '',
        "#6 - $Module - Set() - A-z type check",
    );

    $CacheDelete = $CacheObject->Delete(
        Type => 'Value2äöüß',
        Key  => 'Test',
    );
    $Self->True(
        !$CacheDelete || 0,
        "#6 - $Module - CacheDelete() - A-z type check",
    );

    # create new cache files
    $CacheSet = $CacheObject->Set(
        Type  => 'CacheTest2',
        Key   => 'Test',
        Value => '1234',
        TTL   => 24 * 60 * 60,
    );
    $Self->True(
        $CacheSet,
        "#7 - $Module - CacheSet(), TTL 24*60*60",
    );

    # check get
    $CacheGet = $CacheObject->Get(
        Type => 'CacheTest2',
        Key  => 'Test',
    );
    $Self->Is(
        $CacheGet || '',
        '1234',
        "#7 - $Module - CacheGet()",
    );

    # cleanup (expired)
    my $CacheCleanUp = $CacheObject->CleanUp( Expired => 1 );
    $Self->True(
        $CacheCleanUp,
        "#7 - $Module - CleanUp( Expired => 1 )",
    );

    # check get
    $CacheGet = $CacheObject->Get(
        Type => 'CacheTest2',
        Key  => 'Test',
    );
    $Self->True(
        $CacheGet,
        "#7 - $Module - CacheGet() - Expired",
    );

    # cleanup
    $CacheCleanUp = $CacheObject->CleanUp();
    $Self->True(
        $CacheCleanUp,
        "#7 - $Module - CleanUp()",
    );

    # check get
    $CacheGet = $CacheObject->Get(
        Type => 'CacheTest2',
        Key  => 'Test',
    );
    $Self->False(
        $CacheGet,
        "#7 - $Module - CacheGet()",
    );
}

1;
