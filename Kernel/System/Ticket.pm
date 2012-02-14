# --
# Kernel/System/Ticket.pm - all ticket functions
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: Ticket.pm,v 1.416.2.17 2012/02/14 13:57:04 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket;

use strict;
use warnings;

use File::Path;
use Kernel::System::Ticket::Article;
use Kernel::System::Type;
use Kernel::System::State;
use Kernel::System::Priority;
use Kernel::System::Service;
use Kernel::System::SLA;
use Kernel::System::Lock;
use Kernel::System::Queue;
use Kernel::System::User;
use Kernel::System::Group;
use Kernel::System::Cache;
use Kernel::System::CustomerUser;
use Kernel::System::CustomerGroup;
use Kernel::System::Email;
use Kernel::System::PostMaster::LoopProtection;
use Kernel::System::TemplateGenerator;
use Kernel::System::LinkObject;
use Kernel::System::Valid;
use Kernel::System::HTMLUtils;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.416.2.17 $) [1];

=head1 NAME

Kernel::System::Ticket - ticket lib

=head1 SYNOPSIS

All ticket functions.

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
    use Kernel::System::Ticket;

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
    my $TicketObject = Kernel::System::Ticket->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        MainObject   => $MainObject,
        TimeObject   => $TimeObject,
        EncodeObject => $EncodeObject,
        GroupObject  => $GroupObject,              # if given
        CustomerUserObject => $CustomerUserObject, # if given
        QueueObject        => $QueueObject,        # if given
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # 0=off; 1=on;
    $Self->{Debug} = $Param{Debug} || 0;

    # set @ISA
    @ISA = ('Kernel::System::Ticket::Article');

    # get needed objects
    for (qw(ConfigObject LogObject TimeObject DBObject MainObject EncodeObject)) {
        if ( $Param{$_} ) {
            $Self->{$_} = $Param{$_};
        }
        else {
            die "Got no $_!";
        }
    }

    # create common needed module objects
    $Self->{UserObject} = Kernel::System::User->new( %{$Self} );
    if ( !$Param{GroupObject} ) {
        $Self->{GroupObject} = Kernel::System::Group->new( %{$Self} );
    }
    else {
        $Self->{GroupObject} = $Param{GroupObject};
    }

    $Self->{CustomerUserObject} = Kernel::System::CustomerUser->new( %{$Self} );
    if ( !$Param{CustomerGroupObject} ) {
        $Self->{CustomerGroupObject} = Kernel::System::CustomerGroup->new( %{$Self} );
    }
    else {
        $Self->{CustomerGroupObject} = $Param{CustomerGroupObject};
    }

    if ( !$Param{QueueObject} ) {
        $Self->{QueueObject} = Kernel::System::Queue->new( %{$Self} );
    }
    else {
        $Self->{QueueObject} = $Param{QueueObject};
    }

    $Self->{SendmailObject}       = Kernel::System::Email->new( %{$Self} );
    $Self->{LoopProtectionObject} = Kernel::System::PostMaster::LoopProtection->new( %{$Self} );
    $Self->{TypeObject}           = Kernel::System::Type->new( %{$Self} );
    $Self->{PriorityObject}       = Kernel::System::Priority->new( %{$Self} );
    $Self->{ServiceObject}        = Kernel::System::Service->new( %{$Self} );
    $Self->{SLAObject}            = Kernel::System::SLA->new( %{$Self} );
    $Self->{StateObject}          = Kernel::System::State->new( %{$Self} );
    $Self->{LockObject}           = Kernel::System::Lock->new( %{$Self} );
    $Self->{ValidObject}          = Kernel::System::Valid->new( %{$Self} );
    $Self->{LinkObject}           = Kernel::System::LinkObject->new( %{$Self} );
    $Self->{HTMLUtilsObject}      = Kernel::System::HTMLUtils->new( %{$Self} );

    # load ticket number generator
    my $GeneratorModule = $Self->{ConfigObject}->Get('Ticket::NumberGenerator')
        || 'Kernel::System::Ticket::Number::AutoIncrement';
    if ( !$Self->{MainObject}->Require($GeneratorModule) ) {
        die "Can't load ticket number generator backend module $GeneratorModule! $@";
    }
    push @ISA, $GeneratorModule;

    # load ticket index generator
    my $GeneratorIndexModule = $Self->{ConfigObject}->Get('Ticket::IndexModule')
        || 'Kernel::System::Ticket::IndexAccelerator::RuntimeDB';
    if ( !$Self->{MainObject}->Require($GeneratorIndexModule) ) {
        die "Can't load ticket index backend module $GeneratorIndexModule! $@";
    }
    push @ISA, $GeneratorIndexModule;

    # load article storage module
    my $StorageModule = $Self->{ConfigObject}->Get('Ticket::StorageModule')
        || 'Kernel::System::Ticket::ArticleStorageDB';
    if ( !$Self->{MainObject}->Require($StorageModule) ) {
        die "Can't load ticket storage backend module $StorageModule! $@";
    }
    push @ISA, $StorageModule;

    # load article search index module
    my $SearchIndexModule = $Self->{ConfigObject}->Get('Ticket::SearchIndexModule')
        || 'Kernel::System::Ticket::ArticleSearchIndex::RuntimeDB';
    if ( !$Self->{MainObject}->Require($SearchIndexModule) ) {
        die "Can't load ticket search index backend module $SearchIndexModule! $@";
    }
    push @ISA, $SearchIndexModule;

    # load ticket extension modules
    my $CustomModule = $Self->{ConfigObject}->Get('Ticket::CustomModule');
    if ($CustomModule) {
        if ( !$Self->{MainObject}->Require($CustomModule) ) {
            die "Can't load ticket custom module $CustomModule! $@";
        }
        push @ISA, $CustomModule;
    }

    $Self->ArticleStorageInit();

    return $Self;
}

=item TicketCreateNumber()

creates a new ticket number

    my $TicketNumber = $TicketObject->TicketCreateNumber();

=cut

# use it from Kernel/System/Ticket/Number/*.pm

=item TicketCheckNumber()

checks if ticket number exists, returns ticket id if number exists

    my $TicketID = $TicketObject->TicketCheckNumber(
        Tn => '200404051004575',
    );

=cut

sub TicketCheckNumber {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Tn} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need TN!' );
        return;
    }

    # db query
    return if !$Self->{DBObject}->Prepare(
        SQL   => 'SELECT id FROM ticket WHERE tn = ?',
        Bind  => [ \$Param{Tn} ],
        Limit => 1,
    );

    my $TicketID;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $TicketID = $Row[0];
    }

    # get main ticket id if ticket has been merged
    return if !$TicketID;

    my %Ticket = $Self->TicketGet(
        TicketID => $TicketID,
    );

    return $TicketID if $Ticket{StateType} ne 'merged';

    # get ticket history
    my @Lines = $Self->HistoryGet(
        TicketID => $Ticket{TicketID},
        UserID   => 1,
    );

    for my $Data ( reverse @Lines ) {
        next if $Data->{HistoryType} ne 'Merged';
        if ( $Data->{Name} =~ /^.*\(\d+?\/(\d+?)\)$/ ) {
            return $1;
        }
    }

    return $TicketID;
}

=item TicketCreate()

creates a new ticket

    my $TicketID = $TicketObject->TicketCreate(
        Title        => 'Some Ticket Title',
        Queue        => 'Raw',            # or QueueID => 123,
        Lock         => 'unlock',
        Priority     => '3 normal',       # or PriorityID => 2,
        State        => 'new',            # or StateID => 5,
        CustomerID   => '123465',
        CustomerUser => 'customer@example.com',
        OwnerID      => 123,
        UserID       => 123,
    );

    or

    my $TicketID = $TicketObject->TicketCreate(
        TN            => $TicketObject->TicketCreateNumber(), # optional
        Title         => 'Some Ticket Title',
        Queue         => 'Raw',              # or QueueID => 123,
        Lock          => 'unlock',
        Priority      => '3 normal',         # or PriorityID => 2,
        State         => 'new',              # or StateID => 5,
        Type          => 'normal',           # or TypeID => 1, not required
        Service       => 'Service A',        # or ServiceID => 1, not required
        SLA           => 'SLA A',            # or SALID => 1, not required
        CustomerID    => '123465',
        CustomerUser  => 'customer@example.com',
        OwnerID       => 123,
        ResponsibleID => 123,                # not required
        UserID        => 123,
    );

=cut

sub TicketCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(OwnerID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # set default values if no values are specified
    my $GroupID = $Param{GroupID} || 1;
    my $ValidID = $Param{ValidID} || 1;
    my $Age     = $Self->{TimeObject}->SystemTime();

    $Param{ResponsibleID} ||= 1;

    if ( !$Param{TypeID} && !$Param{Type} ) {
        $Param{TypeID} = 1;
    }

    # TypeID/Type lookup!
    if ( !$Param{TypeID} && $Param{Type} ) {
        $Param{TypeID} = $Self->{TypeObject}->TypeLookup( Type => $Param{Type} );
    }
    elsif ( $Param{TypeID} && !$Param{Type} ) {
        $Param{Type} = $Self->{TypeObject}->TypeLookup( TypeID => $Param{TypeID} );
    }
    if ( !$Param{TypeID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No TypeID for '$Param{Type}'!",
        );
        return;
    }

    # QueueID/Queue lookup!
    if ( !$Param{QueueID} && $Param{Queue} ) {
        $Param{QueueID} = $Self->{QueueObject}->QueueLookup( Queue => $Param{Queue} );
    }
    elsif ( !$Param{Queue} ) {
        $Param{Queue} = $Self->{QueueObject}->QueueLookup( QueueID => $Param{QueueID} );
    }
    if ( !$Param{QueueID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No QueueID for '$Param{Queue}'!",
        );
        return;
    }

    # StateID/State lookup!
    if ( !$Param{StateID} ) {
        my %State = $Self->{StateObject}->StateGet( Name => $Param{State} );
        $Param{StateID} = $State{ID};
    }
    elsif ( !$Param{State} ) {
        my %State = $Self->{StateObject}->StateGet( ID => $Param{StateID} );
        $Param{State} = $State{Name};
    }
    if ( !$Param{StateID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No StateID for '$Param{State}'!",
        );
        return;
    }

    # LockID lookup!
    if ( !$Param{LockID} && $Param{Lock} ) {
        $Param{LockID} = $Self->{LockObject}->LockLookup( Lock => $Param{Lock} );
    }
    if ( !$Param{LockID} && !$Param{Lock} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'No LockID and no LockType!',
        );
        return;
    }

    # PriorityID/Priority lookup!
    if ( !$Param{PriorityID} && $Param{Priority} ) {
        $Param{PriorityID} = $Self->{PriorityObject}->PriorityLookup(
            Priority => $Param{Priority},
        );
    }
    elsif ( $Param{PriorityID} && !$Param{Priority} ) {
        $Param{Priority} = $Self->{PriorityObject}->PriorityLookup(
            PriorityID => $Param{PriorityID},
        );
    }
    if ( !$Param{PriorityID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'No PriorityID (invalid Priority Name?)!',
        );
        return;
    }

    # ServiceID/Service lookup!
    if ( !$Param{ServiceID} && $Param{Service} ) {
        $Param{ServiceID} = $Self->{ServiceObject}->ServiceLookup(
            Name => $Param{Service},
        );
    }
    elsif ( $Param{ServiceID} && !$Param{Service} ) {
        $Param{Service} = $Self->{ServiceObject}->ServiceLookup(
            ServiceID => $Param{ServiceID},
        );
    }

    # SLAID/SLA lookup!
    if ( !$Param{SLAID} && $Param{SLA} ) {
        $Param{SLAID} = $Self->{SLAObject}->SLALookup( Name => $Param{SLA} );
    }
    elsif ( $Param{SLAID} && !$Param{SLA} ) {
        $Param{SLA} = $Self->{SLAObject}->SLALookup( SLAID => $Param{SLAID} );
    }

    # create ticket number if none is given
    if ( !$Param{TN} ) {
        $Param{TN} = $Self->TicketCreateNumber();
    }

    # check ticket title
    if ( !defined $Param{Title} ) {
        $Param{Title} = '';
    }

    # substitute title if needed
    else {
        $Param{Title} = substr( $Param{Title}, 0, 255 );
    }

    # check database undef/NULL (set value to undef/NULL to prevent database errors)
    $Param{ServiceID} ||= undef;
    $Param{SLAID}     ||= undef;

    # create db record
    return if !$Self->{DBObject}->Do(
        SQL =>
            'INSERT INTO ticket (tn, title, create_time_unix, type_id, queue_id, ticket_lock_id,'
            . ' user_id, responsible_user_id, group_id, ticket_priority_id, ticket_state_id,'
            . ' ticket_answered, escalation_time, escalation_update_time, escalation_response_time,'
            . ' escalation_solution_time, timeout, service_id, sla_id, until_time,'
            . ' valid_id, create_time, create_by, change_time, change_by)'
            . ' VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, 0, 0, 0, 0, 0, ?, ?, 0, ?,'
            . ' current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{TN}, \$Param{Title}, \$Age, \$Param{TypeID}, \$Param{QueueID},
            \$Param{LockID}, \$Param{OwnerID}, \$Param{ResponsibleID}, \$GroupID,
            \$Param{PriorityID}, \$Param{StateID}, \$Param{ServiceID},
            \$Param{SLAID}, \$ValidID, \$Param{UserID}, \$Param{UserID},
        ],
    );

    # get ticket id
    my $TicketID = $Self->TicketIDLookup(
        TicketNumber => $Param{TN},
        UserID       => $Param{UserID},
    );

    # add history entry
    $Self->HistoryAdd(
        TicketID    => $TicketID,
        QueueID     => $Param{QueueID},
        HistoryType => 'NewTicket',
        Name => "\%\%$Param{TN}\%\%$Param{Queue}\%\%$Param{Priority}\%\%$Param{State}\%\%$TicketID",
        CreateUserID => $Param{UserID},
    );

    # set customer data if given
    if ( $Param{CustomerNo} || $Param{CustomerID} || $Param{CustomerUser} ) {
        $Self->SetCustomerData(
            TicketID => $TicketID,
            No => $Param{CustomerNo} || $Param{CustomerID} || '',
            User => $Param{CustomerUser} || '',
            UserID => $Param{UserID},
        );
    }

    # update ticket view index
    $Self->TicketAcceleratorAdd( TicketID => $TicketID );

    # log ticket creation
    $Self->{LogObject}->Log(
        Priority => 'notice',
        Message => "New Ticket [$Param{TN}/" . substr( $Param{Title}, 0, 15 ) . "] created "
            . "(TicketID=$TicketID,Queue=$Param{Queue},Priority=$Param{Priority},State=$Param{State})",
    );

    # trigger ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketCreate',
        UserID   => $Param{UserID},
        TicketID => $TicketID,
    );

    return $TicketID;
}

=item TicketDelete()

deletes a ticket with articles from storage

    $TicketObject->TicketDelete(
        TicketID => 123,
        UserID   => 123,
    );

=cut

sub TicketDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # delete ticket links
    $Self->{LinkObject}->LinkDeleteAll(
        Object => 'Ticket',
        Key    => $Param{TicketID},
        UserID => $Param{UserID},
    );

    # update ticket index
    return if !$Self->TicketAcceleratorDelete(%Param);

    # update full text index
    return if !$Self->ArticleIndexDeleteTicket(%Param);

    # remove ticket watcher
    return if !$Self->{DBObject}->Do(
        SQL  => 'DELETE FROM ticket_watcher WHERE ticket_id = ?',
        Bind => [ \$Param{TicketID} ],
    );

    # delete ticket_history
    return if !$Self->HistoryDelete(
        TicketID => $Param{TicketID},
        UserID   => $Param{UserID},
    );

    # delete article, attachments and plain emails
    my @Articles = $Self->ArticleIndex( TicketID => $Param{TicketID} );
    for my $ArticleID (@Articles) {
        return if !$Self->ArticleDelete(
            ArticleID => $ArticleID,
            %Param,
        );
    }

    # delete ticket
    return if !$Self->{DBObject}->Do(
        SQL  => 'DELETE FROM ticket WHERE id = ?',
        Bind => [ \$Param{TicketID} ],
    );

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketDelete',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );

    return 1;
}

=item TicketIDLookup()

ticket id lookup by ticket number

    my $TicketID = $TicketObject->TicketIDLookup(
        TicketNumber => '2004040510440485',
        UserID       => 123,
    );

=cut

sub TicketIDLookup {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{TicketNumber} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need TicketNumber!' );
        return;
    }

    # db query
    return if !$Self->{DBObject}->Prepare(
        SQL   => 'SELECT id FROM ticket WHERE tn = ?',
        Bind  => [ \$Param{TicketNumber} ],
        Limit => 1,
    );

    my $ID;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $ID = $Row[0];
    }

    return $ID;
}

=item TicketNumberLookup()

ticket number lookup by ticket id

    my $TicketNumber = $TicketObject->TicketNumberLookup(
        TicketID => 123,
        UserID   => 123,
    );

=cut

sub TicketNumberLookup {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{TicketID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need TicketID!' );
        return;
    }

    # db query
    return if !$Self->{DBObject}->Prepare(
        SQL   => 'SELECT tn FROM ticket WHERE id = ?',
        Bind  => [ \$Param{TicketID} ],
        Limit => 1,
    );

    my $Number;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Number = $Row[0];
    }

    return $Number;
}

=item TicketSubjectBuild()

rebuild a new ticket subject

    my $NewSubject = $TicketObject->TicketSubjectBuild(
        TicketNumber => '2004040510440485',
        Subject      => $OldSubject,
    );

    a new subject like "RE: [Ticket# 2004040510440485] Some subject" will
    be generated

    my $NewSubject = $TicketObject->TicketSubjectBuild(
        TicketNumber => '2004040510440485',
        Subject      => $OldSubject,
        Type         => 'New',
    );

    a new subject like "[Ticket# 2004040510440485] Some subject" (without RE: )
    will be generated

    my $NewSubject = $TicketObject->TicketSubjectBuild(
        TicketNumber => '2004040510440485',
        Subject      => $OldSubject,
        Type         => 'New',
        NoCleanup    => 1,
    );

    a new subject like "[Ticket# 2004040510440485] Re: Some subject" (without clean up of subject)
    will be generated

=cut

sub TicketSubjectBuild {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketNumber)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    my $Subject = $Param{Subject} || '';

    # cleanup of subject, remove existing ticket numbers and reply indentifier
    if ( !$Param{NoCleanup} ) {
        $Subject = $Self->TicketSubjectClean(%Param);
    }

    # get config options
    my $TicketHook        = $Self->{ConfigObject}->Get('Ticket::Hook');
    my $TicketHookDivider = $Self->{ConfigObject}->Get('Ticket::HookDivider');
    my $TicketSubjectRe   = $Self->{ConfigObject}->Get('Ticket::SubjectRe');

    # return subject for new tickets
    if ( $Param{Type} && $Param{Type} eq 'New' ) {
        return "[$TicketHook$TicketHookDivider$Param{TicketNumber}] " . $Subject;
    }

    # return subject for existing tickets
    if ($TicketSubjectRe) {
        $TicketSubjectRe .= ': ';
    }
    return $TicketSubjectRe . "[$TicketHook$TicketHookDivider$Param{TicketNumber}] " . $Subject;
}

=item TicketSubjectClean()

strip/clean up a ticket subject

    my $NewSubject = $TicketObject->TicketSubjectClean(
        TicketNumber => '2004040510440485',
        Subject      => $OldSubject,
    );

=cut

sub TicketSubjectClean {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketNumber)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    my $Subject = $Param{Subject} || '';

    # get config options
    my $TicketHook        = $Self->{ConfigObject}->Get('Ticket::Hook');
    my $TicketHookDivider = $Self->{ConfigObject}->Get('Ticket::HookDivider');
    my $TicketSubjectSize = $Self->{ConfigObject}->Get('Ticket::SubjectSize') || 120;
    my $TicketSubjectRe   = $Self->{ConfigObject}->Get('Ticket::SubjectRe');

    # remove all possible ticket hook formats with []
    $Subject =~ s/\[$TicketHook: $Param{TicketNumber}\]\s//g;
    $Subject =~ s/\[$TicketHook:$Param{TicketNumber}\]\s//g;
    $Subject =~ s/\[$TicketHook$TicketHookDivider$Param{TicketNumber}\]\s//g;

    # remove all ticket numbers with []
    if ( $Self->{ConfigObject}->Get('Ticket::SubjectCleanAllNumbers') ) {
        $Subject =~ s/\[$TicketHook$TicketHookDivider\d+?\]\s//g;
    }

    # remove all possible ticket hook formats without []
    $Subject =~ s/$TicketHook: $Param{TicketNumber}\s//g;
    $Subject =~ s/$TicketHook:$Param{TicketNumber}\s//g;
    $Subject =~ s/$TicketHook$TicketHookDivider$Param{TicketNumber}\s//g;

    # remove all ticket numbers without []
    if ( $Self->{ConfigObject}->Get('Ticket::SubjectCleanAllNumbers') ) {
        $Subject =~ s/$TicketHook$TicketHookDivider\d+?\s//g;
    }

    # remove leading "..:\s" and "..[\d+]:\s" e. g. "Re: " or "Re[5]: "
    $Subject =~ s/^(..(\[\d+\])?:\s)+//;

    # remove leading number with configured "RE:\s" or "RE[\d+]:\s" e. g. "RE: " or "RE[4]: "
    $Subject =~ s/^($TicketSubjectRe(\[\d+\])?:\s)+//;

    # resize subject based on config
    $Subject =~ s/^(.{$TicketSubjectSize}).*$/$1 [...]/;

    return $Subject;
}

=item TicketGet()

get ticket info

    my %Ticket = $TicketObject->TicketGet(
        TicketID => 123,
        UserID   => 123,
    );

returns

    TicketNumber
    TicketID
    State
    StateID
    StateType
    Priority
    PriorityID
    Lock
    LockID
    Queue
    QueueID
    GroupID
    CustomerID
    CustomerUserID
    Owner
    OwnerID
    Type
    TypeID
    SLA
    SLAID
    Service
    ServiceID
    Responsible
    ResponsibleID
    Created
    CreateTimeUnix
    Changed
    TicketFreeKey1-16
    TicketFreeText1-16
    TicketFreeTime1-6

    (time stampes of expected escalations)
    EscalationResponseTime           (unix time stamp of response time escalation)
    EscalationUpdateTime             (unix time stamp of update time escalation)
    EscalationSolutionTime           (unix time stamp of solution time escalation)

    (general escalation info of nearest escalation type)
    EscalationDestinationIn          (escalation in e. g. 1h 4m)
    EscalationDestinationTime        (date of escalation in unix time, e. g. 72193292)
    EscalationDestinationDate        (date of escalation, e. g. "2009-02-14 18:00:00")
    EscalationTimeWorkingTime        (seconds of working/service time till escalation, e. g. "1800")
    EscalationTime                   (seconds total till escalation of nearest escalation time type - response, update or solution time, e. g. "3600")

    (detail escalation info about first response, update and solution time)
    FirstResponseTimeEscalation      (if true, ticket is escalated)
    FirstResponseTimeNotification    (if true, notify - x% of escalation has reached)
    FirstResponseTimeDestinationTime (date of escalation in unix time, e. g. 72193292)
    FirstResponseTimeDestinationDate (date of escalation, e. g. "2009-02-14 18:00:00")
    FirstResponseTimeWorkingTime     (seconds of working/service time till escalation, e. g. "1800")
    FirstResponseTime                (seconds total till escalation, e. g. "3600")

    UpdateTimeEscalation             (if true, ticket is escalated)
    UpdateTimeNotification           (if true, notify - x% of escalation has reached)
    UpdateTimeDestinationTime        (date of escalation in unix time, e. g. 72193292)
    UpdateTimeDestinationDate        (date of escalation, e. g. "2009-02-14 18:00:00")
    UpdateTimeWorkingTime            (seconds of working/service time till escalation, e. g. "1800")
    UpdateTime                       (seconds total till escalation, e. g. "3600")

    SolutionTimeEscalation           (if true, ticket is escalated)
    SolutionTimeNotification         (if true, notify - x% of escalation has reached)
    SolutionTimeDestinationTime      (date of escalation in unix time, e. g. 72193292)
    SolutionTimeDestinationDate      (date of escalation, e. g. "2009-02-14 18:00:00")
    SolutionTimeWorkingTime          (seconds of working/service time till escalation, e. g. "1800")
    SolutionTime                     (seconds total till escalation, e. g. "3600")

to get extended ticket attributes, use param Extended:

    my %Ticket = $TicketObject->TicketGet(
        TicketID => 123,
        UserID   => 123,
        Extended => 1,
    );

params are

    FirstResponse                   (timestamp of first response, first contact with customer)
    FirstResponseInMin              (minutes till first response)
    FirstResponseDiffInMin          (minutes till or over first response)

    SolutionTime                    (timestamp of solution time, also close time)
    SolutionInMin                   (minutes till solution time)
    SolutionDiffInMin               (minutes till or over solution time)

    FirstLock                       (timestamp of first lock)

=cut

