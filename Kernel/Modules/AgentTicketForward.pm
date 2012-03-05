# --
# Kernel/Modules/AgentTicketForward.pm - to forward a message
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: AgentTicketForward.pm,v 1.54.2.11 2012/03/05 09:47:47 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentTicketForward;

use strict;
use warnings;

use Kernel::System::CheckItem;
use Kernel::System::State;
use Kernel::System::SystemAddress;
use Kernel::System::CustomerUser;
use Kernel::System::Web::UploadCache;
use Kernel::System::TemplateGenerator;
use Mail::Address;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.54.2.11 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    $Self->{Debug} = $Param{Debug} || 0;

    # check all needed objects
    for (qw(TicketObject ParamObject DBObject QueueObject LayoutObject ConfigObject LogObject)) {
        if ( !$Self->{$_} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        }
    }

    # some new objects
    $Self->{CustomerUserObject} = Kernel::System::CustomerUser->new(%Param);
    $Self->{CheckItemObject}    = Kernel::System::CheckItem->new(%Param);
    $Self->{StateObject}        = Kernel::System::State->new(%Param);
    $Self->{SystemAddress}      = Kernel::System::SystemAddress->new(%Param);
    $Self->{UploadCachObject}   = Kernel::System::Web::UploadCache->new(%Param);

    # get params
    for (
        qw(From To Cc Bcc Subject Body InReplyTo References ComposeStateID ArticleTypeID
        ArticleID TimeUnits Year Month Day Hour Minute AttachmentUpload
        AttachmentDelete1 AttachmentDelete2 AttachmentDelete3 AttachmentDelete4
        AttachmentDelete5 AttachmentDelete6 AttachmentDelete7 AttachmentDelete8
        AttachmentDelete9 AttachmentDelete10 AttachmentDelete11 AttachmentDelete12
        AttachmentDelete13 AttachmentDelete14 AttachmentDelete15 AttachmentDelete16
        FormID)
        )
    {
        my $Value = $Self->{ParamObject}->GetParam( Param => $_ );
        if ( defined $Value ) {
            $Self->{GetParam}->{$_} = $Value;
        }
    }

    # create form id
    if ( !$Self->{GetParam}->{FormID} ) {
        $Self->{GetParam}->{FormID} = $Self->{UploadCachObject}->FormIDCreate();
    }

    $Self->{Config} = $Self->{ConfigObject}->Get("Ticket::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Output;

    if ( $Self->{Subaction} eq 'SendEmail' ) {

        # challenge token check for write action
        $Self->{LayoutObject}->ChallengeTokenCheck();

        $Output = $Self->SendEmail();
    }
    else {
        $Output = $Self->Form();
    }
    return $Output;
}

