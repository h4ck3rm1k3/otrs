# --
# Kernel/System/Support.pm - all required system informations
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: Support.pm,v 1.4 2007/05/08 14:56:34 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::System::Support;

use strict;

use Kernel::System::XML;
use Kernel::System::DB;
use Kernel::System::Email;
use Kernel::System::Time;

use vars qw(@ISA $VERSION);
$VERSION = '$Revision: 1.4 $';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

=head1 NAME

Kernel::System::Support - global system informations

=head1 SYNOPSIS

All required support informations to a running OTRS system.

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
    my $Type = shift;
    my %Param = @_;
    # allocate new hash for object
    my $Self = {};
    bless ($Self, $Type);
    # check needed objects
    foreach (qw(ConfigObject LogObject MainObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }
    $Self->{XMLObject} = Kernel::System::XML->new(%Param);
    $Self->{DBObject} = Kernel::System::DB->new(
        ConfigObject => $Self->{ConfigObject},
        MainObject => $Self->{MainObject},
        LogObject => $Self->{LogObject},

    );
    $Self->{TimeObject} = Kernel::System::Time->new(%Param);
    $Self->{EmailObject} = Kernel::System::Email->new(
        ConfigObject => $Self->{ConfigObject},
        MainObject => $Self->{MainObject},
        LogObject => $Self->{LogObject},
        DBObject => $Self->{DBObject},
        TimeObject => $Self->{TimeObject},
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
    my $Self = shift;
    my %Param = @_;
    # check needed stuff
    foreach (qw(ConfigHash)) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
    # check if $ConfigHash ne a HashRef
    if (ref($Param{ConfigHash}) ne 'HASH') {
        $Self->{LogObject}->Log(Priority => 'error', Message => "ConfigHash must be a hash reference!");
        return;
    }
    # get the directory name
    my $DirName = $Self->{ConfigObject}->Get('Home').'/Kernel/System/Support/';
    # read all availible modules in @List
    my @List = glob($DirName."/*.pm");
    foreach my $File (@List) {
        # remove .pm
        $File =~ s/^.*\/(.+?)\.pm$/$1/;
        my $GenericModule = "Kernel::System::Support::$File";
        # load module $GenericModule and check if loadable
        if ($Self->{MainObject}->Require($GenericModule)){
            # create new object
            my $SupportObject = $GenericModule->new(%{$Self});
            if ($SupportObject) {
                my $ArrayRef = $SupportObject->SupportConfigArrayGet();
                if ($ArrayRef && ref($ArrayRef) eq 'ARRAY') {
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
    my $Self = shift;
    my %Param = @_;
    # check needed stuff
    foreach (qw(DataHash InputHash)) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
    # check if $DataHash and $InputHash ne a HashRef
    if (ref($Param{DataHash}) ne 'HASH' || ref($Param{InputHash}) ne 'HASH') {
        $Self->{LogObject}->Log(Priority => 'error', Message => "DataHash and InputHash must be a hash reference!");
        return;
    }

    # get the directory name
    my $DirName = $Self->{ConfigObject}->Get('Home').'/Kernel/System/Support/';

    # read all availible modules in @List
    my @List = glob($DirName."/*.pm");
    foreach my $File (@List) {
        # remove .pm
        $File =~ s/^.*\/(.+?)\.pm$/$1/;
        my $GenericModule = "Kernel::System::Support::$File";
        # load module $GenericModule and check if loadable
        if ($Self->{MainObject}->Require($GenericModule)){
            # create new object
            my $SupportObject = $GenericModule->new(%{$Self});
            if ($SupportObject && $Param{InputHash}->{$File}) {
                my $ArrayRef = $SupportObject->SupportInfoGet(
                    ModuleInputHash => $Param{InputHash}->{$File},
                );
                # check if return value is valid a arrayref
                if (@{$ArrayRef}) {
                    my $StructureOK = 1;
                    # check if the arrayref includes only valid hashrefs
                    foreach my $Element (@{$ArrayRef}) {
                        if (ref($Element) ne 'HASH') {
                            $StructureOK = 0;
                        }
                    }
                    if ($StructureOK eq "1") {
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

    my $List = $Support->AdminChecksGet(DataHash => $DataHash);

=cut

sub AdminChecksGet {
    my $Self = shift;
    my %Param = @_;
    # check needed stuff
    foreach (qw(DataHash)) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
    # check if $DataHash ne a HashRef
    if (ref($Param{DataHash}) ne 'HASH') {
        $Self->{LogObject}->Log(Priority => 'error', Message => "DataHash must be a hash reference!");
        return;
    }
    # get the directory name
    my $DirName = $Self->{ConfigObject}->Get('Home').'/Kernel/System/Support/';

    # read all availible modules in @List
    my @List = glob($DirName."/*.pm");
    foreach my $File (@List) {
        # remove .pm
        $File =~ s/^.*\/(.+?)\.pm$/$1/;
        my $GenericModule = "Kernel::System::Support::$File";
        # load module $GenericModule and check if loadable
        if ($Self->{MainObject}->Require($GenericModule)){
            # create new object
            my $SupportObject = $GenericModule->new(%{$Self});
            if ($SupportObject) {
                my $ArrayRef = $SupportObject->AdminChecksGet();
                # check if return value is valid a arrayref
                if (@{$ArrayRef}) {
                    my $StructureOK = 1;
                    # check if the arrayref includes only valid hashrefs
                    foreach my $Element (@{$ArrayRef}) {
                        if (ref($Element) ne 'HASH') {
                            $StructureOK = 0;
                        }
                    }
                    if ($StructureOK eq "1") {
                        $Param{DataHash}->{$File} = $ArrayRef;
                    }
                }
            }
        }
    }
    return 1;
}

=item XMLStringCreate()

returns a string with xml.

    my $List = $Support->XMLStringCreate(Data => $Data);

<?xml version="1.0" encoding="iso-8859-1"?>
<SupportInfo>
    <Hardware>
        <MemorySwapCheck>
            <Check>OK</Check>
            <Comment>The Host System has 1011 MB Memory total. 108 MB Memory free. 643 MB Swap total. 643 MB Swap free. </Comment>
            <Description>A Memory Check. We try to find out if SwapFree : SwapTotal &lt; 60 % or if more than 200 MB Swap is used.</Description>
            <Name>Memory Swap Check</Name>
            <Key>MemorySwapCheck</Key>
        </MemorySwapCheck>
    </Hardware>
</SupportInfo>

=cut

sub XMLStringCreate {
    my $Self = shift;
    my %Param = @_;
    # check needed stuff
    foreach (qw(DataHash)) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
    if (ref($Param{DataHash}) ne 'HASH') {
        $Self->{LogObject}->Log(Priority => 'error', Message => "DataHash must be a hash reference!");
        return;
    }

    my $XMLHash = [];
    foreach my $Module (keys %{$Param{DataHash}}) {
        foreach my $DataHashRow (@{$Param{DataHash}->{$Module}}) {
            my $Data = {};
            foreach my $Element (keys %{$DataHashRow}) {
                if ($Element eq 'Key') {
                    next;
                }
                $DataHashRow->{$Element} =~ s/\015\012|\012|\015//g;
                $Data->{$Element}->[1]->{Content} = quotemeta($DataHashRow->{$Element});
            }
            $XMLHash->[1]->{SupportInfo}->[1]->{$Module}->[1]->{$DataHashRow->{Key}}->[1] = $Data;
        }
    }

    my $XMLString = $Self->{XMLObject}->XMLHash2XML(@{$XMLHash});

    return $XMLString;
}

sub SupportSendInfo {
    my $Self = shift;
    my %Param = @_;
    my $Message = "";
    # check needed stuff
    foreach (qw(XMLString)) {
        if (!$Param{$_}) {
            $Self->{LogObject}->Log(Priority => 'error', Message => "Need $_!");
            return;
        }
    }
    # send mail to gateway
    if ($Self->{EmailObject}->Send(
        From => $Self->{ConfigObject}->Get('AdminEmail'),
        To => 'sr@otrs.com',
        Subject => 'Customer SystemInfo from',
        Type => 'text/plain',
        Charset => 'utf-8',
        Body => 'Customer SupportInfo',
        Loop => 1, # not required, removes smtp from
        Attachment => [{
        Filename    => "SupportID-$Param{SupportID}.xml",
        Content     => "$Param{XMLString}",
            ContentType => "application/xml",
            }],
        )) {
            $Message = "Email sent to the ((otrs)) support team.\n";
    }
    else {
        $Message = 'Can\'t send email to the ((otrs)) support team!'."\n\n".
            "You will found the otrs system information package at\n".
            "If you would like to use OTRS support services please send the package to support\@otrs.com or call\n".
            "our support team per phone to review the next step\n\n".
            " More about OTRS support or face-to-face contact information you will found at\n".
            'http://www.otrs.com/'."\n\n";
    }
    return $Message;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see http://www.gnu.org/licenses/gpl.txt.

=cut

=head1 VERSION

$Revision: 1.4 $ $Date: 2007/05/08 14:56:34 $

=cut