sub TicketGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{TicketID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need TicketID!' );
        return;
    }
    $Param{Extended} ||= '';

    my $CacheKey = 'Cache::GetTicket' . $Param{TicketID};

    # check if result is cached
    if ( $Self->{$CacheKey}->{ $Param{Extended} } ) {
        return %{ $Self->{$CacheKey}->{ $Param{Extended} } };
    }

    # db query
    my $SQL = 'SELECT st.id, st.queue_id, sq.name, st.ticket_state_id, st.ticket_lock_id,'
        . ' sp.id, sp.name, st.create_time_unix, st.create_time, sq.group_id, st.tn,'
        . ' st.customer_id, st.customer_user_id, st.user_id, st.responsible_user_id, st.until_time,'
        . ' st.freekey1, st.freetext1, st.freekey2, st.freetext2,'
        . ' st.freekey3, st.freetext3, st.freekey4, st.freetext4,'
        . ' st.freekey5, st.freetext5, st.freekey6, st.freetext6,'
        . ' st.freekey7, st.freetext7, st.freekey8, st.freetext8,'
        . ' st.freekey9, st.freetext9, st.freekey10, st.freetext10,'
        . ' st.freekey11, st.freetext11, st.freekey12, st.freetext12,'
        . ' st.freekey13, st.freetext13, st.freekey14, st.freetext14,'
        . ' st.freekey15, st.freetext15, st.freekey16, st.freetext16,'
        . ' st.freetime1, st.freetime2, st.freetime3, st.freetime4,'
        . ' st.freetime5, st.freetime6,'
        . ' st.change_time, st.title, st.escalation_update_time, st.timeout,'
        . ' st.type_id, st.service_id, st.sla_id, st.escalation_response_time,'
        . ' st.escalation_solution_time, st.escalation_time'
        . ' FROM ticket st, ticket_priority sp, queue sq'
        . ' WHERE sp.id = st.ticket_priority_id AND sq.id = st.queue_id AND st.id = ?';

    # fetch the result
    return if !$Self->{DBObject}->Prepare(
        SQL   => $SQL,
        Bind  => [ \$Param{TicketID} ],
        Limit => 1,
    );

    my %Ticket;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Ticket{TicketID}       = $Row[0];
        $Ticket{Title}          = $Row[55];
        $Ticket{QueueID}        = $Row[1];
        $Ticket{Queue}          = $Row[2];
        $Ticket{StateID}        = $Row[3];
        $Ticket{LockID}         = $Row[4];
        $Ticket{PriorityID}     = $Row[5];
        $Ticket{Priority}       = $Row[6];
        $Ticket{Age}            = $Self->{TimeObject}->SystemTime() - $Row[7];
        $Ticket{CreateTimeUnix} = $Row[7];
        $Ticket{Created} = $Self->{TimeObject}->SystemTime2TimeStamp( SystemTime => $Row[7] );
        $Ticket{Changed} = $Row[54];
        $Ticket{EscalationTime}         = $Row[63];
        $Ticket{EscalationUpdateTime}   = $Row[56];
        $Ticket{EscalationResponseTime} = $Row[61];
        $Ticket{EscalationSolutionTime} = $Row[62];
        $Ticket{UnlockTimeout}          = $Row[57];
        $Ticket{GroupID}                = $Row[9];
        $Ticket{TicketNumber}           = $Row[10];
        $Ticket{CustomerID}             = $Row[11];
        $Ticket{CustomerUserID}         = $Row[12];
        $Ticket{OwnerID}                = $Row[13];
        $Ticket{ResponsibleID}          = $Row[14] || 1;
        $Ticket{RealTillTimeNotUsed}    = $Row[15];
        $Ticket{TypeID}                 = $Row[58] || 1;
        $Ticket{ServiceID}              = $Row[59] || '';
        $Ticket{SLAID}                  = $Row[60] || '';
        $Ticket{TicketFreeKey1}         = defined( $Row[16] ) ? $Row[16] : '';
        $Ticket{TicketFreeText1}        = defined( $Row[17] ) ? $Row[17] : '';
        $Ticket{TicketFreeKey2}         = defined( $Row[18] ) ? $Row[18] : '';
        $Ticket{TicketFreeText2}        = defined( $Row[19] ) ? $Row[19] : '';
        $Ticket{TicketFreeKey3}         = defined( $Row[20] ) ? $Row[20] : '';
        $Ticket{TicketFreeText3}        = defined( $Row[21] ) ? $Row[21] : '';
        $Ticket{TicketFreeKey4}         = defined( $Row[22] ) ? $Row[22] : '';
        $Ticket{TicketFreeText4}        = defined( $Row[23] ) ? $Row[23] : '';
        $Ticket{TicketFreeKey5}         = defined( $Row[24] ) ? $Row[24] : '';
        $Ticket{TicketFreeText5}        = defined( $Row[25] ) ? $Row[25] : '';
        $Ticket{TicketFreeKey6}         = defined( $Row[26] ) ? $Row[26] : '';
        $Ticket{TicketFreeText6}        = defined( $Row[27] ) ? $Row[27] : '';
        $Ticket{TicketFreeKey7}         = defined( $Row[28] ) ? $Row[28] : '';
        $Ticket{TicketFreeText7}        = defined( $Row[29] ) ? $Row[29] : '';
        $Ticket{TicketFreeKey8}         = defined( $Row[30] ) ? $Row[30] : '';
        $Ticket{TicketFreeText8}        = defined( $Row[31] ) ? $Row[31] : '';
        $Ticket{TicketFreeKey9}         = defined( $Row[32] ) ? $Row[32] : '';
        $Ticket{TicketFreeText9}        = defined( $Row[33] ) ? $Row[33] : '';
        $Ticket{TicketFreeKey10}        = defined( $Row[34] ) ? $Row[34] : '';
        $Ticket{TicketFreeText10}       = defined( $Row[35] ) ? $Row[35] : '';
        $Ticket{TicketFreeKey11}        = defined( $Row[36] ) ? $Row[36] : '';
        $Ticket{TicketFreeText11}       = defined( $Row[37] ) ? $Row[37] : '';
        $Ticket{TicketFreeKey12}        = defined( $Row[38] ) ? $Row[38] : '';
        $Ticket{TicketFreeText12}       = defined( $Row[39] ) ? $Row[39] : '';
        $Ticket{TicketFreeKey13}        = defined( $Row[40] ) ? $Row[40] : '';
        $Ticket{TicketFreeText13}       = defined( $Row[41] ) ? $Row[41] : '';
        $Ticket{TicketFreeKey14}        = defined( $Row[42] ) ? $Row[42] : '';
        $Ticket{TicketFreeText14}       = defined( $Row[43] ) ? $Row[43] : '';
        $Ticket{TicketFreeKey15}        = defined( $Row[44] ) ? $Row[44] : '';
        $Ticket{TicketFreeText15}       = defined( $Row[45] ) ? $Row[45] : '';
        $Ticket{TicketFreeKey16}        = defined( $Row[46] ) ? $Row[46] : '';
        $Ticket{TicketFreeText16}       = defined( $Row[47] ) ? $Row[47] : '';
        $Ticket{TicketFreeTime1}        = defined( $Row[48] ) ? $Row[48] : '';
        $Ticket{TicketFreeTime2}        = defined( $Row[49] ) ? $Row[49] : '';
        $Ticket{TicketFreeTime3}        = defined( $Row[50] ) ? $Row[50] : '';
        $Ticket{TicketFreeTime4}        = defined( $Row[51] ) ? $Row[51] : '';
        $Ticket{TicketFreeTime5}        = defined( $Row[52] ) ? $Row[52] : '';
        $Ticket{TicketFreeTime6}        = defined( $Row[53] ) ? $Row[53] : '';
    }

    # check ticket
    if ( !$Ticket{TicketID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No such TicketID ($Param{TicketID})!",
        );
        return;
    }

    # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000
    # and 0000-00-00 00:00:00 time stamps)
    for my $Time ( 1 .. 6 ) {
        if ( $Ticket{ 'TicketFreeTime' . $Time } ) {
            if ( $Ticket{ 'TicketFreeTime' . $Time } eq '0000-00-00 00:00:00' ) {
                $Ticket{ 'TicketFreeTime' . $Time } = '';
                next;
            }
            $Ticket{ 'TicketFreeTime' . $Time }
                =~ s/^(\d\d\d\d-\d\d-\d\d\s\d\d:\d\d:\d\d)\..+?$/$1/;
        }
    }

    # get owner
    $Ticket{Owner} = $Self->{UserObject}->UserLookup(
        UserID => $Ticket{OwnerID},
    );

    # get responsible
    $Ticket{Responsible} = $Self->{UserObject}->UserLookup(
        UserID => $Ticket{ResponsibleID},
    );

    # get lock
    $Ticket{Lock} = $Self->{LockObject}->LockLookup( LockID => $Ticket{LockID} );

    # get service
    $Ticket{Type} = $Self->{TypeObject}->TypeLookup( TypeID => $Ticket{TypeID} );

    # get service
    if ( $Ticket{ServiceID} ) {
        $Ticket{Service} = $Self->{ServiceObject}->ServiceLookup(
            ServiceID => $Ticket{ServiceID},
        );
    }

    # get sla
    if ( $Ticket{SLAID} ) {
        $Ticket{SLA} = $Self->{SLAObject}->SLALookup( SLAID => $Ticket{SLAID} );
    }

    # get state info
    my %StateData = $Self->{StateObject}->StateGet( ID => $Ticket{StateID} );
    $Ticket{StateType} = $StateData{TypeName};
    $Ticket{State}     = $StateData{Name};
    if ( !$Ticket{RealTillTimeNotUsed} || $StateData{TypeName} !~ /^pending/i ) {
        $Ticket{UntilTime} = 0;
    }
    else {
        $Ticket{UntilTime} = $Ticket{RealTillTimeNotUsed} - $Self->{TimeObject}->SystemTime();
    }

    # get escalation attributes
    my %Escalation = $Self->TicketEscalationDateCalculation(
        Ticket => \%Ticket,
        UserID => $Param{UserID} || 1,
    );

    for my $Key ( keys %Escalation ) {
        $Ticket{$Key} = $Escalation{$Key};
    }

    # do extended lookups
    if ( $Param{Extended} ) {
        my %TicketExtended = $Self->_TicketGetExtended(
            TicketID => $Param{TicketID},
            Ticket   => \%Ticket,
        );
        for my $Key ( keys %TicketExtended ) {
            $Ticket{$Key} = $TicketExtended{$Key};
        }
    }

    # cache user result
    $Self->{$CacheKey}->{ $Param{Extended} } = \%Ticket;

    return %Ticket;
}

sub _TicketGetExtended {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID Ticket)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # get extended attributes
    my %FirstResponse   = $Self->_TicketGetFirstResponse(%Param);
    my %FirstLock       = $Self->_TicketGetFirstLock(%Param);
    my %TicketGetClosed = $Self->_TicketGetClosed(%Param);

    # return all as hash
    return ( %TicketGetClosed, %FirstResponse, %FirstLock );
}

sub _TicketGetFirstResponse {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID Ticket)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # check if first response is already done
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT a.create_time,a.id FROM article a, article_sender_type ast, article_type art'
            . ' WHERE a.article_sender_type_id = ast.id AND a.article_type_id = art.id AND'
            . ' a.ticket_id = ? AND ast.name = \'agent\' AND'
            . ' (art.name LIKE \'email-ext%\' OR art.name LIKE \'note-ext%\' OR art.name = \'phone\' OR art.name = \'fax\' OR art.name = \'sms\')'
            . ' ORDER BY a.create_time',
        Bind  => [ \$Param{TicketID} ],
        Limit => 1,
    );
    my %Data;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Data{FirstResponse} = $Row[0];

        # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000
        # and 0000-00-00 00:00:00 time stamps)
        $Data{FirstResponse} =~ s/^(\d\d\d\d-\d\d-\d\d\s\d\d:\d\d:\d\d)\..+?$/$1/;
    }

    return if !$Data{FirstResponse};

    # get escalation properties
    my %Escalation = $Self->TicketEscalationPreferences(
        Ticket => $Param{Ticket},
        UserID => $Param{UserID} || 1,
    );

    if ( $Escalation{FirstResponseTime} ) {

        # get unix time stamps
        my $CreateTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Param{Ticket}->{Created},
        );
        my $FirstResponseTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Data{FirstResponse},
        );

        # get time between creation and first response
        my $WorkingTime = $Self->{TimeObject}->WorkingTime(
            StartTime => $CreateTime,
            StopTime  => $FirstResponseTime,
            Calendar  => $Escalation{Calendar},
        );

        $Data{FirstResponseInMin} = int( $WorkingTime / 60 );
        my $EscalationFirstResponseTime = $Escalation{FirstResponseTime} * 60;
        $Data{FirstResponseDiffInMin} = int( ( $EscalationFirstResponseTime - $WorkingTime ) / 60 );
    }
    return %Data;
}

sub _TicketGetClosed {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID Ticket)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # get close time
    my @List = $Self->{StateObject}->StateGetStatesByType(
        StateType => ['closed'],
        Result    => 'ID',
    );
    return if !@List;

    return if !$Self->{DBObject}->Prepare(
        SQL => "SELECT create_time FROM ticket_history WHERE ticket_id = ? AND "
            . " state_id IN (${\(join ', ', sort @List)}) ORDER BY create_time DESC",
        Bind  => [ \$Param{TicketID} ],
        Limit => 1,
    );

    my %Data;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Data{Closed} = $Row[0];

        # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000
        # and 0000-00-00 00:00:00 time stamps)
        $Data{Closed} =~ s/^(\d\d\d\d-\d\d-\d\d\s\d\d:\d\d:\d\d)\..+?$/$1/;
    }

    return if !$Data{Closed};

    # for compat. wording reasons
    $Data{SolutionTime} = $Data{Closed};

    # get escalation properties
    my %Escalation = $Self->TicketEscalationPreferences(
        Ticket => $Param{Ticket},
        UserID => $Param{UserID} || 1,
    );

    if ( $Escalation{SolutionTime} ) {

        # get unix time stamps
        my $CreateTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Param{Ticket}->{Created},
        );
        my $SolutionTime = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Data{Closed},
        );

        # get time between creation and solution
        my $WorkingTime = $Self->{TimeObject}->WorkingTime(
            StartTime => $CreateTime,
            StopTime  => $SolutionTime,
            Calendar  => $Escalation{Calendar},
        );

        $Data{SolutionInMin} = int( $WorkingTime / 60 );

        my $EscalationSolutionTime = $Escalation{SolutionTime} * 60;
        $Data{SolutionDiffInMin} = int( ( $EscalationSolutionTime - $WorkingTime ) / 60 );
    }

    return %Data;
}

sub _TicketGetFirstLock {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID Ticket)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # first lock
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT th.name, tht.name, th.create_time '
            . 'FROM ticket_history th, ticket_history_type tht '
            . 'WHERE th.history_type_id = tht.id AND th.ticket_id = ? '
            . 'AND tht.name = \'Lock\' ORDER BY th.create_time, th.id ASC',
        Bind  => [ \$Param{TicketID} ],
        Limit => 100,
    );

    my %Data;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( !$Data{FirstLock} ) {
            $Data{FirstLock} = $Row[2];

            # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000
            # and 0000-00-00 00:00:00 time stamps)
            $Data{FirstLock} =~ s/^(\d\d\d\d-\d\d-\d\d\s\d\d:\d\d:\d\d)\..+?$/$1/;
        }
    }

    return %Data;
}

=item TicketTitleUpdate()

update ticket title

    $TicketObject->TicketTitleUpdate(
        Title    => 'Some Title',
        TicketID => 123,
        UserID   => 1,
    );

=cut

sub TicketTitleUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Title TicketID UserID)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # check if update is needed
    my %Ticket = $Self->TicketGet(
        TicketID => $Param{TicketID},
        UserID   => $Param{UserID},
    );

    return 1 if defined $Ticket{Title} && $Ticket{Title} eq $Param{Title};

    # db access
    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket SET title = ? WHERE id = ?',
        Bind => [ \$Param{Title}, \$Param{TicketID} ],
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketTitleUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );

    return 1;
}

=item TicketUnlockTimeoutUpdate()

update ticket unlock time to now

    $TicketObject->TicketUnlockTimeoutUpdate(
        UnlockTimeout => $TimeObject->SystemTime(),
        TicketID      => 123,
        UserID        => 143,
    );

=cut

sub TicketUnlockTimeoutUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(UnlockTimeout TicketID UserID)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # check if update is needed
    my %Ticket = $Self->TicketGet(%Param);

    return 1 if $Ticket{UnlockTimeout} eq $Param{UnlockTimeout};

    # reset unlock time
    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket SET timeout = ? WHERE id = ?',
        Bind => [ \$Param{UnlockTimeout}, \$Param{TicketID} ],
    );

    # reset ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # add history
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        CreateUserID => $Param{UserID},
        HistoryType  => 'Misc',
        Name         => 'Reset of unlock time.',
    );

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketUnlockTimeoutUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );

    return 1;
}

=item TicketQueueID()

get ticket queue id

    my $QueueID = $TicketObject->TicketQueueID(
        TicketID => 123,
    );

=cut

sub TicketQueueID {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{TicketID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need TicketID!' );
        return;
    }

    # get ticket data
    my %Ticket = $Self->TicketGet(
        TicketID => $Param{TicketID},
        UserID   => 1,
    );

    return if !%Ticket;

    return $Ticket{QueueID};
}

=item MoveList()

to get the move queue list for a ticket (depends on workflow, if configured)

    my %Queues = $TicketObject->MoveList(
        Type   => 'create',
        UserID => 123,
    );

    my %Queues = $TicketObject->MoveList(
        QueueID => 123,
        UserID  => 123,
    );

    my %Queues = $TicketObject->MoveList(
        TicketID => 123,
        UserID   => 123,
    );

=cut

sub MoveList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} && !$Param{CustomerUserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need UserID or CustomerUserID!',
        );
        return;
    }

    # check needed stuff
    if ( !$Param{QueueID} && !$Param{TicketID} && !$Param{Type} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need QueueID, TicketID or Type!',
        );
        return;
    }

    my %Queues;
    if ( $Param{UserID} && $Param{UserID} eq 1 ) {
        %Queues = $Self->{QueueObject}->GetAllQueues();
    }
    else {
        %Queues = $Self->{QueueObject}->GetAllQueues(%Param);
    }

    # workflow
    my $ACL = $Self->TicketAcl(
        %Param,
        ReturnType    => 'Ticket',
        ReturnSubType => 'Queue',
        Data          => \%Queues,
    );
    if ($ACL) {
        return $Self->TicketAclData();
    }
    return %Queues;
}

=item MoveTicket()

to move a ticket (send notification to agents of selected my queues, it ticket isn't closed)

    $TicketObject->MoveTicket(
        QueueID  => 123,
        TicketID => 123,
        UserID   => 123,
    );

    $TicketObject->MoveTicket(
        Queue    => 'Some Queue Name',
        TicketID => 123,
        UserID   => 123,
    );

    $TicketObject->MoveTicket(
        Queue    => 'Some Queue Name',
        TicketID => 123,
        Comment  => 'some comment', # optional
        ForceNotificationToUserID => [1,43,56], # if you want to force somebody
        UserID   => 123,
    );

    Optional attribute:
    SendNoNotification, disable or enable agent and customer notification for this
    action. Otherwise a notification will be send to agent and cusomer.

    For example:

        SendNoNotification => 0, # optional 1|0 (send no agent and customer notification)

=cut

sub MoveTicket {
    my ( $Self, %Param ) = @_;

    # queue lookup
    if ( $Param{Queue} && !$Param{QueueID} ) {
        $Param{QueueID} = $Self->{QueueObject}->QueueLookup( Queue => $Param{Queue} );
    }

    # check needed stuff
    for (qw(TicketID QueueID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # get current ticket
    my %Ticket = $Self->TicketGet(%Param);

    # move needed?
    if ( $Param{QueueID} == $Ticket{QueueID} && !$Param{Comment} ) {

        # update not needed
        return 1;
    }

    # permission check
    my %MoveList = $Self->MoveList( %Param, Type => 'move_into' );
    if ( !$MoveList{ $Param{QueueID} } ) {
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "Permission denied on TicketID: $Param{TicketID}!",
        );
        return;
    }

    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket SET queue_id = ? WHERE id = ?',
        Bind => [ \$Param{QueueID}, \$Param{TicketID} ],
    );

    # queue lookup
    my $Queue = $Self->{QueueObject}->QueueLookup( QueueID => $Param{QueueID} );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # history insert
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        QueueID      => $Param{QueueID},
        HistoryType  => 'Move',
        Name         => "\%\%$Queue\%\%$Param{QueueID}\%\%$Ticket{Queue}\%\%$Ticket{QueueID}",
        CreateUserID => $Param{UserID},
    );

    # send move notify to queue subscriber
    if ( !$Param{SendNoNotification} && $Ticket{StateType} ne 'closed' ) {
        my %Used = ();
        my @UserIDs = $Self->GetSubscribedUserIDsByQueueID( QueueID => $Param{QueueID} );
        if ( $Param{ForceNotificationToUserID} ) {
            push @UserIDs, @{ $Param{ForceNotificationToUserID} };
        }
        for my $UserID (@UserIDs) {
            if ( !$Used{$UserID} && $UserID ne $Param{UserID} ) {
                $Used{$UserID} = 1;
                my %UserData = $Self->{UserObject}->GetUserData(
                    UserID => $UserID,
                    Cached => 1,
                    Valid  => 1,
                );
                next if !$UserData{UserSendMoveNotification};

                # send agent notification
                $Self->SendAgentNotification(
                    Type                  => 'Move',
                    RecipientID           => $UserID,
                    CustomerMessageParams => {
                        Queue => $Queue,
                        Body => $Param{Comment} || '',
                    },
                    TicketID => $Param{TicketID},
                    UserID   => $Param{UserID},
                );
            }
        }
    }

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketQueueUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item MoveQueueList()

returns a list of used queue ids / names

    my @QueueIDList = $TicketObject->MoveQueueList(
        TicketID => 123,
        Type     => 'ID',
    );

    my @QueueList = $TicketObject->MoveQueueList(
        TicketID => 123,
        Type     => 'Name',
    );

=cut

sub MoveQueueList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # db query
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT sh.name, ht.name, sh.create_by, sh.queue_id FROM '
            . 'ticket_history sh, ticket_history_type ht WHERE '
            . 'sh.ticket_id = ? AND ht.name IN (\'Move\', \'NewTicket\') AND '
            . 'ht.id = sh.history_type_id ORDER BY sh.id',
        Bind => [ \$Param{TicketID} ],
    );
    my @QueueID = ();
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        # store result
        if ( $Row[1] eq 'NewTicket' ) {
            if ( $Row[3] ) {
                push @QueueID, $Row[3];
            }
        }
        elsif ( $Row[1] eq 'Move' ) {
            if ( $Row[0] =~ /^\%\%(.+?)\%\%(.+?)\%\%(.+?)\%\%(.+?)/ ) {
                push @QueueID, $2;
            }
            elsif ( $Row[0] =~ /^Ticket moved to Queue '.+?' \(ID=(.+?)\)/ ) {
                push @QueueID, $1;
            }
        }
    }

    # queue lookup
    my @QueueName = ();
    for my $QueueID (@QueueID) {
        my $Queue = $Self->{QueueObject}->QueueLookup( QueueID => $QueueID );
        push @QueueName, $Queue;
    }
    if ( $Param{Type} && $Param{Type} eq 'Name' ) {
        return @QueueName;
    }
    else {
        return @QueueID;
    }
}

=item TicketTypeList()

to get all possible types for a ticket (depends on workflow, if configured)

    my %Types = $TicketObject->TicketTypeList(
        UserID => 123,
    );

    my %Types = $TicketObject->TicketTypeList(
        QueueID => 123,
        UserID  => 123,
    );

    my %Types = $TicketObject->TicketTypeList(
        TicketID => 123,
        UserID   => 123,
    );

=cut

sub TicketTypeList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} && !$Param{CustomerUserID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need UserID or CustomerUserID!' );
        return;
    }

    # check needed stuff
    # if (!$Param{QueueID} && !$Param{TicketID}) {
    #     $Self->{LogObject}->Log(Priority => 'error', Message => 'Need QueueID or TicketID!');
    #     return;
    # }
    my %Types = $Self->{TypeObject}->TypeList( Valid => 1 );

    # workflow
    my $ACL = $Self->TicketAcl(
        %Param,
        ReturnType    => 'Ticket',
        ReturnSubType => 'Type',
        Data          => \%Types,
    );
    if ($ACL) {
        return $Self->TicketAclData();
    }
    return %Types;
}

=item TicketTypeSet()

to set a ticket type

    $TicketObject->TicketTypeSet(
        TypeID   => 123,
        TicketID => 123,
        UserID   => 123,
    );

    $TicketObject->TicketTypeSet(
        Type     => 'normal',
        TicketID => 123,
        UserID   => 123,
    );

=cut

sub TicketTypeSet {
    my ( $Self, %Param ) = @_;

    # type lookup
    if ( $Param{Type} && !$Param{TypeID} ) {
        $Param{TypeID} = $Self->{TypeObject}->TypeLookup( Type => $Param{Type} );
    }

    # check needed stuff
    for (qw(TicketID TypeID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # get current ticket
    my %Ticket = $Self->TicketGet(%Param);

    # update needed?
    return 1 if $Param{TypeID} == $Ticket{TypeID};

    # permission check
    my %TypeList = $Self->TicketTypeList(%Param);
    if ( !$TypeList{ $Param{TypeID} } ) {
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "Permission denied on TicketID: $Param{TicketID}!",
        );
        return;
    }

    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket SET type_id = ? WHERE id = ?',
        Bind => [ \$Param{TypeID}, \$Param{TicketID} ],
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # get new ticket data
    my %TicketNew = $Self->TicketGet(%Param);
    $TicketNew{Type} = $TicketNew{Type} || 'NULL';
    $Param{TypeID}   = $Param{TypeID}   || '';
    $Ticket{Type}    = $Ticket{Type}    || 'NULL';
    $Ticket{TypeID}  = $Ticket{TypeID}  || '';

    # history insert
    $Self->HistoryAdd(
        TicketID    => $Param{TicketID},
        HistoryType => 'TypeUpdate',
        Name        => "\%\%$TicketNew{Type}\%\%$Param{TypeID}\%\%$Ticket{Type}\%\%$Ticket{TypeID}",
        CreateUserID => $Param{UserID},
    );

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketTypeUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item TicketServiceList()

to get all possible services for a ticket (depends on workflow, if configured)

    my %Services = $TicketObject->TicketServiceList(
        QueueID        => 123,
        UserID         => 123,
    );

    my %Services = $TicketObject->TicketServiceList(
        CustomerUserID => 123,
        QueueID        => 123,
    );

    my %Services = $TicketObject->TicketServiceList(
        CustomerUserID => 123,
        TicketID       => 123,
        UserID         => 123,
    );

=cut

sub TicketServiceList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} && !$Param{CustomerUserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need UserID, CustomerUserID or UserID and CustomerUserID is needed!',
        );
        return;
    }

    # check needed stuff
    if ( !$Param{QueueID} && !$Param{TicketID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need QueueID or TicketID!',
        );
        return;
    }
    my %Services = ();
    if ( !$Param{CustomerUserID} ) {
        %Services = $Self->{ServiceObject}->ServiceList( UserID => 1, );
    }
    else {
        %Services = $Self->{ServiceObject}->CustomerUserServiceMemberList(
            Result            => 'HASH',
            CustomerUserLogin => $Param{CustomerUserID},
            UserID            => 1,
        );
    }

    # workflow
    my $ACL = $Self->TicketAcl(
        %Param,
        ReturnType    => 'Ticket',
        ReturnSubType => 'Service',
        Data          => \%Services,
    );
    if ($ACL) {
        return $Self->TicketAclData();
    }
    return %Services;
}

=item TicketServiceSet()

to set a ticket service

    $TicketObject->TicketServiceSet(
        ServiceID => 123,
        TicketID  => 123,
        UserID    => 123,
    );

    $TicketObject->TicketServiceSet(
        Service  => 'Service A',
        TicketID => 123,
        UserID   => 123,
    );

=cut

