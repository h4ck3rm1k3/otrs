#!/usr/bin/perl -w
# --
# bin/cgi-bin/json.pl - json handle
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: json.pl,v 1.6 2010/06/22 14:58:45 cr Exp $
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

# use ../../ as lib location
use FindBin qw($Bin);
use lib "$Bin/../..";
use lib "$Bin/../../Kernel/cpan-lib";

use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::DB;
use Kernel::System::Main;
use Kernel::System::Time;
use Kernel::System::Auth;
use Kernel::System::User;
use Kernel::System::Group;
use Kernel::System::Queue;
use Kernel::System::Service;
use Kernel::System::Type;
use Kernel::System::State;
use Kernel::System::Lock;
use Kernel::System::SLA;
use Kernel::System::CustomerUser;
use Kernel::System::Ticket;
use Kernel::System::LinkObject;
use Kernel::System::JSON;
use Kernel::Config;
use Kernel::Language;

use Kernel::System::Web::Request;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

my $Self = Core->new();
print "Content-Type: text/plain; \n";
print "\n";
print $Self->Dispatch();

package Core;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );
    $Self->{ConfigObject} = Kernel::Config->new();
    my $SystemVersion = $Self->{ConfigObject}->Get('Version');

    # check for any version staring with 2.4
    if ( $SystemVersion =~ m{\A (?: 2\.4 ) .* }xms ) {
        $Self->{'API3X'} = 0;
    }
    else {
        $Self->{'API3X'} = 0;
        if ( $SystemVersion =~ m{\A (?: 3\. ) .* }xms ) {
            $Self->{'API3X'} = 1;
        }
    }
    return $Self;
}

sub Dispatch {
    my ($Self) = @_;

    # common objects
    $Self->{ConfigObject} = Kernel::Config->new();
    $Self->{EncodeObject} = Kernel::System::Encode->new( %{$Self} );
    $Self->{LogObject}    = Kernel::System::Log->new(
        LogPrefix => 'OTRS-RPC',
        %{$Self},
    );
    $Self->{MainObject}         = Kernel::System::Main->new( %{$Self} );
    $Self->{DBObject}           = Kernel::System::DB->new( %{$Self} );
    $Self->{TimeObject}         = Kernel::System::Time->new( %{$Self} );
    $Self->{UserObject}         = Kernel::System::User->new( %{$Self} );
    $Self->{GroupObject}        = Kernel::System::Group->new( %{$Self} );
    $Self->{QueueObject}        = Kernel::System::Queue->new( %{$Self} );
    $Self->{ServiceObject}      = Kernel::System::Service->new( %{$Self} );
    $Self->{TypeObject}         = Kernel::System::Type->new( %{$Self} );
    $Self->{StateObject}        = Kernel::System::State->new( %{$Self} );
    $Self->{LockObject}         = Kernel::System::Lock->new( %{$Self} );
    $Self->{SLAObject}          = Kernel::System::SLA->new( %{$Self} );
    $Self->{CustomerUserObject} = Kernel::System::CustomerUser->new( %{$Self} );
    $Self->{TicketObject}       = Kernel::System::Ticket->new( %{$Self} );
    $Self->{LinkObject}         = Kernel::System::LinkObject->new( %{$Self} );

    $Self->{JSONObject}  = Kernel::System::JSON->new( %{$Self} );
    $Self->{ParamObject} = Kernel::System::Web::Request->new( %{$Self} );

    my $User   = $Self->{ParamObject}->GetParam( Param => 'User' );
    my $Pw     = $Self->{ParamObject}->GetParam( Param => 'Password' );
    my $Object = $Self->{ParamObject}->GetParam( Param => 'Object' );
    my $Method = $Self->{ParamObject}->GetParam( Param => 'Method' );
    my $Data   = $Self->{ParamObject}->GetParam( Param => 'Data' );
    my $ParamScalar = $Self->{JSONObject}->Decode( Data => $Data );
    my %Param;
    if ($ParamScalar) {
        %Param = %{$ParamScalar};
    }

    $User ||= '';
    $Pw   ||= '';

    # agent auth
    my %ParamFixed;
    if (1) {
        my $AuthObject = Kernel::System::Auth->new( %{$Self} );
        my $UserLogin = $AuthObject->Auth( User => $User, Pw => $Pw );
        if ( !$UserLogin ) {
            $Self->{LogObject}->Log(
                Priority => 'notice',
                Message  => "Auth for user $User (pw $Pw) failed!",
            );
            return $Self->Result();
        }

        # set user id
        my $UserID = $Self->{UserObject}->UserLookup(
            UserLogin => $UserLogin,
        );
        return if !$UserID;

        $ParamFixed{UserID} = $UserID;
    }

    # system auth
    else {
        my $RequiredUser     = $Self->{ConfigObject}->Get('SOAP::User');
        my $RequiredPassword = $Self->{ConfigObject}->Get('SOAP::Password');

        if (
            !defined $RequiredUser
            || !length $RequiredUser
            || !defined $RequiredPassword || !length $RequiredPassword
            )
        {
            $Self->{LogObject}->Log(
                Priority => 'notice',
                Message  => 'SOAP::User or SOAP::Password is empty, SOAP access denied!',
            );
            return $Self->Result();
        }

        if ( $User ne $RequiredUser || $Pw ne $RequiredPassword ) {
            $Self->{LogObject}->Log(
                Priority => 'notice',
                Message  => "Auth for user $User (pw $Pw) failed!",
            );
            return $Self->Result();
        }
    }

    if ( !$Self->{$Object} && $Object ne 'CustomObject' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No such Object $Object!",
        );
        return $Self->Result();
    }

    if ( ( $Self->{$Object} && !$Self->{$Object}->can($Method) ) && !$Self->can($Method) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No such method '$Method' in '$Object'!",
        );
        return $Self->Result();
    }

    if ( $Object =~ /^(DBObject|TicketObject123)$/ ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No access to '$Object'!",
        );
        return $Self->Result();
    }

    if ( $Object eq 'CustomObject' ) {
        my @Result = $Self->$Method(
            %Param,
            %ParamFixed,
        );
        return $Self->Result( \@Result );
    }
    else {
        my @Result = $Self->{$Object}->$Method(
            %Param,
            %ParamFixed,
        );
        return $Self->Result( \@Result );
    }
}

