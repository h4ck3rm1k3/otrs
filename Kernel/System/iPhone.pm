# --
# Kernel/System/iPhone.pm - all iPhone handle functions
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: iPhone.pm,v 1.22 2010/07/06 23:37:27 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::iPhone;

use strict;
use warnings;

use Kernel::System::Log;
use Kernel::Language;
use Kernel::System::CheckItem;
use Kernel::System::Priority;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.22 $) [1];

=head1 NAME

Kernel::System::iPhone - iPhone lib

=head1 SYNOPSIS

All iPhone functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

    create an object

        use Kernel::Config;
        use Kernel::System::Encode;
        use Kernel::System::Log;
        use Kernel::System::Time;
        use Kernel::System::Main;
        use Kernel::System::DB;
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

        my $ConfigObject = Kernel::Config->new();
        my $EncodeObject = Kernel::System::Encode->new(
            ConfigObject => $ConfigObject,
        );
        my $LogObject = Kernel::System::Log->new(
            ConfigObject => $ConfigObject,
            EncodeObject => $EncodeObject,
        );
        my $TimeObject = Kernel::System::Time->new(
            ConfigObject => $ConfigObject,
            LogObject    => $LogObject,
        );
        my $MainObject = Kernel::System::Main->new(
            ConfigObject => $ConfigObject,
            EncodeObject => $EncodeObject,
            LogObject    => $LogObject,
        );
        my $DBObject = Kernel::System::DB->new(
            ConfigObject => $ConfigObject,
            EncodeObject => $EncodeObject,
            LogObject    => $LogObject,
            MainObject   => $MainObject,
        );
        my $UserObject = Kernel::System::User->new(
            ConfigObject => $ConfigObject,
            LogObject    => $LogObject,
            MainObject   => $MainObject,
            TimeObject   => $TimeObject,
            DBObject     => $DBObject,
            EncodeObject => $EncodeObject,
        );
        my $GroupObject = Kernel::System::Group->new(
            ConfigObject => $ConfigObject,
            LogObject    => $LogObject,
            DBObject     => $DBObject,
            MainObject   => $MainObject,
            EncodeObject => $EncodeObject,
        );
        my $QueueObject = Kernel::System::Queue->new(
            ConfigObject        => $ConfigObject,
            LogObject           => $LogObject,
            DBObject            => $DBObject,
            MainObject          => $MainObject,
            EncodeObject        => $EncodeObject,
            GroupObject         => $GroupObject, # if given
            CustomerGroupObject => $CustomerGroupObject, # if given
        );
        my $ServiceObject = Kernel::System::Service->new(
            ConfigObject => $ConfigObject,
            EncodeObject => $EncodeObject,
            LogObject    => $LogObject,
            DBObject     => $DBObject,
            MainObject   => $MainObject,
        );
        my $TypeObject = Kernel::System::Type->new(
            ConfigObject => $ConfigObject,
            LogObject    => $LogObject,
            DBObject     => $DBObject,
            MainObject   => $MainObject,
            EncodeObject => $EncodeObject,
        );
        my $StateObject = Kernel::System::State->new(
            ConfigObject => $ConfigObject,
            LogObject    => $LogObject,
            DBObject     => $DBObject,
            MainObject   => $MainObject,
            EncodeObject => $EncodeObject,
        );
        my $LockObject = Kernel::System::Lock->new(
            ConfigObject => $ConfigObject,
            LogObject    => $LogObject,
            DBObject     => $DBObject,
            MainObject   => $MainObject,
            EncodeObject => $EncodeObject,
        );
        my $SLAObject = Kernel::System::SLA->new(
            ConfigObject => $ConfigObject,
            EncodeObject => $EncodeObject,
            LogObject    => $LogObject,
            DBObject     => $DBObject,
            MainObject   => $MainObject,
        );
        my $CustomerUserObject = Kernel::System::CustomerUser->new(
            ConfigObject => $ConfigObject,
            LogObject    => $LogObject,
            DBObject     => $DBObject,
            MainObject   => $MainObject,
            EncodeObject => $EncodeObject,
        );
        my $TicketObject = Kernel::System::Ticket->new(
            ConfigObject       => $ConfigObject,
            LogObject          => $LogObject,
            DBObject           => $DBObject,
            MainObject         => $MainObject,
            TimeObject         => $TimeObject,
            EncodeObject       => $EncodeObject,
            GroupObject        => $GroupObject,        # if given
            CustomerUserObject => $CustomerUserObject, # if given
            QueueObject        => $QueueObject,        # if given
        );
        my $LinkObject = Kernel::System::LinkObject->new(
            ConfigObject => $ConfigObject,
            LogObject    => $LogObject,
            DBObject     => $DBObject,
            TimeObject   => $TimeObject,
            MainObject   => $MainObject,
            EncodeObject => $EncodeObject,
        );
        my $iPhoneObject = Kernel::System::iPhone->new(
            ConfigObject       => $ConfigObject,
            LogObject          => $LogObject,
            DBObject           => $DBObject,
            MainObject         => $MainObject,
            TimeObject         => $TimeObject,
            EncodeObject       => $EncodeObject,
            GroupObject        => $GroupObject,
            CustomerUserObject => $CustomerUserObject,
            QueueObject        => $QueueObject,
            UserObject         => $UserObject,
            QueueObject        => $QueueObject,
            ServiceObject      => $ServiceObject,
            TypeObject         => $TypeObject,
            StateObject        => $StateObject,
            LockObject         => $LockObject,
            SLAObject          => $SLAObject,
            TicketObject       => $TicketObject,
            Linkbject          => $LinkObject,
        );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for (
        qw(ConfigObject UserObject GroupObject QueueObject ServiceObject TypeObject
        StateObject LockObject SLAObject CustomerUserObject TicketObject LinkObject )
        )
    {
        $Self->{$_} = $Param{$_} || die "Got no $_! object";
    }

    $Self->{LogObject} = Kernel::System::Log->new(
        LogPrefix => 'iPhoneHandle',
        %{$Self},
    );

    $Self->{CheckItemObject} = Kernel::System::CheckItem->new(%Param);
    $Self->{PriorityObject}  = Kernel::System::Priority->new(%Param);

    my $SystemVersion = $Self->{ConfigObject}->Get('Version');

    # check for any version staring with 2.4
    if ( $SystemVersion =~ m{ \A 2 \. 4 \. \d+ \z }xms ) {
        $Self->{'API3X'} = 0;
    }
    else {
        $Self->{'API3X'} = 0;
        if ( $SystemVersion =~ m{ \A 3 (?: \.\d+ ){2} \z }xms ) {
            $Self->{'API3X'} = 1;
        }
    }
    return $Self;
}

sub ScreenConfig {
    my ( $Self, %Param ) = @_;

    $Self->{LanguageObject} = Kernel::Language->new( %{$Self}, UserLanguage => $Param{Language} );

    # this can also be reduced

    # ------------------------------------------------------------ #
    # New Phone Ticket Screen
    # ------------------------------------------------------------ #

    if ( $Param{Screen} eq 'Phone' ) {

        # get screen configuration options for iphone from sysconfig
        $Self->{Config} = $Self->{ConfigObject}->Get('iPhone::Frontend::AgentTicketPhone');
        my %Config = (
            Title    => $Self->{LanguageObject}->Get('New Phone Ticket'),
            Elements => $Self->_GetScreenElements(%Param),
            Actions  => {
                Object     => 'CustomObject',
                Method     => 'ScreenActions',
                Parameters => {
                    Action => 'Phone',
                },
            },
        );
        return \%Config;
    }

    # ------------------------------------------------------------ #
    # Add Note Screen
    # ------------------------------------------------------------ #
    if ( $Param{Screen} eq 'Note' ) {

        # my %Config = (
        # get screen configuration options for iphone from sysconfig
        $Self->{Config} = $Self->{ConfigObject}->Get('iPhone::Frontend::AgentTicketNote');

        my %Config = (
            Title    => $Self->{LanguageObject}->Get('Add Note'),
            Elements => $Self->_GetScreenElements(%Param),
            Actions  => {
                Object     => 'CustomObject',
                Method     => 'ScreenActions',
                Parameters => {
                    Action   => 'Note',
                    TicketID => $Param{TicketID},
                    Title    => 'a title',
                },
            },
        );
        return \%Config;
    }

    # ------------------------------------------------------------ #
    # Close Ticket Screen
    # ------------------------------------------------------------ #

    if ( $Param{Screen} eq 'Close' ) {

        # get screen configuration options for iphone from sysconfig
        $Self->{Config} = $Self->{ConfigObject}->Get('iPhone::Frontend::AgentTicketClose');

        my %Config = (
            Title    => $Self->{LanguageObject}->Get('Close'),
            Elements => $Self->_GetScreenElements(%Param),
            Actions  => {
                Object     => 'CustomObject',
                Method     => 'ScreenActions',
                Parameters => {
                    Action   => 'Close',
                    TicketID => $Param{TicketID},
                },
            },
        );
        return \%Config;
    }

    # ------------------------------------------------------------ #
    # Compose Screen
    # ------------------------------------------------------------ #

    if ( $Param{Screen} eq 'Compose' ) {

        # get screen configuration options for iphone from sysconfig
        $Self->{Config} = $Self->{ConfigObject}->Get('iPhone::Frontend::AgentTicketCompose');

        my %Config = (
            Title    => $Self->{LanguageObject}->Get('Compose'),
            Elements => $Self->_GetScreenElements(%Param),
            Actions  => {
                Object     => 'CustomObject',
                Method     => 'ScreenActions',
                Parameters => {
                    Action   => 'Compose',
                    TicketID => $Param{TicketID},
                },
            },
        );
        return \%Config;
    }

    # ------------------------------------------------------------ #
    # Move Screen
    # ------------------------------------------------------------ #
    if ( $Param{Screen} eq 'Move' ) {

        # get screen configuration options for iphone from sysconfig
        $Self->{Config} = $Self->{ConfigObject}->Get('iPhone::Frontend::AgentTicketMove');

        my %Config = (
            Title    => $Self->{LanguageObject}->Get('Move'),
            Elements => $Self->_GetScreenElements(%Param),
            Actions  => {
                Object     => 'CustomObject',
                Method     => 'ScreenActions',
                Parameters => {
                    Action   => 'Move',
                    TicketID => $Param{TicketID},
                },
            },
        );
        return \%Config;
    }

    return;
}

sub ResponsesGet {
    my ( $Self, %Param ) = @_;
    if ( !$Param{QueueID} ) {
        return
    }

    # fetch all std. responses
    my %StdResponses = $Self->{QueueObject}->GetStdResponses( QueueID => $Param{QueueID} );
    return \%StdResponses;
}

=item Badges()

Get Badges ticket counts for Watched, Locked and Reposible for tickets

    my @Result = $iPhoneObject->Badges(
        UserID          => 1,
    );

    # a result could be

    @Result = (
        Locked => {
            All => 1,
            New => 1,
        },

        Watched => {       # Optional if feature is enabled
            All => 2,
            New => 0,
        },

        Responsible => {   # Optional if feature is enabled
            All => 1,
            New => 1,
        },
    );

