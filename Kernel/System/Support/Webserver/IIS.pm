# --
# Kernel/System/Support/Webserver/IIS.pm - all required system information
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: IIS.pm,v 1.6 2008/07/13 23:25:41 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::Support::Webserver::IIS;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for (qw(ConfigObject LogObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    return $Self;
}

sub AdminChecksGet {
    my ( $Self, %Param ) = @_;

    # add new function name here
    my @ModuleList = (
        '_PerlExCheck',
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

sub _Check {
    my ( $Self, %Param ) = @_;

    my $ReturnHash = {};

    # check needed stuff
    for (qw()) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    return $ReturnHash;
}
sub _PerlExCheck {
    my ( $Self, %Param ) = @_;

    my $Data = {};

    # check if Apache::DBI is loaded
    my $Check     = '';
    my $Message   = '';
    if ( $ENV{'GATEWAY_INTERFACE'} && $ENV{'GATEWAY_INTERFACE'} =~ /^CGI-PerlEx/i ) {
        $Check   = 'OK';
        $Message = "PerlEx is in use ($ENV{'GATEWAY_INTERFACE'}).";
    }
    else {
        $Check   = 'Critical';
        $Message = 'You should use PerlEx to increase your performance (you really should do this).';
    }
    $Data = {
        Name        => 'PerlEx',
        Description => 'Check if PerlEx is used.',
        Comment     => $Message,
        Check       => $Check,
    };
    return $Data;
}

1;
