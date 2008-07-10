# --
# Kernel/System/Support.pm - all required system information
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: Support.pm,v 1.10 2008/07/10 23:54:48 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::Support;

use strict;
use warnings;

use Kernel::System::XML;
use Kernel::System::DB;
use Kernel::System::Email;
use Kernel::System::Time;
use MIME::Base64;
use Archive::Tar;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.10 $) [1];

=head1 NAME

Kernel::System::Support - global system information

=head1 SYNOPSIS

All required support information to a running OTRS system.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create Support object

use Kernel::Config;
use Kernel::System::Log;
my $ConfigObject = Kernel::Config->new();
my $LogObject = Kernel::System::Log->new(
    ConfigObject => $ConfigObject,
);

$SupportObject = Kernel::System::Support->new(
    ConfigObject => $ConfigObject,
    LogObject => $LogObject,
);

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for (qw(ConfigObject LogObject MainObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }
    $Self->{XMLObject} = Kernel::System::XML->new(%Param);
    $Self->{DBObject}  = Kernel::System::DB->new(
        ConfigObject => $Self->{ConfigObject},
        MainObject   => $Self->{MainObject},
        LogObject    => $Self->{LogObject},

    );
    $Self->{TimeObject}  = Kernel::System::Time->new(%Param);
    $Self->{EmailObject} = Kernel::System::Email->new(
        ConfigObject => $Self->{ConfigObject},
        MainObject   => $Self->{MainObject},
        LogObject    => $Self->{LogObject},
        DBObject     => $Self->{DBObject},
        TimeObject   => $Self->{TimeObject},
    );

    return $Self;
}

=item SupportConfigHashGet()

get a hash reference with required config information.

    $Support->SupportConfigHashGet(
        ConfigHash => $HashRef,
    );

=cut

sub SupportConfigHashGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(ConfigHash)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # check if $ConfigHash ne a HashRef
    if ( ref( $Param{ConfigHash} ) ne 'HASH' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'ConfigHash must be a hash reference!',
        );
        return;
    }

    # get the directory name
    my $DirName = $Self->{ConfigObject}->Get('Home') . '/Kernel/System/Support/';

    # read all availible modules in @List
    my @List = glob( $DirName . "/*.pm" );
    for my $File (@List) {

        # remove .pm
        $File =~ s/^.*\/(.+?)\.pm$/$1/;
        my $GenericModule = "Kernel::System::Support::$File";

        # load module $GenericModule and check if loadable
        if ( $Self->{MainObject}->Require($GenericModule) ) {

            # create new object
            my $SupportObject = $GenericModule->new( %{$Self} );
            if ($SupportObject) {
                my $ArrayRef = $SupportObject->SupportConfigArrayGet();
                if ( $ArrayRef && ref($ArrayRef) eq 'ARRAY' ) {
                    $Param{ConfigHash}->{$File} = $ArrayRef;
                }
            }
        }
    }
    return 1;
}

=item SupportInfoGet()

get a hash reference with support information.

    $Support->SupportInfoGet(
        DataHash => $DataHash,
        InputHash => $InputHash,
    );

=cut

sub SupportInfoGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(DataHash InputHash)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # check if $DataHash and $InputHash ne a HashRef
    if ( ref( $Param{DataHash} ) ne 'HASH' || ref( $Param{InputHash} ) ne 'HASH' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "DataHash and InputHash must be a hash reference!"
        );
        return;
    }

    # get the directory name
    my $DirName = $Self->{ConfigObject}->Get('Home') . '/Kernel/System/Support/';

    # read all availible modules in @List
    my @List = glob( $DirName . "/*.pm" );
    for my $File (@List) {

        # remove .pm
        $File =~ s/^.*\/(.+?)\.pm$/$1/;
        my $GenericModule = "Kernel::System::Support::$File";

        # load module $GenericModule and check if loadable
        if ( $Self->{MainObject}->Require($GenericModule) ) {

            # create new object
            my $SupportObject = $GenericModule->new( %{$Self} );
            if ( $SupportObject && $Param{InputHash}->{$File} ) {
                my $ArrayRef
                    = $SupportObject->SupportInfoGet( ModuleInputHash => $Param{InputHash}->{$File},
                    );

                # check if return value is a valid arrayref
                if ( @{$ArrayRef} ) {
                    my $StructureOK = 1;

                    # check if the arrayref includes only valid hashrefs
                    for my $Element ( @{$ArrayRef} ) {
                        if ( ref($Element) ne 'HASH' ) {
                            $StructureOK = 0;
                        }
                    }
                    if ( $StructureOK eq "1" ) {
                        $Param{DataHash}->{$File} = $ArrayRef;
                    }
                }
            }
        }
    }
    return 1;
}

=item AdminChecksGet()

get a hash reference with possibility checks.

    my $List = $Support->AdminChecksGet();

=cut