=cut

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

    # responsible
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

    # watched
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
                next if !$Param{"UserIsGroup[$Group]"};
                if ( $Param{"UserIsGroup[$Group]"} eq 'Yes' ) {
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

=item EscalationView()

Get the number of tikets on estalation status by state type or las customer article information from
each ticket in escalation status within a filter, if the "Filter" argument is specified.

    my @Result = $iPhoneObject->EscalationView(
        UserID  => 1,

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
            StateType                      => "Today",
            NumberOfTickets                => 2,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "Tomorrow",
            NumberOfTickets                => 2,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "NextWeek",
            NumberOfTickets                => 2,
            NumberOfTicketsWithNewMessages => 0
        },
    );

    my @Result = $iPhoneObject->EscalationView(
        UserID  => 1,
        Filter  => "Today",

        #Limit (optional) set to 100 by default, if not spcified
        Limit   => 50,

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
            Age                              => 1596,
            ArticleID                        => 923,
            ArticleType                      => "phone",
            Body                             => "Testing for escalation",
            Charset                          => "utf-8",
            ContentCharset                   => "utf-8",
            ContentType                      => "text/plain;",
            charset                          => "utf-8",
            Created                          => "2010-06-23 11:46:15",
            CreatedBy                        => 1,
            FirstResponseTime                => -1296,
            FirstResponseTimeDestinationDate => "2010-06-23 11:51:14",
            FirstResponseTimeDestinationTime => 1277311874,
            FirstResponseTimeEscalation      => 1,
            FirstResponseTimeWorkingTime     => -1260,
            From                             => "customer@otrs.org",
            IncomingTime                     => 1277311575,
            Lock                             => "unlock",
            MimeType                         => "text/plain",
            Owner                            => "Agent1",
            Priority                         => "3 normal",
            PriorityColor                    => "#cdcdcd",
            Queue                            => "Junk",
            Responsible                      => "Agent1",
            SenderType                       => "customer",
            SolutionTime                     => -1296,
            SolutionTimeDestinationDate      => "2010-06-23 11:51:14",
            SolutionTimeDestinationTime      => 1277311874,
            SolutionTimeEscalation           => 1,
            SolutionTimeWorkingTime          => -1260,
            State                            => "open",
            Subject                          => "Escalation Test",
            TicketFreeKey13                  => "CriticalityID",
            TicketFreeKey14                  => "ImpactID",
            TicketID                         => 176,
            TicketNumber                     => 2010062310000015,
            Title                            => "Escalation Test",
            To                               => "Junk",
            Type                             => "Incident",
            UntilTime                        => 0,
            UpdateTime                       => -1295,
            UpdateTimeDestinationDate        => "2010-06-23 11:51:15",
            UpdateTimeDestinationTime        => 1277311875,
            UpdateTimeEscalation             => 1,
            UpdateTimeWorkingTime            => -1260,
            Seen                             => 1, # only on otrs 3.x framework

        },
    );

=cut

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

=item StatusView()

Get the number of tikets by status (open or closed) or last customer article information from each
ticket in each status within an specified filter, if the "Filter" argument is specified.

    my @Result = $iPhoneObject->StatusView(
        UserID  => 1,

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
            StateType                      => "Open",
            NumberOfTickets                => 2,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "Closed",
            NumberOfTickets                => 1,
            NumberOfTicketsWithNewMessages => 0,
        },
    );

    my @Result = $iPhoneObject->StatusView(
        UserID  => 1,
        Filter  => "Open",

        #Limit (optional) set to 100 by default, if not spcified
        Limit   => 50,

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
             Age                              => 1596,
            ArticleID                        => 923,
            ArticleType                      => "phone",
            Body                             => "This is an open ticket",
            Charset                          => "utf-8",
            ContentCharset                   => "utf-8",
            ContentType                      => "text/plain;",
            charset                          => "utf-8",
            Created                          => "2010-06-23 11:46:15",
            CreatedBy                        => 1,
            FirstResponseTime                => -1296,
            FirstResponseTimeDestinationDate => "2010-06-23 11:51:14",
            FirstResponseTimeDestinationTime => 1277311874,
            FirstResponseTimeEscalation      => 1,
            FirstResponseTimeWorkingTime     => -1260,
            From                             => "customer@otrs.org",
            IncomingTime                     => 1277311575,
            Lock                             => "unlock",
            MimeType                         => "text/plain",
            Owner                            => "Agent1",
            Priority                         => "3 normal",
            PriorityColor                    => "#cdcdcd",
            Queue                            => "Junk",
            Responsible                      => "Agent1",
            SenderType                       => "customer",
            SolutionTime                     => -1296,
            SolutionTimeDestinationDate      => "2010-06-23 11:51:14",
            SolutionTimeDestinationTime      => 1277311874,
            SolutionTimeEscalation           => 1,
            SolutionTimeWorkingTime          => -1260,
            State                            => "open",
            Subject                          => "Open Ticket Test",
            TicketFreeKey13                  => "CriticalityID",
            TicketFreeKey14                  => "ImpactID",
            TicketID                         => 176,
            TicketNumber                     => 2010062310000015,
            Title                            => "Open Ticket Test",
            To                               => "Junk",
            Type                             => "Incident",
            UntilTime                        => 0,
            UpdateTime                       => -1295,
            UpdateTimeDestinationDate        => "2010-06-23 11:51:15",
            UpdateTimeDestinationTime        => 1277311875,
            UpdateTimeEscalation             => 1,
            UpdateTimeWorkingTime            => -1260,
            Seen                             => 1, # only on otrs 3.x framework

        },
    );

=cut

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

=item LockedView()

Get the number of locked tikets by status type (all, new, reminder, reminder reached ) or last
customer article information from each locked ticket in each status within an specified filter, if
the "Filter" argument is specified.

    my @Result = $iPhoneObject->LockedView(
        UserID  => 1,

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
            StateType                      => "All",
            NumberOfTickets                => 2,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "New,
            NumberOfTickets                => 1,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "Reminder,
            NumberOfTickets                => 0,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "ReminderReached,
            NumberOfTickets                => 1,
            NumberOfTicketsWithNewMessages => 0,
        },
    );

    my @Result = $iPhoneObject->LockedView(
        UserID  => 1,
        Filter  => "New",

        #Limit (optional) set to 100 by default, if not spcified
        Limit   => 50,

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
            Age                              => 1596,
            ArticleID                        => 923,
            ArticleType                      => "phone",
            Body                             => "This is an open ticket",
            Charset                          => "utf-8",
            ContentCharset                   => "utf-8",
            ContentType                      => "text/plain;",
            charset                          => "utf-8",
            Created                          => "2010-06-23 11:46:15",
            CreatedBy                        => 1,
            FirstResponseTime                => -1296,
            FirstResponseTimeDestinationDate => "2010-06-23 11:51:14",
            FirstResponseTimeDestinationTime => 1277311874,
            FirstResponseTimeEscalation      => 1,
            FirstResponseTimeWorkingTime     => -1260,
            From                             => "customer@otrs.org",
            IncomingTime                     => 1277311575,
            Lock                             => "lock",
            MimeType                         => "text/plain",
            Owner                            => "Agent1",
            Priority                         => "3 normal",
            PriorityColor                    => "#cdcdcd",
            Queue                            => "Junk",
            Responsible                      => "Agent1",
            SenderType                       => "customer",
            SolutionTime                     => -1296,
            SolutionTimeDestinationDate      => "2010-06-23 11:51:14",
            SolutionTimeDestinationTime      => 1277311874,
            SolutionTimeEscalation           => 1,
            SolutionTimeWorkingTime          => -1260,
            State                            => "open",
            Subject                          => "Open Ticket Test",
            TicketFreeKey13                  => "CriticalityID",
            TicketFreeKey14                  => "ImpactID",
            TicketID                         => 176,
            TicketNumber                     => 2010062310000015,
            Title                            => "Open Ticket Test",
            To                               => "Junk",
            Type                             => "Incident",
            UntilTime                        => 0,
            UpdateTime                       => -1295,
            UpdateTimeDestinationDate        => "2010-06-23 11:51:15",
            UpdateTimeDestinationTime        => 1277311875,
            UpdateTimeEscalation             => 1,
            UpdateTimeWorkingTime            => -1260,
            Seen                             => 1, # only on otrs 3.x framework
        },
    );

=cut

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

=item WatchedView()

Get the number of watched tikets by status type (all, new, reminder, reminder reached ) or last
custmer article information from each watched ticket in each status within an specified filter, if
the "Filter" argument is specified.

    my @Result = $iPhoneObject->WatchedView(
        UserID  => 1,

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
            StateType                      => "All",
            NumberOfTickets                => 2,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "New,
            NumberOfTickets                => 1,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "Reminder,
            NumberOfTickets                => 0,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "ReminderReached,
            NumberOfTickets                => 1,
            NumberOfTicketsWithNewMessages => 0,
        },
    );

    my @Result = $iPhoneObject->WatchedView(
        UserID  => 1,
        Filter  => "New",

        #Limit (optional) set to 100 by default, if not spcified
        Limit   => 50,

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
            Age                              => 1596,
            ArticleID                        => 923,
            ArticleType                      => "phone",
            Body                             => "This is an open ticket",
            Charset                          => "utf-8",
            ContentCharset                   => "utf-8",
            ContentType                      => "text/plain;",
            charset                          => "utf-8",
            Created                          => "2010-06-23 11:46:15",
            CreatedBy                        => 1,
            FirstResponseTime                => -1296,
            FirstResponseTimeDestinationDate => "2010-06-23 11:51:14",
            FirstResponseTimeDestinationTime => 1277311874,
            FirstResponseTimeEscalation      => 1,
            FirstResponseTimeWorkingTime     => -1260,
            From                             => "customer@otrs.org",
            IncomingTime                     => 1277311575,
            Lock                             => "lock",
            MimeType                         => "text/plain",
            Owner                            => "Agent1",
            Priority                         => "3 normal",
            PriorityColor                    => "#cdcdcd",
            Queue                            => "Junk",
            Responsible                      => "Agent1",
            SenderType                       => "customer",
            SolutionTime                     => -1296,
            SolutionTimeDestinationDate      => "2010-06-23 11:51:14",
            SolutionTimeDestinationTime      => 1277311874,
            SolutionTimeEscalation           => 1,
            SolutionTimeWorkingTime          => -1260,
            State                            => "open",
            Subject                          => "Open Ticket Test",
            TicketFreeKey13                  => "CriticalityID",
            TicketFreeKey14                  => "ImpactID",
            TicketID                         => 176,
            TicketNumber                     => 2010062310000015,
            Title                            => "Open Ticket Test",
            To                               => "Junk",
            Type                             => "Incident",
            UntilTime                        => 0,
            UpdateTime                       => -1295,
            UpdateTimeDestinationDate        => "2010-06-23 11:51:15",
            UpdateTimeDestinationTime        => 1277311875,
            UpdateTimeEscalation             => 1,
            UpdateTimeWorkingTime            => -1260,
            Seen                             => 1, # only on otrs 3.x framework
        },
    );

=cut

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

=item ResponsibleView()

