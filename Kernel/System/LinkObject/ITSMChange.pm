# --
# Kernel/System/LinkObject/ITSMChange.pm - to link change objects
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: ITSMChange.pm,v 1.7 2010/10/18 20:34:38 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::LinkObject::ITSMChange;

use strict;
use warnings;

use Kernel::System::ITSMChange;
use Kernel::system::LinkObject;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (
        qw(DBObject ConfigObject EncodeObject LogObject MainObject TimeObject)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    # create additional objects
    $Self->{ChangeObject} = Kernel::System::ITSMChange->new( %{$Self} );
    $Self->{LinkObject}   = Kernel::System::LinkObject->new( %{$Self} );

    return $Self;
}

=item LinkListWithData()

fill up the link list with data

    $Success = $LinkObjectBackend->LinkListWithData(
        LinkList => $HashRef,
        UserID   => 1,
    );

=cut

sub LinkListWithData {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(LinkList UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check link list
    if ( ref $Param{LinkList} ne 'HASH' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'LinkList must be a hash reference!',
        );
        return;
    }

    for my $LinkType ( keys %{ $Param{LinkList} } ) {

        for my $Direction ( keys %{ $Param{LinkList}->{$LinkType} } ) {

            CHANGEID:
            for my $ChangeID ( keys %{ $Param{LinkList}->{$LinkType}->{$Direction} } ) {

                # get change data
                my $ChangeData = $Self->{ChangeObject}->ChangeGet(
                    ChangeID => $ChangeID,
                    UserID   => $Param{UserID},
                );

                # remove id from hash if ChangeGet() returns no results
                if ( !$ChangeData ) {
                    delete $Param{LinkList}->{$LinkType}->{$Direction}->{$ChangeID};
                    next CHANGEID;
                }

                # add change data
                $Param{LinkList}->{$LinkType}->{$Direction}->{$ChangeID} = $ChangeData;
            }
        }
    }

    return 1;
}

=item ObjectDescriptionGet()

return a hash of object descriptions

Return
    %Description = (
        Normal => "Change# 2009102110001674",
        Long   => "Change# 2009102110001674: The Change Title",
    );

    %Description = $LinkObject->ObjectDescriptionGet(
        Key     => 123,
        UserID  => 1,
    );

=cut

sub ObjectDescriptionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Object Key UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # create description
    my %Description = (
        Normal => 'Change',
        Long   => 'Change',
    );

    return %Description if $Param{Mode} && $Param{Mode} eq 'Temporary';

    # get change data
    my $ChangeData = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $Param{Key},
        UserID   => $Param{UserID},
    );

    return if !$ChangeData;
    return if !%{$ChangeData};

    # define description text
    my $ChangeHook      = $Self->{ConfigObject}->Get('ITSMChange::Hook');
    my $DescriptionText = "$ChangeHook $ChangeData->{ChangeNumber}";

    # create description
    %Description = (
        Normal => $DescriptionText,
        Long   => "$DescriptionText: $ChangeData->{ChangeTitle}",
    );

    return %Description;
}

=item ObjectSearch()

return a hash list of the search results

Return
    $SearchList = {
        NOTLINKED => {
            Source => {
                12  => $DataOfItem12,
                212 => $DataOfItem212,
                332 => $DataOfItem332,
            },
        },
    };

    $SearchList = $LinkObjectBackend->ObjectSearch(
        SearchParams => $HashRef,    # (optional)
        UserID       => 1,
    );

=cut

sub ObjectSearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    # set default params
    $Param{SearchParams} ||= {};

    # add wildcards
    my %Search;
    for my $Element (qw(ChangeNumber ChangeTitle WorkOrderTitle)) {
        if ( $Param{SearchParams}->{$Element} ) {
            $Search{$Element} = '*' . $Param{SearchParams}->{$Element} . '*';
        }
    }

    # search the changes
    # no need to use OrderBy here, because it is sorted in TableCreateComplex and TableCreateSimple
    my $ChangeIDsRef = $Self->{ChangeObject}->ChangeSearch(
        %{ $Param{SearchParams} },
        %Search,
        UsingWildcards => 1,

        # TODO:
        # use sysconfig option for 'limit' instead, decide wheater this option would be only
        # valid for linking changes, or just use a global setting for all linking stuff
        Limit => 200,

        UserID => $Param{UserID},
    );

    my %SearchList;
    CHANGEID:
    for my $ChangeID ( @{$ChangeIDsRef} ) {

        # get change data
        my $ChangeData = $Self->{ChangeObject}->ChangeGet(
            ChangeID => $ChangeID,
            UserID   => $Param{UserID},
        );

        next ChangeID if !$ChangeData;

        # add change data
        $SearchList{NOTLINKED}->{Source}->{$ChangeID} = $ChangeData;
    }

    return \%SearchList;
}

=item LinkAddPre()

link add pre event module

    $True = $LinkObject->LinkAddPre(
        Key          => 123,
        SourceObject => 'ITSMChange',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkAddPre(
        Key          => 123,
        TargetObject => 'ITSMChange',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkAddPre {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkAddPost()

link add pre event module

    $True = $LinkObject->LinkAddPost(
        Key          => 123,
        SourceObject => 'ITSMChange',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkAddPost(
        Key          => 123,
        TargetObject => 'ITSMChange',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkAddPost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    # get information about linked object
    my $ID     = $Param{TargetKey}    || $Param{SourceKey};
    my $Object = $Param{TargetObject} || $Param{SourceObject};

    # trigger ChangeLinkAddPost-Event
    $Self->{ChangeObject}->EventHandler(
        Event => 'ChangeLinkAddPost',
        Data  => {
            ChangeID => $Param{Key},
            Object   => $Object,         # the other object of the link
            ID       => $ID,             # id of the other object
            Type     => $Param{Type},    # the link type
            %Param,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item LinkDeletePre()

link delete pre event module

    $True = $LinkObject->LinkDeletePre(
        Key          => 123,
        SourceObject => 'ITSMChange',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkDeletePre(
        Key          => 123,
        TargetObject => 'ITSMChange',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkDeletePre {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkDeletePost()

link delete post event module

    $True = $LinkObject->LinkDeletePost(
        Key          => 123,
        SourceObject => 'ITSMChange',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkDeletePost(
        Key          => 123,
        TargetObject => 'ITSMChange',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkDeletePost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    # get information about linked object
    my $ID     = $Param{TargetKey}    || $Param{SourceKey};
    my $Object = $Param{TargetObject} || $Param{SourceObject};

    # trigger ChangeLinkDeletePost-Event
    $Self->{ChangeObject}->EventHandler(
        Event => 'ChangeLinkDeletePost',
        Data  => {
            ChangeID => $Param{Key},
            Object   => $Object,         # the other object of the link
            ID       => $ID,             # id of the other object
            Type     => $Param{Type},    # the link type
            %Param,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

1;
