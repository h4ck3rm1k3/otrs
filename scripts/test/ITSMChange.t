# --
# ITSMChange.t - change tests
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: ITSMChange.t,v 1.19 2009/10/13 08:14:19 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars qw($Self);

use Data::Dumper;
use Kernel::System::User;
use Kernel::System::CustomerUser;
use Kernel::System::GeneralCatalog;
use Kernel::System::ITSMChange;

$Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
$Self->{ChangeObject}         = Kernel::System::ITSMChange->new( %{$Self} );
$Self->{UserObject}           = Kernel::System::User->new( %{$Self} );
$Self->{CustomerUserObject}   = Kernel::System::CustomerUser->new( %{$Self} );

# ------------------------------------------------------------ #
# make preparations
# ------------------------------------------------------------ #
my $TestCount = 1;

# create needed users
my @UserIDs;

# create needed users
my @CustomerUserIDs;

# disable email checks to create new user
my $CheckEmailAddressesOrg = $Self->{ConfigObject}->Get('CheckEmailAddresses') || 1;
$Self->{ConfigObject}->Set(
    Key   => 'CheckEmailAddresses',
    Value => 0,
);

for my $Counter ( 1 .. 3 ) {

    # create new users for the tests
    my $UserID = $Self->{UserObject}->UserAdd(
        UserFirstname => 'ITSMChange' . $Counter,
        UserLastname  => 'UnitTest',
        UserLogin     => 'UnitTest-ITSMChange-' . $Counter . int rand 1_000_000,
        UserEmail     => 'UnitTest-ITSMChange-' . $Counter . '@localhost',
        ValidID       => 1,
        ChangeUserID  => 1,
    );
    push @UserIDs, $UserID;

    # create new customers for the tests
    my $CustomerUserID = $Self->{CustomerUserObject}->CustomerUserAdd(
        Source         => 'CustomerUser',
        UserFirstname  => 'ITSMChangeCustomer' . $Counter,
        UserLastname   => 'UnitTestCustomer',
        UserCustomerID => 'UCT' . $Counter . int rand 1_000_000,
        UserLogin      => 'UnitTest-ITSMChange-Customer-' . $Counter . int rand 1_000_000,
        UserEmail      => 'UnitTest-ITSMChange-Customer-'
            . $Counter
            . int( rand 1_000_000 )
            . '@localhost',
        ValidID => 1,
        UserID  => 1,
    );
    push @CustomerUserIDs, $CustomerUserID;
}

# set 3rd user invalid
$Self->{UserObject}->UserUpdate(
    $Self->{UserObject}->GetUserData(
        UserID => $UserIDs[2],
    ),
    ValidID => $Self->{ChangeObject}->{ValidObject}->ValidLookup(
        Valid => 'invalid',
    ),
    ChangeUserID => 1,
);

# restore original email check param
$Self->{ConfigObject}->Set(
    Key   => 'CheckEmailAddresses',
    Value => $CheckEmailAddressesOrg,
);

# ------------------------------------------------------------ #
# test ITSMChange API
# ------------------------------------------------------------ #
# define public interface
my @ObjectMethods = qw(
    ChangeAdd
    ChangeDelete
    ChangeGet
    ChangeList
    ChangeSearch
    ChangeUpdate
    ChangeCABDelete
    ChangeCABGet
    ChangeCABUpdate
);

# check if subs are available
for my $ObjectMethod (@ObjectMethods) {
    $Self->True(
        $Self->{ChangeObject}->can($ObjectMethod),
        "Test " . $TestCount++ . " - check 'can $ObjectMethod'"
    );
}

# ------------------------------------------------------------ #
# search for default ITSMChange-states
# ------------------------------------------------------------ #
# define default ITSMChange-states
# can't use qw due to spaces in states
my @DefaultChangeStates = (
    'requested',
    'pending approval',
    'rejected',
    'approved',
    'in progress',
    'successful',
    'failed',
    'retracted',
);

