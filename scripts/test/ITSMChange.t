# --
# ITSMChange.t - change tests
# Copyright (C) 2003-2009 OTRS AG, http://otrs.com/
# --
# $Id: ITSMChange.t,v 1.28 2009/10/13 12:23:23 reb Exp $
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
    ChangeNumberLookup
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
# store current TestCount for better test case recognition
my $TestCountMisc = $TestCount;
my @ChangeTests   = (

    # Change doesn't contain all data (required attributes)
    {
        Description => 'Test contains no params for ChangeAdd.',
        Fails       => 1,                                          # we expect this test to fail
        SourceData  => {
            ChangeAdd => {},
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # Change contains only required data - default user (required attributes)
    {
        Description => 'Test only needed params (UserID = 1) for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
        },
        ReferenceData => {
            ChangeGet => {
                Title           => q{},
                Description     => q{},
                Justification   => q{},
                ChangeManagerID => undef,
                ChangeBuilderID => 1,
                WorkOrderIDs    => [],
                CABAgents       => [],
                CABCustomers    => [],
                CreateBy        => 1,
                ChangeBy        => 1,
            },
        },
        SearchTest => [2],
    },

    # Change contains only required data - default user (required attributes)
    {
        Description => 'Test only needed params (UserID != 1) for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => {
                Title           => q{},
                Description     => q{},
                Justification   => q{},
                ChangeManagerID => undef,
                ChangeBuilderID => $UserIDs[0],
                WorkOrderIDs    => [],
                CABAgents       => [],
                CABCustomers    => [],
                CreateBy        => $UserIDs[0],
                ChangeBy        => $UserIDs[0],
            },
        },
    },

    # test on proper mapping on undef params - default user  (required attributes)
    {
        Description => 'Test for proper string handling for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                Title         => undef,
                Description   => undef,
                Justification => undef,
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
        SearchTest => [ 2, 4 ],
    },

    # change contains all date - (all attributes)
    {
        Description => 'Test contains all possible params for ChangeAdd.',
        SourceData  => {
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
        SearchTest => [ 2, 3, 4, 5, 6, 8, 9, 10 ],
    },

    # change contains all date - wrong CAB - (wrong CAB attributes)
    {
        Description => 'Test contains invalid CAB members.',
        SourceData  => {
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
        ReferenceData => {
            ChangeGet => undef,
        },
        Fails => 1,
    },

    # test on max long params  (required attributes)
    {
        Description => 'Test for max string length for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                Title         => 'X' x 250,
                Description   => 'Y' x 3800,
                Justification => 'Z' x 3800,
            },
        },
        ReferenceData => {
            ChangeGet => {
                Title           => 'X' x 250,
                Description     => 'Y' x 3800,
                Justification   => 'Z' x 3800,
                ChangeManagerID => undef,
                ChangeBuilderID => $UserIDs[0],
                WorkOrderIDs    => [],
                CABAgents       => [],
                CABCustomers    => [],
                CreateBy        => $UserIDs[0],
                ChangeBy        => $UserIDs[0],
            },
        },
        SearchTest => [ 2, 11 ],
    },

    # test on max+1 long params  (required attributes)
    {
        Description => 'Test for max+1 string length for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                Title         => 'X' x 251,
                Description   => 'Y' x 3801,
                Justification => 'Z' x 3801,
            },
        },
        ReferenceData => {
            ChangeGet => {
                Title           => 'X' x 250,
                Description     => 'Y' x 3800,
                Justification   => 'Z' x 3800,
                ChangeManagerID => undef,
                ChangeBuilderID => $UserIDs[0],
                WorkOrderIDs    => [],
                CABAgents       => [],
                CABCustomers    => [],
                CreateBy        => $UserIDs[0],
                ChangeBy        => $UserIDs[0],
            },
        },
        SearchTest => [ 2, 11 ],
    },

    # Update change without required params (required attributes)
    {
        Description => 'Test contains no params for ChangeUpdate().',
        Fails       => 1,                                              # we expect this test to fail
        SourceData  => {
            ChangeUpdate => {},
        },
        ReferenceData => {
            ChangeUpdate => undef,
        },
    },

    # test on max long params  (required attributes)
    {
        Description => 'Test for max string length for ChangeUpdate.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeUpdate => {
                UserID        => 1,
                Title         => 'X' x 250,
                Description   => 'Y' x 3800,
                Justification => 'Z' x 3800,
            },
        },
        ReferenceData => {
            ChangeGet => {
                Title           => 'X' x 250,
                Description     => 'Y' x 3800,
                Justification   => 'Z' x 3800,
                ChangeManagerID => undef,
                ChangeBuilderID => $UserIDs[0],
                WorkOrderIDs    => [],
                CABAgents       => [],
                CABCustomers    => [],
                CreateBy        => $UserIDs[0],
                ChangeBy        => 1,
            },
        },
    },

    # Test for ChangeCABGet
    {
        Description => 'Test checks empty ARRAY-ref on ChangeCABGet with no given CAB.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents    => [],
                CABCustomers => [],
            },
        },
        SearchTest => [ 2, 4 ],
    },

    # Test for ChangeCABUpdate and ChangeCABGet
    {
        Description => 'Test checks removment of duplicate CAB members for ChangeCABUpdate',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeCABUpdate => {
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[0],
                    $UserIDs[0],
                    $UserIDs[1],
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                    $CustomerUserIDs[1],
                    $CustomerUserIDs[1],
                    $CustomerUserIDs[1],
                    $CustomerUserIDs[1],
                ],
            },
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[1],
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
        },
        SearchTest => [ 2, 8, 9, 10 ],
    },

    # Test for ChangeCABUpdate and ChangeCABGet
    {
        Description => 'Test checks invalid CABAgents param for ChangeCABUpdate.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeCABUpdate => {
                CABAgents => [
                    $CustomerUserIDs[0],
                ],
            },
            ChangeCABUpdateFail => 1,
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents    => [],
                CABCustomers => [],
            },
        },
        SearchTest => [2],
    },

    # Test for ChangeCABDelete
    {
        Description => 'Test checks ChangeCABDelete with valid params.',
        SourceData  => {
            ChangeAdd => {
                UserID    => $UserIDs[0],
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[1]
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
            ChangeCABDelete => 1,
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents    => [],
                CABCustomers => [],
            },
        },
        SearchTest => [2],
    },

    # Test for ChangeCABDelete
    {
        Description => 'Test checks ChangeCABDelete with invalid params.',
        SourceData  => {
            ChangeAdd => {
                UserID    => $UserIDs[0],
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[1]
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
            ChangeCABDelete     => 1,
            ChangeCABDeleteFail => 1,
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[1]
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
        },
        SearchTest => [ 2, 8, 9, 10 ],
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
            "Test $TestCount: No SourceData found for this test (test case: "
                . ( $TestCount - $TestCountMisc ) . ").",
        );

        next TEST;
    }

    # print test case description
    if ( $Test->{Description} ) {
        $Self->True(
            1,
            "Test $TestCount: $Test->{Description} (test case: "
                . ( $TestCount - $TestCountMisc ) . ").",
        );
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
            if ( $Test->{Fails} ) {
                $Self->False(
                    $ChangeID,
                    "Test $TestCount: ChangeAdd() - Add change should fail.",
                );
            }
            else {
                $Self->True(
                    $ChangeID,
                    "Test $TestCount: ChangeAdd() - Add change.",
                );
            }
        }
    }    # end if 'ChangeAdd'

    if ( exists $SourceData->{ChangeUpdate} ) {
        my $ChangeUpdateSuccess = $Self->{ChangeObject}->ChangeUpdate(
            ChangeID => $ChangeID,
            %{ $SourceData->{ChangeUpdate} },
        );

        if ( $Test->{Fails} ) {
            $Self->False(
                $ChangeUpdateSuccess,
                "Test $TestCount: ChangeUpdate()",
            );
        }
        else {
            $Self->True(
                $ChangeUpdateSuccess,
                "Test $TestCount: ChangeUpdate()",
            );
        }
    }    # end if ChangeUpdate

    if ( $SourceData->{ChangeCABUpdate} && $ChangeID ) {
        my $CABUpdateSuccess = $Self->{ChangeObject}->ChangeCABUpdate(
            %{ $SourceData->{ChangeCABUpdate} },
            ChangeID => $ChangeID,
            UserID   => 1,
        );

        my $IsSuccess = $CABUpdateSuccess || $SourceData->{ChangeCABUpdateFail};

        $Self->True(
            $IsSuccess,
            "Test $TestCount: |- ChangeCABUpdate",
        );
    }    # end if 'ChangeCABUpdate'

    if ( $SourceData->{ChangeCABDelete} && $ChangeID ) {
        my %CABDeleteParams = (
            UserID => 1,
        );

        $CABDeleteParams{ChangeID} = $ChangeID if !$SourceData->{ChangeCABDeleteFail};

        my $CABDeleteSuccess = $Self->{ChangeObject}->ChangeCABDelete(%CABDeleteParams);

        my $IsSuccess = $CABDeleteSuccess || $SourceData->{ChangeCABDeleteFail};

        $Self->True(
            $IsSuccess,
            "Test $TestCount: |- ChangeCABDelete",
        );
    }    # end if 'ChangeCABDelete'

    # get a change
    if ( exists $ReferenceData->{ChangeGet} ) {

        my $ChangeGetReferenceData = $ReferenceData->{ChangeGet};

        my $ChangeData = $Self->{ChangeObject}->ChangeGet(
            ChangeID => $ChangeID,
            UserID   => 1,
        );

        # ChangeGet should not return anything
        if ( !defined $ReferenceData->{ChangeGet} ) {
            $Self->False(
                $ChangeData,
                "Test $TestCount: |- Get change returns undef.",
            );

            # check if we excpected to fail
            if ( $Test->{Fails} ) {
                $Self->Is(
                    !defined $ChangeData,
                    !defined $ReferenceData->{ChangeData},
                    "Test $TestCount: |- Should fail.",
                );
            }
            next TEST;
        }

        for my $ChangeAttributes (qw(ChangeID ChangeNumber CreateTime ChangeTime)) {
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
    }    # end if 'ChangeGet'

    if ( $ReferenceData->{ChangeCABGet} ) {
        my $CABData = $Self->{ChangeObject}->ChangeCABGet(
            %{ $ReferenceData->{ChangeCABGet} },
            UserID   => 1,
            ChangeID => $ChangeID,
        );

        for my $Key ( keys %{ $ReferenceData->{ChangeCABGet} } ) {

            # turn off all pretty print
            $Data::Dumper::Indent = 0;
            $Data::Dumper::Useqq  = 1;

            # dump the attribute from VersionGet()
            my $ChangeAttribute = Data::Dumper::Dumper( $CABData->{$Key} );

            # dump the reference attribute
            my $ReferenceAttribute = Data::Dumper::Dumper( $ReferenceData->{ChangeCABGet}->{$Key} );

            $Self->Is(
                $ChangeAttribute,
                $ReferenceAttribute,
                "Test $TestCount: |- ChangeCABGet ( $Key )",
            );
        }
    }    # end if 'ChangeCABGet'
}
continue {
    $TestCount++;
}

