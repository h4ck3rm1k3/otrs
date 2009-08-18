# --
# Kernel/System/Support/OTRS.pm - all required otrs information
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: OTRS.pm,v 1.20 2009/08/18 09:07:13 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Support::OTRS;

use strict;
use warnings;

use Kernel::System::Support;
use Kernel::System::User;
use Kernel::System::Ticket;
use Kernel::System::Package;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.20 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for (qw(ConfigObject LogObject MainObject DBObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    $Self->{SupportObject} = Kernel::System::Support->new(%Param);
    $Self->{UserObject}    = Kernel::System::User->new(%Param);
    $Self->{TicketObject}  = Kernel::System::Ticket->new(%Param);
    $Self->{PackageObject} = Kernel::System::Package->new(%Param);

    return $Self;
}

sub AdminChecksGet {
    my ( $Self, %Param ) = @_;

    # add new function name here
    my @ModuleList = (
        '_OpenTicketCheck', '_TicketIndexModuleCheck', '_TicketFulltextIndexModuleCheck',
        '_FQDNConfigCheck', '_SystemIDConfigCheck', '_LogCheck',
        '_FileSystemCheck', '_PackageDeployCheck', '_InvalidUserLockedTicketSearch',
        '_ConfigCheckTicketFrontendResponseFormat',
    );

    my @DataArray;

    FUNCTIONNAME:
    for my $FunctionName (@ModuleList) {

        # run function and get check data
        my $Check = $Self->$FunctionName();

        next FUNCTIONNAME if !$Check;

        # attach check data if valid
        push @DataArray, $Check;
    }

    return \@DataArray;
}

# check if error log entries are available
sub _LogCheck {
    my ( $Self, %Param ) = @_;

    my $Data = {};

    # Ticket::IndexModule check
    my $Check   = 'OK';
    my $Message = '';
    my $Error   = '';

    my @Lines = split( /\n/, $Self->{LogObject}->GetLog() );
    for (@Lines) {
        my @Row = split( /;;/, $_ );
        if ( $Row[3] ) {
            if ( $Row[1] =~ /error/i ) {
                $Check = 'Failed';
                if ($Message) {
                    $Message = 'You have more error log entries: ';
                }
                else {
                    $Message = 'There is one error log entry: ';
                }
                if ($Error) {
                    $Error .= ', ';
                }
                $Error .= $Row[3];
            }
        }
    }

    $Data = {
        Name        => 'LogCheck',
        Description => 'Check log for error log entries.',
        Comment     => $Message . $Error,
        Check       => $Check,
    };
    return $Data;
}

sub _TicketIndexModuleCheck {
    my ( $Self, %Param ) = @_;

    my $Data = {};

    # Ticket::IndexModule check
    my $Check   = 'Failed';
    my $Message = '';
    my $Module  = $Self->{ConfigObject}->Get('Ticket::IndexModule');
    $Self->{DBObject}->Prepare( SQL => 'SELECT count(*) from ticket' );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Row[0] > 80000 ) {
            if ( $Module =~ /RuntimeDB/ ) {
                $Check = 'Failed';
                $Message = "$Row[0] tickets in your system. You should use the StaticDB backend. See admin manual (Performance Tuning) for more information.";
            }
            else {
                $Check   = 'OK';
                $Message = "";
            }
        }
        elsif ( $Row[0] > 60000 ) {
            if ( $Module =~ /RuntimeDB/ ) {
                $Check = 'Critical';
                $Message = "$Row[0] tickets in your system. You should use the StaticDB backend. See admin manual (Performance Tuning) for more information.";
            }
            else {
                $Check   = 'OK';
                $Message = "";
            }
        }
        else {
            $Check   = 'OK';
            $Message = "You are using \"$Module\", that's fine for $Row[0] tickets in your system.";
        }
    }
    $Data = {
        Name        => 'Ticket::IndexModule',
        Description => 'Check Ticket::IndexModule setting.',
        Comment     => $Message,
        Check       => $Check,
    };
    return $Data;
}