sub Form {
    my ( $Self, %Param ) = @_;

    my $Output;
    my %Error    = ();
    my %GetParam = %{ $Self->{GetParam} };

    # check needed stuff
    if ( !$Self->{TicketID} ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "Got no TicketID!",
            Comment => 'System Error!',
        );
    }

    # get ticket data
    my %Ticket = $Self->{TicketObject}->TicketGet( TicketID => $Self->{TicketID} );

    # check permissions
    my $Access = $Self->{TicketObject}->Permission(
        Type     => $Self->{Config}->{Permission},
        TicketID => $Self->{TicketID},
        UserID   => $Self->{UserID}
    );

    # error screen, don't show ticket
    if ( !$Access ) {
        return $Self->{LayoutObject}->NoPermission( WithHeader => 'yes' );
    }

    # get lock state
    if ( $Self->{Config}->{RequiredLock} ) {
        if ( !$Self->{TicketObject}->LockIsTicketLocked( TicketID => $Self->{TicketID} ) ) {

            # set owner
            $Self->{TicketObject}->OwnerSet(
                TicketID  => $Self->{TicketID},
                UserID    => $Self->{UserID},
                NewUserID => $Self->{UserID},
            );

            # set lock
            my $Lock = $Self->{TicketObject}->LockSet(
                TicketID => $Self->{TicketID},
                Lock     => 'lock',
                UserID   => $Self->{UserID}
            );

            # show lock state
            if ($Lock) {
                $Self->{LayoutObject}->Block(
                    Name => 'PropertiesLock',
                    Data => { %Param, TicketID => $Self->{TicketID}, },
                );
            }
        }
        else {
            my $AccessOk = $Self->{TicketObject}->OwnerCheck(
                TicketID => $Self->{TicketID},
                OwnerID  => $Self->{UserID},
            );
            if ( !$AccessOk ) {
                my $Output = $Self->{LayoutObject}->Header();
                $Output .= $Self->{LayoutObject}->Warning(
                    Message => 'Sorry, you need to be the owner to do this action!',
                    Comment => 'Please change the owner first.',
                );
                $Output .= $Self->{LayoutObject}->Footer();
                return $Output;
            }
            else {
                $Self->{LayoutObject}->Block(
                    Name => 'TicketBack',
                    Data => { %Param, TicketID => $Self->{TicketID}, },
                );
            }
        }
    }

    # get last customer article or selected article
    my %Data;
    if ( $GetParam{ArticleID} ) {
        %Data = $Self->{TicketObject}->ArticleGet( ArticleID => $GetParam{ArticleID}, );

        # Check if article is from the same TicketID as we checked permissions for.
        if ( $Data{TicketID} ne $Self->{TicketID} ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => "Article does not belong to ticket $Self->{TicketID}!",
            );
        }
    }
    else {
        %Data = $Self->{TicketObject}->ArticleLastCustomerArticle( TicketID => $Self->{TicketID}, );
    }

    # prepare signature
    my $TemplateGenerator = Kernel::System::TemplateGenerator->new( %{$Self} );
    $Data{Signature} = $TemplateGenerator->Signature(
        TicketID  => $Self->{TicketID},
        ArticleID => $Data{ArticleID},
        Data      => \%Data,
        UserID    => $Self->{UserID},
    );

    # body preparation for plain text processing
    $Data{Body} = $Self->{LayoutObject}->ArticleQuote(
        TicketID           => $Data{TicketID},
        ArticleID          => $Data{ArticleID},
        FormID             => $Self->{GetParam}->{FormID},
        UploadCachObject   => $Self->{UploadCachObject},
        AttachmentsInclude => 1,
    );

    if ( $Self->{ConfigObject}->Get('Frontend::RichText') ) {

        # prepare body, subject, ReplyTo ...
        $Data{Body} = '<br/>' . $Data{Body};
        if ( $Data{Created} ) {
            $Data{Body} = "Date: $Data{Created}<br/>" . $Data{Body};
        }
        for my $Key (qw( Subject ReplyTo Reply-To Cc To From )) {
            if ( $Data{$Key} ) {
                my $Value = $Self->{LayoutObject}->Ascii2RichText(
                    String => $Data{$Key},
                );
                $Data{Body} = "$Key: $Value<br/>" . $Data{Body};
            }
        }

        my $Quote = $Self->{LayoutObject}->Ascii2RichText(
            String => $Self->{ConfigObject}->Get('Ticket::Frontend::Quote') || '',
        );
        if ($Quote) {

            # quote text
            $Data{Body} = "<blockquote type=\"cite\">$Data{Body}</blockquote>\n";

            # cleanup not compat. tags
            $Data{Body} = $Self->{LayoutObject}->RichTextDocumentCleanup(
                String => $Data{Body},
            );
        }
        else {
            $Data{Body} = "<br/>" . $Data{Body};
        }
        my $From = $Self->{LayoutObject}->Ascii2RichText(
            String => $Data{From},
        );
        $Data{Body} = "<br/>---- Forwarded message from $From ---<br/><br/>"
            . $Data{Body};
        $Data{Body} .= "<br/>---- End forwarded message ---<br/>";
        $Data{Body} = $Data{Signature} . $Data{Body};

        $Data{ContentType} = 'text/html';
    }
    else {

        # prepare body, subject, ReplyTo ...
        $Data{Body} =~ s/\t/ /g;
        my $Quote = $Self->{ConfigObject}->Get('Ticket::Frontend::Quote');
        if ($Quote) {
            $Data{Body} =~ s/\n/\n$Quote /g;
            $Data{Body} = "\n$Quote " . $Data{Body};
        }
        else {
            $Data{Body} = "\n" . $Data{Body};
        }
        if ( $Data{Created} ) {
            $Data{Body} = "Date: $Data{Created}\n" . $Data{Body};
        }
        for (qw(Subject ReplyTo Reply-To Cc To From)) {
            if ( $Data{$_} ) {
                $Data{Body} = "$_: $Data{$_}\n" . $Data{Body};
            }
        }
        $Data{Body} = "\n---- Forwarded message from $Data{From} ---\n\n" . $Data{Body};
        $Data{Body} .= "\n---- End forwarded message ---\n";
        $Data{Body} = $Data{Signature} . $Data{Body};
    }

    # get all attachments meta data
    my @Attachments = $Self->{UploadCachObject}->FormIDGetAllFilesMeta(
        FormID => $GetParam{FormID},
    );

    # check some values
    for (qw(To Cc Bcc)) {
        if ( $Data{$_} ) {
            delete $Data{$_};
        }
    }

    # put & get attributes like sender address
    %Data = $TemplateGenerator->Attributes(
        TicketID   => $Self->{TicketID},
        ArticleID  => $GetParam{ArticleID},
        ResponseID => $GetParam{ResponseID},
        Data       => \%Data,
        UserID     => $Self->{UserID},
    );

    # run compose modules
    if ( ref( $Self->{ConfigObject}->Get('Ticket::Frontend::ArticleComposeModule') ) eq 'HASH' ) {
        my %Jobs = %{ $Self->{ConfigObject}->Get('Ticket::Frontend::ArticleComposeModule') };
        for my $Job ( sort keys %Jobs ) {

            # load module
            if ( !$Self->{MainObject}->Require( $Jobs{$Job}->{Module} ) ) {
                return $Self->{LayoutObject}->FatalError();
            }
            my $Object = $Jobs{$Job}->{Module}->new( %{$Self}, Debug => $Self->{Debug}, );

            # get params
            for ( $Object->Option( %Data, %GetParam, Config => $Jobs{$Job} ) ) {
                $GetParam{$_} = $Self->{ParamObject}->GetParam( Param => $_ );
            }

            # run module
            $Object->Run( %Data, %GetParam, Config => $Jobs{$Job} );

            # get errors
            %Error = ( %Error, $Object->Error( %GetParam, Config => $Jobs{$Job} ) );
        }
    }

    # get free text config options
    my %TicketFreeText = ();
    for ( 1 .. 16 ) {
        $TicketFreeText{"TicketFreeKey$_"} = $Self->{TicketObject}->TicketFreeTextGet(
            TicketID => $Self->{TicketID},
            Type     => "TicketFreeKey$_",
            Action   => $Self->{Action},
            UserID   => $Self->{UserID},
        );
        $TicketFreeText{"TicketFreeText$_"} = $Self->{TicketObject}->TicketFreeTextGet(
            TicketID => $Self->{TicketID},
            Type     => "TicketFreeText$_",
            Action   => $Self->{Action},
            UserID   => $Self->{UserID},
        );
    }
    my %TicketFreeTextHTML = $Self->{LayoutObject}->AgentFreeText(
        Ticket => \%Ticket,
        Config => \%TicketFreeText,
    );

    # get ticket free time params
    for ( 1 .. 6 ) {
        if ( !$Self->{ConfigObject}->Get( 'TicketFreeTimeOptional' . $_ ) ) {
            $GetParam{ 'TicketFreeTime' . $_ . 'Used' } = 1;
        }
    }

    # free time
    my %TicketFreeTime = ();
    for ( 1 .. 6 ) {
        $TicketFreeTime{ 'TicketFreeTime' . $_ . 'Optional' }
            = $Self->{ConfigObject}->Get( 'TicketFreeTimeOptional' . $_ ) || 0;
        $TicketFreeTime{ 'TicketFreeTime' . $_ . 'Used' }
            = $GetParam{ 'TicketFreeTime' . $_ . 'Used' };

        if ( $Ticket{ 'TicketFreeTime' . $_ } ) {
            (
                $TicketFreeTime{ 'TicketFreeTime' . $_ . 'Secunde' },
                $TicketFreeTime{ 'TicketFreeTime' . $_ . 'Minute' },
                $TicketFreeTime{ 'TicketFreeTime' . $_ . 'Hour' },
                $TicketFreeTime{ 'TicketFreeTime' . $_ . 'Day' },
                $TicketFreeTime{ 'TicketFreeTime' . $_ . 'Month' },
                $TicketFreeTime{ 'TicketFreeTime' . $_ . 'Year' }
                )
                = $Self->{TimeObject}->SystemTime2Date(
                SystemTime => $Self->{TimeObject}->TimeStamp2SystemTime(
                    String => $Ticket{ 'TicketFreeTime' . $_ },
                ),
                );
            $TicketFreeTime{ 'TicketFreeTime' . $_ . 'Used' } = 1;
        }
    }
    my %TicketFreeTimeHTML = $Self->{LayoutObject}->AgentFreeDate( Ticket => \%TicketFreeTime, );

    # build view ...
    # start with page ...
    $Output .= $Self->{LayoutObject}->Header( Value => $Ticket{TicketNumber} );
    $Output .= $Self->_Mask(
        TicketNumber => $Ticket{TicketNumber},
        TicketID     => $Self->{TicketID},
        QueueID      => $Ticket{QueueID},
        NextStates   => $Self->_GetNextStates(),
        Errors       => \%Error,
        Attachments  => \@Attachments,
        %Data,
        %GetParam,
        InReplyTo  => $Data{MessageID},
        References => "$Data{References} $Data{MessageID}",
        %TicketFreeTextHTML,
        %TicketFreeTimeHTML,
    );
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

