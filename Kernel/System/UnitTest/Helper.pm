# --
# Helper.pm - unit test helper functions
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: Helper.pm,v 1.12 2011/04/01 10:41:42 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::UnitTest::Helper;

use strict;

use Kernel::Config;
use Kernel::System::User;
use Kernel::System::Group;
use Kernel::System::CustomerUser;
use Kernel::System::SysConfig;

=head1 NAME

Kernel::System::UnitTest::Helper - unit test helper functions

=over 4

=cut

=item new()

construct a helper object.

    use Kernel::System::UnitTest::Helper;

    my $Helper = Kernel::System::UnitTest::Helper->new(
        %{$Self},
        RestoreSystemConfiguration => 1,        # optional, save ZZZAuto.pm and restore it in the destructor
    );
=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    $Self->{Debug} = $Param{Debug} || 0;

    # check needed objects
    for my $Needed (qw(UnitTestObject DBObject LogObject TimeObject MainObject EncodeObject)) {
        if ( $Param{$Needed} ) {
            $Self->{$Needed} = $Param{$Needed};
        }
        else {
            die "Got no $Needed!";
        }
    }

    # use local Config object because it will be modified
    $Self->{ConfigObject} = Kernel::Config->new();

    # disable email checks to create new user
    $Self->{ConfigObject}->Set(
        Key   => 'CheckEmailAddresses',
        Value => 0,
    );

    $Self->{UserObject} = Kernel::System::User->new(
        %{ $Self->{UnitTestObject} },
        ConfigObject => $Self->{ConfigObject},
    );

    $Self->{GroupObject} = Kernel::System::Group->new(
        %{ $Self->{UnitTestObject} },
        ConfigObject => $Self->{ConfigObject},
        UserObject   => $Self->{UserObject},
    );

    $Self->{CustomerUserObject} = Kernel::System::CustomerUser->new(
        %{ $Self->{UnitTestObject} },
        ConfigObject => $Self->{ConfigObject},
    );

    #
    # Make backup of system configuration if needed
    #
    if ( $Param{RestoreSystemConfiguration} ) {
        $Self->{SysConfigObject} = Kernel::System::SysConfig->new( %{$Self} );

        $Self->{SysConfigBackup} = $Self->{SysConfigObject}->Download();

        $Self->{UnitTestObject}->True( 1, 'Creating backup of the system configuration' );
    }

    return $Self;
}

=item GetRandomID()

creates a random ID that can be used in tests as a unique identifier.

=cut

sub GetRandomID {
    my ( $Self, %Param ) = @_;

    return 'test-' . int( rand(1000000) )
}

=item TestUserCreate()

creates a test user that can be used in tests. It will
be set to invalid automatically during the destructor. Returns
the login name of the new user, the password is the same.

    my $TestUserLogin = $sel->TestUserCreate(
        Groups => ['admin', 'users'],           # optional, list of groups to add this user to (rw rights)
    );

=cut

sub TestUserCreate {
    my ( $Self, %Param ) = @_;

    # create test user
    my $TestUserLogin = $Self->GetRandomID();

    my $TestUserID = $Self->{UserObject}->UserAdd(
        UserFirstname => $TestUserLogin,
        UserLastname  => $TestUserLogin,
        UserLogin     => $TestUserLogin,
        UserPw        => $TestUserLogin,
        UserEmail     => $TestUserLogin . '@localunittest.com',
        ValidID       => 1,
        ChangeUserID  => 1,
    ) || die "Could not create test user";

    # Remember UserID of the test user to later set it to invalid
    #   in the destructor.
    $Self->{TestUsers} ||= [];
    push( @{ $Self->{TestUsers} }, $TestUserID );

    $Self->{UnitTestObject}->True( 1, "Created test user $TestUserID" );

    # Add user to groups
    GROUP_NAME:
    for my $GroupName ( @{ $Param{Groups} || [] } ) {
        my $GroupID = $Self->{GroupObject}->GroupLookup( Group => $GroupName );
        die "Cannot find group $GroupName" if ( !$GroupID );

        $Self->{GroupObject}->GroupMemberAdd(
            GID        => $GroupID,
            UID        => $TestUserID,
            Permission => {
                ro        => 1,
                move_into => 1,
                create    => 1,
                owner     => 1,
                priority  => 1,
                rw        => 1,
            },
            UserID => 1,
        ) || die "Could not add test user $TestUserLogin to group $GroupName";

        $Self->{UnitTestObject}->True( 1, "Added test user $TestUserLogin to group $GroupName" );
    }

    return $TestUserLogin;
}

