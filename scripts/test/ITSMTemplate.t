# --
# ITSMTemplate.t - change tests
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: ITSMTemplate.t,v 1.6 2011/02/05 14:22:53 bes Exp $
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
use List::Util qw(max);

use Kernel::System::CustomerUser;
use Kernel::System::ITSMChange;
use Kernel::System::ITSMChange::ITSMCondition;
use Kernel::System::ITSMChange::ITSMWorkOrder;
use Kernel::System::ITSMChange::Template;
use Kernel::System::Valid;

# ---------------------------------------------------------------------------- #
# Note for developers:
# Please note that the keys in %ChangeDefinitions (resp. WorkOrderDefinitions )
# have to be identical with the key names in %TemplateDefinitions
# ---------------------------------------------------------------------------- #

# ------------------------------------------------------------ #
# make preparations
# ------------------------------------------------------------ #
my $TestCount = 1;

# create common objects
$Self->{ChangeObject}       = Kernel::System::ITSMChange->new( %{$Self} );
$Self->{ConditionObject}    = Kernel::System::ITSMChange::ITSMCondition->new( %{$Self} );
$Self->{CustomerUserObject} = Kernel::System::CustomerUser->new( %{$Self} );
$Self->{WorkOrderObject}    = Kernel::System::ITSMChange::ITSMWorkOrder->new( %{$Self} );
$Self->{TemplateObject}     = Kernel::System::ITSMChange::Template->new( %{$Self} );
$Self->{ValidObject}        = Kernel::System::Valid->new( %{$Self} );

# test if change object was created successfully
$Self->True(
    $Self->{TemplateObject},
    "Test " . $TestCount++ . ' - construction of template object',
);
$Self->Is(
    ref $Self->{TemplateObject},
    'Kernel::System::ITSMChange::Template',
    "Test " . $TestCount++ . ' - class of template object',
);

# ------------------------------------------------------------ #
# create needed users and customer users
# ------------------------------------------------------------ #
my @CustomerUserIDs;    # a list of existing and valid customer user ids, a list of strings

# disable email checks to create new user
my $CheckEmailAddressesOrg = $Self->{ConfigObject}->Get('CheckEmailAddresses');
if ( !defined $CheckEmailAddressesOrg ) {
    $CheckEmailAddressesOrg = 1;
}
$Self->{ConfigObject}->Set(
    Key   => 'CheckEmailAddresses',
    Value => 0,
);

for my $Counter ( 1 .. 3 ) {

    # create new customers for the tests
    my $CustomerUserID = $Self->{CustomerUserObject}->CustomerUserAdd(
        Source         => 'CustomerUser',
        UserFirstname  => 'ITSMChangeCustomer' . $Counter,
        UserLastname   => 'UnitTestCustomer',
        UserCustomerID => 'UCT' . $Counter . int rand 1_000_000,
        UserLogin      => 'UnitTest-ITSMTemplate-Customer-' . $Counter . int rand 1_000_000,
        UserEmail      => 'UnitTest-ITSMTemplate-Customer-'
            . $Counter
            . int( rand 1_000_000 )
            . '@localhost',
        ValidID => $Self->{ValidObject}->ValidLookup( Valid => 'valid' ),
        UserID => 1,
    );
    push @CustomerUserIDs, $CustomerUserID;
}

# ------------------------------------------------------------ #
# test Template API
# ------------------------------------------------------------ #

# define public interface (in alphabetical order)
my @ObjectMethods = qw(
    TemplateAdd
    TemplateDelete
    TemplateUpdate
    TemplateSearch
    TemplateSerialize
    TemplateDeSerialize
    TemplateTypeLookup
    TemplateList
    TemplateGet
);

# check if subs are available
for my $ObjectMethod (@ObjectMethods) {
    $Self->True(
        $Self->{TemplateObject}->can($ObjectMethod),
        "Test " . $TestCount++ . " - check 'can $ObjectMethod'",
    );
}

# ------------------------------------------------------------ #
# search for default Template types
# ------------------------------------------------------------ #

# define default Template types
my @DefaultTypes = qw(
    ITSMChange
    ITSMWorkOrder
    ITSMCondition
    CAB
);

