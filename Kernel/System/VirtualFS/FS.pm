# --
# Kernel/System/VirtualFS/FS.pm - all virtual fs functions
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: FS.pm,v 1.1 2009/12/14 14:27:43 reb Exp $
# $OldId: FS.pm,v 1.2 2009/12/10 11:59:54 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::VirtualFS::FS;

use strict;
use warnings;
use File::Path;
use File::Basename;

# to get it writable for the otrs group (just in case)
umask 002;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for (qw(DBObject ConfigObject LogObject MainObject EncodeObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    # get data dir
    $Self->{DataDir}    = $Self->{ConfigObject}->Get('Home') . '/var/virtualfs';
    $Self->{Permission} = '664';

    # check fs write permissions!
    my $Path = "$Self->{DataDir}/check_permissions.$$";
    if ( -d $Path ) {
        File::Path::rmtree( [$Path] ) || die "Can't remove $Path: $!\n";
    }
    if ( mkdir( "$Self->{DataDir}/check_permissions_$$", 022 ) ) {
        if ( !rmdir("$Self->{DataDir}/check_permissions_$$") ) {
            die "Can't remove $Self->{DataDir}/check_permissions_$$: $!\n";
        }
        if ( File::Path::mkpath( [$Path], 0, 0775 ) ) {
            File::Path::rmtree( [$Path] ) || die "Can't remove $Path: $!\n";
        }
    }

    # create data dir
    if ( !-d $Self->{DataDir} ) {
        mkdir $Self->{DataDir} || die $!;
    }

    # config (not used right now)
    $Self->{Compress} = 0;
    $Self->{Crypt}    = 0;

    return $Self;
}

sub Read {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(BackendKey Mode)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    my $Attributes = $Self->_BackendKeyParse(%Param);

    my $Content = $Self->{MainObject}->FileRead(
        Directory => $Self->{DataDir} . $Attributes->{DataDir},
        Filename  => $Attributes->{Filename},
        Mode      => $Param{Mode},
    );

    # uncompress (in case)
    if ( $Attributes->{Compress} ) {

        # $Content = ...
    }

    # decrypt (in case)
    if ( $Attributes->{Crypt} ) {

        # $Content = ...
    }

    return if !$Content;
    return $Content;
}

sub Write {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Content Filename Mode)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # compress (in case)
    if ( $Self->{Compress} ) {

        # $Param{Content} = ...
    }

    # crypt (in case)
    if ( $Self->{Crypt} ) {

        # $Param{Content} = ...
    }

    my $MD5 = $Self->{MainObject}->FilenameCleanUp(
        Filename => $Param{Filename},
        Type     => 'MD5',
    );

    my $DataDir = '';
    my @Dirs = $Self->_SplitDir( Filename => $MD5 );
    for my $Dir (@Dirs) {
        $DataDir .= '/' . $Dir;
        next if -e $Self->{DataDir} . $DataDir;
        next if mkdir $Self->{DataDir} . $DataDir;
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't create $Self->{DataDir}$DataDir: $!",
        );
        return;
    }

    # write article to fs
    my $Filename = $Self->{MainObject}->FileWrite(
        Directory  => $Self->{DataDir} . $DataDir,
        Filename   => $MD5,
        Mode       => $Param{Mode},
        Content    => $Param{Content},
        Permission => $Self->{Permission},
    );
    return if !$Filename;

    my $BackendKey = $Self->_BackendKeyGenerate(
        Filename => $Filename,
        DataDir  => $DataDir,
        Compress => $Self->{Compress},
        Crypt    => $Self->{Crypt},
        Mode     => $Param{Mode},
        Version  => $VERSION,
    );

    return $BackendKey;
}

sub Delete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(BackendKey)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    my $Attributes = $Self->_BackendKeyParse(%Param);

    return $Self->{MainObject}->FileDelete(
        Directory => $Self->{DataDir} . $Attributes->{DataDir},
        Filename  => $Attributes->{Filename},
    );
}

sub _BackendKeyGenerate {
    my ( $Self, %Param ) = @_;

    my $BackendKey = '';
    for my $Key ( sort keys %Param ) {
        $BackendKey .= "$Key=$Param{$Key};";
    }
    return $BackendKey;
}

sub _BackendKeyParse {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(BackendKey)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    my %Attributes;
    my @Pairs = split /;/, $Param{BackendKey};
    for my $Pair (@Pairs) {
        my ( $Key, $Value ) = split /=/, $Pair;
        $Attributes{$Key} = $Value;
    }
    return \%Attributes;
}

sub _SplitDir {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Filename)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    my @Dir;
    $Dir[0] = substr $Param{Filename}, 0, 2;
    $Dir[1] = substr $Param{Filename}, 2, 2;
    return ( $Dir[0], $Dir[1] );
}

1;