sub TicketServiceSet {
    my ( $Self, %Param ) = @_;

    # service lookup
    if ( $Param{Service} && !$Param{ServiceID} ) {
        $Param{ServiceID} = $Self->{ServiceObject}->ServiceLookup( Name => $Param{Service} );
    }

    # check needed stuff
    for (qw(TicketID ServiceID UserID)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # get current ticket
    my %Ticket = $Self->TicketGet(%Param);

    # update needed?
    return 1 if $Param{ServiceID} eq $Ticket{ServiceID};

    # permission check
    my %ServiceList = $Self->TicketServiceList(%Param);
    if ( $Param{ServiceID} ne '' && !$ServiceList{ $Param{ServiceID} } ) {
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "Permission denied on TicketID: $Param{TicketID}!",
        );
        return;
    }

    # check database undef/NULL (set value to undef/NULL to prevent database errors)
    for (qw(ServiceID SLAID)) {
        if ( !$Param{$_} ) {
            $Param{$_} = undef;
        }
    }

    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket SET service_id = ? WHERE id = ?',
        Bind => [ \$Param{ServiceID}, \$Param{TicketID} ],
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # get new ticket data
    my %TicketNew = $Self->TicketGet(%Param);
    $TicketNew{Service} = $TicketNew{Service} || 'NULL';
    $Param{ServiceID}   = $Param{ServiceID}   || '';
    $Ticket{Service}    = $Ticket{Service}    || 'NULL';
    $Ticket{ServiceID}  = $Ticket{ServiceID}  || '';

    # history insert
    $Self->HistoryAdd(
        TicketID    => $Param{TicketID},
        HistoryType => 'ServiceUpdate',
        Name =>
            "\%\%$TicketNew{Service}\%\%$Param{ServiceID}\%\%$Ticket{Service}\%\%$Ticket{ServiceID}",
        CreateUserID => $Param{UserID},
    );

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketServiceUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item TicketEscalationPreferences()

get escalation preferences of a ticket (e. g. from SLA or from Queue based settings)

    my %Escalation = $TicketObject->TicketEscalationPreferences(
        Ticket => $Param{Ticket},
        UserID => $Param{UserID},
    );

=cut

sub TicketEscalationPreferences {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Ticket UserID)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # get ticket attributes
    my %Ticket = %{ $Param{Ticket} };

    # get escalation properties
    my %Escalation;
    if ( $Self->{ConfigObject}->Get('Ticket::Service') && $Ticket{SLAID} ) {
        %Escalation = $Self->{SLAObject}->SLAGet(
            SLAID  => $Ticket{SLAID},
            UserID => $Param{UserID},
            Cache  => 1,
        );
    }
    else {
        %Escalation = $Self->{QueueObject}->QueueGet(
            ID     => $Ticket{QueueID},
            UserID => $Param{UserID},
            Cache  => 1,
        );
    }

    return %Escalation;
}

=item TicketEscalationDateCalculation()

get escalation properties of a ticket

    my %Escalation = $TicketObject->TicketEscalationDateCalculation(
        Ticket => $Param{Ticket},
        UserID => $Param{UserID},
    );

it returnes

    (general escalation info)
    EscalationDestinationIn          (escalation in e. g. 1h 4m)
    EscalationDestinationTime        (date of escalation in unix time, e. g. 72193292)
    EscalationDestinationDate        (date of escalation, e. g. "2009-02-14 18:00:00")
    EscalationTimeWorkingTime        (seconds of working/service time till escalation, e. g. "1800")
    EscalationTime                   (seconds total till escalation, e. g. "3600")

    (detail escalation info about first response, update and solution time)
    FirstResponseTimeEscalation      (if true, ticket is escalated)
    FirstResponseTimeNotification    (if true, notify - x% of escalation has reached)
    FirstResponseTimeDestinationTime (date of escalation in unix time, e. g. 72193292)
    FirstResponseTimeDestinationDate (date of escalation, e. g. "2009-02-14 18:00:00")
    FirstResponseTimeWorkingTime     (seconds of working/service time till escalation, e. g. "1800")
    FirstResponseTime                (seconds total till escalation, e. g. "3600")

    UpdateTimeEscalation             (if true, ticket is escalated)
    UpdateTimeNotification           (if true, notify - x% of escalation has reached)
    UpdateTimeDestinationTime        (date of escalation in unix time, e. g. 72193292)
    UpdateTimeDestinationDate        (date of escalation, e. g. "2009-02-14 18:00:00")
    UpdateTimeWorkingTime            (seconds of working/service time till escalation, e. g. "1800")
    UpdateTime                       (seconds total till escalation, e. g. "3600")

    SolutionTimeEscalation           (if true, ticket is escalated)
    SolutionTimeNotification         (if true, notify - x% of escalation has reached)
    SolutionTimeDestinationTime      (date of escalation in unix time, e. g. 72193292)
    SolutionTimeDestinationDate      (date of escalation, e. g. "2009-02-14 18:00:00")
    SolutionTimeWorkingTime          (seconds of working/service time till escalation, e. g. "1800")
    SolutionTime                     (seconds total till escalation, e. g. "3600")

=cut

sub TicketEscalationDateCalculation {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Ticket UserID)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # get ticket attributes
    my %Ticket = %{ $Param{Ticket} };

    # do no escalations on (merge|close|remove) tickets
    return if $Ticket{StateType} =~ /^(merge|close|remove)/i;

    # get escalation properties
    my %Escalation = $Self->TicketEscalationPreferences(
        Ticket => $Param{Ticket},
        UserID => $Param{UserID} || 1,
    );

    # return if we do not have any escalation attributes
    my %Map = (
        EscalationResponseTime => 'FirstResponse',
        EscalationUpdateTime   => 'Update',
        EscalationSolutionTime => 'Solution',
    );
    my $EscalationAttribute;
    for my $Key ( keys %Map ) {
        if ( $Escalation{ $Map{$Key} . 'Time' } ) {
            $EscalationAttribute = 1;
            last;
        }
    }
    return if !$EscalationAttribute;

    # calculate escalation times based on escalation properties
    my $Time = $Self->{TimeObject}->SystemTime();
    my %Data;
    for my $Key ( keys %Map ) {

        # next is not escalation for this type is given
        next if !$Ticket{$Key};

        # get time before or over escalation (escalation_destination_unixtime - now)
        my $TimeTillEscalation = $Ticket{$Key} - $Time;

        # ticket is not escalated till now ($TimeTillEscalation > 0)
        my $WorkingTime = 0;
        if ( $TimeTillEscalation > 0 ) {
            $WorkingTime = $Self->{TimeObject}->WorkingTime(
                StartTime => $Time,
                StopTime  => $Ticket{$Key},
                Calendar  => $Escalation{Calendar},
            );

            # set notification if notfy % is reached
            if ( $Escalation{ $Map{$Key} . 'Notify' } ) {
                my $Reached
                    = 100 - ( $WorkingTime / ( $Escalation{ $Map{$Key} . 'Time' } * 60 / 100 ) );
                if ( $Reached >= $Escalation{ $Map{$Key} . 'Notify' } ) {
                    $Data{ $Map{$Key} . 'TimeNotification' } = 1;
                }
            }
        }

        # ticket is overtime ($TimeTillEscalation < 0)
        else {
            $WorkingTime = $Self->{TimeObject}->WorkingTime(
                StartTime => $Ticket{$Key},
                StopTime  => $Time,
                Calendar  => $Escalation{Calendar},
            );
            $WorkingTime = "-$WorkingTime";

            # set escalation
            $Data{ $Map{$Key} . 'TimeEscalation' } = 1;
        }
        my $DestinationDate = $Self->{TimeObject}->SystemTime2TimeStamp(
            SystemTime => $Ticket{$Key},
        );
        $Data{ $Map{$Key} . 'TimeDestinationTime' } = $Ticket{$Key};
        $Data{ $Map{$Key} . 'TimeDestinationDate' } = $DestinationDate;
        $Data{ $Map{$Key} . 'TimeWorkingTime' }     = $WorkingTime;
        $Data{ $Map{$Key} . 'Time' }                = $TimeTillEscalation;

        # set global escalation attributes (aet the escalation which is the first in time)
        if (
            !$Data{EscalationDestinationTime}
            || $Data{EscalationDestinationTime} > $Ticket{$Key}
            )
        {
            $Data{EscalationDestinationTime} = $Ticket{$Key};
            $Data{EscalationDestinationDate} = $DestinationDate;
            $Data{EscalationTimeWorkingTime} = $WorkingTime;
            $Data{EscalationTime}            = $TimeTillEscalation;

            # escalation time in readable way
            $Data{EscalationDestinationIn} = '';
            if ( $WorkingTime >= 3600 ) {
                $Data{EscalationDestinationIn} .= int( $WorkingTime / 3600 ) . 'h ';
                $WorkingTime = $WorkingTime
                    - ( int( $WorkingTime / 3600 ) * 3600 );    # remove already shown hours
            }
            if ( $WorkingTime <= 3600 || int( $WorkingTime / 60 ) ) {
                $Data{EscalationDestinationIn} .= int( $WorkingTime / 60 ) . 'm';
            }
        }
    }

    return %Data;
}

=item TicketEscalationIndexBuild()

build escalation index of one ticket with current settings (SLA, Queue, Calendar...)

    my $Success = $TicketObject->TicketEscalationIndexBuild(
        Ticket => $Param{Ticket},
        UserID => $Param{UserID},
    );

=cut

sub TicketEscalationIndexBuild {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID UserID)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    my %Ticket = $Self->TicketGet(
        TicketID => $Param{TicketID},
        UserID   => $Param{UserID},
    );

    # do no escalations on (merge|close|remove) tickets
    if ( $Ticket{StateType} =~ /^(merge|close|remove)/i ) {

        # update escalation times with 0
        my %EscalationTimes = (
            EscalationTime         => 'escalation_time',
            EscalationResponseTime => 'escalation_response_time',
            EscalationUpdateTime   => 'escalation_update_time',
            EscalationSolutionTime => 'escalation_solution_time',
        );
        my $Time = 0;
        for my $Key ( keys %EscalationTimes ) {

            # check if table update is needed
            next if !$Ticket{$Key};

            # update ticket table
            $Self->{DBObject}->Do(
                SQL => "UPDATE ticket SET $EscalationTimes{$Key} = ? WHERE id = ?",
                Bind => [ \$Time, \$Ticket{TicketID}, ]
            );
        }

        # clear ticket cache
        delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

        return 1;
    }

    # get escalation properties
    my %Escalation = $Self->TicketEscalationPreferences(
        Ticket => \%Ticket,
        UserID => $Param{UserID},
    );

    # find escalation times
    my $EscalationTime = 0;

    # update first response (if not responded till now)
    my $FirstResponseTime = 0;
    if ( !$Escalation{FirstResponseTime} ) {
        $Self->{DBObject}->Do(
            SQL => 'UPDATE ticket SET escalation_response_time = ? WHERE id = ?',
            Bind => [ \$FirstResponseTime, \$Ticket{TicketID}, ]
        );
    }
    else {

        # check if first response is already done
        my %FirstResponseDone = $Self->_TicketGetFirstResponse(
            TicketID => $Ticket{TicketID},
            Ticket   => \%Ticket,
        );

        # update first response time to 0
        if (%FirstResponseDone) {
            $Self->{DBObject}->Do(
                SQL => 'UPDATE ticket SET escalation_response_time = ? WHERE id = ?',
                Bind => [ \$FirstResponseTime, \$Ticket{TicketID}, ]
            );
        }

        # update first response time to expected escaltion destination time
        else {
            my $DestinationTime = $Self->{TimeObject}->DestinationTime(
                StartTime => $Self->{TimeObject}->TimeStamp2SystemTime(
                    String => $Ticket{Created}
                ),
                Time     => $Escalation{FirstResponseTime} * 60,
                Calendar => $Escalation{Calendar},
            );

            # update first response time to $DestinationTime
            $Self->{DBObject}->Do(
                SQL => 'UPDATE ticket SET escalation_response_time = ? WHERE id = ?',
                Bind => [ \$DestinationTime, \$Ticket{TicketID}, ]
            );

            # remember escalation time
            $EscalationTime = $DestinationTime;
        }
    }

    # update update && do not escalate in "pending auto" for escalation update time
    my $UpdateTime = 0;
    if ( !$Escalation{UpdateTime} || $Ticket{StateType} =~ /^(pending)/i ) {
        $Self->{DBObject}->Do(
            SQL => 'UPDATE ticket SET escalation_update_time = ? WHERE id = ?',
            Bind => [ \$UpdateTime, \$Ticket{TicketID}, ]
        );
    }
    else {

        # check if update escalation should be set
        my @SenderHistory;
        return if !$Self->{DBObject}->Prepare(
            SQL => 'SELECT article_sender_type_id, article_type_id, create_time FROM '
                . 'article WHERE ticket_id = ? ORDER BY create_time ASC',
            Bind => [ \$Param{TicketID} ],
        );
        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            push @SenderHistory, {
                SenderTypeID  => $Row[0],
                ArticleTypeID => $Row[1],
                Created       => $Row[2],
            };
        }

        # fill up lookups
        for my $Row (@SenderHistory) {

            # get sender type
            $Row->{SenderType} = $Self->ArticleSenderTypeLookup(
                SenderTypeID => $Row->{SenderTypeID},
            );

            # get article type
            $Row->{ArticleType} = $Self->ArticleTypeLookup(
                ArticleTypeID => $Row->{ArticleTypeID},
            );
        }

        # get latest customer contact time
        my $LastSenderTime;
        my $LastSenderType = '';
        for my $Row ( reverse @SenderHistory ) {

            # fill up latest sender time (as initial value)
            if ( !$LastSenderTime ) {
                $LastSenderTime = $Row->{Created};
            }

            # do not use locked tickets for calc.
            #last if $Ticket{Lock} eq 'lock';

            # do not use /int/ article types for calc.
            next if $Row->{ArticleType} =~ /int/i;

            # do not use /agent|customer/ article types for calc.
            next if $Row->{SenderType} !~ /^(agent|customer)$/;

            # last if latest was customer and the next was not customer
            # otherwise use also next, older customer article as latest
            # customer followup for starting escalation
            if ( $Row->{SenderType} eq 'agent' && $LastSenderType eq 'customer' ) {
                last;
            }

            # start escalation on latest customer article
            if ( $Row->{SenderType} eq 'customer' ) {
                $LastSenderType = 'customer';
                $LastSenderTime = $Row->{Created};
            }

            # start escalation on latest agent article
            if ( $Row->{SenderType} eq 'agent' ) {
                $LastSenderTime = $Row->{Created};
                last;
            }
        }
        if ($LastSenderTime) {
            my $DestinationTime = $Self->{TimeObject}->DestinationTime(
                StartTime => $Self->{TimeObject}->TimeStamp2SystemTime(
                    String => $LastSenderTime,
                ),
                Time     => $Escalation{UpdateTime} * 60,
                Calendar => $Escalation{Calendar},
            );

            # update update time to $DestinationTime
            $Self->{DBObject}->Do(
                SQL => 'UPDATE ticket SET escalation_update_time = ? WHERE id = ?',
                Bind => [ \$DestinationTime, \$Ticket{TicketID}, ]
            );

            # remember escalation time
            if ( $EscalationTime == 0 || $DestinationTime < $EscalationTime ) {
                $EscalationTime = $DestinationTime;
            }
        }

        # else, no not escalate, because latest sender was agent
        else {
            $Self->{DBObject}->Do(
                SQL => 'UPDATE ticket SET escalation_update_time = ? WHERE id = ?',
                Bind => [ \$UpdateTime, \$Ticket{TicketID}, ]
            );
        }
    }

    # update solution
    my $SolutionTime = 0;
    if ( !$Escalation{SolutionTime} ) {
        $Self->{DBObject}->Do(
            SQL => 'UPDATE ticket SET escalation_solution_time = ? WHERE id = ?',
            Bind => [ \$SolutionTime, \$Ticket{TicketID}, ]
        );
    }
    else {

        # find solution time / first close time
        my %SolutionDone = $Self->_TicketGetClosed(
            TicketID => $Ticket{TicketID},
            Ticket   => \%Ticket,
        );

        # update solution time to 0
        if (%SolutionDone) {
            $Self->{DBObject}->Do(
                SQL => 'UPDATE ticket SET escalation_solution_time = ? WHERE id = ?',
                Bind => [ \$SolutionTime, \$Ticket{TicketID}, ]
            );
        }
        else {
            my $DestinationTime = $Self->{TimeObject}->DestinationTime(
                StartTime => $Self->{TimeObject}->TimeStamp2SystemTime(
                    String => $Ticket{Created}
                ),
                Time     => $Escalation{SolutionTime} * 60,
                Calendar => $Escalation{Calendar},
            );

            # update solution time to $DestinationTime
            $Self->{DBObject}->Do(
                SQL => 'UPDATE ticket SET escalation_solution_time = ? WHERE id = ?',
                Bind => [ \$DestinationTime, \$Ticket{TicketID}, ]
            );

            # remember escalation time
            if ( $EscalationTime == 0 || $DestinationTime < $EscalationTime ) {
                $EscalationTime = $DestinationTime;
            }
        }
    }

    # update escalation time (< escalation time)
    if ( defined $EscalationTime ) {
        $Self->{DBObject}->Do(
            SQL => 'UPDATE ticket SET escalation_time = ? WHERE id = ?',
            Bind => [ \$EscalationTime, \$Ticket{TicketID}, ]
        );
    }

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    return 1;
}

=item TicketSLAList()

to get all possible SLAs for a ticket (depends on workflow, if configured)

    my %SLAs = $TicketObject->TicketSLAList(
        ServiceID => 1,
        UserID    => 123,
    );

    my %SLAs = $TicketObject->TicketSLAList(
        QueueID   => 123,
        ServiceID => 1,
        UserID    => 123,
    );

    my %SLAs = $TicketObject->TicketSLAList(
        TicketID  => 123,
        ServiceID => 1,
        UserID    => 123,
    );

=cut

sub TicketSLAList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} && !$Param{CustomerUserID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need UserID or CustomerUserID!' );
        return;
    }

    # check needed stuff
    if ( !$Param{QueueID} && !$Param{TicketID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need QueueID or TicketID!' );
        return;
    }

    # return emty hash, if no service id is given
    if ( !$Param{ServiceID} ) {
        return ();
    }

    # get sla list
    my %SLAs = $Self->{SLAObject}->SLAList(
        ServiceID => $Param{ServiceID},
        UserID    => 1,
    );

    # workflow
    my $ACL = $Self->TicketAcl(
        %Param,
        ReturnType    => 'Ticket',
        ReturnSubType => 'SLA',
        Data          => \%SLAs,
    );
    if ($ACL) {
        return $Self->TicketAclData();
    }
    return %SLAs;
}

=item TicketSLASet()

to set a ticket service

    $TicketObject->TicketSLASet(
        SLAID    => 123,
        TicketID => 123,
        UserID   => 123,
    );

    $TicketObject->TicketSLASet(
        SLA      => 'SLA A',
        TicketID => 123,
        UserID   => 123,
    );

=cut

sub TicketSLASet {
    my ( $Self, %Param ) = @_;

    # sla lookup
    if ( $Param{SLA} && !$Param{SLAID} ) {
        $Param{SLAID} = $Self->{SLAObject}->SLALookup( Name => $Param{SLA} );
    }

    # check needed stuff
    for (qw(TicketID SLAID UserID)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # get current ticket
    my %Ticket = $Self->TicketGet(%Param);

    # update needed?
    return 1 if ( $Param{SLAID} eq $Ticket{SLAID} );

    # permission check
    my %SLAList = $Self->TicketSLAList(
        %Param,
        ServiceID => $Ticket{ServiceID},
    );

    if ( $Param{UserID} != 1 && $Param{SLAID} ne '' && !$SLAList{ $Param{SLAID} } ) {
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "Permission denied on TicketID: $Param{TicketID}!",
        );
        return;
    }

    # check database undef/NULL (set value to undef/NULL to prevent database errors)
    for (qw(ServiceID SLAID)) {
        if ( !$Param{$_} ) {
            $Param{$_} = undef;
        }
    }

    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket SET sla_id = ? WHERE id = ?',
        Bind => [ \$Param{SLAID}, \$Param{TicketID} ],
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # get new ticket data
    my %TicketNew = $Self->TicketGet(%Param);
    $TicketNew{SLA} = $TicketNew{SLA} || 'NULL';
    $Param{SLAID}   = $Param{SLAID}   || '';
    $Ticket{SLA}    = $Ticket{SLA}    || 'NULL';
    $Ticket{SLAID}  = $Ticket{SLAID}  || '';

    # history insert
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        HistoryType  => 'SLAUpdate',
        Name         => "\%\%$TicketNew{SLA}\%\%$Param{SLAID}\%\%$Ticket{SLA}\%\%$Ticket{SLAID}",
        CreateUserID => $Param{UserID},
    );

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketSLAUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item SetCustomerData()

Set customer data of ticket.

    $TicketObject->SetCustomerData(
        No       => 'client123',
        User     => 'client-user-123',
        TicketID => 123,
        UserID   => 23,
    );

=cut

sub SetCustomerData {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    if ( !defined $Param{No} && !defined $Param{User} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need User or No for update!' );
        return;
    }

    # db customer id update
    if ( defined $Param{No} ) {
        my $Ok = $Self->{DBObject}->Do(
            SQL => 'UPDATE ticket SET customer_id = ?, '
                . ' change_time = current_timestamp, change_by = ? WHERE id = ?',
            Bind => [ \$Param{No}, \$Param{UserID}, \$Param{TicketID} ]
        );
        if ($Ok) {
            $Param{History} = "CustomerID=$Param{No};";
        }
    }

    # db customer user update
    if ( defined $Param{User} ) {
        my $Ok = $Self->{DBObject}->Do(
            SQL => 'UPDATE ticket SET customer_user_id = ?, '
                . 'change_time = current_timestamp, change_by = ? WHERE id = ?',
            Bind => [ \$Param{User}, \$Param{UserID}, \$Param{TicketID} ],
        );
        if ($Ok) {
            $Param{History} .= "CustomerUser=$Param{User};";
        }
    }

    # if no change
    if ( !$Param{History} ) {
        return;
    }

    # history insert
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        HistoryType  => 'CustomerUpdate',
        Name         => "\%\%" . $Param{History},
        CreateUserID => $Param{UserID},
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketCustomerUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item TicketFreeTextGet()

get _possible_ ticket free text options

Note: the current value is accessible over TicketGet()

    my $HashRef = $TicketObject->TicketFreeTextGet(
        Type     => 'TicketFreeText3',
        TicketID => 123,
        UserID   => 123, # or CustomerUserID
    );

    my $HashRef = $TicketObject->TicketFreeTextGet(
        Type   => 'TicketFreeText3',
        UserID => 123, # or CustomerUserID
    );

    # fill up with existing values
    my $HashRef = $TicketObject->TicketFreeTextGet(
        Type   => 'TicketFreeText3',
        FillUp => 1,
        UserID => 123, # or CustomerUserID
    );

=cut

sub TicketFreeTextGet {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value} || '';
    my $Key   = $Param{Key}   || '';

    # check needed stuff
    for (qw(Type)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    if ( !$Param{UserID} && !$Param{CustomerUserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need UserID or CustomerUserID!',
        );
        return;
    }

    # get config
    my %Data = ();
    if ( ref $Self->{ConfigObject}->Get( $Param{Type} ) eq 'HASH' ) {
        %Data = %{ $Self->{ConfigObject}->Get( $Param{Type} ) };
    }

    # check existing
    if ( $Param{FillUp} && %Data ) {

        my $TimeStart = $Self->{TimeObject}->SystemTime();
        my $Counter   = $Param{Type};
        $Counter =~ s/^.+?(\d+?)$/$1/;

        # check cache
        my $CacheObject = Kernel::System::Cache->new( %{$Self} );
        my $CacheData   = $CacheObject->Get(
            Type => 'TicketFreeTextLookup',
            Key  => $Param{Type},
        );

        # do cache lookup
        if ( $CacheData && ref $CacheData eq 'HASH' ) {
            %Data = ( %{$CacheData}, %Data );
        }

        # do database lookup
        elsif ( $Param{Type} =~ /text/i ) {
            return if !$Self->{DBObject}->Prepare(
                SQL => "SELECT distinct(freetext$Counter) FROM ticket",
            );
            while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
                if ( $Row[0] && !$Data{ $Row[0] } ) {
                    $Data{ $Row[0] } = $Row[0];
                }
            }
        }
        else {
            return if !$Self->{DBObject}->Prepare(
                SQL => "SELECT distinct(freekey$Counter) FROM ticket",
            );
            while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
                if ( $Row[0] && !$Data{ $Row[0] } ) {
                    $Data{ $Row[0] } = $Row[0];
                }
            }
        }

        # fill cache
        if ( !$CacheData && %Data ) {
            my $TimeEnd = $Self->{TimeObject}->SystemTime();
            my $TTL     = 10 * 60;
            if ( $TimeEnd - $TimeStart > 2 ) {
                $TTL = 8 * 60 * 60;
            }
            elsif ( $TimeEnd - $TimeStart > 1 ) {
                $TTL = 4 * 60 * 60;
            }
            elsif ( $TimeEnd - $TimeStart > 0 ) {
                $TTL = 2 * 60 * 60;
            }
            $CacheObject->Set(
                Type  => 'TicketFreeTextLookup',
                Key   => $Param{Type},
                Value => \%Data,
                TTL   => $TTL,
            );
        }
    }

    # workflow
    my $ACL = $Self->TicketAcl(
        %Param,
        ReturnType    => 'Ticket',
        ReturnSubType => $Param{Type},
        Data          => \%Data,
    );
    if ($ACL) {
        my %Hash = $Self->TicketAclData();
        return \%Hash;
    }
    return if !%Data;
    return \%Data;
}

=item TicketFreeTextSet()

Set ticket free text.

    $TicketObject->TicketFreeTextSet(
        Counter  => 1,
        Key      => 'Planet', # optional
        Value    => 'Sun',  # optional
        TicketID => 123,
        UserID   => 23,
    );

=cut

sub TicketFreeTextSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID UserID Counter)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # check if update is needed
    my %Ticket = $Self->TicketGet( TicketID => $Param{TicketID} );

    my $Value = '';
    my $Key   = '';

    if ( defined $Param{Value} ) {
        $Value = $Param{Value};
    }
    else {
        $Value = $Ticket{ 'TicketFreeText' . $Param{Counter} };
    }

    if ( defined $Param{Key} ) {
        $Key = $Param{Key};
    }
    else {
        $Key = $Ticket{ 'TicketFreeKey' . $Param{Counter} };
    }

    if (
        $Value  eq $Ticket{"TicketFreeText$Param{Counter}"}
        && $Key eq $Ticket{"TicketFreeKey$Param{Counter}"}
        )
    {
        return 1;
    }

    # db quote
    for (qw(Counter)) {
        $Param{$_} = $Self->{DBObject}->Quote( $Param{$_}, 'Integer' );
    }

    # db update
    return if !$Self->{DBObject}->Do(
        SQL => "UPDATE ticket SET freekey$Param{Counter} = ?, freetext$Param{Counter} = ?, "
            . " change_time = current_timestamp, change_by = ? WHERE id = ?",
        Bind => [ \$Key, \$Value, \$Param{UserID}, \$Param{TicketID} ],
    );

    # history insert
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        QueueID      => $Ticket{QueueID},
        HistoryType  => 'TicketFreeTextUpdate',
        Name         => "\%\%FreeKey$Param{Counter}\%\%$Key\%\%FreeText$Param{Counter}\%\%$Value",
        CreateUserID => $Param{UserID},
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketFreeTextUpdate',
        Counter  => $Param{Counter},
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item TicketFreeTimeSet()