Get the number of locked or unlocked tikets where the user is responsible for by status type
(all, new, reminder, reminder reached ) or last customer article information from each ticket where
the user is responsible for  in each status within an specified filter, if the "Filter" argument is
specified.

    my @Result = $iPhoneObject->ResponsibleView(
        UserID  => 1,

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
            StateType                      => "All",
            NumberOfTickets                => 2,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "New,
            NumberOfTickets                => 1,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "Reminder,
            NumberOfTickets                => 0,
            NumberOfTicketsWithNewMessages => 0,
        },
        {
            StateType                      => "ReminderReached,
            NumberOfTickets                => 1,
            NumberOfTicketsWithNewMessages => 0,
        },
    );

    my @Result = $iPhoneObject->ResponsibleView(
        UserID  => 1,
        Filter  => "New",

        #Limit (optional) set to 100 by default, if not spcified
        Limit   => 50,

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
            Age                              => 1596,
            ArticleID                        => 923,
            ArticleType                      => "phone",
            Body                             => "This is an open ticket",
            Charset                          => "utf-8",
            ContentCharset                   => "utf-8",
            ContentType                      => "text/plain;",
            charset                          => "utf-8",
            Created                          => "2010-06-23 11:46:15",
            CreatedBy                        => 1,
            FirstResponseTime                => -1296,
            FirstResponseTimeDestinationDate => "2010-06-23 11:51:14",
            FirstResponseTimeDestinationTime => 1277311874,
            FirstResponseTimeEscalation      => 1,
            FirstResponseTimeWorkingTime     => -1260,
            From                             => "customer@otrs.org",
            IncomingTime                     => 1277311575,
            Lock                             => "lock",
            MimeType                         => "text/plain",
            Owner                            => "Agent1",
            Priority                         => "3 normal",
            PriorityColor                    => "#cdcdcd",
            Queue                            => "Junk",
            Responsible                      => "Agent1",
            SenderType                       => "customer",
            SolutionTime                     => -1296,
            SolutionTimeDestinationDate      => "2010-06-23 11:51:14",
            SolutionTimeDestinationTime      => 1277311874,
            SolutionTimeEscalation           => 1,
            SolutionTimeWorkingTime          => -1260,
            State                            => "open",
            Subject                          => "Open Ticket Test",
            TicketFreeKey13                  => "CriticalityID",
            TicketFreeKey14                  => "ImpactID",
            TicketID                         => 176,
            TicketNumber                     => 2010062310000015,
            Title                            => "Open Ticket Test",
            To                               => "Junk",
            Type                             => "Incident",
            UntilTime                        => 0,
            UpdateTime                       => -1295,
            UpdateTimeDestinationDate        => "2010-06-23 11:51:15",
            UpdateTimeDestinationTime        => 1277311875,
            UpdateTimeEscalation             => 1,
            UpdateTimeWorkingTime            => -1260,
            Seen                             => 1, # only on otrs 3.x framework
        },
    );

=cut

