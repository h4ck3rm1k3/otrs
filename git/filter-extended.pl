#!/usr/bin/perl -w
# --
# filter-extended.pl - the otrs code filer
# Copyright (C) 2003-2012 OTRS AG, http://otrs.com/
# --
# $Id: filter-extended.pl,v 1.412 2012/01/04 14:11:47 jh Exp $
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

use File::Basename;
use File::Copy qw(copy);
use File::Temp qw(tempfile);
use Perl::Tidy;
use List::Util qw(first);

my $Directory = $ARGV[0];
$Directory =~ s/\/\//\//g; # cleanup of double // in $Directory
shift @ARGV;
my %Return;

# check if some connects over a external network
if ($ENV{REMOTE_HOST} && $ENV{REMOTE_HOST} !~ /(172.17.17|10.8.0)/) {
    print "ERROR: Your REMOTE_HOST is $ENV{REMOTE_HOST}\n";
    print "ERROR: But your REMOTE_HOST should be localhost, 10.8.0.* or 172.17.17.*\n";
    print "ERROR: Perhaps you forgot to use openvpn?\n";
    print "ERROR: For questions ask tr.\n";
    exit 1;
}

print "NOTICE: filter-extended.pl is used.\n";

# check all commited files
for my $File (@ARGV) {

    if ( !-e $File) {
        print "FILTER: Can't find $Directory $File\n";
        exit 0;
    }

    # don't check the files of these directories
    next if $Directory =~ m{cpan}smxi;
    next if $Directory =~ m{Pub-System\/Announcements}smxi;
    next if $Directory =~ m{yui}smxi;
    next if $Directory =~ m{fckeditor}smxi;
    next if $Directory =~ m{thirdparty}smxi;
    next if $Directory =~ m{js\/test\/sample}smxi;
    next if $Directory =~ m{BffBundCTI}smxi;

    # don't check these files
    next if $File =~ m{\.project$}smx;
    next if $File =~ m{\.dia$}smx;
    next if $File =~ m{\.mwb$}smx;
    next if $File =~ m{\.gif$}smx;
    next if $File =~ m{\.png$}smx;
    next if $File =~ m{\.jpg$}smx;
    next if $File =~ m{\.pdf$}smx;
    next if $File =~ m{\.ico$}smx;
    next if $File =~ m{\.ppt$}smx;
    next if $File =~ m{\.swf$}smx;
    next if $File =~ m{\.psd$}smx;
    next if $File =~ m{\.odg$}smx;
    next if $File =~ m{\.jar$}smx;
    next if $File =~ m{\.ttf$}smx;
    next if $File =~ m{\.cvsignore$}smx;
    next if $File =~ m{PublicSaaSCockpitRegister\.dtl$}smx;
    next if $File =~ m{CustomerSaaSCockpitBillingSubscriptionChange\.dtl$}smx;
    next if $File =~ m{HTTP\.pm$}smx;

    # create a hash with the file data
    my $Filehandle;
    if ( !open $Filehandle, '<', $File ) {
        print "Can't open File: $File!\n";
        exit 1;
    }
    my @ContentArray = <$Filehandle>;
    close $Filehandle;

    my $ContentString = join '', @ContentArray;

    my %FileData = (
        Directory       => $Directory,
        Name            => basename( $File ),
        ContentString   => $ContentString,
        ContentArrayRef => \@ContentArray,
        # Module => 'xx',
        # This information can make sence but I don't know how to get it!
    );

    print "NOTICE: =================================================\n";
    print "NOTICE: File: $Directory/$File!\n";
    print "NOTICE:\n";

    $Return{AGPL3LicenseCheck}         = _AGPL3LicenseCheck($File, $Directory);
    $Return{AGPL3LicenseCheckForSOPM}  = _AGPL3LicenseCheckForSOPM($File, $Directory);
    $Return{DTLCheck}                  = _DTLCheck(%FileData);
    $Return{DTLImagePath}              = _DTLImagePath(%FileData);
    $Return{EmptyFileCheck}            = _EmptyFileCheck(%FileData);
    $Return{FetchrowHashrefCheck}      = _FetchrowHashrefCheck(%FileData);
    $Return{LayoutObjectCheck}         = _LayoutObjectCheck(%FileData);
    $Return{LineLengthCheck}           = _LineLengthCheck(%FileData);
    $Return{PerlExecutableWithSubs}    = _PerlExecutableWithSubs(%FileData);
    $Return{PerlDBObjectCheck}         = _PerlDBObjectCheck(%FileData);
    $Return{PerldocInconsistentNewPod}   = _PerldocInconsistentNewPod(%FileData);
    $Return{PerldocNeededObjectsCheck1}   = _PerldocNeededObjectsCheck1(%FileData);
    $Return{PerldocNeededObjectsCheck2}   = _PerldocNeededObjectsCheck2(%FileData);
    $Return{PerlLocateFunctionsWithoutPerldoc} =_PerlLocateFunctionsWithoutPerldoc(%FileData);
    $Return{PerlLanguageTranslationCheck}      = _PerlLanguageTranslationCheck(%FileData);
    $Return{PerlOptionStrgHashRefCheck}        = _PerlOptionStrgHashRefCheck(%FileData);
    $Return{PerlEncodeObjectYesCheck}  = _PerlEncodeObjectYesCheck(%FileData);
    $Return{PerlEncodeObjectNoCheck}   = _PerlEncodeObjectNoCheck(%FileData);
    $Return{PerlMainObjectYesCheck}    = _PerlMainObjectYesCheck(%FileData);
    $Return{PerlMainObjectNoCheck}     = _PerlMainObjectNoCheck(%FileData);
    $Return{ReplaceCopyright}          = _ReplaceCopyright($File, $Directory);
    $Return{TabulatorCheck}            = _TabulatorCheck(%FileData);
    $Return{TranslationTextCheck}      = _TranslationTextCheck(%FileData);
    $Return{TypoCheck}                 = _TypoCheck(%FileData);
    $Return{XMLCheckWithOurParsers}    = _XMLCheckWithOurParsers(%FileData);

    # .dtl
    if ($File =~ /\.dtl$/) {
        $Return{CopyrightCheck}            = _CopyrightCheck(%FileData);
        $Return{RemoveEmptySpaces}         = _RemoveEmptySpaces($File);
        $Return{RemoveEmptyTrailingLines}  = _RemoveEmptyTrailingLines($File);
        $Return{DTLFormat}                 = _DTLFormat($File);
        $Return{DTLText}                   = _DTLText($File);
        $Return{DTLLQData}                 = _DTLLQData($File);
        $Return{MarkCheck}                 = _MarkCheck($File);
        $Return{HeaderlineCheck}           = _HeaderlineCheck($File, $Directory);
        $Return{DTLMisshapenCode}          = _DTLMisshapenCode($File);
        $Return{DTLSelectCheck}            = _DTLSelectCheck($File);
        $Return{DTLColsCheck}              = _DTLColsCheck($File);
        $Return{DTLValignCheck}            = _DTLValignCheck($File);
        $Return{DTLApostropheCheck}        = _DTLApostropheCheck($File);
        $Return{DTLCGIHandleCheck}         = _DTLCGIHandleCheck($File);
        $Return{DTLBaselinkCheck}          = _DTLBaselinkCheck($File);
        $Return{DTLIFCheck}                = _DTLIFCheck($File);

        # do not check on these templates (old/compat.)
        if ( $File !~ /(AdminQueueAutoResponseForm|AgentNavigationBar|AgentTicketZoom|AgentFAQDWP|FAQDWP)/ ) {
           $Return{DTLUniqueBlockCheck}       = _DTLUniqueBlockCheck(%FileData);
        }
        $Return{DTLUnquotedAttributeCheck} = _DTLUnquotedAttributeCheck(%FileData);
    }
    # .xml
    elsif ($File =~ /\.(xml|opm|sopm)$/) {
        $Return{RemoveEmptySpaces}           = _RemoveEmptySpaces($File);
        $Return{RemoveEmptyTrailingLines}    = _RemoveEmptyTrailingLines($File);
        $Return{XMLCheck}                    = _XMLCheck($File);
        $Return{MarkCheck}                   = _MarkCheck($File);
        $Return{XMLGreaterAndLowerThanCheck} = _XMLGreaterAndLowerThanCheck($File);
        $Return{DocBookCheck}                = _DocBookCheck($File);

        if ($File !~ /\.xml$/) {
            # XML-testfiles may not be under our control, so we allow other indentation, too
            $Return{FourSpacesCheck}         = _FourSpacesCheck($File);
        }
        $Return{GetGroupIdByNameCheck}       = _GetGroupIdByNameCheck(%FileData);
        if ($Directory =~ /\/Files/) {
            $Return{ModuleRegistrationCheck}    = _ModuleRegistrationCheck($File);
            $Return{XMLConfigXMLCheck}          = _XMLConfigXMLCheck($File);
            $Return{XMLConfigFullSentenceCheck} = _XMLConfigFullSentenceCheck($File);
        }
        else {
            $Return{SQLReservedWordsCheck} = _SQLReservedWordsCheck($File);
            $Return{SQLColumnTypeCheck}    = _SQLColumnTypeCheck($File);
        }
        if ($File =~ /\.sopm$/) {
            $Return{OPMFileRightCheck}          = _OPMFileRightCheck($File);
            $Return{OPMNameCheck}               = _OPMNameCheck($File, $Directory);
            $Return{OPMRequiredElementsCheck}   = _OPMRequiredElementsCheck($File, $Directory);
            $Return{OPMInsertTagCheck}          = _OPMInsertTagCheck($File, $Directory);
            $Return{OPMPackageRequiredCheck}    = _OPMPackageRequiredCheck($File);
            $Return{XMLConfigFullSentenceCheck} = _XMLConfigFullSentenceCheck($File);
        }
    }
    # *startup*.pl
    elsif ($File =~ /startup.+?pl$/) {
        $Return{RemoveEmptySpaces}        = _RemoveEmptySpaces($File);
        $Return{RemoveEmptyTrailingLines} = _RemoveEmptyTrailingLines($File);
        $Return{PerlStrictCheck}          = _PerlStrictCheck($File);
        $Return{PerlRequireCheck}         = _PerlRequireCheck($File);
        $Return{PerlDataDumperCheck}      = _PerlDataDumperCheck($File);
        $Return{PerlTidy}                 = _PerlTidy($File, $Directory);
        $Return{PerlFormat}               = _PerlFormat($File);
        $Return{SeparatorCheck}           = _SeparatorCheck($File);
        $Return{MarkCheck}                = _MarkCheck($File);
        $Return{FileOperationCheck}       = _FileOperationCheck($File);
        $Return{SQLCurrentTimeStampCheck} = _SQLCurrentTimeStampCheck($File);
        $Return{LineLengthCheck}          = _PerlUselessForCheck($File);
        $Return{GetGroupIdByNameCheck}    = _GetGroupIdByNameCheck(%FileData);
    }
    # .pl
    elsif ($File =~ /\.(fpl|pl)$/) {
        $Return{CopyrightCheck}            = _CopyrightCheck(%FileData);
        $Return{RemoveEmptySpaces}         = _RemoveEmptySpaces($File);
        $Return{RemoveEmptyTrailingLines}  = _RemoveEmptyTrailingLines($File);
        $Return{PerlFirstLineCheck}        = _PerlFirstLineCheck($File);
        $Return{PerlSyntaxCheck}           = _PerlSyntaxCheck($File);
        $Return{PerlStrictCheck}           = _PerlStrictCheck($File);
        $Return{PerlRequireCheck}          = _PerlRequireCheck($File);
        $Return{PerlDataDumperCheck}       = _PerlDataDumperCheck($File);
        $Return{PerlDumperCheck}           = _PerlDumperCheck($File);
        $Return{PerlTidy}                  = _PerlTidy($File, $Directory);
        $Return{PerlFormat}                = _PerlFormat($File);
        $Return{SeparatorCheck}            = _SeparatorCheck($File);
        $Return{MarkCheck}                 = _MarkCheck($File);
        $Return{FileOperationCheck}        = _FileOperationCheck($File);
        $Return{ParamObjectCheck}          = _ParamObjectCheck($File, $Directory);
        $Return{LocaltimeCheck}            = _LocaltimeCheck($File, $Directory);
        $Return{HeaderlineCheck}           = _HeaderlineCheck($File, $Directory);
        $Return{SQLCurrentTimeStampCheck}  = _SQLCurrentTimeStampCheck($File);
        $Return{PerlTicketHookCheck}       = _PerlTicketHookCheck($File);
        $Return{PerlCheckStaticXMLCharset} = _PerlCheckStaticXMLCharset($File);
        $Return{LineLengthCheck}           = _PerlUselessForCheck($File);
        $Return{PerlForMyCheck}            = _PerlForMyCheck(%FileData);
        $Return{GetGroupIdByNameCheck}     = _GetGroupIdByNameCheck(%FileData);
        $Return{LinkObjectLoadBackendCheck} = _LinkObjectLoadBackendCheck(%FileData);
        ####$Return{PerlSQLQuoteCheck} = _PerlSQLQuoteCheck($File);#
        $Return{PerldocURLFormatCheck}     = _PerldocURLFormatCheck($File);
    }
    # .pm
    elsif ($File =~ /\.pm$/) {
        $Return{CopyrightCheck}           = _CopyrightCheck(%FileData);
        $Return{RemoveEmptySpaces}        = _RemoveEmptySpaces($File);
        $Return{RemoveEmptyTrailingLines} = _RemoveEmptyTrailingLines($File);
        $Return{PerlSyntaxCheck}          = _PerlSyntaxCheck($File);
        $Return{PerlModuleCheck}          = _PerlModuleCheck($File);
        $Return{PerlStrictCheck}          = _PerlStrictCheck($File);
        $Return{PerlRequireCheck}         = _PerlRequireCheck($File);
        $Return{PerlDataDumperCheck}      = _PerlDataDumperCheck($File);
        $Return{PerlDumperCheck}          = _PerlDumperCheck($File);
        $Return{PerlTidy}                 = _PerlTidy($File, $Directory);
        $Return{PerlFormat}               = _PerlFormat($File);
        $Return{SeparatorCheck}           = _SeparatorCheck($File);
        $Return{PerldocSyntaxCheck}       = _PerldocSyntaxCheck($File, $Directory);
        $Return{PerldocSpellingCheck}     = _PerldocSpellingCheck($File, $Directory);
        $Return{MarkCheck}                = _MarkCheck($File);
        $Return{LineLengthCheck}          = _PerlUselessForCheck($File);
        $Return{PerlForMyCheck}           = _PerlForMyCheck(%FileData);
        $Return{GetGroupIdByNameCheck}    = _GetGroupIdByNameCheck(%FileData);
        $Return{LocaltimeCheck}                    = _LocaltimeCheck($File, $Directory);
        $Return{HeaderlineCheck}                   = _HeaderlineCheck($File, $Directory);
        $Return{SQLCurrentTimeStampCheck}          = _SQLCurrentTimeStampCheck($File);
        $Return{PerlTicketHookCheck}               = _PerlTicketHookCheck($File);
        $Return{PerlCheckStaticXMLCharset}         = _PerlCheckStaticXMLCharset($File);
        $Return{LinkObjectLoadBackendCheck}        = _LinkObjectLoadBackendCheck(%FileData);
        $Return{ParserObjectTypoCheck}             = _ParserObjectTypoCheck(%FileData);
        # dont use it for STDERR redirections
        if ($File !~ /(AAAFred|AdminBenchmark|AAASupport)\.pm$/) {
            $Return{FileOperationCheck} = _FileOperationCheck($File);
        }

        if ($Directory !~ /\/Language/) {
            $Return{DieCheck}        = _DieCheck($File, $Directory);
            $Return{SubCheck}        = _SubCheck($File);
        }
        #else {
        #    $Return{CompactTranslationHashFormCheck} = _CompactTranslationHashFormCheck(%FileData);
        #}
        if ($Directory !~ m{ ( /Language | System/(PostMaster|MailAccount) | /Web-Portal | /WIDWebPortal | /BCWebPortal ) }xms ) {
            $Return{PrintCheck} = _PrintCheck($File, $Directory);
        }
        # ParamObjectCheck in Kernel/System/* but not in Kernel/System/Auth/*
        # Kernel/System/Web/* and Kenrnel/System/DynamicField/*
        # (to allow auth modules to take params e. g. cookies from ParamObject)
        if ($Directory =~ /\/System(\/|$)/ && $Directory !~ /\/(Auth|Web|DynamicField)/) {
            $Return{ParamObjectCheck} = _ParamObjectCheck($File, $Directory);
        }
        # LayoutObjectCheck in Kernel/System/*
        #if ($Directory =~ /\/System(\/|$)/) {
        #    ######$Return{PerlSQLQuoteCheck} = _PerlSQLQuoteCheck($File);
        #}
        $Return{PerldocURLFormatCheck}     = _PerldocURLFormatCheck($File);
    }
    # .t
    elsif ($File =~ /\.t$/) {
        $Return{CopyrightCheck}           = _CopyrightCheck(%FileData);
        $Return{RemoveEmptySpaces}        = _RemoveEmptySpaces($File);
        $Return{RemoveEmptyTrailingLines} = _RemoveEmptyTrailingLines($File);
        $Return{PerlSyntaxCheck}          = _PerlSyntaxCheck($File);
        $Return{PerlModuleCheck}          = _PerlModuleCheck($File);
        $Return{PerlTidy}                 = _PerlTidy($File, $Directory);
        $Return{PerlFormat}               = _PerlFormat($File);
        $Return{PerlDataDumperCheck}      = _PerlDataDumperCheck($File);
        $Return{PerlDumperCheck}          = _PerlDumperCheck($File);
        $Return{SeparatorCheck}           = _SeparatorCheck($File);
        $Return{MarkCheck}                = _MarkCheck($File);
        $Return{SubCheck}                 = _SubCheck($File);
        $Return{FileOperationCheck}       = _FileOperationCheck($File);
        $Return{HeaderlineCheck}          = _HeaderlineCheck($File, $Directory);
        $Return{SQLCurrentTimeStampCheck} = _SQLCurrentTimeStampCheck($File);
        $Return{LineLengthCheck}          = _PerlUselessForCheck($File);
        $Return{PerlForMyCheck}           = _PerlForMyCheck(%FileData);
        $Return{GetGroupIdByNameCheck}    = _GetGroupIdByNameCheck(%FileData);
        $Return{PerldocURLFormatCheck}     = _PerldocURLFormatCheck($File);
    }
    # .html
    elsif ($File =~ /\.(htm|html|sh|txt)$/) {
        $Return{RemoveEmptySpaces}        = _RemoveEmptySpaces($File);
        $Return{RemoveEmptyTrailingLines} = _RemoveEmptyTrailingLines($File);
        $Return{MarkCheck}                = _MarkCheck($File);#
    }
    # .sql
    elsif ($File =~ /\.(sql)$/) {
        $Return{RemoveEmptySpaces}        = _RemoveEmptySpaces($File);
        $Return{RemoveEmptyTrailingLines} = _RemoveEmptyTrailingLines($File);
        $Return{MarkCheck}                = _MarkCheck($File);
    }
    # .spec
    elsif ($File =~ /\.(spec|dist)$/) {
        $Return{RemoveEmptySpaces}        = _RemoveEmptySpaces($File);
        $Return{RemoveEmptyTrailingLines} = _RemoveEmptyTrailingLines($File);
        $Return{SeparatorCheck}           = _SeparatorCheck($File);
        $Return{MarkCheck}                = _MarkCheck($File);
    }
    # README|CHANGES|TODO
    elsif ($File =~ /^(README|CHANGES)/i) {
        $Return{RemoveEmptySpaces}        = _RemoveEmptySpaces($File);
        $Return{RemoveEmptyTrailingLines} = _RemoveEmptyTrailingLines($File);
        $Return{SeparatorCheck}           = _SeparatorCheck($File);
        $Return{MarkCheck}                = _MarkCheck($File);
    }
    elsif ($File =~ /^TODO/i) {
        $Return{RemoveEmptySpaces}        = _RemoveEmptySpaces($File);
        $Return{RemoveEmptyTrailingLines} = _RemoveEmptyTrailingLines($File);
        $Return{SeparatorCheck}           = _SeparatorCheck($File);
    }

    for my $Function (keys %Return) {
        if (!$Return{$Function}) {
            #print "ERROR: $File isn't cvs-commited!\n";
            exit 1;
        }
    }

    print "NOTICE: =================================================\n";
}

