#!/usr/bin/perl -w
# --
# bin/otrs.CreateTranslationFile.pl - create new translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: otrs.CreateTranslationFile.pl,v 1.27 2011/01/24 19:51:23 ub Exp $
# --
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU AFFERO General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# or see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;

# use ../ as lib location
use File::Basename;
use FindBin qw($RealBin);
use lib dirname($RealBin);

use vars qw($VERSION);
$VERSION = qw($Revision: 1.27 $) [1];

use Getopt::Std qw();
use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::Time;
use Kernel::System::DB;
use Kernel::Language;
use Kernel::System::SysConfig;

sub PrintUsage {
    print <<"EOF";

otrs.CreateTranslationFile.pl <Revision $VERSION> - update translation files
Copyright (C) 2001-2010 OTRS AG, http://otrs.org/

Translating OTRS
================

  Make sure that you have a clean system with a current configuration. No modules
  may be installed or linked into the system!

    otrs.CreateTranslationFile -l <Language>
    otrs.CreateTranslationFile -l all

Translating Extension Modules
=============================

  Make sure that you have a clean system with a current configuration. The module
  that needs to be translated has to be installed or linked into the system, but
  only this one!

    otrs.CreateTranslationFile -l <Language> -m <module_directory>
    otrs.CreateTranslationFile -l all -m <module_directory>

EOF
}

# common objects
my %CommonObject = ();
$CommonObject{ConfigObject} = Kernel::Config->new();
$CommonObject{EncodeObject} = Kernel::System::Encode->new(%CommonObject);
$CommonObject{LogObject}    = Kernel::System::Log->new(
    LogPrefix => 'OTRS-otrs.CreateTranslationFile.pl',
    %CommonObject,
);
$CommonObject{MainObject}      = Kernel::System::Main->new(%CommonObject);
$CommonObject{TimeObject}      = Kernel::System::Time->new(%CommonObject);
$CommonObject{DBObject}        = Kernel::System::DB->new(%CommonObject);
$CommonObject{SysConfigObject} = Kernel::System::SysConfig->new(%CommonObject);

my $Home = $CommonObject{ConfigObject}->Get('Home');

{
    my @Languages;
    my %Opts;

    # get opts
    Getopt::Std::getopt( 'lm', \%Opts );

    # check params
    if ( $Opts{l} && $Opts{l} eq 'all' ) {
        my %DefaultUsedLanguages = %{ $CommonObject{ConfigObject}->Get('DefaultUsedLanguages') };
        @Languages = sort keys %DefaultUsedLanguages;

        # ignore en*.pm files
        @Languages = grep { $_ !~ m{ \A en .* }xms } @Languages;
    }
    elsif ( $Opts{l} ) {
        push @Languages, $Opts{l};
        if ( !-f "$Home/Kernel/Language/$Languages[0].pm" ) {
            print "ERROR: No core translation file: $Languages[0]!\n";
            exit 1;
        }
    }
    else {
        PrintUsage();
        exit 0;
    }

    print "Starting...\n\n";

    for my $Language (@Languages) {
        HandleLanguage(
            Language => $Language,
            Module   => $Opts{m},
        );
    }

    print "\n\nFinished.\n";
}