Set ticket free text.

    $TicketObject->TicketFreeTimeSet(
        Counter               => 1,
        Prefix                => 'TicketFreeTime',
        TicketFreeTime1Year   => 1900,
        TicketFreeTime1Month  => 12,
        TicketFreeTime1Day    => 24,
        TicketFreeTime1Hour   => 22,
        TicketFreeTime1Minute => 01,
        TicketID              => 123,
        UserID                => 23,
    );

=cut

sub TicketFreeTimeSet {
    my ( $Self, %Param ) = @_;

    my $Prefix = $Param{'Prefix'} || 'TicketFreeTime';

    # check needed stuff
    for (qw(TicketID UserID Counter)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    for (qw(Year Month Day Hour Minute)) {
        if ( !defined $Param{ $Prefix . $Param{Counter} . $_ } ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Prefix" . $Param{Counter} . "$_!",
            );
            return;
        }
    }

    # generate time stamp to compare if update is needed
    my $TimeStamp = sprintf(
        "%04d-%02d-%02d %02d:%02d:00",
        $Param{ $Prefix . $Param{Counter} . 'Year' },
        $Param{ $Prefix . $Param{Counter} . 'Month' },
        $Param{ $Prefix . $Param{Counter} . 'Day' },
        $Param{ $Prefix . $Param{Counter} . 'Hour' },
        $Param{ $Prefix . $Param{Counter} . 'Minute' },
    );
    if ( $TimeStamp eq '0000-00-00 00:00:00' ) {
        $TimeStamp = '';
    }

    # check if update is needed
    my %Ticket = $Self->TicketGet( TicketID => $Param{TicketID} );
    if ( $TimeStamp eq $Ticket{"TicketFreeTime$Param{Counter}"} ) {
        return 1;
    }

    # db update
    for (qw(Counter)) {
        $Param{$_} = $Self->{DBObject}->Quote( $Param{$_}, 'Integer' );
    }
    if ( !$TimeStamp || $TimeStamp eq '0000-00-00 00:00:00' ) {
        $TimeStamp = undef;
    }
    return if !$Self->{DBObject}->Do(
        SQL => "UPDATE ticket SET freetime$Param{Counter} = ?, "
            . "change_time = current_timestamp, change_by = ? WHERE id = ?",
        Bind => [ \$TimeStamp, \$Param{UserID}, \$Param{TicketID} ],
    );
    if ( !$TimeStamp ) {
        $TimeStamp = '';
    }

    # history insert
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        QueueID      => $Ticket{QueueID},
        HistoryType  => 'TicketFreeTextUpdate',
        Name         => "\%\%FreeTime$Param{Counter}\%\%$TimeStamp",
        CreateUserID => $Param{UserID},
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketFreeTimeUpdate',
        Counter  => $Param{Counter},
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item Permission()

returns if the agent has permissions or no

    my $Access = $TicketObject->Permission(
        Type     => 'ro',
        TicketID => 123,
        UserID   => 123,
    );

or without logging, for example for to check if a link/action should be shown

    my $Access = $TicketObject->Permission(
        Type     => 'ro',
        TicketID => 123,
        LogNo    => 1,
        UserID   => 123,
    );

=cut

sub Permission {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Type TicketID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # run all TicketPermission modules
    if ( ref $Self->{ConfigObject}->Get('Ticket::Permission') eq 'HASH' ) {
        my %Modules = %{ $Self->{ConfigObject}->Get('Ticket::Permission') };
        for my $Module ( sort keys %Modules ) {

            # log try of load module
            if ( $Self->{Debug} > 1 ) {
                $Self->{LogObject}->Log(
                    Priority => 'debug',
                    Message  => "Try to load module: $Modules{$Module}->{Module}!",
                );
            }

            # load module
            next if !$Self->{MainObject}->Require( $Modules{$Module}->{Module} );

            # create object
            my $ModuleObject = $Modules{$Module}->{Module}->new(
                ConfigObject => $Self->{ConfigObject},
                LogObject    => $Self->{LogObject},
                DBObject     => $Self->{DBObject},
                TicketObject => $Self,
                QueueObject  => $Self->{QueueObject},
                UserObject   => $Self->{UserObject},
                GroupObject  => $Self->{GroupObject},
                Debug        => $Self->{Debug},
            );

            # execute Run()
            my $AccessOk = $ModuleObject->Run(%Param);

            # check granted option (should I say ok)
            if ( $AccessOk && $Modules{$Module}->{Granted} ) {
                if ( $Self->{Debug} > 0 ) {
                    $Self->{LogObject}->Log(
                        Priority => 'debug',
                        Message  => "Granted access '$Param{Type}' true for "
                            . "TicketID '$Param{TicketID}' "
                            . "through $Modules{$Module}->{Module} (no more checks)!",
                    );
                }

                # access ok
                return 1;
            }

            # return because access is false but it's required
            if ( !$AccessOk && $Modules{$Module}->{Required} ) {
                if ( !$Param{LogNo} ) {
                    $Self->{LogObject}->Log(
                        Priority => 'notice',
                        Message  => "Permission denied because module "
                            . "($Modules{$Module}->{Module}) is required "
                            . "(UserID: $Param{UserID} '$Param{Type}' on "
                            . "TicketID: $Param{TicketID})!",
                    );
                }

                # access not ok
                return;
            }
        }
    }

    # don't grant access to the ticket
    if ( !$Param{LogNo} ) {
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "Permission denied (UserID: $Param{UserID} '$Param{Type}' "
                . "on TicketID: $Param{TicketID})!",
        );
    }
    return;
}

=item CustomerPermission()

returns if the agent has permissions or no

    my $Access = $TicketObject->CustomerPermission(
        Type     => 'ro',
        TicketID => 123,
        UserID   => 123,
    );

or without logging, for example for to check if a link/action should be shown

    my $Access = $TicketObject->CustomerPermission(
        Type     => 'ro',
        TicketID => 123,
        LogNo    => 1,
        UserID   => 123,
    );

=cut

sub CustomerPermission {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Type TicketID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # run all CustomerTicketPermission modules
    if ( ref $Self->{ConfigObject}->Get('CustomerTicket::Permission') eq 'HASH' ) {
        my %Modules = %{ $Self->{ConfigObject}->Get('CustomerTicket::Permission') };
        for my $Module ( sort keys %Modules ) {

            # log try of load module
            if ( $Self->{Debug} > 1 ) {
                $Self->{LogObject}->Log(
                    Priority => 'debug',
                    Message  => "Try to load module: $Modules{$Module}->{Module}!",
                );
            }

            # load module
            next if !$Self->{MainObject}->Require( $Modules{$Module}->{Module} );

            # create object
            my $ModuleObject = $Modules{$Module}->{Module}->new(
                ConfigObject        => $Self->{ConfigObject},
                LogObject           => $Self->{LogObject},
                DBObject            => $Self->{DBObject},
                TicketObject        => $Self,
                QueueObject         => $Self->{QueueObject},
                CustomerUserObject  => $Self->{CustomerUserObject},
                CustomerGroupObject => $Self->{CustomerGroupObject},
                Debug               => $Self->{Debug},
            );

            # execute Run()
            my $AccessOk = $ModuleObject->Run(%Param);

            # check granted option (should I say ok)
            if ( $AccessOk && $Modules{$Module}->{Granted} ) {
                if ( $Self->{Debug} > 0 ) {
                    $Self->{LogObject}->Log(
                        Priority => 'debug',
                        Message  => "Granted access '$Param{Type}' true for "
                            . "TicketID '$Param{TicketID}' "
                            . "through $Modules{$Module}->{Module} (no more checks)!",
                    );
                }

                # access ok
                return 1;
            }

            # return because access is false but it's required
            if ( !$AccessOk && $Modules{$Module}->{Required} ) {
                if ( !$Param{LogNo} ) {
                    $Self->{LogObject}->Log(
                        Priority => 'notice',
                        Message  => "Permission denied because module "
                            . "($Modules{$Module}->{Module}) is required "
                            . "(UserID: $Param{UserID} '$Param{Type}' on "
                            . "TicketID: $Param{TicketID})!",
                    );
                }

                # access not ok
                return;
            }
        }
    }

    # don't grant access to the ticket
    if ( !$Param{LogNo} ) {
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "Permission denied (UserID: $Param{UserID} '$Param{Type}' on "
                . "TicketID: $Param{TicketID})!",
        );
    }
    return;
}

=item GetSubscribedUserIDsByQueueID()

returns a array of user ids which selected the given queue id as
custom queue.

    my @UserIDs = $TicketObject->GetSubscribedUserIDsByQueueID(
        QueueID => 123,
    );

=cut

sub GetSubscribedUserIDsByQueueID {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{QueueID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need QueueID!' );
        return;
    }

    # get group of queue
    my %Queue = $Self->{QueueObject}->QueueGet( ID => $Param{QueueID} );

    # fetch all queues
    my @UserIDs = ();
    return if !$Self->{DBObject}->Prepare(
        SQL  => 'SELECT user_id FROM personal_queues WHERE queue_id = ?',
        Bind => [ \$Param{QueueID} ],
    );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @UserIDs, $Row[0];
    }

    # check if user is valid and check permissions
    my @CleanUserIDs = ();
    for my $UserID (@UserIDs) {
        my %User = $Self->{UserObject}->GetUserData( UserID => $UserID, Valid => 1 );
        next if !%User;

        # just send emails to permitted agents
        my %GroupMember = $Self->{GroupObject}->GroupMemberList(
            UserID => $UserID,
            Type   => 'ro',
            Result => 'HASH',
        );
        if ( $GroupMember{ $Queue{GroupID} } ) {
            push @CleanUserIDs, $UserID;
        }
    }
    return @CleanUserIDs;
}

=item TicketPendingTimeSet()

set ticket pending time

    $TicketObject->TicketPendingTimeSet(
        Year     => 2003,
        Month    => 08,
        Day      => 14,
        Hour     => 22,
        Minute   => 05,
        TicketID => 123,
        UserID   => 23,
    );

or use a time stamp

    $TicketObject->TicketPendingTimeSet(
        String   => '2003-08-14 22:05:00',
        TicketID => 123,
        UserID   => 23,
    );

=cut

sub TicketPendingTimeSet {
    my ( $Self, %Param ) = @_;

    my $Time;

    # check needed stuff
    if ( !$Param{String} ) {
        for (qw(Year Month Day Hour Minute TicketID UserID)) {
            if ( !defined $Param{$_} ) {
                $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
                return;
            }
        }
    }

    # get system time from string/params
    if ( $Param{String} ) {
        $Time = $Self->{TimeObject}->TimeStamp2SystemTime( String => $Param{String}, );
        ( $Param{Sec}, $Param{Minute}, $Param{Hour}, $Param{Day}, $Param{Month}, $Param{Year} )
            = $Self->{TimeObject}->SystemTime2Date( SystemTime => $Time, );
    }
    else {
        $Time = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => "$Param{Year}-$Param{Month}-$Param{Day} $Param{Hour}:$Param{Minute}:00",
        );
    }

    # return if no convert is possible
    return if !$Time;

    # db update
    return if !$Self->{DBObject}->Do(
        SQL =>
            'UPDATE ticket SET until_time = ?, change_time = current_timestamp, change_by = ? WHERE id = ?',
        Bind => [ \$Time, \$Param{UserID}, \$Param{TicketID} ],
    );

    # history insert
    $Self->HistoryAdd(
        TicketID    => $Param{TicketID},
        HistoryType => 'SetPendingTime',
        Name        => '%%'
            . sprintf( "%02d", $Param{Year} ) . '-'
            . sprintf( "%02d", $Param{Month} ) . '-'
            . sprintf( "%02d", $Param{Day} ) . ' '
            . sprintf( "%02d", $Param{Hour} ) . ':'
            . sprintf( "%02d", $Param{Minute} ) . '',
        CreateUserID => $Param{UserID},
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketPendingTimeUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );

    return 1;
}

=item TicketSearch()

To find tickets in your system.

    my @TicketIDs = $TicketObject->TicketSearch(
        # result (required)
        Result => 'ARRAY' || 'HASH' || 'COUNT',

        # result limit
        Limit => 100,

        # ticket number (optional) as STRING or as ARRAYREF
        TicketNumber => '%123546%',
        TicketNumber => ['%123546%', '%123666%'],

        # ticket title (optional) as STRING or as ARRAYREF
        Title => '%SomeText%',
        Title => ['%SomeTest1%', '%SomeTest2%'],

        Queues   => ['system queue', 'other queue'],
        QueueIDs => [1, 42, 512],

        # use also sub queues of Queue|Queues in search
        UseSubQueues => 0,

        # You can use types like normal, ...
        Types   => ['normal', 'change', 'incident'],
        TypeIDs => [3, 4],

        # You can use states like new, open, pending reminder, ...
        States   => ['new', 'open'],
        StateIDs => [3, 4],

        # (Open|Closed) tickets for all closed or open tickets.
        StateType => 'Open',

        # You also can use real state types like new, open, closed,
        # pending reminder, pending auto, removed and merged.
        StateType    => ['open', 'new'],
        StateTypeIDs => [1, 2, 3],

        Priorities  => ['1 very low', '2 low', '3 normal'],
        PriorityIDs => [1, 2, 3],

        Services   => ['Service A', 'Service B'],
        ServiceIDs => [1, 2, 3],

        SLAs   => ['SLA A', 'SLA B'],
        SLAIDs => [1, 2, 3],

        Locks   => ['unlock'],
        LockIDs => [1, 2, 3],

        OwnerIDs => [1, 12, 455, 32]

        ResponsibleIDs => [1, 12, 455, 32]

        WatchUserIDs => [1, 12, 455, 32]

        # CustomerID (optional) as STRING or as ARRAYREF
        CustomerID => '123',
        CustomerID => ['123', 'ABC'],

        # CustomerUserLogin (optional) as STRING as ARRAYREF
        CustomerUserLogin => 'uid123',
        CustomerUserLogin => ['uid123', 'uid777'],

        # create ticket properties (optional)
        CreatedUserIDs     => [1, 12, 455, 32]
        CreatedTypes       => ['normal', 'change', 'incident'],
        CreatedTypeIDs     => [1, 2, 3],
        CreatedPriorities  => ['1 very low', '2 low', '3 normal'],
        CreatedPriorityIDs => [1, 2, 3],
        CreatedStates      => ['new', 'open'],
        CreatedStateIDs    => [3, 4],
        CreatedQueues      => ['system queue', 'other queue'],
        CreatedQueueIDs    => [1, 42, 512],

        # 1..16 (optional)
        TicketFreeKey1  => 'Product',
        TicketFreeText1 => 'adasd',
        # or with multi options as array ref or string possible
        TicketFreeKey2  => ['Product', 'Product2'],
        TicketFreeText2 => ['Browser', 'Sound', 'Mouse'],

        # 1..6 (optional)
        # tickets with free time after ... (optional)
        TicketFreeTime1NewerDate => '2006-01-09 00:00:01',
        # tickets with free time before ... (optional)
        TicketFreeTime1OlderDate => '2006-01-19 23:59:59',

        # article stuff (optional)
        From    => '%spam@example.com%',
        To      => '%support@example.com%',
        Cc      => '%client@example.com%',
        Subject => '%VIRUS 32%',
        Body    => '%VIRUS 32%',

        # use full text index if configured (optional, default off)
        FullTextIndex => 1,

        # content search (AND or OR) (optional)
        ContentSearch => 'AND',

        # content conditions for From,To,Cc,Subject,Body,TicketNumber,
        # Title,CustomerID and CustomerUserLogin (all optional)
        ConditionInline => 1,

        # articles created more than 60 minutes ago (article older than 60 minutes) (optional)
        ArticleCreateTimeOlderMinutes => 60,
        # articles created less than 120 minutes ago (article newer than 60 minutes) (optional)
        ArticleCreateTimeNewerMinutes => 120,

        # articles with create time after ... (article newer than this date) (optional)
        ArticleCreateTimeNewerDate => '2006-01-09 00:00:01',
        # articles with created time before ... (article older than this date) (optional)
        ArticleCreateTimeOlderDate => '2006-01-19 23:59:59',

        # tickets created more than 60 minutes ago (ticket older than 60 minutes)  (optional)
        TicketCreateTimeOlderMinutes => 60,
        # tickets created less than 120 minutes ago (ticket newer than 120 minutes) (optional)
        TicketCreateTimeNewerMinutes => 120,

        # tickets with create time after ... (ticket newer than this date) (optional)
        TicketCreateTimeNewerDate => '2006-01-09 00:00:01',
        # tickets with created time before ... (ticket older than this date) (optional)
        TicketCreateTimeOlderDate => '2006-01-19 23:59:59',

        # tickets changed more than 60 minutes ago (optional)
        TicketChangeTimeOlderMinutes => 60,
        # tickets changed less than 120 minutes ago (optional)
        TicketChangeTimeNewerMinutes => 120,

        # tickets with changed time after ... (ticket changed newer than this date) (optional)
        TicketChangeTimeNewerDate => '2006-01-09 00:00:01',
        # tickets with changed time before ... (ticket changed older than this date) (optional)
        TicketChangeTimeOlderDate => '2006-01-19 23:59:59',

        # tickets closed more than 60 minutes ago (optional)
        TicketCloseTimeOlderMinutes => 60,
        # tickets closed less than 120 minutes ago (optional)
        TicketCloseTimeNewerMinutes => 120,

        # tickets with closed time after ... (ticket closed newer than this date) (optional)
        TicketCloseTimeNewerDate => '2006-01-09 00:00:01',
        # tickets with closed time before ... (ticket closed older than this date) (optional)
        TicketCloseTimeOlderDate => '2006-01-19 23:59:59',

        # tickets pending time of more than 60 minutes ago (optional)
        TicketPendingTimeOlderMinutes => 60,
        # tickets pending time of less than 120 minutes ago (optional)
        TicketPendingTimeNewerMinutes => 120,

        # tickets with pending time after ... (optional)
        TicketPendingTimeNewerDate => '2006-01-09 00:00:01',
        # tickets with pending time before ... (optional)
        TicketPendingTimeOlderDate => '2006-01-19 23:59:59',

        # you can use all following escalation options with this four different ways of escalations
        # TicketEscalationTime...
        # TicketEscalationUpdateTime...
        # TicketEscalationResponseTime...
        # TicketEscalationSolutionTime...

        # ticket escalation time of more than 60 minutes ago (optional)
        TicketEscalationTimeOlderMinutes => -60,
        # ticket escalation time of less than 120 minutes ago (optional)
        TicketEscalationTimeNewerMinutes => -120,

        # tickets with escalation time after ... (optional)
        TicketEscalationTimeNewerDate => '2006-01-09 00:00:01',
        # tickets with escalation time before ... (optional)
        TicketEscalationTimeOlderDate => '2006-01-09 23:59:59',

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age|Type|Lock
                            # Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # TicketFreeTime1-6|TicketFreeKey1-16|TicketFreeText1-16

        # OrderBy and SortBy as ARRAY for sub sorting (optional)
        OrderBy => ['Down', 'Up'],
        SortBy  => ['Priority', 'Age'],

        # user search (UserID is required)
        UserID     => 123,
        Permission => 'ro' || 'rw',

        # customer search (CustomerUserID is required)
        CustomerUserID => 123,
        Permission     => 'ro' || 'rw',

        # CacheTTL, cache search result xx secunds (optional)
        CacheTTL => 60 * 15,
    );

=cut