sub _DTLCheck {
    my %FileData      = @_;

    return 1 if $FileData{Name} !~ /\.dtl$/;

    my $Ok            = 1;
    my $FormTag       = 0;
    my $ScriptTag     = 0;
    my $TableTag      = 0;
    my $TrTag         = 0;
    my $ThTag         = 0;
    my $TdTag         = 0;
    my $TdClose       = 0;
    my $ThClose       = 0;
    my $TrClose       = 0;
    my $ATag          = 0;
    my $PreTag        = 0;
    my $DivTag        = 0;
    my $FontTag       = 0;
    my $SpanTag       = 0;
    my $PTag          = 0;
    my $BTag          = 0;
    my $Counter       = 0;
    my $CapitalLetter = '';
    my $ATagLine      = 0;

    # get attributes
    for my $Line (@{$FileData{ContentArrayRef}}) {
        $Counter++;

        next if $Line =~ m{^\#}smx;

        # used /class=".+"/ instead of /class="button"/ because of the buttons in AgentAdvisoryEditClassification.dtl
        if ($FileData{Name} !~ /AgentWindowTab/ && $Line =~ /<input/i && $Line =~ /type="submit"/ && $Line !~ /class=".+?"/) {
            $Ok = 0;
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:_DTLCheck\n";
            print "ERROR: Need attribute class e. g. class=\"button\" in submit button of \n";
            print "ERROR:\n";
            print "ERROR: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
        }
        if ($Line =~ m/\$Text{"\$QData/) {
            $Ok = 0;
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:_DTLCheck\n";
            print "ERROR: Double HTML encoding detected! \n";
            print "ERROR: Don't use \$Text{\"\$QData{\"...\"}\"}, because \$Text already does the quoting. \n";
            print "ERROR: Please replace with \$Text{\"\$Data{\"...\"}\"}. \n";
            print "ERROR:\n";
            print "ERROR: Line $Counter: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
        }
#        if ($Line =~ m/\$Quote{"\$Text/) {
#            $Ok = 0;
#            print "ERROR: -------------------------------------------------\n";
#            print "ERROR:_DTLCheck\n";
#            print "ERROR: Double HTML encoding detected! \n";
#            print "ERROR: Don't use \$Quote{\"\$Text{\"...\"}\"}, because \$Text already does the quoting. \n";
#            print "ERROR: Please remove the outer \$Quote{\"...\"}. \n";
#            print "ERROR:\n";
#            print "ERROR: Line $Counter: $Line";
#            print "ERROR:\n";
#            print "ERROR: -------------------------------------------------\n";
#        }
        if ($Line =~ m/\$Quote{"\$QData/) {
            $Ok = 0;
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:_DTLCheck\n";
            print "ERROR: Double HTML encoding detected! \n";
            print "ERROR: Don't use \$Quote{\"\$QData{\"...\"}\"}, because \$QData already does the quoting. \n";
            print "ERROR: Please remove the outer \$Quote{\"...\"}. \n";
            print "ERROR:\n";
            print "ERROR: Line $Counter: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
        }
#        if ($Line =~ m/\$Quote{"\$Data/) {
#            $Ok = 0;
#            print "ERROR: -------------------------------------------------\n";
#            print "ERROR:_DTLCheck\n";
#            print "ERROR: Obsolete use of \$Quote detected! \n";
#            print "ERROR: Don't use \$Quote{\"\$Data{\"...\"}\"}, but \$QData instead. \n";
#            print "ERROR:\n";
#            print "ERROR: Line $Counter: $Line";
#            print "ERROR:\n";
#            print "ERROR: -------------------------------------------------\n";
#        }
        if ($Line =~ /<input/i && $Line =~ /type="submit"/) {
            if ($Line =~ /value="\$Text{"(.+)"}[\.]*"/) {
                my $Button = $1;
                if ($Button =~ /^[^A-Z\$\.]/) {
                    $Ok = 0;
                    $CapitalLetter .= "ERROR: Line $Counter $Line";
                }
            }
            elsif ($Line !~ /value=""/) {
                print "ERROR: ---------------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: values of submit buttons should be translated! (\$Text{\"\"})\n";
                print "ERROR:\n";
                print "ERROR: $Line";
                print "ERROR:\n";
                print "ERROR: ---------------------------------------------------------\n";
            }
        }
        if ($Line =~ /<script/i) {
            if (!$ScriptTag) {
                $ScriptTag = 1;
            }
            else  {
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: <script> is open but not closed! \n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
            }
        }
        if ($Line =~ m{<\/script>}smxi) {
            if ($ScriptTag) {
                $ScriptTag = 0;
            }
            else {
                $Ok = 0;
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: <script> is closed but not opened before! \n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
            }
        }
        # and if more forms in dtl
        if ($Line =~ /<form/i) {
            if (!$FormTag) {
                $FormTag = 1;
            }
            else {
                $Ok = 0;
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: <form> is open but not closed! \n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
            }
        }
        if ($Line =~ /<\/form>/i) {
            if ($FormTag) {
                $FormTag = 0;
            }
            elsif ($FileData{Name} !~ /AgentWindowTabStop/) {
                $Ok = 0;
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: <form> is closed but not opened before! \n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
            }
        }
        # check tabletags
        if ($FileData{Name} !~ /(AgentWindowTabStop|AgentWindowTabStart|PrintFooter|PrintHeader|CustomerHeader|CustomerFooter)/) {
            if ($Line =~ /<table/i) {
                $TableTag++;
            }
            if ($Line =~ /<\/table>/i) {
                $TableTag--;
                if ($TableTag < 0) {
                    $Ok = 0;
                    print "ERROR: -------------------------------------------------\n";
                    print "ERROR:\n";
                    print "ERROR: <table> is closed but not opened before! \n";
                    print "ERROR:\n";
                    print "ERROR: -------------------------------------------------\n";
                }
            }
        }
        # check trtags
        if ($FileData{Name} !~ /(AgentWindowTabStop|AgentWindowTabStart|PrintFooter|PrintHeader|CustomerFooter|CustomerHeader)/) {
            if ($Line =~ /<tr/i) {
                $TrTag++;
            }
            if ($Line =~ /<\/tr>/i) {
                $TrTag--;
                if ($TrTag < 0 && !$TrClose) {
                    $TrClose = 1;
                    $Ok = 0;
                    print "ERROR: -------------------------------------------------\n";
                    print "ERROR:\n";
                    print "ERROR: <tr> is closed but not opened before! \n";
                    print "ERROR: before Line $Counter\n";
                    print "ERROR:\n";
                    print "ERROR: -------------------------------------------------\n";
                }
            }
        }
        if ($FileData{Name} !~ /(AgentTicketOverviewSmall|AgentWindowTabStop|AgentWindowTabStart|PrintFooter|PrintHeader|CustomerFooter|CustomerHeader)/) {
            if ($Line =~ /<td/i) {
                $TdTag++;
            }
            if ($Line =~ /<\/td>/i) {
                $TdTag--;
                if ($TdTag < 0 && !$TdClose) {
                    $TdClose = 1;
                    $Ok = 0;
                    print "ERROR: -------------------------------------------------\n";
                    print "ERROR:\n";
                    print "ERROR: <td> is closed but not opened before! \n";
                    print "ERROR: before Line $Counter\n";
                    print "ERROR:\n";
                    print "ERROR: -------------------------------------------------\n";
                }
            }
        }
        if ($FileData{Name} !~ /(AgentWindowTabStop|AgentWindowTabStart|PrintFooter|PrintHeader|CustomerFooter|CustomerHeader)/) {
            # make sure that a <thead> is not considered as a <th>
            if ($Line =~ /<th[\s>]/i) {
                $ThTag++;
            }
            if ($Line =~ /<\/th>/i) {
                $ThTag--;
                if ($ThTag < 0 && !$ThClose) {
                    $ThClose = 1;
                    $Ok = 0;
                    print "ERROR: -------------------------------------------------\n";
                    print "ERROR:\n";
                    print "ERROR: <th> is closed but not opened before! \n";
                    print "ERROR: before Line $Counter\n";
                    print "ERROR:\n";
                    print "ERROR: -------------------------------------------------\n";
                }
            }
        }
        if ($Line =~ /<a/i) {
            if ($ATag) {
                $Ok = 0;
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: <a> is open but not closed! \n";
                print "ERROR: Try Line $ATagLine\n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
            }
            $ATag = 1;
            $ATagLine = $Counter;
        }
        if ($Line =~ /<\/a>/i) {
            if (!$ATag) {
                $Ok = 0;
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: <a> is closed but not opened before! Line $Counter \n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
            }
            $ATag = 0;
        }
        if ($FileData{Name} !~ /(AgentWindowTabStop|AgentWindowTabStart)/) {

            if ($Line =~ /<div/i) {
                $DivTag++;
            }
            if ($Line =~ /<\/div>/i) {
                $DivTag--;
#                if ($DivTag < 0) {
#                    $Ok = 0;
#                    print "ERROR: -------------------------------------------------\n";
#                    print "ERROR:\n";
#                    print "ERROR: <div> is closed but not opened before! \n";
#                    print "ERROR:\n";
#                    print "ERROR: -------------------------------------------------\n";
#                }
            }
        }
        if ($Line =~ /<pre/i) {
            $PreTag++;
        }
        if ($Line =~ /<\/pre>/i) {
            $PreTag--;
            if ($PreTag < 0) {
                $Ok = 0;
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: <pre> is closed but not opened before! \n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
            }
        }
        if ($Line =~ /<span/i) {
            $SpanTag++;
        }
        if ($Line =~ /<\/span>/i) {
            $SpanTag--;
            if ($SpanTag < 0) {
                $Ok = 0;
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: <span> is closed but not opened before! \n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
            }
        }
        if ($Line =~ /<font/i) {
            $FontTag++;
        }
        if ($Line =~ /<\/font>/i) {
            $FontTag--;
            if ($FontTag < 0) {
                $Ok = 0;
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: <font> is closed but not opened before! \n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
            }
        }
        if ($Line =~ /<p[ >]/i) {
            $PTag++;
        }
        if ($Line =~ /<\/p>/i) {
            $PTag--;
            if ($PTag < 0) {
                $Ok = 0;
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: <p> is closed but not opened before! \n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
            }
        }
#        if ($Line =~ /<b(\s.+?|)>/i) {
        if ($Line =~ /<b[^rou]/i) {
            $BTag++;
        }
#        if ($Line =~ /<\/b(\s.+?|)>/i) {
        if ($Line =~ /<\/b[^rou]*>/i) {
            $BTag--;
            if ($BTag < 0) {
                $Ok = 0;
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: <b> is closed but not opened before! \n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
            }
        }
    }

    if ($CapitalLetter) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Values of submit buttons have to start with an capital letter!\n";
        print "ERROR: Don't forget to test the translation!\n";
        print "ERROR:\n";
        print $CapitalLetter;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------------\n";
    }
    if ($ScriptTag) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: <script> is open but not closed! \n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }
    if ($FormTag && $FileData{Name} !~ /AgentWindowTabStart/) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: <form> is open but not closed! \n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }
    if ($TableTag && $TableTag > 0) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: $TableTag <table> is open but not closed! \n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }
    if ($TrTag && $TrTag > 0) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: $TrTag <tr> is open but not closed! \n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }
    if ($TdTag && $TdTag > 0) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: $TdTag <td> is open but not closed! \n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }
    if ($ThTag && $ThTag > 0) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: $ThTag <th> is open but not closed! \n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }
    if ($PreTag && $PreTag > 0) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: $PreTag <pre> is open but not closed! \n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }
#    if ($DivTag && $DivTag > 0) {
#        $Ok = 0;
#        print "ERROR: -------------------------------------------------\n";
#        print "ERROR:\n";
#        print "ERROR: $DivTag <div> is open but not closed! \n";
#        print "ERROR:\n";
#        print "ERROR: -------------------------------------------------\n";
#    }
    if ($SpanTag && $SpanTag > 0) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: $SpanTag <span> is open but not closed! \n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }
    if ($PTag && $PTag > 0) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: $PTag <p> is open but not closed! \n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }
    if ($FontTag && $FontTag > 0) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: $FontTag <font> is open but not closed! \n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }
    if ($BTag && $BTag > 0) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: $BTag <b> is open but not closed! \n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }
    if ($ATag) {
        $Ok = 0;
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: <a> is open but not closed! \n";
        print "ERROR: Try Line $ATagLine\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
    }

    return if !$Ok;

    print "NOTICE: _DTLCheck() ok\n";
    return 1;
}

sub _DTLFormat {
    my $File = shift;
    my $Ok = 1;
    # get attributes
    my $Count = -1;
    my $Space = '    ';
    my $Content = '';
    my $Script = 0;
    my $TextArea = 0;
    my $Style = 0;
    my $Counter = 0;
    my $TextAreaFlag = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /^#/) {
            $Content .= $Line;
        }
        elsif ($Line =~ /<textarea/i && $Line !~ m|</textarea>|i) {
            $TextArea = 1;
            $Content .= $Line;
        }
        elsif ($TextArea) {
            $Content .= $Line;
            if ($Line =~ /<\/textarea/i) {
                $TextArea = 0;
            }
        }
        elsif ($Line =~ /<script/i) {
            $Script = 1;
            $Content .= $Line;
        }
        elsif ($Script) {
            $Content .= $Line;
            if ($Line =~ /<\/script/i) {
                $Script = 0;
            }
        }
        elsif ($Line =~ /<style/i) {
            $Style = 1;
            $Content .= $Line;
        }
        elsif ($Style) {
            $Content .= $Line;
            if ($Line =~ /<\/style/i) {
                $Style = 0;
            }
        }
        elsif ($Line =~ /^\s*$/ || $Line =~ /^\$/) {
            $Content .= $Line;
        }
        elsif ($Line =~ /^(\s+?|)(<\!--.*)$/) {
            $Content .= $2."\n";
        }
        else {
            my $NextCount = 0;
            my $ContentCount = 0;
            my $CloseCount = 0;
            my @IndentingElements = qw(
                body
                h1
                h2
                h3
                h4
                h5
                h6
                table
                thead
                tfoot
                tbody
                tr
                th
                td
                form
                fieldset
                head
                div
                span
                p
                a
                select
                button
                ul
                ol
                li
                colgroup
                label
                dl
                dt
                dd
            );
            my $IndentingElementString = join('|', @IndentingElements);
            if ($Line =~ /^(\s+?|)\<\/($IndentingElementString)(\s|>)/i) {
                $NextCount = 1;
            }
            elsif ($Line =~ /^(\s+?|)<($IndentingElementString)(\s|>)/i) {
                $Count ++;
                if ($Line =~ /<\/$2/) {
                    $CloseCount = 1;
                }
            }
            else {
                $ContentCount = 1;
            }
            $Line =~ s/^(\s*|\s|)(.*)$/$2/;
            my $LineNew = '';
            if ($Count+$ContentCount) {
                for (1..$Count+$ContentCount) {
                    $LineNew .= $Space;
                }
            }
            $Content .= $LineNew.$Line;
            if ($NextCount) {
                $Count--;
            }
            if ($CloseCount) {
                $Count--;
            }
        }

        if ($TextAreaFlag) {
            $TextAreaFlag = 0;
            if ($Line =~ /^ /) {
                print "WARNING: _DTLText() please check, please check the textarea-tag at Line $Counter, perhaps there are problems with the spaces.\n";
            }
        }
        if ($Line =~ /<textarea/i && $Line !~ /<\/textarea/i ) {
            $TextAreaFlag = 1;
        }

    }
    close $In;
    open my $Out, '>', $File or die "FILTER: Can't write $File: $!\n";
    print $Out $Content;
    close $Out;

    return if !$Ok;

    print "NOTICE: _DTLFormat() ok\n";
    return 1;
}

sub _DTLText {
    my $File = shift;
    my $Ok = 1;
    my $Counter = 0;
    # check if $JSText is used
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter ++;
        if ($Line =~ /'\$Text{"/) {
            print "ERROR: _DTLText() please check, use \$JSText{\"\"} in a JS string for OTRS 2.1 or higher Line $Counter ($Line)\n";
            $Ok = 0;
        }
    }
    close $In;

    return if !$Ok;

    print "NOTICE: _DTLText() ok\n";
    return 1;
}

sub _DTLLQData {
    my $File    = shift;
    my $Ok      = 1;
    my $Counter = 0;

    # check if $JSText is used
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter ++;

        # next if IE behavior need to get ignored
        # see bug#5579 - Spaces in filenames are converted to + characters when downloading in IE.
        next if $Line =~ /href="\$Env{"CGIHandle"}\/\$QData{"Filename"}?/;

        # next if links for agent/customer iface for cockpit is used
        # see bug #6172 - Agent/Customer Interface links to instance broken
        next if $Line =~ m{href="\$QData{" (?: (?: Agent | Customer ) Link | Destination ) "}}xms;

        # allow the usage of QData if the line is commented out. Otherwise commenting out inherited
        # code (OldId) doesn't work and the filter still complains about the usage of QData in
        # href, although the code itself isn't effective at all
        next if $Line =~ m{^[\t ]*#}xms;

        # now check href attribute
        if ($Line !~ /href="(|#)"/i && $Line =~ /href=(.+?)[ >]/i) {
            if ($1 =~ /\$QData/si) {
                print "ERROR: _DTLLQData() please check, use \$LQData{\"\"} in a href string Line $Counter ($Line)\n";
                $Ok = 0;
            }
        }
    }
    close $In;

    return if !$Ok;

    print "NOTICE: _DTLLQData() ok\n";
    return 1;
}

sub _XMLCheck {
    my $File    = shift;
    my $Ok      = 1;
    my $Message = '';

    # option flag for XML validation
    my $XMLValid = '';

    # check for developer manual
    if ( $Directory =~ m{ doc-developer }xms ) {

        # get file content to check doctype
        open my $XMLFile, '<', $File or die "FILTER: Can't open $File for doctype check!";
        my @XMLContent = <$XMLFile>;
        close $XMLFile;

        # check validity only when a DTD was declared
        if ( first { $_ =~ m{ DOCTYPE .+ DTD }xms } @XMLContent ) {
            $XMLValid = '--valid';

        }

        # do not validate files with includes, because the includes
        # cannot be resolved on the CVS server
        if ( first { $_ =~ m{ xi:include }xms } @XMLContent ) {
            $XMLValid = '';
        }

        # do not validate docbook files with <link> tags, because these
        # may be in another chunk of the document (e.g., another chapter)
        # and that would cause the file to be invalid
        if (first { $_ =~ m/DTD\sDocBook\sXML/smx } @XMLContent) {
            if (first { $_ =~ m/link/smx } @XMLContent) {
                $XMLValid = '';
            }
        }

        # TODO: add check for XML Schema
    }

    # check XML with xmllint
    open my $In, "xmllint $XMLValid --output /dev/null $File 2>&1 |" or die "FILTER: Can't open XML-Check for $File: $!\n";
    while (my $Line = <$In>) {
        if ($Line) {
            $Message .= $Line;
        }
    }
    close $In;

    if ($Message) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: (xmllint): $Message";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        $Ok = 0;
    }

    return if !$Ok;

    print "NOTICE: _XMLCheck() ok\n";
    return 1;
}

sub _TypoCheck {
    my %FileData = @_;
    my $Ok = 1;

    return 1 if $FileData{Name} =~ m{filter.pl$}smx;  # don't check the filter itself

    # check common typos

    my $ContentString = join('', @{$FileData{ContentArrayRef}});

    LINE:
    for my $Line (@{$FileData{ContentArrayRef}}) {

        # it's better to create a loop a build a hash with the typos an their solution
        if ($Line =~ /z\.B\./) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): use 'z. B.' instead of 'z.B.' in $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ /(\sorts\s|\/orts\/)/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): use 'otrs' instead of 'orts' in $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ m{attachemnt}smxi) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): use 'attachment' instead of 'attachemnt' in $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        # don't apply to LHCategory.csv - it's a customer file, don't apply to French translation
        if ( $FileData{Name} ne 'LHCategory.csv' && $FileData{Name} ne 'fr.pm' && $Line =~ m{attachement}smxi ) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): use 'attachment' instead of 'attachement' in $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }

        # do not use this on sk_SK.pm, because it's ok on sk_SK translation
        if ( $FileData{Name} ne 'sk_SK.pm' && $Line =~ /recipents/i ) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): use 'recipients' instead of 'recipents' in $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }

        if ($Line =~ /cancle/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): use 'cancel' instead of 'cancle' in $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ /deamon/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): use 'daemon' instead of 'deamon' in $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ /sevice/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): use 'service' instead of 'sevice' in $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ( !$FileData{Directory} =~ m{Kernel\/cpan-lib}xms &&
        !$FileData{Directory} =~ m{var\/httpd\/htdocs\/js\/thirdparty}xms &&
        $Line =~ /occured/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): use 'occurred' instead of 'occured' in $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ( !$FileData{Directory} =~ m{Kernel\/cpan-lib}xms &&
        !$FileData{Directory} =~ m{var\/httpd\/htdocs\/js\/thirdparty}xms &&
        $Line =~ /dinamic/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): use 'dynamic' instead of 'dinamic' in $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ /modulus/i) {
            next LINE if $FileData{Name} eq 'DateChecksum.pm';
            next LINE if $FileData{Name} eq 'SMIME.pm';
            next LINE if $FileData{Name} eq 'SMIME.t';
            print "WARNING: -------------------------------------------------\n";
            print "WARNING:\n";
            print "WARNING: (typo): you use 'modulus', instead of 'module' or 'modules'\n";
            print "WARNING: in Line: $Line";
            print "WARNING:\n";
            print "WARNING: -------------------------------------------------\n";
        }
        if ($Line =~ /interger/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use 'interger', instead of 'integer'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ /inital/i && $Line !~ /InitAll/) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use 'inital', instead of 'initial'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ />OTRS_/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use '>OTRS_', instead of '<OTRS_'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ /&gt;OTRS_/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use '&gt;OTRS_', instead of '&lt;OTRS_'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ /annoucement/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use 'annoucement', perhaps you mean 'announcement'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($FileData{Name} ne 'fr.pm' && $Line =~ /informations\W/i && $Line !~ m{Informationstechnik}smx) {
            if ($FileData{Directory} !~ m{Language|sample|WIDWebPortal|WIDProtocol|WIDPublicationSystem}smx ) {
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: (typo): you use 'informations', there is no plural form of 'information'\n";
                print "ERROR: in Line: $Line";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
                $Ok = 0;
            }
            else {
                print "WARNING: -------------------------------------------------\n";
                print "WARNING:\n";
                print "WARNING: (typo): you use 'informations', there is no plural form of 'information'\n";
                print "WARNING: in Line: $Line";
                print "WARNING:\n";
                print "WARNING: -------------------------------------------------\n";
            }
        }
        if ($Line =~ /sesssion/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use 'sesssion', perhaps you mean session'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ /sesseion/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use 'sesseion', perhaps you mean session'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ /(opject|opbject)/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use '$1', perhaps you mean 'object'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ /langauge/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use 'langauge', perhaps you mean 'language'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ /examlple/i) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use 'examlple', perhaps you mean 'example'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
        if ($Line =~ m{create \s a \s object}sxmi) {
            print "ERROR: ----------------------------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use 'create a object', perhaps you mean 'create an object'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: ----------------------------------------------------------------------\n";
            $Ok = 0;
        }

        if ($Line =~ m{gesamt}sxmi) {
            next LINE if $FileData{Name} eq 'de.pm';
            next LINE if $FileData{Name} =~ m{de_.+?\.pm}smx;
            next LINE if $FileData{Name} eq 'bb.pm';
            next LINE if $FileData{Directory} =~ m{Stats\/Static$}smx;
            next LINE if $FileData{Directory} =~ m{StatsStorage}smx;
            next LINE if $ContentString =~ m{lang=["']de["']}ismx;

            print "ERROR: ----------------------------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use 'gesamt', don't use a german wording\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: ----------------------------------------------------------------------\n";
            $Ok = 0;
        }

        if ($Line =~ m{bevore}sxmi) {
            print "ERROR: ----------------------------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use 'bevore',  perhaps you mean 'before'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: ----------------------------------------------------------------------\n";
            $Ok = 0;
        }

        if ($Line =~ m{neaest}sxmi) {
            print "ERROR: ----------------------------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: (typo): you use 'neaest',  perhaps you mean 'nearest'\n";
            print "ERROR: in Line: $Line";
            print "ERROR:\n";
            print "ERROR: ----------------------------------------------------------------------\n";
            $Ok = 0;
        }

#        if ($Line =~ /(\se-mail\s|\se mail\s)/i) {
#            print "ERROR: -------------------------------------------------\n";
#            print "ERROR:\n";
#            print "ERROR: (typo): use 'email' instead of '$1' in $Line";
#            print "ERROR:\n";
#            print "ERROR: -------------------------------------------------\n";
#            $Ok = 0;
#        }
#        if ($Line =~ /otrs/ && $Line !~ /\/otrs\// && $Line !~ /otrs\.(com|org)/i && $Line !~ /(<otrs_|<\/otrs_)/) {
#            print "ERROR: -------------------------------------------------\n";
#            print "ERROR:\n";
#            print "ERROR: (typo): use 'OTRS' instead of 'otrs' in $Line";
#            print "ERROR:\n";
#            print "ERROR: -------------------------------------------------\n";
#            $Ok = 0;
#        }
    }

    return if !$Ok;

    print "NOTICE: _TypoCheck() ok\n";
    return 1;
}

sub _CopyrightCheck {
    my %FileData = @_;
    my $CopyHeader = 0;

    return 1 if $FileData{Directory}     =~ m{Kernel\/cpan-lib}xms;
    return 1 if $FileData{ContentString} =~ m{c\.a\.p\.e\. \s IT \s GmbH}xms;
    return 1 if $FileData{ContentString} =~ m{OpenNMS}xms;

    LINE:
    for my $Line ( @{ $FileData{ContentArrayRef} } ) {

        # do no more checks after first not comment line
        last LINE if $Line !~ m{^#};

        # notice becareful if you change the regular expression because of
        # codecomments like "# Kernel/System/WIDAuthoring.pm - all wid authoring functions"
        if (lc $Line =~ m{\sauthor\s}smx && !(lc $FileData{Name} =~ m{\sauthor\s|\sautor\s}xms || lc $FileData{Directory} =~ m{\sauthor|\sautor}xms)) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR: Do not used author or autor in header! Only use:\n";
            print "ERROR: # Copyright (C) 2003-2009 OTRS AG, http://otrs.com/\n";
            print "ERROR: -------------------------------------------------\n";
            return;
        }
        if (lc $Line =~ m{Copyright}mxs) {
            $CopyHeader = 1;
        }
        elsif ($CopyHeader && $Line =~ /# \-\-/) {
            $CopyHeader = 0;
        }
        elsif ($CopyHeader && $Line !~ /# \-\-/) {
            print "ERROR: -------------------------------------------------\n";
            print "ERROR: Copyright header not ok! Problem: $Line\n";
            print "ERROR: Use something like:\n";
            print "ERROR: # --\n";
            print "ERROR: # Path/ToFile.pm - some short description\n";
            print "ERROR: # Copyright (C) 2003-2009 OTRS AG, http://otrs.com/\n";
            print "ERROR: # --\n";
            print 'ERROR: # $' . 'Id: filter-extended.pl,v 1.388 2011/03/09 13:11:54 mg Exp $' . "\n";
            print "ERROR: # --\n";
            print "ERROR: # This software comes with ABSOLUTELY NO WARRANTY. For details, see\n";
            print "ERROR: # the enclosed file COPYING for license information (AGPL). If you\n";
            print "ERROR: # did not receive this file, see http://www.gnu.org/licenses/agpl.txt.\n";
            print "ERROR: # --\n";
            print "ERROR: -------------------------------------------------\n";

            return;
        }
    }

    print "NOTICE: _CopyrightCheck() ok\n";
    return 1;
}

