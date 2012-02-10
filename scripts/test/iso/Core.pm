package Kernel::System::Web::Request; # -*- perl -*-
use strict;
use warnings;
sub SetParam {
    my ( $Self, %Param ) = @_;
    my $Value = $Param{Value};
    $Self->{Query}->param( $Param{Param}, $Value );
    return $Value;
}

package Core; # -*- perl -*-
use strict;
use warnings;
use basetest;
use vars qw($VERSION);
$VERSION = qw($Revision: 1.16 $) [1];

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
use Kernel::System::iPhone;
use JSON::PP;
use Kernel::System::Web::Request;
use Kernel::Language;
use Kernel::System::DynamicField;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );
    my $phone = basetest::NewPhone();

    $Self->{iPhoneObject}=$phone ;
    $Self->{JSONObject}         = Kernel::System::JSON->new( %{$phone} );
    $Self->{ParamObject}        = Kernel::System::Web::Request->new( %{$phone} );
    $Self->{ConfigObject}       = $phone->{ConfigObject};
    $Self->{LogObject}       = $phone->{LogObject};
    $Self->{DBObject}       = $phone->{DBObject};
    $Self->{UserObject}       = $phone->{UserObject};
    $Self->{GroupObject}       = $phone->{GroupObject};
    $Self->{MainObject}       = $phone->{MainObject};
    $Self->{EncodeObject}       = $phone->{EncodeObject};
    $Self->{TimeObject}       = $phone->{TimeObject};

    return $Self;
}

sub Dispatch {
    my ($Self) = @_;

    # get log filename
    $Self->{DebugLogFile} = $Self->{ConfigObject}->Get('iPhone::LogFile') || '';

    # set common variables
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

    # inbound log
    if ( $Self->{ConfigObject}->Get('iPhone::DebugLog') ) {
        my $Message = 'User=' . $User . '&Password=****' . '&Object=' . $Object
            . '&Method=' . $Method . '&Data=' . $Data;

        $Self->Log(
            Direction => 'Inbound',
            Message   => $Message,
        );
    }

    # agent auth
    my %ParamFixed;
    if (1) {
        my $AuthObject = Kernel::System::Auth->new( %{$Self} );
        my $UserLogin = $AuthObject->Auth( User => $User, Pw => $Pw );

        if ( !$UserLogin ) {
            $Self->{LogObject}->Log(
                Priority => 'notice',
                Message  => "Auth for user $User failed!",
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
                Message  => "Auth for user $User failed!",
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

    # object white list
    my $ObjectWhiteList = $Self->{ConfigObject}->Get('iPhone::API::Object');
    if ($ObjectWhiteList) {
        if ( !defined $ObjectWhiteList->{$Object} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No access to '$Object'!",
            );
            return $Self->Result();
        }
        if ( $ObjectWhiteList->{$Object} && $Method !~ /$ObjectWhiteList->{$Object}/ ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No access method '$Method' of '$Object'!",
            );
            return $Self->Result();
        }
    }

    # ticket permission check
    basetest::RunConfig($Self->{iPhoneObject});

    if ( $Object eq 'CustomObject' ) {
        my @Result = $Self->{iPhoneObject}->$Method(
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
        if ( @{$Result} ) {
            if ( @{$Result}[0] eq -1 ) {
                $ResultProtocol{Result} = 'failed';
                for my $Key (qw(error notice)) {
                    $ResultProtocol{Message} = $Self->{LogObject}->GetLogEntry(
                        Type => $Key,
                        What => 'Message',
                    );
                    last if $ResultProtocol{Message};
                }
            }

            else {
                $ResultProtocol{Result} = 'successful';
                $ResultProtocol{Data}   = $Result;
            }
        }

        else {
            $ResultProtocol{Result} = 'successful';
            $ResultProtocol{Data}   = $Result;
        }
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

    # set result to a variable for easy log output
    my $JSONResult = $Self->{JSONObject}->Encode( Data => \%ResultProtocol );

    # outbound log
    if ( $Self->{ConfigObject}->Get('iPhone::DebugLog') ) {

        $Self->Log(
            Direction => 'Outbound',
            Message   => $JSONResult,
            )
    }

    return $JSONResult;
}

sub Log {
    my ( $Self, %Param ) = @_;

    my $FH;

    # open logfile
    if ( !open $FH, '>>', $Self->{DebugLogFile} ) {

        # print error screen
        print STDERR "\n";
        print STDERR " >> Can't write $Self->{LogFile}: $! <<\n";
        print STDERR "\n";
        return;
    }

    # write log file
    print $FH '[' . $Self->{TimeObject}->CurrentTimestamp() . ']';
    print $FH "[Debug] [$Param{Direction}] [$Param{Message}\n";

    # close file handle
    close $FH;
    return 1;
}

sub CreateTestUsers
{
# create needed users
    my $Self=shift;
    my $ConfigObject = $Self->{ConfigObject} ;
    my $UserObject = $Self->{UserObject} ;
    
    # disable email checks to create new user
    my $CheckEmailAddressesOrg = $ConfigObject->Get('CheckEmailAddresses') || 1;
    $ConfigObject->Set(
	Key   => 'CheckEmailAddresses',
	Value => 0,
	);
    
    # create new users for the tests
    my $UserID = $UserObject->UserAdd(
	UserFirstname => 'IPhone',
	UserLastname  => 'UnitTest',
	UserLogin     => 'cr',
	UserEmail     => 'cr@otrs.com',
	UserPw     => '123',
	ValidID       => 1,
	ChangeUserID  => 1,
	);
    
    
    # restore original email check param
    $ConfigObject->Set(
        Key   => 'CheckEmailAddresses',
        Value => $CheckEmailAddressesOrg,
	);
}
1;
