# --
# Kernel/Output/HTML/ITSMConfigItemLayoutDateTime.pm - layout backend module
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItemLayoutDateTime.pm,v 1.10 2010/09/09 22:12:09 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMConfigItemLayoutDateTime;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.10 $) [1];

=head1 NAME

Kernel::Output::HTML::ITSMConfigItemLayoutDateTime - layout backend module

=head1 SYNOPSIS

All layout functions of datetime objects.

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::ITSMConfigItemLayoutDateTime->new(
        %Param,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject EncodeObject LogObject MainObject ParamObject LayoutObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    return $Self;
}

=item OutputStringCreate()

create output string

    my $Value = $BackendObject->OutputStringCreate(
        Value => '2007-01-01 12:00',  # (optional)
    );

=cut

sub OutputStringCreate {
    my ( $Self, %Param ) = @_;

    return '' if !$Param{Value};

    $Param{Value} = $Self->{LayoutObject}->Output(
        Template => '$TimeLong{"$QData{"Date"}"}',
        Data     => {
            Date => $Param{Value} . ':00',
        },
    );

    return $Param{Value} || '';
}

=item FormDataGet()

get form data as hash reference

    my $FormDataRef = $BackendObject->FormDataGet(
        Key => 'Item::1::Node::3',
        Item => $ItemRef,
    );

=cut

sub FormDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    my %FormData;

    # get form data
    my $Day    = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Day' );
    my $Month  = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Month' );
    my $Year   = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Year' );
    my $Hour   = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Hour' ) || 0;
    my $Minute = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Minute' ) || 0;

    if ( $Day && $Month && $Year ) {
        $FormData{Value} = sprintf '%02d-%02d-%02d %02d:%02d', $Year, $Month, $Day, $Hour, $Minute;
    }

    # set invalid param
    if ( $Param{Item}->{Input}->{Required} && !$FormData{Value} ) {
        $FormData{Invalid} = 1;
        $Param{Item}->{Form}->{ $Param{Key} }->{Invalid} = 1;
    }

    return \%FormData;
}

=item InputCreate()

create a input string

    my $Value = $BackendObject->InputCreate(
        Key => 'Item::1::Node::3',
        Value => '2007-03-26 12:00',  # (optional)
        Item => $ItemRef,
    );

=cut

sub InputCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    my %Values;
    if ( $Param{Value} || $Param{Item}->{Input}->{ValueDefault} ) {
        my $Value = $Param{Value} || $Param{Item}->{Input}->{ValueDefault};

        if ( $Value =~ /^(\d\d\d\d)-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d)$/i ) {
            $Values{ $Param{Key} . '::Year' }   = $1;
            $Values{ $Param{Key} . '::Month' }  = $2;
            $Values{ $Param{Key} . '::Day' }    = $3;
            $Values{ $Param{Key} . '::Hour' }   = $4;
            $Values{ $Param{Key} . '::Minute' } = $5;
        }
    }

    my $String = $Self->{LayoutObject}->BuildDateSelection(
        Prefix           => $Param{Key} . '::',
        Format           => 'DateInputFormatLong',
        YearPeriodPast   => 10,
        YearPeriodFuture => 10,
        %Values,
    );

    return $String;
}

=item SearchFormDataGet()

get search form data

    my $Value = $BackendObject->SearchFormDataGet(
        Key => 'Item::1::Node::3',
        Item => $ItemRef,
    );

=cut

