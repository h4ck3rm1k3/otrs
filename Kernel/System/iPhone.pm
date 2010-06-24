# --
# Kernel/System/iPhone.pm - all iPhone handle functions
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: iPhone.pm,v 1.6 2010/06/24 21:27:51 cr Exp $
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

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

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

    my $LanguageObject = Kernel::Language->new( %{$Self}, UserLanguage => $Param{Language} );

    #    my $HttpType = $Self->{ConfigObject}->Get('HttpType');
    #    my $FQDN = $Self->{ConfigObject}->Get('FQDN');
    #    my $ScriptAlias = $Self->{ConfigObject}->Get('ScriptAlias');
    #
    #    # sould be retreived by the config?
    #    my $Handle = 'json.pl'
    #
    #    my $ActionURL = $HttpType . '://' . $FQDN . '/' . $ScriptAlias . $Handle . '?' ;

    my %Config = (
        Phone => {
            Title    => $LanguageObject->Get('New Phone Ticket'),
            Elements => [
                {
                    Name     => 'Type',
                    Title    => $LanguageObject->Get('Type'),
                    Datatype => 'Text',
                    Viewtype => 'Picker',

                    # this options are just for testing
                    Options => {
                        $Self->{TicketObject}->TicketTypeList(
                            UserID => $Param{UserID},
                        ),
                    },
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name     => 'From',
                    Title    => $LanguageObject->Get('From'),
                    Datatype => 'Text',
                    ViewType => 'AutoCompletion',

                    # the list of customers URL is not jet implemented
                    #OptionsURL => $ActionURL . "List of customers",
                    # other option is to use function
                    Options => {
                        $Self->{CustomerUserObject}->CustomerSearch(
                            UserLogin => '*',
                        ),
                    },
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name     => 'To',
                    Title    => $LanguageObject->Get('To'),
                    Datatype => 'Text',
                    Viewtype => 'Picker',
                    Options  => {

                        #%{$Self->_GetTos( %Param, ) },
                        # this options are just for testing
                        $Self->{QueueObject}->GetAllQueues(
                            UserID => $Param{UserID},
                            Type   => 'rw',
                        ),
                    },
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name     => 'Service',
                    Title    => $LanguageObject->Get('Service'),
                    Datatype => 'Text',
                    Viewtype => 'Picker',
                    Options  => {

                        #%{ $Self->_GetServices( %Param, ) }
                        # this options are just for testig
                        $Self->{ServiceObject}->ServiceList(
                            UserID => $Param{UserID},
                        ),
                    },
                    Mandatory => 0,
                    Default   => '',
                },
                {
                    Name     => 'SLA',
                    Title    => $LanguageObject->Get('SLA'),
                    Datatype => 'Text',
                    Viewtype => 'Picker',
                    Options  => {

                        #%{ $Self->_GetSLAs( %Param, ) }
                        # this options are just for testing
                        $Self->{SLAObject}->SLAList(
                            UserID => $Param{UserID},
                        ),
                    },
                    Mandatory => 0,
                    Default   => '',
                },
                {
                    Name     => 'Owner',
                    Title    => $LanguageObject->Get('Owner'),
                    Datatype => 'Text',
                    Viewtype => 'Picker',
                    Options  => {

                        # this options are just for testing
                        $Self->{UserObject}->UserList(
                            Type  => 'Short',
                            Valid => 1,
                        ),
                    },
                    Mandatory => 0,
                    Default   => '',
                },
                {
                    Name     => 'Responsible',
                    Title    => $LanguageObject->Get('Responsible'),
                    Datatype => 'Text',
                    Viewtype => 'Picker',
                    Options  => {

                        # this options are just for testing
                        $Self->{UserObject}->UserList(
                            Type  => 'Short',
                            Valid => 1,
                        ),
                    },
                    Mandatory => 0,
                    Default   => '',
                },
                {
                    Name      => 'Subject',
                    Title     => $LanguageObject->Get('Subject'),
                    DataType  => 'Text',
                    ViewType  => 'Input',
                    Min       => 1,
                    Max       => 250,
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name      => 'Text',
                    Title     => $LanguageObject->Get('Text'),
                    DataType  => 'Text',
                    ViewType  => 'TextArea',
                    Min       => 1,
                    Max       => 20_000,
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name      => 'CustomerID',
                    Title     => $LanguageObject->Get('CustomerID'),
                    DataType  => 'Text',
                    ViewType  => 'Input',
                    Min       => 1,
                    Max       => 150,
                    Mandatory => 0,
                    Default   => '',
                },
                {
                    Name     => 'NextTicketState',
                    Title    => $LanguageObject->Get('Next Ticket State'),
                    Datatype => 'Text',
                    Viewtype => 'Picker',

                    # this options are just for testing
                    Options => {
                        $Self->{StateObject}->StateList(
                            UserID => $Param{UserID},
                        ),
                    },
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name      => 'PemdingDate',
                    Title     => $LanguageObject->Get('Pending Date (for pending* states)'),
                    Datatype  => 'DateTime',
                    Viewtype  => 'Picker',
                    Mandatory => 0,
                    Default   => '',
                },
                {
                    Name     => 'Priority',
                    Title    => $LanguageObject->Get('Priority'),
                    Datatype => 'Text',
                    Viewtype => 'Picker',

                    # this options are just for testing
                    Options => {
                        $Self->{TicketObject}->PriorityList(
                            UserID => $Param{UserID},
                        ),
                    },
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name      => 'DueDate',
                    Title     => $LanguageObject->Get('Pending Date (for pending* states)'),
                    Datatype  => 'DateTime',
                    Viewtype  => 'Picker',
                    Mandatory => 0,
                    Default   => '',
                },
                {
                    Name      => 'TimeUnits',
                    Title     => $LanguageObject->Get('Time units (work units)'),
                    DataType  => 'Text',
                    ViewType  => 'Input',
                    Min       => 1,
                    Max       => 10,
                    Mandatory => 0,
                    Default   => '',
                },

                #            {
                #                    Name  => '',
                #                    Title => '',
                #                    Type  => '',
                #                    Min   =>,
                #                    Max   =>,
                #
                #                    #                    Options => {
                #                    #                    },
                #                    #                    OptionsURL => {
                #                    Mandatory =>,
                #                    Default   =>,
                #                #},
                #            },

            ],
        },
        Note => {
            Title    => $LanguageObject->Get('Add Note'),
            Elements => [
                {
                    Name        => 'Subject',
                    Title       => $LanguageObject->Get('Subject'),
                    DataType    => 'Text',
                    ViewType    => 'Input',
                    Min         => 1,
                    Max         => 250,
                    Mandatory   => 1,
                    Placeholder => 'Note',
                },
                {
                    Name      => 'Text',
                    Title     => $LanguageObject->Get('Text'),
                    DataType  => 'Text',
                    ViewType  => 'TextArea',
                    Min       => 1,
                    Max       => 20_000,
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name     => 'NoteType',
                    Title    => $LanguageObject->Get('Note type'),
                    Datatype => 'Text',
                    Viewtype => 'Picker',
                    Options  => {
                        %{ $Self->_GetNoteTypes( %Param, ) }
                    },
                    Mandatory => 1,
                    Default   => 'note-internal',
                },
                {
                    Name      => 'TimeUnits',
                    Title     => $LanguageObject->Get('Time units (work units)'),
                    DataType  => 'Text',
                    ViewType  => 'Input',
                    Min       => 1,
                    Max       => 10,
                    Mandatory => 0,
                    Default   => '',
                },

                #                {
                #                    Name      => 'Subject',
                #                    Title     => $LanguageObject->Get('Subject'),
                #                    Type      => 'Input',
                #                    Min       => 1,
                #                    Max       => 250,
                #                    Mandatory => 1,
                #                    Default   => '',
                #                },
                #                {
                #                    Name      => 'Body',
                #                    Title     => $LanguageObject->Get('Body'),
                #                    Type      => 'Text',
                #                    Min       => 1,
                #                    Max       => 20_000,
                #                    Mandatory => 1,
                #                    Default   => '',
                #                },
            ],
        },
        Close => {
            Title    => $LanguageObject->Get('Close'),
            Elements => [
                {
                    Name        => 'Subject',
                    Title       => $LanguageObject->Get('Subject'),
                    DataType    => 'Text',
                    ViewType    => 'Input',
                    Min         => 1,
                    Max         => 250,
                    Mandatory   => 1,
                    Placeholder => 'Close',
                },
                {
                    Name      => 'Text',
                    Title     => $LanguageObject->Get('Text'),
                    DataType  => 'Text',
                    ViewType  => 'TextArea',
                    Min       => 1,
                    Max       => 20_000,
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name     => 'NoteType',
                    Title    => $LanguageObject->Get('Note type'),
                    Datatype => 'Text',
                    Viewtype => 'Picker',
                    Options  => {
                        %{ $Self->_GetNoteTypes( %Param, ) }
                    },
                    Mandatory => 1,
                    Default   => 'note-internal',
                },
                {
                    Name     => 'NextTicketState',
                    Title    => $LanguageObject->Get('Next Ticket State'),
                    Datatype => 'Text',
                    Viewtype => 'Picker',

                    # this options are just for testing
                    Options => {
                        $Self->{StateObject}->StateList(
                            UserID => $Param{UserID},
                        ),
                    },
                    Mandatory => 1,
                    Default   => '',
                },
                {
                    Name      => 'TimeUnits',
                    Title     => $LanguageObject->Get('Time units (work units)'),
                    DataType  => 'Text',
                    ViewType  => 'Input',
                    Min       => 1,
                    Max       => 10,
                    Mandatory => 0,
                    Default   => '',
                },

           #                {
           #                    Name      => 'Subject',
           #                    Title     => $LanguageObject->Get('Subject'),
           #                    Type      => 'Input',
           #                    Min       => 1,
           #                    Max       => 250,
           #                    Mandatory => 1,
           #                    Default   => '',
           #                },
           #                {
           #                    Name      => 'Body',
           #                    Title     => $LanguageObject->Get('Body'),
           #                    Type      => 'Text',
           #                    Min       => 1,
           #                    Max       => 20_000,
           #                    Mandatory => 1,
           #                    Default   => '',
           #                },
           #                {
           #                    Name    => 'State',
           #                    Title   => $LanguageObject->Get('State'),
           #                    Type    => 'Option',
           #                    Options => {
           #
           #                        #                        $Self->{TicketObject}->TicketStateList(
           #                        #                            Action   => $Param{Action},
           #                        #                            QueueID  => $Param{QueueID},
           #                        #                            TicketID => $Param{TicketID},
           #                        #                            UserID   => $Param{UserID},
           #                        #                        ),
           #                    },
           #                    Mandatory => 0,
           #                    Default   => '',
           #                },
            ],
        },
        Compose => {
            Title    => $LanguageObject->Get('Compose'),
            Elements => [

           #                {
           #                    Name      => 'To',
           #                    Title     => $LanguageObject->Get('To'),
           #                    Type      => 'Input',
           #                    Min       => 1,
           #                    Max       => 250,
           #                    Mandatory => 1,
           #                    Default   => '',
           #                },
           #                {
           #                    Name      => 'Subject',
           #                    Title     => $LanguageObject->Get('Subject'),
           #                    Type      => 'Input',
           #                    Min       => 1,
           #                    Max       => 250,
           #                    Mandatory => 1,
           #                    Default   => '',
           #                },
           #                {
           #                    Name      => 'Body',
           #                    Title     => $LanguageObject->Get('Body'),
           #                    Type      => 'Text',
           #                    Min       => 1,
           #                    Max       => 20_000,
           #                    Mandatory => 1,
           #                    Default   => '',
           #                },
           #                {
           #                    Name    => 'State',
           #                    Title   => $LanguageObject->Get('State'),
           #                    Type    => 'Option',
           #                    Options => {
           #
           #                        #                        $Self->{TicketObject}->TicketStateList(
           #                        #                            Action   => $Param{Action},
           #                        #                            QueueID  => $Param{QueueID},
           #                        #                            TicketID => $Param{TicketID},
           #                        #                            UserID   => $Param{UserID},
           #                        #                        ),
           #                    },
           #                    Mandatory => 0,
           #                    Default   => '',
           #                },
            ],
        },
    );
    return \%Config;
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

