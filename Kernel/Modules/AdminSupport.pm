# --
# Kernel/Modules/AdminSupport.pm - show support information
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: AdminSupport.pm,v 1.21 2009/08/27 19:45:11 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminSupport;

use strict;
use warnings;

use Kernel::System::Support;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.21 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed Objects
    for (
        qw(ParamObject LayoutObject LogObject ConfigObject TimeObject MainObject DBObject EncodeObject)
        )
    {
        if ( !$Self->{$_} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        }
    }

    $Self->{UserObject} = Kernel::System::User->new(
        ConfigObject => $Self->{ConfigObject},
        EncodeObject => $Self->{EncodeObject},
        LogObject    => $Self->{LogObject},
        MainObject   => $Self->{MainObject},
        TimeObject   => $Self->{TimeObject},
        DBObject     => $Self->{DBObject},
    );

    $Self->{SupportObject} = Kernel::System::Support->new(%Param);

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my %User = $Self->{UserObject}->GetUserData(
        UserID => $Self->{UserID},
        Cached => 1,
    );
    my $SenderAdress = "";

    if ( $Self->{ConfigObject}->Get('Support::SenderEmail') ) {
        $SenderAdress = $Self->{ConfigObject}->Get('Support::SenderEmail');
    }
    elsif ( $User{UserEmail} && $User{UserEmail} !~ /root\@localhost/ ) {
        $SenderAdress = $User{UserEmail};
    }
    elsif (
        $Self->{ConfigObject}->Get('AdminEmail')
        && $Self->{ConfigObject}->Get('AdminEmail')
        !~ /root\@localhost/
        && $Self->{ConfigObject}->Get('AdminEmail') !~ /admin\@example.com/
        )
    {
        $SenderAdress = $Self->{ConfigObject}->Get('AdminEmail');
    }

    # ------------------------------------------------------------ #
    # Confidential
    # ------------------------------------------------------------ #

    if ( $Self->{Subaction} eq 'Confidential' ) {

        # create & return output
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        $Self->{LayoutObject}->Block(
            Name => 'Confidential',
            Data => {},
        );

        if ( $User{UserLanguage} && $User{UserLanguage} =~ /de/ ) {
            $Self->{LayoutObject}->Block(
                Name => 'ConfidentialContentDE',
                Data => {},
            );
        }
        else {
            $Self->{LayoutObject}->Block(
                Name => 'ConfidentialContentEN',
                Data => {},
            );
        }

        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminSupport',
            Data         => {},
        );
        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # Sender Information
    # ------------------------------------------------------------ #

    elsif ( $Self->{Subaction} eq 'SenderInformation' ) {

        # create & return output
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        $Self->{LayoutObject}->Block(
            Name => 'SenderInformation',
            Data => {
                SenderAdress     => $SenderAdress,
                SenderSalutation => $User{UserSalutation},
                SenderName       => $User{UserFirstname} . ' ' . $User{UserLastname},
            },
        );

        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminSupport',
            Data         => {},
        );
        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # UploadSupportInfo
    # ------------------------------------------------------------ #

    elsif ( $Self->{Subaction} eq 'Submit' ) {

        # get params
        my %CustomerInfo;
        for my $Key (qw(Sender Company Salutation Name Street Zip City Phone SendInfo BugzillaID)) {
            $CustomerInfo{$Key} = $Self->{ParamObject}->GetParam( Param => $Key );
        }

        # if the button send becomes the submit
        if ( $Self->{ParamObject}->GetParam( Param => 'Send' ) ) {

            # create & return output
            my $Output = $Self->{LayoutObject}->Header();
            $Output .= $Self->{LayoutObject}->NavigationBar();

            $Self->{LayoutObject}->Block(
                Name => 'SenderInformation',
                Data => {
                    SenderAdress     => $SenderAdress,
                    SenderSalutation => $User{UserSalutation},
                    SenderName       => $User{UserFirstname} . ' ' . $User{UserLastname},
                },
            );

            my $SendMessage = $Self->{SupportObject}->SendInfo(
                CustomerInfo => \%CustomerInfo,
            );
            if ($SendMessage) {
                $Output .= $Self->{LayoutObject}->Notify(
                    Priority => 'warning',
                    Info     => "Sent to ((otrs))!",
                );
            }
            else {
                $Output .= $Self->{LayoutObject}->Notify(
                    Priority => 'warning',
                    Info     => 'Can\'t send email to the ((otrs)) support team!' . "\n\n"
                        . "You will found the otrs system information package at\n"
                        . "If you would like to use OTRS support services please send the package to support\@otrs.com or call\n"
                        . "our support team per phone to review the next step\n\n"
                        . " More about OTRS support or face-to-face contact information you will found at\n"
                        . 'http://www.otrs.com/' . "\n\n",
                );
            }

            $Output .= $Self->{LayoutObject}->Output(
                TemplateFile => 'AdminSupport',
                Data         => {},
            );
            $Output .= $Self->{LayoutObject}->Footer();
            return $Output;
        }

        # if the button download becomes the submit
        else {
            my ( $Content, $Filename ) = $Self->{SupportObject}->Download(
                %CustomerInfo,
            );

            # return file
            return $Self->{LayoutObject}->Attachment(
                ContentType => 'application/octet-stream',
                Content     => ${$Content},
                Filename    => $Filename,
                Type        => 'attached',
            );
        }
    }

    # ------------------------------------------------------------ #
    # SQL bench
    # ------------------------------------------------------------ #

    elsif ( $Self->{Subaction} eq 'BenchmarkSQL' ) {

        my $Insert = $Self->{ParamObject}->GetParam( Param => 'Insert' ) || 10000;
        my $Update = $Self->{ParamObject}->GetParam( Param => 'Update' ) || 10000;
        my $Select = $Self->{ParamObject}->GetParam( Param => 'Select' ) || 10000;
        my $Mode   = $Self->{ParamObject}->GetParam( Param => 'Mode' );

        my %BenchTest = $Self->{SupportObject}->Benchmark(

            Insert => $Insert,
            Update => $Update,
            Select => $Select,
            Mode   => $Mode,
        );

        $Self->{LayoutObject}->Block(
            Name => 'BenchmarkResult',
            Data => {
                %BenchTest,
                Head => 'SQL',
            },
        );
        $Self->{LayoutObject}->Block(
            Name => 'BenchmarkResultRow',
            Data => {
                Key     => 'Insert Time',
                Time    => "$BenchTest{InsertTime} s $BenchTest{InsertMood}",
                Value   => ( $Insert * $Mode ),
                Comment => $BenchTest{InsertComment} || '',
            },
        );

        $Self->{LayoutObject}->Block(
            Name => 'BenchmarkResultRow',
            Data => {
                Key     => 'Update Time',
                Time    => "$BenchTest{UpdateTime} s $BenchTest{UpdateMood}",
                Value   => ( $Update * $Mode ),
                Comment => $BenchTest{UpdateComment} || '',
            },
        );

        $Self->{LayoutObject}->Block(
            Name => 'BenchmarkResultRow',
            Data => {
                Key     => 'Select Time',
                Time    => "$BenchTest{SelectTime} s $BenchTest{SelectMood}",
                Value   => ( $Select * $Mode ),
                Comment => $BenchTest{SelectComment} || '',
            },
        );

        $Self->{LayoutObject}->Block(
            Name => 'BenchmarkResultRow',
            Data => {
                Key     => 'Delete Time',
                Time    => "$BenchTest{DeleteTime} s $BenchTest{DeleteMood}",
                Value   => ( $Insert * $Mode ),
                Comment => $BenchTest{DeleteComment} || '',
            },
        );
        $Self->{LayoutObject}->Block(
            Name => 'BenchmarkResultRow',
            Data => {
                Key   => 'Multiplier',
                Value => "* $Mode",
            },
        );
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminSupport',
            Data         => \%BenchTest,
        );
        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # overview
    # ------------------------------------------------------------ #

    else {

        # create data hash reference
        my $DataHash = $Self->{SupportObject}->AdminChecksGet();
        $Param{ModeStrg} = $Self->{LayoutObject}->OptionStrgHashRef(
            Data => {
                1 => '1 * Normal (ca. 25 sec)',
                3 => '3 * High   (ca. 75 sec)',
                5 => '5 * Heavy  (ca. 125 sec)',
            },
            Name => 'Mode',
        );

        # create & return output
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        $Self->{LayoutObject}->Block(
            Name => 'Overview',
            Data => \%Param,
        );
        for my $Module ( sort keys %{$DataHash} ) {
            $Self->{LayoutObject}->Block(
                Name => 'OverviewModule',
                Data => { Module => $Module, },
            );

            # check css rotatory
            my $CssClass;
            for my $RowHash ( @{ $DataHash->{$Module} } ) {

                # set output class
                if ( $CssClass && $CssClass eq 'searchactive' ) {
                    $CssClass = 'searchpassive';
                }
                else {
                    $CssClass = 'searchactive';
                }
                my $FontColor = 'red';
                if ( $RowHash->{Check} ) {
                    if ( $RowHash->{Check} eq 'OK' ) {
                        $FontColor = 'green';
                    }
                    elsif ( $RowHash->{Check} eq 'Info' ) {
                        $FontColor = 'darkblue';
                    }
                    elsif ( $RowHash->{Check} eq 'Critical' ) {
                        $FontColor = 'orange';
                    }
                }

                # create new block with rotatory css
                $Self->{LayoutObject}->Block(
                    Name => 'OverviewModuleRow',
                    Data => {
                        %{$RowHash},
                        CssClass  => $CssClass,
                        FontColor => $FontColor,
                    },
                );
            }
        }
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminSupport',
            Data         => {},
        );
        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }
}

1;