# investigate the default types
for my $Type (@DefaultTypes) {

    # look up the state name
    my $LookedUpTypeID = $Self->{TemplateObject}->TemplateTypeLookup(
        TemplateType => $Type,
    );

    $Self->True(
        $LookedUpTypeID,
        "Look up type '$Type'",
    );

    # do the reverse lookup
    my $LookedUpType = $Self->{TemplateObject}->TemplateTypeLookup(
        TemplateTypeID => $LookedUpTypeID,
    );

    $Self->Is(
        $LookedUpType,
        $Type,
        "Look up type id '$LookedUpTypeID'",
    );
}

# now some param checks for ChangeStateLookup
my $LookupOk = $Self->{TemplateObject}->TemplateTypeLookup();

$Self->False(
    $LookupOk,
    'No params passed to TemplateTypeLookup()',
);

$LookupOk = $Self->{TemplateObject}->TemplateTypeLookup(
    TemplateType   => 'approved',
    TemplateTypeID => 2,
);

$Self->False(
    $LookupOk,
    'Exclusive params passed to TemplateTypeLookup()',
);

$LookupOk = $Self->{TemplateObject}->TemplateTypeLookup(
    TemplateTypes => 'ITSMAnything',
);

$Self->False(
    $LookupOk,
    "Incorrect param 'TemplateTypes' passed to TemplateTypeLookup()",
);

# ------------------------------------------------------------ #
# general template tests
# ------------------------------------------------------------ #

# store current TestCount for better test case recognition
my $TestCountMisc = $TestCount;

# An unique indentifier, so that data from different test runs
# won't be mixed up. The string is formated to a constant length,
# as the conversion to plain text with ToAscii() depends on the string length.
my $UniqueSignature = sprintf 'UnitTest-ITSMTemplate-%06d_%010d',
    int( rand 1_000_000 ),
    time();

my %ChangeDefinitions = (
    BaseChange => {
        ChangeTitle     => 'ASCII Change - Title - ' . $UniqueSignature,
        Description     => 'ASCII Change - Description - ' . $UniqueSignature,
        Justification   => 'ASCII Change - Justification - ' . $UniqueSignature,
        ChangeManagerID => 1,
        ChangeBuilderID => 1,
        CABAgents       => [
            1,
        ],
        CABCustomers => [
            @CustomerUserIDs,
        ],
    },
    UnicodeChange => {
        ChangeTitle   => "Unicode Change - Title äöü - $UniqueSignature",
        Description   => 'Unicode Change - Description - ' . $UniqueSignature,
        Justification => "Unicode Change - Justification "
            . "\x{167}\x{b6}\x{20ac}\@\x{142}\x{142}\x{138}j\x{f0}\x{b5}\x{ab}\x{df}\x{bb} "
            . "- $UniqueSignature",
        ChangeManagerID => 1,
        ChangeBuilderID => 1,
        CABAgents       => [
            1,
        ],
    },
    ContainerChange => {
        ChangeTitle     => 'Container Change - Title - ' . $UniqueSignature,
        Description     => 'Container Change - Description - ' . $UniqueSignature,
        Justification   => 'Container Change - Justification - ' . $UniqueSignature,
        ChangeManagerID => 1,
        ChangeBuilderID => 1,
        CABAgents       => [
            1,
        ],
    },
    TargetChange => {
        ChangeTitle     => 'Target Change - Title - ' . $UniqueSignature,
        Description     => 'Target Change - Description - ' . $UniqueSignature,
        Justification   => 'Target Change - Justification - ' . $UniqueSignature,
        ChangeManagerID => 1,
        ChangeBuilderID => 1,
        CABAgents       => [
            1,
        ],
    },
);

# create change that should act as the base for the template test
my %CreatedChangeID;

for my $ChangeName ( keys %ChangeDefinitions ) {
    $CreatedChangeID{$ChangeName} = $Self->{ChangeObject}->ChangeAdd(
        %{ $ChangeDefinitions{$ChangeName} },
        UserID => 1,
    );

    $Self->True(
        $CreatedChangeID{$ChangeName},
        "Test $TestCount: ChangeAdd() - $CreatedChangeID{$ChangeName} created ($ChangeName)",
    );
}