sub TicketSearch {
    my ( $Self, %Param ) = @_;

    my $Result  = $Param{Result}  || 'HASH';
    my $OrderBy = $Param{OrderBy} || 'Down';
    my $SortBy  = $Param{SortBy}  || 'Age';
    my $Limit   = $Param{Limit}   || 10000;
    if ( !$Param{ContentSearch} ) {
        $Param{ContentSearch} = 'AND';
    }
    my %SortOptions = (
        Owner                  => 'st.user_id',
        Responsible            => 'st.responsible_user_id',
        CustomerID             => 'st.customer_id',
        State                  => 'st.ticket_state_id',
        Lock                   => 'st.ticket_lock_id',
        Ticket                 => 'st.tn',
        TicketNumber           => 'st.tn',
        Title                  => 'st.title',
        Queue                  => 'sq.name',
        Type                   => 'st.type_id',
        Priority               => 'st.ticket_priority_id',
        Age                    => 'st.create_time_unix',
        Service                => 'st.service_id',
        SLA                    => 'st.sla_id',
        PendingTime            => 'st.until_time',
        TicketEscalation       => 'st.escalation_time',
        EscalationTime         => 'st.escalation_time',
        EscalationUpdateTime   => 'st.escalation_update_time',
        EscalationResponseTime => 'st.escalation_response_time',
        EscalationSolutionTime => 'st.escalation_solution_time',
        TicketFreeTime1        => 'st.freetime1',
        TicketFreeTime2        => 'st.freetime2',
        TicketFreeTime3        => 'st.freetime3',
        TicketFreeTime4        => 'st.freetime4',
        TicketFreeTime5        => 'st.freetime5',
        TicketFreeTime6        => 'st.freetime6',
        TicketFreeKey1         => 'st.freekey1',
        TicketFreeText1        => 'st.freetext1',
        TicketFreeKey2         => 'st.freekey2',
        TicketFreeText2        => 'st.freetext2',
        TicketFreeKey3         => 'st.freekey3',
        TicketFreeText3        => 'st.freetext3',
        TicketFreeKey4         => 'st.freekey4',
        TicketFreeText4        => 'st.freetext4',
        TicketFreeKey5         => 'st.freekey5',
        TicketFreeText5        => 'st.freetext5',
        TicketFreeKey6         => 'st.freekey6',
        TicketFreeText6        => 'st.freetext6',
        TicketFreeKey7         => 'st.freekey7',
        TicketFreeText7        => 'st.freetext7',
        TicketFreeKey8         => 'st.freekey8',
        TicketFreeText8        => 'st.freetext8',
        TicketFreeKey9         => 'st.freekey9',
        TicketFreeText9        => 'st.freetext9',
        TicketFreeKey10        => 'st.freekey10',
        TicketFreeText10       => 'st.freetext10',
        TicketFreeKey11        => 'st.freekey11',
        TicketFreeText11       => 'st.freetext11',
        TicketFreeKey12        => 'st.freekey12',
        TicketFreeText12       => 'st.freetext12',
        TicketFreeKey13        => 'st.freekey13',
        TicketFreeText13       => 'st.freetext13',
        TicketFreeKey14        => 'st.freekey14',
        TicketFreeText14       => 'st.freetext14',
        TicketFreeKey15        => 'st.freekey15',
        TicketFreeText15       => 'st.freetext15',
        TicketFreeKey16        => 'st.freekey16',
        TicketFreeText16       => 'st.freetext16',
    );

    # check required params
    if ( !$Param{UserID} && !$Param{CustomerUserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need UserID or CustomerUserID params for permission check!',
        );
        return;
    }

    # check types of given arguments
    ARGUMENT:
    for my $Argument (
        qw(
        Types TypeIDs CreatedTypes CreatedTypeIDs States StateIDs CreatedStates CreatedStateIDs StateTypeIDs
        Locks LockIDs OwnerIDs ResponsibleIDs CreatedUserIDs Queues QueueIDs CreatedQueues CreatedQueueIDs
        Priorities PriorityIDs CreatedPriorities CreatedPriorityIDs Services ServiceIDs SLAs SLAIDs WatchUserIDs
        )
        )
    {

        next ARGUMENT if !$Param{$Argument};
        next ARGUMENT if ref $Param{$Argument} eq 'ARRAY' && @{ $Param{$Argument} };

        # log error
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "The given param '$Argument' is invalid or an empty array reference!",
        );

        return;
    }

    # quote the array elements
    ARGUMENT:
    for my $Argument (
        qw(
        TypeIDs CreatedTypeIDs StateIDs CreatedStateIDs StateTypeIDs LockIDs OwnerIDs ResponsibleIDs CreatedUserIDs
        QueueIDs CreatedQueueIDs PriorityIDs CreatedPriorityIDs ServiceIDs SLAIDs WatchUserIDs
        )
        )
    {

        next ARGUMENT if !$Param{$Argument};

        # quote elements
        for my $Element ( @{ $Param{$Argument} } ) {
            my $ElementQuote = $Self->{DBObject}->Quote( $Element, 'Integer' );

            # log error
            if ( !defined $ElementQuote || $ElementQuote eq '' ) {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "The given param '$Element' in '$Argument' is invalid!",
                );
                return;
            }
        }
    }

    # check sort/order by options
    my @SortByArray;
    my @OrderByArray;
    if ( ref $SortBy eq 'ARRAY' ) {
        @SortByArray  = @{$SortBy};
        @OrderByArray = @{$OrderBy};
    }
    else {
        @SortByArray  = ($SortBy);
        @OrderByArray = ($OrderBy);
    }
    for my $Count ( 0 .. $#SortByArray ) {
        if ( !$SortOptions{ $SortByArray[$Count] } ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => 'Need valid SortBy (' . $SortByArray[$Count] . ')!',
            );
            return;
        }
        if ( $OrderByArray[$Count] ne 'Down' && $OrderByArray[$Count] ne 'Up' ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => 'Need valid OrderBy (' . $OrderByArray[$Count] . ')!',
            );
            return;
        }
    }

    # create sql
    my $SQL;
    if ( $Result eq 'COUNT' ) {
        $SQL = 'SELECT DISTINCT count(*)';
    }
    else {
        $SQL = 'SELECT DISTINCT st.id, st.tn';
        for my $SortBy (@SortByArray) {
            $SQL .= ', ' . $SortOptions{$SortBy};
        }
    }
    $SQL .= ' FROM ticket st, queue sq ';

    # sql, use also article table if needed
    my ( $ArticleSQL, $ArticleSQLExt ) = $Self->_ArticleIndexQuerySQL( Data => \%Param );
    $SQL .= $ArticleSQL;

    # use also history table if required
    my $SQLExt = $ArticleSQLExt;
    ARGUMENT:
    for my $Argument ( keys %Param ) {
        if ( $Argument =~ /^(Ticket(Close|Change)Time(Newer|Older)(Date|Minutes)|Created.+?)/ ) {
            $SQL    .= ', ticket_history th ';
            $SQLExt .= ' AND st.id = th.ticket_id';
            last ARGUMENT;
        }
    }
    if ( $Param{WatchUserIDs} ) {
        $SQL    .= ', ticket_watcher tw ';
        $SQLExt .= ' AND st.id = tw.ticket_id';
    }
    $SQLExt = ' WHERE sq.id = st.queue_id' . $SQLExt;

    # current type lookup
    if ( $Param{Types} ) {
        for my $Type ( @{ $Param{Types} } ) {

            # lookup type id
            my $TypeID = $Self->{TypeObject}->TypeLookup(
                Type => $Type,
            );
            return if !$TypeID;
            push @{ $Param{TypeIDs} }, $TypeID;
        }
    }

    # type ids
    if ( $Param{TypeIDs} ) {
        $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
            TableColumn => 'st.type_id',
            IDRef       => $Param{TypeIDs},
        );
    }

    # created types lookup
    if ( $Param{CreatedTypes} ) {
        for my $Type ( @{ $Param{CreatedTypes} } ) {

            # lookup type id
            my $TypeID = $Self->{TypeObject}->TypeLookup(
                Type => $Type,
            );
            return if !$TypeID;
            push @{ $Param{CreatedTypeIDs} }, $TypeID;
        }
    }

    # created type ids
    if ( $Param{CreatedTypeIDs} ) {

        # lookup history type id
        my $HistoryTypeID = $Self->HistoryTypeLookup(
            Type => 'NewTicket',
        );

        if ($HistoryTypeID) {

            # create sql part
            $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
                TableColumn => 'th.type_id',
                IDRef       => $Param{CreatedTypeIDs},
            );
            $SQLExt .= " AND th.history_type_id = $HistoryTypeID ";
        }
    }

    # current state lookup
    if ( $Param{States} ) {
        for my $State ( @{ $Param{States} } ) {

            # get state data
            my %StateData = $Self->{StateObject}->StateGet(
                Name => $State,
            );
            return if !%StateData;
            push @{ $Param{StateIDs} }, $StateData{ID};
        }
    }

    # state ids
    if ( $Param{StateIDs} ) {
        $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
            TableColumn => 'st.ticket_state_id',
            IDRef       => $Param{StateIDs},
        );
    }

    # created states lookup
    if ( $Param{CreatedStates} ) {
        for my $State ( @{ $Param{CreatedStates} } ) {

            # get state data
            my %StateData = $Self->{StateObject}->StateGet(
                Name => $State,
            );
            return if !%StateData;
            push @{ $Param{CreatedStateIDs} }, $StateData{ID};
        }
    }

    # created state ids
    if ( $Param{CreatedStateIDs} ) {

        # lookup history type id
        my $HistoryTypeID = $Self->HistoryTypeLookup(
            Type => 'NewTicket',
        );

        if ($HistoryTypeID) {

            # create sql part
            $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
                TableColumn => 'th.state_id',
                IDRef       => $Param{CreatedStateIDs},
            );
            $SQLExt .= " AND th.history_type_id = $HistoryTypeID ";
        }
    }

    # current ticket state type
    if ( $Param{StateType} && $Param{StateType} eq 'Open' ) {
        my @ViewableStateIDs = $Self->{StateObject}->StateGetStatesByType(
            Type   => 'Viewable',
            Result => 'ID',
        );
        $SQLExt .= " AND st.ticket_state_id IN ( ${\(join ', ', sort @ViewableStateIDs)} ) ";
    }
    elsif ( $Param{StateType} && $Param{StateType} eq 'Closed' ) {
        my @ViewableStateIDs = $Self->{StateObject}->StateGetStatesByType(
            Type   => 'Viewable',
            Result => 'ID',
        );
        $SQLExt .= " AND st.ticket_state_id NOT IN ( ${\(join ', ', sort @ViewableStateIDs)} ) ";
    }
    elsif ( $Param{StateType} ) {
        my @StateIDs = $Self->{StateObject}->StateGetStatesByType(
            StateType => $Param{StateType},
            Result    => 'ID',
        );
        $SQLExt .= " AND st.ticket_state_id IN ( ${\(join ', ', sort {$a <=> $b} @StateIDs)} ) ";
    }

    if ( $Param{StateTypeIDs} ) {
        my %StateTypeList = $Self->{StateObject}->StateTypeList(
            UserID => $Param{UserID} || 1,
        );
        my @StateTypes = map { $StateTypeList{$_} } @{ $Param{StateTypeIDs} };
        my @StateIDs = $Self->{StateObject}->StateGetStatesByType(
            StateType => \@StateTypes,
            Result    => 'ID',
        );
        $SQLExt .= " AND st.ticket_state_id IN ( ${\(join ', ', sort {$a <=> $b} @StateIDs)} ) ";
    }

    # current lock lookup
    if ( $Param{Locks} ) {
        for my $Lock ( @{ $Param{Locks} } ) {

            # lookup lock id
            my $LockID = $Self->{LockObject}->LockLookup(
                Lock => $Lock,
            );
            return if !$LockID;
            push @{ $Param{LockIDs} }, $LockID;
        }
    }

    # lock ids
    if ( $Param{LockIDs} ) {
        $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
            TableColumn => 'st.ticket_lock_id',
            IDRef       => $Param{LockIDs},
        );
    }

    # current owner user ids
    if ( $Param{OwnerIDs} ) {
        $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
            TableColumn => 'st.user_id',
            IDRef       => $Param{OwnerIDs},
        );
    }

    # current responsible user ids
    if ( $Param{ResponsibleIDs} ) {
        $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
            TableColumn => 'st.responsible_user_id',
            IDRef       => $Param{ResponsibleIDs},
        );
    }

    # created user ids
    if ( $Param{CreatedUserIDs} ) {

        # lookup history type id
        my $HistoryTypeID = $Self->HistoryTypeLookup(
            Type => 'NewTicket',
        );

        if ($HistoryTypeID) {

            # create sql part
            $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
                TableColumn => 'th.create_by',
                IDRef       => $Param{CreatedUserIDs},
            );
            $SQLExt .= " AND th.history_type_id = $HistoryTypeID ";
        }
    }

    # current queue lookup
    if ( $Param{Queues} ) {
        for my $Queue ( @{ $Param{Queues} } ) {

            # lookup queue id
            my $QueueID = $Self->{QueueObject}->QueueLookup(
                Queue => $Queue,
            );
            return if !$QueueID;
            push @{ $Param{QueueIDs} }, $QueueID;
        }
    }

    # current sub queue ids
    if ( $Param{UseSubQueues} && $Param{QueueIDs} ) {
        my @SubQueueIDs = ();
        my %Queues      = $Self->{QueueObject}->GetAllQueues();
        for my $QueueID ( @{ $Param{QueueIDs} } ) {
            my $Queue = $Self->{QueueObject}->QueueLookup( QueueID => $QueueID );
            for my $QueuesID ( keys %Queues ) {
                if ( $Queues{$QueuesID} =~ /^\Q$Queue\E::/i ) {
                    push @SubQueueIDs, $QueuesID;
                }
            }
        }
        push @{ $Param{QueueIDs} }, @SubQueueIDs;
    }

    # current queue ids
    if ( $Param{QueueIDs} ) {
        $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
            TableColumn => 'st.queue_id',
            IDRef       => $Param{QueueIDs},
        );
    }

    # created queue lookup
    if ( $Param{CreatedQueues} ) {
        for my $Queue ( @{ $Param{CreatedQueues} } ) {

            # lookup queue id
            my $QueueID = $Self->{QueueObject}->QueueLookup(
                Queue => $Queue,
            );
            return if !$QueueID;
            push @{ $Param{CreatedQueueIDs} }, $QueueID;
        }
    }

    # created queue ids
    if ( $Param{CreatedQueueIDs} ) {

        # lookup history type id
        my $HistoryTypeID = $Self->HistoryTypeLookup(
            Type => 'NewTicket',
        );

        if ($HistoryTypeID) {

            # create sql part
            $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
                TableColumn => 'th.queue_id',
                IDRef       => $Param{CreatedQueueIDs},
            );
            $SQLExt .= " AND th.history_type_id = $HistoryTypeID ";
        }
    }

    my @GroupIDs;

    # user groups
    if ( $Param{UserID} && $Param{UserID} != 1 ) {

        # get users groups
        @GroupIDs = $Self->{GroupObject}->GroupMemberList(
            UserID => $Param{UserID},
            Type   => $Param{Permission} || 'ro',
            Result => 'ID',
            Cached => 1,
        );

        # return if we have no permissions
        return if !@GroupIDs;
    }

    # customer groups
    elsif ( $Param{CustomerUserID} ) {
        @GroupIDs = $Self->{CustomerGroupObject}->GroupMemberList(
            UserID => $Param{CustomerUserID},
            Type   => $Param{Permission} || 'ro',
            Result => 'ID',
            Cached => 1,
        );

        # return if we have no permissions
        return if !@GroupIDs;

        # get all customer ids
        $SQLExt .= ' AND (';
        my @CustomerIDs = $Self->{CustomerUserObject}->CustomerIDs(
            User => $Param{CustomerUserID},
        );
        if (@CustomerIDs) {
            $SQLExt .= 'LOWER(st.customer_id) IN (';
            my $Exists = 0;
            for (@CustomerIDs) {
                if ($Exists) {
                    $SQLExt .= ', ';
                }
                else {
                    $Exists = 1;
                }
                $SQLExt .= "LOWER('" . $Self->{DBObject}->Quote($_) . "')";
            }
            $SQLExt .= ') OR ';
        }

        # get all own tickets
        my $CustomerUserIDQuoted = $Self->{DBObject}->Quote( $Param{CustomerUserID} );
        $SQLExt .= "st.customer_user_id = '$CustomerUserIDQuoted') ";
    }

    # add group ids to sql string
    if (@GroupIDs) {
        $SQLExt .= " AND sq.group_id IN (${\(join ', ' , sort {$a <=> $b} @GroupIDs)}) ";
    }

    # current priority lookup
    if ( $Param{Priorities} ) {
        for my $Priority ( @{ $Param{Priorities} } ) {

            # lookup priority id
            my $PriorityID = $Self->{PriorityObject}->PriorityLookup(
                Priority => $Priority,
            );
            return if !$PriorityID;
            push @{ $Param{PriorityIDs} }, $PriorityID;
        }
    }

    # priority ids
    if ( $Param{PriorityIDs} ) {
        $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
            TableColumn => 'st.ticket_priority_id',
            IDRef       => $Param{PriorityIDs},
        );
    }

    # created priority lookup
    if ( $Param{CreatedPriorities} ) {
        for my $Priority ( @{ $Param{CreatedPriorities} } ) {

            # lookup priority id
            my $PriorityID = $Self->{PriorityObject}->PriorityLookup(
                Priority => $Priority,
            );
            return if !$PriorityID;
            push @{ $Param{CreatedPriorityIDs} }, $PriorityID;
        }
    }

    # created priority ids
    if ( $Param{CreatedPriorityIDs} ) {

        # lookup history type id
        my $HistoryTypeID = $Self->HistoryTypeLookup(
            Type => 'NewTicket',
        );

        if ($HistoryTypeID) {

            # create sql part
            $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
                TableColumn => 'th.priority_id',
                IDRef       => $Param{CreatedPriorityIDs},
            );
            $SQLExt .= " AND th.history_type_id = $HistoryTypeID ";
        }
    }

    # current service lookup
    if ( $Param{Services} ) {
        for my $Service ( @{ $Param{Services} } ) {

            # lookup service id
            my $ServiceID = $Self->{ServiceObject}->ServiceLookup(
                Name => $Service,
            );
            return if !$ServiceID;
            push @{ $Param{ServiceIDs} }, $ServiceID;
        }
    }

    # service ids
    if ( $Param{ServiceIDs} ) {
        $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
            TableColumn => 'st.service_id',
            IDRef       => $Param{ServiceIDs},
        );
    }

    # current sla lookup
    if ( $Param{SLAs} ) {
        for my $SLA ( @{ $Param{SLAs} } ) {

            # lookup sla id
            my $SLAID = $Self->{SLAObject}->SLALookup(
                Name => $SLA,
            );
            return if !$SLAID;
            push @{ $Param{SLAIDs} }, $SLAID;
        }
    }

    # sla ids
    if ( $Param{SLAIDs} ) {
        $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
            TableColumn => 'st.sla_id',
            IDRef       => $Param{SLAIDs},
        );
    }

    # watch user ids
    if ( $Param{WatchUserIDs} ) {
        $SQLExt .= $Self->_TicketSearchSqlAndStringCreate(
            TableColumn => 'tw.user_id',
            IDRef       => $Param{WatchUserIDs},
        );
    }

    # other ticket stuff
    my %FieldSQLMap = (
        TicketNumber      => 'st.tn',
        Title             => 'st.title',
        CustomerID        => 'st.customer_id',
        CustomerUserLogin => 'st.customer_user_id',
    );
    for my $Key ( sort keys %FieldSQLMap ) {

        # next if attribute is not used
        next if !defined $Param{$Key};

        # if it's no ref, put it to array ref
        if ( ref $Param{$Key} eq '' ) {
            $Param{$Key} = [ $Param{$Key} ];
        }

        # proccess array ref
        my $Used = 0;
        for my $Value ( @{ $Param{$Key} } ) {

            # next if no search attribute is given
            next if !$Value;

            # replace wild card search
            $Value =~ s/\*/%/gi;

            # check search attribute, we do not need to search for *
            next if $Value =~ /^\%{1,3}$/;

            if ( !$Used ) {
                $SQLExt .= ' AND (';
                $Used = 1;
            }
            else {
                $SQLExt .= ' OR ';
            }

            # check if search condition extention is used
            if ( $Param{ConditionInline} && $Value =~ /(&&|\|\||\!|\+|AND|OR)/ ) {
                $SQLExt .= $Self->{DBObject}->QueryCondition(
                    Key   => $FieldSQLMap{$Key},
                    Value => $Value,
                );
            }
            elsif ( $Value !~ /%/ ) {
                $SQLExt .= " LOWER($FieldSQLMap{$Key}) = LOWER('"
                    . $Self->{DBObject}->Quote($Value) . "')";
            }
            else {
                $SQLExt .= " LOWER($FieldSQLMap{$Key}) LIKE LOWER('"
                    . $Self->{DBObject}->Quote( $Value, 'Like' ) . "')";
            }
        }
        if ($Used) {
            $SQLExt .= ')';
        }
    }

    # search article attributes
    my $ArticleIndexSQLExt = $Self->_ArticleIndexQuerySQLExt( Data => \%Param );
    $SQLExt .= $ArticleIndexSQLExt;

    # ticket free text
    for ( 1 .. 16 ) {
        if ( $Param{"TicketFreeKey$_"} && ref $Param{"TicketFreeKey$_"} eq '' ) {
            $Param{"TicketFreeKey$_"} =~ s/\*/%/gi;

            # check search attribute, we do not need to search for *
            next if $Param{"TicketFreeKey$_"} =~ /^\%{1,3}$/;

            $SQLExt .= " AND LOWER(st.freekey$_) LIKE LOWER('"
                . $Self->{DBObject}->Quote( $Param{"TicketFreeKey$_"}, 'Like' ) . "')";
        }
        elsif ( $Param{"TicketFreeKey$_"} && ref $Param{"TicketFreeKey$_"} eq 'ARRAY' ) {
            my $SQLExtSub = ' AND (';
            my $Counter   = 0;
            for my $Key ( @{ $Param{"TicketFreeKey$_"} } ) {
                if ( defined $Key && $Key ne '' ) {
                    $Key =~ s/\*/%/gi;

                    # check search attribute, we do not need to search for *
                    next if $Key =~ /^\%{1,3}$/;

                    $SQLExtSub .= ' OR ' if ($Counter);
                    $SQLExtSub .= " LOWER(st.freekey$_) LIKE LOWER('"
                        . $Self->{DBObject}->Quote( $Key, 'Like' ) . "')";
                    $Counter++;
                }
            }
            $SQLExtSub .= ')';
            if ($Counter) {
                $SQLExt .= $SQLExtSub;
            }
        }
    }
    for ( 1 .. 16 ) {
        if ( $Param{"TicketFreeText$_"} && ref $Param{"TicketFreeText$_"} eq '' ) {
            $Param{"TicketFreeText$_"} =~ s/\*/%/gi;

            # check search attribute, we do not need to search for *
            next if $Param{"TicketFreeText$_"} =~ /^\%{1,3}$/;

            $SQLExt .= " AND LOWER(st.freetext$_) LIKE LOWER('"
                . $Self->{DBObject}->Quote( $Param{"TicketFreeText$_"}, 'Like' ) . "')";
        }
        elsif ( $Param{"TicketFreeText$_"} && ref $Param{"TicketFreeText$_"} eq 'ARRAY' ) {
            my $SQLExtSub = ' AND (';
            my $Counter   = 0;
            for my $Text ( @{ $Param{"TicketFreeText$_"} } ) {
                if ( defined $Text && $Text ne '' ) {
                    $Text =~ s/\*/%/gi;

                    # check search attribute, we do not need to search for *
                    next if $Text =~ /^\%{1,3}$/;

                    $SQLExtSub .= ' OR ' if ($Counter);
                    $SQLExtSub .= " LOWER(st.freetext$_) LIKE LOWER('"
                        . $Self->{DBObject}->Quote( $Text, 'Like' ) . "')";
                    $Counter++;
                }
            }
            $SQLExtSub .= ')';
            if ($Counter) {
                $SQLExt .= $SQLExtSub;
            }
        }
    }
    for ( 1 .. 6 ) {

        # get free time older than xxxx-xx-xx xx:xx date
        if ( $Param{ 'TicketFreeTime' . $_ . 'OlderDate' } ) {

            # check time format
            if (
                $Param{ 'TicketFreeTime' . $_ . 'OlderDate' }
                !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
                )
            {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "No valid time format '"
                        . $Param{ 'TicketFreeTime' . $_ . 'OlderDate' } . "'!",
                );
                return;
            }
            $SQLExt .= " AND st.freetime$_ <= '"
                . $Self->{DBObject}->Quote( $Param{ 'TicketFreeTime' . $_ . 'OlderDate' } )
                . "'";
        }

        # get free time newer than xxxx-xx-xx xx:xx date
        if ( $Param{ 'TicketFreeTime' . $_ . 'NewerDate' } ) {
            if (
                $Param{ 'TicketFreeTime' . $_ . 'NewerDate' }
                !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
                )
            {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "No valid time format '"
                        . $Param{ 'TicketFreeTime' . $_ . 'NewerDate' } . "'!",
                );
                return;
            }
            $SQLExt .= " AND st.freetime$_ >= '"
                . $Self->{DBObject}->Quote( $Param{ 'TicketFreeTime' . $_ . 'NewerDate' } )
                . "'";
        }
    }

    # get articles created older/newer than x minutes
    my %ArticleTime = (
        ArticleCreateTime => 'art.create_time',
    );
    for my $Key ( keys %ArticleTime ) {

        # get articles created older than x minutes
        if ( defined $Param{ $Key . 'OlderMinutes' } ) {

            $Param{ $Key . 'OlderMinutes' } ||= 0;

            my $Time = $Self->{TimeObject}->SystemTime2TimeStamp(
                SystemTime => $Self->{TimeObject}->SystemTime()
                    - ( $Param{ $Key . 'OlderMinutes' } * 60 ),
            );

            $SQLExt .= " AND $ArticleTime{$Key} <= '$Time'";
        }

        # get articles created newer than x minutes
        if ( defined $Param{ $Key . 'NewerMinutes' } ) {

            $Param{ $Key . 'NewerMinutes' } ||= 0;

            my $Time = $Self->{TimeObject}->SystemTime2TimeStamp(
                SystemTime => $Self->{TimeObject}->SystemTime()
                    - ( $Param{ $Key . 'NewerMinutes' } * 60 ),
            );

            $SQLExt .= " AND $ArticleTime{$Key} >= '$Time'";
        }

        # get articles created newer than xxxx-xx-xx xx:xx date
        if ( $Param{ $Key . 'OlderDate' } ) {
            if (
                $Param{ $Key . 'OlderDate' }
                !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
                )
            {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "No valid time format '" . $Param{ $Key . 'OlderDate' } . "'!",
                );
                return;
            }

            $SQLExt .= " AND $ArticleTime{$Key} <= '" . $Param{ $Key . 'OlderDate' } . "'";
        }

        # get articles created newer than xxxx-xx-xx xx:xx date
        if ( $Param{ $Key . 'NewerDate' } ) {
            if (
                $Param{ $Key . 'NewerDate' }
                !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
                )
            {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "No valid time format '" . $Param{ $Key . 'NewerDate' } . "'!",
                );
                return;
            }

            $SQLExt .= " AND $ArticleTime{$Key} >= '" . $Param{ $Key . 'NewerDate' } . "'";
        }
    }

    # get tickets created/escalated older than x minutes
    my %TicketTime = (
        TicketCreateTime             => 'st.create_time_unix',
        TicketEscalationTime         => 'st.escalation_time',
        TicketEscalationUpdateTime   => 'st.escalation_update_time',
        TicketEscalationResponseTime => 'st.escalation_response_time',
        TicketEscalationSolutionTime => 'st.escalation_solution_time',
    );
    for my $Key ( keys %TicketTime ) {

        # get tickets created older than x minutes
        if ( defined $Param{ $Key . 'OlderMinutes' } ) {

            $Param{ $Key . 'OlderMinutes' } ||= 0;

            # exclude tickets with no escalation
            if ( $Key =~ m{ \A TicketEscalation }xms ) {
                $SQLExt .= " AND $TicketTime{$Key} != 0";
            }

            my $Time = $Self->{TimeObject}->SystemTime();
            $Time -= ( $Param{ $Key . 'OlderMinutes' } * 60 );

            $SQLExt .= " AND $TicketTime{$Key} <= $Time";
        }

        # get tickets created newer than x minutes
        if ( defined $Param{ $Key . 'NewerMinutes' } ) {

            $Param{ $Key . 'NewerMinutes' } ||= 0;

            # exclude tickets with no escalation
            if ( $Key =~ m{ \A TicketEscalation }xms ) {
                $SQLExt .= " AND $TicketTime{$Key} != 0";
            }

            my $Time = $Self->{TimeObject}->SystemTime();
            $Time -= ( $Param{ $Key . 'NewerMinutes' } * 60 );

            $SQLExt .= " AND $TicketTime{$Key} >= $Time";
        }
    }

    # get tickets created/escalated older than xxxx-xx-xx xx:xx date
    for my $Key ( keys %TicketTime ) {
        if ( $Param{ $Key . 'OlderDate' } ) {

            # check time format
            if (
                $Param{ $Key . 'OlderDate' }
                !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
                )
            {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "No valid time format '" . $Param{ $Key . 'OlderDate' } . "'!",
                );
                return;
            }

            # exclude tickets with no escalation
            if ( $Key =~ m{ \A TicketEscalation }xms ) {
                $SQLExt .= " AND $TicketTime{$Key} != 0";
            }
            my $Time = $Self->{TimeObject}->TimeStamp2SystemTime(
                String => $Param{ $Key . 'OlderDate' },
            );
            $SQLExt .= " AND $TicketTime{$Key} <= $Time";
        }

        # get tickets created newer than xxxx-xx-xx xx:xx date
        if ( $Param{ $Key . 'NewerDate' } ) {
            if (
                $Param{ $Key . 'NewerDate' }
                !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
                )
            {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "No valid time format '" . $Param{ $Key . 'NewerDate' } . "'!",
                );
                return;
            }

            # exclude tickets with no escalation
            if ( $Key =~ m{ \A TicketEscalation }xms ) {
                $SQLExt .= " AND $TicketTime{$Key} != 0";
            }
            my $Time = $Self->{TimeObject}->TimeStamp2SystemTime(
                String => $Param{ $Key . 'NewerDate' },
            );
            $SQLExt .= " AND $TicketTime{$Key} >= $Time";
        }
    }

    # get tickets changed older than x minutes
    if ( defined $Param{TicketChangeTimeOlderMinutes} ) {

        $Param{TicketChangeTimeOlderMinutes} ||= 0;

        my $TimeStamp = $Self->{TimeObject}->SystemTime();
        $TimeStamp -= ( $Param{TicketChangeTimeOlderMinutes} * 60 );

        $Param{TicketChangeTimeOlderDate} = $Self->{TimeObject}->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets changed newer than x minutes
    if ( defined $Param{TicketChangeTimeNewerMinutes} ) {

        $Param{TicketChangeTimeNewerMinutes} ||= 0;

        my $TimeStamp = $Self->{TimeObject}->SystemTime();
        $TimeStamp -= ( $Param{TicketChangeTimeNewerMinutes} * 60 );

        $Param{TicketChangeTimeNewerDate} = $Self->{TimeObject}->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets changed older than xxxx-xx-xx xx:xx date
    if ( $Param{TicketChangeTimeOlderDate} ) {

        # check time format
        if (
            $Param{TicketChangeTimeOlderDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No valid time format '$Param{TicketChangeTimeOlderDate}'!",
            );
            return;
        }

        $SQLExt .= " AND th.create_time <= '"
            . $Self->{DBObject}->Quote( $Param{TicketChangeTimeOlderDate} ) . "'";
    }

    # get tickets changed newer than xxxx-xx-xx xx:xx date
    if ( $Param{TicketChangeTimeNewerDate} ) {
        if (
            $Param{TicketChangeTimeNewerDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No valid time format '$Param{TicketChangeTimeNewerDate}'!",
            );
            return;
        }

        $SQLExt .= " AND th.create_time >= '"
            . $Self->{DBObject}->Quote( $Param{TicketChangeTimeNewerDate} ) . "'";
    }

    # get tickets closed older than x minutes
    if ( defined $Param{TicketCloseTimeOlderMinutes} ) {

        $Param{TicketCloseTimeOlderMinutes} ||= 0;

        my $TimeStamp = $Self->{TimeObject}->SystemTime();
        $TimeStamp -= ( $Param{TicketCloseTimeOlderMinutes} * 60 );

        $Param{TicketCloseTimeOlderDate} = $Self->{TimeObject}->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets closed newer than x minutes
    if ( defined $Param{TicketCloseTimeNewerMinutes} ) {

        $Param{TicketCloseTimeNewerMinutes} ||= 0;

        my $TimeStamp = $Self->{TimeObject}->SystemTime();
        $TimeStamp -= ( $Param{TicketCloseTimeNewerMinutes} * 60 );

        $Param{TicketCloseTimeNewerDate} = $Self->{TimeObject}->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets closed older than xxxx-xx-xx xx:xx date
    if ( $Param{TicketCloseTimeOlderDate} ) {

        # check time format
        if (
            $Param{TicketCloseTimeOlderDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No valid time format '$Param{TicketCloseTimeOlderDate}'!",
            );
            return;
        }

        # get close state ids
        my @List = $Self->{StateObject}->StateGetStatesByType(
            StateType => ['closed'],
            Result    => 'ID',
        );
        my @StateID = ( $Self->HistoryTypeLookup( Type => 'NewTicket' ) );
        push( @StateID, $Self->HistoryTypeLookup( Type => 'StateUpdate' ) );
        if (@StateID) {
            $SQLExt .= " AND th.history_type_id IN  (${\(join ', ', sort @StateID)}) AND "
                . " th.state_id IN (${\(join ', ', sort @List)}) AND "
                . "th.create_time <= '"
                . $Self->{DBObject}->Quote( $Param{TicketCloseTimeOlderDate} ) . "'";
        }
    }

    # get tickets closed newer than xxxx-xx-xx xx:xx date
    if ( $Param{TicketCloseTimeNewerDate} ) {
        if (
            $Param{TicketCloseTimeNewerDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No valid time format '$Param{TicketCloseTimeNewerDate}'!",
            );
            return;
        }

        # get close state ids
        my @List = $Self->{StateObject}->StateGetStatesByType(
            StateType => ['closed'],
            Result    => 'ID',
        );
        my @StateID = ( $Self->HistoryTypeLookup( Type => 'NewTicket' ) );
        push( @StateID, $Self->HistoryTypeLookup( Type => 'StateUpdate' ) );
        if (@StateID) {
            $SQLExt .= " AND th.history_type_id IN  (${\(join ', ', sort @StateID)}) AND "
                . " th.state_id IN (${\(join ', ', sort @List)}) AND "
                . " th.create_time >= '"
                . $Self->{DBObject}->Quote( $Param{TicketCloseTimeNewerDate} ) . "'";
        }
    }

    # check if only pending states are used
    if (
        defined $Param{TicketPendingTimeOlderMinutes}
        || defined $Param{TicketPendingTimeNewerMinutes}
        || $Param{TicketPendingTimeOlderDate}
        || $Param{TicketPendingTimeNewerDate}
        )
    {

        # get close state ids
        my @List = $Self->{StateObject}->StateGetStatesByType(
            StateType => [ 'pending reminder', 'pending auto' ],
            Result => 'ID',
        );
        if (@List) {
            $SQLExt .= " AND st.ticket_state_id IN (${\(join ', ', sort @List)}) ";
        }
    }

    # get tickets pending older than x minutes
    if ( defined $Param{TicketPendingTimeOlderMinutes} ) {

        $Param{TicketPendingTimeOlderMinutes} ||= 0;

        my $TimeStamp = $Self->{TimeObject}->SystemTime();
        $TimeStamp -= ( $Param{TicketPendingTimeOlderMinutes} * 60 );

        $Param{TicketPendingTimeOlderDate} = $Self->{TimeObject}->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets pending newer than x minutes
    if ( defined $Param{TicketPendingTimeNewerMinutes} ) {

        $Param{TicketPendingTimeNewerMinutes} ||= 0;

        my $TimeStamp = $Self->{TimeObject}->SystemTime();
        $TimeStamp -= ( $Param{TicketPendingTimeNewerMinutes} * 60 );

        $Param{TicketPendingTimeNewerDate} = $Self->{TimeObject}->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get pending tickets older than xxxx-xx-xx xx:xx date
    if ( $Param{TicketPendingTimeOlderDate} ) {

        # check time format
        if (
            $Param{TicketPendingTimeOlderDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No valid time format '$Param{TicketPendingTimeOlderDate}'!",
            );
            return;
        }
        my $TimeStamp = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Param{TicketPendingTimeOlderDate},
        );
        $SQLExt .= " AND st.until_time <= $TimeStamp";
    }

    # get pending tickets newer than xxxx-xx-xx xx:xx date
    if ( $Param{TicketPendingTimeNewerDate} ) {
        if (
            $Param{TicketPendingTimeNewerDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No valid time format '$Param{TicketPendingTimeNewerDate}'!",
            );
            return;
        }
        my $TimeStamp = $Self->{TimeObject}->TimeStamp2SystemTime(
            String => $Param{TicketPendingTimeNewerDate},
        );
        $SQLExt .= " AND st.until_time >= $TimeStamp";
    }

    # database query for sort/order by option
    if ( $Result ne 'COUNT' ) {
        $SQLExt .= ' ORDER BY';
        for my $Count ( 0 .. $#SortByArray ) {
            if ( $Count > 0 ) {
                $SQLExt .= ',';
            }
            $SQLExt .= ' ' . $SortOptions{ $SortByArray[$Count] };
            if ( $OrderByArray[$Count] eq 'Up' ) {
                $SQLExt .= ' ASC';
            }
            else {
                $SQLExt .= ' DESC';
            }
        }
    }

    # check cache
    my $CacheObject;
    if ( ( $ArticleIndexSQLExt && $Param{FullTextIndex} ) || $Param{CacheTTL} ) {
        $CacheObject = Kernel::System::Cache->new( %{$Self} );
        my $CacheData = $CacheObject->Get(
            Type => 'TicketSearch',
            Key  => $SQL . $SQLExt . $Result . $Limit,
        );
        if ($CacheData) {
            if ( ref $CacheData eq 'HASH' ) {
                return %{$CacheData};
            }
            elsif ( ref $CacheData eq 'ARRAY' ) {
                return @{$CacheData};
            }
            elsif ( ref $CacheData eq '' ) {
                return $CacheData;
            }
            else {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => 'Invalid ref ' . ref($CacheData) . '!'
                );
                return;
            }
        }
    }

    # database query
    my %Tickets;
    my @TicketIDs;
    my $Count;
    return if !$Self->{DBObject}->Prepare( SQL => $SQL . $SQLExt, Limit => $Limit );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Count = $Row[0];
        $Tickets{ $Row[0] } = $Row[1];
        push @TicketIDs, $Row[0];
    }
    if ( $Result eq 'COUNT' ) {

        # fill cache
        if ($CacheObject) {
            $CacheObject->Set(
                Type  => 'TicketSearch',
                Key   => $SQL . $SQLExt . $Result . $Limit,
                Value => $Count,
                TTL   => $Param{CacheTTL} || 60 * 4,
            );
        }
        return $Count;
    }
    elsif ( $Result eq 'HASH' ) {

        # fill cache
        if ($CacheObject) {
            $CacheObject->Set(
                Type  => 'TicketSearch',
                Key   => $SQL . $SQLExt . $Result . $Limit,
                Value => \%Tickets,
                TTL   => $Param{CacheTTL} || 60 * 4,
            );
        }
        return %Tickets;
    }
    else {

        # fill cache
        if ($CacheObject) {

            $CacheObject->Set(
                Type  => 'TicketSearch',
                Key   => $SQL . $SQLExt . $Result . $Limit,
                Value => \@TicketIDs,
                TTL   => $Param{CacheTTL} || 60 * 4,
            );
        }
        return @TicketIDs;
    }
}

#=item _TicketSearchSqlAndStringCreate()
#
#internal function to create a sql and string
#
#    my $SQLPart = $TicketObject->_TicketSearchSqlAndStringCreate(
#        TableColumn => '',
#        IDRef       => $ArrayRef,
#    )
#
#=cut

sub _TicketSearchSqlAndStringCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TableColumn IDRef)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # sort ids to cache the SQL query
    my @SortedIDs = sort { $a <=> $b } @{ $Param{IDRef} };

    # create the id string
    my $TypeIDString = join q{, }, @SortedIDs;

    # create the sql part
    my $SQL = " AND $Param{TableColumn} IN ($TypeIDString)";

    return $SQL;
}

