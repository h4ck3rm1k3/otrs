# --
# Kernel/Output/HTML/OutputFilterFAQ.pm - Output filter for FAQ module
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: OutputFilterFAQ.pm,v 1.13 2011/01/05 15:07:28 mn Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::OutputFilterFAQ;

use strict;

use vars qw($VERSION);
$VERSION = '$Revision: 1.13 $';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
    for my $Object (qw(ConfigObject MainObject LogObject LayoutObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check data
    return if !$Param{Data};
    return if ref $Param{Data} ne 'SCALAR';
    return if !${ $Param{Data} };
    return if !$Param{TemplateFile};

    # check permission
    return if !$Self->{LayoutObject}->{EnvRef}->{'UserIsGroupRo[faq]'};

    # get allowed template names
    my $ValidTemplates
        = $Self->{ConfigObject}->Get('Frontend::Output::FilterElementPost')->{FAQ}->{Templates};

    # check template name
    return if !$ValidTemplates->{ $Param{TemplateFile} };

    my $StartPattern    = '<!-- [ ] OutputFilterHook_TicketOptionsEnd [ ] --> .+?';
    my $FAQTranslatable = $Self->{LayoutObject}->{LanguageObject}->Get('FAQ');

    # add FAQ link to an exisitng Options block
    #$FinishPattern will be replaced by $Replace
    if ( ${ $Param{Data} } =~ m{ $StartPattern }ixms ) {
        my $FinishPattern = '</div>';
        my $Replace       = <<"END";
                        <a  href=\"#\" id=\"OptionFAQ\">[ $FAQTranslatable ]</a>

<!--dtl:js_on_document_complete-->
<script type=\"text/javascript\">//<![CDATA[
/*global FAQ: true */
FAQ.Agent.TicketCompose.InitFAQTicketCompose(\$('#RichText'));
\$('#OptionFAQ').bind('click', function (event) {
    var FAQIFrame = '<iframe class=\"TextOption Customer\" src=\"' + Core.Config.Get('CGIHandle') + '?Action=AgentFAQExplorer;Nav=None;Subject=;What=\"></iframe>';
    Core.UI.Dialog.ShowContentDialog(FAQIFrame, '', '10px', 'Center', true);
    return false;
});
//]]></script>
<!--dtl:js_on_document_complete-->

                    </div>
END
        ${ $Param{Data} } =~ s{ ($StartPattern) $FinishPattern }{$1$Replace}ixms;
        return 1;
    }

    # add FAQ link and its own block, if there no TicketOptions block was called
    $StartPattern = '<!-- [ ] OutputFilterHook_NoTicketOptionsFallback [ ] --> .+?';
    my $OptionsTranslatable = $Self->{LayoutObject}->{LanguageObject}->Get('Options');
    my $Replace             = <<"END";
<!-- OutputFilterHook_NoTicketOptionsFallback -->
                    <label>$OptionsTranslatable:</label>
                    <div class="Field">
                        <a  href=\"#\" id=\"OptionFAQ\">[ $FAQTranslatable ]</a>

<!--dtl:js_on_document_complete-->
<script type="text/javascript">//<![CDATA[
/*global FAQ: true */
FAQ.Agent.TicketCompose.InitFAQTicketCompose(\$('#RichText'));
\$('#OptionFAQ').bind('click', function (event) {
    var FAQIFrame = '<iframe class="TextOption Customer" src="' + Core.Config.Get('CGIHandle') + '?Action=AgentFAQExplorer;Nav=None;Subject=;What="></iframe>';
    Core.UI.Dialog.ShowContentDialog(FAQIFrame, '', '10px', 'Center', true);
    return false;
});
//]]></script>
<!--dtl:js_on_document_complete-->

                    </div>
                    <div class=\"Clear\"></div>
END
    ${ $Param{Data} } =~ s{ ($StartPattern) }{$Replace}ixms;
    return 1;
}

1;