sub _GetServices {
    my ( $Self, %Param ) = @_;

    my %Service = ();

    # get service
    if ( ( $Param{QueueID} || $Param{TicketID} ) && $Param{CustomerUserID} ) {
        %Service = $Self->{TicketObject}->TicketServiceList(
            %Param,
            Action => $Self->{Action},
            UserID => $Self->{UserID},
        );
    }
    return \%Service;
}

sub _GetSLAs {
    my ( $Self, %Param ) = @_;

    my %SLA = ();

    # get sla
    if ( $Param{ServiceID} && $Param{Services} && %{ $Param{Services} } ) {
        if ( $Param{Services}->{ $Param{ServiceID} } ) {
            %SLA = $Self->{TicketObject}->TicketSLAList(
                %Param,
                Action => $Self->{Action},
                UserID => $Self->{UserID},
            );
        }
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
                Action  => $Self->{Action},
                QueueID => $Self->{QueueID},
                UserID  => $Self->{UserID},
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
            UserID => $Self->{UserID},
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

    $Self->{Config} = $Self->{ConfigObject}->Get('Ticket::Frontend::AgentTicketFreeText');
    my %DefaultNoteTypes = %{ $Self->{Config}->{ArticleTypes} };

    my %NoteTypes = $Self->{TicketObject}->ArticleTypeList( Result => 'HASH' );
    for ( keys %NoteTypes ) {
        if ( !$DefaultNoteTypes{ $NoteTypes{$_} } ) {
            delete $NoteTypes{$_};
        }
    }
    return \%NoteTypes;
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

$Id: iPhone.pm,v 1.6 2010/06/24 21:27:51 cr Exp $

=cut