sub Result {
    my ( $Self, $Result ) = @_;

    my %ResultProtocol;
    if ($Result) {
        $ResultProtocol{Result} = 'successful';
        $ResultProtocol{Data}   = $Result;
    }
    else {
        $ResultProtocol{Result} = 'failed';
        for my $Key (qw(error notice)) {
            $ResultProtocol{Message} = $Self->{LogObject}->GetLogEntry(
                Type => $Key,
                What => 'Message',
            );
            last if $ResultProtocol{Message};
        }
    }
    return $Self->{JSONObject}->Encode( Data => \%ResultProtocol );
}

sub ScreenConfig {
    my ( $Self, %Param ) = @_;

    my $LanguageObject = Kernel::Language->new( %{$Self}, UserLanguage => $Param{Language} );

    my %Config = (
        Phone => {
            Title    => 'New Phone Ticket',
            Elements => [
                {
                    Name  => '',
                    Title => '',
                    Type  => '',
                    Min   =>,
                    Max   =>,

                    #                    Options => {
                    #                    },
                    #                    OptionsURL => {
                    Mandatory =>,
                    Default   =>,
                },
            ],
        },
        Note => {
            Title    => $LanguageObject->Get('Add Note'),
            Elements => [
                {
                    Name      => 'Subject',
                    Title     => $LanguageObject->Get('Subject'),
                    Type      => 'Input',
                    Min       => 1,
                    Max       => 250,
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name      => 'Body',
                    Title     => $LanguageObject->Get('Body'),
                    Type      => 'Text',
                    Min       => 1,
                    Max       => 20_000,
                    Mandatory => 1,
                    Default   => '',
                },
            ],
        },
        Close => {
            Title    => $LanguageObject->Get('Close'),
            Elements => [
                {
                    Name      => 'Subject',
                    Title     => $LanguageObject->Get('Subject'),
                    Type      => 'Input',
                    Min       => 1,
                    Max       => 250,
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name      => 'Body',
                    Title     => $LanguageObject->Get('Body'),
                    Type      => 'Text',
                    Min       => 1,
                    Max       => 20_000,
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name    => 'State',
                    Title   => $LanguageObject->Get('State'),
                    Type    => 'Option',
                    Options => {
                        $Self->{TicketObject}->TicketStateList(
                            Action   => $Param{Action},
                            QueueID  => $Param{QueueID},
                            TicketID => $Param{TicketID},
                            UserID   => $Param{UserID},
                        ),
                    },
                    Mandatory => 0,
                    Default   => '',
                },
            ],
        },
        Compose => {
            Title    => $LanguageObject->Get('Compose'),
            Elements => [
                {
                    Name      => 'To',
                    Title     => $LanguageObject->Get('To'),
                    Type      => 'Input',
                    Min       => 1,
                    Max       => 250,
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name      => 'Subject',
                    Title     => $LanguageObject->Get('Subject'),
                    Type      => 'Input',
                    Min       => 1,
                    Max       => 250,
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name      => 'Body',
                    Title     => $LanguageObject->Get('Body'),
                    Type      => 'Text',
                    Min       => 1,
                    Max       => 20_000,
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name    => 'State',
                    Title   => $LanguageObject->Get('State'),
                    Type    => 'Option',
                    Options => {
                        $Self->{TicketObject}->TicketStateList(
                            Action   => $Param{Action},
                            QueueID  => $Param{QueueID},
                            TicketID => $Param{TicketID},
                            UserID   => $Param{UserID},
                        ),
                    },
                    Mandatory => 0,
                    Default   => '',
                },
            ],
        },
    );
    return \%Config;
}