=item LockIsTicketLocked()

check if a ticket is locked or not

    if ($TicketObject->LockIsTicketLocked(TicketID => 123)) {
        print "Ticket not locked!\n";
    }
    else {
        print "Ticket is not locked!\n";
    }

=cut

sub LockIsTicketLocked {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{TicketID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need TicketID!' );
        return;
    }

    my %Ticket = $Self->TicketGet(%Param);

    # check lock state
    if ( $Ticket{Lock} =~ /^lock$/i ) {
        return 1;
    }
    return;
}

=item LockSet()

to set a ticket lock or unlock

    $TicketObject->LockSet(
        Lock     => 'lock',
        TicketID => 123,
        UserID   => 123,
    );

    $TicketObject->LockSet(
        LockID   => 1,
        TicketID => 123,
        UserID   => 123,
    );

    Optional attribute:
    SendNoNotification, disable or enable agent and customer notification for this
    action. Otherwise a notification will be send to agent and cusomer.

    For example:

        SendNoNotification => 0, # optional 1|0 (send no agent and customer notification)

=cut

sub LockSet {
    my ( $Self, %Param ) = @_;

    # lookup!
    if ( !$Param{LockID} && $Param{Lock} ) {
        $Param{LockID} = $Self->{LockObject}->LockLookup( Lock => $Param{Lock} );
    }
    if ( $Param{LockID} && !$Param{Lock} ) {
        $Param{Lock} = $Self->{LockObject}->LockLookup( LockID => $Param{LockID} );
    }

    # check needed stuff
    for (qw(TicketID UserID LockID Lock)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    if ( !$Param{Lock} && !$Param{LockID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need LockID or Lock!' );
        return;
    }

    # check if update is needed
    my %Ticket = $Self->TicketGet(%Param);
    return 1 if $Ticket{Lock} eq $Param{Lock};

    # db update
    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket SET ticket_lock_id = ?, '
            . ' change_time = current_timestamp, change_by = ? WHERE id = ?',
        Bind => [ \$Param{LockID}, \$Param{UserID}, \$Param{TicketID} ],
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # add history
    my $HistoryType = '';
    if ( $Param{Lock} =~ /^unlock$/i ) {
        $HistoryType = 'Unlock';
    }
    elsif ( $Param{Lock} =~ /^lock$/i ) {
        $HistoryType = 'Lock';
    }
    else {
        $HistoryType = 'Misc';
    }
    if ($HistoryType) {
        $Self->HistoryAdd(
            TicketID     => $Param{TicketID},
            CreateUserID => $Param{UserID},
            HistoryType  => $HistoryType,
            Name         => "\%\%$Param{Lock}",
        );
    }

    # set unlock time it event is 'lock'
    if ( $Param{Lock} eq 'lock' ) {
        $Self->TicketUnlockTimeoutUpdate(
            UnlockTimeout => $Self->{TimeObject}->SystemTime(),
            TicketID      => $Param{TicketID},
            UserID        => $Param{UserID},
        );
    }

    # send unlock notify
    if ( $Param{Lock} =~ /^unlock$/i ) {
        my %Ticket = $Self->TicketGet(%Param);

        # check if the current user is the current owner, if not send a notify
        my $To = '';
        my $Notification = defined $Param{Notification} ? $Param{Notification} : 1;
        if (
            !$Param{SendNoNotification}
            && $Ticket{OwnerID} ne $Param{UserID}
            && $Notification
            )
        {

            # get user data of owner
            my %Preferences = $Self->{UserObject}->GetUserData(
                UserID => $Ticket{OwnerID},
                Valid  => 1,
            );

            # send
            if ( $Preferences{UserSendLockTimeoutNotification} ) {
                $Self->SendAgentNotification(
                    Type                  => 'LockTimeout',
                    RecipientID           => $Ticket{OwnerID},
                    CustomerMessageParams => {},
                    TicketID              => $Param{TicketID},
                    UserID                => $Param{UserID},
                );
            }
        }
    }

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketLockUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item StateSet()

to set a ticket state

    $TicketObject->StateSet(
        State    => 'open',
        TicketID => 123,
        UserID   => 123,
    );

    $TicketObject->StateSet(
        StateID  => 3,
        TicketID => 123,
        UserID   => 123,
    );

    Optional attribute:
    SendNoNotification, disable or enable agent and customer notification for this
    action. Otherwise a notification will be send to agent and cusomer.

    For example:

        SendNoNotification => 0, # optional 1|0 (send no agent and customer notification)

=cut

sub StateSet {
    my ( $Self, %Param ) = @_;

    my %State = ();
    my $ArticleID = $Param{ArticleID} || '';

    # check needed stuff
    for (qw(TicketID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    if ( !$Param{State} && !$Param{StateID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need StateID or State!' );
        return;
    }

    # state id lookup
    if ( !$Param{StateID} ) {
        %State = $Self->{StateObject}->StateGet( Name => $Param{State} );
    }

    # state lookup
    if ( !$Param{State} ) {
        %State = $Self->{StateObject}->StateGet( ID => $Param{StateID} );
    }
    if ( !%State ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need StateID or State!' );
        return;
    }

    # check if update is needed
    my %Ticket = $Self->TicketGet( TicketID => $Param{TicketID} );
    if ( $State{Name} eq $Ticket{State} ) {

        # update is not needed
        return 1;
    }

    # permission check
    my %StateList = $Self->StateList(%Param);
    if ( !$StateList{ $State{ID} } ) {
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "Permission denied on TicketID: $Param{TicketID} / StateID: $State{ID}!",
        );
        return;
    }

    # db update
    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket SET ticket_state_id = ?, '
            . ' change_time = current_timestamp, change_by = ? WHERE id = ?',
        Bind => [ \$State{ID}, \$Param{UserID}, \$Param{TicketID} ],
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # add history
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        ArticleID    => $ArticleID,
        QueueID      => $Ticket{QueueID},
        Name         => "\%\%$Ticket{State}\%\%$State{Name}\%\%",
        HistoryType  => 'StateUpdate',
        CreateUserID => $Param{UserID},
    );

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketStateUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item StateList()

to get the state list for a ticket (depends on workflow, if configured)

    my %States = $TicketObject->StateList(
        TicketID => 123,
        UserID   => 123,
    );

    my %States = $TicketObject->StateList(
        QueueID => 123,
        UserID  => 123,
    );

    my %States = $TicketObject->StateList(
        TicketID => 123,
        Type     => 'open',
        UserID   => 123,
    );

=cut

sub StateList {
    my ( $Self, %Param ) = @_;

    my %States = ();

    # check needed stuff
    if ( !$Param{UserID} && !$Param{CustomerUserID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need UserID or CustomerUserID!' );
        return;
    }

    # check needed stuff
    if ( !$Param{QueueID} && !$Param{TicketID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need QueueID, TicketID!' );
        return;
    }

    # get states by type
    if ( $Param{Type} ) {
        %States = $Self->{StateObject}->StateGetStatesByType(
            Type   => $Param{Type},
            Result => 'HASH',
        );
    }
    elsif ( $Param{Action} ) {
        if (
            ref $Self->{ConfigObject}->Get("Ticket::Frontend::$Param{Action}")->{StateType} ne
            'ARRAY'
            )
        {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need config for Ticket::Frontend::$Param{Action}->StateType!"
            );
            return;
        }
        my @StateType
            = @{ $Self->{ConfigObject}->Get("Ticket::Frontend::$Param{Action}")->{StateType} };
        %States = $Self->{StateObject}->StateGetStatesByType(
            StateType => \@StateType,
            Result    => 'HASH',
        );
    }

    # get whole states list
    else {
        %States = $Self->{StateObject}->StateList( UserID => $Param{UserID}, );
    }

    # workflow
    my $ACL = $Self->TicketAcl(
        %Param,
        ReturnType    => 'Ticket',
        ReturnSubType => 'State',
        Data          => \%States,
    );
    if ($ACL) {
        return $Self->TicketAclData();
    }
    return %States;
}

=item OwnerCheck()

to get the ticket owner

    my ($OwnerID, $Owner) = $TicketObject->OwnerCheck(
        TicketID => 123,
    );

or for access control

    my $AccessOk = $TicketObject->OwnerCheck(
        TicketID => 123,
        OwnerID  => 321,
    );

=cut

sub OwnerCheck {
    my ( $Self, %Param ) = @_;

    my $SQL = '';

    # check needed stuff
    if ( !$Param{TicketID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need TicketID!' );
        return;
    }

    # db query
    if ( $Param{OwnerID} ) {

        # create cache key
        my $CacheKey = $Param{TicketID} . '::' . $Param{OwnerID};

        # check cache
        if ( defined $Self->{OwnerCheck}->{$CacheKey} ) {
            return   if !$Self->{OwnerCheck}->{$CacheKey};
            return 1 if $Self->{OwnerCheck}->{$CacheKey};
        }

        # check if user has access
        return if !$Self->{DBObject}->Prepare(
            SQL => 'SELECT user_id FROM ticket WHERE '
                . ' id = ? AND (user_id = ? OR responsible_user_id = ?)',
            Bind => [ \$Param{TicketID}, \$Param{OwnerID}, \$Param{OwnerID}, ],
        );
        my $Access = 0;
        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            $Access = 1;
        }

        # fill cache
        $Self->{OwnerCheck}->{$CacheKey} = $Access;
        return   if !$Access;
        return 1 if $Access;
    }

    # search for owner_id and owner
    return if !$Self->{DBObject}->Prepare(
        SQL => "SELECT st.user_id, su.$Self->{ConfigObject}->{DatabaseUserTableUser} "
            . " FROM ticket st, $Self->{ConfigObject}->{DatabaseUserTable} su "
            . " WHERE st.id = ? AND "
            . " st.user_id = su.$Self->{ConfigObject}->{DatabaseUserTableUserID}",
        Bind => [ \$Param{TicketID}, ],
    );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Param{SearchUserID} = $Row[0];
        $Param{SearchUser}   = $Row[1];
    }

    # return if no owner as been found
    return if !$Param{SearchUserID};

    # return owner id and owner
    return $Param{SearchUserID}, $Param{SearchUser};
}

=item OwnerSet()

to set the ticket owner (notification to the new owner will be sent)

    my $Success = $TicketObject->OwnerSet(
        TicketID  => 123,
        NewUserID => 555,
        UserID    => 123,
    );

    Return:
    1 = owner has been set
    2 = this owner is already set, no update needed

    Optional attribute:
    SendNoNotification, disable or enable agent and customer notification for this
    action. Otherwise a notification will be send to agent and cusomer.

    For example:

        SendNoNotification => 0, # optional 1|0 (send no agent and customer notification)

=cut

sub OwnerSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    if ( !$Param{NewUserID} && !$Param{NewUser} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need NewUserID or NewUser!' );
        return;
    }

    # lookup if no NewUserID is given
    if ( !$Param{NewUserID} ) {
        $Param{NewUserID} = $Self->{UserObject}->UserLookup( UserLogin => $Param{NewUser} );
    }

    # lookup if no NewUser is given
    if ( !$Param{NewUser} ) {
        $Param{NewUser} = $Self->{UserObject}->UserLookup( UserID => $Param{NewUserID} );
    }

    # check if update is needed!
    my ( $OwnerID, $Owner ) = $Self->OwnerCheck( TicketID => $Param{TicketID} );
    if ( $OwnerID eq $Param{NewUserID} ) {

        # update is "not" needed!
        return 2;
    }

    # db update
    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket SET '
            . ' user_id = ?, change_time = current_timestamp, change_by = ? WHERE id = ?',
        Bind => [ \$Param{NewUserID}, \$Param{UserID}, \$Param{TicketID} ],
    );

    # add history
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        CreateUserID => $Param{UserID},
        HistoryType  => 'OwnerUpdate',
        Name         => "\%\%$Param{NewUser}\%\%$Param{NewUserID}",
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # send agent notify
    if ( !$Param{SendNoNotification} ) {
        if (
            $Param{UserID} ne $Param{NewUserID}
            && $Param{NewUserID} ne $Self->{ConfigObject}->Get('PostmasterUserID')
            )
        {

            # send agent notification
            $Self->SendAgentNotification(
                Type                  => 'OwnerUpdate',
                RecipientID           => $Param{NewUserID},
                CustomerMessageParams => {
                    %Param,
                    Body => $Param{Comment} || '',
                },
                TicketID => $Param{TicketID},
                UserID   => $Param{UserID},
            );
        }
    }

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketOwnerUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );

    return 1;
}

=item OwnerList()

returns the owner in the past as array with hash ref of the owner data
(name, email, ...)

    my @Owner = $TicketObject->OwnerList(
        TicketID => 123,
    );

=cut

sub OwnerList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # db query
    my @User      = ();
    my $LastOwner = 1;
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT sh.name, ht.name, sh.create_by FROM '
            . ' ticket_history sh, ticket_history_type ht WHERE '
            . ' sh.ticket_id = ? AND '
            . ' ht.name IN (\'OwnerUpdate\', \'NewTicket\') AND '
            . ' ht.id = sh.history_type_id ORDER BY sh.id',
        Bind => [ \$Param{TicketID} ],
    );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        # store result
        if ( $Row[1] eq 'NewTicket' && $Row[2] ne '1' && $LastOwner ne $Row[2] ) {
            $LastOwner = $Row[2];
            push @User, $Row[2];
        }
        elsif ( $Row[1] eq 'OwnerUpdate' ) {
            if (
                $Row[0] =~ /^New Owner is '(.+?)' \(ID=(.+?)\)/
                || $Row[0] =~ /^\%\%(.+?)\%\%(.+?)$/
                )
            {
                if ( $2 ne 1 ) {
                    $LastOwner = $2;
                    push @User, $2;
                }
            }
        }
    }
    my @UserInfo = ();
    for (@User) {
        my %User = $Self->{UserObject}->GetUserData( UserID => $_, Cache => 1, Valid => 1 );
        if (%User) {
            push @UserInfo, \%User;
        }
    }
    return @UserInfo;
}

=item ResponsibleSet()

to set the ticket responsible (notification to the new responsible will be sent)

    my $Success = $TicketObject->ResponsibleSet(
        TicketID  => 123,
        NewUserID => 555,
        UserID    => 213,
    );

    Return:
    1 = responsible has been set
    2 = this responsible is already set, no update needed

    Optional attribute:
    SendNoNotification, disable or enable agent and customer notification for this
    action. Otherwise a notification will be send to agent and cusomer.

    For example:

        SendNoNotification => 0, # optional 1|0 (send no agent and customer notification)

=cut

sub ResponsibleSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    if ( !$Param{NewUserID} && !$Param{NewUser} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need NewUserID or NewUser!' );
        return;
    }

    # lookup if no NewUserID is given
    if ( !$Param{NewUserID} ) {
        $Param{NewUserID} = $Self->{UserObject}->UserLookup( UserLogin => $Param{NewUser} );
    }

    # lookup if no NewUser is given
    if ( !$Param{NewUser} ) {
        $Param{NewUser} = $Self->{UserObject}->UserLookup( UserID => $Param{NewUserID} );
    }

    # check if update is needed!
    my %Ticket = $Self->TicketGet( TicketID => $Param{TicketID}, UserID => $Param{NewUserID} );
    if ( $Ticket{ResponsibleID} eq $Param{NewUserID} ) {

        # update is "not" needed!
        return 2;
    }

    # db update
    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket SET responsible_user_id = ?, '
            . ' change_time = current_timestamp, change_by = ? '
            . ' WHERE id = ?',
        Bind => [ \$Param{NewUserID}, \$Param{UserID}, \$Param{TicketID} ],
    );

    # add history
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        CreateUserID => $Param{UserID},
        HistoryType  => 'ResponsibleUpdate',
        Name         => "\%\%$Param{NewUser}\%\%$Param{NewUserID}",
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # send agent notify
    if ( !$Param{SendNoNotification} ) {
        if (
            $Param{UserID} ne $Param{NewUserID}
            && $Param{NewUserID} ne $Self->{ConfigObject}->Get('PostmasterUserID')
            )
        {
            if ( !$Param{Comment} ) {
                $Param{Comment} = '';
            }

            # send agent notification
            $Self->SendAgentNotification(
                Type                  => 'ResponsibleUpdate',
                RecipientID           => $Param{NewUserID},
                CustomerMessageParams => \%Param,
                TicketID              => $Param{TicketID},
                UserID                => $Param{UserID},
            );
        }
    }

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketResponsibleUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item ResponsibleList()

returns the responsible in the past as array with hash ref of the owner data
(name, email, ...)

    my @Responsible = $TicketObject->ResponsibleList(
        TicketID => 123,
    );

=cut

sub ResponsibleList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # db query
    my @User            = ();
    my $LastResponsible = 1;
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT sh.name, ht.name, sh.create_by FROM '
            . ' ticket_history sh, ticket_history_type ht WHERE '
            . ' sh.ticket_id = ? AND '
            . ' ht.name IN (\'ResponsibleUpdate\', \'NewTicket\') AND '
            . ' ht.id = sh.history_type_id ORDER BY sh.id',
        Bind => [ \$Param{TicketID} ],
    );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        # store result
        if ( $Row[1] eq 'NewTicket' && $Row[2] ne '1' && $LastResponsible ne $Row[2] ) {
            $LastResponsible = $Row[2];
            push @User, $Row[2];
        }
        elsif ( $Row[1] eq 'ResponsibleUpdate' ) {
            if (
                $Row[0] =~ /^New Responsible is '(.+?)' \(ID=(.+?)\)/
                || $Row[0] =~ /^\%\%(.+?)\%\%(.+?)$/
                )
            {
                $LastResponsible = $2;
                push @User, $2;
            }
        }
    }
    my @UserInfo = ();
    for (@User) {
        my %User = $Self->{UserObject}->GetUserData( UserID => $_, Cache => 1 );
        push @UserInfo, \%User;
    }
    return @UserInfo;
}

=item InvolvedAgents()

returns array with hash ref of involved agents of a ticket

    my @InvolvedAgents = $TicketObject->InvolvedAgents(
        TicketID => 123,
    );

=cut

sub InvolvedAgents {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # db query
    my @User      = ();
    my %UsedOwner = ();
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT sh.name, sh.create_by FROM '
            . ' ticket_history sh, ticket_history_type ht WHERE '
            . ' sh.ticket_id = ? AND ht.id = sh.history_type_id'
            . ' ORDER BY sh.id',
        Bind => [ \$Param{TicketID} ],
    );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        # store result
        if ( $Row[1] ne 1 && !$UsedOwner{ $Row[1] } ) {
            $UsedOwner{ $Row[1] } = $Row[1];
            push @User, $Row[1];
        }
    }
    my @UserInfo = ();
    for (@User) {
        my %User = $Self->{UserObject}->GetUserData(
            UserID => $_,
            Valid  => 1,
            Cache  => 1,
        );
        if (%User) {
            push @UserInfo, \%User;
        }
    }
    return @UserInfo;
}

=item PrioritySet()

to set the ticket priority

    $TicketObject->PrioritySet(
        TicketID => 123,
        Priority => 'low',
        UserID   => 213,
    );

    $TicketObject->PrioritySet(
        TicketID   => 123,
        PriorityID => 2,
        UserID     => 213,
    );

=cut