sub HandleLanguage {
    my %Param = @_;

    my $Language = $Param{Language};
    my $Module   = $Param{Module};

    my $ModuleDirectory = $Module;
    my $LanguageFile;
    my $TargetFile;
    my $IsSubTranslation;
    my $Indent = ' ' x 8;    # 8 spaces for core files

    my $DefaultTheme = $CommonObject{ConfigObject}->Get('DefaultTheme');

    if ( !$Module ) {
        $LanguageFile = "$Home/Kernel/Language/$Language.pm";
        $TargetFile   = "$Home/Kernel/Language/$Language.pm";
    }
    else {
        $IsSubTranslation = 1;
        $Indent           = ' ' x 4;    # 4 spaces for module files

        # extract module name from module path
        $Module =~ s{ \A .* / (.+) /? \z }{$1}xms;

        # remove underscores and/or version numbers and following from module name
        # i.e. FAQ_2_0 or FAQ20
        $Module =~ s{ [_0-9]+ .+ \z }{}xms;

        # special handling of some ITSM modules
        if ( $Module eq 'ITSMIncidentProblemManagement' ) {
            $Module = 'ITSMTicket';
        }
        elsif ( $Module eq 'ITSMConfigurationManagement' ) {
            $Module = 'ITSMConfigItem';
        }

        # save module directory in target file
        $TargetFile = "$ModuleDirectory/Kernel/Language/${Language}_$Module.pm";
    }

    if ( !-w $TargetFile ) {
        print STDERR "Ignoring nonexisting file $TargetFile!\n";
        return;
    }

    if ($IsSubTranslation) {
        print
            "Processing language $Language template files from $Module, writing output to $TargetFile\n";
    }
    else {
        print "Processing language $Language template files, writing output to $TargetFile\n";
    }

    # Language file, which only contains the OTRS core translations
    my $LanguageCoreObject = Kernel::Language->new(
        %CommonObject,
        UserLanguage    => $Language,
        TranslationFile => 1,
    );

    # Language file, which contains all translations
    my $LanguageObject = Kernel::Language->new(
        %CommonObject,
        UserLanguage => $Language,
    );

    # open .dtl files and write new translation file
    my $Data = '';
    my %UsedWords;
    my %UsedWordsMisc;
    my $Directory
        = $IsSubTranslation
        ? "$ModuleDirectory/Kernel/Output/HTML/$DefaultTheme"
        : "$Home/Kernel/Output/HTML/$DefaultTheme";

    my @List = $CommonObject{MainObject}->DirectoryRead(
        Directory => $Directory,
        Filter    => '*.dtl',
    );

    print "\nReading template files:\n";

    for my $File (@List) {
        if ( open my $In, '<', $File ) {
            my $Content = '';
            while ( my $Line = <$In> ) {
                if ( $Line !~ /^#/ ) {
                    $Content .= $Line;
                }
            }
            close $In;
            $File =~ s!^.*/(.+?)\.dtl!$1!;
            print "$File ";
            $Data .= "\n" . $Indent . "# Template: $File\n";

            # replace data tags so that stuff like
            #   $Text{"$Data{"ernie"}"} will not be translated
            $Content =~ s{
            \$(Env|Data|QData)({"(.+?)"}|{""}|{"(.+?)","(.+?)"})
        }
        {}gx;

            # replace $Config so that stuff like
            #   $Text{"$Config{"Ticket::Frontend::TimeUnits"}"} will be translated
            $Content =~ s{
            \$Config\{"([^\}]+?)?"\}
        }
        {
            if ( defined $1 ) {
                $CommonObject{ConfigObject}->Get($1) || '';
            }
            else {
                '';
            }
        }egx;

            # do translation
            $Content =~ s{
            \$(?:JS)?Text\{"([^\}]+?)?"(?:,[^\}]+)?\}
        }
        {
            my $Word = '';
            if ( defined $1 ) {
                $Word = $1;
            }

            # if we translate a module, we must handle also that possibly
            # there is already a translation in the core files
            if ($IsSubTranslation) {
                # ignore word if already used
                if ( $Word && !exists $UsedWords{$Word} && !exists $LanguageCoreObject->{Translation}->{$Word} ) {

                    # remove it from misc list
                    $UsedWordsMisc{$Word} = 1;

                    # lookup for existing translation
                    $UsedWords{$Word} = $LanguageObject->{Translation}->{$Word};
                    my $Translation = $UsedWords{$Word} || '';
                    $Translation =~ s/'/\\'/g;
                    my $Key = $Word;
                    $Key =~ s/'/\\'/g;
                    if ($Key !~ /(a href|\$(Text|Quote)\{")/i) {
                        $Data .= $Indent . "\$Self->{Translation}->{'$Key'} = '$Translation';\n";
                    }
                }
            }
            else {
                # ignore word if already used
                if ( $Word && !exists $UsedWords{$Word} ) {

                    # remove it from misc list
                    $UsedWordsMisc{$Word} = 1;

                    # lookup for existing translation
                    $UsedWords{$Word} = $LanguageCoreObject->{Translation}->{$Word};
                    my $Translation = $UsedWords{$Word} || '';
                    $Translation =~ s/'/\\'/g;
                    my $Key = $Word;
                    $Key =~ s/'/\\'/g;
                    if ($Key !~ /(a href|\$(Text|Quote)\{")/i) {
                        $Data .= $Indent . "'$Key' => '$Translation',\n";
                    }
                }
            }
            '';
        }egx;
        }
        else {
            die "Can't open $File: $!";
        }
    }

    # add translatable strings from SysConfig
    print "SysConfig\n";
    $Data .= "\n" . $Indent . "# SysConfig\n";
    my @Strings = $CommonObject{SysConfigObject}->ConfigItemTranslatableStrings();

    STRING:
    for my $String ( sort @Strings ) {

        next STRING if !$String;

        # skip if we translate a module and the word already exists in the core translation
        next STRING if $IsSubTranslation && exists $LanguageCoreObject->{Translation}->{$String};

        # ignore word if already used
        next STRING if exists $UsedWords{$String};

        # remove it from misc list
        $UsedWordsMisc{$String} = 1;

        # lookup for existing translation
        $UsedWords{$String}
            = ( $IsSubTranslation ? $LanguageObject : $LanguageCoreObject )->{Translation}
            ->{$String};

        my $Translation = $UsedWords{$String} || '';
        $Translation =~ s/'/\\'/g;
        my $Key = $String;
        $Key =~ s/'/\\'/g;
        if ($IsSubTranslation) {
            $Data .= $Indent . "\$Self->{Translation}->{'$Key'} = '$Translation';\n";
        }
        else {
            $Data .= $Indent . "'$Key' => '$Translation',\n";
        }
    }

    # add misc words
    print "Obsolete Entries\n\n";
    $Data .= "\n";
    $Data .= $Indent . "#\n";
    $Data .= $Indent . "# OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!\n";
    $Data .= $Indent . "#\n";

    KEY:
    for my $Key ( sort keys %{ $LanguageObject->{Translation} } ) {

        # ignore words from the core if we are translating a module
        next KEY if $IsSubTranslation && exists $LanguageCoreObject->{Translation}->{$Key};

        # ignore word if already used
        next KEY if $UsedWordsMisc{$Key};

        my $Translation = $LanguageObject->{Translation}->{$Key};
        $Translation =~ s/'/\\'/g;
        $Key         =~ s/'/\\'/g;

        # if a string was previously in a DTL, but has not yet been translated,
        # there's no need to preserve it in the translation file.
        next KEY if !$Translation;

        # TODO: clarify if regular expression check is still needed
        # in the past it was used to guard against wrong matches
        next KEY if $Key =~ /(a href|\$(Text|Quote)\{")/i;

        if ($IsSubTranslation) {
            $Data .= $Indent . "\$Self->{Translation}->{'$Key'} = '$Translation';\n";
        }
        else {
            $Data .= $Indent . "'$Key' => '$Translation',\n";
        }
    }

    # open old translation file
    my %MetaData;
    my $NewOut = '';

    # translating a module
    if ($IsSubTranslation) {

        # needed for cvs check-in filter
        my $Separator = "# --";

        $NewOut = <<"EOF";
$Separator
# Kernel/Language/${Language}_$Module.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
$Separator
# \$Id\$
$Separator
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
$Separator

package Kernel::Language::${Language}_$Module;

use strict;

sub Data {
    my \$Self = shift;
$Data
}

1;
EOF
    }

    # translating the core
    else {
        open( my $In, '<', $LanguageFile ) || die "Can't open: $LanguageFile\n";
        while (<$In>) {
            if ( !$MetaData{DataPrinted} ) {
                $NewOut .= $_;
            }
            if ( $_ =~ /\$\$START\$\$/ && !$MetaData{DataPrinted} ) {
                $MetaData{DataPrinted} = 1;

                my ( $Sec, $Min, $Hour, $Day, $Month, $Year )
                    = $CommonObject{TimeObject}->SystemTime2Date(
                    SystemTime => $CommonObject{TimeObject}->SystemTime(),
                    );

                $NewOut .= <<"EOF";
    # Last translation file sync: $Year-$Month-$Day $Hour:$Min:$Sec

    # possible charsets
EOF
                $NewOut .= "    \$Self->{Charset} = [";
                for ( $LanguageCoreObject->GetPossibleCharsets() ) {
                    $NewOut .= "'$_', ";
                }
                $NewOut .= "];\n";
                $NewOut .= <<"EOF";
    # date formats (\%A=WeekDay;\%B=LongMonth;\%T=Time;\%D=Day;\%M=Month;\%Y=Year;)
    \$Self->{DateFormat}          = '$LanguageCoreObject->{DateFormat}';
    \$Self->{DateFormatLong}      = '$LanguageCoreObject->{DateFormatLong}';
    \$Self->{DateFormatShort}     = '$LanguageCoreObject->{DateFormatShort}';
    \$Self->{DateInputFormat}     = '$LanguageCoreObject->{DateInputFormat}';
    \$Self->{DateInputFormatLong} = '$LanguageCoreObject->{DateInputFormatLong}';

    # csv separator
    \$Self->{Separator} = '$LanguageCoreObject->{Separator}';

EOF

                if ( $LanguageCoreObject->{TextDirection} ) {
                    $NewOut .= <<"EOF";
    # TextDirection rtl or ltr
    \$Self->{TextDirection} = '$LanguageCoreObject->{TextDirection}';

EOF
                }
                $NewOut .= <<"EOF";
    \$Self->{Translation} = {
$Data
EOF
            }
            if ( $_ =~ /\$\$STOP\$\$/ ) {
                $NewOut .= "    };\n";
                $NewOut .= "$_";
                $MetaData{DataPrinted} = 0;
            }
        }
        close $In;
    }

    if ( -e $TargetFile ) {
        print "Moving $TargetFile to $TargetFile.old\n";
        rename( $TargetFile, "$TargetFile.old" ) || die $!;
    }

    print "Writing $TargetFile\n";
    open( my $Out, '>', $TargetFile ) || die $!;
    print $Out $NewOut;
    close $Out;
}