for my $ChangeName ( keys %CreatedChangeID ) {
    my $ChangeID = $CreatedChangeID{$ChangeName};

    $Self->True(
        $ChangeID,
        "Test $TestCount: ChangeAdd() - $ChangeID created ($ChangeName)",
    );

    my $Change = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $CreatedChangeID{$ChangeName},
        UserID   => 1,
    );

    # check change attributes
    for my $RequestedAttribute ( keys %{ $ChangeDefinitions{$ChangeName} } ) {

        # turn off all pretty print
        local $Data::Dumper::Indent = 0;
        local $Data::Dumper::Useqq  = 1;

        # dump the attribute from ChangeGet()
        my $ChangeAttribute = Data::Dumper::Dumper( $Change->{$RequestedAttribute} );

        # dump the reference attribute
        my $ReferenceAttribute
            = Data::Dumper::Dumper( $ChangeDefinitions{$ChangeName}->{$RequestedAttribute} );

        $Self->Is(
            $ChangeAttribute,
            $ReferenceAttribute,
            "Test $TestCount: |- $RequestedAttribute (ChangeID: $ChangeID)",
        );
    }

    $TestCount++;
}

# add workorders
my %WorkOrderDefinitions = (
    ASCIIWorkOrder => {
        ChangeID       => $CreatedChangeID{ContainerChange},
        WorkOrderTitle => 'Just an ASCII workorder title - ' . $UniqueSignature,
    },
    UmlautsWorkOrder => {
        ChangeID       => $CreatedChangeID{ContainerChange},
        WorkOrderTitle => 'Workorder title with german umlauts äöü- ' . $UniqueSignature,
    },
    UnicodeWorkOrder => {
        ChangeID       => $CreatedChangeID{ContainerChange},
        WorkOrderTitle => 'Workorder title with unicode chars \x{167}\x{b6}\x{20ac} - '
            . $UniqueSignature,
    },
);

my %CreatedWorkOrderID;
for my $WorkOrderName ( keys %WorkOrderDefinitions ) {

    # add workorder
    $CreatedWorkOrderID{$WorkOrderName} = $Self->{WorkOrderObject}->WorkOrderAdd(
        %{ $WorkOrderDefinitions{$WorkOrderName} },
        UserID => 1,
    );

    my $WorkOrderID = $CreatedWorkOrderID{$WorkOrderName};

    # get workorder
    my $WorkOrder = $Self->{WorkOrderObject}->WorkOrderGet(
        WorkOrderID => $WorkOrderID,
        UserID      => 1,
    );

    # check workorder attributes
    for my $RequestedAttribute ( keys %{ $WorkOrderDefinitions{$WorkOrderName} } ) {

        # turn off all pretty print
        local $Data::Dumper::Indent = 0;
        local $Data::Dumper::Useqq  = 1;

        # dump the attribute from ChangeGet()
        my $WorkOrderAttribute = Data::Dumper::Dumper( $WorkOrder->{$RequestedAttribute} );

        # dump the reference attribute
        my $ReferenceAttribute
            = Data::Dumper::Dumper( $WorkOrderDefinitions{$WorkOrderName}->{$RequestedAttribute} );

        $Self->Is(
            $WorkOrderAttribute,
            $ReferenceAttribute,
            "Test $TestCount: |- $RequestedAttribute (WorkOrderID: $WorkOrderID)",
        );

        $TestCount++;
    }
}

# add conditions
my %ConditionDefinitions = (
    SimpleCondition => {
        ConditionAdd => {
            ChangeID              => $CreatedChangeID{BaseChange},
            Name                  => 'Simple Condition - ' . $UniqueSignature,
            ExpressionConjunction => 'all',
            ValidID               => $Self->{ValidObject}->ValidLookup( Valid => 'valid' ),
            UserID                => 1,
        },
        ExpressionAdd => {
            ObjectID => {
                ObjectLookup => {
                    Name => 'ITSMChange',
                },
            },
            AttributeID => {
                AttributeLookup => {
                    Name => 'ChangeTitle',
                },
            },
            OperatorID => {
                OperatorLookup => {
                    Name => 'is',
                },
            },

            # static fields
            #ConditionID  => ..., # This is filled by following code
            Selector     => $CreatedChangeID{BaseChange},
            CompareValue => 'DummyCompareValue1',
            UserID       => 1,
        },
        ActionAdd => {
            ObjectID => {
                ObjectLookup => {
                    Name   => 'ITSMChange',
                    UserID => 1,
                },
            },
            AttributeID => {
                AttributeLookup => {
                    Name   => 'ChangeTitle',
                    UserID => 1,
                },
            },
            OperatorID => {
                OperatorLookup => {
                    Name   => 'set',
                    UserID => 1,
                },
            },

            # static fields
            #ConditionID  => ..., # This is filled by following code
            Selector    => $CreatedChangeID{BaseChange},
            ActionValue => 'New Change Title' . $UniqueSignature . int rand 1_000,
            UserID      => 1,
            }
    },
);