sub PrioritySet {
    my ( $Self, %Param ) = @_;

    # lookup!
    if ( !$Param{PriorityID} && $Param{Priority} ) {
        $Param{PriorityID} = $Self->{PriorityObject}->PriorityLookup(
            Priority => $Param{Priority},
        );
    }
    if ( $Param{PriorityID} && !$Param{Priority} ) {
        $Param{Priority} = $Self->{PriorityObject}->PriorityLookup(
            PriorityID => $Param{PriorityID},
        );
    }

    # check needed stuff
    for (qw(TicketID UserID PriorityID Priority)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    my %Ticket = $Self->TicketGet(%Param);

    # check if update is needed
    if ( $Ticket{Priority} eq $Param{Priority} ) {

        # update not needed
        return 1;
    }

    # permission check
    my %PriorityList = $Self->PriorityList(%Param);
    if ( !$PriorityList{ $Param{PriorityID} } ) {
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "Permission denied on TicketID: $Param{TicketID}!",
        );
        return;
    }

    # db update
    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket SET ticket_priority_id = ?, '
            . ' change_time = current_timestamp, change_by = ?'
            . ' WHERE id = ?',
        Bind => [ \$Param{PriorityID}, \$Param{UserID}, \$Param{TicketID} ],
    );

    # add history
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        QueueID      => $Ticket{QueueID},
        CreateUserID => $Param{UserID},
        HistoryType  => 'PriorityUpdate',
        Name         => "\%\%$Ticket{Priority}\%\%$Ticket{PriorityID}"
            . "\%\%$Param{Priority}\%\%$Param{PriorityID}",
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketPriorityUpdate',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item PriorityList()

to get the priority list for a ticket (depends on workflow, if configured)

    my %Priorities = $TicketObject->PriorityList(
        TicketID => 123,
        UserID   => 123,
    );

    my %Priorities = $TicketObject->PriorityList(
        QueueID => 123,
        UserID  => 123,
    );

=cut

sub PriorityList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} && !$Param{CustomerUserID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need UserID or CustomerUserID!' );
        return;
    }

    # check needed stuff
    #    if (!$Param{QueueID} && !$Param{TicketID}) {
    #        $Self->{LogObject}->Log(Priority => 'error', Message => 'Need QueueID or TicketID!');
    #        return;
    #    }
    # sql
    my %Data = $Self->{PriorityObject}->PriorityList(%Param);

    # workflow
    my $ACL = $Self->TicketAcl(
        %Param,
        ReturnType    => 'Ticket',
        ReturnSubType => 'Priority',
        Data          => \%Data,
    );
    if ($ACL) {
        return $Self->TicketAclData();
    }
    return %Data;
}

=item HistoryTicketStatusGet()

get a hash with ticket id as key and a hash ref (result of HistoryTicketGet)
of all affected tickets in this time area.

    my %Tickets = $TicketObject->HistoryTicketStatusGet(
        StartDay   => 12,
        StartMonth => 1,
        StartYear  => 2006,
        StopDay    => 18,
        StopMonth  => 1,
        StopYear   => 2006,
        Force      => 0,
    );

=cut

sub HistoryTicketStatusGet {
    my ( $Self, %Param ) = @_;

    my %Ticket = ();

    # check needed stuff
    for (qw(StopYear StopMonth StopDay StartYear StartMonth StartDay)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # format month and day params
    for (qw(StopMonth StopDay StartMonth StartDay)) {
        $Param{$_} = sprintf( "%02d", $Param{$_} );
    }

    my $SQLExt = '';
    for (
        qw(NewTicket FollowUp OwnerUpdate PriorityUpdate CustomerUpdate StateUpdate
        TicketFreeTextUpdate PhoneCallCustomer Forward Bounce SendAnswer EmailCustomer
        PhoneCallAgent WebRequestCustomer)
        )
    {
        my $ID = $Self->HistoryTypeLookup( Type => $_ );
        if ( !$SQLExt ) {
            $SQLExt = "AND history_type_id IN ($ID";
        }
        else {
            $SQLExt .= ",$ID";
        }
    }
    if ($SQLExt) {
        $SQLExt .= ')';
    }
    return if !$Self->{DBObject}->Prepare(
        SQL => "SELECT DISTINCT(th.ticket_id), th.create_time FROM "
            . "ticket_history th WHERE "
            . "th.create_time <= '$Param{StopYear}-$Param{StopMonth}-$Param{StopDay} 23:59:59' "
            . "AND "
            . "th.create_time >= '$Param{StartYear}-$Param{StartMonth}-$Param{StartDay} 00:00:01' "
            . "$SQLExt ORDER BY th.create_time DESC",
        Limit => 150000,
    );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Ticket{ $Row[0] } = 1;
    }
    for my $TicketID ( keys %Ticket ) {
        my %TicketData = $Self->HistoryTicketGet(
            TicketID  => $TicketID,
            StopYear  => $Param{StopYear},
            StopMonth => $Param{StopMonth},
            StopDay   => $Param{StopDay},
            Force     => $Param{Force} || 0,
        );
        if (%TicketData) {
            $Ticket{$TicketID} = \%TicketData;
        }
        else {
            $Ticket{$TicketID} = {};
        }
    }
    return %Ticket;
}

=item HistoryTicketGet()

returns a hash of the ticket history info at this time.

    my %HistoryData = $TicketObject->HistoryTicketGet(
        StopYear  => 2003,
        StopMonth => 12,
        StopDay   => 24,
        TicketID  => 123,
        Force     => 0,
    );

returns

    TicketNumber
    TicketID
    Type
    TypeID
    Queue
    QueueID
    Priority
    PriorityID
    State
    StateID
    Owner
    OwnerID
    CreateUserID
    CreateTime (timestamp)
    CreateOwnerID
    CreatePriority
    CreatePriorityID
    CreateState
    CreateStateID
    CreateQueue
    CreateQueueID
    LockFirst (timestamp)
    LockLast (timestamp)
    UnlockFirst (timestamp)
    UnlockLast (timestamp)

=cut

sub HistoryTicketGet {
    my ( $Self, %Param ) = @_;

    my %Ticket = ();

    # check needed stuff
    for (qw(TicketID StopYear StopMonth StopDay)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # format month and day params
    for (qw(StopMonth StopDay)) {
        $Param{$_} = sprintf( "%02d", $Param{$_} );
    }

    # check cache
    my $Path = $Self->{ConfigObject}->Get('Home')
        . "/var/tmp/TicketHistoryCache/$Param{StopYear}/$Param{StopMonth}/";
    my $File = $Self->{MainObject}->FilenameCleanUp(
        Filename =>
            "TicketHistoryCache-$Param{TicketID}-$Param{StopYear}-$Param{StopMonth}-$Param{StopDay}.cache",
        Type => 'local',
    );

    # write cache
    if ( !$Param{Force} && -f "$Path/$File" ) {
        my $ContentARRAYRef = $Self->{MainObject}->FileRead(
            Directory => $Path,
            Filename  => $File,
            Result    => 'ARRAY',    # optional - SCALAR|ARRAY
        );
        if ($ContentARRAYRef) {
            for my $Line ( @{$ContentARRAYRef} ) {
                if ( $Line =~ /^(.+?):(.+?)$/ ) {
                    $Ticket{$1} = $2;
                }
            }
            return %Ticket;
        }
    }

    # db access
    my $Time = "$Param{StopYear}-$Param{StopMonth}-$Param{StopDay} 23:59:59";
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT th.name, tht.name, th.create_time, th.create_by, th.ticket_id, '
            . 'th.article_id, th.queue_id, th.state_id, th.priority_id, th.owner_id, th.type_id '
            . ' FROM ticket_history th, ticket_history_type tht WHERE '
            . 'th.history_type_id = tht.id AND th.ticket_id = ? AND th.create_time <= ? '
            . 'ORDER BY th.create_time, th.id ASC',
        Bind => [ \$Param{TicketID}, \$Time ],
        Limit => 3000,
    );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Row[1] eq 'NewTicket' ) {
            if (
                $Row[0] =~ /^\%\%(.+?)\%\%(.+?)\%\%(.+?)\%\%(.+?)\%\%(.+?)$/
                || $Row[0] =~ /Ticket=\[(.+?)\],.+?Q\=(.+?);P\=(.+?);S\=(.+?)/
                )
            {
                $Ticket{TicketNumber}   = $1;
                $Ticket{Queue}          = $2;
                $Ticket{CreateQueue}    = $2;
                $Ticket{Priority}       = $3;
                $Ticket{CreatePriority} = $3;
                $Ticket{State}          = $4;
                $Ticket{CreateState}    = $4;
                $Ticket{TicketID}       = $Row[4];
                $Ticket{Owner}          = 'root';
                $Ticket{CreateUserID}   = $Row[3];
                $Ticket{CreateTime}     = $Row[2];
            }
            else {

                # COMPAT: compat to 1.1
                # NewTicket
                $Ticket{TicketVersion} = '1.1';
                $Ticket{TicketID}      = $Row[4];
                $Ticket{CreateUserID}  = $Row[3];
                $Ticket{CreateTime}    = $Row[2];
            }
            $Ticket{CreateOwnerID}    = $Row[9] || '';
            $Ticket{CreatePriorityID} = $Row[8] || '';
            $Ticket{CreateStateID}    = $Row[7] || '';
            $Ticket{CreateQueueID}    = $Row[6] || '';
        }

        # COMPAT: compat to 1.1
        elsif ( $Row[1] eq 'PhoneCallCustomer' ) {
            $Ticket{TicketVersion} = '1.1';
            $Ticket{TicketID}      = $Row[4];
            $Ticket{CreateUserID}  = $Row[3];
            $Ticket{CreateTime}    = $Row[2];
        }
        elsif ( $Row[1] eq 'Move' ) {
            if (
                $Row[0] =~ /^\%\%(.+?)\%\%(.+?)\%\%(.+?)\%\%(.+?)/
                || $Row[0] =~ /^Ticket moved to Queue '(.+?)'/
                )
            {
                $Ticket{Queue} = $1;
            }
        }
        elsif (
            $Row[1]    eq 'StateUpdate'
            || $Row[1] eq 'Close successful'
            || $Row[1] eq 'Close unsuccessful'
            || $Row[1] eq 'Open'
            || $Row[1] eq 'Misc'
            )
        {
            if (
                $Row[0]    =~ /^\%\%(.+?)\%\%(.+?)(\%\%|)$/
                || $Row[0] =~ /^Old: '(.+?)' New: '(.+?)'/
                || $Row[0] =~ /^Changed Ticket State from '(.+?)' to '(.+?)'/
                )
            {
                $Ticket{State}     = $2;
                $Ticket{StateTime} = $Row[2];
            }
        }
        elsif ( $Row[1] eq 'TicketFreeTextUpdate' ) {
            if ( $Row[0] =~ /^\%\%(.+?)\%\%(.+?)\%\%(.+?)\%\%(.+?)$/ ) {
                $Ticket{ 'Ticket' . $1 } = $2;
                $Ticket{ 'Ticket' . $3 } = $4;
                $Ticket{$1}              = $2;
                $Ticket{$3}              = $4;
            }
        }
        elsif ( $Row[1] eq 'PriorityUpdate' ) {
            if ( $Row[0] =~ /^\%\%(.+?)\%\%(.+?)\%\%(.+?)\%\%(.+?)/ ) {
                $Ticket{Priority} = $3;
            }
        }
        elsif ( $Row[1] eq 'OwnerUpdate' ) {
            if ( $Row[0] =~ /^\%\%(.+?)\%\%(.+?)/ || $Row[0] =~ /^New Owner is '(.+?)'/ ) {
                $Ticket{Owner} = $1;
            }
        }
        elsif ( $Row[1] eq 'Lock' ) {
            if ( !$Ticket{LockFirst} ) {
                $Ticket{LockFirst} = $Row[2];
            }
            $Ticket{LockLast} = $Row[2];
        }
        elsif ( $Row[1] eq 'Unlock' ) {
            if ( !$Ticket{UnlockFirst} ) {
                $Ticket{UnlockFirst} = $Row[2];
            }
            $Ticket{UnlockLast} = $Row[2];
        }

        # get default options
        $Ticket{TypeID}     = $Row[10] || '';
        $Ticket{OwnerID}    = $Row[9]  || '';
        $Ticket{PriorityID} = $Row[8]  || '';
        $Ticket{StateID}    = $Row[7]  || '';
        $Ticket{QueueID}    = $Row[6]  || '';
    }
    if ( !%Ticket ) {
        $Self->{LogObject}->Log(
            Priority => 'notice',
            Message  => "No such TicketID in ticket history till "
                . "'$Param{StopYear}-$Param{StopMonth}-$Param{StopDay} 23:59:59' ($Param{TicketID})!",
        );
        return;
    }
    else {

        # update old ticket info
        my %CurrentTicketData = $Self->TicketGet( TicketID => $Ticket{TicketID} );
        for (qw(State Priority Queue TicketNumber)) {
            if ( !$Ticket{$_} ) {
                $Ticket{$_} = $CurrentTicketData{$_};
            }
            if ( !$Ticket{"Create$_"} ) {
                $Ticket{"Create$_"} = $CurrentTicketData{$_};
            }
        }

        # check if we should cache this ticket data
        my ( $Sec, $Min, $Hour, $Day, $Month, $Year, $WDay ) = $Self->{TimeObject}->SystemTime2Date(
            SystemTime => $Self->{TimeObject}->SystemTime(),
        );

        # if the request is for the last month or older, cache it
        if ( $Year <= $Param{StopYear} && $Month > $Param{StopMonth} ) {

            # create sub directory if needed
            if ( !-e $Path && !File::Path::mkpath( [$Path], 0, 0775 ) ) {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "Can't create directory: $Path: $!",
                );
            }

            # write cache file
            my $Content = '';
            for my $Key ( keys %Ticket ) {
                $Content .= "$Key:$Ticket{$Key}\n";
            }
            $Self->{MainObject}->FileWrite(
                Directory => $Path,
                Filename  => $File,
                Content   => \$Content,
            );
        }
        return %Ticket;
    }
}

=item HistoryTypeLookup()

returns the id of the requested history type.

    my $ID = $TicketObject->HistoryTypeLookup(Type => 'Move');

=cut

sub HistoryTypeLookup {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Type} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need Type!' );
        return;
    }

    # check if we ask the same request?
    my $CacheKey = 'Ticket::History::HistoryTypeLookup::' . $Param{Type};
    if ( $Self->{$CacheKey} ) {
        return $Self->{$CacheKey};
    }

    # db query
    return if !$Self->{DBObject}->Prepare(
        SQL  => 'SELECT id FROM ticket_history_type WHERE name = ?',
        Bind => [ \$Param{Type} ],
    );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Self->{$CacheKey} = $Row[0];
    }

    # check if data exists
    if ( !$Self->{$CacheKey} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No TypeID for $Param{Type} found!",
        );
        return;
    }
    return $Self->{$CacheKey};
}

=item HistoryAdd()

add a history entry to an ticket

    $TicketObject->HistoryAdd(
        Name         => 'Some Comment',
        HistoryType  => 'Move', # see system tables
        TicketID     => 123,
        ArticleID    => 1234, # not required!
        QueueID      => 123, # not required!
        TypeID       => 123, # not required!
        CreateUserID => 123,
    );

=cut

sub HistoryAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Name} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need Name!' );
        return;
    }

    # lookup!
    if ( !$Param{HistoryTypeID} && $Param{HistoryType} ) {
        $Param{HistoryTypeID} = $Self->HistoryTypeLookup( Type => $Param{HistoryType} );
    }

    # check needed stuff
    for (qw(TicketID CreateUserID HistoryTypeID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # get ValidID!
    if ( !$Param{ValidID} ) {
        $Param{ValidID} = $Self->{ValidObject}->ValidIDsGet();
    }

    # get QueueID
    if ( !$Param{QueueID} ) {
        $Param{QueueID} = $Self->TicketQueueID( TicketID => $Param{TicketID} );
    }

    # get type
    if ( !$Param{TypeID} ) {
        my %Ticket = $Self->TicketGet(%Param);
        $Param{TypeID} = $Ticket{TypeID};
    }

    # get owner
    if ( !$Param{OwnerID} ) {
        my %Ticket = $Self->TicketGet(%Param);
        $Param{OwnerID} = $Ticket{OwnerID};
    }

    # get priority
    if ( !$Param{PriorityID} ) {
        my %Ticket = $Self->TicketGet(%Param);
        $Param{PriorityID} = $Ticket{PriorityID};
    }

    # get state
    if ( !$Param{StateID} ) {
        my %Ticket = $Self->TicketGet(%Param);
        $Param{StateID} = $Ticket{StateID};
    }

    # limit name to 200 chars
    if ( $Param{Name} ) {
        $Param{Name} = substr( $Param{Name}, 0, 200 );
    }

    # db quote
    if ( !$Param{ArticleID} ) {
        $Param{ArticleID} = undef;
    }

    # db insert
    return if !$Self->{DBObject}->Do(
        SQL => 'INSERT INTO ticket_history '
            . ' (name, history_type_id, ticket_id, article_id, queue_id, owner_id, '
            . ' priority_id, state_id, type_id, valid_id, '
            . ' create_time, create_by, change_time, change_by) '
            . 'VALUES '
            . '(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{Name},    \$Param{HistoryTypeID}, \$Param{TicketID},     \$Param{ArticleID},
            \$Param{QueueID}, \$Param{OwnerID},       \$Param{PriorityID},   \$Param{StateID},
            \$Param{TypeID},  \$Param{ValidID},       \$Param{CreateUserID}, \$Param{CreateUserID},
        ],
    );

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'HistoryAdd',
        UserID   => $Param{CreateUserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item HistoryGet()

get ticket history as array with hashes
(TicketID, ArticleID, Name, CreateBy, CreateTime and HistoryType)

    my @HistoryLines = $TicketObject->HistoryGet(
        TicketID => 123,
        UserID   => 123,
    );

=cut

sub HistoryGet {
    my ( $Self, %Param ) = @_;

    my @Lines;

    # check needed stuff
    for (qw(TicketID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT sh.name, sh.article_id, sh.create_time, sh.create_by, ht.name '
            . ' FROM ticket_history sh, ticket_history_type ht WHERE '
            . ' sh.ticket_id = ? AND ht.id = sh.history_type_id'
            . ' ORDER BY sh.create_time, sh.id',
        Bind => [ \$Param{TicketID} ],
    );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        my %Data;
        $Data{TicketID}    = $Param{TicketID};
        $Data{ArticleID}   = $Row[1] || 0;
        $Data{Name}        = $Row[0];
        $Data{CreateBy}    = $Row[3];
        $Data{CreateTime}  = $Row[2];
        $Data{HistoryType} = $Row[4];
        push @Lines, \%Data;
    }

    # get user data
    for my $Data (@Lines) {
        my %UserInfo = $Self->{UserObject}->GetUserData(
            UserID => $Data->{CreateBy},
            Cached => 1
        );
        %{$Data} = ( %{$Data}, %UserInfo );
    }
    return @Lines;
}

=item HistoryDelete()

delete a ticket history (from storage)

    $TicketObject->HistoryDelete(
        TicketID => 123,
        UserID   => 123,
    );

=cut

sub HistoryDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # delete ticket history entries from db
    return if !$Self->{DBObject}->Do(
        SQL =>
            'DELETE FROM ticket_history WHERE ticket_id = ? AND (article_id IS NULL OR article_id = 0)',
        Bind => [ \$Param{TicketID} ],
    );

    # get article index
    my @ArticleIDs = $Self->ArticleIndex(
        TicketID => $Param{TicketID},
    );

    # create article id string
    my $ArticleIDString = join q{, }, @ArticleIDs;

    # delete article history entries from db
    if ($ArticleIDString) {
        return if !$Self->{DBObject}->Do(
            SQL => "DELETE FROM ticket_history WHERE article_id IN ($ArticleIDString)",
        );
    }

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'HistoryDelete',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );

    return 1;
}

=item TicketAccountedTimeGet()

returns the accounted time of a ticket.

    my $AccountedTime = $TicketObject->TicketAccountedTimeGet(TicketID => 1234);

=cut

sub TicketAccountedTimeGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{TicketID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need TicketID!' );
        return;
    }

    # db query
    return if !$Self->{DBObject}->Prepare(
        SQL  => 'SELECT time_unit FROM time_accounting WHERE ticket_id = ?',
        Bind => [ \$Param{TicketID} ],
    );
    my $AccountedTime = 0;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Row[0] =~ s/,/./g;
        $AccountedTime = $AccountedTime + $Row[0];
    }
    return $AccountedTime;
}

=item TicketAccountTime()

account time to a ticket.

    $TicketObject->TicketAccountTime(
        TicketID  => 1234,
        ArticleID => 23542,
        TimeUnit  => '4.5',
        UserID    => 1,
    );

=cut

sub TicketAccountTime {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID ArticleID TimeUnit UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # check some wrong formats
    $Param{TimeUnit} =~ s/,/\./g;
    $Param{TimeUnit} =~ s/ //g;
    $Param{TimeUnit} =~ s/^(\d{1,10}\.\d\d).+?$/$1/g;
    chomp $Param{TimeUnit};

    # db quote
    for (qw(TimeUnit)) {
        $Param{$_} = $Self->{DBObject}->Quote( $Param{$_}, 'Number' );
    }

    # db update
    return if !$Self->{DBObject}->Do(
        SQL => "INSERT INTO time_accounting "
            . " (ticket_id, article_id, time_unit, create_time, create_by, change_time, change_by) "
            . " VALUES (?, ?, $Param{TimeUnit}, current_timestamp, ?, current_timestamp, ?)",
        Bind => [
            \$Param{TicketID}, \$Param{ArticleID}, \$Param{UserID}, \$Param{UserID},
        ],
    );

    # add history
    my $AccountedTime = $Self->TicketAccountedTimeGet( TicketID => $Param{TicketID} );
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        ArticleID    => $Param{ArticleID},
        CreateUserID => $Param{UserID},
        HistoryType  => 'TimeAccounting',
        Name         => "\%\%$Param{TimeUnit}\%\%$AccountedTime",
    );

    # clear ticket cache
    delete $Self->{ 'Cache::GetTicket' . $Param{TicketID} };

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketAccountTime',
        UserID   => $Param{UserID},
        TicketID => $Param{TicketID},
    );
    return 1;
}

=item TicketMerge()

merge two tickets

    $TicketObject->TicketMerge(
        MainTicketID  => 412,
        MergeTicketID => 123,
        UserID        => 123,
    );

=cut

sub TicketMerge {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(MainTicketID MergeTicketID UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # change ticket id of merge ticket to main ticket
    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE article SET ticket_id = ? WHERE ticket_id = ?',
        Bind => [ \$Param{MainTicketID}, \$Param{MergeTicketID} ],
    );

    # reassign article history
    return if !$Self->{DBObject}->Do(
        SQL => 'UPDATE ticket_history SET ticket_id = ? WHERE ticket_id = ?
            AND (article_id IS NOT NULL OR article_id != 0)',
        Bind => [ \$Param{MainTicketID}, \$Param{MergeTicketID} ],
    );

    my %MainTicket  = $Self->TicketGet( TicketID => $Param{MainTicketID} );
    my %MergeTicket = $Self->TicketGet( TicketID => $Param{MergeTicketID} );

    my $Body = $Self->{ConfigObject}->Get('Ticket::Frontend::AutomaticMergeText');
    $Body =~ s{<OTRS_TICKET>}{$MergeTicket{TicketNumber}}xms;
    $Body =~ s{<OTRS_MERGE_TO_TICKET>}{$MainTicket{TicketNumber}}xms;

    # add merge article to merge ticket
    $Self->ArticleCreate(
        TicketID       => $Param{MergeTicketID},
        SenderType     => 'agent',
        ArticleType    => 'note-external',
        ContentType    => "text/plain; charset=ascii",
        UserID         => $Param{UserID},
        HistoryType    => 'AddNote',
        HistoryComment => '%%Note',
        Subject        => 'Ticket Merged',
        Body           => $Body,
        NoAgentNotify  => 1,
    );

    # add merge history to merge ticket
    $Self->HistoryAdd(
        TicketID    => $Param{MergeTicketID},
        HistoryType => 'Merged',
        Name =>
            "Merged Ticket ($MergeTicket{TicketNumber}/$Param{MergeTicketID}) to ($MainTicket{TicketNumber}/$Param{MainTicketID})",
        CreateUserID => $Param{UserID},
    );

    # add merge history to main ticket
    $Self->HistoryAdd(
        TicketID    => $Param{MainTicketID},
        HistoryType => 'Merged',
        Name =>
            "Merged Ticket ($MergeTicket{TicketNumber}/$Param{MergeTicketID}) to ($MainTicket{TicketNumber}/$Param{MainTicketID})",
        CreateUserID => $Param{UserID},
    );

    # link tickets
    $Self->{LinkObject}->LinkAdd(
        SourceObject => 'Ticket',
        SourceKey    => $Param{MainTicketID},
        TargetObject => 'Ticket',
        TargetKey    => $Param{MergeTicketID},
        Type         => 'ParentChild',
        State        => 'Valid',
        UserID       => $Param{UserID},
    );

    # set new state of merge ticket
    $Self->StateSet(
        State    => 'merged',
        TicketID => $Param{MergeTicketID},
        UserID   => $Param{UserID},
    );

    # unlock ticket
    $Self->LockSet(
        Lock     => 'unlock',
        TicketID => $Param{MergeTicketID},
        UserID   => $Param{UserID},
    );

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketMerge',
        TicketID => $Param{MergeTicketID},
        UserID   => $Param{UserID},
    );
    return 1;
}

=item TicketWatchGet()

to get all user ids and additional attributes of an watched ticket

    my %Watch = $TicketObject->TicketWatchGet(
        TicketID => 123,
    );

get list of users to notify

    my %Watch = $TicketObject->TicketWatchGet(
        TicketID => 123,
        Notify   => 1,
    );

get list of users as array

    my Watch = $TicketObject->TicketWatchGet(
        TicketID => 123,
        Result   => 'ARRAY',
    );

=cut

sub TicketWatchGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # check if feature is enabled
    return if !$Self->{ConfigObject}->Get('Ticket::Watcher');

    # get all attributes of an watched ticket
    return if !$Self->{DBObject}->Prepare(
        SQL => 'SELECT user_id, create_time, create_by, change_time, change_by'
            . ' FROM ticket_watcher WHERE ticket_id = ?',
        Bind => [ \$Param{TicketID} ],
    );

    # fetch the result
    my %Data;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Data{ $Row[0] } = {
            CreateTime => $Row[1],
            CreateBy   => $Row[2],
            ChangeTime => $Row[3],
            ChangeBy   => $Row[4],
            },
    }

    if ( $Param{Notify} ) {
        for my $UserID ( keys %Data ) {
            my %UserData = $Self->{UserObject}->GetUserData(
                UserID => $UserID,
                Cached => 1,
                Valid  => 1,
            );
            if ( !$UserData{UserSendWatcherNotification} ) {
                delete $Data{$UserID};
            }
        }
    }

    # check result
    if ( $Param{Result} && $Param{Result} eq 'ARRAY' ) {
        my @UserIDs;
        for my $UserID ( keys %Data ) {
            push @UserIDs, $UserID;
        }
        return @UserIDs;
    }

    return %Data;
}