# get class list with swapped keys and values
my %ReverseClassList = reverse %{
    $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ChangeManagement::Change::State',
        )
    };

# check if states are in GeneralCatalog
for my $DefaultChangeState (@DefaultChangeStates) {
    $Self->True(
        $ReverseClassList{$DefaultChangeState},
        "Test " . $TestCount++ . " - check state '$DefaultChangeState'"
    );
}

# ------------------------------------------------------------ #
# define general change tests
# ------------------------------------------------------------ #
my @ChangeTests = (

    # Change doesn't contain all data (required attributes)
    {
        SourceData => {
            ChangeAdd => {},
        },
        ReferenceData => {
            ChangeGet => undef,
        },
        Fails => 1,    # we expect this test to fail
    },

    # Change contains only required data - default user (required attributes)
    {
        SourceData => {
            ChangeAdd => {
                UserID => 1,
            },
        },
        ReferenceData => {
            ChangeGet => {
                Title           => q{},
                Description     => q{},
                Justification   => q{},
                ChangeManagerID => 1,
                ChangeBuilderID => 1,
                WorkOrderIDs    => [],
                CABAgents       => [],
                CABCustomers    => [],
                CreateBy        => 1,
                ChangeBy        => 1,
            },
        },
    },

    # Change contains only required data - default user (required attributes)
    {
        SourceData => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => {
                Title           => q{},
                Description     => q{},
                Justification   => q{},
                ChangeManagerID => $UserIDs[0],
                ChangeBuilderID => $UserIDs[0],
                WorkOrderIDs    => [],
                CABAgents       => [],
                CABCustomers    => [],
                CreateBy        => $UserIDs[0],
                ChangeBy        => $UserIDs[0],
            },
        },
    },

    # change contains all date - (all attributes)
    {
        SourceData => {
            ChangeAdd => {
                Title           => 'Change 1',
                Description     => 'Description 1',
                Justification   => 'Justification 1',
                ChangeManagerID => $UserIDs[0],
                ChangeBuilder   => $UserIDs[0],
                ChangeBuilder   => $UserIDs[0],
                CABAgents       => [
                    $UserIDs[0],
                    $UserIDs[1]
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
                UserID => $UserIDs[1],
            },
        },
        ReferenceData => {
            ChangeGet => {
                Title           => 'Change 1',
                Description     => 'Description 1',
                Justification   => 'Justification 1',
                ChangeManagerID => $UserIDs[0],
                ChangeBuilder   => $UserIDs[0],
                ChangeBuilder   => $UserIDs[0],
                CABAgents       => [
                    $UserIDs[0],
                    $UserIDs[1]
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
        },
        SearchTest => [ 2, 3 ],
    },

    # change contains all date - wrong CAB - (wrong CAB attributes)
    {
        SourceData => {
            ChangeAdd => {
                Title           => 'Change 1',
                Description     => 'Description 1',
                Justification   => 'Justification 1',
                ChangeManagerID => $UserIDs[0],
                ChangeBuilder   => $UserIDs[0],
                ChangeBuilder   => $UserIDs[0],
                CABAgents       => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
                CABCustomers => [
                    $UserIDs[0],
                    $UserIDs[1]
                ],
                UserID => $UserIDs[1],
            },
        },
        Fails => 1,
    },

    # Update change without required params (required attributes)
    {
        SourceData => {
            ChangeUpdate => {},
        },
        ReferenceData => {
            ChangeUpdate => undef,
        },
        Fails => 1,    # we expect this test to fail
    },

);

my %TestedChangeID;
my %ChangeIDForSearchTest;

TEST:
for my $Test (@ChangeTests) {

    # check SourceData attribute
    if ( !$Test->{SourceData} || ref $Test->{SourceData} ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: No SourceData found for this test.",
        );

        next TEST;
    }

    # extract test data
    my $SourceData    = $Test->{SourceData};
    my $ReferenceData = $Test->{ReferenceData};

    my $ChangeID;

    # add a new Change
    if ( $SourceData->{ChangeAdd} ) {
        $ChangeID = $Self->{ChangeObject}->ChangeAdd(
            %{ $SourceData->{ChangeAdd} }
        );

        # rember current ChangeID
        if ($ChangeID) {
            $TestedChangeID{$ChangeID} = 1;

            # save changeid for use in search tests
            if ( exists $Test->{SearchTest} ) {
                my @SearchTests = @{ $Test->{SearchTest} };

                for my $SearchTestNr (@SearchTests) {
                    $ChangeIDForSearchTest{$SearchTestNr}->{$ChangeID} = 1;
                }
            }
        }

        if ( !$SourceData->{ChangeAdd}->{UserID} ) {
            $Self->False(
                $ChangeID,
                "Test $TestCount: ChangeAdd() - Don't add change without given UserID.",
            );
        }

        if ( $SourceData->{ChangeAdd}->{UserID} ) {
            $Self->True(
                $ChangeID,
                "Test $TestCount: ChangeAdd() - Add change with given UserID.",
            );
        }
    }    # end if 'SourceData'

    # get a change
    if ( exists $ReferenceData->{ChangeGet} ) {

        my $ChangeGetReferenceData = $ReferenceData->{ChangeGet};

        my $ChangeData = $Self->{ChangeObject}->ChangeGet(
            ChangeID => $ChangeID,
            UserID   => 1,
        );

        # ChangeGet should not return anything
        if ( $ReferenceData->{ChangeGet} == undef ) {
            $Self->False(
                $ChangeData,
                "Test $TestCount: ChangeGet() - Get change.",
            );
            next TEST;
        }

        for my $ChangeAttributes (qw(ChangeID CreateTime ChangeTime)) {
            $Self->True(
                $ChangeData->{$ChangeAttributes},
                "Test $TestCount: |- has $ChangeAttributes.",
            );
        }

        for my $Key ( keys %{ $ReferenceData->{ChangeGet} } ) {

            # turn off all pretty print
            $Data::Dumper::Indent = 0;
            $Data::Dumper::Useqq  = 1;

            # dump the attribute from VersionGet()
            my $ChangeAttribute = Data::Dumper::Dumper( $ChangeData->{$Key} );

            # dump the reference attribute
            my $ReferenceAttribute = Data::Dumper::Dumper( $ReferenceData->{ChangeGet}->{$Key} );

            $Self->Is(
                $ChangeAttribute,
                $ReferenceAttribute,
                "Test $TestCount: |- $Key",
            );
        }
    }    # end ChangeGet

    if ( exists $ReferenceData->{ChangeUpdate} ) {
        my $ChangeUpdateSuccess = $Self->{ChangeObject}->ChangeUpdate(
            ChangeID => $ChangeID,
            %{ $SourceData->{ChangeUpdate} },
        );

        $Self->Is(
            $ReferenceData->{ChangeUpdate},
            $ChangeUpdateSuccess,
            "Test $TestCount: ChangeUpdate() - update change.",
        );

    }    # end if ChangeUpdate
}
continue {
    $TestCount++;
}

# test if ChangeList returns at least as many changes as we created
# we cannot test for a specific number as these tests can be run in existing environments
# where other changes already exist
my $ChangeList = $Self->{ChangeObject}->ChangeList( UserID => 1 ) || [];
$Self->True(
    @{$ChangeList} >= ( keys %TestedChangeID || 0 ),
    'Test ' . $TestCount++ . ': ChangeList() returns at least as many changes as we created',
);

# count all tests that are required to and planned for fail
my $Fails = grep { $_->{Fails} } @ChangeTests;
my $NrCreatedChanges = scalar @ChangeTests - $Fails;

# test if the changes where created
$Self->Is(
    $NrCreatedChanges,
    keys %TestedChangeID || 0,
    'Test ' . $TestCount++ . ': amount of change objects and test cases.',
);

# ------------------------------------------------------------ #
# define general config item search tests
# ------------------------------------------------------------ #
my $SystemTime = $Self->{TimeObject}->SystemTime();

my @ChangeSearchTests = (

    # Nr 1 - a simple check if the search functions takes care of "Limit"
    {
        SearchData => {
            Limit => 1,
        },
        ResultData => {
            TestCount => 1,
            Count     => 1,
        },
    },

    # Nr 2 - search for all changes created by our first user
    {
        SearchData => {
            Title         => 'Change 1',
            Justification => 'Justification 1',
        },
        ResultData => {
            TestCount => 1,
        },
    },

    # Nr 3 - test createtimenewerdate
    {
        SearchData => {
            CreateTimeNewerDate => $Self->{TimeObject}->SystemTime2TimeStamp(
                SystemTime => $SystemTime - ( 60 * 60 ),
            ),
        },
        ResultData => {
            TestExistence => 1,
            }
    },
);

my $SearchTestCount = 1;

SEARCHTEST:
for my $SearchTest (@ChangeSearchTests) {

    # check SearchData attribute
    if ( !$SearchTest->{SearchData} || ref( $SearchTest->{SearchData} ) ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: SearchData found for this test.",
        );

        next SEARCHTEST;
    }

    my $ChangeIDs = $Self->{ChangeObject}->ChangeSearch(
        %{ $SearchTest->{SearchData} },
        UserID => 1,
    );

    $Self->True(
        defined($ChangeIDs) && ref($ChangeIDs) eq 'ARRAY',
        "Test $TestCount: array reference for ChangeIDs.",
    );

    $ChangeIDs ||= [];

    if ( $SearchTest->{ResultData}->{TestCount} ) {

        # get number of change ids ChangeSearch should return
        my $Count = keys %{ $ChangeIDForSearchTest{$SearchTestCount} };
        $Count = $SearchTest->{ResultData}->{Count} if exists $SearchTest->{ResultData}->{Count};

        $Self->Is(
            scalar @{$ChangeIDs},
            $Count,
            "Test $TestCount: Number of found changes.",
        );
    }

    if ( $SearchTest->{ResultData}->{TestExistence} ) {

        # check if all ids that belongs to this searchtest are returned
        my @ChangeIDs = keys %{ $ChangeIDForSearchTest{$SearchTestCount} };

        my %ReturnedChangeID;
        @ReturnedChangeID{ @{$ChangeIDs} } = (1) x scalar @{$ChangeIDs};

        for my $ChangeID (@ChangeIDs) {
            $Self->True(
                $ReturnedChangeID{$ChangeID},
                "Test $TestCount: ChangeID found in returned list.",
            );
        }
    }
}
continue {
    $TestCount++;
    $SearchTestCount++;
}

# ------------------------------------------------------------ #
# clean the system
# ------------------------------------------------------------ #

# disable email checks to create new user
my $CheckEmailAddressesOrig = $Self->{ConfigObject}->Get('CheckEmailAddresses') || 1;
$Self->{ConfigObject}->Set(
    Key   => 'CheckEmailAddresses',
    Value => 0,
);

# set unittest users invalid
for my $UnittestUserID (@UserIDs) {

    # get user data
    my %User = $Self->{UserObject}->GetUserData(
        UserID => $UnittestUserID,
    );

    # update user
    $Self->{UserObject}->UserUpdate(
        %User,
        ValidID => $Self->{ChangeObject}->{ValidObject}->ValidLookup(
            Valid => 'invalid',
        ),
        ChangeUserID => 1
    );
}

# restore original email check param
$Self->{ConfigObject}->Set(
    Key   => 'CheckEmailAddresses',
    Value => $CheckEmailAddressesOrg,
);

# delete the test config items
for my $ChangeID ( keys %TestedChangeID ) {
    $Self->{ChangeObject}->ChangeDelete(
        ChangeID => $ChangeID,
        UserID   => 1,
    );
}

1;