my %CreatedConditionID;

CONDITIONNAME:
for my $ConditionName ( keys %ConditionDefinitions ) {
    my $ConditionData = $ConditionDefinitions{$ConditionName}->{ConditionAdd};
    my $ConditionID   = $Self->{ConditionObject}->ConditionAdd(
        %{$ConditionData},
    );

    $Self->True(
        $ConditionID,
        "Test $TestCount: Add Condition $ConditionName",
    );

    next CONDITIONNAME if !$ConditionID;

    $CreatedConditionID{$ConditionName} = $ConditionID;

    my $ExpressionData = $ConditionDefinitions{$ConditionName}->{ExpressionAdd};
    my $ExpressionID = _ExpressionAdd( $ExpressionData, $ConditionID );

    my $ActionData = $ConditionDefinitions{$ConditionName}->{ActionAdd};
    my $ActionID = _ActionAdd( $ActionData, $ConditionID );
}
continue {
    $TestCount++;
}

# ------------------------------- #
# create templates
# ------------------------------- #
my %TestedTemplateID;
my %TestedTemplateStrings;

my %TemplateDefinitions = (
    BaseChange => {
        Name     => 'Base Change Template - ' . $UniqueSignature,
        Type     => 'ITSMChange',
        ValidID  => $Self->{ValidObject}->ValidLookup( Valid => 'valid' ),
        ChangeID => $CreatedChangeID{BaseChange},
        UserID   => 1,
    },
    UnicodeChange => {
        Name     => 'Unicode Change Template - ' . $UniqueSignature,
        Type     => 'ITSMChange',
        ValidID  => $Self->{ValidObject}->ValidLookup( Valid => 'valid' ),
        ChangeID => $CreatedChangeID{UnicodeChange},
        UserID   => 1,
    },
    ASCIIWorkOrder => {
        Name        => 'Ascii WorkOrder Template - ' . $UniqueSignature,
        Type        => 'ITSMWorkOrder',
        ValidID     => $Self->{ValidObject}->ValidLookup( Valid => 'valid' ),
        WorkOrderID => $CreatedWorkOrderID{ASCIIWorkOrder},
        UserID      => 1,
    },
    UmlautsWorkOrder => {
        Name        => 'Umlauts WorkOrder Template - ' . $UniqueSignature,
        Type        => 'ITSMWorkOrder',
        ValidID     => $Self->{ValidObject}->ValidLookup( Valid => 'valid' ),
        WorkOrderID => $CreatedWorkOrderID{UmlautsWorkOrder},
        UserID      => 1,
    },
    UnicodeWorkOrder => {
        Name        => 'Unicode WorkOrder Template - ' . $UniqueSignature,
        Type        => 'ITSMWorkOrder',
        ValidID     => $Self->{ValidObject}->ValidLookup( Valid => 'valid' ),
        WorkOrderID => $CreatedWorkOrderID{UnicodeWorkOrder},
        UserID      => 1,
    },
    CABCustomerAgent => {
        Name     => 'Customer and Agent CAB Template - ' . $UniqueSignature,
        Type     => 'CAB',
        ValidID  => $Self->{ValidObject}->ValidLookup( Valid => 'valid' ),
        ChangeID => $CreatedChangeID{BaseChange},
        UserID   => 1,
    },
    SimpleCondition => {
        Name        => 'Simple Condition Template - ' . $UniqueSignature,
        Type        => 'ITSMCondition',
        ValidID     => $Self->{ValidObject}->ValidLookup( Valid => 'valid' ),
        ConditionID => $CreatedConditionID{SimpleCondition},
        UserID      => 1,
    },
);

