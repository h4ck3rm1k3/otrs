# --
# Kernel/Modules/PictureUpload.pm - get picture uploads
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: PictureUpload.pm,v 1.4 2009/04/06 16:27:28 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Modules::PictureUpload;

use strict;
use warnings;

use URI::Escape;
use Kernel::System::Web::UploadCache;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for (qw(ParamObject DBObject TicketObject LayoutObject LogObject ConfigObject)) {
        if ( !$Self->{$_} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        }
    }

    # create needed objects
    $Self->{UploadCacheObject} = Kernel::System::Web::UploadCache->new(%Param);

    # get params
    $Self->{FormID} = $Self->{ParamObject}->GetParam( Param => 'FormID' );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # prepare header
    my $Output = "Content-Type: text/html; charset=" . $Self->{ConfigObject}->Get('DefaultCharset') . ";\n\n";

    # check param
    if ( !$Self->{FormID} ) {
        $Output .= "{status:'Got no FormID!'}";
        return $Output;
    }

    # show existing file
    my $Filename = $Self->{ParamObject}->GetParam( Param => 'Filename' );

    if ( $Filename ) {

        # uri escape filename
        if ( $Self->{ConfigObject}->Get('DefaultCharset') eq 'utf-8') {
            $Filename = uri_escape_utf8( $Filename )  ;
        }
        else {
            $Filename = uri_escape( $Filename );
        }

        # display picture in HTML editor
        my @AttachmentData = $Self->{UploadCacheObject}->FormIDGetAllFilesData(
            FormID => $Self->{FormID},
        );
        ATTACHMENTDATA:
        for my $Ref ( @AttachmentData ) {
            next ATTACHMENTDATA if $Ref->{Filename} ne $Filename;
            return $Self->{LayoutObject}->Attachment(
                Type => 'inline',
                %{ $Ref },
            );
        }
        $Output .= "{status:'File does not exist: $Filename !'}";
        return $Output;
    }

    # upload new picture
    my %File = $Self->{ParamObject}->GetUploadAll(
        Param  => 'file_name',
        Source => 'string',
    );
    if ( !%File ) {
        $Output .= "{status:'Got no File!'}";
        return $Output;
    }

    # uri escape filename
    if ( $Self->{ConfigObject}->Get('DefaultCharset') eq 'utf-8') {
        $File{Filename} = uri_escape_utf8( $File{Filename} )  ;
    }
    else {
        $File{Filename} = uri_escape( $File{Filename} );
    }

    # check image type
    if ($File{Filename} !~ /\.(png|gif|jpg|jpeg)$/i) {
        $Output .= "{status:'Only gif, jp(e)g and png images allowed!'}";
        return $Output;
    }

    # if filename exists already try to rename it
    my @AttachmentMeta = $Self->{UploadCacheObject}->FormIDGetAllFilesMeta(
        FormID => $Self->{FormID},
    );
    my $TmpFilename = $File{Filename};
    my $TmpSuffix = 0;
    NEWNAME:
    for ( 1 ) {
        for my $Ref (reverse @AttachmentMeta) {
            if ($TmpFilename eq $Ref->{Filename}) {
                # name exists -> change
                ++$TmpSuffix;
                if ( $File{Filename} =~ /^(.*)\.(.+?)$/ ) {
                    $TmpFilename = "$1-$TmpSuffix.$2";
                }
                else {
                    $TmpFilename = "$File{Filename}-$TmpSuffix";
                }
                redo NEWNAME;
            }
        }
        last NEWNAME;
    }

    # store file in UploadCache
    $Self->{UploadCacheObject}->FormIDAddFile(
        FormID      => $Self->{FormID},
        Filename    => $TmpFilename,
        Content     => $File{Content},
        ContentType => "$File{ContentType}; name=\"$TmpFilename\"",
    );

    # check if session data is needed for URL
    my $Session = '';
    if ( !$Self->{LayoutObject}->{SessionIDCookie} ) {
        $Session = '&' . $Self->{LayoutObject}->{SessionName} . '='
            . $Self->{LayoutObject}->{SessionID};
    }

    # return file URL
    $Output .= "{status:'UPLOADED', image_url:'$Self->{LayoutObject}->{Baselink}"
        . "Action=PictureUpload&FormID=$Self->{FormID}&Filename=$TmpFilename$Session'}";

    return $Output;
}

1;