=item TestCustomerUserCreate()

creates a test customer user that can be used in tests. It will
be set to invalid automatically during the destructor. Returns
the login name of the new customer user, the password is the same.

    my $TestUserLogin = $sel->TestCustomerUserCreate();

=cut

sub TestCustomerUserCreate {
    my ( $Self, %Param ) = @_;

    # create test user
    my $TestUserLogin = $Self->GetRandomID();

    my $TestUser = $Self->{CustomerUserObject}->CustomerUserAdd(
        Source         => 'CustomerUser',
        UserFirstname  => $TestUserLogin,
        UserLastname   => $TestUserLogin,
        UserCustomerID => $TestUserLogin,
        UserLogin      => $TestUserLogin,
        UserPassword   => $TestUserLogin,
        UserEmail      => $TestUserLogin . '@localunittest.com',
        ValidID        => 1,
        UserID         => 1,
    ) || die "Could not create test user";

    # Remember UserID of the test user to later set it to invalid
    #   in the destructor.
    $Self->{TestCustomerUsers} ||= [];
    push( @{ $Self->{TestCustomerUsers} }, $TestUser );

    $Self->{UnitTestObject}->True( 1, "Created test customer user $TestUser" );

    return $TestUser;
}

sub SeleniumScenariosGet {
    my $Self = shift;

    my $Scenarios = [
        {
            ID          => 'Firefox on localhost',
            host        => 'localhost',
            port        => '4444',
            browser     => '*firefox',
            browser_url => 'http://127.0.0.1/',
        },
        {
            ID          => 'Safari on localhost',
            host        => 'localhost',
            port        => '4444',
            browser     => '*safari',
            browser_url => 'http://127.0.0.1/',
        },

        #        {
        #            ID          => 'IE7 VM',
        #            host        => '192.168.56.101',
        #            port        => '4444',
        #            browser     => '*iehta',
        #            browser_url => 'http://192.168.56.1/',
        #        },
        #        {
        #            ID          => 'IE8 VM',
        #            host        => '192.168.56.102',
        #            port        => '4444',
        #            browser     => '*iehta',
        #            browser_url => 'http://192.168.56.1/',
        #        },
    ];

    return $Scenarios;
}

sub DESTROY {
    my $Self = shift;

    #
    # Restore system configuration if needed
    #
    if ( $Self->{SysConfigBackup} ) {

        $Self->{SysConfigObject}->Upload( Content => $Self->{SysConfigBackup} );

        $Self->{UnitTestObject}->True( 1, 'Restored the system configuration' );
    }

    # invalidate test users
    if ( ref $Self->{TestUsers} eq 'ARRAY' && @{ $Self->{TestUsers} } ) {
        for my $TestUser ( @{ $Self->{TestUsers} } ) {

            # make test user invalid
            my $Success = $Self->{UserObject}->UserUpdate(
                UserID        => $TestUser,
                UserFirstname => 'Firstname Test1',
                UserLastname  => 'Lastname Test1',
                UserLogin     => $TestUser,
                UserEmail     => $TestUser . '@localunittest.com.com',
                ValidID       => 2,
                ChangeUserID  => 1,
            ) || die "Could not invalidate test user";

            $Self->{UnitTestObject}->True( $Success, "Set test user $TestUser to invalid" );
        }
    }

    # invalidate test customer users
    if ( ref $Self->{TestCustomerUsers} eq 'ARRAY' && @{ $Self->{TestCustomerUsers} } ) {
        for my $TestCustomerUser ( @{ $Self->{TestCustomerUsers} } ) {

            my $Success = $Self->{CustomerUserObject}->CustomerUserUpdate(
                Source         => 'CustomerUser',
                ID             => $TestCustomerUser,
                UserCustomerID => $TestCustomerUser,
                UserLogin      => $TestCustomerUser,
                UserFirstname  => $TestCustomerUser,
                UserLastname   => $TestCustomerUser,
                UserPassword   => $TestCustomerUser,
                UserEmail      => $TestCustomerUser . '@localunittest.com.com',
                ValidID        => 2,
                UserID         => 1,
            );

            $Self->{UnitTestObject}
                ->True( $Success, "Set test customer user $TestCustomerUser to invalid" );
        }
    }
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

$Revision: 1.12 $ $Date: 2011/04/01 10:41:42 $

=cut