for my $TemplateDefinitionName ( keys %TemplateDefinitions ) {

    # create simple change template
    $TemplateDefinitions{$TemplateDefinitionName}->{Content} =
        $Self->{TemplateObject}->TemplateSerialize(
        %{ $TemplateDefinitions{$TemplateDefinitionName} },
        TemplateType => $TemplateDefinitions{$TemplateDefinitionName}->{Type},
        );

    # check serialization
    $Self->True(
        $TemplateDefinitions{$TemplateDefinitionName}->{Content},
        "Test $TestCount: TemplateSerialize for $TemplateDefinitionName",
    );

    # add template
    $TestedTemplateID{$TemplateDefinitionName} = $Self->{TemplateObject}->TemplateAdd(
        %{ $TemplateDefinitions{$TemplateDefinitionName} },
        TemplateType => $TemplateDefinitions{$TemplateDefinitionName}->{Type},
    );

    my $TemplateID = $TestedTemplateID{$TemplateDefinitionName};

    # check template ID
    $Self->True(
        $TemplateID,
        "Test $TestCount: |- TemplateAdd for $TemplateDefinitionName",
    );

    # get created template
    my $Template = $Self->{TemplateObject}->TemplateGet(
        TemplateID => $TemplateID,
        UserID     => 1,
    );

    # check template attributes name, type and content
    for my $Attribute (qw(Name Type Content)) {
        $Self->Is(
            $Template->{$Attribute},
            $TemplateDefinitions{$TemplateDefinitionName}->{$Attribute},
            "Test $TestCount: |- $Attribute (TemplateID: $TemplateID)",
        );
    }

    $TestCount++;
}

# create objects based on templates
my @ChangeIDs;

CHANGETEMPLATENAME:
for my $ChangeTemplateName ( keys %CreatedChangeID ) {

    # get template id
    my $TemplateID = $TestedTemplateID{$ChangeTemplateName};

    next CHANGETEMPLATENAME if !$TemplateID;

    # deserialize template
    my $ChangeID = $Self->{TemplateObject}->TemplateDeSerialize(
        TemplateID => $TemplateID,
        UserID     => 1,
    );

    # check change id
    $Self->True(
        $ChangeID,
        "Test $TestCount: Create change based on template (TemplateID: $TemplateID)",
    );

    # get change data
    my $Change = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => 1,
    );

    # check change attributes
    for my $RequestedAttribute ( keys %{ $ChangeDefinitions{$ChangeTemplateName} } ) {

        # turn off all pretty print
        local $Data::Dumper::Indent = 0;
        local $Data::Dumper::Useqq  = 1;

        # dump the attribute from ChangeGet()
        my $ChangeAttribute = Data::Dumper::Dumper( $Change->{$RequestedAttribute} );

        # dump the reference attribute
        my $ReferenceAttribute
            = Data::Dumper::Dumper(
            $ChangeDefinitions{$ChangeTemplateName}->{$RequestedAttribute}
            );

        $Self->Is(
            $ChangeAttribute,
            $ReferenceAttribute,
            "Test $TestCount: |- $RequestedAttribute (ChangeID: $ChangeID)",
        );
    }

    push @ChangeIDs, $ChangeID;

    $TestCount++;
}

