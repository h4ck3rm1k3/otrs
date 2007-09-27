# --
# Kernel/Modules/AdminSupport.pm - show support information
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: AdminSupport.pm,v 1.4 2007/09/27 10:02:58 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::Modules::AdminSupport;

use strict;
use Kernel::System::Support;

use vars qw($VERSION);
$VERSION = '$Revision: 1.4 $';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

sub new {
    my $Type = shift;
    my %Param = @_;

    # allocate new hash for object
    my $Self = {};
    bless ($Self, $Type);

    foreach (keys %Param) {
        $Self->{$_} = $Param{$_};
    }

    # check needed Objects
    foreach (qw(ParamObject LayoutObject LogObject ConfigObject TimeObject)) {
        if (!$Self->{$_}) {
            $Self->{LayoutObject}->FatalError(Message => "Got no $_!");
        }
    }
    $Self->{SupportObject} = Kernel::System::Support->new(%Param);

    return $Self;
}

sub Run {
    my $Self = shift;
    my %Param = @_;
    my $ConfigHash = {};

    # create config hash reference
    $Self->{SupportObject}->SupportConfigHashGet(
        ConfigHash => $ConfigHash,
    );

    # ------------------------------------------------------------ #
    # Get required information
    # ------------------------------------------------------------ #

    if ($Self->{Subaction} eq 'GetRequiredInfo') {
        # first level Hashref (each module name)
        my $ContentCheck = '0';
        foreach my $ConfigModule (sort keys %{$ConfigHash}) {
            if (!$ConfigHash->{$ConfigModule}->[0]) {
                next;
            }
            else{
                $ContentCheck = '1';
            }
        }
        if ($ContentCheck eq '1') {
            # create & return output
            my $Output = $Self->{LayoutObject}->Header();
            $Output .= $Self->{LayoutObject}->NavigationBar();

            $Self->{LayoutObject}->Block(
                Name => 'Required',
            );
            # first level Hashref (each module name)
            foreach my $ConfigModule (sort keys %{$ConfigHash}) {
                if (!$ConfigHash->{$ConfigModule}->[0]) {
                    next;
                }
                $Self->{LayoutObject}->Block(
                    Name => 'RequiredInfo',
                    Data => {
                        ConfigModule => $ConfigModule,
                    },
                );
                # second level array reference (each module)
                foreach my $ConfigHashRow (@{$ConfigHash->{$ConfigModule}}) {
                    $Self->{LayoutObject}->Block(
                        Name => 'RequiredInfoRow',
                    );
                    # create a new textfield
                    if ($ConfigHashRow->{Input}->{Type} eq "Text") {
                        $Self->{LayoutObject}->Block(
                            Name => 'RequiredInfoRowText',
                            Data => {
                                Key => $ConfigModule . '::' . $ConfigHashRow->{Key},
                                Name => $ConfigHashRow->{Name},
                                Value => $ConfigHashRow->{Value} || '',
                                Size => $ConfigHashRow->{Input}->{Size} || '40',
                                Description => $ConfigHashRow->{Description} || '',
                            },
                        );
                    }
                    # create a new dropdown field
                    elsif ($ConfigHashRow->{Input}->{Type} eq "Select") {
                        my $SelectStrg = $Self->{LayoutObject}->BuildSelection(
                            Data => $ConfigHashRow->{Input}->{Data} || {},
                            Name => $ConfigModule . '::' . $ConfigHashRow->{Key},
                        );
                        $Self->{LayoutObject}->Block(
                            Name => 'RequiredInfoRowSelect',
                            Data => {
                                Name => $ConfigHashRow->{Name},
                                Description => $ConfigHashRow->{Description} || '',
                                SelectStrg => $SelectStrg,
                            },
                        );
                    }
                }
            }
            $Output .= $Self->{LayoutObject}->Output(
                TemplateFile => 'AdminSupport',
                Data => { },
            );
            $Output .= $Self->{LayoutObject}->Footer();
            return $Output;
        }
        else {
            # next side...
            $Self->{Subaction} = 'Confidential';
        }
    }

    # ------------------------------------------------------------ #
    # Confidential and SupportID
    # ------------------------------------------------------------ #

    if ($Self->{Subaction} eq 'Confidential') {
        # create & return output
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        $Self->{LayoutObject}->Block(
            Name => 'Confidential',
        );
        # create hidden fields, cause we need the information again.
        foreach my $ConfigModule (keys %{$ConfigHash}) {
            foreach my $ConfigHashRow (@{$ConfigHash->{$ConfigModule}}) {
                my $Value = $Self->{ParamObject}->GetParam(Param => $ConfigModule . '::' . $ConfigHashRow->{Key});

                $Self->{LayoutObject}->Block(
                    Name => 'ConfidentialHidden',
                    Data => {
                        Name => $ConfigModule . '::' . $ConfigHashRow->{Key},
                        Value => $Value || '',
                    },
                );
            }
        }

        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminSupport',
            Data => { },
        );
        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # UploadSupportInfo
    # ------------------------------------------------------------ #

    elsif ($Self->{Subaction} eq 'UploadSupportInfo') {
        my $DataHash = {};
        my $InputHash = {};

        # create & return output
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        $Self->{LayoutObject}->Block(
            Name => 'Confidential',
        );

        # get hidden fields, cause we need the information again.
        foreach my $ConfigModule (keys %{$ConfigHash}) {
            my $ModuleInputData = {};
            foreach my $ConfigHashRow (@{$ConfigHash->{$ConfigModule}}) {
                $ModuleInputData->{$ConfigHashRow->{Key}} =
                    $Self->{ParamObject}->GetParam(Param => $ConfigModule . '::' . $ConfigHashRow->{Key}) || '';
            }
            $InputHash->{$ConfigModule} = $ModuleInputData;
        }
        # create data hash reference
        $Self->{SupportObject}->SupportInfoGet(
            DataHash => $DataHash,
            InputHash => $InputHash,
        );

        my $SupportString = $Self->{SupportObject}->CreatePackageToSend(
            DataHash => $DataHash,
        );

        # if the button send becomes the submit
        if ($Self->{ParamObject}->GetParam(Param => "Send")) {
            my ($s,$m,$h, $D,$M,$Y, $wd,$yd,$dst) = $Self->{TimeObject}->SystemTime2Date(
            SystemTime => $Self->{TimeObject}->SystemTime(),
            );
            $M = sprintf("%02d", $M);
            $D = sprintf("%02d", $D);
            $h = sprintf("%02d", $h);
            $m = sprintf("%02d", $m);
            my $SendMessage;
            if (length($SupportString) < 9961472) {
                # send info to ((otrs))
                $SendMessage = $Self->{SupportObject}->SupportSendInfo(
                    SupportString => $SupportString,
                    SupportID => "SupportInfo_"."$Y-$M-$D"."_$h-$m"."_"."Support-ID_".$Self->{ParamObject}->GetParam(Param => "SupportID"),
                );
                $Output .= $Self->{LayoutObject}->Notify(
                    Priority => 'warning',
                    Info => $SendMessage,
                );
            }
            else {
                $Output .= $Self->{LayoutObject}->Notify(
                    Priority => 'warning',
                    Info => 'Can\'t send email to the ((otrs)) support team!'."\n\n".
                        "You will found the otrs system information package at\n".
                        "If you would like to use OTRS support services please send the package to support\@otrs.com or call\n".
                        "our support team per phone to review the next step\n\n".
                        " More about OTRS support or face-to-face contact information you will found at\n".
                        'http://www.otrs.com/'."\n\n",
                );
            }
        }
        # if the button download becomes the submit
        elsif ($Self->{ParamObject}->GetParam(Param => "Download")) {
            my ($s,$m,$h, $D,$M,$Y, $wd,$yd,$dst) = $Self->{TimeObject}->SystemTime2Date(
            SystemTime => $Self->{TimeObject}->SystemTime(),
            );
            $M = sprintf("%02d", $M);
            $D = sprintf("%02d", $D);
            $h = sprintf("%02d", $h);
            $m = sprintf("%02d", $m);
            # return file
            return $Self->{LayoutObject}->Attachment(
                ContentType => 'application/octet-stream',
                Content => $SupportString,
                Filename => "SupportInfo"."_"."$Y-$M-$D"."_$h-$m",
                Type => 'attached',
            );
        }

        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminSupport',
            Data => { },
        );
        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # overview
    # ------------------------------------------------------------ #

    else {
        my $DataHash = {};
        # create data hash reference
        $Self->{SupportObject}->AdminChecksGet(
            DataHash => $DataHash,
        );

        # create & return output
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        $Self->{LayoutObject}->Block(
            Name => 'Overview',
        );

        foreach my $Module (sort keys %{$DataHash}) {
            $Self->{LayoutObject}->Block(
                Name => 'OverviewModule',
                Data => {
                    Module => $Module,
                },
            );
            # check css rotatory
            my $CssClass;
            foreach my $RowHash (@{$DataHash->{$Module}}) {
                # set output class
                if ($CssClass && $CssClass eq 'searchactive') {
                    $CssClass = 'searchpassive';
                }
                else {
                    $CssClass = 'searchactive';
                }
                my $FontColor = "red";
                if ($RowHash->{Check} eq "OK") {
                    $FontColor = "green";
                }
                elsif ($RowHash->{Check} eq "Critical") {
                    $FontColor = "orange";
                }
                if ($RowHash->{Description}) {
                    $RowHash->{Description} = $Self->{LayoutObject}->Ascii2Html(
                        Text => $RowHash->{Description},
                        HTMLResultMode => '1',
                    );
                }
                if ($RowHash->{Comment}) {
                    $RowHash->{Comment} = $Self->{LayoutObject}->Ascii2Html(
                        Text => $RowHash->{Comment},
                        HTMLResultMode => '1',
                    );
                }
                # create new block with rotatory css
                $Self->{LayoutObject}->Block(
                    Name => 'OverviewModuleRow',
                    Data => {
                        %{$RowHash},
                        CssClass => $CssClass,
                        FontColor => $FontColor,
                    },
                );
            }
        }
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminSupport',
            Data => { },
        );
        $Output .= $Self->{LayoutObject}->Footer();
        return $Output;
    }
}

1;