sub Badges {
    my ( $Self, %Param ) = @_;

    my @Data;

    # locked
    if (1) {
        my $Count = $Self->{TicketObject}->TicketSearch(
            Result     => 'COUNT',
            Locks      => ['lock'],
            OwnerIDs   => [ $Param{UserID} ],
            UserID     => 1,
            Permission => 'ro',
        );
        my $CountNew = $Self->{TicketObject}->TicketSearch(
            Result     => 'COUNT',
            Locks      => ['lock'],
            OwnerIDs   => [ $Param{UserID} ],
            TicketFlag => {
                Seen => 1,
            },
            TicketFlagUserID => $Param{UserID},
            UserID           => 1,
            Permission       => 'ro',
        );
        $CountNew = $Count - $CountNew;
        push @Data, {
            Locked => {
                All => $Count,
                New => $CountNew,
                }
        };
    }
    if ( $Self->{ConfigObject}->Get('Ticket::Responsible') ) {
        my $Count = $Self->{TicketObject}->TicketSearch(
            Result         => 'COUNT',
            StateType      => 'Open',
            ResponsibleIDs => [ $Param{UserID} ],
            UserID         => 1,
            Permission     => 'ro',
        );
        my $CountNew = $Self->{TicketObject}->TicketSearch(
            Result         => 'COUNT',
            StateType      => 'Open',
            ResponsibleIDs => [ $Param{UserID} ],
            TicketFlag     => {
                Seen => 1,
            },
            TicketFlagUserID => $Param{UserID},
            UserID           => 1,
            Permission       => 'ro',
        );
        $CountNew = $Count - $CountNew;

        push @Data, {
            Responsible => {
                All => $Count,
                New => $CountNew,
                }
        };
    }

    if ( $Self->{ConfigObject}->Get('Ticket::Watcher') ) {

        # check access
        my $AccessOk = 1;
        my @Groups;
        if ( $Self->{ConfigObject}->Get('Ticket::WatcherGroup') ) {
            @Groups = @{ $Self->{ConfigObject}->Get('Ticket::WatcherGroup') };
        }
        if (@Groups) {
            my $Access = 0;
            for my $Group (@Groups) {
                next if !$Param{LayoutObject}->{"UserIsGroup[$Group]"};
                if ( $Param{LayoutObject}->{"UserIsGroup[$Group]"} eq 'Yes' ) {
                    $Access = 1;
                    last;
                }
            }

            # return on no access
            if ( !$Access ) {
                $AccessOk = 0;
            }
        }

        if ($AccessOk) {

            # find watched tickets
            my $Count = $Self->{TicketObject}->TicketSearch(
                Result       => 'COUNT',
                WatchUserIDs => [ $Param{UserID} ],
                UserID       => 1,
                Permission   => 'ro',
            );
            my $CountNew = $Self->{TicketObject}->TicketSearch(
                Result       => 'COUNT',
                WatchUserIDs => [ $Param{UserID} ],
                TicketFlag   => {
                    Seen => 1,
                },
                TicketFlagUserID => $Param{UserID},
                UserID           => 1,
                Permission       => 'ro',
            );
            $CountNew = $Count - $CountNew;

            push @Data, {
                Watched => {
                    All => $Count,
                    New => $CountNew,
                    }
            };
        }
    }

    return @Data;
}