sub SendEmail {
    my ( $Self, %Param ) = @_;

    my %Error    = ();
    my %GetParam = %{ $Self->{GetParam} };
    my $Output   = '';
    my $QueueID  = $Self->{QueueID};
    my %StateData
        = $Self->{TicketObject}->{StateObject}->StateGet( ID => $GetParam{ComposeStateID}, );
    my $NextState = $StateData{Name};

    # check pending date
    if ( $StateData{TypeName} && $StateData{TypeName} =~ /^pending/i ) {
        if ( !$Self->{TimeObject}->Date2SystemTime( %GetParam, Second => 0 ) ) {
            $Error{'Date invalid'} = 'invalid';
        }
    }

    # attachment delete
    for ( 1 .. 16 ) {
        if ( $GetParam{"AttachmentDelete$_"} ) {
            $Error{AttachmentDelete} = 1;
            $Self->{UploadCachObject}->FormIDRemoveFile(
                FormID => $GetParam{FormID},
                FileID => $_,
            );
        }
    }

    # attachment upload
    if ( $GetParam{AttachmentUpload} ) {
        $Error{AttachmentUpload} = 1;
        my %UploadStuff = $Self->{ParamObject}->GetUploadAll(
            Param  => 'file_upload',
            Source => 'string',
        );
        $Self->{UploadCachObject}->FormIDAddFile(
            FormID => $GetParam{FormID},
            %UploadStuff,
        );
    }

    # get all attachments meta data
    my @Attachments = $Self->{UploadCachObject}->FormIDGetAllFilesMeta(
        FormID => $GetParam{FormID},
    );

    # check some values
    for my $Line (qw(From To Cc Bcc)) {
        next if !$GetParam{$Line};
        for my $Email ( Mail::Address->parse( $GetParam{$Line} ) ) {
            if ( !$Self->{CheckItemObject}->CheckEmail( Address => $Email->address() ) ) {
                $Error{"$Line invalid"} .= $Self->{CheckItemObject}->CheckError();
            }
        }
    }

    # prepare subject
    my $Tn = $Self->{TicketObject}->TicketNumberLookup( TicketID => $Self->{TicketID} );
    $GetParam{Subject} = $Self->{TicketObject}->TicketSubjectBuild(
        TicketNumber => $Tn,
        Subject => $GetParam{Subject} || '',
    );

    # prepare free text
    my %TicketFree = ();
    for ( 1 .. 16 ) {
        $TicketFree{"TicketFreeKey$_"}
            = $Self->{ParamObject}->GetParam( Param => "TicketFreeKey$_" );
        $TicketFree{"TicketFreeText$_"}
            = $Self->{ParamObject}->GetParam( Param => "TicketFreeText$_" );
    }

    # get free text config options
    my %TicketFreeText = ();
    for ( 1 .. 16 ) {
        $TicketFreeText{"TicketFreeKey$_"} = $Self->{TicketObject}->TicketFreeTextGet(
            TicketID => $Self->{TicketID},
            Type     => "TicketFreeKey$_",
            Action   => $Self->{Action},
            UserID   => $Self->{UserID},
        );
        $TicketFreeText{"TicketFreeText$_"} = $Self->{TicketObject}->TicketFreeTextGet(
            TicketID => $Self->{TicketID},
            Type     => "TicketFreeText$_",
            Action   => $Self->{Action},
            UserID   => $Self->{UserID},
        );

        # check required FreeTextField (if configured)
        if ( $Self->{Config}{'TicketFreeText'}{$_} == 2 && $TicketFree{"TicketFreeText$_"} eq '' ) {
            $Error{"TicketFreeTextField$_ invalid"} = 'invalid';
        }
    }
    my %TicketFreeTextHTML = $Self->{LayoutObject}->AgentFreeText(
        Config => \%TicketFreeText,
        Ticket => \%TicketFree,
    );

    # get ticket free time params
    for ( 1 .. 6 ) {
        for my $Type (qw(Used Year Month Day Hour Minute)) {
            $GetParam{ 'TicketFreeTime' . $_ . $Type }
                = $Self->{ParamObject}->GetParam( Param => 'TicketFreeTime' . $_ . $Type );
        }
        $GetParam{ 'TicketFreeTime' . $_ . 'Optional' }
            = $Self->{ConfigObject}->Get( 'TicketFreeTimeOptional' . $_ ) || 0;
        if ( !$Self->{ConfigObject}->Get( 'TicketFreeTimeOptional' . $_ ) ) {
            $GetParam{ 'TicketFreeTime' . $_ . 'Used' } = 1;
        }
    }

    # transform pending time, time stamp based on user time zone
    if (
        defined $GetParam{Year}
        && defined $GetParam{Month}
        && defined $GetParam{Day}
        && defined $GetParam{Hour}
        && defined $GetParam{Minute}
        )
    {
        %GetParam = $Self->{LayoutObject}->TransfromDateSelection(
            %GetParam,
        );
    }

    # transform free time, time stamp based on user time zone
    for my $Count ( 1 .. 6 ) {
        my $Prefix = 'TicketFreeTime' . $Count;
        next if !defined $GetParam{ $Prefix . 'Year' };
        next if !defined $GetParam{ $Prefix . 'Month' };
        next if !defined $GetParam{ $Prefix . 'Day' };
        next if !defined $GetParam{ $Prefix . 'Hour' };
        next if !defined $GetParam{ $Prefix . 'Minute' };
        %GetParam = $Self->{LayoutObject}->TransfromDateSelection(
            %GetParam,
            Prefix => $Prefix
        );
    }

    my %TicketFreeTimeHTML = $Self->{LayoutObject}->AgentFreeDate( Ticket => \%GetParam, );

    # check some values
    for my $Line (qw(To Cc Bcc)) {
        next if !$GetParam{$Line};
        for my $Email ( Mail::Address->parse( $GetParam{$Line} ) ) {
            if ( !$Self->{CheckItemObject}->CheckEmail( Address => $Email->address() ) ) {
                $Error{"$Line invalid"} .= $Self->{CheckItemObject}->CheckError();
            }
            my $IsLocal = $Self->{SystemAddress}->SystemAddressIsLocalAddress(
                Address => $Email->address()
            );
            if ($IsLocal) {
                $Error{"$Line invalid"}
                    .= "Can't forward ticket to "
                    . $Email->address()
                    . "! It's a local address! Move this Tickets!";
            }
        }
    }

    my %ArticleParam = ();

    # run compose modules
    if ( ref( $Self->{ConfigObject}->Get('Ticket::Frontend::ArticleComposeModule') ) eq 'HASH' ) {
        my %Jobs = %{ $Self->{ConfigObject}->Get('Ticket::Frontend::ArticleComposeModule') };
        for my $Job ( sort keys %Jobs ) {

            # load module
            if ( !$Self->{MainObject}->Require( $Jobs{$Job}->{Module} ) ) {
                return $Self->{LayoutObject}->FatalError();
            }
            my $Object = $Jobs{$Job}->{Module}->new( %{$Self}, Debug => $Self->{Debug}, );

            # get params
            for ( $Object->Option( %GetParam, Config => $Jobs{$Job} ) ) {
                $GetParam{$_} = $Self->{ParamObject}->GetParam( Param => $_ );
            }

            # run module
            $Object->Run( %GetParam, Config => $Jobs{$Job} );

            # ticket params
            %ArticleParam = (
                %ArticleParam,
                $Object->ArticleOption( %GetParam, Config => $Jobs{$Job} ),
            );

            # get errors
            %Error = (
                %Error,
                $Object->Error( %GetParam, Config => $Jobs{$Job} ),
            );
        }
    }

    # check if there is an error
    if (%Error) {
        my $QueueID = $Self->{TicketObject}->TicketQueueID( TicketID => $Self->{TicketID} );
        my $Output = $Self->{LayoutObject}->Header( Value => $Tn );
        $Output .= $Self->_Mask(
            TicketNumber => $Tn,
            TicketID     => $Self->{TicketID},
            QueueID      => $QueueID,
            NextStates   => $Self->_GetNextStates(),
            Errors       => \%Error,
            Attachments  => \@Attachments,
            %TicketFreeTextHTML,
            %TicketFreeTimeHTML,
            %GetParam,
        );
        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }

    # replace <OTRS_TICKET_STATE> with next ticket state name
    if ($NextState) {
        $GetParam{Body} =~ s/(&lt;|<)OTRS_TICKET_STATE(&gt;|>)/$NextState/g;
    }

    # get pre loaded attachments
    my @AttachmentData = $Self->{UploadCachObject}->FormIDGetAllFilesData(
        FormID => $GetParam{FormID},
    );

    # get submit attachment
    my %UploadStuff = $Self->{ParamObject}->GetUploadAll(
        Param  => 'file_upload',
        Source => 'String',
    );
    if (%UploadStuff) {
        push @AttachmentData, \%UploadStuff;
    }

    my $MimeType = 'text/plain';
    if ( $Self->{ConfigObject}->Get('Frontend::RichText') ) {
        $MimeType = 'text/html';

        # remove unused inline images
        my @NewAttachmentData = ();
        REMOVEINLINE:
        for my $Attachment (@AttachmentData) {
            my $ContentID = $Attachment->{ContentID};
            if ( $ContentID && ( $Attachment->{ContentType} =~ /image/i ) ) {
                my $ContentIDHTMLQuote = $Self->{LayoutObject}->Ascii2Html(
                    Text => $ContentID,
                );
                next REMOVEINLINE if $GetParam{Body} !~ /(\Q$ContentIDHTMLQuote\E|\Q$ContentID\E)/i;
            }

            # remember inline images and normal attachments
            push @NewAttachmentData, \%{$Attachment};
        }
        @AttachmentData = @NewAttachmentData;

        # verify html document
        $GetParam{Body} = $Self->{LayoutObject}->RichTextDocumentComplete(
            String => $GetParam{Body},
        );
    }

    # send email
    my $To = '';
    for my $Key (qw(To Cc Bcc)) {
        next if !$GetParam{$Key};
        if ($To) {
            $To .= ', ';
        }
        $To .= $GetParam{$Key}
    }
    my $ArticleID = $Self->{TicketObject}->ArticleSend(
        ArticleTypeID  => $Self->{GetParam}->{ArticleTypeID},
        SenderType     => 'agent',
        TicketID       => $Self->{TicketID},
        HistoryType    => 'Forward',
        HistoryComment => "\%\%$To",
        From           => $GetParam{From},
        To             => $GetParam{To},
        Cc             => $GetParam{Cc},
        Bcc            => $GetParam{Bcc},
        Subject        => $GetParam{Subject},
        UserID         => $Self->{UserID},
        Body           => $GetParam{Body},
        InReplyTo      => $GetParam{InReplyTo},
        References     => $GetParam{References},
        Charset        => $Self->{LayoutObject}->{UserCharset},
        MimeType       => $MimeType,
        Attachment     => \@AttachmentData,
        %ArticleParam,
    );

    # error page
    if ( !$ArticleID ) {
        return $Self->{LayoutObject}->ErrorScreen( Comment => 'Please contact the admin.', );
    }

    # time accounting
    if ( $GetParam{TimeUnits} ) {
        $Self->{TicketObject}->TicketAccountTime(
            TicketID  => $Self->{TicketID},
            ArticleID => $ArticleID,
            TimeUnit  => $GetParam{TimeUnits},
            UserID    => $Self->{UserID},
        );
    }

    # update ticket free text
    for ( 1 .. 16 ) {
        my $FreeKey   = $Self->{ParamObject}->GetParam( Param => "TicketFreeKey$_" );
        my $FreeValue = $Self->{ParamObject}->GetParam( Param => "TicketFreeText$_" );
        if ( defined $FreeKey && defined $FreeValue ) {
            $Self->{TicketObject}->TicketFreeTextSet(
                Key      => $FreeKey,
                Value    => $FreeValue,
                Counter  => $_,
                TicketID => $Self->{TicketID},
                UserID   => $Self->{UserID},
            );
        }
    }

    # set ticket free time
    for ( 1 .. 6 ) {
        if (
            defined $GetParam{ 'TicketFreeTime' . $_ . 'Year' }
            && defined $GetParam{ 'TicketFreeTime' . $_ . 'Month' }
            && defined $GetParam{ 'TicketFreeTime' . $_ . 'Day' }
            && defined $GetParam{ 'TicketFreeTime' . $_ . 'Hour' }
            && defined $GetParam{ 'TicketFreeTime' . $_ . 'Minute' }
            )
        {

            # set time stamp to NULL if field is not used/checked
            if ( !$GetParam{ 'TicketFreeTime' . $_ . 'Used' } ) {
                $GetParam{ 'TicketFreeTime' . $_ . 'Year' }   = 0;
                $GetParam{ 'TicketFreeTime' . $_ . 'Month' }  = 0;
                $GetParam{ 'TicketFreeTime' . $_ . 'Day' }    = 0;
                $GetParam{ 'TicketFreeTime' . $_ . 'Hour' }   = 0;
                $GetParam{ 'TicketFreeTime' . $_ . 'Minute' } = 0;
            }

            # set free time
            $Self->{TicketObject}->TicketFreeTimeSet(
                %GetParam,
                Prefix   => 'TicketFreeTime',
                TicketID => $Self->{TicketID},
                Counter  => $_,
                UserID   => $Self->{UserID},
            );
        }
    }

    # set state
    $Self->{TicketObject}->StateSet(
        TicketID  => $Self->{TicketID},
        ArticleID => $ArticleID,
        State     => $NextState,
        UserID    => $Self->{UserID},
    );

    # should I set an unlock?
    if ( $StateData{TypeName} =~ /^close/i ) {
        $Self->{TicketObject}->LockSet(
            TicketID => $Self->{TicketID},
            Lock     => 'unlock',
            UserID   => $Self->{UserID},
        );
    }

    # set pending time
    elsif ( $StateData{TypeName} =~ /^pending/i ) {

        # set pending time
        $Self->{TicketObject}->TicketPendingTimeSet(
            UserID   => $Self->{UserID},
            TicketID => $Self->{TicketID},
            %GetParam,
        );
    }

    # remove pre submited attachments
    $Self->{UploadCachObject}->FormIDRemove( FormID => $GetParam{FormID} );

    # redirect
    if ( $StateData{TypeName} =~ /^close/i ) {
        return $Self->{LayoutObject}->Redirect( OP => $Self->{LastScreenOverview} );
    }
    else {
        return $Self->{LayoutObject}->Redirect(
            OP => "Action=AgentTicketZoom&TicketID=$Self->{TicketID}&ArticleID=$ArticleID"
        );
    }
}