WORKORDERTEMPLATENAME:
for my $WorkOrderTemplateName ( keys %CreatedWorkOrderID ) {

    # get template id
    my $TemplateID = $TestedTemplateID{$WorkOrderTemplateName};

    next WORKORDERTEMPLATENAME if !$TemplateID;

    # deserialize template
    my $WorkOrderID = $Self->{TemplateObject}->TemplateDeSerialize(
        TemplateID => $TemplateID,
        ChangeID   => $CreatedChangeID{TargetChange},
        UserID     => 1,
    );

    # check workorder id
    $Self->True(
        $WorkOrderID,
        "Test $TestCount: Create workorder based on template (TemplateID: $TemplateID)",
    );

    # get workorder data
    my $WorkOrder = $Self->{WorkOrderObject}->WorkOrderGet(
        WorkOrderID => $WorkOrderID,
        UserID      => 1,
    );

    # check workorder attributes
    REQUESTEDATTRIBUTE:
    for my $RequestedAttribute ( keys %{ $WorkOrderDefinitions{$WorkOrderTemplateName} } ) {

        next REQUESTEDATTRIBUTE if $RequestedAttribute eq 'ChangeID';

        # turn off all pretty print
        local $Data::Dumper::Indent = 0;
        local $Data::Dumper::Useqq  = 1;

        # dump the attribute from ChangeGet()
        my $WorkOrderAttribute = Data::Dumper::Dumper( $WorkOrder->{$RequestedAttribute} );

        # dump the reference attribute
        my $ReferenceAttribute
            = Data::Dumper::Dumper(
            $WorkOrderDefinitions{$WorkOrderTemplateName}->{$RequestedAttribute}
            );

        $Self->Is(
            $WorkOrderAttribute,
            $ReferenceAttribute,
            "Test $TestCount: |- $RequestedAttribute (WorkOrder: $WorkOrderID)",
        );
    }

    $Self->Is(
        $WorkOrder->{ChangeID},
        $CreatedChangeID{TargetChange},
        "Test $TestCount: |- ChangeID (WorkOrder: $WorkOrderID)",
    );

    $TestCount++;
}

CONDITIONTEMPLATENAME:
for my $ConditionTemplateName ( keys %CreatedConditionID ) {

    # get template id
    my $TemplateID = $TestedTemplateID{$ConditionTemplateName};

    next CONDITIONTEMPLATENAME if !$TemplateID;

    # deserialize template
    my $ConditionID = $Self->{TemplateObject}->TemplateDeSerialize(
        TemplateID => $TemplateID,
        ChangeID   => $CreatedChangeID{TargetChange},
        UserID     => 1,
    );

    # check change id
    $Self->True(
        $ConditionID,
        "Test $TestCount: Create condition based on template (TemplateID: $TemplateID)",
    );

    $TestCount++;
}

# get names of CAB templates
my @CABTemplateNames = grep { $TemplateDefinitions{$_}->{Type} eq 'CAB' } keys %TestedTemplateID;

CABTEMPLATENAME:
for my $CABTemplateName (@CABTemplateNames) {

    # get template id
    my $TemplateID = $TestedTemplateID{$CABTemplateName};

    next CABTEMPLATENAME if !$TemplateID;

    # deserialize template
    my $ChangeID = $Self->{TemplateObject}->TemplateDeSerialize(
        TemplateID => $TemplateID,
        UserID     => 1,
        ChangeID   => $CreatedChangeID{TargetChange},
    );

    # check change id
    $Self->True(
        $ChangeID,
        "Test $TestCount: Create CAB based on template (TemplateID: $TemplateID)",
    );

    # get change data
    my $Change = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => 1,
    );

    # get original change
    my $OrigChange = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $CreatedChangeID{BaseChange},
        UserID   => 1,
    );

    # turn off all pretty print
    local $Data::Dumper::Indent = 0;
    local $Data::Dumper::Useqq  = 1;

    # dump the attribute from ChangeGet()
    my $ChangeAttribute = Data::Dumper::Dumper(
        [ $Change->{CABAgents}, $Change->{CABCustomers}, ]
    );

    # dump the reference attribute
    my $ReferenceAttribute = Data::Dumper::Dumper(
        [ $OrigChange->{CABAgents}, $OrigChange->{CABCustomers}, ]
    );

    $Self->Is(
        $ChangeAttribute,
        $ReferenceAttribute,
        "Test $TestCount: |- CAB from template (ChangeID: $ChangeID)",
    );

    $TestCount++;
}

# ------------------------------------------------------------ #
# test
# ------------------------------------------------------------ #

# test TemplateList()
my $ChangeTemplateList = $Self->{TemplateObject}->TemplateList(
    TemplateType => 'ITSMChange',
    UserID       => 1,
);

my @ChangeTemplateNames = grep {
    $TemplateDefinitions{$_}->{Type} eq 'ITSMChange'
} keys %TestedTemplateID;