sub EscalationView {
    my ( $Self, %Param ) = @_;

    my ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = $Self->{TimeObject}->SystemTime2Date(
        SystemTime => $Self->{TimeObject}->SystemTime() + 60 * 60 * 24 * 7,
    );
    my $TimeStampNextWeek = "$Year-$Month-$Day 23:59:59";

    ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = $Self->{TimeObject}->SystemTime2Date(
        SystemTime => $Self->{TimeObject}->SystemTime() + 60 * 60 * 24,
    );
    my $TimeStampTomorrow = "$Year-$Month-$Day 23:59:59";

    ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = $Self->{TimeObject}->SystemTime2Date(
        SystemTime => $Self->{TimeObject}->SystemTime(),
    );
    my $TimeStampToday = "$Year-$Month-$Day 23:59:59";

    # define filter
    my %Filters = (
        Today => {
            Name   => 'Today',
            Prio   => 1000,
            Search => {
                TicketEscalationTimeOlderDate => $TimeStampToday,
                OrderBy                       => $Param{OrderBy},
                SortBy                        => $Param{SortBy},
                UserID                        => $Param{UserID},
                Permission                    => 'ro',
            },
        },
        Tomorrow => {
            Name   => 'Tomorrow',
            Prio   => 2000,
            Search => {
                TicketEscalationTimeOlderDate => $TimeStampTomorrow,
                OrderBy                       => $Param{OrderBy},
                SortBy                        => $Param{SortBy},
                UserID                        => $Param{UserID},
                Permission                    => 'ro',
            },
        },
        NextWeek => {
            Name   => 'Next Week',
            Prio   => 3000,
            Search => {
                TicketEscalationTimeOlderDate => $TimeStampNextWeek,
                OrderBy                       => $Param{OrderBy},
                SortBy                        => $Param{SortBy},
                UserID                        => $Param{UserID},
                Permission                    => 'ro',
            },
        },
    );

    # do shown tickets lookup
    my $Limit = $Param{Limit} || 100;
    if ( $Param{Filter} ) {
        my @ViewableTickets = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{ $Param{Filter} }->{Search} },
            Limit  => $Limit,
            Result => 'ARRAY',
        );
        my @List;
        for my $TicketID (@ViewableTickets) {
            next if !$TicketID;
            my %Article = $Self->TicketList( TicketID => $TicketID, UserID => $Param{UserID} );
            next if !%Article;
            push @List, \%Article;
        }
        return @List;
    }

    # do nav bar lookup
    my @States;
    for my $Filter ( keys %Filters ) {
        my $Count = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{$Filter}->{Search} },
            Result => 'COUNT',
        );
        my $CountNew = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{$Filter}->{Search} },
            Result     => 'COUNT',
            TicketFlag => {
                Seen => 1,
            },
            TicketFlagUserID => $Param{UserID},
        );
        $CountNew = $Count - $CountNew;

        push @States, {
            StateType => $Filter,

            NumberOfTickets                => $Count,
            NumberOfTicketsWithNewMessages => $CountNew,
        };
    }
    return @States;
}

sub StatusView {
    my ( $Self, %Param ) = @_;

    # define filter
    my %Filters = (
        Open => {
            Name   => 'open',
            Prio   => 1000,
            Search => {
                StateType  => 'Open',
                OrderBy    => $Param{OrderBy},
                SortBy     => $Param{SortBy},
                UserID     => $Param{UserID},
                Permission => 'ro',
            },
        },
        Closed => {
            Name   => 'closed',
            Prio   => 1001,
            Search => {
                StateType  => 'Closed',
                OrderBy    => $Param{OrderBy},
                SortBy     => $Param{SortBy},
                UserID     => $Param{UserID},
                Permission => 'ro',
            },
        },
    );

    # do shown tickets lookup
    my $Limit = $Param{Limit} || 100;
    if ( $Param{Filter} ) {
        my @ViewableTickets = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{ $Param{Filter} }->{Search} },
            Limit  => $Limit,
            Result => 'ARRAY',
        );
        my @List;
        for my $TicketID (@ViewableTickets) {
            next if !$TicketID;
            my %Article = $Self->TicketList( TicketID => $TicketID, UserID => $Param{UserID} );
            next if !%Article;
            push @List, \%Article;
        }
        return @List;
    }

    # do nav bar lookup
    my @States;
    for my $Filter ( keys %Filters ) {
        my $Count = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{$Filter}->{Search} },
            Result => 'COUNT',
        );
        my $CountNew = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{$Filter}->{Search} },
            Result     => 'COUNT',
            TicketFlag => {
                Seen => 1,
            },
            TicketFlagUserID => $Param{UserID},
        );
        $CountNew = $Count - $CountNew;

        push @States, {
            StateType => $Filter,

            NumberOfTickets                => $Count,
            NumberOfTicketsWithNewMessages => $CountNew,
        };
    }
    return @States;
}