sub AdminChecksGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw()) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # get the directory name
    my $DirName = $Self->{ConfigObject}->Get('Home') . '/Kernel/System/Support/';

    # read all availible modules in @List
    my @List = glob( $DirName . '/*.pm' );

    my $DataHash;
    MODULE:
    for my $File (@List) {

        # remove .pm
        $File =~ s/^.*\/(.+?)\.pm$/$1/;
        my $GenericModule = "Kernel::System::Support::$File";

        # load module $GenericModule and check if loadable
        if ( !$Self->{MainObject}->Require($GenericModule) ) {

            # TODO Log
            next MODULE;
        }

        # create new object
        my $SupportObject = $GenericModule->new( %{$Self} );

        # return if instance can not create
        if ( !$SupportObject ) {

            # TODO Log
            next MODULE;
        }

        # get admin check data
        my $AdminCheckRef = $SupportObject->AdminChecksGet();

        # check if return value is a valid array reference
        if ( !$AdminCheckRef || ref $AdminCheckRef ne 'ARRAY' || !@{$AdminCheckRef} ) {

            # TODO Log
            next MODULE;
        }

        # extract all valid elements
        my @CleandAdminCheckRef = grep { ref($_) eq 'HASH' } @{$AdminCheckRef};

        # attach the cleaned element array
        $DataHash->{$File} = \@CleandAdminCheckRef;
    }

    return $DataHash;
}

sub XMLStringCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(DataHash)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    if ( ref( $Param{DataHash} ) ne 'HASH' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "DataHash must be a hash reference!",
        );
        return;
    }

    my $XMLHash = [];
    my $CountModule = 0;
    my $CountItem   = 0;
    for my $Module ( keys %{ $Param{DataHash} } ) {
        $CountModule++;
        $XMLHash->[1]->{SupportInfo}->[1]->{Module}->[$CountModule]->{Name} = $Module;
        for my $DataHashRow ( @{ $Param{DataHash}->{$Module} } ) {
            $CountItem++;
            my $Data = {};
            for my $Element ( keys %{$DataHashRow} ) {
                next if $Element eq 'Key';
                next if $Element eq 'Name';
                $Data->{$Element}->[1]->{Content} = $DataHashRow->{$Element};
            }
            $XMLHash->[1]->{SupportInfo}->[1]->{Module}->[$CountModule]->{Item}->[$CountItem] = $Data;
            $XMLHash->[1]->{SupportInfo}->[1]->{Module}->[$CountModule]->{Item}->[$CountItem]->{Name} = $DataHashRow->{Key};
        }
    }

    my $XMLString = $Self->{XMLObject}->XMLHash2XML( @{$XMLHash} );

    return $XMLString;
}

sub ArchiveApplication {
    my ( $Self, %Param ) = @_;

    my $Home = $Self->{ConfigObject}->Get('Home');
    my $Archive = $Self->{ConfigObject}->Get('Home') . '/var/tmp/application.tar';
    if ( -f $Archive ) {
        unlink $Archive || die "Can't unlink $Archive: $!";
    }

    my @List = $Self->DirectoryFiles( Directory => $Home );
#print STDERR "LIST\n";
    # add files to the tar archive
    my $TarObject = Archive::Tar->new();
    $TarObject->add_files(@List);
    $TarObject->write( $Archive, 0 ) || die "Could not write: $_!";

#print STDERR "ARCHIVE\n";
    # add files to the tar archive
    open( my $Tar, '<', $Archive );
    binmode($Tar);
    my $TmpTar = '';
    while (<$Tar>) {
        $TmpTar .= $_;
    }
    close($Tar);
    if ( $Self->{MainObject}->Require("Compress::Zlib") ) {
        my $GzTar = Compress::Zlib::memGzip($TmpTar);
#print STDERR "Compress\n";
        return ( \$GzTar, 'application.tar.gz');
    }
#print STDERR "Compress\n";

    return ( \$TmpTar, 'application.tar' );
}

sub DirectoryFiles {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Directory)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    my @Files = ();
    my @List = glob("$Param{Directory}/*");

    for my $File (@List) {
        if (-d $File ) {
            if ( $File =~ /\/CVS/ ) {
                next;
            }
            push @Files, $Self->DirectoryFiles( Directory => $File );
        }
        else {
            if ( $File =~ /^\./ ) {
                next;
            }
            if ( $File =~ /#/ ) {
                next;
            }
            if ( $File =~ /\/(article|tmp\/Cache)/ ) {
                next;
            }
            if ( -s $File > (1024*1024*1) ) {
#print STDERR "NO: $File\n";
                next;
            }
            push @Files, $File;
        }
    }

    return @Files;
}

sub SendInfo {
    my ( $Self, %Param ) = @_;

    my $DataHash = $Self->AdminChecksGet();
    my $XMLCheck = $Self->XMLStringCreate( DataHash => $DataHash, );
    my ($Content, $Filename ) = $Self->ArchiveApplication();
    my $Body = '';
    for my $Key (%Param) {
        $Body .= "$Key:$Param{$Key}\n";
    }
    $Body .= "FQDN:" . $Self->{ConfigObject}->Get('FQDN') . "\n";

    my $Send = $Self->{EmailObject}->Send(
        From       => $Param{Email} || $Self->{ConfigObject}->Get('AdminEmail'),
#        To         => 'support@otrs.com',
        To         => 'vo94@vo.otrs.com',
        Subject    => 'Support::Request::Auto::Email::CHECK',
        Type       => 'text/plain',
        Charset    => 'utf-8',
        Body       => $Body,
        Attachment => [
            {
                Filename    => 'check.xml',
                Content     => $XMLCheck,
                ContentType => 'application/octet-stream',
            },
            {
                Filename    => $Filename,
                Content     => ${ $Content },
                ContentType => 'application/octet-stream',
            }
        ],
    );

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.

=cut

=head1 VERSION

$Revision: 1.10 $ $Date: 2008/07/10 23:54:48 $

=cut