sub _TicketFulltextIndexModuleCheck {
    my ( $Self, %Param ) = @_;

    my $Data = {};

    # Ticket::IndexModule check
    my $Check   = 'Failed';
    my $Message = '';
    my $Module  = $Self->{ConfigObject}->Get('Ticket::SearchIndexModule');
    $Self->{DBObject}->Prepare( SQL => 'SELECT count(*) from article' );
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        if ( $Row[0] > 100000 ) {
            if ( $Module =~ /RuntimeDB/ ) {
                $Check = 'Failed';
                $Message = "$Row[0] article in your system. You should use the StaticDB backend for OTRS 2.3 and higher. See admin manual (Performance Tuning) for more information.";
            }
            else {
                $Check   = 'OK';
                $Message = "";
            }
        }
        elsif ( $Row[0] > 50000 ) {
            if ( $Module =~ /RuntimeDB/ ) {
                $Check = 'Critical';
                $Message = "$Row[0] article in your system. You should use the StaticDB backend for OTRS 2.3 and higher. See admin manual (Performance Tuning) for more information.";
            }
            else {
                $Check   = 'OK';
                $Message = "";
            }
        }
        else {
            $Check   = 'OK';
            $Message = "You are using \"$Module\", that's fine for $Row[0] articles in your system.";
        }
    }
    $Data = {
        Name        => 'Ticket::SearchIndexModule',
        Description => 'Check Ticket::SearchIndexModule setting.',
        Comment     => $Message,
        Check       => $Check,
    };
    return $Data;
}

# OpenTicketCheck check
sub _OpenTicketCheck {
    my ( $Self, %Param ) = @_;

    my $Data = {};

    my $Check     = 'Failed';
    my $Message   = '';
    my @TicketIDs = $Self->{TicketObject}->TicketSearch(
        Result     => 'ARRAY',
        StateType  => 'Open',
        UserID     => 1,
        Permission => 'ro',
        Limit      => 89999,
    );
    if ( $#TicketIDs > 89990 ) {
        $Check = 'Failed';
        $Message = 'You should not have more then 8000 open tickets in your system. You currently have over 89999! In case you want to improve your performance, close not needed open tickets.';

    }
    elsif ( $#TicketIDs > 10000 ) {
        $Check = 'Failed';
        $Message = 'You should not have more then 8000 open tickets in your system. You currently have '
            . $#TicketIDs
            . '. In case you want to improve your performance, close not needed open tickets.';

    }
    elsif ( $#TicketIDs > 8000 ) {
        $Check = 'Critical';
        $Message = 'You should not have more then 8000 open tickets in your system. You currently have '
            . $#TicketIDs
            . '. In case you want to improve your performance, close not needed open tickets.';

    }
    else {
        $Check   = 'OK';
        $Message = 'You have ' . $#TicketIDs . ' open tickets in your system.';
    }
    $Data = {
        Name        => 'OpenTicketCheck',
        Description => 'Check open tickets in your system.',
        Comment     => $Message,
        Check       => $Check,
    };
    return $Data;
}

# Check if the configured FQDN is valid.
sub _FQDNConfigCheck {
    my ( $Self, %Param ) = @_;
    my $Data = {
        Name        => 'FQDNConfigCheck',
        Description => 'Check if the configured FQDN is valid.',
        Check       => 'Failed',
        Comment     => '',
    };

    # Get the configured FQDN
    my $FQDN = $Self->{ConfigObject}->Get('FQDN');

    # Do we have set our FQDN?
    if ( $FQDN eq 'yourhost.example.com' ) {
        $Data->{Check}   = 'Failed';
        $Data->{Comment} = "Please configure your FQDN inside the SysConfig module. (currently the default setting '$FQDN' is enabled).";
    }

    # FQDN syntax check.
    elsif ( $FQDN =~ /\.\.|\s|[^a-zA-Z0-9-.]/g ) {
        $Data->{Check}   = 'Failed';
        $Data->{Comment} = "Invalid FQDN '$FQDN'.";
    }

    # Nothing to complain. :-(
    else {
        $Data->{Check}   = 'OK';
        $Data->{Comment} = "FQDN '$FQDN' looks good.";
    }
    return $Data;
}

# Check if the SystemID contains only digits.
sub _SystemIDConfigCheck {
    my ( $Self, %Param ) = @_;

    my $Data = {
        Name        => 'SystemIDConfigCheck',
        Description => 'Check if the configured SystemID contains only digits.',
        Check       => 'Failed',
        Comment     => '',
    };

    # Get the configured SystemID
    my $SystemID = $Self->{ConfigObject}->Get('SystemID');

    # Does the SystemID contain non-digits?
    if ( $SystemID =~ /^\d+$/ ) {
        $Data->{Check}   = 'OK';
        $Data->{Comment} = " Your SystemID setting is $SystemID."
    }
    else {
        $Data->{Comment} = "The SystemID '$SystemID' must consist of digits exclusively.";
    }
    return $Data;
}