sub LockedView {
    my ( $Self, %Param ) = @_;

    # define filter
    my %Filters = (
        All => {
            Name   => 'All',
            Prio   => 1000,
            Search => {
                Locks      => ['lock'],
                OwnerIDs   => [ $Param{UserID} ],
                OrderBy    => $Param{OrderBy},
                SortBy     => $Param{SortBy},
                UserID     => 1,
                Permission => 'ro',
            },
        },
        New => {
            Name   => 'New Article',
            Prio   => 1001,
            Search => {
                Locks      => ['lock'],
                OwnerIDs   => [ $Param{UserID} ],
                TicketFlag => {
                    Seen => 1,
                },
                TicketFlagUserID => $Param{UserID},
                OrderBy          => $Param{OrderBy},
                SortBy           => $Param{SortBy},
                UserID           => 1,
                Permission       => 'ro',
            },
        },
        Reminder => {
            Name   => 'Pending',
            Prio   => 1002,
            Search => {
                Locks      => ['lock'],
                StateType  => [ 'pending reminder', 'pending auto' ],
                OwnerIDs   => [ $Param{UserID} ],
                OrderBy    => $Param{OrderBy},
                SortBy     => $Param{SortBy},
                UserID     => 1,
                Permission => 'ro',
            },
        },
        ReminderReached => {
            Name   => 'Reminder Reached',
            Prio   => 1003,
            Search => {
                Locks                         => ['lock'],
                StateType                     => ['pending reminder'],
                TicketPendingTimeOlderMinutes => 1,
                OwnerIDs                      => [ $Param{UserID} ],
                OrderBy                       => $Param{OrderBy},
                SortBy                        => $Param{SortBy},
                UserID                        => 1,
                Permission                    => 'ro',
            },
        },
    );

    # do shown tickets lookup
    my $Limit = $Param{Limit} || 100;
    if ( $Param{Filter} ) {
        my @ViewableTickets = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{ $Param{Filter} }->{Search} },
            Limit  => $Limit,
            Result => 'ARRAY',
        );
        my @List;
        for my $TicketID (@ViewableTickets) {
            next if !$TicketID;
            my %Article = $Self->TicketList( TicketID => $TicketID, UserID => $Param{UserID} );
            next if !%Article;
            push @List, \%Article;
        }
        return @List;
    }

    # do nav bar lookup
    my @States;
    for my $Filter ( keys %Filters ) {
        my $Count = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{$Filter}->{Search} },
            Result => 'COUNT',
        );
        my $CountNew = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{$Filter}->{Search} },
            Result     => 'COUNT',
            TicketFlag => {
                Seen => 1,
            },
            TicketFlagUserID => $Param{UserID},
        );
        $CountNew = $Count - $CountNew;

        push @States, {
            StateType => $Filter,

            NumberOfTickets                => $Count,
            NumberOfTicketsWithNewMessages => $CountNew,
        };
    }
    return @States;
}

sub WatchedView {
    my ( $Self, %Param ) = @_;

    # define filter
    my %Filters = (
        All => {
            Name   => 'All',
            Prio   => 1000,
            Search => {
                Locks        => ['lock'],
                WatchUserIDs => [ $Param{UserID} ],
                OrderBy      => $Param{OrderBy},
                SortBy       => $Param{SortBy},
                UserID       => 1,
                Permission   => 'ro',
            },
        },
        New => {
            Name   => 'New Article',
            Prio   => 1001,
            Search => {
                Locks        => ['lock'],
                WatchUserIDs => [ $Param{UserID} ],
                TicketFlag   => {
                    Seen => 1,
                },
                TicketFlagUserID => $Param{UserID},
                OrderBy          => $Param{OrderBy},
                SortBy           => $Param{SortBy},
                UserID           => 1,
                Permission       => 'ro',
            },
        },
        Reminder => {
            Name   => 'Pending',
            Prio   => 1002,
            Search => {
                Locks        => ['lock'],
                StateType    => [ 'pending reminder', 'pending auto' ],
                WatchUserIDs => [ $Param{UserID} ],
                OrderBy      => $Param{OrderBy},
                SortBy       => $Param{SortBy},
                UserID       => 1,
                Permission   => 'ro',
            },
        },
        ReminderReached => {
            Name   => 'Reminder Reached',
            Prio   => 1003,
            Search => {
                Locks                         => ['lock'],
                StateType                     => ['pending reminder'],
                TicketPendingTimeOlderMinutes => 1,
                WatchUserIDs                  => [ $Param{UserID} ],
                OrderBy                       => $Param{OrderBy},
                SortBy                        => $Param{SortBy},
                UserID                        => 1,
                Permission                    => 'ro',
            },
        },
    );

    # do shown tickets lookup
    my $Limit = $Param{Limit} || 100;
    if ( $Param{Filter} ) {
        my @ViewableTickets = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{ $Param{Filter} }->{Search} },
            Limit  => $Limit,
            Result => 'ARRAY',
        );
        my @List;
        for my $TicketID (@ViewableTickets) {
            next if !$TicketID;
            my %Article = $Self->TicketList( TicketID => $TicketID, UserID => $Param{UserID} );
            next if !%Article;
            push @List, \%Article;
        }
        return @List;
    }

    # do nav bar lookup
    my @States;
    for my $Filter ( keys %Filters ) {
        my $Count = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{$Filter}->{Search} },
            Result => 'COUNT',
        );
        my $CountNew = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{$Filter}->{Search} },
            Result     => 'COUNT',
            TicketFlag => {
                Seen => 1,
            },
            TicketFlagUserID => $Param{UserID},
        );
        $CountNew = $Count - $CountNew;

        push @States, {
            StateType => $Filter,

            NumberOfTickets                => $Count,
            NumberOfTicketsWithNewMessages => $CountNew,
        };
    }
    return @States;
}