sub _GetNextStates {
    my ( $Self, %Param ) = @_;

    # get next states
    my %NextStates = $Self->{TicketObject}->StateList(
        Action   => $Self->{Action},
        TicketID => $Self->{TicketID},
        UserID   => $Self->{UserID},
    );
    return \%NextStates;
}

sub _Mask {
    my ( $Self, %Param ) = @_;

    # build next states string
    my %State = ();
    if ( !$Param{ComposeStateID} ) {
        $State{Selected} = $Self->{Config}->{StateDefault};
    }
    else {
        $State{SelectedID} = $Param{ComposeStateID};
    }

    $Param{NextStatesStrg} = $Self->{LayoutObject}->OptionStrgHashRef(
        Data => $Param{NextStates},
        Name => 'ComposeStateID',
        %State,
    );
    my %ArticleTypes         = ();
    my @ArticleTypesPossible = @{ $Self->{Config}->{ArticleTypes} };
    for (@ArticleTypesPossible) {
        $ArticleTypes{ $Self->{TicketObject}->ArticleTypeLookup( ArticleType => $_ ) } = $_;
    }
    if ( $Self->{GetParam}->{ArticleTypeID} ) {
        $Param{ArticleTypesStrg} = $Self->{LayoutObject}->OptionStrgHashRef(
            Data       => \%ArticleTypes,
            Name       => 'ArticleTypeID',
            SelectedID => $Self->{GetParam}->{ArticleTypeID},
        );
    }
    else {
        $Param{ArticleTypesStrg} = $Self->{LayoutObject}->OptionStrgHashRef(
            Data     => \%ArticleTypes,
            Name     => 'ArticleTypeID',
            Selected => $Self->{Config}->{ArticleTypeDefault},
        );
    }

    # prepare errors!
    if ( $Param{Errors} ) {
        for ( keys %{ $Param{Errors} } ) {
            $Param{$_} = "* " . $Self->{LayoutObject}->Ascii2Html( Text => $Param{Errors}->{$_} );
        }
    }

    # pending data string
    $Param{PendingDateString} = $Self->{LayoutObject}->BuildDateSelection(
        %Param,
        Format => 'DateInputFormatLong',
        DiffTime => $Self->{ConfigObject}->Get('Ticket::Frontend::PendingDiffTime') || 0,
    );

    # ticket free text
    for my $Count ( 1 .. 16 ) {
        if ( $Self->{Config}->{'TicketFreeText'}->{$Count} ) {
            $Self->{LayoutObject}->Block(
                Name => 'TicketFreeText',
                Data => {
                    TicketFreeKeyField  => $Param{ 'TicketFreeKeyField' . $Count },
                    TicketFreeTextField => $Param{ 'TicketFreeTextField' . $Count },
                    %Param,
                },
            );
            $Self->{LayoutObject}->Block(
                Name => 'TicketFreeText' . $Count,
                Data => { %Param, Count => $Count, },
            );
        }
    }
    for my $Count ( 1 .. 6 ) {
        if ( $Self->{Config}->{'TicketFreeTime'}->{$Count} ) {
            $Self->{LayoutObject}->Block(
                Name => 'TicketFreeTime',
                Data => {
                    TicketFreeTimeKey => $Self->{ConfigObject}->Get( 'TicketFreeTimeKey' . $Count ),
                    TicketFreeTime    => $Param{ 'TicketFreeTime' . $Count },
                    Count             => $Count,
                },
            );
            $Self->{LayoutObject}->Block(
                Name => 'TicketFreeTime' . $Count,
                Data => { %Param, Count => $Count, },
            );
        }
    }

    # show time accounting box
    if ( $Self->{ConfigObject}->Get('Ticket::Frontend::AccountTime') ) {
        $Self->{LayoutObject}->Block(
            Name => 'TimeUnitsJs',
            Data => \%Param,
        );
        $Self->{LayoutObject}->Block(
            Name => 'TimeUnits',
            Data => \%Param,
        );
    }

    # show spell check
    if ( $Self->{LayoutObject}->{BrowserSpellChecker} ) {
        $Self->{LayoutObject}->Block(
            Name => 'SpellCheck',
            Data => {},
        );
    }

    # show address book
    if ( $Self->{LayoutObject}->{BrowserJavaScriptSupport} ) {
        $Self->{LayoutObject}->Block(
            Name => 'AddressBook',
            Data => {},
        );
    }

    # show attachments
    for my $DataRef ( @{ $Param{Attachments} } ) {
        if (
            $DataRef->{ContentID}
            && $Self->{ConfigObject}->Get('Frontend::RichText')
            && ( $DataRef->{ContentType} =~ /image/i )
            )
        {
            next;
        }

        $Self->{LayoutObject}->Block(
            Name => 'Attachment',
            Data => $DataRef,
        );
    }

    # java script check for required free text fields by form submit
    for my $Key ( keys %{ $Self->{Config}->{TicketFreeText} } ) {
        if ( $Self->{Config}->{TicketFreeText}->{$Key} == 2 ) {
            $Self->{LayoutObject}->Block(
                Name => 'TicketFreeTextCheckJs',
                Data => {
                    TicketFreeTextField => "TicketFreeText$Key",
                    TicketFreeKeyField  => "TicketFreeKey$Key",
                },
            );
        }
    }

    # java script check for required free time fields by form submit
    for my $Key ( keys %{ $Self->{Config}->{TicketFreeTime} } ) {
        if ( $Self->{Config}->{TicketFreeTime}->{$Key} == 2 ) {
            $Self->{LayoutObject}->Block(
                Name => 'TicketFreeTimeCheckJs',
                Data => {
                    TicketFreeTimeCheck => 'TicketFreeTime' . $Key . 'Used',
                    TicketFreeTimeField => 'TicketFreeTime' . $Key,
                    TicketFreeTimeKey   => $Self->{ConfigObject}->Get( 'TicketFreeTimeKey' . $Key ),
                },
            );
        }
    }

    # add rich text editor
    if ( $Self->{ConfigObject}->Get('Frontend::RichText') ) {
        $Self->{LayoutObject}->Block(
            Name => 'RichText',
            Data => \%Param,
        );
    }

    # create & return output
    return $Self->{LayoutObject}->Output( TemplateFile => 'AgentTicketForward', Data => \%Param );
}

1;