sub _ReplaceCopyright {
    my $File      = shift;
    my $Directory = shift;

    # don't check these files
    return 1 if $File =~ m{module-format.xml$}smx;
    return 1 if $File =~ m{codesyntax.xml$}smx;
    return 1 if $File =~ m{language-translations.xml$}smx;
    return 1 if $File =~ m{writing-otrs-application.xml$}smx;
    return 1 if $File =~ m{test-mechanism.xml$}smx;

    # config
    my $StartYear = 0;
    my $Copy = '';

    if ( $Directory =~ m{\/cvs\/} ) {
        $Copy = 'OTRS AG, http://otrs.org/';
        $StartYear = 2001;
    }
    else {
        $Copy = 'OTRS AG, http://otrs.com/';
        $StartYear = 2003;
    }

    my ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = localtime(time());
    $Year += 1900;

    my $YearString = "$StartYear-$Year";
    if ($StartYear == $Year) {
        $YearString = $Year;
    }

    # not for cpan files
    return 1 if $Directory =~ /Kernel\/cpan-lib/;

    copy($File, "$File.tmp");
    open my $In, '<', $File           or die "FILTER: Can't open $File: $!\n";
    open my $Out, '>', "$File.$$.tmp" or die "FILTER: Can't write $File.tmp: $!\n";

    IN:
    while ( my $Line = <$In> ) {
        if ($Line !~ m{Copyright}smx) {
            print $Out $Line;
            next IN;
        }

        # white list
        # special setting for c.a.p.e. IT and Stefan Schmidt
        if ($Line =~ m{( c\.a\.p\.e\. \s IT | Stefan \s Schmidt )}smx ) {
            print $Out $Line;
            next IN;
        }

        # special settings for the language directory
        if ($Line !~ m{OTRS}smx && $Directory =~ m{Kernel\/Language} ) {
            print $Out $Line;
            next IN;
        }

        # for the commandline help
        # e.g : print "Copyright (c) 2003-2008 OTRS AG, http://www.otrs.com/\n";
        if ($Line !~ m{^\# \s Copyright}smx) {
            if ($Line =~ m{^ (.+?) Copyright \s \( [Cc] \) .+? OTRS \s (AG|GmbH) }smx) {
                 print "NOTICE: Old: $Line";
                 $Line =~ s{^ (.+?) Copyright \s \( [Cc] \) .+? OTRS \s (AG|GmbH) }{$1Copyright (C) $YearString OTRS AG}smx;
                 print "NOTICE: New: $Line";
            }
            print $Out $Line;
            next IN;
        }

        # check string in the comment line
        if ($Line !~ m{^\# \s Copyright \s \( [Cc] \) \s $YearString \s $Copy$}smx ) {
            print "NOTICE: Old: $Line";
            print "NOTICE: New: # Copyright (C) $YearString $Copy\n";
            $Line = "# Copyright (C) $YearString $Copy\n";
        }

        print $Out $Line;
    }

    close $Out;
    close $In;
    unlink $File or die "FILTER: Can't unlink: $!\n";
    rename "$File.$$.tmp", $File or die "FILTER: Can't rename: $!\n";

    print "NOTICE: _ReplaceCopyright() ok\n";
    return 1;
}

sub _RemoveEmptySpaces {
    my $File = shift;

    # get attributes
    copy($File, "$File.tmp");
    open my $In, '<', $File           or die "FILTER: Can't open $File: $!\n";
    open my $Out, '>', "$File.$$.tmp" or die "FILTER: Can't write $File.tmp: $!\n";
    while (my $Line = <$In>) {
        # remove empty spaces
        $Line =~ s/^(.+?)\s*\n/$1\n/g;
        $Line =~ s/^\s*\n/\n/g;
        print $Out $Line;
    }
    close $Out;
    close $In;
    unlink $File or die "FILTER: Can't unlink: $!\n";
    rename "$File.$$.tmp", $File or die "FILTER: Can't rename: $!\n";
    print "NOTICE: _RemoveEmptySpaces() ok\n";
    return 1;
}

sub _RemoveEmptyTrailingLines {
    my $File = shift;
    # get attributes
    my @Content = ();
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        push @Content, $Line;
    }
    close $In;

    # remove empty trailing lines
    my @ContentNew = ();
    my $Done = 0;
    for my $Line (reverse @Content) {
        if (!$Done) {
            if ($Line !~ /^(\s|\n)$/) {
                $Done = 1;
            }
            else {
                print "NOTICE: _RemoveEmptyTrailingLines() removed trailing empty line\n";
            }
        }
        if ($Done) {
            push @ContentNew, $Line;
        }
    }
    open my $Out, '>', $File or die "FILTER: Can't write $File: $!\n";
    for my $Line (reverse @ContentNew) {
        print $Out $Line;
    }
    close $Out;

    print "NOTICE: _RemoveEmptyTrailingLines() ok\n";
    return 1;
}

sub _PerlSyntaxCheck {
    my $File = shift;
    my $Message = '';

    if ($File =~ m{ (?: AAAFred | otrs\.Scheduler4win\.pl | otrs\.Scheduler4winInstaller\.pl | Request/HTTP\.pm ) }xms) {
        print "NOTICE: _PerlSyntaxCheck() ok\n";
        return 1;
    }

    my $IsWIDPublicationSystemFile;

    # prepare file
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    open my $Out, '>' . "$File.$$.tmp" or die "FILTER: Can't write $File.tmp: $!\n";
    while (my $Line = <$In>) {
        $Line =~ s{\[gettimeofday\]}{1}smx;

        if ( $Line =~ m{ package [^\n]+ ((?:WID|BC)PublicationSystem) (?!::Errors) }xms ) {
            $IsWIDPublicationSystemFile = $1;
        }

        # don't check for Data::Validate modules, they are not installed
        if (
            $Line !~ m{ \A \s* use }xms
            || $Line =~ m{\A \s* use \s+ (?: vars | constant | strict | Data (?! ::Validate ) | threads | Readonly ) }xms
        )
        {
            if ( $IsWIDPublicationSystemFile && $Line =~ m{ \$ERROR }xms ) {
                my $Module = $IsWIDPublicationSystemFile;
                $Line =~ s{ \$ERROR_ }{\$Kernel::System::${Module}::Errors::ERROR_}xmsg;
            }
            print $Out $Line;
        }
    }
    close $Out;
    close $In;
    # syntax check
    open $In, "perl -cw $File.$$.tmp 2>&1 |" or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        if ($Line !~ /(syntax OK|used only once: possible typo)/) {
            $Message .= $Line;
        }
    }
    close $In;
    unlink "$File.$$.tmp" or die "FILTER: Can't unlink: $!\n";

    if ($Message) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: (perl -cw): $Message";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";

        # some WPTicket files contain (legal) barewords
        return 1 if $File =~ m{ WPTicket2SDMS }xms;

        return;
    }
    print "NOTICE: _PerlSyntaxCheck() ok\n";
    return 1;
}

sub _PerlStrictCheck {
    my $File = shift;
    my $Ok = 1;
    my $Message = '';
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        if ($Line =~ /^use strict/) {
            $Ok = 1;
        }
    }
    close $In;
    if (!$Ok) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: \"use strict;\" is missing!\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }

    print "NOTICE: _PerlStrictCheck() ok\n";
    return 1;
}

sub _PerlRequireCheck {
    my $File = shift;
    my $Ok = 1;
    my $Counter = 0;
    my $Text = '';
    my $RequireSub = 0;

    if ($File !~ /(restore|StatsExportToOPM).pl/) {
        open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
        while (my $Line = <$In>) {
            $Counter++;

            if ($Line =~ /^=item Require/ && $File =~ /Main.pm/) {
                $RequireSub = 1;
            }

            if ($Line =~ /^=item Dumper/ && $File =~ /Log.pm/) {
                $RequireSub = 1;
            }

            if ($Line !~ /(#|'|")/ && $Line =~ /require[^A-Za-z]/ && !$RequireSub) {
                $Ok = 0;
                $Text .= "WARNING: Line $Counter $Line";
            }

            if ($RequireSub && $Line =~ /^}/) {
                $RequireSub = 0;
            }
        }

        close $In;
    }

    if (!$Ok) {
        print "WARNING: -------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: perl \"require\" is used -> use Kernel::System::Main!\n";
        print $Text;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------\n";
    }

    print "NOTICE: _PerlRequireCheck() ok\n";
    return 1;
}

sub _PerlDumperCheck {
    my $File    = shift;
    my $Ok      = 1;
    my $Counter = 0;
    my $Code    = '';

    if ($File =~ /Log\.pm|SaaSSOAPCore\.pm/) {
        print "NOTICE: _PerlDumperCheck() ignored\n";
        return 1;
    }

    open my $In, '<', $File     or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /->Dumper\(/) {
            $Ok = 0;
            $Code .= "ERROR: Line $Counter: $Line";
        }
    }
    close $In;

    if (!$Ok) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Dumper is used! Please remove!\n";
        print $Code;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }

    print "NOTICE: _PerlDumperCheck() ok\n";
    return 1;
}

sub _PerlDataDumperCheck {
    my $File = shift;
    my $Ok = 1;
    my $Message = '';
    if ($File =~ /filter\.pl|Main\.pm|Log\.pm|SaaSSOAPCore\.pm/) {
        print "NOTICE: _PerlDataDumperCheck() ignored\n";
        return 1;
    }
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    LINE:
    while (my $Line = <$In>) {
        if ($Line !~ m{ \A \s* \# }xms && $Line =~ m{ print \s+ STDERR \s+ Dumper }xms) {
            $Ok = 0;
            last LINE;
        }
    }
    close $In;
    if (!$Ok) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Data::Dumper is used, together with 'print STDERR Dumper', remove debug messages!\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }

    print "NOTICE: _PerlDataDumperCheck() ok\n";
    return 1;
}

sub _PerlFirstLineCheck {
    my $File      = shift;
    my $Ok        = 1;
    my $LineCount = 0;
    my $Message   = '';

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $LineCount++;
        if ($LineCount == 1 && $Line !~ /^#!\/usr\/bin\/perl -w/) {
            $Ok = 0;
        }
    }
    close $In;

    if (!$Ok) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Need \"#!\/usr\/bin\/perl -w\" at the start of .pl files!\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }

    print "NOTICE: _PerlFirstLineCheck() ok\n";
    return 1;
}

sub _PerlModuleCheck {
    my $File      = shift;
    my $LineCount = 0;
    my $Start     = 0;
    my $End       = 1;
    my $Message   = '';

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $LineCount++;
        if ($LineCount == 1 && $Line =~ /^#!\/usr\/bin\/perl/) {
            $Start = 1;
        }
        if ($Line =~ /^1;/) {
            $End = 0;
        }
    }
    close $In;

    if ($Start) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Don't use \"#!\/usr\/bin\/perl...\" in .pm|.t files!\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }
    if ($End) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: 1; is missing, required in each .pm|.t files!\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }

    print "NOTICE: _PerlModuleCheck() ok\n";
    return 1;
}

sub _PerlFormat {
    my $File = shift;
    my $Ok   = 1;
    # get attributes
    my @Content = ();

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        push @Content, $Line;
    }
    close $In;

    # remove double empty lines
    my @ContentNew = ();
    my $Empty = 0;
    my $LineCount = 0;
    for my $Line (@Content) {
        $LineCount++;
        if ($Line =~ /^\s$/) {
            if ($Empty) {
                print "NOTICE: _PerlFormat() removed double empty line in line $LineCount\n";
                next;
            }
            $Empty = 1;
        }
        else {
            $Empty = 0;
        }
        push @ContentNew, $Line;
    }
    @Content = @ContentNew;

    # check invalid comment
    for my $Line (@Content) {
        if ($Line =~ /^(\s##|##)/) {
            my $Comment = $Line;
            $Comment =~ s/(\n|\r)//g;
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: Invalid comment in line: $Comment!\n";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
            $Ok = 0;
        }
    }

    # check not useable syntax
    for my $Line (@Content) {
        if ($Line =~ /^\s#/) {
            if ($Line =~ /\sgoto\s/) {
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: Do not use goto function at all in perl, line: $Line!\n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
                $Ok = 0;
            }
        }
    }

    open my $Out, '>', $File or die "FILTER: Can't write $File: $!\n";
    for my $Line (@Content) {
        print $Out $Line;
    }
    close $Out;

    return if !$Ok;

    print "NOTICE: _PerlFormat() ok\n";
    return 1;
}

sub _TabulatorCheck {
    my %FileData = @_;

    return 1 if $FileData{Directory} =~ m{sample};
    return 1 if $FileData{Name} =~ m{test-email};

    my $Ok      = 1;
    my $Counter = 0;
    my $Code    = '';

    for my $Line (@{$FileData{ContentArrayRef}}) {
        $Counter++;
        if ($Line =~ /\t/) {
            $Ok = 0;
            $Code .= "ERROR: Line $Counter: $Line";
        }
    }

    if (!$Ok) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Tabulators are used! Please remove!\n";
        print $Code;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }

    print "NOTICE: _TabulatorCheck() ok\n";
    return 1;
}

sub _SeparatorCheck {
    my $File    = shift;
    my $Ok      = 1;
    my $Counter = 0;
    my $Code    = '';
    my $Flag    = 0;

    return 1 if $File =~ m{AGPL3.pm$}smx;

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /^[^#]/ && $Counter < 24) {
            $Flag = 1;
        }
        if ($Line =~ /^ *# --\n$/ && ($Counter > 23 || ($Counter > 10 && $Flag))) {
            $Ok = 0;
            $Code .= "ERROR: Line $Counter: $Line";
        }
        elsif ($Line =~ /^ *# -\n$/) {
            $Ok = 0;
            $Code .= "ERROR: Line $Counter: $Line";
        }
        elsif ($Line =~ /^ *##+ -+\n$/) {
            $Ok = 0;
            $Code .= "ERROR: Line $Counter: $Line";
        }
        elsif ($Line =~ /^ *#+ *[\*\+]+\n$/) {
            $Ok = 0;
            $Code .= "ERROR: Line $Counter: $Line";
        }
        elsif ($Line =~ /^ *##+/) {
            $Ok = 0;
            $Code .= "ERROR: Line $Counter: $Line";
        }
    }
    close $In;

    if (!$Ok) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Please remove or replace wrong Separators '# --'!\n";
        print "ERROR: Valid only:\n";
        print "ERROR: # -------------------------------------\n";
        print "ERROR: # ---    (for customizing otrs files)\n";
        print $Code;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }

    print "NOTICE: _SeparatorCheck() ok\n";
    return 1;
}
# _PerldocSyntaxCheck and _PerlLocateFunctionsWithoutPerldoc depends on an other, perhaps i should merge them
sub _PerldocSyntaxCheck {
    my $File = shift;
    my $Directory = shift;
    my $Basename = basename( $File );
    my $Back = 0;
    my $Over = 0;
    my $Terms = 0;

    # ignore opennms files
    return 1 if $Directory =~ m{Kernel\/System}xms && $File =~ m{TicketService.pm}xms;

    if ($Directory =~ /System\/(CustomerAuth|Stats|GenericAgent|Crypt|PostMaster|AuthSession|Email|Web\/UploadCache|Auth|DB|CustomerUser|Log|User\/Preferences|LinkObject|Support|Service|SLA|MailAccount|Queue|Cache|Ticket\/(Permission|CustomerPermission|Number|IndexAccelerator|Event|Acl|ArticleSearchIndex)|VirtualFS)/) {
        print "NOTICE: _PerldocSyntaxCheck() - if this function is usefull for this directory we have to discuss!\n";
        return 1;
    }
    if ($File =~ /(ArticleStorage(DB|FS)|Custom)\.pm$/) {
        print "NOTICE: _PerldocSyntaxCheck() - if this function is usefull for this directory we have to discuss!\n";
        return 1;
    }

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        if ($Line =~ /=back/) {
            $Back++;
        }
        elsif ($Line =~ /=over/) {
            $Over++;
        }
        elsif ($Line =~ /=head1 TERMS AND CONDITIONS/) {
            $Terms = 1;
        }
    }
    close $In;

    if ($Over != $Back) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: PerldocSyntaxCheck! You use $Over =over but $Back =back!\n";
        print "ERROR: The correct position the last =back is probably before\n";
        print "ERROR: the line '=head1 TERMS AND CONDITIONS'\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }
    elsif (!$Terms && $Directory =~ /\/System(\/|$)/ && $Directory !~ /\/Dynamic/) {
        my $VersionString = "Id: $Basename,v 1.2 2009/03/04 12:08:41 anybody Exp ";
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: PerldocSyntaxCheck! Please insert the following lines\n";
        print "ERROR: at the end of your document\n";
        print "ERROR:=head1 TERMS AND CONDITIONS\n";
        print "ERROR:\n";
        print "ERROR:This software is part of the OTRS project (L<http://otrs.org/>).\n";
        print "ERROR:\n";
        print "ERROR:This software comes with ABSOLUTELY NO WARRANTY. For details, see\n";
        print "ERROR:the enclosed file COPYING for license information (AGPL). If you\n";
        print "ERROR:did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.\n";
        print "ERROR:\n";
        print "ERROR:=head1 VERSION\n";
        print "ERROR:\n";
        print "ERROR:\$$VersionString\$\n";
        print "ERROR:\n";
        print "ERROR:=cut\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }
    elsif ($Directory =~ /\/Dynamic/) {
        print "WARNING: -------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: PerldocSyntaxCheck! Please insert the following lines\n";
        print "WARNING: at the end of your document\n";
        print "WARNING:=head1 TERMS AND CONDITIONS\n";
        print "WARNING:\n";
        print "WARNING:This software is part of the OTRS project (L<http://otrs.org/>).\n";
        print "WARNING:\n";
        print "WARNING:This software comes with ABSOLUTELY NO WARRANTY. For details, see\n";
        print "WARNING:the enclosed file COPYING for license information (AGPL). If you\n";
        print "WARNING:did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.\n";
        print "WARNING:\n";
        print "WARNING:=head1 VERSION\n";
        print "WARNING:\n";
        print "WARNING:\$\$\n";
        print "WARNING:\n";
        print "WARNING:=cut\n";
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------\n";
    }
    else {
        print "NOTICE: _PerldocSyntaxCheck() ok\n";
    }
    return 1;
}

