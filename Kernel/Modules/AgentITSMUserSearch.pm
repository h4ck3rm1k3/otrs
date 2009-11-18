# --
# Kernel/Modules/AgentITSMUserSearch.pm - a module used for the autocomplete feature
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: AgentITSMUserSearch.pm,v 1.5 2009/11/18 12:35:12 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMUserSearch;

use strict;
use warnings;

use Kernel::System::User;
use Kernel::System::Group;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.5 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check all needed objects
    for my $Object (qw(ParamObject DBObject LayoutObject ConfigObject LogObject)) {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }

    # create needed objects
    $Self->{UserObject}  = Kernel::System::User->new(%Param);
    $Self->{GroupObject} = Kernel::System::Group->new(%Param);

    # get config
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMChange::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $JSON = '';

    # search users
    if ( !$Self->{Subaction} ) {

        # get needed params
        my $Search = $Self->{ParamObject}->GetParam( Param => 'Search' ) || '';
        my $Groups = $Self->{ParamObject}->GetParam( Param => 'Groups' ) || '';

        # get all members of the groups
        my %GroupUsers;
        if ($Groups) {
            my @GroupNames = split /,\s+/, $Groups;

            for my $GroupName (@GroupNames) {
                my $GroupID = $Self->{GroupObject}->GroupLookup(
                    Group => $GroupName,
                );

                # get user groups
                my %Users = $Self->{GroupObject}->GroupMemberList(
                    GroupID => $GroupID,
                    Type    => 'ro',
                    Result  => 'HASH',
                    Cached  => 1,
                );

                my @UserIDs = keys %Users;
                @GroupUsers{@UserIDs} = @UserIDs;
            }
        }

        # get user list
        my %UserList = $Self->{UserObject}->UserSearch(
            Search => $Search,
            Valid  => 1,
        );

        # build data
        my @Data;

        USERID:
        for my $UserID (
            sort { $UserList{$a} cmp $UserList{$b} }
            keys %UserList
            )
        {

            # if groups are required and user is not member of one of the groups
            # then skip the user
            next USERID if $Groups && !$GroupUsers{$UserID};

            # html quote characters like <>
            my $UserValuePlain = $UserList{$UserID};
            $UserList{$UserID} = $Self->{LayoutObject}->Ascii2Html(
                Text => $UserList{$UserID},
            );

            push @Data, {
                UserKey        => $UserID,
                UserValue      => $UserList{$UserID},
                UserValuePlain => $UserValuePlain,
            };
        }

        # build JSON output
        $JSON = $Self->{LayoutObject}->JSON(
            Data => {
                Response => {
                    Results => \@Data,
                    }
            },
        );
    }

    # send JSON response
    return $Self->{LayoutObject}->Attachment(
        ContentType => 'text/plain; charset=' . $Self->{LayoutObject}->{Charset},
        Content     => $JSON || '',
        Type        => 'inline',
        NoCache     => 1,
    );

}

1;