# test for ChangeNumberLookup
my ($ChangeNumberLookupTestID) = keys %TestedChangeID;

if ($ChangeNumberLookupTestID) {
    my $ChangeData = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $ChangeNumberLookupTestID,
        UserID   => 1,
    );

    my $ChangeID = $Self->{ChangeObject}->ChangeNumberLookup(
        ChangeNumber => $ChangeData->{ChangeNumber},
        UserID       => 1,
    );

    $Self->Is(
        $ChangeID,
        $ChangeData->{ChangeID},
        'Test ' . $TestCount++ . ': ChangeNumberLookup with ChangeNumber '
            . $ChangeData->{ChangeNumber} . ' successful.',
    );

    my $ChangeNumber = $Self->{ChangeObject}->ChangeNumberLookup(
        ChangeID => $ChangeNumberLookupTestID,
        UserID   => 1,
    );

    $Self->Is(
        $ChangeNumber,
        $ChangeData->{ChangeNumber},
        'Test '
            . $TestCount++
            . ": ChangeNumberLookup with ChangeID $ChangeNumberLookupTestID successful.",
    );
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
my $NrCreateChanges = scalar @ChangeTests - $Fails;

# test if the changes where created
$Self->Is(
    keys %TestedChangeID || 0,
    $NrCreateChanges,
    'Test ' . $TestCount++ . ': amount of change objects and test cases.',
);