sub _PerldocSpellingCheck {
    my $File                = shift;
    my $Directory           = shift;
    my $FunctionItem        = '';
    my $FunctionSub         = '';
    my $ItemLine            = '';
    my $SubLine             = '';
    my $DescriptionLine     = '';
    my $FunctionDescription = '';
    my $Counter             = 0;
    my $Ok                  = 1;

    if ($File =~ /EventHandler\.pm$/) {
        return 1;
    }

    # ignore Kernel/System/Ticket extensions
    return 1 if $Directory =~ m{Kernel\/System\/Ticket}xms;

    # ignore opennms files
    return 1 if $Directory =~ m{Kernel\/System}xms && $File =~ m{TicketService.pm}xms;

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ m{^=item}smx) {
            if ($Line =~ /=item (.+)\(\)/) {
                $FunctionItem = $1;
                $FunctionItem =~ s/ //;
                $ItemLine = $Line;
                chomp($ItemLine);
            }
            else {
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: PerldocSpellingCheck! Item without function (near Line $Counter)! \n";
                print "ERROR: the line should look like '=item functionname()'\n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
                $Ok = 0;
            }
        }
        if ($FunctionItem && $Line =~ /->(.+?)\(/ && !$FunctionDescription) {
            $FunctionDescription = $1;
            $FunctionDescription =~ s/ //;

            if ($Line =~ /\$Self->/)  {
                chomp($DescriptionLine);
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: PerldocSpellingCheck! Don't use \$Self in perldoc\n";
                print "ERROR: $Line";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
                $Ok = 0;
            }
            elsif ($FunctionItem ne $FunctionDescription) {
                # the following if clause is to realize a whitelist
                # an other possiblity can be to allow more than one function
                # per =item
                if ($FunctionItem ne 'FetchrowArray') {
                    $DescriptionLine = $Line;
                    chomp($DescriptionLine);
                    print "ERROR: -------------------------------------------------\n";
                    print "ERROR:\n";
                    print "ERROR: PerldocSpellingCheck!\n";
                    print "ERROR: $ItemLine <-> $DescriptionLine \n";
                    print "ERROR:\n";
                    print "ERROR: -------------------------------------------------\n";
                    $Ok = 0;
                }
            }
            if ($FunctionItem && $Line !~ /\$[A-Za-z0-9]+->(.+?)\(/ && $FunctionItem ne 'new') {
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: PerldocSpellingCheck! The function syntax is't correct!\n";
                print "ERROR: Line $Counter $Line";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
                $Ok = 0;
            }
        }
        if ($FunctionItem && $Line =~ /sub/) {
            if ($Line =~ /sub (.+) {/) {
                $FunctionSub = $1;
                $FunctionSub =~ s/ //;
                $SubLine = $Line;

                if ($FunctionSub ne $FunctionItem) {
                    chomp($SubLine);
                    print "ERROR: -------------------------------------------------\n";
                    print "ERROR:\n";
                    print "ERROR: PerldocSpellingCheck!\n";
                    print "ERROR: $ItemLine <-> $SubLine \n";
                    print "ERROR:\n";
                    print "ERROR: -------------------------------------------------\n";
                    $Ok = 0;
                }
            }
            $FunctionItem = '';
            $FunctionDescription = '';
        }
    }
    close $In;

    return if !$Ok;

    print "NOTICE: _PerldocSpellingCheck() ok\n";
    return 1;
}

#
# wrap AGPL links in PDD sections with L<>
#
sub _PerldocURLFormatCheck {
    my $File                = shift;
    my $Counter             = 0;
    my $Ok                  = 1;
    my $InsidePODItem       = 0;
    my $Code                = '';

    # get attributes
    copy($File, "$File.tmp");
    open my $In, '<', $File           or die "FILTER: Can't open $File: $!\n";
    open my $Out, '>', "$File.$$.tmp" or die "FILTER: Can't write $File.tmp: $!\n";

    while (my $Line = <$In>) {
        $Counter++;

        # find POD items
        if ($Line =~ m{^=(item|head)}smx) {
            $InsidePODItem = 1;
        }
        # find end of POD item
        if ($Line =~ m{^=cut}smx){
            $InsidePODItem = 0;
        }
        if ($InsidePODItem){
            # find a line with an url and if is not in the right format, fix it
            if ( $Line =~ m{[^<] ( http:// [^\s]+ agpl\.txt ) [^>]}smx ){
                $Code .= "WARNING: Old Line $Counter: $Line";
                $Line =~ s{( http:// [^\s]+ agpl\.txt )}{L<$1>}smxg if defined $Line;
                $Code .= "WARNING: New Line $Counter: $Line";
                $Ok = 0;
            }
        }
        print $Out $Line;
    }
    close $Out;
    close $In;
    unlink $File or die "FILTER: Can't unlink: $!\n";
    rename "$File.$$.tmp", $File or die "FILTER: Can't rename: $!\n";

    if (!$Ok) {
        print "WARNING: -------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: _PerldocURLFormatCheck()\n";
        print "WARNING: Link in Perldoc format update!\n";
        print $Code;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------\n";
    }
    else {
        print "NOTICE: _PerldocURLFormatCheck() ok\n";
    }
    return 1;
};

sub _MarkCheck {
    my $File = shift;

    return 1 if $File =~ /filter\.pl/;

    my $Ok      = 1;
    my $Counter = 0;
    my $Code    = '';

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /(TODO|FIXME)/) {
            if ($Line !~ /(otrs\/TODO|Location="TODO)/) {
                $Ok = 0;
                $Code .= "WARNING: Line $Counter: $Line";
            }
        }
    }
    close $In;

    if (!$Ok) {
        print "WARNING: -------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: Developer marks are used! Please remove!\n";
        print $Code;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------\n";
    }
    else {
        print "NOTICE: _MarkCheck() ok\n";
    }

    return 1;
}

sub _SubCheck {
    my $File = shift;

    return 1 if $File =~ m{filter.pl}smx;

    my $InSub         = '';
    my $Ok            = 1;
    my $Counter       = 0;
    my $LastCodeLine  = '';
    my $ExitWarning   = '';
    my $ReturnWarning = '';
    my $Die           = 0;

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        # find the start of a funciton
        if ($Line =~ /^sub (.*) {/) {
            # check if a sub start merge before the last is close
            # this is possible because of an bad codedesign
            if ($InSub) {
                print "WARNING: -------------------------------------------------\n";
                print "WARNING:\n";
                print "WARNING: There is something wrong with the sub near Line $Counter!\n";
                print "WARNING: (perhaps only wrong formated)\n";
                print "WARNING:\n";
                print "WARNING: -------------------------------------------------\n";
                $Ok = 0;
            }
            else {
                $InSub = $1;
            }
        }
        # search for exit-functions in subs
        if ($InSub && $Line =~ /^ *exit/) {
            # Only a warning for existing function with exit
            if ($File =~ /(?:PostMasterDaemon\.pl|InterfaceAgent\.pm|Layout\.pm|InterfaceCustomer\.pm|InterfacePublic\.pm|Ticket\.t)/) {
                $ExitWarning .= "WARNING: Line: $Counter $Line";
            }
            elsif ($File =~ /Main\.pm/ && $InSub eq 'Die') {
                # there is noting to do, this is allowed
            }
            else {
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: Don't use exit in functions!\n";
                print "ERROR: Line: $Counter $Line";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
                return;
            }
        }
        # find the function Die
        if ($Line =~ /^sub Die {/ && $File =~ /Main.pm/) {
            $Die = 1;
        }

        # try to get the last code statment to find later out if return is used or not
        if ( $Line !~ m{ \A (?: [ \t]* \# | [ \t]* \n | \} \n ) }xms ) {
            $LastCodeLine = $Line;
        }

        # find the last line of the function
        if ($InSub && $Line =~ /^}/) {
            $InSub = '';
            $Die = 0;
            # print a warning, if the last comment of an function isn't a return
            # we will ignore functions where code in the last line starts with ');', '];' or '};'
            # because the function might return an array/arrayref/hash/hashref
            # if such code lines do not belong to a return, there is no 'missing return' warning
            if ( $LastCodeLine !~ m{ \A [ \t]* (?: return | \); | \]; | \}; ) }xms && !$Die ) {
                $ReturnWarning .= "WARNING: near Line: $Counter \n";
            }
            $LastCodeLine = '';
        }
    }
    close $In;

    if ($ExitWarning) {
        print "WARNING: -------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: Don't use exit in functions!\n";
        print $ExitWarning;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------\n";
        $Ok = 0;
    }

    if ($ReturnWarning) {
        print "WARNING: -------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: A function without return statement!\n";
        print $ReturnWarning;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------\n";
        $Ok = 0;
    }

    if ($Ok) {
        print "NOTICE: _SubCheck() ok\n";
    }
    return 1;
}

sub _FileOperationCheck {
    my $File     = shift;
    my $Ok       = 1;
    my $Counter  = 0;
    my $OpenIn   = '';
    my $OpenOut  = '';
    my $Opendir  = 0;
    my $Closedir = 0;
    my $Code     = '';

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        # check operation for handling files
        if ($Line =~ /^[^#]*open ?\(([A-Z]+?), "</) {
            if ($OpenIn) {
                # whitepaperconstruction
                if ($File !~ /FS.pm/) {
                    $Code .= "ERROR: File isn't closed!\n";
                    $Code .= "ERROR: before Line $Counter: $Line";
                    $Ok = 0;
                }
            }
            else {
                $OpenIn = $1;
            }
        }
        if ($Line =~ /^ *?close ?\($OpenIn/) {
            $OpenIn = '';
        }

        if ($Line =~ /^[^#]*open ?\(([A-Z]+?), ">/) {
            if ($OpenOut) {
                # whitepaperconstruction
                if ($File !~ /FS.pm/) {
                    $Code .= "ERROR: File isn't closed!\n";
                    $Code .= "ERROR: before Line $Counter: $Line";
                    $Ok = 0;
                }
            }
            else {
                $OpenOut = $1;
            }
        }
        if ($Line =~ /^ *?close ?\($OpenOut/) {
            $OpenOut = '';
        }
        # check operation for handling directories
        if ($Line =~ /^[^#]*opendir ?\(/) {
            if ($Opendir) {
                    $Code .= "ERROR: Directory is'n closed!\n";
                    $Code .= "ERROR: before Line $Counter: $Line";
                    $Ok = 0;
            }
            else {
                $Opendir = 1;
            }
        }
        if ($Line =~ /^ *?closedir ?\(/) {
            $Opendir = 0;
        }
    }
    close $In;

    if ($Opendir) {
            $Code .= "ERROR: Last Directory is'n closed!\n";
            $Ok = 0;
    }
    if ($OpenIn) {
            $Code .= "ERROR: Last File isn't closed!\n";
    }
    if ($OpenOut) {
            $Code .= "ERROR: Last File isn't closed!\n";
    }
    if (!$Ok) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print $Code;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }

    print "NOTICE: _FileOperationCheck() ok\n";
    return 1;
}

sub _FourSpacesCheck {
    my $File      = shift;
    my $Ok        = 1;
    my $Counter   = 0;
    my $StartLine = 0;
    my $Text      = '';
    my $StartText = '';
    my $TextArea  = 0; # in config files
    my $Data      = 0; # database entries of sopm files

    return 1 if $File =~ m{templates\.xml$}smx; # a file of doc-developer
    return 1 if $File =~ m{layout\.xml$}smx;    # a file of doc-developer

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;

        # textareas in config files
        if ($File =~ /.xml/ && $Line =~ /<TextArea>/) {
            $TextArea = 1;
        }
        if ($File =~ /.xml/ && $Line =~ /<\/TextArea>/) {
            $TextArea = 0;
        }

        if ($Line =~ /^( +)/) {
            my $SpaceString = $1;
            my $Length = length $SpaceString;

            if ($Length % 4 && !$StartLine && !$TextArea && !$Data) {
                $Ok = 0;
                $StartLine = $Counter;
                $StartText = $Line;
            }

            elsif ($StartLine && !($Length % 4)) {
                my $EndLine = $Counter - 1;
                $Text .= "ERROR: Line form $StartLine to $EndLine: $StartText\n";
                $StartLine = 0;
            }
        }

        # database entries of sopm files
        if ($File =~ /.sopm/ && $Line =~ m{ <Data \s}smx ) {
            $Data = 1;
        }
        if ($File =~ /.sopm/ && $Line =~ m{ < \/ Data > }smx ) {
            $Data = 0;
        }
    }
    close $In;

    if ($StartLine) {
        $Text .= "ERROR: Line form $StartLine to $Counter: $StartLine\n";
    }

    if ($Text) {
        print "ERROR: -----------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Space at the beginnig of a line should have steps of four spaces!\n";
        print $Text;
        print "ERROR:\n";
        print "ERROR: -----------------------------------------------------\n";
        return;
    }

    if ($Ok) {
        print "NOTICE: _FourSpacesCheck() ok\n";
    }
    return 1;
}

sub _PerlMainObjectYesCheck {
    my %FileData = @_;

    # check only pl files
    return 1 if $FileData{Name} !~ m{\.pl$}smx;

    # don't check
    return 1 if $FileData{Directory} =~ m{ cgi-bin }smx ;

    return 1 if $FileData{ContentString} !~ m{use \s Kernel::}smx;

    if ($FileData{ContentString} !~ /use Kernel::System::Main/m && $FileData{ContentString} !~ /Kernel::System::Main->new\(/m) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: No MainObject integrated!\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }

    print "NOTICE: _PerlMainObjectYesCheck() ok\n";
    return 1;
}

sub _PerlMainObjectNoCheck {
    my %FileData = @_;

    # check only pm files
    return 1 if $FileData{Name} !~ m{\.pm$}smx;

    # don't check
    return 1 if $FileData{Directory} =~ m{ \/System\/Web }smx && $FileData{Name} =~ m{Interface}smx;

    my $Code = '';
    my $Item = 0;

    for my $Line (@{$FileData{ContentArrayRef}}) {

        if ($Line =~ /=item/) {
            $Item = 1;
        }

        if (!$Item) {
            $Code .= $Line;
        }

        if ($Line =~ /=cut/) {
            $Item = 0;
        }
    }

    if ($Code =~ /use Kernel::System::Main(\s|.)*?=head1 NAME/m) {
        print "WARNING: -----------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: Don't integrate MainObject (use Kernel::System::Main)\n";
        print "WARNING: in this file! In OTRS 2.1 you aren't allowed to use\n";
        print "WARNING: the MainObject here, but in OTRS 2.0 it can make sense.\n";
        print "WARNING:\n";
        print "WARNING: -----------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _PerlMainObjectNoCheck() ok\n";
    return 1;
}

sub _PerlEncodeObjectYesCheck {
    my %FileData = @_;

    # check only pl files
    return 1 if $FileData{Name} !~ m{\.pl$}smx;

    # don't check
    return 1 if $FileData{Directory} =~ m{ cgi-bin }smx ;

    return 1 if $FileData{ContentString} !~ m{use \s Kernel::}smx;

    if ($FileData{ContentString} !~ /use Kernel::System::Encode/m && $FileData{ContentString} !~ /Kernel::System::Encode->new\(/m) {
        print "WARNING: -------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: No EncodeObject integrated!\n";
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _PerlEncodeObjectYesCheck() ok\n";
    return 1;
}

sub _PerlEncodeObjectNoCheck {
    my %FileData = @_;

    # check only pm files
    return 1 if $FileData{Name} !~ m{\.pm$}smx;

    # don't check
    return 1 if $FileData{Directory} =~ m{ \/System\/Web }smx && $FileData{Name} =~ m{Interface}smx;

    my $Code = '';
    my $Item = 0;

    for my $Line (@{$FileData{ContentArrayRef}}) {

        if ($Line =~ /=item/) {
            $Item = 1;
        }

        if (!$Item) {
            $Code .= $Line;
        }

        if ($Line =~ /=cut/) {
            $Item = 0;
        }
    }

    if ($Code =~ /use Kernel::System::Encode(\s|.)*?=head1 NAME/m) {
        print "WARNING: -----------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: Don't integrate EncodeObject (use Kernel::System::Encode)\n";
        print "WARNING: in this file! In OTRS 2.4 you aren't allowed to use\n";
        print "WARNING: the EncodeObject here, but in OTRS 2.3 it can make sense.\n";
        print "WARNING:\n";
        print "WARNING: -----------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _PerlEncodeObjectNoCheck() ok\n";
    return 1;
}

sub _LayoutObjectCheck {
    my %FileData = @_;

    # don't check these files
    return 1 if $FileData{Name} =~ m{filter\.pl$}smx;
    return 1 if $FileData{Name} eq 'InterfacePublic.pm';
    return 1 if $FileData{Name} eq 'InterfaceAgent.pm';
    return 1 if $FileData{Name} eq 'InterfaceCustomer.pm';
    return 1 if $FileData{Name} eq 'Fred.pm';

    # only pl-files or pm-files in System directory are needed
    return 1 if $FileData{Name} !~ m{\.pl$}smx && !($FileData{Name} =~ m{\.pm$}smx && $FileData{Directory} =~ m{System}smx);

    my $Ok = 1;
    my $Code = '';
    my $Counter = 0;
    for my $Line (@{$FileData{ContentArrayRef}}) {
        $Counter++;
        if ($Line =~ /{LayoutObject}/) {
            if ($FileData{Directory} =~ /System$/) {
                $Ok = 0;
                $Code .= "ERROR: Line $Counter: $Line";
            }
            else {
                $Code .= "WARNING: Line $Counter: $Line";
            }
        }
    }

    if (!$Ok) {
        print "ERROR: -------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Don't use the LayoutObject in core modules or pl.files!\n";
        print $Code;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------\n";
        return;
    }
    elsif ($Ok && $Code) {
        print "WARNING: -------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: Don't use the LayoutObject in core modules or pl.files!\n";
        print $Code;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------\n";
    }
    else {
        print "NOTICE: _LayoutObjectCheck() ok\n";
    }
    return 1;
}

sub _PerlDBObjectCheck {
    my %FileData = @_;

    # don't check these files
    return 1 if $FileData{Name} !~ m{\.pm$}smx;
    return 1 if $FileData{Directory} !~ m{Modules}smx;

    my $Ok = 1;
    my $Code = '';
    my $Counter = 0;

    LINE:
    for my $Line (@{$FileData{ContentArrayRef}}) {
        $Counter++;
        next LINE if $Line !~ m{\{DBObject\}}smx;
        next LINE if $Line =~ m{DBObject \s+    => \s \$Self->\{DBObject\} }smx;

        $Ok = 0;
        $Code .= "WARNING: Line $Counter: $Line";
    }

    if (!$Ok) {
        print "WARNING: -------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: Don't use the DBObject in frontend modules!\n";
        print $Code;
        print "WARNING: ATTENTION: This is only a warning because of older otrs-files!\n";
        print "WARNING: Please use no DBObject in new frontend modules\n";
        print "WARNING:\n";
        print "WARNING: -------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _DBObjectCheck() ok\n";
    return 1;
}

sub _ParamObjectCheck {
    my $File = shift;
    my $Directory = shift;

    if ($File =~ /(filter|json).pl/) {
        print "NOTICE: _ParamObjectCheck() ignored\n";
        return 1;
    }

    my @Code = ();
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /{ParamObject}/) {
            push (@Code, "Line $Counter: $Line");
        }
    }
    close $In;

    if (!$Code[0]) {
        print "NOTICE: _ParamObjectCheck() ok\n";
        return 1;
    }

    if ($Directory !~ /System\/Web/ && $File !~ m{installer.pl$}smx ) {
        print "ERROR: -------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Don't use the ParamObject in core modules or .pl files!\n";
        for (@Code) {
            print "ERROR: $_";
        }
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------\n";
        return;
    }

    print "WARNING: -------------------------------------------------------\n";
    print "WARNING:\n";
    print "WARNING: Don't use the ParamObject in core modules or .pl files!\n";
    for (@Code) {
        print "WARNING: $_";
    }
    print "WARNING:\n";
    print "WARNING: -------------------------------------------------------\n";
    return 1;
}

sub _DieCheck {
    my $File = shift;
    my $Directory = shift;
    my $Ok = 1;
    my $Error = '';
    my $Warning = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;

        if ($Line =~ /die[^A-Za-z]+/) {
            if ($Directory =~ /\/Modules/) {
                $Ok = 0;
                $Error .= "ERROR: Line $Counter: $Line";
            }
            else {
                $Ok = 2;
                $Warning .= "WARNING: Line $Counter: $Line";
            }
        }
    }
    close $In;
    if (!$Ok) {
        print "ERROR: -------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Don't use die() in .pm files!\n";
        print $Error;
        print "ERROR: If you use code like 'die \"Got no \$_!\" if (!\$Self->{\$_});'\n";
        print "ERROR: Try this:\n";
        print "ERROR: if (!\$Self->{\$_}) {\n";
        print "ERROR:     \$Self->{LayoutObject}->FatalError(Message => \"Got no \$_!\");\n";
        print "ERROR: }\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------\n";
        return;
    }
    elsif ($Ok == 2) {
        #print "WARNING: -------------------------------------------------\n";
        #print "WARNING:\n";
        #print "WARNING: Don't use die() in .pm files!\n";
        #print $Warning;
        #print "WARNING:\n";
        #print "WARNING: -------------------------------------------------\n";
        print "NOTICE: _DieCheck() - die() found, but we have no solution for this problem at the moment!\n";
    }
    else {
        print "NOTICE: _DieCheck() ok\n";
    }
    return 1;
}

sub _PrintCheck {
    my $File = shift;
    my $Directory = shift;
    my @Code = ();
    my $Counter = 0;
    my $Item = 0;
    my $InSub = '';
    my $TmpFileHandle = '';
    my $FilePrint = 0;

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;

        # new way to handle file prints
        if ($Line =~ /open.*?['"]>/) {
            $FilePrint = 1;
        }
        if ($FilePrint) {
            if ($Line =~ /close/) {
                $FilePrint = 0;
            }
            next;
        }

        # the following checksyntax is to complex! rework it
        if ($Line =~ /=item/) {
            $Item = 1;
        }

        if ($Line =~ /^sub (.*) {/) {
            $InSub = $1;
        }
        if ($InSub && $Line =~ /^}/) {
            $InSub = '';
            $TmpFileHandle = '';
        }

        if ($Line =~ /\((.+?), .+?\) = \$Self->{FileTempObject}->TempFile\(\);/) {
            $TmpFileHandle = "\\" . $1;
            # the substr function is necessay because some filehandle are mixed
            $TmpFileHandle = substr($TmpFileHandle, 0, 4);
        }
        # The following constructions are allowed
        # print in the sub Print in file Layout.pm
        # print with TmpFileHandle transmitted per ref
        # print in GenericAgent.pm
        # print in files of the path System/PostMaster
        #if ($TmpFileHandle && $Line =~ /print $TmpFileHandle/) {

        if ($TmpFileHandle && $Line =~ /print $TmpFileHandle/) {

            # print with TmpFileHandle transmitted per ref is okay
        }
        elsif ($Line =~ /(^print| print)/ && !$Item && (($InSub ne 'Print' && $File =~ /Layout.pm/) || ($File !~ /(Layout|GenericAgent|UnitTest).pm/))) {
            if ($Line !~ /(sprintf|.*#.*print|print \$\w+|print [A-Z]+|print[A-Za-z]+|'print')/) {
                push (@Code, "Line $TmpFileHandle $Counter: $Line");
            }
        }

        if ($Line =~ /=cut/) {
            $Item = 0;
        }
    }
    close $In;
    if ($Code[0]) {
        if ($File =~ /(AgentTicket(Queue|StatusView)|CustomerTicketOverView|Fred|AGPL3).pm/) {
            print "WARNING: -------------------------------------------------------\n";
            print "WARNING:\n";
            print "WARNING: Don't use print () in .pm files!\n";
            for (@Code) {
                print "WARNING: $_";
            }
            print "WARNING:\n";
            print "WARNING: -------------------------------------------------------\n";
        }
        elsif ($Directory !~ /System\/Web/) {
            print "ERROR: -------------------------------------------------------\n";
            print "ERROR: \n";
            print "ERROR: Don't use print () in .pm files!\n";
            for (@Code) {
                print "ERROR: $_";
            }
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------------\n";
            return;
        }
        else {
            print "WARNING: -------------------------------------------------------\n";
            print "WARNING:\n";
            print "WARNING: Don't use print () in .pm files!\n";
            for (@Code) {
                print "WARNING: $_";
            }
            print "WARNING:\n";
            print "WARNING: -------------------------------------------------------\n";
        }
    }
    else {
        print "NOTICE: _PrintCheck() ok\n";
    }
    return 1
}

sub _LocaltimeCheck {
    my $File = shift;
    my $Directory = shift;

    if ($File =~ /filter.pl/) {
        print "NOTICE: _LocaltimeCheck() ignored\n";
        return 1;
    }

    my $Ok = 1;
    my $Code = '';
    my $Counter = 0;

    if (($File !~ m{Log.pm} && $Directory !~ m{System}) && $Directory !~ m{System\/Log|AdminTools} ) {
        open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
        while (my $Line = <$In>) {
            $Counter++;
            if ($Line =~ /localtime/ && $Line !~ /\(localtime\)\[8\]/) {
                $Ok = 0;
                $Code .= "ERROR: Line $Counter: $Line";
            }
        }
        close $In;
    }

    if (!$Ok) {
        print "ERROR: -------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: Don't use the function localtime ()!\n";
        print $Code;
        print "ERROR: Instead of the localtime function use\n";
        print "ERROR: my (\$Sec, \$Min, \$Hour, \$Day, \$Month, \$Year) = \$Self->{TimeObject}->SystemTime2Date(\n";
        print "ERROR:     SystemTime => \$Self->{TimeObject}->SystemTime(),\n";
        print "ERROR: );\n";
        print "ERROR: Don't forget to remove lines like\n";
        print "ERROR:     \$Year = \$Year + 1900;\n";
        print "ERROR:     \$Month = \$Month + 1;\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------\n";
        return;
    }

    print "NOTICE: _LocaltimeCheck() ok\n";
    return 1;
}

sub _HeaderlineCheck {
    my $File = shift;
    my $Directory = shift;

    return 1 if $File =~ /filter.pl/;

    # ignore opennms files
    return 1 if $Directory =~ m{Kernel\/System}xms && $File =~ m{TicketService.pm}xms;

    my $Counter = 0;
    $File =~ /([\w_-]+\.(\w+))$/;
    my $Filename = $1;
    my $FileExtension = $2;

    if ($Filename !~ /(ZZZAuto.pm|ZZZAAuto.pm|Copyright.dtl|AAA.*.dtl)/) {
        open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
        while (my $Line = <$In>) {
            $Counter++;
            if ((($FileExtension eq 'pm' || $FileExtension eq 't' || $FileExtension eq 'dtl') && $Counter == 2) || ($FileExtension eq 'pl' && $Counter == 3)){
                if ($Line !~ /$Filename/) {
                    print "ERROR: -------------------------------------------------------------------------------\n";
                    print "ERROR:\n";
                    print "ERROR: The used filename is different of the filename in the headerline of the script!\n";
                    print "ERROR: File $Filename -> Line $Line";
                    print "ERROR: Don't forget to change the description at the right side of the headerline!\n";
                    print "ERROR:\n";
                    print "ERROR: -------------------------------------------------------------------------------\n";
                    close $In;
                    return;
                }
            }
        }
        close $In;
    }
    print "NOTICE: _HeaderlineCheck() ok\n";
    return 1;
}

sub _ModuleRegistrationCheck {
    my $File = shift;
    my $Counter = 0;
    my $InNavBarTag = 0;
    my %Tag = ();
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /<NavBar> *$/) {
            $InNavBarTag = 1;
        }
        # For OTRS 3, the image tag is not needed anymore.
        # Be careful: Now, also for OTRS 2.x this function does not check the Image tag anymore!
        for (qw(Description Name Link Type Block NavBar AccessKey Prio)) {
            if ($Line =~ /<$_(\s.+?|)>.*?<\/$_>/) {
                $Tag{$_} = 1;
            }
        }

        if ($Line =~ /^ *<\/NavBar>/) {
            for (qw(Description Name Link Type Block NavBar AccessKey Prio)) {
                if (!$Tag{$_}) {
                    print "ERROR: -------------------------------------------------------------------------------\n";
                    print "ERROR:\n";
                    print "ERROR: You forgot to insert the $_-Tag in navbar-tag bevor line $Counter!\n";
                    print "ERROR: Each NavBar-tag of a ModuleRegistration must have the following tags:\n";
                    print "ERROR: Description Name Image Link Type Block NavBar AccessKey Prio\n";
                    print "ERROR:\n";
                    print "ERROR: -------------------------------------------------------------------------------\n";
                    close $In;
                    return;
                }
            }
            $InNavBarTag = 0;
            %Tag = ();
        }

    }
    close $In;
    print "NOTICE: _ModuleRegistrationCheck() ok\n";
    return 1;
}

sub _SQLReservedWordsCheck {
    my $File = shift;
    my $TableCreate = 0;
    my $Ok = 1;

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        if ($Line =~ /<Table/) {
            $TableCreate = 1;
        }
        if ($TableCreate && $Line =~ /<Column.+?Name="(.+?)".*?\/>/i) {
            if (!$1 ) {
                print "ERROR: " . $File . " <-> " . $Line . "\n";
            }
            else {
                for my $ReservedWord (qw(
                    add all alter and
                    any as asc backup
                    begin between bigint binary
                    bit bottom break bulk by cache
                    call capability cascade case
                    cast char char_convert character
                    check checkpoint close comment
                    commit connect constraint contains
                    continue convert create cross
                    cube current current_timestamp current_user
                    cursor date dbspace deallocate
                    dec decimal declare default
                    delete deleting desc distinct
                    do double drop dynamic each
                    else elseif encrypted end
                    endif escape except exception
                    exec execute existing exists
                    externlogin fetch first float
                    for force foreign forward
                    from full goto grant
                    group having holdlock identified
                    if in index index_lparen
                    inner inout insensitive insert
                    inserting install instead int
                    integer integrated intersect into
                    iq is isolation join
                    key lateral left like
                    lock long match
                    membership message mode modify
                    natural new no noholdlock
                    not notify null numeric
                    of off on open
                    option options or order
                    others out outer over
                    passthrough precision prepare primary
                    print privileges proc procedure
                    publication raiserror readtext real
                    references release remote
                    remove rename reorganize resource
                    restore restrict return revoke
                    right role rollback rollup row rule save
                    savepoint scroll select sensitive
                    session set setuser share
                    smallint some sqlcode sqlstate
                    start stop subtrans subtransaction
                    synchronize syntax_error table temporary
                    then time timestamp tinyint
                    to top tran trigger
                    truncate tsequal unbounded undo union
                    unique unknown unsigned update
                    updating user using validate
                    values varbinary varchar variable
                    varying view wait waitfor
                    when where while window
                    with with_cube with_lparen with_rollup
                    within work writetext
                     NOMONITORING RECORDS_PER_BLOCK NOWAIT DYNAMIC_SAMPLING COLUMN_STATS GROUPS
                     NO_PX_JOIN_FILTER NO_STATS_GSETS SWAP_JOIN_INPUTS NOORDER TRIGGERS DEMAND
                     LOB GBY_CONC_ROLLUP ROWDEPENDENCIES NOSTRICT PRIVILEGE SEMIJOIN RAW USE_NL_WITH_INDEX
                     INFORMATIONAL DENSE_RANK NO_QUERY_TRANSFORMATION POINT TRACING NO_XML_QUERY_REWRITE
                     NOPARALLEL_INDEX LINK REF TIMEZONE_ABBR PIV_SSF TX READS DELAY BFILE PRIVATE MAXLOGMEMBERS
                     USE_SEMI COST EVALNAME NO_CARTESIAN TABNO TRACE PLAN HINTSET_END CONTAINER ADMIN COLUMN
                     SYSTEM TZ_OFFSET NLS_LENGTH_SEMANTICS DICTIONARY SCN_ASCENDING FIC_CIV NOOVERRIDE INDICATOR
                     BINARY_FLOAT_NAN ROWID SESSION_CACHED_CURSORS OBJNO SQL_TRACE BLOB RELATIONAL BIGFILE
                     AVAILABILITY GUARD GROUP_BY ADVISE MERGE QUOTA CFILE MEMBER THAN SALT DUMP EXTERNALLY
                     BOTH GUARANTEED EXTENT SECURITY SCALE SYS_DL_CURSOR TYPE DEREF_NO_REWRITE AUTO ESTIMATE
                     POWER USE_STORED_OUTLINES SID VARRAY LESS VALUE XMLFOREST MAXLOGHISTORY STORE REDUNDANCY
                     DEQUEUE DBA MATCHED PRESENT CPU_PER_CALL DEFINER UPD_JOININDEX NESTED_TABLE_SET_REFS
                     EXPAND_GSET_TO_UNION INDEX_SS_ASC EXTRACT ORDERED_PREDICATES ALIAS NO_USE_HASH PRIOR
                     X_DYN_PRUNE COMPOSITE_LIMIT OBJNO_REUSE REVERSE DISABLE CURRENT_DATE INITIAL MINIMUM
                     INTERMEDIATE PARTITION_LIST BYTE MOUNT PREBUILT SOURCE MODEL_PBY BITMAP_TREE LOGFILE
                     ROLES DEGREE INVALIDATE TABLESPACE PASSWORD_VERIFY_FUNCTION COLUMNS CHOOSE SMALLFILE LEVEL
                     OLD_PUSH_PRED DYNAMIC_SAMPLING_EST_CDN NLS_DATE_LANGUAGE SERVERERROR NESTED_TABLE_FAST_INSERT
                     STREAMS NL_SJ ELIMINATE_OUTER_JOIN ENTERPRISE DISASSOCIATE GROUPING PACKAGE DATE_MODE CHILD
                     NO_PRUNE_GSETS REJECT NORESETLOGS NO_CONNECT_BY_COST_BASED CHUNK OID RETENTION MAXTRANS
                     FBTSCAN NONE PARAMETERS ONLINE OUT_OF_LINE GLOBAL_NAME SPACE HINTSET_BEGIN PASSWORD_GRACE_TIME
                     NOCACHE FINAL YEAR RBA ERRORS CLASS USE_NL CONNECT_BY_COST_BASED BINARY_DOUBLE DEFINED
                     EVALUATION PURGE HOUR LENGTH PRECEDING DECREMENT SUBMULTISET INDEX_ROWS SCHEDULER
                     AUTHENTICATION NUMBER OIDINDEX OPAQUE SAMPLE UPDATABLE ORA_ROWSCN INTERPRETED
                     MATERIALIZED INDEX_COMBINE OPAQUE_XCANONICAL INLINE_XMLTYPE_NT RETURNING QUERY
                     OPT_ESTIMATE CLOB NO_EXPAND DETACHED PASSWORD_LOCK_TIME VECTOR_READ DATAFILE REPLACE
                     NLS_CHARACTERSET NO_ELIMINATE_JOIN BROADCAST CIV_GB HASH QB_NAME AFTER SYSDBA ACCOUNT
                     SEVERE PRECOMPUTE_SUBQUERY FUNCTION INDEXTYPES FLOB MULTISET NLS_SPECIAL_CHARS SKIP
                     IGNORE_OPTIM_EMBEDDED_HINTS INDEX_SS NOGUARANTEE LOCALTIMESTAMP DBA_RECYCLEBIN FILE THROUGH
                     PLSQL_WARNINGS MANAGE DRIVING_SITE FAILED SCAN_INSTANCES COMPLETE HIGH TRANSITIONAL
                     NO_SEMIJOIN DAY NOPARALLEL XMLATTRIBUTES MOVE NATIONAL REQUIRED SKIP_EXT_OPTIMIZER
                     NOREPAIR REBUILD JOB SEED POLICY USERS TOPLEVEL BITMAP DATAFILES HASH_AJ INITRANS
                     BLOCKSIZE FAST MINIMIZE SESSIONTZNAME SESSIONS_PER_USER SYS_OP_BITVEC NO_ELIMINATE_OBY
                     UBA DATA SUBPARTITION_REL SETS PRIVATE_SGA BINARY_FLOAT ENFORCED TABLE_STATS FLAGGER
                     TEMP_TABLE ARCHIVE NO_PUSH_SUBQ RECYCLE DATAOBJNO QUEUE_ROWP SQL CHAINED EMPTY
                     SAVE_AS_INTERVALS BITMAPS OPTIMIZER_FEATURES_ENABLE FUNCTIONS AUTOMATIC SECOND
                     NO_FILTERING NAMED SUSPEND LIKEC NO_BUFFER PQ_NOMAP NLS_LANG ADVISOR
                     FRESH NO_CONNECT_BY_FILTERING NOSORT PASSWORD HASHKEYS EXCLUDING INDEX_RRS DISK
                     BITS CACHE_CB USE STAR CURSOR_SPECIFIC_SEGMENT SB4 DISTRIBUTED HEAP MINEXTENTS DML
                     ATTRIBUTES NORELY KEYSIZE LEADING XMLCOLATTVAL FREELIST FAILED_LOGIN_ATTEMPTS
                     SHARED_POOL USE_ANTI BYPASS_RECURSIVE_CHECK ANTIJOIN ABORT INDEX_FILTER ROLLING
                     ITERATION_NUMBER COALESCE NO_SQL_TUNE CLUSTER PROTECTED PARTITION_HASH ERROR
                     NO_MULTIMV_REWRITE UB2 THREAD SINGLE SYS_PARALLEL_TXN INDEX_ASC PARTITION
                     DISMOUNT HIERARCHY STRIP NLS_DATE_FORMAT CORRUPTION STORAGE COMMITTED RECYCLEBIN
                     PARITY CACHE_TEMP_TABLE ENCRYPTION LOCALTIME REWRITE_OR_ERROR DBMS_STATS CHAR_CS
                     EXCEPTIONS EXPIRE AUDIT LDAP_REG_SYNC_INTERVAL NOMINVALUE LIBRARY COMPILE MAXVALUE
                     NAN NOSEGMENT NOLOGGING NOROWDEPENDENCIES PATH NOFORCE FINISH FIC_PIV MAX SYSAUX
                     DIMENSION ORGANIZATION NOSWITCH WRITE MINUS KILL OFFLINE TRANSACTION FACT BECOME
                     UNBOUND TIV_SSF OLD TEMPFILE EXPLOSION REFRESH MIRROR REF_CASCADE_CURSOR
                     OPCODE OVERFLOW CURSOR_SHARING_EXACT PUSH_SUBQ CARDINALITY USE_PRIVATE_OUTLINES
                     LIKE4 TYPES NOTHING TIMEZONE_HOUR UNQUIESCE RESIZE COLLECT INSTANCE SETTINGS EXPORT
                     DOMAIN_INDEX_NO_SORT MERGE_SJ LIMIT SYS_OP_EXTRACT LIKE2 STANDALONE LAST
                     CONNECT_BY_FILTERING RESTRICT_ALL_REF_CONS MERGE_CONST_ON UNIFORM SCAN WITHOUT
                     CPU_PER_SESSION PROGRAM SEG_FILE APPLY PASSWORD_LIFE_TIME DML_UPDATE ALLOW
                     SKIP_UNQ_UNUSABLE_IDX NO_MERGE CLOSE_CACHED_OPEN_CURSORS NESTED_TABLE_GET_REFS
                     SPECIFICATION CONSISTENT USE_CONCAT SYS_OP_NTCIMG$ PQ_MAP SHUTDOWN DEFERRABLE
                     FOLLOWING SPLIT UNPROTECTED TIME_ZONE SHRINK INDEX_SKIP_SCAN LOGICAL
                     MODEL_MIN_ANALYSIS XMLROOT SD_SHOW CREATE_STORED_OUTLINES RAPIDLY USE_MERGE QUEUE_CURR
                     STRICT MV_MERGE NO_ORDER_ROLLUPS TREAT UNLIMITED TUNING CHANGE PCTUSED MOVEMENT
                     NO_REWRITE ANCILLARY CLUSTERING_FACTOR BLOCK_RANGE SEQUENTIAL GLOBALLY XMLTYPE INTERVAL
                     SEQUENCED SWITCHOVER AT NOMAXVALUE SYS_FBT_INSDEL KERBEROS TIMEZONE_OFFSET
                     INDEX_SS_DESC RECOVERY NLS_TERRITORY SIZE FAILGROUP ELEMENT INSTANCES DIRECTORY
                     IDGENERATORS PRESERVE_OID NO_PARALLEL SUBPARTITIONS EXEMPT INDEX_JOIN BEGIN_OUTLINE_DATA
                     NETWORK LOCAL UNUSED NOAUDIT PHYSICAL WRAPPED FREEPOOLS PCTINCREASE FILTER
                     GATHER_PLAN_STATISTICS SYSOPER SD_INHIBIT SEGMENT DISABLE_RPKE NLS_SORT PATHS
                     ENTRY LDAP_REGISTRATION_ENABLED DISKS OBJECT INCREMENTAL REGEXP_LIKE OVERFLOW_NOMOVE
                     SUBQUERIES NO_PARALLEL_INDEX XID INITIALIZED STATISTICS ENCRYPT AUTOALLOCATE TEMPLATE
                     LDAP_REGISTRATION NO_UNNEST NO_PARTIAL_COMMIT ORDINALITY NLS_COMP NOCOMPRESS RULES
                     IMMEDIATE MAIN REFERENCING ENQUEUE SEG_BLOCK UNRECOVERABLE NO_MONITORING NO_ACCESS
                     RESOLVER TIMEZONE_MINUTE NO_ELIMINATE_OUTER_JOIN NO_INDEX UNNEST GUARANTEE BEHALF
                     ALWAYS TEST PERMANENT REGISTER CONFORMING SYNONYM SKIP_UNUSABLE_INDEXES USE_HASH
                     OPERATOR NO_PULL_PRED USE_TTT_FOR_GSETS SERIALIZABLE MIGRATE ITERATE PLSQL_CCFLAGS
                     IGNORE_WHERE_CLAUSE CPU_COSTING TRAILING LOCAL_INDEXES OVERLAPS EXTENDS NOAPPEND
                     METHOD REWRITE UNPACKED COLUMN_VALUE DATABASE EXCHANGE NO_TEMP_TABLE UPSERT YES
                     REBALANCE CONTEXT SPFILE NESTED TRACKING RESOLVE PFILE MAXDATAFILES GLOBAL
                     AUTHENTICATED NESTED_TABLE_ID INDEXES XMLNAMESPACES NO_REF_CASCADE SYSDATE OR_EXPAND
                     ASSOCIATE MODEL_COMPILE_SUBQUERY INITIALLY PARTIALLY XMLSCHEMA MINVALUE PIV_GB HEADER
                     RESTORE_AS_INTERVALS MANAGED BLOCK SINGLETASK DETERMINES PCTVERSION EXPLAIN AND_EQUAL
                     CLONE NO_USE_HASH_AGGREGATION BUFFER_CACHE XMLTABLE EXTERNAL NEVER IDENTIFIER PULL_PRED
                     INDEXED LOGICAL_READS_PER_CALL STARTUP FREELISTS UPD_INDEXES MATERIALIZE LOGON SCHEMA
                     NO_INDEX_SS NO_BASETABLE_MULTIMV_REWRITE IN_MEMORY_METADATA STRUCTURE MAXEXTENTS
                     RECOVERABLE REFERENCED NO_SET_TO_JOIN STAR_TRANSFORMATION CONNECT_BY_ISCYCLE ROWNUM
                     SNAPSHOT EXCLUSIVE CURRENT_TIME KEEP PASSWORD_REUSE_MAX WHENEVER INTERNAL_USE PX_JOIN_FILTER
                     PQ_DISTRIBUTE INLINE HWM_BROKERED FIRST_ROWS MODEL_NO_ANALYSIS NO_PUSH_PRED MODEL_PUSH_REF
                     COMPRESS NOREVERSE NO_INDEX_FFS GENERATED NATIVE LIKE_EXPAND RELY PACKAGES READ IGNORE
                     SQLLDR DISKGROUP FLUSH BYPASS_UJVC RESETLOGS SYS_OP_NOEXPAND PROTECTION BEFORE
                     INSTANTIABLE XMLELEMENT SUBPARTITION XMLPARSE FALSE ADMINISTER SELECTIVITY PCTTHRESHOLD
                     NEXT ERROR_ON_OVERLAP_TIME REKEY QUIESCE PX_GRANULE LOGOFF SCOPE BINDING NLS_CURRENCY
                     THE XMLPI PASSWORD_REUSE_TIME XMLQUERY PARTITIONS NO_QKN_BUFF MODEL_DYNAMIC_SUBQUERY
                     LOCATOR NLS_NCHAR_CONV_EXCP NO_STAR_TRANSFORMATION NOREWRITE TABLESPACE_NO ADMINISTRATOR
                     SEMIJOIN_DRIVER INDEX_FFS REDUCED KEYS LOCKED BUFFER VALIDATION FLASHBACK END_OUTLINE_DATA
                     TO_CHAR MASTER SYS_RID_ORDER PUBLIC MINUS_NULL NVARCHAR2 BOUND RBO_OUTLINE ACTIVATE VARCHAR2
                     MAXSIZE DECRYPT UID MLSLABEL UNTIL AUTOEXTEND ELIMINATE_JOIN RANDOM SEQUENCE NAV CONTENTS
                     USAGE ONLY REUSE MANUAL DOCUMENT CONNECT_BY_ISLEAF CONSIDER ENFORCE REMOTE_MAPPED
                     LIST MAXARCHLOGS ROW_LENGTH NULLS SHARED WELLFORMED INCLUDING APPEND FORCE_XML_QUERY_REWRITE
                     ISOLATION_LEVEL ACCESSED NLS_ISO_CURRENCY SUCCESSFUL CURRENT_SCHEMA ROWS DANGLING TRUE ZONE
                     NLS_NUMERIC_CHARACTERS DEBUG UPDATED RESTRICTED NO_EXPAND_GSET_TO_UNION STATEMENT_ID
                     NOCPU_COSTING AUTHORIZATION NO_USE_MERGE OPAQUE_TRANSFORM ARRAY MEASURES MODEL
                     CONNECT_TIME OPTIMIZER_GOAL SUPPLEMENTAL PCTFREE ANALYZE RECOVER DB_ROLE_CHANGE
                     BLOCKS MAXINSTANCES DDL NOVALIDATE PRESERVE OPT_PARAM CLEAR COARSE IDLE_TIME WALLET
                     SCALE_ROWS ARCHIVELOG CERTIFICATE NORMAL NO_MODEL_PUSH_REF TABLES UPGRADE INFINITE
                     NOARCHIVELOG CONTROLFILE IDENTITY PERFORMANCE INSTANTLY MAPPING ENABLE
                     LOGICAL_READS_PER_SESSION USE_HASH_AGGREGATION DEFERRED REPAIR NO_SWAP_JOIN_INPUTS
                     GLOBAL_TOPIC_ENABLED ELIMINATE_OBY SUBSTITUTABLE STANDBY NLS_CALENDAR LAYER BATCH KEY_LENGTH
                     INCREMENT BUILD ORDERED MONTH NCLOB EXPR_CORR_CHECK MEMORY UROWID EVENTS ALL_ROWS
                     SYS_OP_ENFORCE_NOT_NULL$ SD_ALL COMPUTE USE_WEAK_NAME_RESL NOMINIMIZE SPREADSHEET
                     NL_AJ BUFFER_POOL MERGE_AJ SIBLINGS CONSTRAINTS USER_DEFINED LOG IMPORT NESTED_TABLE_SET_SETID
                     LEVELS PERCENT PUSH_PRED RESUME NO_CPU_COSTING SIMPLE DISCONNECT WHITESPACE
                     UNLOCK NOMAPPING AUTHID ALLOCATE NCHAR_CS USER_RECYCLEBIN DOMAIN_INDEX_SORT QUERY_BLOCK
                     CYCLE HASH_SJ UNDROP LOGGING OWN PASSING MIN SWITCH SORT BINARY_DOUBLE_NAN NODELAY
                     PLSQL_OPTIMIZE_LEVEL PARTITION_RANGE TIMEZONE_REGION CACHE_INSTANCES SUMMARY
                     INDEX_STATS DISTINGUISHED INTERNAL_CONVERT NO_USE_NL DBTIMEZONE SYS_OP_CAST DOWNGRADE
                     RESET INDEX_DESC NOCYCLE POST_TRANSACTION PLSQL_CODE_TYPE E PARENT MAXLOGFILES
                     NO_FACT UNUSABLE XMLSERIALIZE JAVA NCHAR DEREF OUTLINE SET_TO_JOIN NEEDED VERSIONS
                     INDEX_SCAN EXTENTS SESSIONTIMEZONE PLSQL_DEBUG MONITORING BINARY_DOUBLE_INFINITY STATIC
                     RESUMABLE RANGE MANAGEMENT COMPATIBILITY ATTRIBUTE MAXIMIZE UNDER PARALLEL TIV_GB COMPACT
                     OPTIMAL CUBE_GB INCLUDE_VERSION PARALLEL_INDEX FINE SYSTIMESTAMP INDEXTYPE OUTLINE_LEAF
                     CONNECT_BY_ROOT VECTOR_READ_TRACE NLS_LANGUAGE STRING BINARY_FLOAT_INFINITY UNARCHIVED
                     PROFILE SCN MINUTE MODEL_DONTVERIFY_UNIQUENESS ACCESS
                )) {
                    # the following words are removed of stefans list, because they don't merge
                    # at with http://www.petefreitag.com/tools/sql_reserved_words_checker/
                    # ID CATEGORY NAME CONTENT VERSION QUEUE BODY TIMEOUT REFERENCE NOTIFICATION PROJECT TRUSTED
                    # all reserved sql-words with small letters are from
                    # http://www.petefreitag.com/tools/sql_reserved_words_checker/
                    # and http://www.ianywhere.com/developer/product_manuals/sqlanywhere/0901/de/html/dbrfde9/00000010.htm
                    # 'reference' and 'login' seems to be allowed (checked by www.petefreitag.com)
                    # reserved words of oracle, mailed from SR. But I can't find them anywhere else?!
                    # NOMONITORING RECORDS_PER_BLOCK NOWAIT DYNAMIC_SAMPLING COLUMN_STATS GROUPS
                    # NO_PX_JOIN_FILTER NO_STATS_GSETS SWAP_JOIN_INPUTS NOORDER TRIGGERS DEMAND TIMEOUT
                    # LOB GBY_CONC_ROLLUP ROWDEPENDENCIES NOSTRICT PRIVILEGE SEMIJOIN RAW USE_NL_WITH_INDEX
                    # INFORMATIONAL DENSE_RANK NO_QUERY_TRANSFORMATION POINT TRACING NO_XML_QUERY_REWRITE
                    # NOPARALLEL_INDEX LINK REF TIMEZONE_ABBR PIV_SSF TX READS DELAY BFILE PRIVATE MAXLOGMEMBERS
                    # USE_SEMI COST EVALNAME NO_CARTESIAN TABNO TRACE PLAN HINTSET_END CONTAINER ADMIN COLUMN
                    # SYSTEM TZ_OFFSET NLS_LENGTH_SEMANTICS DICTIONARY SCN_ASCENDING FIC_CIV NOOVERRIDE INDICATOR
                    # BINARY_FLOAT_NAN ROWID SESSION_CACHED_CURSORS OBJNO SQL_TRACE BLOB RELATIONAL BIGFILE
                    # AVAILABILITY GUARD GROUP_BY ADVISE MERGE QUOTA CFILE MEMBER THAN SALT DUMP EXTERNALLY
                    # BOTH GUARANTEED EXTENT SECURITY SCALE SYS_DL_CURSOR TYPE DEREF_NO_REWRITE AUTO ESTIMATE
                    # POWER USE_STORED_OUTLINES SID VARRAY LESS VALUE XMLFOREST MAXLOGHISTORY STORE REDUNDANCY
                    # DEQUEUE DBA MATCHED PRESENT CPU_PER_CALL DEFINER UPD_JOININDEX NESTED_TABLE_SET_REFS
                    # EXPAND_GSET_TO_UNION INDEX_SS_ASC EXTRACT ORDERED_PREDICATES ALIAS NO_USE_HASH PRIOR
                    # X_DYN_PRUNE COMPOSITE_LIMIT OBJNO_REUSE REVERSE DISABLE CURRENT_DATE INITIAL MINIMUM
                    # INTERMEDIATE PARTITION_LIST BYTE MOUNT PREBUILT SOURCE MODEL_PBY BITMAP_TREE LOGFILE
                    # ROLES DEGREE INVALIDATE TABLESPACE PASSWORD_VERIFY_FUNCTION COLUMNS CHOOSE SMALLFILE LEVEL
                    # OLD_PUSH_PRED DYNAMIC_SAMPLING_EST_CDN NLS_DATE_LANGUAGE SERVERERROR NESTED_TABLE_FAST_INSERT
                    # STREAMS NL_SJ ELIMINATE_OUTER_JOIN ENTERPRISE DISASSOCIATE GROUPING PACKAGE DATE_MODE CHILD
                    # NO_PRUNE_GSETS REJECT NORESETLOGS NO_CONNECT_BY_COST_BASED CHUNK OID RETENTION MAXTRANS
                    # FBTSCAN NONE PARAMETERS ONLINE OUT_OF_LINE GLOBAL_NAME SPACE HINTSET_BEGIN PASSWORD_GRACE_TIME
                    # NOCACHE FINAL YEAR RBA ERRORS CLASS USE_NL CONNECT_BY_COST_BASED BINARY_DOUBLE DEFINED
                    # EVALUATION PURGE HOUR LENGTH PRECEDING DECREMENT SUBMULTISET INDEX_ROWS SCHEDULER
                    # AUTHENTICATION NUMBER OIDINDEX OPAQUE SAMPLE UPDATABLE ORA_ROWSCN TRUSTED INTERPRETED
                    # MATERIALIZED INDEX_COMBINE OPAQUE_XCANONICAL INLINE_XMLTYPE_NT RETURNING QUERY
                    # OPT_ESTIMATE CLOB NO_EXPAND DETACHED PASSWORD_LOCK_TIME VECTOR_READ DATAFILE REPLACE
                    # NLS_CHARACTERSET NO_ELIMINATE_JOIN BROADCAST CIV_GB HASH QB_NAME AFTER SYSDBA ACCOUNT
                    # SEVERE PRECOMPUTE_SUBQUERY FUNCTION INDEXTYPES FLOB MULTISET NLS_SPECIAL_CHARS SKIP
                    # IGNORE_OPTIM_EMBEDDED_HINTS INDEX_SS NOGUARANTEE LOCALTIMESTAMP DBA_RECYCLEBIN FILE THROUGH
                    # PLSQL_WARNINGS MANAGE DRIVING_SITE FAILED SCAN_INSTANCES COMPLETE HIGH TRANSITIONAL
                    # NO_SEMIJOIN DAY NOPARALLEL XMLATTRIBUTES MOVE NAME NATIONAL REQUIRED SKIP_EXT_OPTIMIZER
                    # NOREPAIR REBUILD JOB SEED POLICY USERS TOPLEVEL BITMAP DATAFILES HASH_AJ INITRANS
                    # BLOCKSIZE FAST MINIMIZE SESSIONTZNAME SESSIONS_PER_USER SYS_OP_BITVEC NO_ELIMINATE_OBY
                    # UBA BODY DATA SUBPARTITION_REL SETS PRIVATE_SGA BINARY_FLOAT ENFORCED TABLE_STATS FLAGGER
                    # TEMP_TABLE ARCHIVE NO_PUSH_SUBQ RECYCLE DATAOBJNO QUEUE_ROWP SQL CHAINED EMPTY
                    # SAVE_AS_INTERVALS BITMAPS OPTIMIZER_FEATURES_ENABLE FUNCTIONS AUTOMATIC SECOND
                    # NO_FILTERING NAMED CATEGORY SUSPEND LIKEC NO_BUFFER PQ_NOMAP NLS_LANG ADVISOR
                    # FRESH NO_CONNECT_BY_FILTERING NOSORT PASSWORD HASHKEYS EXCLUDING INDEX_RRS DISK
                    # BITS CACHE_CB USE STAR CURSOR_SPECIFIC_SEGMENT SB4 DISTRIBUTED HEAP MINEXTENTS DML
                    # ATTRIBUTES NORELY KEYSIZE LEADING XMLCOLATTVAL FREELIST FAILED_LOGIN_ATTEMPTS
                    # SHARED_POOL USE_ANTI BYPASS_RECURSIVE_CHECK ANTIJOIN ABORT INDEX_FILTER ROLLING
                    # ITERATION_NUMBER COALESCE NO_SQL_TUNE CLUSTER PROTECTED PARTITION_HASH ERROR
                    # NO_MULTIMV_REWRITE UB2 THREAD SINGLE SYS_PARALLEL_TXN INDEX_ASC CONTENT PARTITION
                    # DISMOUNT HIERARCHY STRIP NLS_DATE_FORMAT CORRUPTION STORAGE COMMITTED RECYCLEBIN
                    # PARITY CACHE_TEMP_TABLE ENCRYPTION LOCALTIME REWRITE_OR_ERROR DBMS_STATS CHAR_CS
                    # EXCEPTIONS EXPIRE AUDIT LDAP_REG_SYNC_INTERVAL NOMINVALUE LIBRARY COMPILE MAXVALUE
                    # NAN NOSEGMENT NOLOGGING NOROWDEPENDENCIES PATH NOFORCE FINISH FIC_PIV MAX SYSAUX
                    # DIMENSION ORGANIZATION NOSWITCH WRITE MINUS KILL OFFLINE TRANSACTION FACT BECOME
                    # UNBOUND TIV_SSF OLD TEMPFILE EXPLOSION REFRESH MIRROR REF_CASCADE_CURSOR
                    # OPCODE OVERFLOW CURSOR_SHARING_EXACT PUSH_SUBQ CARDINALITY USE_PRIVATE_OUTLINES
                    # LIKE4 TYPES NOTHING TIMEZONE_HOUR UNQUIESCE RESIZE COLLECT INSTANCE SETTINGS EXPORT
                    # DOMAIN_INDEX_NO_SORT MERGE_SJ LIMIT SYS_OP_EXTRACT LIKE2 STANDALONE LAST
                    # CONNECT_BY_FILTERING RESTRICT_ALL_REF_CONS MERGE_CONST_ON UNIFORM SCAN WITHOUT
                    # CPU_PER_SESSION PROGRAM SEG_FILE APPLY PASSWORD_LIFE_TIME DML_UPDATE ALLOW
                    # SKIP_UNQ_UNUSABLE_IDX NO_MERGE CLOSE_CACHED_OPEN_CURSORS NESTED_TABLE_GET_REFS
                    # SPECIFICATION CONSISTENT USE_CONCAT SYS_OP_NTCIMG$ PQ_MAP SHUTDOWN DEFERRABLE
                    # FOLLOWING NOTIFICATION SPLIT UNPROTECTED TIME_ZONE SHRINK INDEX_SKIP_SCAN LOGICAL
                    # MODEL_MIN_ANALYSIS XMLROOT SD_SHOW CREATE_STORED_OUTLINES RAPIDLY USE_MERGE QUEUE_CURR
                    # STRICT MV_MERGE NO_ORDER_ROLLUPS TREAT UNLIMITED TUNING CHANGE PCTUSED MOVEMENT
                    # NO_REWRITE ANCILLARY CLUSTERING_FACTOR BLOCK_RANGE SEQUENTIAL GLOBALLY XMLTYPE INTERVAL
                    # SEQUENCED SWITCHOVER AT NOMAXVALUE SYS_FBT_INSDEL VERSION KERBEROS TIMEZONE_OFFSET
                    # INDEX_SS_DESC RECOVERY NLS_TERRITORY SIZE FAILGROUP ELEMENT INSTANCES DIRECTORY
                    # IDGENERATORS PRESERVE_OID NO_PARALLEL SUBPARTITIONS EXEMPT INDEX_JOIN BEGIN_OUTLINE_DATA
                    # NETWORK LOCAL UNUSED NOAUDIT PHYSICAL WRAPPED FREEPOOLS PCTINCREASE FILTER
                    # GATHER_PLAN_STATISTICS SYSOPER SD_INHIBIT SEGMENT DISABLE_RPKE NLS_SORT PATHS QUEUE
                    # ENTRY LDAP_REGISTRATION_ENABLED DISKS OBJECT INCREMENTAL REGEXP_LIKE OVERFLOW_NOMOVE
                    # SUBQUERIES NO_PARALLEL_INDEX XID INITIALIZED STATISTICS ENCRYPT AUTOALLOCATE TEMPLATE
                    # LDAP_REGISTRATION NO_UNNEST NO_PARTIAL_COMMIT ORDINALITY NLS_COMP NOCOMPRESS RULES
                    # IMMEDIATE MAIN REFERENCING ENQUEUE SEG_BLOCK UNRECOVERABLE NO_MONITORING NO_ACCESS
                    # RESOLVER TIMEZONE_MINUTE NO_ELIMINATE_OUTER_JOIN NO_INDEX UNNEST GUARANTEE BEHALF
                    # ALWAYS TEST PERMANENT REGISTER CONFORMING SYNONYM SKIP_UNUSABLE_INDEXES USE_HASH
                    # OPERATOR NO_PULL_PRED USE_TTT_FOR_GSETS SERIALIZABLE MIGRATE ITERATE PLSQL_CCFLAGS
                    # IGNORE_WHERE_CLAUSE CPU_COSTING TRAILING LOCAL_INDEXES OVERLAPS EXTENDS NOAPPEND
                    # METHOD REWRITE UNPACKED COLUMN_VALUE DATABASE EXCHANGE NO_TEMP_TABLE UPSERT YES
                    # REBALANCE CONTEXT SPFILE NESTED TRACKING RESOLVE PFILE MAXDATAFILES GLOBAL
                    # AUTHENTICATED NESTED_TABLE_ID INDEXES XMLNAMESPACES NO_REF_CASCADE SYSDATE OR_EXPAND
                    # ASSOCIATE MODEL_COMPILE_SUBQUERY INITIALLY PARTIALLY XMLSCHEMA MINVALUE PIV_GB HEADER
                    # RESTORE_AS_INTERVALS MANAGED BLOCK SINGLETASK DETERMINES PCTVERSION EXPLAIN AND_EQUAL
                    # CLONE NO_USE_HASH_AGGREGATION BUFFER_CACHE XMLTABLE EXTERNAL NEVER IDENTIFIER PULL_PRED
                    # INDEXED LOGICAL_READS_PER_CALL STARTUP FREELISTS UPD_INDEXES MATERIALIZE LOGON SCHEMA
                    # NO_INDEX_SS NO_BASETABLE_MULTIMV_REWRITE IN_MEMORY_METADATA STRUCTURE MAXEXTENTS
                    # RECOVERABLE REFERENCED NO_SET_TO_JOIN STAR_TRANSFORMATION CONNECT_BY_ISCYCLE ROWNUM
                    # SNAPSHOT EXCLUSIVE CURRENT_TIME KEEP PASSWORD_REUSE_MAX WHENEVER INTERNAL_USE PX_JOIN_FILTER
                    # PQ_DISTRIBUTE INLINE HWM_BROKERED FIRST_ROWS MODEL_NO_ANALYSIS NO_PUSH_PRED MODEL_PUSH_REF
                    # COMPRESS NOREVERSE NO_INDEX_FFS GENERATED NATIVE LIKE_EXPAND RELY PACKAGES READ IGNORE
                    # SQLLDR DISKGROUP FLUSH BYPASS_UJVC RESETLOGS SYS_OP_NOEXPAND PROTECTION BEFORE
                    # INSTANTIABLE XMLELEMENT SUBPARTITION XMLPARSE FALSE ADMINISTER SELECTIVITY PCTTHRESHOLD
                    # NEXT ERROR_ON_OVERLAP_TIME REKEY QUIESCE PX_GRANULE LOGOFF SCOPE BINDING NLS_CURRENCY
                    # THE XMLPI PASSWORD_REUSE_TIME XMLQUERY PARTITIONS NO_QKN_BUFF MODEL_DYNAMIC_SUBQUERY
                    # LOCATOR NLS_NCHAR_CONV_EXCP NO_STAR_TRANSFORMATION NOREWRITE TABLESPACE_NO ADMINISTRATOR
                    # SEMIJOIN_DRIVER INDEX_FFS REDUCED KEYS LOCKED BUFFER VALIDATION FLASHBACK END_OUTLINE_DATA
                    # TO_CHAR MASTER SYS_RID_ORDER PUBLIC MINUS_NULL NVARCHAR2 BOUND RBO_OUTLINE ACTIVATE VARCHAR2
                    # MAXSIZE DECRYPT UID MLSLABEL UNTIL AUTOEXTEND ELIMINATE_JOIN RANDOM SEQUENCE NAV CONTENTS
                    # USAGE ONLY REUSE MANUAL DOCUMENT CONNECT_BY_ISLEAF CONSIDER PROJECT ENFORCE REMOTE_MAPPED
                    # LIST MAXARCHLOGS ROW_LENGTH NULLS SHARED WELLFORMED INCLUDING APPEND FORCE_XML_QUERY_REWRITE
                    # ISOLATION_LEVEL ACCESSED NLS_ISO_CURRENCY SUCCESSFUL CURRENT_SCHEMA ROWS DANGLING TRUE ZONE
                    # NLS_NUMERIC_CHARACTERS DEBUG UPDATED RESTRICTED NO_EXPAND_GSET_TO_UNION STATEMENT_ID
                    # NOCPU_COSTING AUTHORIZATION NO_USE_MERGE OPAQUE_TRANSFORM ARRAY MEASURES MODEL
                    # CONNECT_TIME OPTIMIZER_GOAL SUPPLEMENTAL PCTFREE ANALYZE RECOVER DB_ROLE_CHANGE
                    # BLOCKS MAXINSTANCES DDL NOVALIDATE PRESERVE OPT_PARAM CLEAR COARSE IDLE_TIME WALLET
                    # SCALE_ROWS ARCHIVELOG CERTIFICATE NORMAL NO_MODEL_PUSH_REF TABLES UPGRADE INFINITE
                    # NOARCHIVELOG CONTROLFILE IDENTITY PERFORMANCE INSTANTLY MAPPING ENABLE
                    # LOGICAL_READS_PER_SESSION USE_HASH_AGGREGATION DEFERRED REPAIR NO_SWAP_JOIN_INPUTS
                    # GLOBAL_TOPIC_ENABLED ELIMINATE_OBY SUBSTITUTABLE STANDBY NLS_CALENDAR LAYER BATCH KEY_LENGTH
                    # INCREMENT BUILD ORDERED MONTH NCLOB EXPR_CORR_CHECK MEMORY UROWID EVENTS ALL_ROWS
                    # SYS_OP_ENFORCE_NOT_NULL$ SD_ALL COMPUTE USE_WEAK_NAME_RESL NOMINIMIZE SPREADSHEET
                    # NL_AJ BUFFER_POOL MERGE_AJ SIBLINGS CONSTRAINTS USER_DEFINED LOG IMPORT NESTED_TABLE_SET_SETID
                    # LEVELS PERCENT PUSH_PRED REFERENCE RESUME NO_CPU_COSTING SIMPLE DISCONNECT WHITESPACE
                    # UNLOCK NOMAPPING AUTHID ALLOCATE NCHAR_CS USER_RECYCLEBIN DOMAIN_INDEX_SORT QUERY_BLOCK
                    # CYCLE HASH_SJ UNDROP LOGGING OWN PASSING MIN SWITCH SORT BINARY_DOUBLE_NAN NODELAY
                    # PLSQL_OPTIMIZE_LEVEL PARTITION_RANGE TIMEZONE_REGION CACHE_INSTANCES SUMMARY
                    # INDEX_STATS DISTINGUISHED INTERNAL_CONVERT NO_USE_NL DBTIMEZONE SYS_OP_CAST DOWNGRADE
                    # RESET INDEX_DESC NOCYCLE POST_TRANSACTION PLSQL_CODE_TYPE E PARENT MAXLOGFILES
                    # NO_FACT UNUSABLE XMLSERIALIZE JAVA NCHAR DEREF OUTLINE SET_TO_JOIN NEEDED VERSIONS
                    # INDEX_SCAN EXTENTS SESSIONTIMEZONE PLSQL_DEBUG MONITORING BINARY_DOUBLE_INFINITY STATIC
                    # RESUMABLE RANGE MANAGEMENT COMPATIBILITY ATTRIBUTE MAXIMIZE UNDER PARALLEL TIV_GB COMPACT
                    # OPTIMAL CUBE_GB INCLUDE_VERSION PARALLEL_INDEX FINE SYSTIMESTAMP INDEXTYPE OUTLINE_LEAF
                    # CONNECT_BY_ROOT VECTOR_READ_TRACE NLS_LANGUAGE STRING BINARY_FLOAT_INFINITY UNARCHIVED
                    # PROFILE SCN ID MINUTE MODEL_DONTVERIFY_UNIQUENESS ACCESS

                    if ($1 && $1 =~ /^$ReservedWord$/i) {
                        print "ERROR: -------------------------------------------------------------------------------\n";
                        print "ERROR:\n";
                        print "ERROR: You use a reserved SQL-Word!\n";
                        print "ERROR: $ReservedWord is not allowed to use!\n";
                        print "ERROR: You can use the following domains for your own checking\n";
                        print "ERROR: http://www.petefreitag.com/tools/sql_reserved_words_checker/\n";
                        print "ERROR: and http://www.ianywhere.com/developer/product_manuals/sqlanywhere/0901/de/html/dbrfde9/00000010.htm\n";
                        print "ERROR:\n";
                        print "ERROR: -------------------------------------------------------------------------------\n";
                        $Ok = 0;
                    }
                }
#                for my $ReservedWord (qw(ID CATEGORY NAME CONTENT VERSION QUEUE BODY TIMEOUT REFERENCE NOTIFICATION PROJECT TRUSTED)) {
#                   if ($1 && $1 =~ /^$ReservedWord$/i) {
#                        print "WARNING: -------------------------------------------------------------------------------\n";
#                        print "WARNING:\n";
#                        print "WARNING: You use a reserved Oracle-SQL-Word!\n";
#                        print "WARNING: $ReservedWord is maybe not allowed to use!\n";
#                        print "WARNING: You can use the following domains for your own checking\n";
#                        print "WARNING: http://www.petefreitag.com/tools/sql_reserved_words_checker/\n";
#                        print "WARNING: and http://www.ianywhere.com/developer/product_manuals/sqlanywhere/0901/de/html/dbrfde9/00000010.htm\n";
#                        print "WARNING:\n";
#                        print "WARNING: -------------------------------------------------------------------------------\n";
#                        $Ok = 1;
#                    }
#                }
            }
            if ($Line =~ /<\/Table/) {
                $TableCreate = 0;
            }
        }
    }
    close $In;

    if ( !$Ok && $File !~
        m{WebWatcher|Vulnerability|Artefact|WPTicketMoveOldCustomerUser|WPTicketBankStamm}smx
    ) {
        return;
    }

    print "NOTICE: _SQLReservedWordsCheck() ok\n";
    return 1;
}

sub _EmptyFileCheck {
    my %FileData = @_;

    if ( length $FileData{ContentString} < 6) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: You try to commit an empty file!\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }

    return 1;
}

sub _PerlLocateFunctionsWithoutPerldoc {
    my %FileData = @_;

    # don't check these files
    return 1 if $FileData{Name} =~ m{\.dtl}smx;
    return 1 if $FileData{Name} =~ m{\.pl}smx;
    return 1 if $FileData{Name} =~ m{Article\.pm}smx;
    # or ?? return 1 if $FileData{Name} !~ m{\.pm}smx;

    # don't check these directories
    return 1 if $FileData{Directory} =~ m{Modules}smx;
    return 1 if $FileData{Directory} =~ m{Language}smx;
    return 1 if $FileData{Directory} =~ m{sample}smx;
    return 1 if $FileData{Directory} =~ m{System\/Auth}smx;
    return 1 if $FileData{Directory} =~ m{System\/Cache}smx;
    return 1 if $FileData{Directory} =~ m{System\/Crypt}smx;
    return 1 if $FileData{Directory} =~ m{System\/CustomerAuth}smx;
    return 1 if $FileData{Directory} =~ m{System\/CustomerUser}smx;
    return 1 if $FileData{Directory} =~ m{System\/DB}smx;
    return 1 if $FileData{Directory} =~ m{System\/Email}smx;
    return 1 if $FileData{Directory} =~ m{System\/GenericAgent}smx;
    return 1 if $FileData{Directory} =~ m{System\/LinkObject}smx;
    return 1 if $FileData{Directory} =~ m{System\/Log}smx;
    return 1 if $FileData{Directory} =~ m{System\/MailAccount}smx;
    return 1 if $FileData{Directory} =~ m{System\/Postmaster\/Filter}smx;
    return 1 if $FileData{Directory} =~ m{System\/Queue}smx;
    return 1 if $FileData{Directory} =~ m{System\/Service}smx;
    return 1 if $FileData{Directory} =~ m{System\/SLA}smx;
    return 1 if $FileData{Directory} =~ m{System\/Stats}smx;
    return 1 if $FileData{Directory} =~ m{System\/Ticket\/Acl}smx;
    return 1 if $FileData{Directory} =~ m{System\/Ticket\/ArticleSearchIndex}smx;
    return 1 if $FileData{Directory} =~ m{System\/Ticket\/CustomerPermission}smx;
    return 1 if $FileData{Directory} =~ m{System\/Ticket\/Event}smx;
    return 1 if $FileData{Directory} =~ m{System\/Ticket\/IndexAccelerator}smx;
    return 1 if $FileData{Directory} =~ m{System\/Ticket\/Number}smx;
    return 1 if $FileData{Directory} =~ m{System\/Ticket\/Permission}smx;
    return 1 if $FileData{Directory} =~ m{System\/User\/Preferences}smx;
    return 1 if $FileData{Directory} =~ m{System\/Web\/UploadCache}smx;

    my $Item = 0;
    my $Counter = 0;
    my $Error = '';
    my $Warning = '';

    for my $Line (@{$FileData{ContentArrayRef}}) {
        $Counter++;
        if ($Line =~ m{^=item}smx) {
            if ($Line !~ /TicketCreateNumber/) {
                $Item++;
            }
        }
        if ($Item > 1) {
            $Error .= "ERROR: Line $Counter $Line\n";
        }
        if ($Line =~ /^sub [^_]/) {
            if (!$Item) {
                if ($Line !~ /sub DESTROY/) {
                    $Warning .= "WARNING: Line $Counter $Line\n";
                }
            }
            $Item = 0;
        }
        elsif ($Line =~ /sub _/) {
            $Item = 0;
        }
    }

    if (!$Error && !$Warning) {
        print "NOTICE: _PerlLocateFunctionsWithoutPerldoc() ok\n";
    }
    elsif ($Warning) {
        print "WARNING: -------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: There is a sub without perldoc!\n";
        print $Warning;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------\n";
    }
#    elsif ($Error) {
#        print "ERROR: -------------------------------------------------\n";
#        print "ERROR:\n";
#        print "ERROR: There are more perldoc items then subs!\n";
#        print $Error;
#        print "ERROR: -------------------------------------------------\n";
#        return;
#    }
    return 1;
}

sub _LineLengthCheck {
    my %FileData = @_;

    # don't check these files
    return 1 if $FileData{Name} =~ m{css.dtl}smx;
    return 1 if $FileData{Name} =~ m{\.sql}smx;
    return 1 if $FileData{Name} =~ m{\.sopml}smx;
    return 1 if $FileData{Name} =~ m{\.spec}smx;

    # don't check these directories
    return 1 if $FileData{Directory} =~ m{sample};
    return 1 if $FileData{Directory} =~ m{Language};

    my $Ok = 1;
    my $Text = '';
    my $Counter = 0;

    LINE:
    for my $Line (@{$FileData{ContentArrayRef}}) {
        $Counter++;
        next LINE if length $Line < 160;

        if ($FileData{Name} =~ /.dtl$/) {
            if ($Line =~ /<dtl if/) {
                # no comment
            }
            elsif ($Line =~ /<a href/) {
                # do nothing because of format problems
                #if ($Line !~ /^[ ]*[^<>]*<a .*href[^<>]+?>.*?(<img[^<>]+?>|).*?(|<\/a>)[^<>]*$/ ) {
                #    $Text .= "WARNING: Line $Counter - set <a href ... > alone in one line\n";
                #    $Ok = 0;
                #}
            }
            elsif ($Line =~ /<input/) {
                if ($Line !~ / *<input[^<>]+?> *$/) {
                    $Text .= "WARNING: Line $Counter - set <input ... > alone in one line\n";
                    $Ok = 0;
                }
            }
            elsif ($Line !~ / *[<]?[^<>]+[>]?\$Text{".+?"}[<]?[^<>]+[>]? *$/ ) {
                $Text .= "WARNING: Line $Counter\n";
                $Ok = 0;
            }
        }
        elsif ($FileData{Name} =~ /.(sopm|xml)$/) {
            if ($Line !~ /^ *<[^<>]+?>[^<>]*<\/[^<>]+?> *$/) {
                $Text .= "WARNING: Line $Counter\n";
                $Ok = 0;
            }
        }
        elsif ($FileData{Name} =~ /.t$/) {
            if ($FileData{Name} !~ /Ticket/ && ($Counter < 270 || $Counter > 2848)) {
                $Text .= "WARNING: Line $Counter\n";
                $Ok = 0;
            }
        }
        else {
            $Text =~ s/WARNING: Line (.*?)\n/$1/;
            $Text = "WARNING: Line $Text, $Counter\n";
            $Ok = 0;
        }
    }

    if ($Ok) {
        print "NOTICE: _LineLengthCheck() ok\n";
    }
    else {
        print "WARNING: _LineLengthCheck() code length bigger than 160 tokens!\n";
        print "WARNING: It is much better to use max 80-120 tokens!\n";
        print $Text;
    }
    return 1;
}

sub _DTLMisshapenCode {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        for my $Tag (qw(tr table td a div pre b form font select)) {
            if ($Line =~ /^[^#].*\S+.*<\/$Tag>/ && $Line !~ /.*<$Tag.*<\/$Tag>/  ) {
                if ($Line !~ /<dtl if/) {
                    $Ok .= "ERROR: Line $Counter $Line";
                }
            }
        }

    }
    close $In;
    if (!$Ok) {
        print "NOTICE: _DTLMisshapenCode() ok\n";
        return 1;
    }

    print "ERROR: _DTLMisshapenCode() misshapen code can be a reason for a lot of errors!\n";
    print "ERROR: Try contructions like!\n";
    print "ERROR: <table>\n";
    print "ERROR:   <tr>\n";
    print "ERROR:     <td>\n";
    print "ERROR:       Text\n";
    print "ERROR:     </td>\n";
    print "ERROR:   </tr>\n";
    print "ERROR: </table>\n";
    print $Ok;
    return;
}

sub _DTLSelectCheck {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;

    if ($File =~ /(Installer|AdminSystemAddressForm|AdminPOP3|AdminPostMasterFilter|AdminMailAccount).dtl$/) {
        print "NOTICE: _DTLSelectCheck() <select>-tags are not allowed, but this file can have <select>-tags because of it history.\n";
        return 1;
    }

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        # look for forbidden selects that are not one-line, empty selects
        if ($Line =~ /<select/ && $Line !~ /<option/ && $Line !~ /<[\/]select/ ) {
            $Ok .= "ERROR: Line $Counter $Line";
        }
    }
    close $In;
    if (!$Ok) {
        print "NOTICE: _DTLSelectCheck() ok\n";
        return 1;
    }

    print "ERROR: -------------------------------------------------\n";
    print "ERROR:\n";
    print "ERROR: _DTLSelectCheck() use instead of select tags in dtl\n";
    print "ERROR: the BuildSelection - function of the LayoutObject!\n";
    print $Ok;
    print "ERROR:\n";
    print "ERROR: -------------------------------------------------\n";

    return;

}

sub _XMLConfigXMLCheck {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;
    my $CVS = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Counter == 1) {
            if ($Line =~ /^<\?xml.+\?>/ && $Line =~ /version="1.0"/ && $Line =~ /encoding="(?:iso-8859-1|utf-8)"/) {
            }
            else {
                $Ok .= "ERROR: -------------------------------------------------\n";
                $Ok .= "ERROR:\n";
                $Ok .= "ERROR: _XMLConfigXMLCheck() the first line of the file should\n";
                $Ok .= "ERROR: have the content\n";
                $Ok .= "ERROR: <?xml version=\"1.0\" encoding=\"iso-8859-1\" ?>\n";
                $Ok .= "ERROR:\n";
                $Ok .= "ERROR: -------------------------------------------------\n";
            }
        }
        if ($Line =~ /^<otrs_config/) {
            if ($Line =~ /init="(Framework|Application|Config|Changes)"/ && $Line =~ /version="1.0"/) {
            }
            else {
                $Ok .= "ERROR: -------------------------------------------------\n";
                $Ok .= "ERROR:\n";
                $Ok .= "ERROR: _XMLConfigXMLCheck() the <otrs_config>-tag has missing\n";
                $Ok .= "ERROR: or incorrect attributes!!!\n";
                $Ok .= "ERROR: ExampleLine: <otrs_config version=\"1.0\" init=\"Application\">\n";
                $Ok .= "ERROR: YourLine:    $Line";
                $Ok .= "ERROR:\n";
                $Ok .= "ERROR: -------------------------------------------------\n";
            }
        }
        if ( $Line =~ m{ <CVS> \$Id (:.+)? \$ </CVS>}x ) {
            $CVS = 1;
        }
    }
    close $In;
    if (!$CVS) {
        $Ok .= "ERROR: -------------------------------------------------\n";
        $Ok .= "ERROR:\n";
        $Ok .= "ERROR: _XMLConfigXMLCheck() you have no <CVS>-tag or \n";
        $Ok .= "ERROR: an incorrect <CVS>-tag!\n";
        $Ok .= "ERROR: Please use a valid xml as example!\n";
        $Ok .= "ERROR:\n";
        $Ok .= "ERROR: -------------------------------------------------\n";
    }
    if ($Ok) {
        print $Ok;
        return;
    }

    print "NOTICE: _XMLConfigXMLCheck() ok\n";
    return 1;
}

sub _OPMFileRightCheck {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    LINE:
    while (my $Line = <$In>) {
        $Counter++;
        next LINE if $Line !~ /<File.*><\/File>/;
        if ($Line =~ /<File.*Location=".+\.(.+?)".*><\/File>/) {
            if ($1 && $1 =~ /^(pl|sh|fpl)$/) {
                if ($Line !~ /Permission="[750]{3}"/) {
                    $Ok .= "ERROR: Line $Counter $Line";
                }
            }

            else {
                if ($Line !~ /Permission="[640]{3}"/) {
                    $Ok .= "ERROR: Line $Counter $Line";
                }
            }
        }
    }
    close $In;
    if (!$Ok) {
        print "NOTICE: _OPMFileRightCheck() ok\n";
        return 1;
    }

    print "ERROR: -------------------------------------------------\n";
    print "ERROR:\n";
    print "ERROR: _OPMFileRightCheck() a <File>-Tag has the wrong permissions!\n";
    print "ERROR: .pl and .sh files normally needs 755 rights. The others 644!\n";
    print $Ok;
    print "ERROR:\n";
    print "ERROR: -------------------------------------------------\n";

    return;
}

sub _DTLColsCheck {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /<table.*cols=/) {
            $Ok .= "ERROR: Line $Counter $Line";
        }

    }
    close $In;
    if (!$Ok) {
        print "NOTICE: _DTLColsCheck() ok\n";
    }
    else {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: _DTLColsCheck() there is no attribute \"COLS\" in a <table>-tag!\n";
        print $Ok;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";

        return;
    }
    return 1;
}