for my $ChangeTemplateName (@ChangeTemplateNames) {
    my $TemplateID = $TestedTemplateID{$ChangeTemplateName};

    $Self->True(
        exists $ChangeTemplateList->{$TemplateID},
        "Test $TestCount: |- Check ChangeTemplate $TemplateID in TemplateList",
    );

    $TestCount++;
}

my @WorkOrderTemplateNames = grep {
    $TemplateDefinitions{$_}->{Type} eq 'ITSMWorkOrder'
} keys %TestedTemplateID;

my $WorkOrderTemplateList = $Self->{TemplateObject}->TemplateList(
    TemplateType => 'ITSMWorkOrder',
    UserID       => 1,
);

for my $WorkOrderTemplateName (@WorkOrderTemplateNames) {
    my $TemplateID = $TestedTemplateID{$WorkOrderTemplateName};

    $Self->True(
        exists $WorkOrderTemplateList->{$TemplateID},
        "Test $TestCount: |- Check WorkOrderTemplate $TemplateID in TemplateList",
    );

    $TestCount++;
}

my @ConditionTemplateNames = grep {
    $TemplateDefinitions{$_}->{Type} eq 'ITSMCondition'
} keys %TestedTemplateID;

my $ConditionTemplateList = $Self->{TemplateObject}->TemplateList(
    TemplateType => 'ITSMCondition',
    UserID       => 1,
);

for my $ConditionTemplateName (@ConditionTemplateNames) {
    my $TemplateID = $TestedTemplateID{$ConditionTemplateName};

    $Self->True(
        exists $ConditionTemplateList->{$TemplateID},
        "Test $TestCount: |- Check ConditionTemplate $TemplateID in TemplateList",
    );

    $TestCount++;
}

my $CABTemplateList = $Self->{TemplateObject}->TemplateList(
    TemplateType => 'CAB',
    UserID       => 1,
);

for my $CABTemplateName (@CABTemplateNames) {
    my $TemplateID = $TestedTemplateID{$CABTemplateName};

    $Self->True(
        exists $CABTemplateList->{$TemplateID},
        "Test $TestCount: |- Check CABTemplate $TemplateID in TemplateList",
    );

    $TestCount++;
}

# test TemplateSearch()

# test TemplateUpdate()
my %NewValues;

# ------------------------------------------------------------ #
# clean the system
# ------------------------------------------------------------ #

# restore original email check param
$Self->{ConfigObject}->Set(
    Key   => 'CheckEmailAddresses',
    Value => $CheckEmailAddressesOrg,
);

# delete the test templates
for my $TemplateName ( keys %TestedTemplateID ) {
    my $TemplateID = $TestedTemplateID{$TemplateName};

    my $DeleteOk = $Self->{TemplateObject}->TemplateDelete(
        TemplateID => $TemplateID,
        UserID     => 1,
    );
    $Self->True(
        $DeleteOk,
        "Test $TestCount: TemplateDelete()"
    );

    # double check if change is really deleted
    my $TemplateData = $Self->{TemplateObject}->TemplateGet(
        TemplateID => $TemplateID,
        UserID     => 1,
    );

    $Self->False(
        $TemplateData->{TemplateID},
        "Test $TestCount: TemplateDelete() - double check",
    );
}
continue {
    $TestCount++;
}

# delete the test changes
for my $ChangeID ( @ChangeIDs, values %CreatedChangeID ) {
    my $DeleteOk = $Self->{ChangeObject}->ChangeDelete(
        ChangeID => $ChangeID,
        UserID   => 1,
    );
    $Self->True(
        $DeleteOk,
        "Test $TestCount: ChangeDelete()"
    );

    # double check if change is really deleted
    my $ChangeData = $Self->{ChangeObject}->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => 1,
    );

    $Self->False(
        $ChangeData->{ChangeID},
        "Test $TestCount: ChangeDelete() - double check",
    );
}
continue {
    $TestCount++;
}

