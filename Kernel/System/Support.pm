# --
# Kernel/System/Support.pm - all required system information
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: Support.pm,v 1.23 2008/11/26 15:23:24 sr Exp $
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
use Digest::MD5 qw(md5_hex);

use MIME::Base64;
use Archive::Tar;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.23 $) [1];

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
                next if $Element eq 'Name';
                $Data->{$Element}->[1]->{Content} = $DataHashRow->{$Element};
            }
            $XMLHash->[1]->{SupportInfo}->[1]->{Module}->[$CountModule]->{Item}->[$CountItem] = $Data;
            $XMLHash->[1]->{SupportInfo}->[1]->{Module}->[$CountModule]->{Item}->[$CountItem]->{Name} = $DataHashRow->{Name};
        }
    }

    my $XMLString = $Self->{XMLObject}->XMLHash2XML( @{$XMLHash} );

    return \$XMLString;
}

sub LogLast {
    my ( $Self, %Param ) = @_;

    my $LogString = $Self->{LogObject}->GetLog( Limit => 1000 );

    return ( \$LogString, $Param{Type}.'.log' );
}

sub ModuleCheck {
    my ( $Self, %Param ) = @_;

    my $Home = $Self->{ConfigObject}->Get('Home');
    my $TmpSumString;
    my $TmpLog;
    open( $TmpSumString, "perl $Home/bin/otrs.checkModules |" );

    while (<$TmpSumString>) {
        $TmpLog .= $_;
    }
    close($TmpSumString);

    return ( \$TmpLog, 'ModuleCheck.log' );
}

sub ARCHIVE {
    my ( $Self, %Param ) = @_;

    my $Home    = $Self->{ConfigObject}->Get('Home');
    my $Archive = $Self->{ConfigObject}->Get('Home') . '/ARCHIVE';

    my $Tar;
    if ( !open( $Tar, '<', $Archive ) ) {
        my $ARCHIVEEmpty = "Can't open $Archive: $!";
        return ( \$ARCHIVEEmpty, 'ARCHIVE.log' );
    }
    binmode($Tar);
    my %Compare;
    while (<$Tar>) {
        my @Row = split( /::/, $_ );
        chomp( $Row[1] );
        $Compare{ $Row[1] } = $Row[0];
    }
    close($Tar);

    my %Result = $Self->_ARCHIVELookup(
        In      => $Home,
        Compare => \%Compare,
        Home    => $Home,
    );

    my $ARCHIVEString = '';
    for my $Key ( sort keys %Result ) {
        $ARCHIVEString .= "$Key:$Result{$Key}\n";
    }

    return ( \$ARCHIVEString, 'ARCHIVE.log' );
}

sub _ARCHIVELookup {
    my ( $Self, %Param ) = @_;
    my @List = glob("$Param{In}/*");

    for my $File (@List) {
        $File =~ s/\/\//\//g;
        if ( -d $File && $File !~ /CVS/ && $File !~ /^doc\// && $File !~ /^var\/tmp/ ) {
            $Self->_ARCHIVELookup(
                In      => $File,
                Compare => $Param{Compare},
                Home    => $Param{Home},
            );
            $File =~ s/\Q$Param{Home}\E//;
        }
        else {
            my $OrigFile = $File;
            $File =~ s/\Q$Param{Home}\E//;
            $File =~ s/^\/(.*)$/$1/;

            if (
                $File !~ /Entries|Repository|Root|CVS|ARCHIVE/
                && $File !~ /^doc\//
                && $File !~ /^var\/tmp/
                )
            {
                if (! open( IN, '<', $OrigFile ) ) {
                    $Self->{LogObject}->Log(
                        Priority => 'error',
                        Message  => "Can't read: $OrigFile: $!",
                    );
                    next;
                }
                my $ctx = Digest::MD5->new;
                $ctx->addfile(*IN);
                my $Digest = $ctx->hexdigest();
                close(IN);
                if ( !$Param{Compare}->{$File} ) {
                    $Param{Compare}->{$File} = "New $File";
                }
                elsif ( $Param{Compare}->{$File} ne $Digest ) {
                    $Param{Compare}->{$File} = "Dif $File";
                }
                elsif ( defined $Param{Compare}->{$File} ) {
                    delete $Param{Compare}->{$File};
                }
            }
        }
    }
    return %{ $Param{Compare} };
}