# finds a HTML error with apostrophes. (spread because of copy and paste of AgentTicketZoom)
sub _DTLApostropheCheck {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /'onmouse/) {
            $Ok .= "ERROR: Line $Counter $Line";
        }
        elsif ($Line =~ /="[^"]*?""/ && $Line !~ /dtl/) {
            $Ok .= "ERROR: Line $Counter $Line";
        }
    }
    close $In;
    if (!$Ok) {
        print "NOTICE: _DTLApostropheCheck() ok\n";
    }
    else {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: _DTLApostropheCheck() there is a spelling mistake (e.g. 'onmouse or class=\"Content\"\"!\n";
        print $Ok;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";

        return;
    }
    return 1;
}

sub _DTLValignCheck {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /valign="(.+?)"/) {
            my $Attribute = $1;
            if ($Attribute !~ /(top|middle|bottom|baseline)/i) {
                $Ok .= "ERROR: Line $Counter $Line";
            }
        }
    }
    close $In;
    if (!$Ok) {
        print "NOTICE: _DTLValignCheck() ok\n";
    }
    else {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: _DTLValignCheck() value of attribute \"VALIGN\" must be one of \"TOP\", \"MIDDLE\", \"BOTTOM\", \"BASELINE\"!\n";
        print $Ok;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";

        return;
    }
    return 1;
}

