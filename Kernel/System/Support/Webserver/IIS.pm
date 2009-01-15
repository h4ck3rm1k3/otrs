# --
# Kernel/System/Support/Webserver/IIS.pm - all required system information
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: IIS.pm,v 1.7 2009/01/15 00:40:21 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::Support::Webserver::IIS;

use strict;
use warnings;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

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
        $Check   = 'Failed';
        $Message = 'You should use PerlEx to increase your performance.';
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
