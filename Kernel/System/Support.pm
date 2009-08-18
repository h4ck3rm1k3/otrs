# --
# Kernel/System/Support.pm - all required system information
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: Support.pm,v 1.30 2009/08/18 09:02:24 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Support;

use strict;
use warnings;

use Kernel::System::XML;
use Kernel::System::DB;
use Kernel::System::Email;
use Kernel::System::Time;
use Kernel::System::Package;
use Digest::MD5 qw(md5_hex);

use MIME::Base64;
use Archive::Tar;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.30 $) [1];

=head1 NAME

Kernel::System::Support - global system information

=head1 SYNOPSIS

All required support information of a running OTRS system.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create Support object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::Main;
    use Kernel::System::Support;

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
    my $SupportObject = Kernel::System::Support->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        EncodeObject => $EncodeObject,
        MainObject   => $MainObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for (qw(ConfigObject LogObject MainObject EncodeObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    $Self->{XMLObject} = Kernel::System::XML->new(%Param);
    $Self->{DBObject}  = Kernel::System::DB->new(
        ConfigObject => $Self->{ConfigObject},
        MainObject   => $Self->{MainObject},
        LogObject    => $Self->{LogObject},
        EncodeObject => $Self->{EncodeObject},

    );
    $Self->{TimeObject}  = Kernel::System::Time->new(%Param);
    $Self->{EmailObject} = Kernel::System::Email->new(
        ConfigObject => $Self->{ConfigObject},
        MainObject   => $Self->{MainObject},
        LogObject    => $Self->{LogObject},
        DBObject     => $Self->{DBObject},
        TimeObject   => $Self->{TimeObject},
        EncodeObject => $Self->{EncodeObject},
    );
    $Self->{PackageObject} = Kernel::System::Package->new(
        MainObject   => $Self->{MainObject},
        LogObject    => $Self->{LogObject},
        ConfigObject => $Self->{ConfigObject},
        TimeObject   => $Self->{TimeObject},
        DBObject     => $Self->{DBObject},
        EncodeObject => $Self->{EncodeObject},
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
        $ARCHIVEString .= "$Result{$Key}\n";
    }

    return ( \$ARCHIVEString, 'ARCHIVE.log' );
}

sub _ARCHIVELookup {
    my ( $Self, %Param ) = @_;
    my @List = glob("$Param{In}/*");

    FILE:
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

            if ( $File !~ /Entries|Repository|Root|CVS|ARCHIVE/
                && $File !~ /^doc\//
                && $File !~ /^var\/tmp/) {

                if (! -r $OrigFile) {
                    next FILE;
                }
                if (! open( IN, '<', $OrigFile ) ) {
                    $Self->{LogObject}->Log(
                        Priority => 'error',
                        Message  => "Can't read: $OrigFile: $!",
                    );
                    next FILE;
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

sub OpmInfo {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Mode)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    if ($Param{Mode} eq "IsFileInPackageCheck" && !$Param{File}) {
        $Self->{LogObject}->Log( Priority => 'error', Message => "Need Filename!" );
        return;
    }

    if ($Param{Mode} eq "IsFileInPackageCheck") {
        $Param{File} =~ s/\/\//\//g;
        my $Hit = 0;
        for my $Package ( $Self->{PackageObject}->RepositoryList() ) {
            for my $File ( @{ $Package->{Filelist} } ) {
                if ( $Param{File} =~ /^\Q$File->{Location}\E$/ ) {
                    $Hit = 1;
                }
            }
        }
        return $Hit;
    }
    elsif ($Param{Mode} eq "OPMInfo") {
        my $OpmInfo;
        for my $Package ( $Self->{PackageObject}->RepositoryList() ) {
            $OpmInfo .= "+----------------------------------------------------------------------------+\n";
            $OpmInfo .= "| Name:        $Package->{Name}->{Content}\n";
            $OpmInfo .= "| Version:     $Package->{Version}->{Content}\n";
            $OpmInfo .= "| Vendor:      $Package->{Vendor}->{Content}\n";
            $OpmInfo .= "| URL:         $Package->{URL}->{Content}\n";
            $OpmInfo .= "| License:     $Package->{License}->{Content}\n";
        }
        $OpmInfo .= "+----------------------------------------------------------------------------+\n";

        return ( \$OpmInfo, 'InstalledPackages.log' );
    }
    else {
        $Self->{LogObject}->Log( Priority => 'error', Message => "Wrong mode in Function OpmInfo!" );
        return;
    }
}

sub ArchiveApplication {
    my ( $Self, %Param ) = @_;

    my $Home = $Self->{ConfigObject}->Get('Home');
    my $Archive = $Self->{ConfigObject}->Get('Home') . '/var/tmp/application.tar';
    if ( -f $Archive ) {
        unlink $Archive || die "Can't unlink $Archive: $!";
    }

    my @List;
    for my $ListElement ($Self->DirectoryFiles( Directory => $Home )) {
        if (-r $ListElement) {
            push (@List, $ListElement)
        }
    }
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

        return ( \$GzTar, 'application.tar.gz');
    }

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

    # article directory
    my $ArticleDir = $Self->{ConfigObject}->Get('ArticleDir');

    # cleanup file name
    $ArticleDir =~ s/\/\//\//g;

    # temp directory
    my $TempDir = $Self->{ConfigObject}->Get('TempDir');

    # cleanup file name
    $TempDir =~ s/\/\//\//g;

    # check all $Param{Directory}/* in home directory
    my @Files = ();
    my @List = glob("$Param{Directory}/*");
    for my $File (@List) {

        # cleanup file name
        $File =~ s/\/\//\//g;

        # check if directory
        if (-d $File ) {

            # do not include CVS directories
            next if $File =~ /\/CVS/;

            # do not include article in file system
            next if $File =~ /\Q$ArticleDir\E/i;

            # do not include tmp in file system
            next if $File =~ /\Q$TempDir\E/i;

            # add directory to list
            push @Files, $Self->DirectoryFiles( Directory => $File );
        }
        else {

            # do not include hidden files
            next if $File =~ /^\./;

            # do not include files with # in file name
            next if $File =~ /#/;

            # do not include if file is bigger the 0.5 MB
            next if ( -s $File > (1024*1024*0.5) );

            # do not include if file is not readable
            next if ! -r $File;

            # add file to list
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

    # create OPM Info package like ./opm.pl -a list
    my ($OPMInfoContent, $OPMInfoFilename ) = $Self->OpmInfo(Mode => "OPMInfo");

    # create module check package
    my ($ModuleCheckContent, $ModuleCheckFilename ) = $Self->ModuleCheck();

    # create log package
    my ($LogPostContent, $LogPostFilename ) = $Self->LogLast( Type => 'log_post' );

    # create mail body
    my $Body = '';
    for my $Key ( sort keys %{ $Param{CustomerInfo} } ) {
        $Body .= "$Key:$Param{CustomerInfo}->{$Key}\n";
    }

    #Get the FQDN
    $Body .= "FQDN:" . $Self->{ConfigObject}->Get('FQDN') . "\n";

    #Get the otrs version and if installed add other product info like SIRIOS or ITSM.
    $Body .= $Self->GetInstalledProduct();

    my $Send = $Self->{EmailObject}->Send(
        From       => $Param{CustomerInfo}->{Sender},
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
                Filename    => $OPMInfoFilename,
                Content     => ${ $OPMInfoContent },
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

    # create OPM Info package like ./opm.pl -a list
    ($File{OPMInfoContent}, $File{OPMInfoFilename}) = $Self->OpmInfo(Mode => "OPMInfo");

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
    $Body .= $Self->GetInstalledProduct();

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
    for my $Key (qw(Body LogPre Check App Arch ModuleCheck LogPost OPMInfo) ) {
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

sub GetInstalledProduct {
    my ( $Self, %Param ) = @_;
    my $Product;
    my %Tool = (
        SIRIOS => 0,
        ITSM   => 0,
        WIDAuthoring    => 0,
        WIDPublicationSystem    => 0,
    );

    $Product = "Product:" . $Self->{ConfigObject}->Get('Product') . ' '
        . $Self->{ConfigObject}->Get('Version');

    for my $Package ( $Self->{PackageObject}->RepositoryList() ) {
        for my $Tools (keys %Tool) {
            if ( $Tools =~ /^\Q$Package->{Name}->{Content}\E$/ ) {
                if ($Tool{$Tools} == 0) {
                    $Product .= " / $Package->{Name}->{Content}";
                }
                $Tool{$Tools} = 1;
            }
        }
    }
    return $Product;
}

sub Benchmark {
    my ( $Self, %Param ) = @_;

    my $Insert = $Param{Insert};
    my $Update = $Param{Update};
    my $Select = $Param{Select};
    my $Mode = $Param{Mode};

    foreach (1..$Mode) {
        $Self->{"DBObject$_"} = Kernel::System::DB->new(%{$Self});
    }

    $Param{InsertTime} = 0;
    $Param{UpdateTime} = 0;
    $Param{SelectTime} = 0;
    $Param{DeleteTime} = 0;
    my $TimeStart = $Self->{TimeObject}->SystemTime();
    $Self->_SQLInsert($Insert, $Mode);
    my $Time1 = $Self->{TimeObject}->SystemTime();
    $Self->_SQLUpdate($Update, $Mode);
    my $Time2 = $Self->{TimeObject}->SystemTime();
    $Self->_SQLSelect($Select, $Mode);
    my $Time3 = $Self->{TimeObject}->SystemTime();
    $Self->_SQLDelete($Insert, $Mode);
    my $Time4 = $Self->{TimeObject}->SystemTime();
    $Param{InsertTime} = $Param{InsertTime}+$Time1-$TimeStart;
    $Param{UpdateTime} = $Param{UpdateTime}+$Time2-$Time1;
    $Param{SelectTime} = $Param{SelectTime}+$Time3-$Time2;
    $Param{DeleteTime} = $Param{DeleteTime}+$Time4-$Time3;

    my $InsertTime = ($Param{InsertTime}/$Mode)*(10000/$Insert);
    if ( $InsertTime <= 3 ) {
        $Param{InsertMood} = ':-)';
        $Param{InsertComment}    = '$Text{"Looks fine!"}',
    }
    elsif ( $InsertTime <= 5 ) {
        $Param{InsertMood} = ':-|';
        $Param{InsertComment}    = '$Text{"Ok"}';
    }
    else {
        $Param{InsertMood} = ':-(';
        my $ShouldTake  = int( $Mode * 5 );
        $Param{InsertComment} = '$Text{"Should not take more then %s on an average system.", "' . $ShouldTake . 's"}',
    }

    my $UpdateTime = ($Param{UpdateTime}/$Mode)*(10000/$Update);
    if ( $UpdateTime <= 5 ) {
        $Param{UpdateMood} = ':-)';
        $Param{UpdateComment} = '$Text{"Looks fine!"}',
    }
    elsif ( $UpdateTime <= 9 ) {
        $Param{UpdateMood} = ':-|';
        $Param{UpdateComment}    = '$Text{"Ok"}';
    }
    else {
        $Param{UpdateMood} = ':-(';
        my $ShouldTake  = int( $Mode * 9 );
        $Param{UpdateComment} = '$Text{"Should not take more then %s on an average system.", "' . $ShouldTake . 's"}',
    }

    my $SelectTime = ($Param{SelectTime}/$Mode)*(10000/$Select);
    if ( $SelectTime <= 5 ) {
        $Param{SelectMood} = ':-)';
        $Param{SelectComment} = '$Text{"Looks fine!"}',
    }
    elsif ( $SelectTime <= 6 ) {
        $Param{SelectMood} = ':-|';
        $Param{SelectComment}    = '$Text{"Ok"}';
    }
    else {
        $Param{SelectMood} = ':-(';
        my $ShouldTake  = int( $Mode * 6 );
        $Param{SelectComment} = '$Text{"Should not take more then %s on an average system.", "' . $ShouldTake . 's"}',
    }

    my $DeleteTime = ($Param{DeleteTime}/$Mode);
    if ( $DeleteTime <= 4 ) {
        $Param{DeleteMood} = ':-)';
        $Param{DeleteComment} = '$Text{"Looks fine!"}',
    }
    elsif ( $DeleteTime <= 5 ) {
        $Param{DeleteMood} = ':-|';
        $Param{DeleteComment}    = '$Text{"Ok"}';
    }
    else {
        $Param{DeleteMood} = ':-(';
        my $ShouldTake  = int( $Mode * 5 );
        $Param{DeleteComment} = '$Text{"Should not take more then %s on an average system.", "' . $ShouldTake . 's"}',
    }

    return %Param;
}

sub _SQLInsert {
    my $Self = shift;
    my $Count = shift;
    my $Mode = shift;
    foreach my $C (1..$Count) {
        foreach my $M (1..$Mode) {
            my $Value1  = "aaa$C-$M";
            my $Value2  = 'bbb';
            $Self->{"DBObject$M"}->Do(
                SQL => 'INSERT INTO support_bench_test (name_a, name_b) values (?, ?)',
                Bind => [ \$Value1, \$Value2, ],
            );
        }
    }
    return 1;
}

sub _SQLUpdate {
    my $Self = shift;
    my $Count = shift;
    my $Mode = shift;
    my $Value1 = '111';
    my $Value2 = '222';
    foreach my $C (1..$Count) {
        foreach my $M (1..$Mode) {
            my $Value  = "aaa$C-$M";
            $Self->{"DBObject$M"}->Do(
                SQL => 'UPDATE support_bench_test SET name_a = ?, name_b = ? WHERE name_a = ?',
                Bind => [ \$Value1, \$Value2, \$Value ],
            );
        }
    }
    return 1;
}

sub _SQLSelect {
    my $Self = shift;
    my $Count = shift;
    my $Mode = shift;
    foreach my $C (1..$Count) {
        foreach my $M (1..$Mode) {
#            my $Value = "aaa$C-$M";
#            $Self->{"DBObject$M"}->Prepare(
#                SQL  => 'SELECT name_a, name_b FROM support_bench_test WHERE name_a = ?',
#                Bind => [ \$Value ],
#            );
            my $Value = $Self->{DBObject}->Quote("aaa$C-$M");
            $Self->{"DBObject$M"}->Prepare(
                SQL  => "SELECT name_a, name_b FROM support_bench_test WHERE name_a = '$Value'",
            );
            while (my @Row = $Self->{"DBObject$M"}->FetchrowArray()) {
                # do nothing
            }
        }
    }
    return 1;
}

sub _SQLDelete {
    my $Self = shift;
    my $Count = shift;
    my $Mode = shift;
    foreach my $C (1..$Count) {
        foreach my $M (1..$Mode) {
            my $Value  = "111$C-$M";
            $Self->{"DBObject$M"}->Do(
                SQL => 'DELETE FROM support_bench_test WHERE name_a = ?',
                Bind => [ \$Value ],
            );
        }
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

$Revision: 1.30 $ $Date: 2009/08/18 09:02:24 $

=cut