sub ResponsibleView {
    my ( $Self, %Param ) = @_;

    # define filter
    my %Filters = (
        All => {
            Name   => 'All',
            Prio   => 1000,
            Search => {
                Locks              => ['lock'],
                ResponsibleUserIDs => [ $Param{UserID} ],
                OrderBy            => $Param{OrderBy},
                SortBy             => $Param{SortBy},
                UserID             => 1,
                Permission         => 'ro',
            },
        },
        New => {
            Name   => 'New Article',
            Prio   => 1001,
            Search => {
                Locks              => ['lock'],
                ResponsibleUserIDs => [ $Param{UserID} ],
                TicketFlag         => {
                    Seen => 1,
                },
                TicketFlagUserID => $Param{UserID},
                OrderBy          => $Param{OrderBy},
                SortBy           => $Param{SortBy},
                UserID           => 1,
                Permission       => 'ro',
            },
        },
        Reminder => {
            Name   => 'Pending',
            Prio   => 1002,
            Search => {
                Locks              => ['lock'],
                StateType          => [ 'pending reminder', 'pending auto' ],
                ResponsibleUserIDs => [ $Param{UserID} ],
                OrderBy            => $Param{OrderBy},
                SortBy             => $Param{SortBy},
                UserID             => 1,
                Permission         => 'ro',
            },
        },
        ReminderReached => {
            Name   => 'Reminder Reached',
            Prio   => 1003,
            Search => {
                Locks                         => ['lock'],
                StateType                     => ['pending reminder'],
                TicketPendingTimeOlderMinutes => 1,
                ResponsibleUserIDs            => [ $Param{UserID} ],
                OrderBy                       => $Param{OrderBy},
                SortBy                        => $Param{SortBy},
                UserID                        => 1,
                Permission                    => 'ro',
            },
        },
    );

    # do shown tickets lookup
    my $Limit = $Param{Limit} || 100;
    if ( $Param{Filter} ) {
        my @ViewableTickets = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{ $Param{Filter} }->{Search} },
            Limit  => $Limit,
            Result => 'ARRAY',
        );
        my @List;
        for my $TicketID (@ViewableTickets) {
            next if !$TicketID;
            my %Article = $Self->TicketList( TicketID => $TicketID, UserID => $Param{UserID} );
            next if !%Article;
            push @List, \%Article;
        }
        return @List;
    }

    # do nav bar lookup
    my @States;
    for my $Filter ( keys %Filters ) {
        my $Count = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{$Filter}->{Search} },
            Result => 'COUNT',
        );
        my $CountNew = $Self->{TicketObject}->TicketSearch(
            %{ $Filters{$Filter}->{Search} },
            Result     => 'COUNT',
            TicketFlag => {
                Seen => 1,
            },
            TicketFlagUserID => $Param{UserID},
        );
        $CountNew = $Count - $CountNew;

        push @States, {
            StateType => $Filter,

            NumberOfTickets                => $Count,
            NumberOfTicketsWithNewMessages => $CountNew,
        };
    }
    return @States;
}