# Check if Ticket::Frontend::ResponseFormat is valid
sub _ConfigCheckTicketFrontendResponseFormat {
    my ( $Self, %Param ) = @_;

    my $Data = {
        Name        => 'ResponseFormatCheck',
        Description => 'Check if Ticket::Frontend::ResponseFormat contains no $Data{""}.',
        Check       => 'Failed',
        Comment     => '',
    };

    # Get the config
    my $Config = $Self->{ConfigObject}->Get('Ticket::Frontend::ResponseFormat');

    # Does the SystemID contain non-digits?
    if ( $Config !~ /\$Data{"/ ) {
        $Data->{Check}   = 'OK';
        $Data->{Comment} = " No \$Data{\"\"} found."
    }
    else {
        $Data->{Comment} = "Config option Ticket::Frontend::ResponseFormat cointains \$Data{\"\"}, use \$QData{\"\"} instand (seed default setting).";
    }
    return $Data;
}

sub _FileSystemCheck {
    my ( $Self, %Param ) = @_;

    my $Message = '';
    my $Data = {
        Name        => 'FileSystemCheck',
        Description => 'Check if file system is writable.',
        Check       => 'Failed',
        Comment     => 'The file system is writable.',
    };

    my $Home = $Self->{ConfigObject}->Get('Home');
    # check Home
    if (! -e $Home) {
        $Data->{Check}   = 'Failed';
        $Data->{Comment} = "No such home directory: $Home!",
        return $Data;
    }
    foreach (qw(/bin/ /Kernel/ /Kernel/System/ /Kernel/Output/ /Kernel/Output/HTML/ /Kernel/Modules/)) {
        my $File = "$Home/$_/check_permissons.$$";
        if (open(OUT, "> $File")) {
            print OUT "test";
            close (OUT);
            unlink $File;
        }
        else {
            $Message .= "$File($!);";
        }
    }

    if ($Message) {
        $Data->{Comment} = "Can't write file: $Message",
        return $Data;
    }

    $Data->{Check}   = 'OK';

    return $Data;
}

sub _PackageDeployCheck {
    my ( $Self, %Param ) = @_;

    my $Data = {
        Name        => 'PackageDeployCheck',
        Description => 'Check deployment of all packages.',
        Check       => 'OK',
        Comment     => 'All packages are correctly installed.',
    };

    my $Message = '';
    for my $Package ( $Self->{PackageObject}->RepositoryList() ) {
        my $DeployCheck = $Self->{PackageObject}->DeployCheck(
            Name    => $Package->{Name}->{Content},
            Version => $Package->{Version}->{Content},
        );
        if ( !$DeployCheck ) {
            $Message .= $Package->{Name}->{Content} . ' ' . $Package->{Version}->{Content} . '; ';
        }
    }

    if ($Message) {
        $Data->{Check}   = 'Critical';
        $Data->{Comment} = "Packages not correctly installed: $Message.",
    }

    return $Data;
}

sub _InvalidUserLockedTicketSearch {
    my ( $Self, %Param ) = @_;

    # set the default message
    my $Data = {
        Name        => 'InvalidUserLockedTicketSearch',
        Description => 'Search after invalid user with locked tickets.',
        Check       => 'OK',
        Comment     => 'There is no invalid user with locked tickets.',
    };

    # get all user (because there is no function to get all invalid user)
    my %UserList = $Self->{UserObject}->UserList(
        Type => 'Long',
        Valid => 0
    );

    # create the list of invalid user
    my @InvalidUser = ();
    for my $UserID (sort keys %UserList) {
        my %User = $Self->{UserObject}->GetUserData(
            UserID => $UserID,
            Cached => 1,
        );
        if ( $User{ValidID} == 2 ) {
            push @InvalidUser, $UserID;
        }
    }

    return $Data if !@InvalidUser;

    my @TicketIDs = $Self->{TicketObject}->TicketSearch(
        Result => 'ARRAY',
        LockIDs => [2],
        OwnerIDs => \@InvalidUser,
        UserID => 1,
    );

    return $Data if !@TicketIDs;

    my %LockedTicketUser = ();
    for my $TicketID (@TicketIDs) {
        my %Ticket = $Self->{TicketObject}->TicketGet(
            TicketID => $TicketID,
            UserID   => 1,
        );
        $LockedTicketUser{$Ticket{OwnerID}} = $UserList{$Ticket{OwnerID}};
    }

    my $UserString = join ', ', values %LockedTicketUser;
    $Data->{Comment} = "These invalid users have locked tickets: $UserString",
    $Data->{Check}   = 'Critical';

    return $Data;
}
1;