sub ResponsibleView {
    my ( $Self, %Param ) = @_;

    # define filter
    my %Filters = (
        All => {
            Name   => 'All',
            Prio   => 1000,
            Search => {
                StateType          => 'Open',
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
                StateType          => 'Open',
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
                StateType => [ 'pending reminder', 'pending auto' ],
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

    if ( $Self->{ConfigObject}->Get('Ticket::Responsible') ) {

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
    return
}

=item QueueView()

Get the number of viewable tikets by queue as well as basic queue information, or las customer
article information from each ticket within an specified queue, if the "Queue" argument is
specified.

    my @Result = $iPhoneObject->QueueView(
        UserID  => 1,

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
            QueueName                      => "Junk",
            NumberOfTickets                => 2,
            NumberOfTicketsWithNewMessages => 0,
            QueueID                        => 3,
            Comment                        => "All junk tickets."
        },
        {
            QueueName                      => "Misc",
            NumberOfTickets                => 1,
            NumberOfTicketsWithNewMessages => 0,
            QueueID                        => 4,
            Comment                        => "All misc tickets."
        },
    );

    my @Result = $iPhoneObject->QueueView(
        UserID   => 1,
        QueueID  => 4,

        #Limit (optional) set to 100 by default, if not spcified
        Limit    => 50,

        # OrderBy and SortBy (optional)
        OrderBy  => 'Down',  # Down|Up
        SortBy   => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age
                            # Type|Lock|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16
    );

    #a result could be

    @Resutl = (
        {
            Age                              => 1596,
            ArticleID                        => 923,
            ArticleType                      => "phone",
            Body                             => "This is an open ticket",
            Charset                          => "utf-8",
            ContentCharset                   => "utf-8",
            ContentType                      => "text/plain;",
            charset                          => "utf-8",
            Created                          => "2010-06-23 11:46:15",
            CreatedBy                        => 1,
            FirstResponseTime                => -1296,
            FirstResponseTimeDestinationDate => "2010-06-23 11:51:14",
            FirstResponseTimeDestinationTime => 1277311874,
            FirstResponseTimeEscalation      => 1,
            FirstResponseTimeWorkingTime     => -1260,
            From                             => "customer@otrs.org",
            IncomingTime                     => 1277311575,
            Lock                             => "lock",
            MimeType                         => "text/plain",
            Owner                            => "Agent1",
            Priority                         => "3 normal",
            PriorityColor                    => "#cdcdcd",
            Queue                            => "Misc",
            Responsible                      => "Agent1",
            SenderType                       => "customer",
            SolutionTime                     => -1296,
            SolutionTimeDestinationDate      => "2010-06-23 11:51:14",
            SolutionTimeDestinationTime      => 1277311874,
            SolutionTimeEscalation           => 1,
            SolutionTimeWorkingTime          => -1260,
            State                            => "open",
            Subject                          => "Open Ticket Test",
            TicketFreeKey13                  => "CriticalityID",
            TicketFreeKey14                  => "ImpactID",
            TicketID                         => 176,
            TicketNumber                     => 2010062310000015,
            Title                            => "Open Ticket Test",
            To                               => "Junk",
            Type                             => "Incident",
            UntilTime                        => 0,
            UpdateTime                       => -1295,
            UpdateTimeDestinationDate        => "2010-06-23 11:51:15",
            UpdateTimeDestinationTime        => 1277311875,
            UpdateTimeEscalation             => 1,
            UpdateTimeWorkingTime            => -1260,
            Seen                             => 1, # only on otrs 3.x framework
        },
    );

=cut

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

=item TicketList()

Get the last customer article information of a ticket

    my @Result = $iPhoneObject->TicketList(
        UserID   => 1,
        TicketID  => 176,
    );

    #a result could be

    @Resutl = (
        {
            Age                              => 1596,
            ArticleID                        => 923,
            ArticleType                      => "phone",
            Body                             => "This is an open ticket",
            Charset                          => "utf-8",
            ContentCharset                   => "utf-8",
            ContentType                      => "text/plain;",
            charset                          => "utf-8",
            Created                          => "2010-06-23 11:46:15",
            CreatedBy                        => 1,
            FirstResponseTime                => -1296,
            FirstResponseTimeDestinationDate => "2010-06-23 11:51:14",
            FirstResponseTimeDestinationTime => 1277311874,
            FirstResponseTimeEscalation      => 1,
            FirstResponseTimeWorkingTime     => -1260,
            From                             => "customer@otrs.org",
            IncomingTime                     => 1277311575,
            Lock                             => "lock",
            MimeType                         => "text/plain",
            Owner                            => "Agent1",
            Priority                         => "3 normal",
            PriorityColor                    => "#cdcdcd",
            Queue                            => "Misc",
            Responsible                      => "Agent1",
            SenderType                       => "customer",
            SolutionTime                     => -1296,
            SolutionTimeDestinationDate      => "2010-06-23 11:51:14",
            SolutionTimeDestinationTime      => 1277311874,
            SolutionTimeEscalation           => 1,
            SolutionTimeWorkingTime          => -1260,
            State                            => "open",
            Subject                          => "Open Ticket Test",
            TicketFreeKey13                  => "CriticalityID",
            TicketFreeKey14                  => "ImpactID",
            TicketID                         => 176,
            TicketNumber                     => 2010062310000015,
            Title                            => "Open Ticket Test",
            To                               => "Junk",
            Type                             => "Incident",
            UntilTime                        => 0,
            UpdateTime                       => -1295,
            UpdateTimeDestinationDate        => "2010-06-23 11:51:15",
            UpdateTimeDestinationTime        => 1277311875,
            UpdateTimeEscalation             => 1,
            UpdateTimeWorkingTime            => -1260,
            Seen                             => 1, # only on otrs 3.x framework
        },
    );

=cut

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
        = qw(ReplyTo MessageID InReplyTo References AgeTimeUnix CreateTimeUnix PriorityID StateID
        QueueID SenderTypeID OwnerID ResponsibleID ArticleTypeID ArticleFreeKey1
        ArticleFreeKey2 ArticleFreeKey3 ArticleFreeText1 ArticleFreeText2
        ArticleFreeText3 IncomingTime RealTillTimeNotUsed LockID TypeID ServiceID SLAID
        StateType ArchiveFlag UnlockTimeout Changed
    );

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
        = qw(ReplyTo MessageID InReplyTo References AgeTimeUnix CreateTimeUnix PriorityID StateID
        QueueID SenderTypeID OwnerID ResponsibleID ArticleTypeID ArticleFreeKey1
        ArticleFreeKey2 ArticleFreeKey3 ArticleFreeText1 ArticleFreeText2 ArticleFreeText3
        IncomingTime RealTillTimeNotUsed LockID TypeID ServiceID SLAID StateType ArchiveFlag
        UnlockTimeout Changed
    );

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
        = qw(ReplyTo MessageID InReplyTo References AgeTimeUnix CreateTimeUnix PriorityID StateID
        QueueID SenderTypeID OwnerID ResponsibleID ArticleTypeID ArticleFreeKey1
        ArticleFreeKey2 ArticleFreeKey3 ArticleFreeText1 ArticleFreeText2 ArticleFreeText3
        IncomingTime RealTillTimeNotUsed LockID TypeID ServiceID SLAID StateType ArchiveFlag
        UnlockTimeout Changed
    );

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

sub _GetTypes {
    my ( $Self, %Param ) = @_;

    my %Type = ();

    # get type
    %Type = $Self->{TicketObject}->TicketTypeList(
        %Param,
        Action => $Param{Action},
        UserID => $Param{UserID},
    );
    return \%Type;
}

sub ServicesGet {
    my ( $Self, %Param ) = @_;

    my %Service = ();

    # get service
    if ( ( $Param{QueueID} || $Param{TicketID} ) && $Param{CustomerUserID} ) {
        %Service = $Self->{TicketObject}->TicketServiceList(
            %Param,
            Action => $Param{Action},
            UserID => $Param{UserID},
        );
    }
    return \%Service;
}

sub SLAsGet {
    my ( $Self, %Param ) = @_;

    my %SLA = ();

    # get sla
    if ( $Param{ServiceID} ) {
        %SLA = $Self->{TicketObject}->TicketSLAList(
            %Param,
            Action => $Param{Action},
            UserID => $Param{UserID},
        );
    }
    return \%SLA;
}

sub _GetTos {
    my ( $Self, %Param ) = @_;

    # check own selection
    my %NewTos = ();
    if ( $Self->{ConfigObject}->{'Ticket::Frontend::NewQueueOwnSelection'} ) {
        %NewTos = %{ $Self->{ConfigObject}->{'Ticket::Frontend::NewQueueOwnSelection'} };
    }
    else {

        # SelectionType Queue or SystemAddress?
        my %Tos = ();
        if ( $Self->{ConfigObject}->Get('Ticket::Frontend::NewQueueSelectionType') eq 'Queue' ) {
            %Tos = $Self->{TicketObject}->MoveList(
                Type    => 'create',
                Action  => $Param{Action},
                QueueID => $Param{QueueID},
                UserID  => $Param{UserID},
            );
        }
        else {
            %Tos = $Self->{DBObject}->GetTableData(
                Table => 'system_address',
                What  => 'queue_id, id',
                Valid => 1,
                Clamp => 1,
            );
        }

        # get create permission queues
        my %UserGroups = $Self->{GroupObject}->GroupMemberList(
            UserID => $Param{UserID},
            Type   => 'create',
            Result => 'HASH',
            Cached => 1,
        );

        # build selection string
        for my $QueueID ( keys %Tos ) {
            my %QueueData = $Self->{QueueObject}->QueueGet( ID => $QueueID );

            # permission check, can we create new tickets in queue
            next if !$UserGroups{ $QueueData{GroupID} };

            my $String = $Self->{ConfigObject}->Get('Ticket::Frontend::NewQueueSelectionString')
                || '<Realname> <<Email>> - Queue: <Queue>';
            $String =~ s/<Queue>/$QueueData{Name}/g;
            $String =~ s/<QueueComment>/$QueueData{Comment}/g;
            if ( $Self->{ConfigObject}->Get('Ticket::Frontend::NewQueueSelectionType') ne 'Queue' )
            {
                my %SystemAddressData = $Self->{SystemAddress}->SystemAddressGet(
                    ID => $Tos{$QueueID},
                );
                $String =~ s/<Realname>/$SystemAddressData{Realname}/g;
                $String =~ s/<Email>/$SystemAddressData{Name}/g;
            }
            $NewTos{$QueueID} = $String;
        }
    }

    # add empty selection
    $NewTos{''} = '-';
    return \%NewTos;
}

sub _GetNoteTypes {

    # ready for iPhone
    my ( $Self, %Param ) = @_;

    #$Self->{Config} = $Self->{ConfigObject}->Get('Ticket::Frontend::AgentTicketFreeText');
    my %DefaultNoteTypes = %{ $Self->{Config}->{ArticleTypes} };

    my %NoteTypes = $Self->{TicketObject}->ArticleTypeList( Result => 'HASH' );
    for ( keys %NoteTypes ) {
        if ( !$DefaultNoteTypes{ $NoteTypes{$_} } ) {
            delete $NoteTypes{$_};
        }
    }
    return \%NoteTypes;
}

sub _GetScreenElements {
    my ( $Self, %Param ) = @_;

    my @ScreenElements;

    # type
    if ( $Self->{ConfigObject}->Get('Ticket::Type') && $Self->{Config}->{TicketType} ) {
        my $TypeElements = {
            Name     => 'TypeID',
            Title    => $Self->{LanguageObject}->Get('Type'),
            Datatype => 'Text',
            Viewtype => 'Picker',
            Options  => {
                %{
                    $Self->_GetTypes(
                        %Param,
                        UserID => $Param{UserID},
                        )
                    },
            },
            Mandatory => 1,
            Default   => '',
        };
        push @ScreenElements, $TypeElements;
    }

    # from, to
    if ( $Param{Screen} eq 'Phone' ) {
        my $CustomerElements = {
            Name           => 'CustomerUserLogin',
            Title          => $Self->{LanguageObject}->Get('From customer'),
            Datatype       => 'Text',
            Viewtype       => 'AutoCompletion',
            DynamicOptions => {
                Object     => 'CustomObject',
                Method     => 'CustomerSearch',
                Parameters => [
                    {
                        Search => 'CustomerUserLogin',
                    },
                ],
            },
            Mandatory => 1,
            Default   => '',
        };
        push @ScreenElements, $CustomerElements;
    }

    if ( $Param{Screen} eq 'Phone' || $Param{Screen} eq 'Move' ) {
        my $Title;
        if ( $Param{Screen} eq 'Phone' ) {
            $Title = 'To queue';
        }
        else {
            $Title = 'New Queue'
        }
        my $QueueElements = {
            Name     => 'QueueID',
            Title    => $Self->{LanguageObject}->Get($Title),
            Datatype => 'Text',
            Viewtype => 'Picker',
            Options  => {
                %{
                    $Self->_GetTos(
                        %Param,
                        UserID => $Param{UserID},
                        )
                    },
            },
            Mandatory => 1,
            Default   => '',
        };
        push @ScreenElements, $QueueElements;
    }

    # service
    if ( $Self->{ConfigObject}->Get('Ticket::Service') && $Self->{Config}->{Service} ) {
        my $ServiceElements = {
            Name           => 'ServiceID',
            Title          => $Self->{LanguageObject}->Get('Service'),
            Datatype       => 'Text',
            Viewtype       => 'Picker',
            DynamicOptions => {
                Object     => 'CustomObject',
                Method     => 'ServicesGet',
                Parameters => [
                    {
                        CustomerUserID => 'CustomerUserLogin',
                        QueueID        => 'QueueID',
                    },
                ],
            },
            Mandatory => 0,
            Default   => '',
        };
        push @ScreenElements, $ServiceElements;
    }

    # sla
    if ( $Self->{ConfigObject}->Get('Ticket::Service') && $Self->{Config}->{Service} ) {
        my $SLAElements = {
            Name           => 'SLAID',
            Title          => $Self->{LanguageObject}->Get('SLA'),
            Datatype       => 'Text',
            Viewtype       => 'Picker',
            DynamicOptions => {
                Object => 'CustomObject',
                Method => 'SLAsGet',
                Parameters =>
                    {
                    CustomerUserID => 'CustomerUserLogin',
                    QueueID        => 'QueueID',
                    ServiceID      => 'ServiceID',
                    },

            },
            Mandatory => 0,
            Default   => '',
        };
        push @ScreenElements, $SLAElements;
    }

    # owner
    if ( $Self->{Config}->{Owner} ) {
        my $Title;
        if ( $Param{Screen} eq 'Move' ) {
            $Title = 'New Owner';
        }
        else {
            $Title = 'Owner';
        }

        my $OwnerElements = {
            Name           => 'NewOwnerID',
            Title          => $Self->{LanguageObject}->Get($Title),
            Datatype       => 'Text',
            Viewtype       => 'Picker',
            DynamicOptions => {
                Object     => 'CustomObject',
                Method     => 'UsersGet',
                Parameters => [
                    {
                        QueueID => 'QueueID',
                    },
                ],
            },
            Mandatory => 0,
            Default   => '',
        };
        push @ScreenElements, $OwnerElements;
    }

    # responsible
    if ( $Self->{ConfigObject}->Get('Ticket::Responsible') && $Self->{Config}->{Responsible} ) {
        my $ResponsibleElements = {
            Name           => 'NewResponsibleID',
            Title          => $Self->{LanguageObject}->Get('Responsible'),
            Datatype       => 'Text',
            Viewtype       => 'Picker',
            DynamicOptions => {
                Object     => 'CustomObject',
                Method     => 'UsersGet',
                Parameters => [
                    {
                        QueueID => 'QueueID',
                    },
                ],
            },
            Mandatory => 0,
            Default   => '',
        };
        push @ScreenElements, $ResponsibleElements;
    }

    if ( $Param{Screen} eq 'Compose' ) {
        my $ComposeFromElements = {
            Name      => 'From',
            Title     => $Self->{LanguageObject}->Get('From'),
            Datatype  => 'Text',
            Viewtype  => 'Input',
            Min       => 1,
            Max       => 50,
            Mandatory => 1,

            # define a RedonlyField to
            # ReadOnly  => 1,
            # get from address from ticket
            Default => '',
        };
        push @ScreenElements, $ComposeFromElements;

        my $ComposeToElements = {
            Name      => 'To',
            Title     => $Self->{LanguageObject}->Get('To'),
            Datatype  => 'Text',
            Viewtype  => 'EMail',
            Min       => 1,
            Max       => 50,
            Mandatory => 0,

            # must be retrieved from the ticket
            Default => '',
        };
        push @ScreenElements, $ComposeToElements;

        my $ComposeCcElements = {
            Name      => 'Cc',
            Title     => $Self->{LanguageObject}->Get('Cc'),
            Datatype  => 'Text',
            Viewtype  => 'EMail',
            Min       => 1,
            Max       => 50,
            Mandatory => 0,
            Default   => '',
        };
        push @ScreenElements, $ComposeCcElements;

        my $ComposeBccElements = {
            Name      => 'Bcc',
            Title     => $Self->{LanguageObject}->Get('Bcc'),
            Datatype  => 'Text',
            Viewtype  => 'EMail',
            Min       => 1,
            Max       => 50,
            Mandatory => 0,
            Default   => '',
        };
        push @ScreenElements, $ComposeBccElements;
    }

    # subject
    my $DefaultSubject = '';
    if ( $Self->{Config}->{Subject} ) {
        $DefaultSubject = $Self->{LanguageObject}->Get( $Self->{Config}->{Subject} )
    }

    my $SubjectElements = {
        Name      => 'Subject',
        Title     => $Self->{LanguageObject}->Get('Subject'),
        Datatype  => 'Text',
        Viewtype  => 'Input',
        Min       => 1,
        Max       => 250,
        Mandatory => 1,
        Default   => $DefaultSubject,
    };
    push @ScreenElements, $SubjectElements;

    # sign
    # define Sign Field
    #         {
    #            Name      => 'SignKeyID',
    #            Title     => $LanguageObject->Get('Sign'),
    #            Datatype  => 'Text',
    #            Viewtype  => 'Picker',
    #            Options  => [],
    #            Mandatory => 0,
    #            Default   => '- none -',
    #        },

    # crypt
    # define Crypt Field
    #        {
    #            Name      => 'CryptKeyID',
    #            Title     => $LanguageObject->Get('Crypt'),
    #            Datatype  => 'Text',
    #            Viewtype  => 'Picker',
    #            Options  => [],
    #            Mandatory => 0,
    #            Default   => '- none -',
    #        },

    # body
    my $BodyElements = {
        Name      => 'Body',
        Title     => $Self->{LanguageObject}->Get('Text'),
        Datatype  => 'Text',
        Viewtype  => 'TextArea',
        Min       => 1,
        Max       => 20_000,
        Mandatory => 1,
        Default   => '',
    };

    push @ScreenElements, $BodyElements;

    # customer id
    if ( $Self->{Config}->{CustomerID} ) {
        my $CustomerElements = {
            Name      => 'CustomerID',
            Title     => $Self->{LanguageObject}->Get('CustomerID'),
            Datatype  => 'Text',
            Viewtype  => 'Input',
            Min       => 1,
            Max       => 150,
            Mandatory => 0,
            Default   => '',
        };
        push @ScreenElements, $CustomerElements;
    }

    #note
    if ( $Self->{Config}->{Note} ) {

        my $DefaultArticleType;
        if ( $Self->{Config}->{ArticleTypeDefault} ) {
            $DefaultArticleType = $Self->{Config}->{ArticleTypeDefault};
        }

        my $DefaultArticleTypeID;
        if ($DefaultArticleType) {
            $DefaultArticleTypeID = $Self->{TicketObject}->ArticleTypeLookup(
                ArticleType => $DefaultArticleType,
            );
        }
        my $NoteElements = {
            Name     => 'ArticleTypeID',
            Title    => $Self->{LanguageObject}->Get('Note type'),
            Datatype => 'Text',
            Viewtype => 'Picker',
            Options  => {
                %{ $Self->_GetNoteTypes( %Param, ) }
            },
            Mandatory => 1,
            Default   => $DefaultArticleTypeID,
        };
        push @ScreenElements, $NoteElements;
    }

    # state
    if ( $Self->{Config}->{State} ) {

        my $DefaultState;
        if ( $Self->{Config}->{StateDefault} ) {
            $DefaultState = $Self->{Config}->{StateDefault}
        }

        my $DefaultStateID;
        if ($DefaultState) {

            # can't use StateLookup for 2.4 framework compatibility
            my %State = $Self->{StateObject}->StateGet(
                Name => $DefaultState,
            );

            if (%State) {
                $DefaultStateID = $State{ID};
            }
        }

        my $StateElements = {
            Name           => 'NewStateID',
            Title          => $Self->{LanguageObject}->Get('Next Ticket State'),
            Datatype       => 'Text',
            Viewtype       => 'Picker',
            DynamicOptions => {
                Object     => 'CustomObject',
                Method     => 'NextStatesGet',
                Parameters => [
                    {
                        CustomerUserID => 'CustomerUserLogin',
                        QueueID        => 'QueueID',
                    },
                ],
            },
            Mandatory => 1,
            Default   => $DefaultStateID,
        };
        push @ScreenElements, $StateElements;
    }

    # pending date
    if ( $Param{Screen} eq 'Phone' || $Param{Screen} eq 'Compose' ) {
        my $PendingDateElements = {
            Name      => 'PendingDate',
            Title     => $Self->{LanguageObject}->Get('Pending Date (for pending* states)'),
            Datatype  => 'DateTime',
            Viewtype  => 'Picker',
            Mandatory => 0,
            Default   => '',
        };
        push @ScreenElements, $PendingDateElements;
    }

    # priority
    if ( $Param{Screen} eq 'Phone' ) {

        my $DefaultPriority;
        if ( $Self->{Config}->{PriorityDefault} ) {
            $DefaultPriority = $Self->{Config}->{PriorityDefault};
        }

        my $DefaultPriorityID;
        if ($DefaultPriority) {
            $DefaultPriorityID = $Self->{PriorityObject}->PriorityLookup(
                Priority => $DefaultPriority,
            );
        }

        my $PriorityElements = {
            Name           => 'NewPriorityID',
            Title          => $Self->{LanguageObject}->Get('Priority'),
            Datatype       => 'Text',
            Viewtype       => 'Picker',
            DynamicOptions => {
                Object     => 'CustomObject',
                Method     => 'PrioritiesGet',
                Parameters => [
                    {
                        QueueID => 'QueueID',
                    },
                ],
            },
            Mandatory => 1,
            Default   => $DefaultPriorityID,
        };
        push @ScreenElements, $PriorityElements;
    }

    # ticket freetext fields
    for my $Index ( 1 .. 16 ) {
        if ( $Self->{Config}->{TicketFreeText}->{$Index} ) {

            my $FreeTextElement;

            my $Name;
            $Name = 'TicketFreeText' . $Index;

            my $Title;
            $Title = $Self->{ConfigObject}->Get( 'TicketFreeKey' . $Index . '::DefaultSelection' );

            my $ViewType;
            if ( $Self->{ConfigObject}->Get( 'TicketFreeText' . $Index ) ) {
                $ViewType = 'Picker';
            }
            else {
                $ViewType = 'Input';
            }

            my @TicketFreeKeys;
            @TicketFreeKeys = $Self->{ConfigObject}->Get( 'TicketFreeKey' . $Index );

            my @Options;
            @Options = $Self->{ConfigObject}->Get( 'TicketFreeText' . $Index );

            my $Mandatory;
            if ( $Self->{Config}->{TicketFreeText}->{$Index} == 2 ) {
                $Mandatory = 1;
            }
            else {
                $Mandatory = 0;
            }

            my $Default;
            if ( $Self->{ConfigObject}->Get( 'TicketFreeText' . $Index ) ) {
                $Default = $Self->{ConfigObject}->Get(
                    'TicketFreeText' . $Index
                        . '::DefaultSelection'
                );
            }
            else {
                $Default = '';
            }

            if ( $Self->{ConfigObject}->Get( 'TicketFreeText' . $Index ) ) {
                $FreeTextElement = {
                    Name        => $Name,
                    Title       => $Title,
                    FreeTextKey => @TicketFreeKeys,
                    Datatype    => 'Text',
                    Viewtype    => $ViewType,
                    Options     => @Options,
                    Mandatory   => $Mandatory,
                    Default     => $Default,
                    }
            }
            else {
                $FreeTextElement = {
                    Name        => $Name,
                    Title       => $Title,
                    FreeTextKey => @TicketFreeKeys,
                    Datatype    => 'Text',
                    Viewtype    => $ViewType,
                    Min         => 1,
                    Max         => 200,
                    Mandatory   => $Mandatory,
                    Default     => $Default,
                    }
            }

            push @ScreenElements, $FreeTextElement;
        }
    }

    # ticket freetime fields
    for my $Index ( 1 .. 6 ) {
        if ( $Self->{Config}->{TicketFreeTime}->{$Index} ) {

            my $Name;
            $Name = 'TicketFreeTime' . $Index;

            my $Title;
            $Title = $Self->{ConfigObject}->Get( 'TicketFreeTimeKey' . $Index );

            my $Mandatory;
            if ( $Self->{ConfigObject}->Get( 'TicketFreeTimeOptional' . $Index ) ) {
                $Mandatory = 0;
            }
            else {
                $Mandatory = 1;
            }

            my $DefaultTimeFormated;
            my $TimeDiff = 0;
            if ( $Self->{ConfigObject}->Get( 'TicketFreeTimeDiff' . $Index ) ) {
                $TimeDiff = $Self->{ConfigObject}->Get( 'TicketFreeTimeDiff' . $Index );
            }
            my $DefaultTime = $Self->{TimeObject}->SystemTime() - $TimeDiff;

            $DefaultTimeFormated = $Self->{TimeObject}->SystemTime2TimeStamp(
                SystemTime => $DefaultTime,
            );

            my $FreeTimeElement = {
                Name      => $Name,
                Title     => $Title,
                Datatype  => 'DateTime',
                Viewtype  => 'Picker',
                Mandatory => $Mandatory,
                Default   => $DefaultTimeFormated,
            };
            push @ScreenElements, $FreeTimeElement;
        }
    }

    # article freetext fields
    for my $Index ( 1 .. 3 ) {
        if ( $Self->{Config}->{ArticleFreeText}->{$Index} ) {

            my $FreeTextElement;

            my $Name;
            $Name = 'ArticleFreeText' . $Index;

            my $Title;
            $Title = $Self->{ConfigObject}->Get( 'ArticleFreeKey' . $Index . '::DefaultSelection' );

            my $ViewType;
            if ( $Self->{ConfigObject}->Get( 'ArticleFreeText' . $Index ) ) {
                $ViewType = 'Picker';
            }
            else {
                $ViewType = 'Input';
            }

            my @ArticleFreeKeys;
            @ArticleFreeKeys = $Self->{ConfigObject}->Get( 'ArticleFreeKey' . $Index );

            my @Options;
            @Options = $Self->{ConfigObject}->Get( 'ArticleFreeText' . $Index );

            my $Mandatory;
            if ( $Self->{Config}->{ArticleFreeText}->{$Index} == 2 ) {
                $Mandatory = 1;
            }
            else {
                $Mandatory = 0;
            }

            my $Default;
            if ( $Self->{ConfigObject}->Get( 'ArticleFreeText' . $Index ) ) {
                $Default = $Self->{ConfigObject}->Get(
                    'ArticleFreeText' . $Index
                        . '::DefaultSelection'
                );
            }
            else {
                $Default = '';
            }

            if ( $Self->{ConfigObject}->Get( 'ArticleFreeText' . $Index ) ) {
                $FreeTextElement = {
                    Name        => $Name,
                    Title       => $Title,
                    FreeTextKey => @ArticleFreeKeys,
                    Datatype    => 'Text',
                    Viewtype    => $ViewType,
                    Options     => @Options,
                    Mandatory   => $Mandatory,
                    Default     => $Default,
                    }
            }
            else {
                $FreeTextElement = {
                    Name        => $Name,
                    Title       => $Title,
                    FreeTextKey => @ArticleFreeKeys,
                    Datatype    => 'Text',
                    Viewtype    => $ViewType,
                    Min         => 1,
                    Max         => 200,
                    Mandatory   => $Mandatory,
                    Default     => $Default,
                    }
            }

            push @ScreenElements, $FreeTextElement;
        }
    }

    # time units
    if ( $Self->{Config}->{TimeUnits} ) {
        my $TimeUnitsElements = {
            Name      => 'TimeUnits',
            Title     => $Self->{LanguageObject}->Get('Time units (work units)'),
            Datatype  => 'Text',
            Viewtype  => 'Input',
            Min       => 1,
            Max       => 10,
            Mandatory => 0,
            Default   => '',
        };
        push @ScreenElements, $TimeUnitsElements;
    }
    return \@ScreenElements;
}

sub CustomerSearch {
    my ( $Self, %Param ) = @_;

    my %Customers = $Self->{CustomerUserObject}->CustomerSearch(
        Search => $Param{Search},
    );
    return \%Customers;
}

sub UsersGet {
    my ( $Self, %Param ) = @_;

    # get users
    my %ShownUsers       = ();
    my %AllGroupsMembers = $Self->{UserObject}->UserList(
        Type  => 'Long',
        Valid => 1,
    );

    # just show only users with selected custom queue
    if ( $Param{QueueID} && !$Param{AllUsers} ) {
        my @UserIDs = $Self->{TicketObject}->GetSubscribedUserIDsByQueueID(%Param);
        for ( keys %AllGroupsMembers ) {
            my $Hit = 0;
            for my $UID (@UserIDs) {
                if ( $UID eq $_ ) {
                    $Hit = 1;
                }
            }
            if ( !$Hit ) {
                delete $AllGroupsMembers{$_};
            }
        }
    }

    # show all system users
    if ( $Self->{ConfigObject}->Get('Ticket::ChangeOwnerToEveryone') ) {
        %ShownUsers = %AllGroupsMembers;
    }

    # show all users who are rw in the queue group
    elsif ( $Param{QueueID} ) {
        my $GID = $Self->{QueueObject}->GetQueueGroupID( QueueID => $Param{QueueID} );
        my %MemberList = $Self->{GroupObject}->GroupMemberList(
            GroupID => $GID,
            Type    => 'rw',
            Result  => 'HASH',
            Cached  => 1,
        );
        for ( keys %MemberList ) {
            if ( $AllGroupsMembers{$_} ) {
                $ShownUsers{$_} = $AllGroupsMembers{$_};
            }
        }
    }
    return \%ShownUsers;
}

sub NextStatesGet {
    my ( $Self, %Param ) = @_;

    my %NextStates = ();
    if ( $Param{QueueID} || $Param{TicketID} ) {
        %NextStates = $Self->{TicketObject}->StateList(
            %Param,
            Action => $Param{Action},
            UserID => $Param{UserID},
        );
    }
    return \%NextStates;
}

sub PrioritiesGet {
    my ( $Self, %Param ) = @_;

    my %Priorities = ();

    # get priority
    if ( $Param{QueueID} || $Param{TicketID} ) {
        %Priorities = $Self->{TicketObject}->PriorityList(
            %Param,
            Action => $Param{Action},
            UserID => $Param{UserID},
        );
    }
    return \%Priorities;
}

sub ScreenActions() {
    my ( $Self, %Param ) = @_;

    if ( $Param{Action} ) {
        my $Result;
        if ( $Param{Action} eq 'Phone' ) {
            $Result = $Self->_TicketPhoneNew(%Param);
            return $Result;
        }
        if ( $Param{Action} eq 'Note' || $Param{Action} eq 'Close' ) {
            $Result = $Self->_TicketCommonActions(%Param);
            return $Result;
        }
        if ( $Param{Action} eq 'Compose' ) {
            $Result = $Self->_TicketCompose(%Param);
            return $Result;
        }
        if ( $Param{Action} eq 'Move' ) {
            $Result = $Self->_TicketMove(%Param);
            return $Result;
        }
        return 'Action undefined! expected Phone, Note, Close, Compose or Move, but '
            . $Param{Action} . ' found';
    }
    else {
        return 'Need Action!'
    }
}

sub _TicketPhoneNew {
    my ( $Self, %Param ) = @_;

    $Self->{Config} = $Self->{ConfigObject}->Get('iPhone::Frontend::AgentTicketPhone');

    my $Error;
    my %StateData = ();
    if ( $Param{NewStateID} ) {
        %StateData = $Self->{TicketObject}->{StateObject}->StateGet(
            ID => $Param{NewStateID},
        );
    }
    my $NextState    = $StateData{Name} || '';
    my $NewQueueID   = $Param{QueueID};
    my $CustomerUser = $Param{CustomerUserLogin};
    my $CustomerID   = $Param{CustomerID} || '';

    # rewrap body if exists
    if ( $Self->{ConfigObject}->Get('Frontend::RichText') && $Param{Body} ) {
        $Param{Body}
            =~ s/(^>.+|.{4,$Self->{ConfigObject}->Get('Ticket::Frontend::TextAreaNote')})(?:\s|\z)/$1\n/gm;
    }

    # check pending date
    if ( $StateData{TypeName} && $StateData{TypeName} =~ /^pending/i ) {
        if ( !$Self->{TimeObject}->TimeStamp2SystemTime( String => $Param{PendingDate} ) ) {
            $Error = "Date invalid";
            return $Error;
        }
        if (
            $Self->{TimeObject}->TimeStamp2SystemTime( String => $Param{PendingDate} )
            < $Self->{TimeObject}->SystemTime()
            )
        {
            $Error = "Date invalid";
            return $Error;
        }
    }

    # get free text config options
    my %TicketFreeText = ();
    for ( 1 .. 16 ) {

        # check required FreeTextField (if configured)
        if (
            $Self->{Config}{'TicketFreeText'}->{$_} == 2
            && $Param{"TicketFreeText$_"} eq ''
            )
        {
            $Error = "TicketFreeTextField$_ invalid";
            retrun $Error;
        }
    }

    #get customer info
    my %CustomerUserData = $Self->{CustomerUserObject}->CustomerUserDataGet(
        User => $CustomerUser,
    );
    my %CustomerUserList = $Self->{CustomerUserObject}->CustomerSearch(
        UserLogin => $CustomerUser,
    );
    my $From;
    for ( keys %CustomerUserList ) {

        if ( $Param{CustomerUserLogin} eq $_ ) {
            $From = $CustomerUserList{$_}
        }
        else {
            $From = $CustomerUser;
        }
    }

    # check email address
    for my $Email ( Mail::Address->parse( $CustomerUserData{UserEmail} ) ) {
        if ( !$Self->{CheckItemObject}->CheckEmail( Address => $Email->address() ) ) {
            $Error = 'From invalid' . $Self->{CheckItemObject}->CheckError();
            return $Error;
        }
    }
    if ( !$Param{CustomerUserLogin} ) {
        $Error = 'From invalid';
        return $Error;
    }
    if ( !$Param{Subject} ) {
        $Error = 'Subject invalid';
        return $Error;
    }
    if ( !$NewQueueID ) {
        $Error = 'Destination invalid';
        return $Error;
    }
    if (
        $Self->{ConfigObject}->Get('Ticket::Service')
        && $Param{SLAID}
        && !$Param{ServiceID}
        )
    {
        $Error = 'Service invalid';
        return $Error
    }

    # create new ticket, do db insert
    my $TicketID = $Self->{TicketObject}->TicketCreate(
        Title        => $Param{Subject},
        QueueID      => $NewQueueID,
        Subject      => $Param{Subject},
        Lock         => 'unlock',
        TypeID       => $Param{TypeID},
        ServiceID    => $Param{ServiceID},
        SLAID        => $Param{SLAID},
        StateID      => $Param{NewStateID},
        PriorityID   => $Param{NewPriorityID},
        OwnerID      => 1,
        CustomerNo   => $CustomerID,
        CustomerUser => $CustomerUser,
        UserID       => $Param{UserID},
    );
    if ( !$TicketID ) {
        return 'Error No ticket created';
    }

    # set ticket free text
    for ( 1 .. 16 ) {
        if ( defined( $Param{"TicketFreeKey$_"} ) ) {
            $Self->{TicketObject}->TicketFreeTextSet(
                TicketID => $TicketID,
                Key      => $Param{"TicketFreeKey$_"},
                Value    => $Param{"TicketFreeText$_"},
                Counter  => $_,
                UserID   => $Param{UserID},
            );
        }
    }

    # set ticket free time
    for ( 1 .. 6 ) {

        if ( $Param{ 'TicketFreeTime' . $_ } ) {
            my ( $Sec, $Min, $Hour, $Day, $Month, $Year, $WeekDay )
                = $Self->{TimeObject}->SystemTime2Date(
                SystemTime => $Self->{TimeObject}->SystemTime( $Param{ 'TicketFreeTime' . $_ } ),
                );

            $Param{ 'TicketFreeTime' . $_ . 'Year' }   = $Year;
            $Param{ 'TicketFreeTime' . $_ . 'Month' }  = $Month;
            $Param{ 'TicketFreeTime' . $_ . 'Day' }    = $Day;
            $Param{ 'TicketFreeTime' . $_ . 'Hour' }   = $Hour;
            $Param{ 'TicketFreeTime' . $_ . 'Minute' } = $Min;

            # set time stamp to NULL if field is not used/checked
            if ( !$Param{ 'TicketFreeTime' . $_ . 'Used' } ) {
                $Param{ 'TicketFreeTime' . $_ . 'Year' }   = 0;
                $Param{ 'TicketFreeTime' . $_ . 'Month' }  = 0;
                $Param{ 'TicketFreeTime' . $_ . 'Day' }    = 0;
                $Param{ 'TicketFreeTime' . $_ . 'Hour' }   = 0;
                $Param{ 'TicketFreeTime' . $_ . 'Minute' } = 0;
            }

            # set free time
            $Self->{TicketObject}->TicketFreeTimeSet(
                %Param,
                Prefix   => 'TicketFreeTime',
                TicketID => $TicketID,
                Counter  => $_,
                UserID   => $Param{UserID},
            );
        }
    }

    my $MimeType = 'text/plain';
    if ( $Self->{ConfigObject}->Get('Frontend::RichText') ) {
        $MimeType = 'text/html';
    }

    # check if new owner is given (then send no agent notify)
    my $NoAgentNotify = 0;
    if ( $Param{NewOwnerID} ) {
        $NoAgentNotify = 1;
    }
    my $QueueName = $Self->{QueueObject}->QueueLookup( QueueID => $NewQueueID );
    my $ArticleID = $Self->{TicketObject}->ArticleCreate(
        NoAgentNotify => $NoAgentNotify,
        TicketID      => $TicketID,
        ArticleType   => $Self->{Config}->{ArticleType},
        SenderType    => $Self->{Config}->{SenderType},
        From          => $From,
        To            => $QueueName,
        Subject       => $Param{Subject},
        Body          => $Param{Body},
        MimeType      => $MimeType,

        # iphone must send info in current charset
        Charset          => $Self->{ConfigObject}->Get('DefaultCharset'),
        UserID           => $Param{UserID},
        HistoryType      => $Self->{Config}->{HistoryType},
        HistoryComment   => $Self->{Config}->{HistoryComment} || '%%',
        AutoResponseType => 'auto reply',
        OrigHeader       => {
            From    => $From,
            To      => $QueueName,
            Subject => $Param{Subject},
            Body    => $Param{Body},
        },
        Queue => $QueueName,
    );

    if ($ArticleID) {

        # set article free text
        for ( 1 .. 3 ) {
            if ( defined( $Param{"ArticleFreeKey$_"} ) ) {
                $Self->{TicketObject}->ArticleFreeTextSet(
                    TicketID  => $TicketID,
                    ArticleID => $ArticleID,
                    Key       => $Param{"ArticleFreeKey$_"},
                    Value     => $Param{"ArticleFreeText$_"},
                    Counter   => $_,
                    UserID    => $Param{UserID},
                );
            }
        }

        # set owner (if new user id is given)
        if ( $Param{NewOwnerID} ) {
            $Self->{TicketObject}->OwnerSet(
                TicketID  => $TicketID,
                NewUserID => $Param{NewOwnerID},
                UserID    => $Param{UserID},
            );

            # set lock
            $Self->{TicketObject}->LockSet(
                TicketID => $TicketID,
                Lock     => 'lock',
                UserID   => $Param{UserID},
            );
        }

        # else set owner to current agent but do not lock it
        else {
            $Self->{TicketObject}->OwnerSet(
                TicketID           => $TicketID,
                NewUserID          => $Param{UserID},
                SendNoNotification => 1,
                UserID             => $Param{UserID},
            );
        }

        # set responsible (if new user id is given)
        if ( $Param{NewResponsibleID} ) {
            $Self->{TicketObject}->ResponsibleSet(
                TicketID  => $TicketID,
                NewUserID => $Param{NewResponsibleID},
                UserID    => $Param{UserID},
            );
        }

        # time accounting
        if ( $Param{TimeUnits} ) {
            $Self->{TicketObject}->TicketAccountTime(
                TicketID  => $TicketID,
                ArticleID => $ArticleID,
                TimeUnit  => $Param{TimeUnits},
                UserID    => $Param{UserID},
            );
        }

        # should i set an unlock?
        my %StateData = $Self->{StateObject}->StateGet( ID => $Param{NewStateID} );
        if ( $StateData{TypeName} =~ /^close/i ) {
            $Self->{TicketObject}->LockSet(
                TicketID => $TicketID,
                Lock     => 'unlock',
                UserID   => $Param{UserID},
            );
        }

        # set pending time
        elsif ( $StateData{TypeName} =~ /^pending/i ) {

            # set pending time
            $Self->{TicketObject}->TicketPendingTimeSet(
                UserID   => $Param{UserID},
                TicketID => $TicketID,
                String   => $Param{PendingDate},
            );
        }
        return $TicketID;
    }
    else {
        return 'Error no Article was created';
    }
}

sub _TicketCommonActions {
    my ( $Self, %Param ) = @_;

    #return 'Under Development';
    my $Error;
    $Self->{Config}
        = $Self->{ConfigObject}->Get( 'iPhone::Frontend::AgentTicket' . $Param{Action} );

    my %StateData = ();

    if ( $Param{NewStateID} ) {
        %StateData = $Self->{TicketObject}->{StateObject}->StateGet(
            ID => $Param{NewStateID},
        );
    }

    # check needed stuff
    if ( !$Param{TicketID} ) {
        $Error = 'No TicketID is given! Please contact the admin.';
        return $Error;
    }

    # check permissions
    my $Access;
    if ( $Self->{'API3X'} ) {
        $Access = $Self->{TicketObject}->TicketPermission(
            Type     => $Self->{Config}->{Permission},
            TicketID => $Param{TicketID},
            UserID   => $Param{UserID},
        );
    }
    else {
        $Access = $Self->{TicketObject}->Permission(
            Type     => $Self->{Config}->{Permission},
            TicketID => $Param{TicketID},
            UserID   => $Param{UserID},
        );
    }

    # error screen, don't show ticket
    if ( !$Access ) {
        $Error = "You need $Self->{Config}->{Permission} permissions!";
        return $Error;
    }

    my %Ticket = $Self->{TicketObject}->TicketGet( TicketID => $Param{TicketID} );

    # get lock state
    if ( $Self->{Config}->{RequiredLock} ) {
        if ( !$Self->{TicketObject}->TicketLockGet( TicketID => $Param{TicketID} ) ) {
            $Self->{TicketObject}->TicketLockSet(
                TicketID => $Param{TicketID},
                Lock     => 'lock',
                UserID   => $Param{UserID},
            );
            my $Success = $Self->{TicketObject}->TicketOwnerSet(
                TicketID  => $Param{TicketID},
                UserID    => $Param{UserID},
                NewUserID => $Param{UserID},
            );
        }
        else {
            my $AccessOk = $Self->{TicketObject}->OwnerCheck(
                TicketID => $Param{TicketID},
                OwnerID  => $Param{UserID},
            );
            if ( !$AccessOk ) {
                $Error
                    = 'Sorry, you need to be the owner to do this action! Please change the owner first.';
                return $Error;
            }
        }
    }

# -------------------------------------------------------
#
# not sure that this is needed
#
# -------------------------------------------------------
# get params
#    my %GetParam;
#    for my $Key (
#        qw(
#        NewStateID NewPriorityID TimeUnits ArticleTypeID Title Body Subject NewOwnerID
#        NewResponsibleID TypeID ServiceID SLAID
#        )
#        )
#    {
#        $GetParam{$Key} = $Param{$Key} );
#    }
#
#    # get ticket free text params
#    for my $Count ( 1 .. 16 ) {
#        my $Key  = 'TicketFreeKey' . $Count;
#        my $Text = 'TicketFreeText' . $Count;
#        $GetParam{$Key}  = $Param {$Key} );
#        $GetParam{$Text} = $Param {$Text} );
#    }
#
#    # get ticket free time params
#    FREETIMENUMBER:
#    for my $Count ( 1 .. 6 ) {
#
#        # create freetime prefix
#        my $FreeTimePrefix = 'TicketFreeTime' . $Count;
#
#        # get form params
#        for my $Type (qw(Used Year Month Day Hour Minute)) {
#            $GetParam{ $FreeTimePrefix . $Type } = $Self->{aramObject}->GetParam(
#                Param => $FreeTimePrefix . $Type,
#            );
#        }
#
#        # set additional params
#        $GetParam{ $FreeTimePrefix . 'Optional' } = 1;
#        $GetParam{ $FreeTimePrefix . 'Used' } = $GetParam{ $FreeTimePrefix . 'Used' } || 0;
#        if ( !$Self->{ConfigObject}->Get( 'TicketFreeTimeOptional' . $Count ) ) {
#            $GetParam{ $FreeTimePrefix . 'Optional' } = 0;
#            $GetParam{ $FreeTimePrefix . 'Used' }     = 1;
#        }
#
#        # check the timedata
#        my $TimeDataComplete = 1;
#        TYPE:
#        for my $Type (qw(Used Year Month Day Hour Minute)) {
#            next TYPE if defined $GetParam{ $FreeTimePrefix . $Type };
#
#            $TimeDataComplete = 0;
#            last TYPE;
#        }
#
#        next FREETIMENUMBER if $TimeDataComplete;
#
#        if ( !$Ticket{$FreeTimePrefix} ) {
#            for my $Type (qw(Used Year Month Day Hour Minute)) {
#                delete $GetParam{ $FreeTimePrefix . $Type };
#            }
#            next FREETIMENUMBER;
#        }
#
#        # get freetime data from ticket
#        my $TicketFreeTimeString = $Self->{TimeObject}->TimeStamp2SystemTime(
#            String => $Ticket{$FreeTimePrefix},
#        );
#        my ( $Second, $Minute, $Hour, $Day, $Month, $Year ) = $Self->{TimeObject}->SystemTime2Date(
#            SystemTime => $TicketFreeTimeString,
#        );
#
#        $GetParam{ $FreeTimePrefix . 'UsedFromTicket' } = 1;
#        $GetParam{ $FreeTimePrefix . 'Used' }           = 1;
#        $GetParam{ $FreeTimePrefix . 'Minute' }         = $Minute;
#        $GetParam{ $FreeTimePrefix . 'Hour' }           = $Hour;
#        $GetParam{ $FreeTimePrefix . 'Day' }            = $Day;
#        $GetParam{ $FreeTimePrefix . 'Month' }          = $Month;
#        $GetParam{ $FreeTimePrefix . 'Year' }           = $Year;
#    }
#
#    # get article free text params
#    for my $Count ( 1 .. 3 ) {
#        my $Key  = 'ArticleFreeKey' . $Count;
#        my $Text = 'ArticleFreeText' . $Count;
#        $GetParam{$Key}  = $Self->{aramObject}->GetParam( Param => $Key );
#        $GetParam{$Text} = $Self->{aramObject}->GetParam( Param => $Text );
#    }
#
#    # transform pending time, time stamp based on user time zone
#    if (
#        defined $GetParam{Year}
#        && defined $GetParam{Month}
#        && defined $GetParam{Day}
#        && defined $GetParam{Hour}
#        && defined $GetParam{Minute}
#        )
#    {
#        %GetParam = $Self->{ayoutObject}->TransfromDateSelection(
#            %GetParam,
#        );
#    }
#
#    # transform free time, time stamp based on user time zone
#    for my $Count ( 1 .. 6 ) {
#        my $Prefix = 'TicketFreeTime' . $Count;
#        next if $etParam{ $Prefix . 'UsedFromTicket' };
#        next if !defined $etParam{ $Prefix . 'Year' };
#        next if !defined $etParam{ $Prefix . 'Month' };
#        next if !defined $etParam{ $Prefix . 'Day' };
#        next if !defined $etParam{ $Prefix . 'Hour' };
#        next if !defined $etParam{ $Prefix . 'Minute' };
#        %etParam = $Self->{ayoutObject}->TransfromDateSelection(
#            %etParam,
#            Prefix => $Prefix
#        );
#    }

    # rewrap body if no rich text is used
    if ( $Param{Body} ) {
        my $Size = $Self->{ConfigObject}->Get('Ticket::Frontend::TextAreaNote') || 70;
        $Param{Body} =~ s/(^>.+|.{4,$Size})(?:\s|\z)/$1\n/gm;
    }

    #    if ( $Self->{Subaction} eq 'Store' ) {

    # check pending date
    if ( $StateData{TypeName} && $StateData{TypeName} =~ /^pending/i ) {
        if ( !$Self->{TimeObject}->TimeStamp2SystemTime( String => $Param{PendingDate} ) ) {
            $Error = "Date invalid";
            return $Error;
        }
        if (
            $Self->{TimeObject}->TimeStamp2SystemTime( String => $Param{PendingDate} )
            < $Self->{TimeObject}->SystemTime()
            )
        {
            $Error = "Date invalid";
            return $Error;
        }
    }

    if ( $Self->{Config}->{Note} ) {

        # check subject
        if ( !$Param{Subject} ) {
            $Error = 'SubjectInvalid';
            return $Error;
        }

        # check body
        if ( !$Param{Body} ) {
            $Error = 'BodyInvalid';
            return $Error;
        }
    }

    #        #check owner
    #        if ( $!$etParam{NewOwnerID} ) {
    #            $Error{'NewOwnerInvalid'} = 'ServerError';
    #        }
    #        elsif ( $etParam{NewOwnerType} eq 'Old' && !$etParam{OldOwnerID} ) {
    #            $Error{'OldOwnerInvalid'} = 'ServerError';
    #        }

    # check required FreeTextField (if configured)
    for my $Count ( 1 .. 16 ) {
        next if $Self->{Config}->{TicketFreeText}->{$Count} ne 2;
        next if $Param{"TicketFreeText$Count"} ne '';
        $Error = "TicketFreeTextField$Count invalid";
        return $Error;
    }

    #check if Title
    if ( !$Param{Title} ) {
        $Error = 'TitleInvalid';
        return $Error;
    }

   #        # check errors
   #        if (%Error) {
   #
   #            # ticket free text
   #            my %TicketFreeText;
   #            for my $Count ( 1 .. 16 ) {
   #                my $Key  = 'TicketFreeKey' . $Count;
   #                my $Text = 'TicketFreeText' . $Count;
   #                $TicketFreeText{$Key} = $Self->{TicketObject}->TicketFreeTextGet(
   #                    TicketID => $Self->{TicketID},
   #                    Type     => $Key,
   #                    Action   => $Self->{Action},
   #                    UserID   => $Self->{UserID},
   #                );
   #                $TicketFreeText{$Text} = $Self->{TicketObject}->TicketFreeTextGet(
   #                    TicketID => $Self->{TicketID},
   #                    Type     => $Text,
   #                    Action   => $Self->{Action},
   #                    UserID   => $Self->{UserID},
   #                );
   #            }
   #            my %TicketFreeTextHTML = $Self->{ayoutObject}->AgentFreeText(
   #                Config => \%TicketFreeText,
   #                Ticket => \%etParam,
   #            );
   #
   #            # ticket free time
   #            my %TicketFreeTimeHTML = $Self->{ayoutObject}->AgentFreeDate( Ticket => \%etParam );
   #
   #            # article free text
   #            my %ArticleFreeText;
   #            for my $Count ( 1 .. 3 ) {
   #                my $Key  = 'ArticleFreeKey' . $Count;
   #                my $Text = 'ArticleFreeText' . $Count;
   #                $ArticleFreeText{$Key} = $Self->{TicketObject}->ArticleFreeTextGet(
   #                    TicketID => $Self->{TicketID},
   #                    Type     => $Key,
   #                    Action   => $Self->{Action},
   #                    UserID   => $Self->{UserID},
   #                );
   #                $ArticleFreeText{$Text} = $Self->{TicketObject}->ArticleFreeTextGet(
   #                    TicketID => $Self->{TicketID},
   #                    Type     => $Text,
   #                    Action   => $Self->{Action},
   #                    UserID   => $Self->{UserID},
   #                );
   #            }
   #            my %ArticleFreeTextHTML = $Self->{ayoutObject}->TicketArticleFreeText(
   #                Config  => \%ArticleFreeText,
   #                Article => \%etParam,
   #            );
   #                Attachments       => \@Attachments,
   #                TimeUnitsRequired => (
   #                    $Self->{ConfigObject}->Get('Ticket::Frontend::NeedAccountedTime')
   #                    ? 'Validate_Required'
   #                    : ''
   #                ),
   #                %Ticket,
   #                %TicketFreeTextHTML,
   #                %TicketFreeTimeHTML,
   #                %ArticleFreeTextHTML,
   #                %GetParam,
   #                %Error,
   #            );
   #        }

    # set new title
    if ( $Self->{Config}->{Title} ) {
        if ( defined $Param{Title} ) {
            $Self->{TicketObject}->TicketTitleUpdate(
                Title    => $Param{Title},
                TicketID => $Param{TicketID},
                UserID   => $Param{UserID},
            );
        }
    }

    # set new type
    if ( $Self->{ConfigObject}->Get('Ticket::Type') && $Self->{Config}->{TicketType} ) {
        if ( $Param{TypeID} ) {
            $Self->{TicketObject}->TicketTypeSet(
                TypeID   => $Param{TypeID},
                TicketID => $Param{TicketID},
                UserID   => $Param{UserID},
            );
        }
    }

    # set new service
    if ( $Self->{ConfigObject}->Get('Ticket::Service') && $Self->{Config}->{Service} ) {
        if ( defined $Param{ServiceID} ) {
            $Self->{TicketObject}->TicketServiceSet(
                ServiceID      => $Param{ServiceID},
                TicketID       => $Param{TicketID},
                CustomerUserID => $Ticket{CustomerUserID},
                UserID         => $Param{UserID},
            );
        }
        if ( defined $Param{SLAID} ) {
            $Self->{TicketObject}->TicketSLASet(
                SLAID    => $Param{SLAID},
                TicketID => $Param{TicketID},
                UserID   => $Param{UserID},
            );
        }
    }

    # set new owner
    my @NotifyDone;
    if ( $Self->{Config}->{Owner} ) {
        my $BodyText = $Param{Body} || '';
        if ( $Param{NewOwnerID} ) {
            $Self->{TicketObject}->TicketLockSet(
                TicketID => $Param{TicketID},
                Lock     => 'lock',
                UserID   => $Param{UserID},
            );
            my $Success = $Self->{TicketObject}->TicketOwnerSet(
                TicketID  => $Param{TicketID},
                UserID    => $Param{UserID},
                NewUserID => $Param{NewOwnerID},
                Comment   => $BodyText,
            );

            # remember to not notify owner twice
            if ( $Success && $Success eq 1 ) {
                push @NotifyDone, $Param{NewOwnerID};
            }
        }
    }

    # set new responsible
    if ( $Self->{Config}->{Responsible} ) {
        if ( $Param{NewResponsibleID} ) {
            my $BodyText = $Param{Body} || '';
            my $Success = $Self->{TicketObject}->TicketResponsibleSet(
                TicketID  => $Param{TicketID},
                UserID    => $Param{UserID},
                NewUserID => $Param{NewResponsibleID},
                Comment   => $BodyText,
            );

            # remember to not notify responsible twice
            if ( $Success && $Success eq 1 ) {
                push @NotifyDone, $Param{NewResponsibleID};
            }
        }
    }

    # add note
    my $ArticleID = '';
    if ( $Self->{Config}->{Note} ) {
        my $MimeType = 'text/plain';

        my %User = $Self->{UserObject}->GetUserData(
            UserID => $Param{UserID},
        );

        my $From = "$User{UserFirstname} $User{UserLastname} <$User{UserEmail}>";

        # agent list
        my %InformedUsers;
        if ( $Self->{Config}->{InformAgent} ) {
            my %AllGroupsMembers = $Self->{UserObject}->UserList(
                Type  => 'Long',
                Valid => 1,
            );
            my $GID = $Self->{QueueObject}->GetQueueGroupID( QueueID => $Ticket{QueueID} );
            my %MemberList = $Self->{GroupObject}->GroupMemberList(
                GroupID => $GID,
                Type    => 'note',
                Result  => 'HASH',
                Cached  => 1,
            );
            for my $UserID ( keys %MemberList ) {
                $InformedUsers{$UserID} = $AllGroupsMembers{$UserID};
            }
        }

        # get involved
        my %InvolvedUsers;
        if ( $Self->{Config}->{InvolvedAgent} ) {
            my @UserIDs
                = $Self->{TicketObject}->TicketInvolvedAgentsList( TicketID => $Self->{TicketID} );
            my $Counter = 0;
            for my $User ( reverse @UserIDs ) {
                $Counter++;
                next if $InvolvedUsers{ $User->{UserID} };
                $InvolvedUsers{ $User->{UserID} } = "$Counter: $User->{UserLastname} "
                    . "$User->{UserFirstname} ($User->{UserLogin})";
            }
        }

        #    my @NotifyUserIDs = ( @{ $InformedUsers }, @{ $InvolvedUsers } );
        $ArticleID = $Self->{TicketObject}->ArticleCreate(
            TicketID   => $Param{TicketID},
            SenderType => 'agent',
            From       => $From,
            MimeType   => $MimeType,

            # iphone must send info in current charset
            Charset => $Self->{ConfigObject}->Get('DefaultCharset'),

            #Charset                         => $Self->{ayoutObject}->{UserCharset},
            UserID         => $Param{UserID},
            HistoryType    => $Self->{Config}->{HistoryType},
            HistoryComment => $Self->{Config}->{HistoryComment},

            #                ForceNotificationToUserID       => \@NotifyUserIDs,
            ExcludeMuteNotificationToUserID => \@NotifyDone,
            %Param,
        );

        # time accounting
        if ( $Param{TimeUnits} ) {
            $Self->{TicketObject}->TicketAccountTime(
                TicketID  => $Param{TicketID},
                ArticleID => $ArticleID,
                TimeUnit  => $Param{TimeUnits},
                UserID    => $Param{UserID},
            );
        }

        #
        #
        #        # set ticket free text
        #        for my $Count ( 1 .. 16 ) {
        #            my $Key  = 'TicketFreeKey' . $Count;
        #            my $Text = 'TicketFreeText' . $Count;
        #            next if !defined $GetParam{$Key};
        #            $Self->{TicketObject}->TicketFreeTextSet(
        #                TicketID => $Self->{TicketID},
        #                Key      => $GetParam{$Key},
        #                Value    => $GetParam{$Text},
        #                Counter  => $Count,
        #                UserID   => $Self->{UserID},
        #            );
        #        }
        #
        #        # set ticket free time
        #        for my $Count ( 1 .. 6 ) {
        #            my $Prefix = 'TicketFreeTime' . $Count;
        #            next if !defined $GetParam{ $Prefix . 'Year' };
        #            next if !defined $GetParam{ $Prefix . 'Month' };
        #            next if !defined $GetParam{ $Prefix . 'Day' };
        #            next if !defined $GetParam{ $Prefix . 'Hour' };
        #            next if !defined $GetParam{ $Prefix . 'Minute' };
        #
        #            # set time stamp to NULL if field is not used/checked
        #            if ( !$GetParam{ $Prefix . 'Used' } ) {
        #                $GetParam{ $Prefix . 'Year' }   = 0;
        #                $GetParam{ $Prefix . 'Month' }  = 0;
        #                $GetParam{ $Prefix . 'Day' }    = 0;
        #                $GetParam{ $Prefix . 'Hour' }   = 0;
        #                $GetParam{ $Prefix . 'Minute' } = 0;
        #            }
        #
        #            # set free time
        #            $Self->{TicketObject}->TicketFreeTimeSet(
        #                %GetParam,
        #                Prefix   => 'TicketFreeTime',
        #                TicketID => $Self->{TicketID},
        #                Counter  => $Count,
        #                UserID   => $Self->{UserID},
        #            );
        #        }
        #
        #        # set article free text
        #        for my $Count ( 1 .. 3 ) {
        #            my $Key  = 'ArticleFreeKey' . $Count;
        #            my $Text = 'ArticleFreeText' . $Count;
        #            next if !defined $GetParam{$Key};
        #            $Self->{TicketObject}->ArticleFreeTextSet(
        #                TicketID  => $Self->{TicketID},
        #                ArticleID => $ArticleID,
        #                Key       => $GetParam{$Key},
        #                Value     => $GetParam{$Text},
        #                Counter   => $Count,
        #                UserID    => $Self->{UserID},
        #            );
        #        }
        #
        # set priority
        if ( $Self->{Config}->{Priority} && $Param{NewPriorityID} ) {
            $Self->{TicketObject}->TicketPrioritySet(
                TicketID   => $Param{TicketID},
                PriorityID => $Param{NewPriorityID},
                UserID     => $Param{UserID},
            );
        }

        # set state
        if ( $Self->{Config}->{State} && $Param{NewStateID} ) {
            $Self->{TicketObject}->TicketStateSet(
                TicketID => $Param{TicketID},
                StateID  => $Param{NewStateID},
                UserID   => $Param{UserID},
            );

            # unlock the ticket after close
            my %StateData = $Self->{TicketObject}->{StateObject}->StateGet(
                ID => $Param{NewStateID},
            );

            # set unlock on close state
            if ( $StateData{TypeName} =~ /^close/i ) {
                $Self->{TicketObject}->TicketLockSet(
                    TicketID => $Param{TicketID},
                    Lock     => 'unlock',
                    UserID   => $Param{UserID},
                );
            }

            # set pending time on pendig state
            elsif ( $StateData{TypeName} =~ /^pending/i ) {

                # set pending time
                $Self->{TicketObject}->TicketPendingTimeSet(
                    UserID   => $Param{UserID},
                    TicketID => $Param{TicketID},
                    String   => $Param{PendingDate},
                );
            }
        }
    }
}

sub _TicketCompose {
    my ( $Self, %Param ) = @_;
    return 'Under Development';
}

sub _TicketMove {
    my ( $Self, %Param ) = @_;
    return 'Under Development';
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

$Id: iPhone.pm,v 1.22 2010/07/06 23:37:27 cr Exp $

=cut