sub _SQLCurrentTimeStampCheck {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /current_timestamp/) {
            #$Ok .= "ERROR: Line $Counter $Line";
            $Ok .= "WARNING: Line $Counter $Line";
        }
    }
    close $In;
    if (!$Ok) {
        print "NOTICE: _SQLCurrentTimeStampCheck() ok\n";
    }
    else {
        #print "ERROR: -------------------------------------------------\n";
        #print "ERROR:\n";
        #print "ERROR: _SQLCurrentTimeStampCheck() a SQL-Statements with the element current_timestamp is used!\n";
        #print $Ok;
        #print "ERROR:\n";
        #print "ERROR: -------------------------------------------------\n";
        #return;

        #print "WARNING: -------------------------------------------------\n";
        #print "WARNING:\n";
        #print "WARNING: _SQLCurrentTimeStampCheck() a SQL-Statements with the element current_timestamp is used!\n";
        #print "WARNING: current_timestamp are critcal if otrs and the db runs in different time zones!\n";
        #print $Ok;
        #print "WARNING:\n";
        #print "WARNING: -------------------------------------------------\n";

        print "NOTICE: _SQLCurrentTimeStampCheck() currenttimestamp found, but we have at the moment no solution for this problem\n";
    }
    return 1;
}

sub _OPMNameCheck {
    my $File = shift;
    my $Directory = shift;
    $Directory =~ /\/([^\/]+)[\/]?$/;
    my $DirectoryName = $1;
    $File =~ /\/([^\/]+?).sopm$/;
    my $FileName = $1;
    my $Counter = 0;
    my $OK = 1;

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /<Name>([^<>]+)<\/Name>/) {
            if ($1 ne $FileName) {
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: _OPMNameCheck() - the module Name ($1)\n";
                print "ERROR: isn't equal to the name of the sopm-file ($FileName)!\n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
                $OK = 0;
            }
        }
    }
    close $In;

    if ($DirectoryName ne $FileName) {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: _OPMNameCheck() - the module repository ($DirectoryName)\n";
        print "ERROR: isn't equal to the name of the sopm-file ($FileName)!\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        $OK = 0;
    }

    if ($OK) {
        print "NOTICE: _OPMNameCheck() ok\n";
        return 1;
    }
    return;
}