=item TicketWatchSubscribe()

to subscribe a ticket to watch it

    $TicketObject->TicketWatchSubscribe(
        TicketID    => 111,
        WatchUserID => 123,
        UserID      => 123,
    );

=cut

sub TicketWatchSubscribe {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID WatchUserID UserID)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # db access
    return if !$Self->{DBObject}->Do(
        SQL => 'DELETE FROM ticket_watcher WHERE ticket_id = ? AND user_id = ?',
        Bind => [ \$Param{TicketID}, \$Param{WatchUserID} ],
    );
    return if !$Self->{DBObject}->Do(
        SQL =>
            'INSERT INTO ticket_watcher (ticket_id, user_id, create_time, create_by, change_time, change_by) '
            . ' VALUES (?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [ \$Param{TicketID}, \$Param{WatchUserID}, \$Param{UserID}, \$Param{UserID} ],
    );

    # get user data
    my %User = $Self->{UserObject}->GetUserData(
        UserID => $Param{WatchUserID},
        Cached => 1,
    );

    # add history
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        CreateUserID => $Param{UserID},
        HistoryType  => 'Subscribe',
        Name         => "\%\%$User{UserFirstname} $User{UserLastname} ($User{UserLogin})",
    );

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketSubscribe',
        TicketID => $Param{TicketID},
        UserID   => $Param{UserID},
    );

    return 1;
}

=item TicketWatchUnsubscribe()

to remove a subscribtion of a ticket

    $TicketObject->TicketWatchUnsubscribe(
        TicketID    => 111,
        WatchUserID => 123,
        UserID      => 123,
    );

=cut

sub TicketWatchUnsubscribe {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID WatchUserID UserID)) {
        if ( !defined $Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # db access
    return if !$Self->{DBObject}->Do(
        SQL => 'DELETE FROM ticket_watcher WHERE ticket_id = ? AND user_id = ?',
        Bind => [ \$Param{TicketID}, \$Param{WatchUserID} ],
    );

    # get user data
    my %User = $Self->{UserObject}->GetUserData(
        UserID => $Param{WatchUserID},
        Cached => 1,
    );

    # add history
    $Self->HistoryAdd(
        TicketID     => $Param{TicketID},
        CreateUserID => $Param{UserID},
        HistoryType  => 'Unsubscribe',
        Name         => "\%\%$User{UserFirstname} $User{UserLastname} ($User{UserLogin})",
    );

    # ticket event
    $Self->TicketEventHandlerPost(
        Event    => 'TicketUnsubscribe',
        TicketID => $Param{TicketID},
        UserID   => $Param{UserID},
    );

    return 1;
}

=item TicketAcl()

prepare ACL execution of current state

    $TicketObject->TicketAcl(
        Data          => '-',
        Action        => 'AgentTicketZoom',
        TicketID      => 123,
        ReturnType    => 'Action',
        ReturnSubType => '-',
        UserID        => 123,
    );

    or

    $TicketObject->TicketAcl(
        Data => {
            1 => 'new',
            2 => 'open',
            # ...
        },
        ReturnType    => 'Ticket',
        ReturnSubType => 'State',
    )

=cut

sub TicketAcl {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} && !$Param{CustomerUserID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need UserID or CustomerUserID!' );
        return;
    }

    # check needed stuff
    for (qw(ReturnSubType ReturnType Data)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # do not execute acls it userid 1 is used
    return if $Param{UserID} && $Param{UserID} == 1;

    # only execute acls if ACL or ACL module is configured or event module is used
    return if !$Self->{ConfigObject}->Get('TicketAcl')
            && !$Self->{ConfigObject}->Get('Ticket::Acl::Module')
            && !$Self->{ConfigObject}->Get('Ticket::EventModulePost');

    # match also frontend options
    my %Checks = ();
    if ( $Param{Action} ) {
        undef $Self->{TicketAclActionData};
        $Checks{Frontend} = { Action => $Param{Action}, };
    }

    # use ticket data if ticket id is given
    if ( $Param{TicketID} ) {
        my %Ticket = $Self->TicketGet(%Param);
        $Checks{Ticket} = \%Ticket;
    }

    # use user data
    if ( $Param{UserID} ) {
        my %User = $Self->{UserObject}->GetUserData(
            UserID => $Param{UserID},
            Cached => 1,
        );
        for my $Type ( @{ $Self->{ConfigObject}->Get('System::Permission') } ) {
            my @Groups = $Self->{GroupObject}->GroupMemberList(
                UserID => $Param{UserID},
                Result => 'Name',
                Type   => $Type,
                Cached => 1,
            );
            $User{"Group_$Type"} = \@Groups;
        }
        $Checks{User} = \%User;
    }

    # use customer user data
    if ( $Param{CustomerUserID} ) {
        my %CustomerUser = $Self->{CustomerUserObject}->CustomerUserDataGet(
            User => $Param{CustomerUserID},
        );
        for my $Type ( @{ $Self->{ConfigObject}->Get('System::Customer::Permission') } ) {
            my @Groups = $Self->{CustomerGroupObject}->GroupMemberList(
                UserID => $Param{CustomerUserID},
                Result => 'Name',
                Type   => $Type,
                Cached => 1,
            );
            $CustomerUser{"Group_$Type"} = \@Groups;
        }
        $Checks{CustomerUser} = \%CustomerUser;
    }

    # use queue data (if given)
    if ( $Param{QueueID} ) {
        my %Queue = $Self->{QueueObject}->QueueGet( ID => $Param{QueueID} );
        $Checks{Queue} = \%Queue;
    }
    elsif ( $Param{Queue} ) {
        my %Queue = $Self->{QueueObject}->QueueGet( Name => $Param{Queue} );
        $Checks{Queue} = \%Queue;
    }

    # use queue data (if given)
    if ( $Param{ServiceID} ) {
        my %Service = $Self->{ServiceObject}->ServiceGet(
            ServiceID => $Param{ServiceID},
            UserID    => 1,
        );
        $Checks{Service} = \%Service;
    }
    elsif ( $Param{Service} ) {
        my %Service = $Self->{ServiceObject}->ServiceGet(
            Name   => $Param{Service},
            UserID => 1,
        );
        $Checks{Service} = \%Service;
    }

    # check acl config
    my %Acls;
    if ( $Self->{ConfigObject}->Get('TicketAcl') ) {
        %Acls = %{ $Self->{ConfigObject}->Get('TicketAcl') };
    }

    # check acl module
    my $Modules = $Self->{ConfigObject}->Get('Ticket::Acl::Module');
    if ($Modules) {
        for my $Module ( sort keys %{$Modules} ) {
            next if !$Self->{MainObject}->Require( $Modules->{$Module}->{Module} );

            my $Generic = $Modules->{$Module}->{Module}->new(
                %{$Self},
                TicketObject => $Self,
            );
            $Generic->Run(
                %Param,
                Acl    => \%Acls,
                Checks => \%Checks,
                Config => $Modules->{$Module},
            );
        }
    }

    # get used data
    my %Data;
    if ( ref $Param{Data} ) {
        undef $Self->{TicketAclActionData};
        %Data = %{ $Param{Data} };
    }

    my %NewData;
    my $UseNewMasterParams = 0;
    for my $Acl ( sort keys %Acls ) {
        my %Step = %{ $Acls{$Acl} };

        # check force match
        my $ForceMatch = 1;
        for ( keys %{ $Step{Properties} } ) {
            $ForceMatch = 0;
        }

        # set match params
        my $Match        = 1;
        my $Match3       = 0;
        my $UseNewParams = 0;
        for my $Key ( keys %{ $Step{Properties} } ) {
            for my $Data ( keys %{ $Step{Properties}->{$Key} } ) {
                my $Match2 = 0;
                for my $Item ( @{ $Step{Properties}->{$Key}->{$Data} } ) {
                    if ( ref $Checks{$Key}->{$Data} eq 'ARRAY' ) {
                        my $Match4 = 0;
                        for my $Array ( @{ $Checks{$Key}->{$Data} } ) {

                            # eq match
                            if ( $Item eq $Array ) {
                                $Match4 = 1;
                            }

                            # regexp match case-sensitive
                            elsif ( substr( $Item, 0, 8 ) eq '[RegExp]' ) {
                                my $RegExp = substr $Item, 8;
                                if ( $Array =~ /$RegExp/ ) {
                                    $Match4 = 1;
                                }
                            }

                            # regexp match case-insensitive
                            elsif ( substr( $Item, 0, 8 ) eq '[regexp]' ) {
                                my $RegExp = substr $Item, 8;
                                if ( $Array =~ /$RegExp/i ) {
                                    $Match4 = 1;
                                }
                            }
                            if ($Match4) {
                                $Match2 = 1;

                                # debug log
                                if ( $Self->{Debug} > 4 ) {
                                    $Self->{LogObject}->Log(
                                        Priority => 'debug',
                                        Message =>
                                            "Workflow '$Acl/$Key/$Data' MatchedARRAY ($Item eq $Array)",
                                    );
                                }
                            }
                        }
                    }
                    elsif ( defined $Checks{$Key}->{$Data} ) {
                        my $Match4 = 0;

                        # eq match
                        if ( $Item eq $Checks{$Key}->{$Data} ) {
                            $Match4 = 1;
                        }

                        # regexp match case-sensitive
                        elsif ( substr( $Item, 0, 8 ) eq '[RegExp]' ) {
                            my $RegExp = substr $Item, 8;
                            if ( $Checks{$Key}->{$Data} =~ /$RegExp/ ) {
                                $Match4 = 1;
                            }
                        }

                        # regexp match case-insensitive
                        elsif ( substr( $Item, 0, 8 ) eq '[regexp]' ) {
                            my $RegExp = substr $Item, 8;
                            if ( $Checks{$Key}->{$Data} =~ /$RegExp/i ) {
                                $Match4 = 1;
                            }
                        }

                        if ($Match4) {
                            $Match2 = 1;

                            # debug
                            if ( $Self->{Debug} > 4 ) {
                                $Self->{LogObject}->Log(
                                    Priority => 'debug',
                                    Message =>
                                        "Workflow '$Acl/$Key/$Data' Matched ($Item eq $Checks{$Key}->{$Data})",
                                );
                            }
                        }
                    }
                }
                if ( !$Match2 ) {
                    $Match = 0;
                }
                $Match3 = 1;
            }
        }

        # check force option
        if ($ForceMatch) {
            $Match  = 1;
            $Match3 = 1;
        }

        # debug log
        my %NewTmpData = ();
        if ( $Match && $Match3 ) {
            if ( $Self->{Debug} > 2 ) {
                $Self->{LogObject}->Log(
                    Priority => 'debug',
                    Message  => "Matched Workflow '$Acl'->'$Param{ReturnSubType}'",
                );
            }
        }

        # build new action data hash
        if (
            %Checks
            && $Match
            && $Match3
            && $Param{ReturnType} eq 'Action'
            && $Step{Possible}->{ $Param{ReturnType} }
            )
        {
            $Self->{TicketAclActionData} = {
                %{ $Self->{ConfigObject}->Get('TicketACL::Default::Action') },
                %{ $Step{Possible}->{ $Param{ReturnType} } },
            };
        }

        # build new ticket data hash
        if ( %Checks && $Match && $Match3 && $Step{Possible}->{Ticket}->{ $Param{ReturnSubType} } )
        {
            $UseNewParams = 1;

            # debug log
            if ( $Self->{Debug} > 3 ) {
                $Self->{LogObject}->Log(
                    Priority => 'debug',
                    Message =>
                        "Workflow '$Acl' used with Possible:'$Param{ReturnType}:$Param{ReturnSubType}'",
                );
            }

            # possible list
            for my $ID ( keys %Data ) {
                my $Match = 0;
                for my $New ( @{ $Step{Possible}->{Ticket}->{ $Param{ReturnSubType} } } ) {

                    # eq match
                    if ( $Data{$ID} eq $New ) {
                        $Match = 1;
                    }

                    # regexp match case-sensitive
                    elsif ( substr( $New, 0, 8 ) eq '[RegExp]' ) {
                        my $RegExp = substr $New, 8;
                        if ( $Data{$ID} =~ /$RegExp/ ) {
                            $Match = 1;
                        }
                    }

                    # regexp match case-insensitive
                    elsif ( substr( $New, 0, 8 ) eq '[regexp]' ) {
                        my $RegExp = substr $New, 8;
                        if ( $Data{$ID} =~ /$RegExp/i ) {
                            $Match = 1;
                        }
                    }

                    if ($Match) {
                        $NewTmpData{$ID} = $Data{$ID};
                        if ( $Self->{Debug} > 4 ) {
                            $Self->{LogObject}->Log(
                                Priority => 'debug',
                                Message =>
                                    "Workflow '$Acl' param '$Data{$ID}' used with Possible:'$Param{ReturnType}:$Param{ReturnSubType}'",
                            );
                        }
                    }
                }
            }
        }
        if (
            %Checks
            && $Match
            && $Match3
            && $Step{PossibleNot}->{Ticket}->{ $Param{ReturnSubType} }
            )
        {
            $UseNewParams = 1;

            # debug log
            if ( $Self->{Debug} > 3 ) {
                $Self->{LogObject}->Log(
                    Priority => 'debug',
                    Message =>
                        "Workflow '$Acl' used with PossibleNot:'$Param{ReturnType}:$Param{ReturnSubType}'",
                );
            }

            # not possible list
            for my $ID ( keys %Data ) {
                my $Match = 1;
                for my $New ( @{ $Step{PossibleNot}->{Ticket}->{ $Param{ReturnSubType} } } ) {

                    # eq match
                    if ( $Data{$ID} eq $New ) {
                        $Match = 0;
                    }

                    # regexp match case-sensitive
                    elsif ( substr( $New, 0, 8 ) eq '[RegExp]' ) {
                        my $RegExp = substr $New, 8;
                        if ( $Data{$ID} =~ /$RegExp/ ) {
                            $Match = 0;
                        }
                    }

                    # regexp match case-insensitive
                    elsif ( substr( $New, 0, 8 ) eq '[regexp]' ) {
                        my $RegExp = substr $New, 8;
                        if ( $Data{$ID} =~ /$RegExp/i ) {
                            $Match = 0;
                        }
                    }
                }
                if ($Match) {
                    $NewTmpData{$ID} = $Data{$ID};
                    if ( $Self->{Debug} > 4 ) {
                        $Self->{LogObject}->Log(
                            Priority => 'debug',
                            Message =>
                                "Workflow '$Acl' param '$Data{$ID}' in not used with PossibleNot:'$Param{ReturnType}:$Param{ReturnSubType}'",
                        );
                    }
                }
            }
        }

        # remember to new params if given
        if ($UseNewParams) {
            %NewData            = %NewTmpData;
            $UseNewMasterParams = 1;
        }

        # return new params if stop after this step
        if ( $UseNewParams && $Step{StopAfterMatch} ) {
            $Self->{TicketAclData} = \%NewData;
            return 1;
        }
    }

    # return if no new param exists
    return if !$UseNewMasterParams;

    $Self->{TicketAclData} = \%NewData;
    return 1;
}

=item TicketAclData()

return the current ACL data hash after TicketAcl()

    my %Acl = $TicketObject->TicketAclData();

=cut

sub TicketAclData {
    my ( $Self, %Param ) = @_;

    return %{ $Self->{TicketAclData} };
}

=item TicketAclActionData()

return the current ACL action data hash after TicketAcl()

    my %AclAction = $TicketObject->TicketAclActionData();

=cut

sub TicketAclActionData {
    my ( $Self, %Param ) = @_;

    if ( $Self->{TicketAclActionData} ) {
        return %{ $Self->{TicketAclActionData} };
    }
    else {
        return %{ $Self->{ConfigObject}->Get('TicketACL::Default::Action') };
    }
}

=item TicketEventHandlerPost()

call ticket event post handler, returns true if it's executed successfully

    $TicketObject->TicketEventHandlerPost(
        TicketID => 123,
        Event    => 'TicketStateUpdate',
        UserID   => 123,
    );

events available:

TicketCreate, TicketDelete, TicketTitleUpdate, TicketUnlockTimeoutUpdate,
TicketQueueUpdate, TicketTypeUpdate, TicketServiceUpdate,
TicketSLAUpdate, TicketCustomerUpdate, TicketFreeTextUpdate, TicketFreeTimeUpdate,
TicketPendingTimeUpdate, TicketLockUpdate, TicketStateUpdate, TicketOwnerUpdate,
TicketResponsibleUpdate, TicketPriorityUpdate, HistoryAdd, HistoryDelete,
TicketAccountTime, TicketMerge, ArticleCreate, ArticleFreeTextUpdate,
ArticleUpdate, ArticleSend, ArticleBounce, ArticleAgentNotification,
ArticleCustomerNotification, ArticleAutoResponse, ArticleFlagSet, ArticleFlagDelete;

=cut

sub TicketEventHandlerPost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TicketID Event UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    # get configured modules
    my $Modules = $Self->{ConfigObject}->Get('Ticket::EventModulePost');

    # return if there is no one
    return if !$Modules;

    # remember events only on normal mode
    if ( !$Self->{DESTROY} ) {
        push @{ $Self->{EventPipe} }, \%Param;
    }

    # load modules and execute
    for my $Module ( sort keys %{$Modules} ) {

        # execute only if configured
        if ( !$Modules->{$Module}->{Event} || $Param{Event} =~ /$Modules->{$Module}->{Event}/ ) {

            # next if we are not in transaction mode, but module is in transaction
            next if !$Param{Transaction} && $Modules->{$Module}->{Transaction};

            # next if we are in transaction mode, but module is not in transaction
            next if $Param{Transaction} && !$Modules->{$Module}->{Transaction};

            # load event module
            next if !$Self->{MainObject}->Require( $Modules->{$Module}->{Module} );
            my $Generic = $Modules->{$Module}->{Module}->new(
                %{$Self},
                TicketObject => $Self,
            );
            $Generic->Run( %Param, Config => $Modules->{$Module}, );
        }
    }

    # COMPAT: compat to 2.0
    if ( !$Param{CompatOff} ) {

        # map for old events
        my %Map = (

            # new event name            => old event name
            TicketStateUpdate           => 'StateSet',
            TicketPriorityUpdate        => 'PrioritySet',
            TicketLockUpdate            => 'LockSet',
            TicketOwnerUpdate           => 'OwnerSet',
            TicketQueueUpdate           => 'MoveTicket',
            TicketCustomerUpdate        => 'SetCustomerData',
            TicketFreeTextUpdate        => 'TicketFreeTextSet',
            TicketFreeTimeUpdate        => 'TicketFreeTimeSet',
            TicketPendingTimeUpdate     => 'TicketPendingTimeSet',
            ArticleFreeTextUpdate       => 'ArticleFreeTextSet',
            ArticleAgentNotification    => 'SendAgentNotification',
            ArticleCustomerNotification => 'SendCustomerNotification',
            ArticleAutoResponse         => 'SendAutoResponse',
        );

        # return if no map exists
        return 1 if !$Map{ $Param{Event} };

        # execute event with old event name again
        return $Self->TicketEventHandlerPost(
            %Param,
            Event     => $Map{ $Param{Event} },
            CompatOff => 1,
        );
    }
    return 1;
}

=item TicketArticleStorageSwitch()

move article storage from one backend to other backend

    my $Success = $TicketObject->TicketArticleStorageSwitch(
        TicketID    => 123,
        Source      => 'ArticleStorageDB',
        Destination => 'ArticleStorageFS',
        UserID      => 1,
    );

=cut

sub TicketArticleStorageSwitch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(TicketID Source Destination UserID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    # check source vs. destination
    return 1 if $Param{Source} eq $Param{Destination};

    # reset events and remember
    my $EventConfig = $Self->{ConfigObject}->Get('Ticket::EventModulePost');
    $Self->{ConfigObject}->{'Ticket::EventModulePost'} = {};

    # get articles
    my @ArticleIndex = $Self->ArticleIndex(
        TicketID => $Param{TicketID},
        UserID   => $Param{UserID},
    );
    ARTICLEID:
    for my $ArticleID (@ArticleIndex) {

        # create source object
        $Self->{ConfigObject}->Set(
            Key   => 'Ticket::StorageModule',
            Value => 'Kernel::System::Ticket::' . $Param{Source},
        );
        my $TicketObjectSource = Kernel::System::Ticket->new( %{$Self} );
        return if !$TicketObjectSource;

        # read source attachments
        my %Index = $TicketObjectSource->ArticleAttachmentIndex(
            ArticleID     => $ArticleID,
            UserID        => $Param{UserID},
            OnlyMyBackend => 1,
        );

        # read source plain
        my $Plain = $TicketObjectSource->ArticlePlain(
            ArticleID     => $ArticleID,
            OnlyMyBackend => 1,
        );
        my $PlainMD5Sum = '';
        if ($Plain) {
            my $PlainMD5 = $Plain;
            $PlainMD5Sum = $Self->{MainObject}->MD5sum(
                String => \$PlainMD5,
            );
        }

        # read source attachments
        my @Attachments;
        my %MD5Sums;
        for my $FileID ( keys %Index ) {
            my %Attachment = $TicketObjectSource->ArticleAttachment(
                ArticleID     => $ArticleID,
                FileID        => $FileID,
                UserID        => $Param{UserID},
                OnlyMyBackend => 1,
                Force         => 1,
            );
            push @Attachments, \%Attachment;
            my $MD5Sum = $Self->{MainObject}->MD5sum(
                String => $Attachment{Content},
            );
            $MD5Sums{$MD5Sum}++;
        }

        # nothing to transfer
        next ARTICLEID if !@Attachments && !$Plain;

        # write target attachments
        $Self->{ConfigObject}->Set(
            Key   => 'Ticket::StorageModule',
            Value => 'Kernel::System::Ticket::' . $Param{Destination},
        );
        my $TicketObjectDestination = Kernel::System::Ticket->new( %{$Self} );
        return if !$TicketObjectDestination;

        # read destination attachments
        %Index = $TicketObjectDestination->ArticleAttachmentIndex(
            ArticleID     => $ArticleID,
            UserID        => $Param{UserID},
            OnlyMyBackend => 1,
        );

        # read source attachments
        if (%Index) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message =>
                    "Attachments of TicketID:$Param{TicketID}/ArticleID:$ArticleID already in $Param{Destination}!"
            );
            next ARTICLEID;
        }

        # write attachments to destination
        for my $Attachment (@Attachments) {
            $TicketObjectDestination->ArticleWriteAttachment(
                %{$Attachment},
                ArticleID => $ArticleID,
                UserID    => $Param{UserID},
                Force     => 1,
            );
        }

        # write destination plain
        if ($Plain) {
            $TicketObjectDestination->ArticleWritePlain(
                Email     => $Plain,
                ArticleID => $ArticleID,
                UserID    => $Param{UserID},
            );
        }

        # verify destination attachments
        %Index = $TicketObjectDestination->ArticleAttachmentIndex(
            ArticleID     => $ArticleID,
            UserID        => $Param{UserID},
            OnlyMyBackend => 1,
        );
        for my $FileID ( keys %Index ) {
            my %Attachment = $TicketObjectDestination->ArticleAttachment(
                ArticleID     => $ArticleID,
                FileID        => $FileID,
                UserID        => $Param{UserID},
                OnlyMyBackend => 1,
                Force         => 1,
            );
            my $MD5Sum = $Self->{MainObject}->MD5sum(
                String => \$Attachment{Content},
            );
            if ( $MD5Sums{$MD5Sum} ) {
                $MD5Sums{$MD5Sum}--;
                if ( !$MD5Sums{$MD5Sum} ) {
                    delete $MD5Sums{$MD5Sum};
                }
            }
            else {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message =>
                        "Corrupt file: $Attachment{Filename} (TicketID:$Param{TicketID}/ArticleID:$ArticleID)!",
                );

                # set events
                $Self->{ConfigObject}->{'Ticket::EventModulePost'} = $EventConfig;
                return;
            }
        }

        # check if all files are moved
        if (%MD5Sums) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message =>
                    "Not all files are moved! (TicketID:$Param{TicketID}/ArticleID:$ArticleID)!",
            );

            # set events
            $Self->{ConfigObject}->{'Ticket::EventModulePost'} = $EventConfig;
            return;
        }

        # verify destination plain if exists in source backend
        if ($Plain) {
            my $PlainVerify = $TicketObjectDestination->ArticlePlain(
                ArticleID     => $ArticleID,
                OnlyMyBackend => 1,
            );
            my $PlainMD5SumVerify = '';
            if ($PlainVerify) {
                $PlainMD5SumVerify = $Self->{MainObject}->MD5sum(
                    String => \$PlainVerify,
                );
            }
            if ( $PlainMD5Sum ne $PlainMD5SumVerify ) {
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message =>
                        "Corrupt plain file: ArticleID: $ArticleID ($PlainMD5Sum/$PlainMD5SumVerify)",
                );

                # set events
                $Self->{ConfigObject}->{'Ticket::EventModulePost'} = $EventConfig;
                return;
            }
        }

        # remove source attachments
        $Self->{ConfigObject}->Set(
            Key   => 'Ticket::StorageModule',
            Value => 'Kernel::System::Ticket::' . $Param{Source},
        );
        $TicketObjectSource = Kernel::System::Ticket->new( %{$Self} );
        $TicketObjectSource->ArticleDeleteAttachment(
            ArticleID     => $ArticleID,
            UserID        => 1,
            OnlyMyBackend => 1,
        );

        # remove source plain
        $TicketObjectSource->ArticleDeletePlain(
            ArticleID     => $ArticleID,
            UserID        => 1,
            OnlyMyBackend => 1,
        );

        # read source attachments
        %Index = $TicketObjectSource->ArticleAttachmentIndex(
            ArticleID     => $ArticleID,
            UserID        => $Param{UserID},
            OnlyMyBackend => 1,
        );

        # read source attachments
        if (%Index) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Attachments still in $Param{Source}!"
            );
            return;
        }
    }

    # set events
    $Self->{ConfigObject}->{'Ticket::EventModulePost'} = $EventConfig;

    return 1;
}

sub DESTROY {
    my ( $Self, %Param ) = @_;

    # remember, we are on destory mode, do not execute new events
    $Self->{DESTROY} = 1;

    # execute events on end of transaction
    if ( $Self->{EventPipe} ) {
        for my $Params ( @{ $Self->{EventPipe} } ) {
            $Self->TicketEventHandlerPost(
                %{$Params},
                Transaction => 1,
            );
        }
    }
    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=head1 VERSION

$Revision: 1.416.2.17 $ $Date: 2012/02/14 13:57:04 $

=cut