# ------------------------------------------------------------ #
# define general config item search tests
# ------------------------------------------------------------ #
my $SystemTime = $Self->{TimeObject}->SystemTime();

# get a sample change we created above for some 'special' test cases
my ($SearchTestID) = keys %TestedChangeID;
my $SearchTestChange = {};

if ($SearchTestID) {
    $SearchTestChange = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $SearchTestID,
        UserID   => 1,
    );
}

my @ChangeSearchTests = (

    # Nr 1 - a simple check if the search functions takes care of "Limit"
    {
        Description => 'Limit',
        SearchData  => {
            Limit => 1,
        },
        ResultData => {
            TestCount => 1,
            Count     => 1,
        },
    },

    # Nr 2 - search for all changes created by our first user
    {
        Description => 'Title, Justification',
        SearchData  => {
            Title         => 'Change 1',
            Justification => 'Justification 1',
        },
        ResultData => {
            TestCount => 1,
        },
    },

    # Nr 3 - test createtimenewerdate
    {
        Description => 'CreateTimeNewerDate',
        SearchData  => {
            CreateTimeNewerDate => $Self->{TimeObject}->SystemTime2TimeStamp(
                SystemTime => $SystemTime - ( 60 * 60 ),
            ),
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 4 - test createtimeolderdate
    {
        Description => 'CreateTimeOlderDate',
        SearchData  => {
            CreateTimeOlderDate => $Self->{TimeObject}->SystemTime2TimeStamp(
                SystemTime => $SystemTime + ( 60 * 60 ),
            ),
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 5 - test changeMANAGERid
    {
        Description => 'ChangeManagerID',
        SearchData  => {
            ChangeManagerID => $UserIDs[0],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 6 - test changeBUILDERid
    {
        Description => 'ChangeBuilderID',
        SearchData  => {
            ChangeBuilderID => $UserIDs[0],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 7 - test changeBUILDERid and changeMANAGERid
    {
        Description => 'ChangeBuilderID, ChangeManagerID',
        SearchData  => {
            ChangeBuilderID => $UserIDs[1],
            ChangeManagerID => $UserIDs[0],
        },
        ResultData => {
            TestCount => 1,
            Count     => 0,
        },
    },

    # Nr 8 - test CABAgent
    {
        Description => 'CABAgent',
        SearchData  => {
            CABAgent => $UserIDs[0],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 9 - test CABCustomer
    {
        Description => 'CABCustomer',
        SearchData  => {
            CABCustomer => $CustomerUserIDs[0],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 10 - test CABAgent and CABCustomer
    {
        Description => 'CABAgent, CABCustomer',
        SearchData  => {
            CABAgent    => $UserIDs[0],
            CABCustomer => $CustomerUserIDs[1],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 11 - test Justification
    {
        Description => 'Justification',
        SearchData  => {
            Justification => 'Z' x 3800,
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # XXX: WorkOrderAgentID, ChangeNumber
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

    $Self->True(
        1,
        'call ChangeSearch with params: ' . $SearchTest->{Description},
    );

    my $ChangeIDs = $Self->{ChangeObject}->ChangeSearch(
        %{ $SearchTest->{SearchData} },
        UserID => 1,
    );

    $Self->True(
        defined($ChangeIDs) && ref($ChangeIDs) eq 'ARRAY',
        "Test $TestCount: |- array reference for ChangeIDs.",
    );

    $ChangeIDs ||= [];

    if ( $SearchTest->{ResultData}->{TestCount} ) {

        # get number of change ids ChangeSearch should return
        my $Count = keys %{ $ChangeIDForSearchTest{$SearchTestCount} };
        $Count = $SearchTest->{ResultData}->{Count} if exists $SearchTest->{ResultData}->{Count};

        $Self->Is(
            scalar @{$ChangeIDs},
            $Count,
            "Test $TestCount: |- Number of found changes.",
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
                "Test $TestCount: |- ChangeID $ChangeID found in returned list.",
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
    $Self->True(
        $Self->{ChangeObject}->ChangeDelete(
            ChangeID => $ChangeID,
            UserID   => 1,
        ),
        "Test $TestCount++: ChangeDelete()",
    );
}

1;