sub SearchFormDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    my $Used;
    my $StartMinute;
    my $StartHour;
    my $StartDay;
    my $StartMonth;
    my $StartYear;
    my $StopMinute;
    my $StopHour;
    my $StopDay;
    my $StopMonth;
    my $StopYear;

    # get form data
    if ( $Param{Value} ) {
        $Used        = $Param{Value}->{ $Param{Key} };
        $StartMinute = $Param{Value}->{ $Param{Key} . '::TimeStart::Minute' };
        $StartHour   = $Param{Value}->{ $Param{Key} . '::TimeStart::Hour' };
        $StartDay    = $Param{Value}->{ $Param{Key} . '::TimeStart::Day' };
        $StartMonth  = $Param{Value}->{ $Param{Key} . '::TimeStart::Month' };
        $StartYear   = $Param{Value}->{ $Param{Key} . '::TimeStart::Year' };
        $StopMinute  = $Param{Value}->{ $Param{Key} . '::TimeStop::Minute' };
        $StopHour    = $Param{Value}->{ $Param{Key} . '::TimeStop::Hour' };
        $StopDay     = $Param{Value}->{ $Param{Key} . '::TimeStop::Day' };
        $StopMonth   = $Param{Value}->{ $Param{Key} . '::TimeStop::Month' };
        $StopYear    = $Param{Value}->{ $Param{Key} . '::TimeStop::Year' };
    }
    else {
        $Used = $Self->{ParamObject}->GetParam( Param => $Param{Key} );
        $StartMinute
            = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::TimeStart::Minute' ) || 00;
        $StartHour = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::TimeStart::Hour' )
            || 00;
        $StartDay   = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::TimeStart::Day' );
        $StartMonth = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::TimeStart::Month' );
        $StartYear  = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::TimeStart::Year' );
        $StopMinute = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::TimeStop::Minute' )
            || 59;
        $StopHour = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::TimeStop::Hour' )
            || 23;
        $StopDay   = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::TimeStop::Day' );
        $StopMonth = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::TimeStop::Month' );
        $StopYear  = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::TimeStop::Year' );
    }

    if (
        $Used
        && $StartMinute && $StartHour && $StartDay && $StartMonth && $StartYear
        && $StopMinute  && $StopHour  && $StopDay  && $StopMonth  && $StopYear
        )
    {

        # add hour, minutes and seconds,
        # so that that the first and the last day is selected as well
        my $StartDate = sprintf '%02d-%02d-%02d %02d:%02d:00'
            , $StartYear, $StartMonth, $StartDay, $StartHour, $StartMinute;
        my $StopDate = sprintf '%02d-%02d-%02d %02d:%02d:59'
            , $StopYear, $StopMonth, $StopDay, $StopHour, $StopMinute;

        return { '-between' => [ $StartDate, $StopDate ] };
    }

    return [];    # no conditions by default
}

=item SearchInputCreate()

create a search input string

    my $Value = $BackendObject->SearchInputCreate(
        Key => 'Item::1::Node::3',
        Item => $ItemRef,
    );

=cut

sub SearchInputCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # just for convenience
    my $Key         = $Param{Key};
    my $PrefixStart = $Key . '::TimeStart::';
    my $PrefixStop  = $Key . '::TimeStop::';

    # get time related params
    my %GetParam;

    if ( $Param{Value} ) {
        %GetParam = %{ $Param{Value} }
    }
    else {
        $GetParam{$Key} = $Self->{ParamObject}->GetParam( Param => $Key );
        for my $TimeType ( $PrefixStart, $PrefixStop ) {
            for my $Part (qw( Year Month Day )) {
                my $ParamKey = $TimeType . $Part;
                my $ParamVal = $Self->{ParamObject}->GetParam( Param => $ParamKey );

                # remove white space on the start and end
                if ($ParamVal) {
                    $ParamVal =~ s{ \A \s+ }{}xms;
                    $ParamVal =~ s{ \s+ \z }{}xms;
                }

                # store in %GetParam
                $GetParam{$ParamKey} = $ParamVal;
            }
        }
    }

    # Build selection for the start and stop time.
    my $TimeStartSelectionString = $Self->{LayoutObject}->BuildDateSelection(
        Prefix           => $PrefixStart,
        Format           => 'DateInputFormatLong',
        YearPeriodPast   => 10,
        YearPeriodFuture => 10,
        %GetParam,
    );
    my $TimeStopSelectionString = $Self->{LayoutObject}->BuildDateSelection(
        Optional         => 0,
        Prefix           => $PrefixStop,
        Format           => 'DateInputFormatLong',
        YearPeriodPast   => 10,
        YearPeriodFuture => 10,
        %GetParam,
    );

    #    my $Checked  = $GetParam{$Key} ? 'checked="checked"' : '';
    my $Checkbox = qq{<input type="hidden" name="$Key" value="1"/>};
    my $Between  = $Self->{LayoutObject}->{LanguageObject}->Get('Between');
    my $And      = $Self->{LayoutObject}->{LanguageObject}->Get('and');

    return "<div> $Checkbox $Between $TimeStartSelectionString </div>"
        . "<span style=\"margin-left: 27px;\"> $And </span> $TimeStopSelectionString";
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut

=head1 VERSION

$Revision: 1.10 $ $Date: 2010/09/09 22:12:09 $

=cut
