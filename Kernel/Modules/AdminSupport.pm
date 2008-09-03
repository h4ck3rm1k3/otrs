# --
# Kernel/Modules/AdminSupport.pm - show support information
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: AdminSupport.pm,v 1.15 2008/09/03 15:31:43 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Modules::AdminSupport;

use strict;
use warnings;

use Kernel::System::Support;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.15 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );
    for ( keys %Param ) {
        $Self->{$_} = $Param{$_};
    }

    # check needed Objects
    for (qw(ParamObject LayoutObject LogObject ConfigObject TimeObject)) {
        if ( !$Self->{$_} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        }
    }
    $Self->{SupportObject} = Kernel::System::Support->new(%Param);

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # ------------------------------------------------------------ #
    # Confidential and SupportID
    # ------------------------------------------------------------ #

    if ( $Self->{Subaction} eq 'Confidential' ) {

        # create & return output
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        $Self->{LayoutObject}->Block(
            Name => 'Confidential',
            Data => {},
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
        for my $Key (qw(Sender Company Street Postcode City Phone SendInfo BugzillaID) ) {
            $CustomerInfo{$Key} = $Self->{ParamObject}->GetParam( Param => $Key );
        };

        # if the button send becomes the submit
        if ( $Self->{ParamObject}->GetParam( Param => 'Send' ) ) {

            # create & return output
            my $Output = $Self->{LayoutObject}->Header();
            $Output .= $Self->{LayoutObject}->NavigationBar();

            $Self->{LayoutObject}->Block(
                Name => 'Confidential',
                Data => {},
            );

            my $SendMessage = $Self->{SupportObject}->SendInfo(
                CustomerInfo => \%CustomerInfo,
            );
            if ( $SendMessage ) {
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
            my ($Content, $Filename) = $Self->{SupportObject}->Download(
                %CustomerInfo,
            );

            # return file
            return $Self->{LayoutObject}->Attachment(
                ContentType => 'application/octet-stream',
                Content     => ${ $Content },
                Filename    => $Filename,
                Type        => 'attached',
            );
        }
    }
    # ------------------------------------------------------------ #
    # SQL bench
    # ------------------------------------------------------------ #

    elsif ( $Self->{Subaction} eq 'BenchmarkSQL' ) {
        my $Insert = $Self->{ParamObject}->GetParam(Param => 'Insert') || 10000;
        my $Update = $Self->{ParamObject}->GetParam(Param => 'Update') || 10000;
        my $Select = $Self->{ParamObject}->GetParam(Param => 'Select') || 10000;
        my $Mode = $Self->{ParamObject}->GetParam(Param => 'Mode');
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
        $Self->{LayoutObject}->Block(
            Name => 'BenchmarkResult',
            Data => {
                %Param,
                Head => 'SQL',
            },
        );
        my $InsertTime = ($Param{InsertTime}/$Mode)*(10000/$Insert);
        if ( $InsertTime <= 3 ) {
            $Param{InsertMood} = ':-)';
            $Param{Comment}    = '$Text{"Looks fine!"}',
        }
        elsif ( $InsertTime <= 5 ) {
            $Param{InsertMood} = ':-|';
            $Param{Comment}    = '$Text{"Ok"}';
        }
        else {
            $Param{InsertMood} = ':-(';
            my $ShouldTake  = int( $Mode * 5 );
            $Param{Comment} = '$Text{"Should not take longer the %s on a normal system.", "' . $ShouldTake . 's"}',
        }
        $Self->{LayoutObject}->Block(
            Name => 'BenchmarkResultRow',
            Data => {
                Key     => 'Insert Time',
                Time    => "$Param{InsertTime} s $Param{InsertMood}",
                Value   => ($Insert*$Mode),
                Comment => $Param{Comment} || '',
            },
        );
        my $UpdateTime = ($Param{UpdateTime}/$Mode)*(10000/$Update);
        if ( $UpdateTime <= 5 ) {
            $Param{UpdateMood} = ':-)';
            $Param{Comment} = '$Text{"Looks fine!"}',
        }
        elsif ( $UpdateTime <= 9 ) {
            $Param{UpdateMood} = ':-|';
            $Param{Comment}    = '$Text{"Ok"}';
        }
        else {
            $Param{UpdateMood} = ':-(';
            my $ShouldTake  = int( $Mode * 9 );
            $Param{Comment} = '$Text{"Should not take longer the %s on a normal system.", "' . $ShouldTake . 's"}',
        }
        $Self->{LayoutObject}->Block(
            Name => 'BenchmarkResultRow',
            Data => {
                Key     => 'Update Time',
                Time    => "$Param{UpdateTime} s $Param{UpdateMood}",
                Value   => ($Update*$Mode),
                Comment => $Param{Comment} || '',
            },
        );

        my $SelectTime = ($Param{SelectTime}/$Mode)*(10000/$Select);
        if ( $SelectTime <= 5 ) {
            $Param{SelectMood} = ':-)';
            $Param{Comment} = '$Text{"Looks fine!"}',
        }
        elsif ( $SelectTime <= 6 ) {
            $Param{SelectMood} = ':-|';
            $Param{Comment}    = '$Text{"Ok"}';
        }
        else {
            $Param{SelectMood} = ':-(';
            my $ShouldTake  = int( $Mode * 6 );
            $Param{Comment} = '$Text{"Should not take longer the %s on a normal system.", "' . $ShouldTake . 's"}',
        }
        $Self->{LayoutObject}->Block(
            Name => 'BenchmarkResultRow',
            Data => {
                Key     => 'Select Time',
                Time    => "$Param{SelectTime} s $Param{SelectMood}",
                Value   => ($Select*$Mode),
                Comment => $Param{Comment} || '',
            },
        );

        my $DeleteTime = ($Param{DeleteTime}/$Mode);
        if ( $DeleteTime <= 4 ) {
            $Param{DeleteMood} = ':-)';
            $Param{Comment} = '$Text{"Looks fine!"}',
        }
        elsif ( $DeleteTime <= 5 ) {
            $Param{DeleteMood} = ':-|';
            $Param{Comment}    = '$Text{"Ok"}';
        }
        else {
            $Param{DeleteMood} = ':-(';
            my $ShouldTake  = int( $Mode * 5 );
            $Param{Comment} = '$Text{"Should not take longer the %s on a normal system.", "' . $ShouldTake . 's"}',
        }
        $Self->{LayoutObject}->Block(
            Name => 'BenchmarkResultRow',
            Data => {
                Key     => 'Delete Time',
                Time    => "$Param{DeleteTime} s $Param{DeleteMood}",
                Value   => ($Insert*$Mode),
                Comment => $Param{Comment} || '',
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
            Data         => \%Param,
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
        $Param{'ModeStrg'} = $Self->{LayoutObject}->OptionStrgHashRef(
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

sub _SQLInsert {
    my $Self = shift;
    my $Count = shift;
    my $Mode = shift;
    foreach my $C (1..$Count) {
        foreach my $M (1..$Mode) {
            my $Value1  = "aaa$C-$M";
            my $Value2  = 'bbb';
            $Self->{"DBObject$M"}->Do(
                SQL => 'INSERT INTO bench_test (name_a, name_b) values (?, ?)',
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
                SQL => 'UPDATE bench_test SET name_a = ?, name_b = ? WHERE name_a = ?',
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
#                SQL  => 'SELECT name_a, name_b FROM bench_test WHERE name_a = ?',
#                Bind => [ \$Value ],
#            );
            my $Value = $Self->{DBObject}->Quote("aaa$C-$M");
            $Self->{"DBObject$M"}->Prepare(
                SQL  => "SELECT name_a, name_b FROM bench_test WHERE name_a = '$Value'",
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
                SQL => 'DELETE FROM bench_test WHERE name_a = ?',
                Bind => [ \$Value ],
            );
        }
    }
    return 1;
}

1;