sub QueueView {
    my ( $Self, %Param ) = @_;

    my @ViewableLockIDs = $Self->{LockObject}->LockViewableLock( Type => 'ID' );

    my @ViewableStateIDs = $Self->{StateObject}->StateGetStatesByType(
        Type   => 'Viewable',
        Result => 'ID',
    );

    # do shown tickets lookup
    my $Limit = $Param{Limit} || 100;
    if ( $Param{QueueID} ) {
        my @ViewableTickets = $Self->{TicketObject}->TicketSearch(

            #            %{ $Filters{ $Param{Filter} }->{Search} },
            OrderBy    => $Param{OrderBy},
            SortBy     => $Param{SortBy},
            StateIDs   => \@ViewableStateIDs,
            LockIDs    => \@ViewableLockIDs,
            QueueIDs   => [ $Param{QueueID} ],
            Permission => 'rw',
            UserID     => $Param{UserID},
            Limit      => $Limit,
            Result     => 'ARRAY',
        );
        my @List;
        for my $TicketID (@ViewableTickets) {
            next if !$TicketID;
            my %Article = $Self->TicketList( TicketID => $TicketID, UserID => $Param{UserID} );
            next if !%Article;
            push @List, \%Article;
        }
        return @List;
    }

    my %AllQueues = $Self->{QueueObject}->QueueList( Valid => 0 );

    my @Queues;
    my %QueueSum;
    for my $QueueID ( sort keys %AllQueues ) {
        my %Queue = $Self->{QueueObject}->QueueGet(
            ID => $QueueID,
        );

        my $Count = $Self->{TicketObject}->TicketSearch(
            StateIDs => \@ViewableStateIDs,
            LockIDs  => \@ViewableLockIDs,
            QueueIDs => [$QueueID],

            #            QueueIDs => \@ViewableQueueIDs,
            #            %Sort,
            Permission => 'rw',
            UserID     => $Param{UserID},
            Result     => 'COUNT',
            Limit      => 1000,
        );
        next if !$Count;

        my $CountNew = $Self->{TicketObject}->TicketSearch(
            StateIDs => \@ViewableStateIDs,
            LockIDs  => \@ViewableLockIDs,
            QueueIDs => [$QueueID],

            #            QueueIDs => \@ViewableQueueIDs,
            #            %Sort,
            TicketFlag => {
                Seen => 1,
            },
            TicketFlagUserID => $Param{UserID},
            Permission       => 'rw',
            UserID           => $Param{UserID},
            Result           => 'COUNT',
            Limit            => 1000,
        );
        $CountNew = $Count - $CountNew;

        push @Queues, {
            QueueID   => $QueueID,
            QueueName => $Queue{Name},
            Comment   => $Queue{Comment},

            NumberOfTickets                => $Count,
            NumberOfTicketsWithNewMessages => $CountNew,
        };
    }

    #    for my $TicketID (@ViewableTickets) {
    #        my %Ticket = $Self->{TicketObject}->Get( TicketID => $TicketID )
    #        $QueueSum{QueueID}
    #    }
    return @Queues;
}

sub TicketList {
    my ( $Self, %Param ) = @_;

    my %Color = (
        1 => '#cdcdcd',
        2 => '#cdcdcd',
        3 => '#cdcdcd',
        4 => '#ffaaaa',
        5 => '#ff505e',
    );

    my %Article = $Self->{TicketObject}->ArticleLastCustomerArticle(
        TicketID => $Param{TicketID},
    );

    $Article{PriorityColor} = $Color{ $Article{PriorityID} };

    if ( $Self->{'API3X'} ) {
        my %TicketFlag = $Self->{TicketObject}->TicketFlagGet(
            TicketID => $Param{TicketID},
            UserID   => $Param{UserID},
        );
        if ( $TicketFlag{seen} || $TicketFlag{Seen} ) {
            $Article{Seen} = 1;
        }
    }

    # strip out all data
    my @Delete
        = qw(ReplyTo MessageID InReplyTo References AgeTimeUnix CreateTimeUnix PriorityID StateID QueueID SenderTypeID OwnerID ResponsibleID ArticleTypeID ArticleFreeKey1 ArticleFreeKey2 ArticleFreeKey3 ArticleFreeText1 ArticleFreeText2 ArticleFreeText3IncomingTime RealTillTimeNotUsed LockID TypeID ServiceID SLAID StateType ArchiveFlag UnlockTimeout Changed);

    for my $Key (@Delete) {
        delete $Article{$Key};
    }

    for my $Key ( keys %Article ) {
        if ( !defined $Article{$Key} || $Article{$Key} eq '' ) {
            delete $Article{$Key};
        }
        if ( $Key =~ /^Escala/ ) {
            delete $Article{$Key};
        }
    }

    return %Article;
}