sub ArchiveApplication {
    my ( $Self, %Param ) = @_;

    my $Home = $Self->{ConfigObject}->Get('Home');
    my $Archive = $Self->{ConfigObject}->Get('Home') . '/var/tmp/application.tar';
    if ( -f $Archive ) {
        unlink $Archive || die "Can't unlink $Archive: $!";
    }

    my @List = $Self->DirectoryFiles( Directory => $Home );

    # add files to the tar archive
    my $TarObject = Archive::Tar->new();

    $TarObject->add_files(@List);

    #Mask Passwords in Config.pm
    my $HomeWithoutSlash = $Home;
    $HomeWithoutSlash =~ s/^\///;
    my $Config = $TarObject->get_content( "$HomeWithoutSlash/Kernel/Config.pm" );

    my @TrimAction = (
        'DatabasePw',
        'SearchUserPw',
        'UserPw',
        'SendmailModule::AuthPassword',
        'AuthModule::Radius::Password',
        'PGP::Key::Password',
        'Customer::AuthModule::DB::CustomerPassword',
        'Customer::AuthModule::Radius::Password',
    );

    ACTION:
    for ( @TrimAction ) {
        next ACTION if !$_;
        $Config =~ s/(^\s+\$Self.*?$_.*?=.*?)\'.*?\';/$1\'xxx\';/mg;
    }
    $Config =~ s/(^\s+Password.*?=>.*?)\'.*?\',/$1\'xxx\',/mg;

    $TarObject->replace_content( "$HomeWithoutSlash/Kernel/Config.pm", $Config );
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
    my $Home = $Self->{ConfigObject}->Get('Home');

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
            if ( $File =~ /\/(var\/article|var\/tmp)/ ) {
                next;
            }
            if ( -s $File > (1024*1024*0.5) ) {
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

    # set default value
    $Param{CustomerInfo} ||= {};

    # create log package
    my ($LogPreContent, $LogPreFilename ) = $Self->LogLast( Type => 'log_pre' );

    # create check package
    my $DataHash = $Self->AdminChecksGet();

    my @CustomerInfo;
    ROW:
    for my $Row ( sort keys %{ $Param{CustomerInfo} } ) {

        next ROW if !$Row;
        next ROW if !$Param{CustomerInfo}->{$Row};

        my %Check = (

            Check       => 'OK',
            Comment     => $Param{CustomerInfo}->{$Row},
            Description => 'Customer Info',
            Name        => $Row,
        );
        push @CustomerInfo, \%Check;
    }

    $DataHash->{CustomerInfo} = \@CustomerInfo;

    my $XMLCheck = $Self->XMLStringCreate( DataHash => $DataHash, );

    # create application package
    my ($Content, $Filename ) = $Self->ArchiveApplication();

    # create ARCHIVE package
    my ($ARCHIVEContent, $ARCHIVEFilename ) = $Self->ARCHIVE();

    # create module check package
    my ($ModuleCheckContent, $ModuleCheckFilename ) = $Self->ModuleCheck();

    # create log package
    my ($LogPostContent, $LogPostFilename ) = $Self->LogLast( Type => 'log_post' );

    # create mail body
    my $Body = '';
    for my $Key ( keys %Param ) {
        $Body .= "$Key:$Param{$Key}\n";
    }
    $Body .= "FQDN:" . $Self->{ConfigObject}->Get('FQDN') . "\n";
    $Body .= "Product:" . $Self->{ConfigObject}->Get('Product') . ' '
        . $Self->{ConfigObject}->Get('Version') . "\n";

    my $Send = $Self->{EmailObject}->Send(
        From       => $Param{Sender} || $Self->{ConfigObject}->Get('AdminEmail'),
        To         => 'support@otrs.com',
        Subject    => 'Support::Request::Auto::Email::CHECK',
        Type       => 'text/plain',
        Charset    => 'utf-8',
        Body       => $Body,
        Attachment => [
            {
                Filename    => $LogPreFilename,
                Content     => ${ $LogPreContent },
                ContentType => 'text/plain',
                Disposition => 'attachment',
            },
            {
                Filename    => 'check.xml',
                Content     => ${ $XMLCheck },
                ContentType => 'text/xml',
                Disposition => 'attachment',
            },
            {
                Filename    => $Filename,
                Content     => ${ $Content },
                ContentType => 'application/octet-stream',
                Disposition => 'attachment',
            },
            {
                Filename    => $ARCHIVEFilename,
                Content     => ${ $ARCHIVEContent },
                ContentType => 'text/plain',
                Disposition => 'attachment',
            },
            {
                Filename    => $ModuleCheckFilename,
                Content     => ${ $ModuleCheckContent },
                ContentType => 'text/plain',
                Disposition => 'attachment',
            },
            {
                Filename    => $LogPostFilename,
                Content     => ${ $LogPostContent },
                ContentType => 'text/plain',
                Disposition => 'attachment',
            },
        ],
    );

    return 1;
}

sub Download {
    my ( $Self, %Param ) = @_;

    my ( $s, $m, $h, $D, $M, $Y, $wd, $yd, $dst ) = $Self->{TimeObject}->SystemTime2Date(
        SystemTime => $Self->{TimeObject}->SystemTime(),
    );
    my $Filename = "SupportInfo_$Y-$M-$D" . '_' . "$h-$m";

    # create log package
    my %File;
    ($File{LogPreContent}, $File{LogPreFilename}) = $Self->LogLast( Type => 'log_pre' );

    # create check package
    my $DataHash = $Self->AdminChecksGet();
    $File{CheckContent}  = $Self->XMLStringCreate( DataHash => $DataHash, );
    $File{CheckFilename} = 'check.xml',

    # create application package
    ($File{AppContent}, $File{AppFilename}) = $Self->ArchiveApplication();

    # create ARCHIVE package
    ($File{ArchContent}, $File{ArchFilename}) = $Self->ARCHIVE();

    # create module check package
    ($File{ModuleCheckContent}, $File{ModuleCheckFilename}) = $Self->ModuleCheck();

    # create log package
    ($File{LogPostContent}, $File{LogPostFilename}) = $Self->LogLast( Type => 'log_post' );

    # create mail body
    my $Body = '';
    for my $Key ( keys %Param ) {
        $Body .= "$Key:$Param{$Key}\n";
    }
    $Body .= "FQDN:" . $Self->{ConfigObject}->Get('FQDN') . "\n";
    $Body .= "Product:" . $Self->{ConfigObject}->Get('Product') . ' '
        . $Self->{ConfigObject}->Get('Version') . "\n";

    $File{BodyContent} = \$Body;
    $File{BodyFilename} = 'Body.txt';

    # save and create archive
    my $TempDir = $Self->{ConfigObject}->Get('TempDir') . '/supportinfo/';

    if ( ! -d $TempDir ) {
        mkdir $TempDir;
    }

    # remove all files
    my @ListOld = glob( $TempDir . '/*' );
    for my $File (@ListOld) {
        unlink $File;
    }

    my @List;
    for my $Key (qw(Body LogPre Check App Arch ModuleCheck LogPost) ) {
        if ( $File{ $Key . 'Filename' } && $File{ $Key . 'Content' } ) {
            my $Filename = $TempDir . '/' . $File{ $Key . 'Filename' };
            open( my $Out, '>', $Filename );
            binmode($Out);
            print $Out ${ $File{ $Key . 'Content' } };
            close $Out;
            push @List, $Filename;
        }
    }

    # add files to the tar archive
    my $Archive = $TempDir . '/' . $Filename;
    my $TarObject = Archive::Tar->new();
    $TarObject->add_files(@List);
    $TarObject->write( $Archive, 0 ) || die "Could not write: $_!";

    # add files to the tar archive
    open( my $Tar, '<', $Archive );
    binmode($Tar);
    my $TmpTar = '';
    while (<$Tar>) {
        $TmpTar .= $_;
    }
    close($Tar);

    # remove all files
    @ListOld = glob( $TempDir . '/*' );
    for my $File (@ListOld) {
        unlink $File;
    }

    if ( $Self->{MainObject}->Require("Compress::Zlib") ) {
        my $GzTar = Compress::Zlib::memGzip($TmpTar);
        return ( \$GzTar, $Filename . '.tar.gz');
    }

    return ( \$TmpTar, $Filename . '.tar' );
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

$Revision: 1.23 $ $Date: 2008/11/26 15:23:24 $

=cut