sub _ActionAdd {
    my ( $ActionData, $ConditionID ) = @_;

    return if !$ActionData;
    return if ref $ActionData ne 'HASH';

    # hash for adding
    my %ActionAdd;

    # set static fields
    my @StaticFields = qw( Selector ActionValue UserID ConditionID );

    STATICFIELD:
    for my $StaticField (@StaticFields) {

        # ommit static field if it is not set
        next STATICFIELD if !exists $ActionData->{$StaticField};
        next STATICFIELD if !defined $ActionData->{$StaticField};

        # safe data
        $ActionAdd{$StaticField} = $ActionData->{$StaticField};
    }

    # get all fields for ActionAdd
    for my $ActionAddValue ( keys %{$ActionData} ) {

        # ommit static fields
        next if grep { $_ eq $ActionAddValue } @StaticFields;

        # get values for fields
        for my $FieldValue ( keys %{ $ActionData->{$ActionAddValue} } ) {

            # store gathered information in hash for adding
            $ActionAdd{$ActionAddValue}
                = $Self->{ConditionObject}->$FieldValue(
                %{ $ActionData->{$ActionAddValue}->{$FieldValue} },
                );
        }
    }

    # add action
    my $ActionID = $Self->{ConditionObject}->ActionAdd(
        %ActionAdd,
        ConditionID => $ConditionID,
    ) || 0;

    $Self->True(
        $ActionID,
        'Test ' . $TestCount++ . " - ActionAdd -> $ActionID",
    );

    # check for ActionID
    return if !$ActionID;

    # check the added action
    my $ActionGet = $Self->{ConditionObject}->ActionGet(
        ActionID => $ActionID,
        UserID   => $ActionAdd{UserID},
    );
    $Self->True(
        $ActionGet,
        'Test ' . $TestCount++ . ' - ActionAdd(): ActionGet',
    );

    # delete UserID, it is not returned
    delete $ActionAdd{UserID};

    # test values
    for my $TestValue ( keys %ActionAdd ) {
        $Self->Is(
            $ActionGet->{$TestValue},
            $ActionAdd{$TestValue},
            'Test ' . $TestCount++ . " - ActionAdd(): ActionGet -> $TestValue",
        );
    }

    return $ActionID;
}

sub _ExpressionAdd {
    my ( $ExpressionData, $ConditionID ) = @_;
    my %ExpressionAddSourceData = %{$ExpressionData};

    my %ExpressionAddData;

    # set static fields
    my @StaticFields = qw( Selector CompareValue UserID ConditionID );

    STATICFIELD:
    for my $StaticField (@StaticFields) {

        # ommit static field if it is not set
        next STATICFIELD if !exists $ExpressionAddSourceData{$StaticField}
                || !defined $ExpressionAddSourceData{$StaticField};

        # safe data
        $ExpressionAddData{$StaticField} = $ExpressionAddSourceData{$StaticField};
    }

    # get all fields for ExpressionAdd
    for my $ExpressionAddValue ( keys %ExpressionAddSourceData ) {

        # ommit static fields
        next if grep { $_ eq $ExpressionAddValue } @StaticFields;

        # get values for fields
        for my $FieldValue ( keys %{ $ExpressionAddSourceData{$ExpressionAddValue} } ) {

            # store gathered information in hash for adding
            $ExpressionAddData{$ExpressionAddValue} =
                $Self->{ConditionObject}->$FieldValue(
                %{ $ExpressionAddSourceData{$ExpressionAddValue}->{$FieldValue} },
                );
        }
    }

    # add expression
    my $ExpressionID = $Self->{ConditionObject}->ExpressionAdd(
        %ExpressionAddData,
        ConditionID => $ConditionID,
    ) || 0;

    $Self->True(
        $ExpressionID,
        'Test ' . $TestCount++ . " - $ExpressionID",
    );

    next CREATEDATA if !$ExpressionID;

    # check the added expression
    my $ExpressionGetData = $Self->{ConditionObject}->ExpressionGet(
        ExpressionID => $ExpressionID,
        UserID       => $ExpressionAddData{UserID},
    );
    $Self->True(
        $ExpressionGetData,
        'Test ' . $TestCount++ . ' - ExpressionAdd(): ExpressionGet',
    );

    # test values
    delete $ExpressionAddData{UserID};
    for my $TestValue ( keys %ExpressionAddData ) {
        $Self->Is(
            $ExpressionGetData->{$TestValue},
            $ExpressionAddData{$TestValue},
            'Test ' . $TestCount++ . " - ExpressionAdd(): ExpressionGet -> $TestValue",
        );
    }

    return $ExpressionID;
}

1;