sub TicketGet {
    my ( $Self, %Param ) = @_;

    my %Ticket = $Self->{TicketObject}->TicketGet(%Param);

    if ( $Self->{'API3X'} ) {
        my %TicketFlag = $Self->{TicketObject}->TicketFlagGet(
            TicketID => $Param{TicketID},
            UserID   => $Param{UserID},
        );
        if ( $TicketFlag{seen} || $TicketFlag{Seen} ) {
            $Ticket{Seen} = 1;
        }
    }
    else {

        # check if ticket need to be marked as seen
        my $ArticleAllSeen = 1;
        my @Index = $Self->{TicketObject}->ArticleIndex( TicketID => $Ticket{TicketID} );
        for my $ArticleID (@Index) {
            if ( $Self->{'API3X'} ) {
                my %ArticleFlag = $Self->{TicketObject}->ArticleFlagGet(
                    ArticleID => $ArticleID,
                    UserID    => $Param{UserID},
                );

                # last if article was not shown
                if ( !$ArticleFlag{Seen} && !$ArticleFlag{seen} ) {
                    $ArticleAllSeen = 0;
                    last;
                }
            }
        }

        # mark ticket as seen if all article are shown
        if ( $ArticleAllSeen && $Self->{'API3X'} ) {
            $Self->{TicketObject}->TicketFlagSet(
                TicketID => $Ticket{TicketID},
                Key      => 'Seen',
                Value    => 1,
                UserID   => $Param{UserID},
            );
        }
    }

    # add accounted time
    my $AccountedTime = $Self->{TicketObject}->TicketAccountedTimeGet(%Param);
    if ( defined $AccountedTime ) {
        $Ticket{AccountedTime} = $AccountedTime;
    }

    # strip out all data
    my @Delete
        = qw(ReplyTo MessageID InReplyTo References AgeTimeUnix CreateTimeUnix PriorityID StateID QueueID SenderTypeID OwnerID ResponsibleID ArticleTypeID ArticleFreeKey1 ArticleFreeKey2 ArticleFreeKey3 ArticleFreeText1 ArticleFreeText2 ArticleFreeText3IncomingTime RealTillTimeNotUsed LockID TypeID ServiceID SLAID StateType ArchiveFlag UnlockTimeout Changed);

    for my $Key (@Delete) {
        delete $Ticket{$Key};
    }
    for my $Key ( keys %Ticket ) {
        if ( !defined $Ticket{$Key} || $Ticket{$Key} eq '' ) {
            delete $Ticket{$Key};
        }
        if ( $Key =~ /^Escala/ ) {
            delete $Ticket{$Key};
        }
    }
    return %Ticket;
}

sub ArticleGet {
    my ( $Self, %Param ) = @_;

    my %Article = $Self->{TicketObject}->ArticleGet(%Param);

    if ( $Self->{'API3X'} ) {

        # check if article is seen
        my %ArticleFlag = $Self->{TicketObject}->ArticleFlagGet(
            ArticleID => $Param{ArticleID},
            UserID    => $Param{UserID},
        );
        if ( $ArticleFlag{seen} || $ArticleFlag{Seen} ) {
            $Article{Seen} = 1;
        }

        # mark shown article as seen
        $Self->{TicketObject}->ArticleFlagSet(
            ArticleID => $Param{ArticleID},
            Key       => 'Seen',
            Value     => 1,
            UserID    => $Param{UserID},
        );
    }

    # check if ticket need to be marked as seen
    my $ArticleAllSeen = 1;
    my @Index = $Self->{TicketObject}->ArticleIndex( TicketID => $Article{TicketID} );
    for my $ArticleID (@Index) {
        if ( $Self->{'API3X'} ) {
            my %ArticleFlag = $Self->{TicketObject}->ArticleFlagGet(
                ArticleID => $ArticleID,
                UserID    => $Param{UserID},
            );

            # last if article was not shown
            if ( !$ArticleFlag{Seen} && !$ArticleFlag{seen} ) {
                $ArticleAllSeen = 0;
                last;
            }
        }
    }

    # mark ticket as seen if all article are shown
    if ( $ArticleAllSeen && $Self->{'API3X'} ) {
        $Self->{TicketObject}->TicketFlagSet(
            TicketID => $Article{TicketID},
            Key      => 'Seen',
            Value    => 1,
            UserID   => $Param{UserID},
        );
    }

    # add accounted time
    my $AccountedTime = $Self->{TicketObject}->ArticleAccountedTimeGet(%Param);
    if ( defined $AccountedTime ) {
        $Article{AccountedTime} = $AccountedTime;
    }

    # strip out all data
    my @Delete
        = qw(ReplyTo MessageID InReplyTo References AgeTimeUnix CreateTimeUnix PriorityID StateID QueueID SenderTypeID OwnerID ResponsibleID ArticleTypeID ArticleFreeKey1 ArticleFreeKey2 ArticleFreeKey3 ArticleFreeText1 ArticleFreeText2 ArticleFreeText3IncomingTime RealTillTimeNotUsed LockID TypeID ServiceID SLAID StateType ArchiveFlag UnlockTimeout Changed);

    for my $Key (@Delete) {
        delete $Article{$Key};
    }

    for my $Key ( keys %Article ) {
        if ( !defined $Article{$Key} || $Article{$Key} eq '' ) {
            delete $Article{$Key};
        }
        if ( $Key =~ /^Escala/ ) {
            delete $Article{$Key};
        }
    }

    return %Article;
}

1;