sub _OPMRequiredElementsCheck {
    my $File = shift;
    my $Directory = shift;
    my $OK = 1;
    my $Name = 0;
    my $Version = 0;
    my $Text = '';
    my $Counter = 0;
    my $CVS = 0;
    my $Framework = 0;
    my $Vendor = 0;
    my $URL = 0;
    my $License = 0;
    my $BuildDate = 0;
    my $BuildHost = 0;
    my $DescriptionDE = 0;
    my $DescriptionEN = 0;
    my $Table = 0;
    my $DatabaseUpgrade = 0;
    my $NameLength = 0;
    my $ExternalCompany = 0;

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        if ($Line =~ m{c\.a\.p\.e\. \s IT \s GmbH}xms) {
            $ExternalCompany = 1;
        }
        $Counter++;
        if ($Line =~ /<Name>[^<>]+<\/Name>/) {
            $Name = 1;
        }
        elsif ($Line =~ /<Description Lang="en">[^<>]+<\/Description>/) {
            $DescriptionEN = 1;
        }
        elsif ($Line =~ /<Description Lang="de">[^<>]+<\/Description>/) {
            $DescriptionDE = 1;
        }
        elsif ($Line =~ /<License>([^<>]+)<\/License>/) {
            if (   $1 !~ m{GNU \s GENERAL \s PUBLIC \s LICENSE \s Version \s 2, \s June \s 1991}smx
                && $1 !~ m{GNU \s AFFERO \s GENERAL \s PUBLIC \s LICENSE \s Version \s 3, \s November \s 2007}smx
            ) {
                print "WARNING: -------------------------------------------------\n";
                print "WARNING:\n";
                print "WARNING: _OPMRequiredElementsCheck()\n";
                print "WARNING: The License will be set by the opm-builder, you only have to insert 'GNU GENERAL PUBLIC LICENSE Version 2, June 1991'\n";
                print "WARNING:\n";
                print "WARNING: -------------------------------------------------\n";
            }
            $License = 1;
        }
        elsif ($Line =~ /<URL>([^<>]+)<\/URL>/  && !$ExternalCompany) {
            if ($1 !~ /http:\/\/otrs\.(org|com)\//) {
                print "WARNING: -------------------------------------------------\n";
                print "WARNING:\n";
                print "WARNING: _OPMRequiredElementsCheck()\n";
                print "WARNING: The URL will be set by the opm-builder, you only have to insert 'http://otrs.org/' or 'http://otrs.com/'\n";
                print "WARNING:\n";
                print "WARNING: -------------------------------------------------\n";
            }
            $URL = 1;
        }
        elsif ($Line =~ /<BuildHost>[^<>]*<\/BuildHost>/) {
            $BuildHost = 1;
        }
        elsif ($Line =~ /<BuildDate>[^<>]*<\/BuildDate>/) {
            $BuildDate = 1;
        }
        elsif ($Line =~ /<Vendor>([^<>]+)<\/Vendor>/ && !$ExternalCompany) {
            if ($1 !~ /OTRS (AG|Inc\.|BV)/) {
                # Because of a disscussion with martin 22.01.08 I will replace
                # the vendor automatically when I have the code architecture for this
                $Text .= "WARNING: The vendor should be the 'OTRS AG' or 'OTRS Inc.'\n";
            }
            $Vendor = 1;
        }
        elsif ($Line =~ /<Framework>([^<>]+)<\/Framework>/) {
            $Framework = 1;
        }
        # This functions exits two times - very uncool!
        elsif ($Line =~ /<CVS>\$Id:[^<>]+<\/CVS>/) {
            $CVS = 1;
        }
        elsif ($Line =~ /<Version>([^<>]+)<\/Version>/) {
            if ($1 !~ /0\.0\.0/) {
                print "WARNING: -------------------------------------------------\n";
                print "WARNING:\n";
                print "WARNING: _OPMRequiredElementsCheck()\n";
                print "WARNING: You don't use <Version>0.0.0</Version>. Do you not want to use the OPMS-module to build the package?\n";
                print "WARNING: You use $1\n";
                print "WARNING:\n";
                print "WARNING: -------------------------------------------------\n";
            }

            $Version = 1;
        }
        elsif ($Line =~ /<File([^<>]+)>([^<>]*)<\/File>/) {
            my $Attributes = $1;
            my $Content = $2;
            if ($Content ne '') {
                $Text .= "ERROR: Don't insert something between <File><\/File>!\n";
                $OK = 0;
            }
            if ($Attributes =~ /(Type|Encode)=/) {
                $Text .= "ERROR: Don't use the attribute 'Type' or 'Encode' in <File>Tags!\n";
                $OK = 0;
            }
            if ($Attributes =~ /Location=.+?\.sopm/) {
                $Text .= "ERROR: It is senseless to include .sopm-files in a opm! -> $Line";
                $OK = 0;
            }
            if ($Attributes =~ /Location=.+?\.sql/) {
                print "WARNING: -------------------------------------------------\n";
                print "WARNING:\n";
                print "WARNING: _OPMRequiredElementsCheck()\n";
                print "WARNING: In most of the cases it is useless to include .sql-files because\n";
                print "WARNING: the use of the <DatabaseInstall>-Element makes more sense!\n";
                print "WARNING:\n";
                print "WARNING: -------------------------------------------------\n";
            }
        }
        elsif ($Line =~ /(<Table .+?>|<\/Table>)/) {
            $Table = 1;
        }
        elsif ($Line =~ /<DatabaseUpgrade>/) {
            $DatabaseUpgrade = 1;
        }
        elsif ($Line =~ /<\/DatabaseUpgrade>/) {
            $DatabaseUpgrade = 0;
        }
        elsif ($Line =~ /<Table.+?>/) {
            if ($DatabaseUpgrade && $Line =~ /<Table/ && $Line !~ /Version=/) {
                print "ERROR: -------------------------------------------------\n";
                print "ERROR:\n";
                print "ERROR: _OPMRequiredElementsCheck()\n";
                print "ERROR: If you use <Table... in a <DatabaseUpgrade> context you need\n";
                print "ERROR: to have a Version attribute with the beginning version where\n";
                print "ERROR: this change is needed (e. g. <TableAlter Name=\"some_table\" Version=\"1.0.6\">)!\n";
                print "ERROR:\n";
                print "ERROR: -------------------------------------------------\n";
                $OK = 0;
            }
        }

        if ($Line =~ /<(Column.*|TableCreate.*) Name="(.+?)"/) {
            $Name = $2;
            if (length $Name > 30) {
                $NameLength .= "ERROR: Line $Counter: $Name\n";
            }
            elsif (length $Name > 24) {
                print "WARNING: -------------------------------------------------\n";
                print "WARNING:\n";
                print "WARNING: _OPMRequiredElementsCheck()\n";
                print "WARNING: Please use Column and Tablenames with less than 24 letters!\n";
                print "WARNING: Line $Counter: $Name\n";
                print "WARNING:\n";
                print "WARNING: -------------------------------------------------\n";
            }
        }
    }
    close $In;

    if ($Table) {
        $Text .= "ERROR: The Element <Table> is not allowed in sopm-files. Perhaps you mean <TableCreate>!\n";
        $OK = 0;
    }
    if ($BuildDate) {
        $Text .= "ERROR: <BuildDate> no longer used in .sopms!\n";
        $OK = 0;
    }
    if ($BuildHost) {
        $Text .= "ERROR: <BuildHost> no longer used in .sopms!\n";
        $OK = 0;
    }
    if (!$DescriptionDE) {
        $Text .= "ERROR: You have forgot to use the element <Description Lang=\"de\">!\n";
        $OK = 0;
    }
    if (!$DescriptionEN) {
        $Text .= "ERROR: You have forgot to use the element <Description Lang=\"en\">!\n";
        $OK = 0;
    }
    if (!$Name) {
        $Text .= "ERROR: You have forgot to use the element <Name>!\n";
        $OK = 0;
    }
    if (!$Version) {
        $Text .= "ERROR: You have forgot to use the element <Version>!\n";
        $OK = 0;
    }
    if (!$CVS) {
        $Text .= "ERROR: You have forgot to use the element <CVS>!\n";
        $Text .= "ERROR: Please use a valid xml as example!\n";
        $OK = 0;
    }
    if (!$Framework) {
        $Text .= "ERROR: You have forgot to use the element <Framework>!\n";
        $OK = 0;
    }
    if (!$ExternalCompany) {
        if (!$Vendor) {
            $Text .= "ERROR: You have forgot to use the element <Vendor>!\n";
            $OK = 0;
        }
        if (!$URL) {
            $Text .= "ERROR: You have forgot to use the element <URL>!\n";
            $OK = 0;
        }
    }
    if (!$License) {
        $Text .= "ERROR: You have forgot to use the element <License>!\n";
        $OK = 0;
    }
    if ($NameLength) {
        $Text .= "ERROR: Please use Column and Tablenames with less than 24 letters!\n";
        $Text .= $NameLength;
        $OK = 0;
    }
    if ($OK) {
        print "NOTICE: _OPMRequiredElementsCheck() ok\n";
        return 1;
    }
    else {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: _OPMRequiredElementsCheck()\n";
        print $Text;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";
        return;
    }
}

sub _PerlTicketHookCheck {
    my $File = shift;
    my $OK = '';
    my $Counter = 0;

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /Get\('TicketHook'\);/) {
            $OK .= "ERROR: Line $Counter\n";
        }
    }
    close $In;

    if (!$OK) {
        print "NOTICE: _PerlTicketHookCheck() ok\n";
        return 1;
    }
    print "ERROR: -------------------------------------------------\n";
    print "ERROR:\n";
    print "ERROR: _PerlTicketHookCheck() - the config option 'TicketHook' exits no longer!'\n";
    print $OK;
    print "ERROR:\n";
    print "ERROR: -------------------------------------------------\n";

    return;
}

sub _DTLBaselinkCheck {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /<form.+action="\$Env{"Baselink"}".*>/) {
            $Ok .= "ERROR: Line $Counter $Line";
        }
    }
    close $In;
    if (!$Ok) {
        print "NOTICE: _DTLBaselinkCheck() ok\n";
        return 1;
    }

    print "ERROR: -------------------------------------------------\n";
    print "ERROR:\n";
    print "ERROR: _DTLBaselinkCheck()!\n";
    print "ERROR: \$Env{\"Baselink\"} is not allowed in <form>tags.\n";
    print "ERROR: Use \$Env{\"CGIHandle\"}!\n";
    print $Ok;
    print "ERROR:\n";
    print "ERROR: -------------------------------------------------\n";
    return;
}

sub _DTLCGIHandleCheck {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /<a.+href="\$Env{"CGIHandle"}(.*)>/) {

            # allow IE workaround
            # e. g. <a href="$Env{"CGIHandle"}/$QData{"Filename"}?Action=...">xxx</a>
            if ( $1 !~ /^\// ) {
                $Ok .= "ERROR: Line $Counter $Line";
            }
        }
    }
    close $In;
    if (!$Ok) {
        print "NOTICE: _DTLCGIHandleCheck() ok\n";
    }
    else {
        print "ERROR: -------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: _DTLCGIHandleCheck()!\n";
        print "ERROR: \$Env{\"CGIHandle\"} is not allowed in <a>tags.\n";
        print "ERROR: Use \$Env{\"Baselink\"}!\n";
        print $Ok;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------\n";

        return;
    }
    return 1;
}

sub _XMLGreaterAndLowerThanCheck {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /<Description.*?>.*(<|>).*<\/Description>/) {
            $Ok .= "ERROR: Line $Counter $Line";
        }
    }
    close $In;
    if (!$Ok) {
        print "NOTICE: _XMLGreaterAndLowerThanCheck() ok\n";
        return 1;
    }

    print "ERROR: -------------------------------------------------\n";
    print "ERROR:\n";
    print "ERROR: _XMLGreaterAndLowerThanCheck()!\n";
    print "ERROR: Don't use < and > in the Content of xml-config-files.\n";
    print $Ok;
    print "ERROR:\n";
    print "ERROR: -------------------------------------------------\n";
}

sub _PerlCheckStaticXMLCharset {
    my $File = shift;
    my $Ok = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /<?xml.+encoding=\"ISO-8859-1\".*?>/) {
            $Ok .= "WARNING: Line $Counter $Line";
        }
    }
    close $In;

    if (!$Ok) {
        print "NOTICE: _PerlCheckStaticXMLCharset() ok\n";
        return 1;
    }

    print "WARNING: -------------------------------------------------\n";
    print "WARNING:\n";
    print "WARNING: _PerlCheckStaticXMLCharset()!\n";
    print "WARNING: Static xml charsets a very critical!\n";
    print $Ok;
    print "WARNING:\n";
    print "WARNING: -------------------------------------------------\n";
}

# sub _PerlSQLQuoteCheck {
#     my $File = shift;
#     my $Sub = '';
#     my $SQL = 0;
#     my $Quote = 0;
#     my $Ok = '';
#
#     open IN, '<', $File || die "FILTER: Can't open $File: $!\n";
#     while (my $Line = <IN>) {
#
#         if ($Line =~ /^}/ || ($Line =~ /sub .+/ && $Sub)) {
#             if ($SQL && !$Quote) {
#                 $Ok .= "ERROR: Line $Sub";
#             }
#             $Sub = 0;
#             $SQL = 0;
#             $Quote = 0;
#         }
#
#         if ($Line =~ /({DBObject}->Prepare|{DBObject}->Do)/) {
#             $SQL = 1;
#         }
#
#         if ($Line =~ /{DBObject}->Quote/) {
#             $Quote = 1;
#         }
#
#         if ($Line =~ /sub .+/) {
#             $Sub = $Line;
#         }
#     }
#     close IN;
#     if (!$Ok) {
#         print "NOTICE: _PerlSQLQuoteCheck() ok\n";
#     }
#     else {
#         print "ERROR: -------------------------------------------------\n";
#         print "ERROR:\n";
#         print "ERROR: _PerlSQLQuoteCheck()!\n";
#         print "ERROR: Please check this function(s), if all elements of the\n";
#         print "ERROR: SQL-Statement are quoted!\n";
#         print $Ok;
#         print "ERROR:\n";
#         print "ERROR: -------------------------------------------------\n";
#
#         return;
#     }
#     return 1;
# }

sub _DTLIFCheck {
    my $File = shift;
    my $Ok = 1;
    my $Counter = 0;
    my $StartLine = 0;

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /<dtl if/ && !$StartLine) {
            $Ok = 0;
            $StartLine = $Counter;
        }
        elsif ($StartLine && $Line !~ /<dtl if/) {
            my $EndLine = $Counter - 1;
            print "WARNING: Don't use <dtl if>tags in dtls! Line from $StartLine to $EndLine\n";
            $StartLine = 0;
        }
    }
    close $In;
    if ($StartLine) {
        print "WARNING: Don't use <dtl if>tags in dtls! Line from $StartLine to $Counter\n";
    }

    if ($Ok) {
        print "NOTICE: _DTLIFCheck() ok\n";
    }
    return 1;
}

sub _OPMInsertTagCheck {
    my $File = shift;

    my $InsertFlag = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        if ($Line =~ /<Insert /) {
            $InsertFlag = 1;
        }
        if ($Line =~ /<\/Insert>/) {
            $InsertFlag = 0;
        }
        if ($InsertFlag && $Line =~ /<Data .*?Value/) {
            print "WARNING: _OPMInsertTagCheck() You use the attribute Value for inserts. Don't use the attribute Value for OTRS 2.2 and higher.\n";
        }
    }
    close $In;

    return 1;
}

sub _OPMPackageRequiredCheck {
    my $File = shift;
    my $Ok = 1;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        if ($Line =~ /<PackageRequired>/) {
            $Ok = 0;
            print "ERROR: -------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: _OPMPackageRequiredCheck() You use the attribute PackageRequired without a version tag.\n";
            print "ERROR: Use: \"<PackageRequired Version=\"1.1.1\">NewPackage</PackageRequired>\"\n";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------\n";
        }
    }
    close $In;

    return if !$Ok;

    print "NOTICE: _OPMPackageRequiredCheck() ok\n";
    return 1;
}

sub _XMLConfigFullSentenceCheck {
    my $File = shift;
    my $Text = '';
    my $Counter = 0;
    my $NavBar = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /<NavBar/) {
            $NavBar = 1;
        }
        elsif ($Line =~ /<\/NavBar/) {
            $NavBar = 0;
        }
        elsif (!$NavBar && $Line =~ /<Description.+?>(.).*?(.)<\/Description>/) {
            #$Text .= "ERROR: $1 - $2 \n";
            if ($2 ne '.' && $2 ne '?' && $2 ne '!') {
                $Text .= "ERROR: Line $Counter: $Line\n";
            }
            elsif ($1 !~ /[A-ZËÜÖ]/) {
                $Text .= "ERROR: Line $Counter: $Line\n";
            }
        }
    }

    close $In;

    if ($Text) {
        print "ERROR: -------------------------------------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: _XMLConfigFullSentenceCheck()!\n";
        print "ERROR: Please make complete sentences. Start with a capital letter and finish with a dot.\n";
        print $Text;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------------------------------------\n";
        return;
    }

    print "NOTICE: _XMLConfigFullSentenceCheck() ok\n";
    return 1;
}

sub _DocBookCheck {
    my $File = shift;
    my $Text = '';
    my $Counter = 0;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        $Counter++;
        if ($Line =~ /<programlisting[^>]*>/ && $Line !~ /<programlistingco[^>]*>/ && $Line !~ /<!\[CDATA\[/) {
            $Text .= "ERROR: Line $Counter: $Line\n";
        }
        elsif ($Line =~ /<\/programlisting>/ && $Line !~ /\]\]>/) {
            $Text .= "ERROR: Line $Counter: $Line\n";
        }
    }

    close $In;

    if ($Text) {
        print "ERROR: -------------------------------------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: _DocBookCheck()!\n";
        print "ERROR: Please include a <![CDATA[...]]> section around code examples.\n";
        print "ERROR: Example: <programlisting><![CDATA[ var \$Self = shift; ]]></programlisting>.\n";
        print $Text;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------------------------------------\n";
        return;
    }

    print "NOTICE: _DocBookCheck() ok\n";
    return 1;
}

sub _SQLColumnTypeCheck {
    my $File = shift;

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    while (my $Line = <$In>) {
        if ($Line =~ /<Column.+?Type="(.+?)".*?\/>/i) {
            if ($1 !~ /(DATE|SMALLINT|BIGINT|INTEGER|DECIMAL|VARCHAR|LONGBLOB)/i) {
                print "ERROR: You try to use a unknown data type '$1'\n";
                print "ERROR: Allowed are DATE, SMALLINT, BIGINT, INTEGER, DECIMAL, VARCHAR, LONGBLOB.\n";
                return;
            }
        }
    }
    close $In;

    print "NOTICE: _SQLColumnTypeCheck() ok\n";
    return 1;
}

sub _PerlUselessForCheck {
    my $File = shift;
    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    my $Code = do { local $/, <$In>};
    close $In;

    if ($Code =~ m{
        for (each)?  .+?                              # find a forloop
            \( \s? keys \s %Param \s? \) \s* { \n         # define searched list
        \s* \$Self->{\$_} \s+ = \s+ \$Param{\$_};\n
        \s*}
    }msx) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: PerlUselessForCheck()!\n";
        print "WARNING: Please check your for loops, I think some are useless. For example:\n";
        print "WARNING: for ( keys \%Param ) {\n";
        print "WARNING:     \$Self->{\$_} = \$Param{\$_};\n";
        print "WARNING: }\n";
        print "WARNING:There are several ways to improve this (depends on the situation):\n";
        print 'WARNING:> %{$Self} = %Param;' . "\n";
        print 'WARNING:> my $Self = {%Param};' . "\n";
        print 'WARNING:> $Self = {%{$Self}, %Param};' . "\n";
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: PerlUselessForCheck() ok\n";
    return 1;
}

sub _DTLUniqueBlockCheck {
    my %FileData = @_;
    my %BlockCounter;
    my $ErrorFlag = 0;
    for my $Line (@{$FileData{ContentArrayRef}}) {
        if ($Line =~ m{ ^ \s*? <!-- \s dtl:block: (\w+) \s* -->}xms) {
            $BlockCounter{$1}++;
        }
    }

    for my $Block ( keys %BlockCounter ) {
        if ( $BlockCounter{$Block} == 1 ) {
            print "ERROR: -------------------------------------------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: _DTLUniqueBlockCheck()!\n";
            print "ERROR: Block usage error. You used the block '$Block' only one time, the closing block is missing.\n";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------------------------------------------\n";
            $ErrorFlag = 1;
        }
        if ( $BlockCounter{$Block} > 2 ) {
            print "ERROR: -------------------------------------------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: _DTLUniqueBlockCheck()!\n";
            print "ERROR: A block name should be unique. But you use the block '$Block'  for more than one time.\n";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------------------------------------------\n";
            $ErrorFlag = 1;
        }
    }

    return if $ErrorFlag && $FileData{Name} !~ m{Vulnerability|Incident|Artefact|Advisory};

    print "NOTICE: _DTLUniqueBlockCheck() ok\n";
    return 1;
}

sub _PerlForMyCheck {
    my %FileData = @_;
    my %BlockCounter;
    my $OkFlag = 1;
    my $Text   = '';

    for my $Line (@{$FileData{ContentArrayRef}}) {
        if ($Line =~ m{^ \s* for (each)? \s+ \$.+ \s+ \(  }xms) {
            $Text .= "ERROR: $Line\n";
        }
    }

    if ($Text) {
        print "ERROR: -------------------------------------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: _PerlForMyCheck()()!\n";
        print "ERROR: Please use my to declare the key variable in\n";
        print $Text;
        print "ERROR: It's because of a lot of bugs we had because of this problem and because of damon conway\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------------------------------------\n";

        return;
    }

    print "NOTICE: _PerlForMyCheck() ok\n";
    return 1;
}

sub _AGPL3LicenseCheck {
    my $File      = shift;
    my $Directory = shift;

    # don't check these directories
    return 1 if $Directory =~ m{ test/sample }smx;

    # don't check these files
    return 1 if $File =~ m{\.sopm$}smx;
    return 1 if $File =~ m{\.xml$}smx;
    return 1 if $File =~ m{\.sql$}smx;
    return 1 if $File =~ m{Copyright\.dtl$}smx;
    return 1 if $File =~ m{test-email}smx;
    return 1 if $File =~ m{COPYING}smx;
    return 1 if $File =~ m{RELEASE}smx;
    return 1 if $File =~ m{CREDITS}smx; # no copyright necessary

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    my $Code = do { local $/, <$In>};
    close $In;

    my $AGPLLong      = _AGPLLong();
    my $GPLLongRegExp = <<'    END_REGEXP';
        \# \s -- \n
        \# \s This \s program \s is \s free \s software
        .*?
        \# \s+ Foundation, \s+ Inc., \s+ 59 \s+ Temple \s+ Place, \s+ Suite \s+ 330, \s+ Boston, \s+ MA \s+ 02111-1307 \s+ USA \n
        \# \s -- \n
    END_REGEXP

    my $AGPLShort      = _AGPLShort();
    my $GPLShortRegExp = <<'    END_REGEXP';
        \# \s -- \n
        \# \s This \s software \s comes \s with \s ABSOLUTELY \s NO \s WARRANTY.
        .*?
        \# \s+ did \s+ not \s+ receive \s+ this \s+ file, \s+ see  \s+ http:\/\/www\.gnu\.org\/licenses\/gpl (?: -2\.0 |  ) \.txt\. \n
        \# \s -- \n
    END_REGEXP

    # check if there is a valid licence header!
    if (
        $Code !~ m{$GPLLongRegExp}smx
        && $Code !~ m{$GPLShortRegExp}smx
        && $Code !~ m{\Q$AGPLShort\E}
        && $Code !~ m{\Q$AGPLLong\E}
        )
    {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: AGPL3LicenseCheck()!\n";
        print "WARNING: Found no valid licence header\n";
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    my $Flag = 0;
    # The following code replace the license GPL2 with AGPL3 in pl-files
    if ( $Code =~ s{$GPLLongRegExp}{$AGPLLong}xms ) {
        print "NOTICE: _AGPL3LicenseCheck() replaced the license GPL2 with AGPL3 in pl-files\n";
        $Flag = 1;
    }

    # The following code replace the license GPL2 with AGPL3 in pm-files
    if ( $Code =~ s{$GPLShortRegExp}{$AGPLShort}xms ) {
        print "NOTICE: _AGPL3LicenseCheck() replaced the license GPL2 with AGPL3 in pm-files\n";
        $Flag = 1;
    }

    my $AGPLPerldoc      = _AGPLPerldoc();
    my $GPLPerldocRegExp = <<'    END_REGEXP';
        =head1 \s+ TERMS \s+ AND \s+ CONDITIONS \n
        \n
        This  \s+ software  \s+ is  \s+ part  \s+ of  \s+ the  \s+ OTRS  \s+ project  \s+ \(http:\/\/otrs\.org\/\)\. \n
        .+?
        did \s+ not \s+ receive \s+ this \s+ file, \s+ see \s+ http:\/\/www\.gnu\.org\/licenses\/gpl (?: -2\.0 |  ) \.txt\. \n
    END_REGEXP

    # The following code replace the license GPL2 with AGPL3 in perldoc content
    if ( $Code =~ s{$GPLPerldocRegExp}{$AGPLPerldoc}xms ) {
        print "NOTICE: _AGPL3LicenseCheck() replaced the license GPL2 with AGPL3 in perldoc content\n";
        $Flag = 1;
    }

    # Links to AGPL should be within L<> (especially at the end of a sentence)
    # pod2html (resp. Pod::Html) would be "confused" otherwise
    if ( $Code =~ m{ [^<] http:// [^\s]+ agpl\.txt [^>] }xms ) {
        $Code =~ s! (http:// [^\s]+ agpl\.txt) ([^>])!L<$1>$2!xgms;
    }

    # save the changes
    if ($Flag) {
        open my $Out, '>', $File or die "FILTER: Can't write $File: $!\n";
        print $Out $Code;
        close $Out;
    }

    # check if there other strange license content
    if ( $Code =~ m{(^ [^\n]* (?: \(GPL\) | /gpl ) [^\n]* $)}smx ) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: AGPL3LicenseCheck()!\n";
        print "WARNING: There is strange license wording!\n";
        print "WARNING: Line: $1 \n";
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _AGPL3LicenseCheck() ok\n";
    return 1;
}

sub _AGPLLong {
    return <<'END_AGPLLONG';
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
END_AGPLLONG

}

sub _AGPLShort {
    return <<'END_AGPLSHORT';
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
END_AGPLSHORT
}

sub _AGPLPerldoc {
    return <<'END_AGPLPERLDOC';
=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.
END_AGPLPERLDOC

}

# out of order till a talk in the developer meeting
#sub _CompactTranslationHashFormCheck {
#    my %FileData = @_;
#    my $Count = 0;
#
#    for my $Line (@{$FileData{ContentArrayRef}}) {
#        if ($Line =~ m{ \s* \$Self->\{Translation\}->}xms) {
#            $Count++
#        }
#    }
#    if ($Count > 1) {
#        print "ERROR: -------------------------------------------------------------------------------------\n";
#        print "ERROR:\n";
#        print "ERROR: _CompactTranslationHashFormCheck()!\n";
#        print "ERROR: Please use the following hash form in your translation file.\n";
#
#        print "ERROR: \$Self->{Translation} = {\n";
#        print "ERROR:     \%{\$Self->{Translation}},\n";
#        print "ERROR:     # Template: AAABase\n";
#        print "ERROR:     'Incident'             => 'Vorfall',\n";
#        print "ERROR:     'Advisory'             => 'Advisory',\n";
#        print "ERROR:     'Artefact'             => 'Artefakt',\n";
#        print "ERROR: }\n";
#        print "ERROR:\n";
#        print "ERROR: -------------------------------------------------------------------------------------\n";
#
#        return;
#
#    }
#
#    print "NOTICE: _CompactTranslationHashFormCheck() ok\n";
#    return 1;
#};

sub _GetGroupIdByNameCheck {
    my %FileData = @_;

    if ($FileData{ContentString} =~ m{ GetGroupIdByName }msx) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: GetGroupIdByNameCheck()!\n";
        print "WARNING: Be careful this funciton is in OTRS 2.3 and higher not available!\n";
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _GetGroupIdByNameCheck() ok\n";
    return 1;
};

sub _LinkObjectLoadBackendCheck {
    my %FileData = @_;

    if ($FileData{ContentString} =~ m{ \$Self->\{LinkObject\}->LoadBackend\( }msx) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: LinkObjectLoadBackendCheck()!\n";
        print "WARNING: Be careful this funciton is in OTRS 2.3 and higher not available!\n";
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: LinkObjectLoadBackendCheck() ok\n";
    return 1;
};

sub _ParserObjectTypoCheck {
    my %FileData = @_;

    if ($FileData{ContentString} =~ m{ ParseObject }msx) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: ParserObjectTypoCheck()!\n";
        print "WARNING: Be careful, in OTRS 2.3 and higher ParseObject is renamed in ParserObject!\n";
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: ParserObjectTypoCheck() ok\n";
    return 1;
};

sub _DTLUnquotedAttributeCheck {
    my %FileData = @_;
    my $Counter = 0;
    my $Text = '';

    for my $Line (@{$FileData{ContentArrayRef}}) {
        $Counter++;
        if ($Line =~ m{ < [^>]*? ( type | value | name | alt | title | class ) ="\$Data{"(.+?)"}}xms) {
            $Text .= "WARNING: Line( $Counter ) attribute ( $1 ) content ($2) isn't quoted.\n";
            $Text .= "WARNING: $Line\n";
        }
    }

    if ( $Text ) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: _DTLUnquotedAttributeCheck() -  Possible Cross-Site-Scripting!\n";
        print $Text;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";

        return 1;
    }

    print "NOTICE: _DTLUnquotedAttributeCheck() ok\n";
    return 1;
}

sub _FetchrowHashrefCheck {
    my %FileData = @_;
    my $Counter = 0;
    my $Text = '';

    return 1 if $FileData{Name} !~ m{\.p [lm]$}smx;
    return 1 if $FileData{Name} eq 'DB.pm';

    for my $Line (@{$FileData{ContentArrayRef}}) {
        $Counter++;
        if ($Line =~ m{ FetchrowHashref }xms) {
            $Text .= "ERROR: Line( $Counter ): $Line";
        }
    }

    if ( $Text ) {
        print "ERROR: -------------------------------------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: _FetchrowHashrefCheck() -  _should_ not used because of database incompat!\n";
        print $Text;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------------------------------------\n";

        if ($FileData{Name} =~ m{ (?:WID|BC)AnnouncementDB.pm }x ) {
            return 1;
        }

        return;
    }

    print "NOTICE: _FetchrowHashrefCheck() ok\n";
    return 1;
}

sub _TranslationTextCheck {
    my %FileData = @_;

    return 1 if $FileData{Directory} !~ m{\/System(\/|$)}smx;

    my $Counter = 0;
    my $Text = '';
    my $Regexp = '$Text{"';

    for my $Line (@{$FileData{ContentArrayRef}}) {
        $Counter++;
        if ($Line =~ m{ \Q$Regexp\E }xms) {
            $Text .= "WARNING: Line( $Counter ): $Line\n";
        }
    }

    if ( $Text ) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: _TranslationTextCheck() -  don't use translateable frontend strings in backend!\n";
        print $Text;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _TranslationTextCheck() ok\n";
    return 1;
}

sub _AGPL3LicenseCheckForSOPM {
    my $File      = shift;
    my $Directory = shift;

    # check only sopm files
    return 1 if $File !~ m{\.sopm$}smx;

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    my $Code = do { local $/, <$In>};
    close $In;

    # check if there is a valid licence header!
    if ( $Code !~ m{<License> .+? </License>}smx ) {
        print "ERROR: -------------------------------------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: AGPL3LicenseCheckForSOPM()!\n";
        print "ERROR: There is no valid licence tag\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------------------------------------\n";

        return;
    }

    if ( $Code =~ m{<License>GNU \s GENERAL \s PUBLIC \s LICENSE \s Version \s 2, \s June \s 1991</License>}smx ) {

        $Code =~ s{<License> .+? </License>}{<License>GNU AFFERO GENERAL PUBLIC LICENSE Version 3, November 2007</License>}smx;

        open my $Out, '>', $File or die "FILTER: Can't write $File: $!\n";
        print $Out $Code;
        close $Out;

        print "NOTICE: Replaced GPL2 license with AGPL3!\n";
        return 1;
    }

    if ( $Code =~ m{<License>GNU \s GENERAL \s PUBLIC \s LICENSE \s Version \s 2, \s June \s 1991</License>}smx ) {
        print "ERROR: -------------------------------------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: AGPL3LicenseCheckForSOPM()!\n";
        print "ERROR: There is no valid entry in licence tag\n";
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------------------------------------\n";
        return;
    }
    print "NOTICE: _AGPL3LicenseCheckForSOPM() ok\n";
    return 1;
}

sub _DTLImagePath {
    my %FileData = @_;

    # check only dtl files
    return 1 if $FileData{Name} !~ m{\.dtl$}smx;

    my $Counter = 0;
    my $Text = '';
    my $Regexp = '$Env{"Images"}';

    for my $Line (@{$FileData{ContentArrayRef}}) {

        # allow the usage of $Env{"Images"} if the line is commented out. Otherwise commenting out
        # inherited code (OldId) doesn't work and the filter still complains about the usage of
        # $Env{"Images"}, although the code itself isn't effective at all
        next if $Line =~ m{^[\t ]*#}xms;

        $Counter++;
        if ($Line =~ m{ \Q$Regexp\E }xms) {
            $Text .= "WARNING: Line( $Counter ): $Line\n";
        }
    }

    if ( $Text ) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: _DTLImagePath() -  OTRS 2.4 use \$Config{\"Frontend::ImagePath\"} instead of \$Env{\"Images\"}!\n";
        print $Text;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _DTLImagePath() ok\n";
    return 1;
}

sub _PerlExecutableWithSubs {
    my %FileData = @_;

    # don't check these files
    return 1 if $FileData{Name} !~ m{\.pl}smx;

    if ( $FileData{ContentString} =~ m{^sub \s}smx ) {
        print "WARNING: -------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: _PerlExecutableWithSubs()\n";
        print "WARNING: You use subs in pl-files. Consider a refactoring with pm-files.\n";
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------\n";
    }
    else {
        print "NOTICE: _PerlExecutableWithSubs() ok\n";
    }
    return 1;
}

sub _XMLCheckWithOurParsers {
    my %FileData = @_;

    # check only xml and sopm files
    return 1 if $FileData{Name} !~ m{\. ( xml | sopm )$}smx;
    return 1 if $FileData{Directory} =~ m{doc-developer}smx;
    return 1 if $FileData{Directory} =~ m{doc-admin}smx;

    my $Ok = 1;

    if ( !eval 'require XML::Parser' ) {
         print "ERROR: XMLCheckWithOurParsers() can't find module XML::Parser\n";
    }
    else {
        my $Parser = XML::Parser->new();
        if ( !eval { $Parser->parse( $FileData{ContentString} ) } ) {
            print "ERROR: -------------------------------------------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: XMLCheckWithOurParsers()!\n";
            print "ERROR: XML::Parser produced errors!\n";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------------------------------------------\n";
            $Ok = 0;
        }
    }

    if ( !eval 'require XML::Parser::Lite' ) {
        print "ERROR: XMLCheckWithOurParsers() can't find module  XML::Parser::Lite\n";
        $Ok = 0;
    }
    else {
        my $ParserLite =  XML::Parser::Lite->new();
        eval { $ParserLite->parse( $FileData{ContentString} ) };
        if ( $@ ) {
            print "ERROR: -------------------------------------------------------------------------------------\n";
            print "ERROR:\n";
            print "ERROR: XMLCheckWithOurParsers()!\n";
            print "ERROR:  XML::Parser::Lite produced errors! >>$@<<\n";
            print "ERROR:\n";
            print "ERROR: -------------------------------------------------------------------------------------\n";
            $Ok = 0;
        }
    }

    return if !$Ok;

    print "NOTICE: _XMLCheckWithOurParsers() ok\n";
    return 1;
}

sub _PerlLanguageTranslationCheck {
    my %FileData = @_;

    # check only pm files
    return 1 if $FileData{Name} !~ m{\.pm$}smx;

    # check only the directory (Output/HTML is also useful)
    return 1 if $FileData{Directory} !~ m{ ( Static | Dynamic ) }smx;

    my $Counter = 0;
    my $Text = '';

    for my $Line (@{$FileData{ContentArrayRef}}) {
        $Counter++;
        if ($Line =~ m{ LanguageTranslation }xms) {
            $Text .= "WARNING: Line( $Counter ): $Line\n";
        }
    }

    if ( $Text ) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: _PerlLanguageTranslationCheck() -  OTRS 2.4 and higher doesn't use the wording LanguageTranslation for pull down menus. Please use Translation!\n";
        print $Text;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _PerlLanguageTranslationCheck() ok\n";
    return 1;
}

sub _PerlOptionStrgHashRefCheck {
    my %FileData = @_;

    # check only pm files
    return 1 if $FileData{Name} !~ m{\.pm$}smx;

    # check only the directory (Output/HTML is also useful)
    return 1 if $FileData{Directory} !~ m{ Modules }smx;

    my $Counter = 0;
    my $Text = '';

    for my $Line (@{$FileData{ContentArrayRef}}) {
        $Counter++;
        if ($Line =~ m{ (?: OptionStrgHashRef | OptionElement | AgentQueueListOption ) }xms) {
            $Text .= "WARNING: Line( $Counter ): $Line\n";
        }
    }

    if ( $Text ) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: _PerlOptionStrgHashRefCheck() -  Please use BuildSelection() instead of OptionStrgHashRef(), OptionElement() or AgentQueueListOption()!\n";
        print $Text;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _PerlOptionStrgHashRefCheck() ok\n";
    return 1;
}

sub _PerldocInconsistentNewPod {
    my %FileData = @_;

    # check only pm files
    return 1 if $FileData{Name} !~ m{\.pm$}smx;

    # search for a new perldoc
    return 1 if $FileData{ContentString} !~ m{=item \s new\(\) \n (.+?) =cut}xms;
    my $PodString = $1;

    # get all use calls
    my @Uses = $PodString =~ m{^ \s{4} use \s .+? ; \s* $}smxg;
    my %UseElement = map {$_ =~ m{^ \s{4} use \s (.+?) ; \s* $}smx; $1 => 1;} @Uses;

    # get all new calls
    my @News = $PodString =~ m{^ \s{4} my \s \$ .+? = [^\n]+? \( .*? $}smxg;
    my %NewElement = map {$_ =~ m{^ \s{4} my \s \$ .+? = \s ([^\n]+?) ->new\( .*? $}smx; $1 => 1;} @News;

    my $Text = '';

    # compare use calls with new calls
    USE:
    for my $Use (keys %UseElement) {
        next USE if $NewElement{$Use};
        $Text .= "ERROR: You call a use for $Use, but there is no new call!\n" ;
    }

    # compare new calls with use calls
    NEW:
    for my $New (keys %NewElement) {
        next NEW if $UseElement{$New};
        $Text .= "ERROR: You call a new for $New, but there is no use call!\n" ;
    }

    if ( $Text ) {
        print "ERROR: -------------------------------------------------------------------------------------\n";
        print "ERROR:\n";
        print "ERROR: _PerldocInconsistentNewPod() -  The perldoc new() is inconsistent!\n";
        print $Text;
        print "ERROR:\n";
        print "ERROR: -------------------------------------------------------------------------------------\n";
        return;
    }

    print "NOTICE: _PerldocInconsistentNewPod() ok\n";
    return 1;
}

# REMARK: This function can not guarantee that the new perldoc is complete.
# it makes only a simple check!

sub _PerldocNeededObjectsCheck1 {
    my %FileData = @_;

    # check only pm files
    return 1 if $FileData{Name} !~ m{\.pm$}smx;
    return 1 if $FileData{Name} =~ m{InterfacePublic\.pm$}smx;
    return 1 if $FileData{Name} =~ m{InterfaceAgent\.pm$}smx;
    return 1 if $FileData{Name} =~ m{InterfaceCustomer\.pm$}smx;
    return 1 if $FileData{Name} =~ m{Config\.pm$}smx;

    # don't check these directories
    return 1 if $FileData{Directory} =~ m{ ( Output/HTML ) }smx && $FileData{Name} =~ m{LinkObject}smx;

    # search for a new perldoc
    return 1 if $FileData{ContentString} !~ m{=item \s new\(\) \n (.+?) =cut}xms;
    my $PodString = $1;

    # get the content of the new function
    if ($FileData{ContentString} !~ m{^sub \s new \s \{ \n (.+?) ^\}}xms ) {
        print "ERROR: found no new() for $FileData{Name} \n"  ;
    }
    my $NewString = $1;

    # get filename without ending
    $FileData{Name} =~ m{ (.+?) \. pm }smx;
    my $Name = $1;

    # extract the new call in perldoc for this package
    $PodString =~ m{^ \s{4} my \s \$ .+? = \s .+? $Name ->new\(
        (.+?)
        ^   \s{4} \);
    }smx;
    my $AttributesString = $1;

    # get the attributes which are displayed for the new method in perldoc
    my @Array = split "\n", $AttributesString;
    my %Attributes = ();;
    for my $Line (@Array) {
        if ($Line =~ m{^ \s{8} (.+?) \s+ =>}smx) {
            $Attributes{$1} = 1;
        }
    }

    # get the object list from the needed loop

    $NewString =~ m{ qw \s* \( ( [\s\w]+? ) \)}smx;
    my $NeededString = $1 || '';

    # Check all in general needed objects
    my $Text = '';
    OBJECT:
    for my $Object (qw(
        EncodeObject ConfigObject MainObject DBObject TimeObject TicketObject
        UserObject GroupObject QueueObject CVSObject CustomerUserObject
    )) {
        if ($NeededString =~ m{\b\Q$Object\E\b}smx) {
            if (!$Attributes{$Object}) {
                 $Text .= "WARNING: $Object\n";
            }
        }
    }

    if ( $Text ) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: _PerldocNeededObjectsCheck1() - Perhaps your new() perldoc is incomplete!\n";
        print "WARNING: Because I think I found a object in the new() but not in the perldoc part where this function is described!\n";
        print $Text;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _PerldocNeededObjectsCheck1() ok\n";
    return 1;
}

sub _PerldocNeededObjectsCheck2 {
    my %FileData = @_;

    # check only pm files
    return 1 if $FileData{Name} !~ m{\.pm$}smx;
    return 1 if $FileData{Name} =~ m{InterfacePublic\.pm$}smx;
    return 1 if $FileData{Name} =~ m{InterfaceAgent\.pm$}smx;
    return 1 if $FileData{Name} =~ m{InterfaceCustomer\.pm$}smx;
    return 1 if $FileData{Name} =~ m{Config\.pm$}smx;

    # search for a new perldoc
    return 1 if $FileData{ContentString} !~ m{=item \s new\(\) \n (.+?) =cut}xms;
    my $PodString = $1;

    # get the all attributes which are displayed in perldoc new()
    my @Array = split "\n", $PodString;
    my %Attributes = ();
    for my $Line (@Array) {
        if ($Line =~ m{^ \s{8} (.+? Object) \s+ => [^#]* $}smx) {
            $Attributes{$1} = 1;
        }
    }

    # Check all in general needed objects
    my $Text = '';
    OBJECT:
    for my $Object (keys %Attributes) {
        if ($PodString !~ m{^ \s{4} my \s \$ \Q$Object\E}smx) {
            $Text .= "WARNING: $Object\n";
        }
    }

    if ( $Text ) {
        print "WARNING: -------------------------------------------------------------------------------------\n";
        print "WARNING:\n";
        print "WARNING: _PerldocNeededObjectsCheck2() - Perhaps your new() perldoc is incomplete!\n";
        print "WARNING: Because I think I found a object as attribute but not the creation of the object in perldoc new()!\n";
        print $Text;
        print "WARNING:\n";
        print "WARNING: -------------------------------------------------------------------------------------\n";
        return 1;
    }

    print "NOTICE: _PerldocNeededObjectsCheck2() ok\n";
    return 1;
}

sub _PerlTidy {
    my $File      = shift;
    my $Directory = shift;

    # check only perl files
    return 1 if $Directory =~ m{ Language }xms;
    return 1 if $File !~ m{ ^ otrs\. }xms && $File !~ m{ \. (pl|pm|t) $ }xms;
    return 1 if $File eq 'otrs.cleanup';
    return 1 if $File eq 'Defaults.pm';

    open my $In, '<', $File or die "FILTER: Can't open $File: $!\n";
    my $Code = do { local $/, <$In>};
    close $In;

    # do not use perl tidy on custom files
    my $RegexOldId = qr{^ .*? \$OldId: \s .+? \s Exp \s \$ .*? $}xms;
    return 1 if $Code =~ $RegexOldId;

    # create tmp files
    my ( $fhs1, $FileStage1 ) = tempfile(
        'perltidystageXXXX',
        SUFFIX => '.tmp' . $$,
        DIR    => File::Spec->tmpdir,
    );

    my $ARGV
        = '-l=100 -i=4 -ci=4 -vt=0 -vtc=0 -cti=0 -pt=1 -bt=1 -sbt=1 -bbt=1 -nsfs -nolq -bbao -nola -ndnl';

    # use perl tidy
    Perl::Tidy::perltidy(
        source      => $File,
        destination => $FileStage1,
        argv        => $ARGV,
    );

    # restart perl tidy to avoid a indent bug in perl tidy
    Perl::Tidy::perltidy(
        source      => $FileStage1,
        destination => $File,
        argv        => $ARGV,
    );

    # delete stage1 files
    if ( -e $FileStage1 ) {
        unlink $FileStage1 || die "Can't remove $FileStage1: $!";
    }

    print "NOTICE: _PerlTidy() ok\n";
    return 1;
}

1;
