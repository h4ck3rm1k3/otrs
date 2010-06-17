# --
# Kernel/System/JSON.pm - Wrapper functions for encoding and decoding JSON
# Copyright (C) 2003-2010 OTRS AG, http://otrs.com/
# --
# $Id: JSON.pm,v 1.1 2010/06/17 20:38:36 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::JSON;

use strict;
use warnings;

use JSON;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

=head1 NAME

Kernel::System::JSON - the JSON wrapper lib

=head1 SYNOPSIS

Functions for encoding perl data structures to JSON.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create a JSON object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::JSON;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );

    my $JSONObject = Kernel::System::JSON->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject EncodeObject LogObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    # create additional objects
    $Self->{JSONObject} = JSON->new();
    $Self->{JSONObject}->allow_nonref(1);

    return $Self;
}

=item Encode()

Encode a perl data structure to a JSON string.

    my $JSONString = $JSONObject->Encode(
        Data => $Data,
    );

=cut

sub Encode {
    my ( $Self, %Param ) = @_;

    # check for needed data
    if ( !defined $Param{Data} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Data!',
        );
        return;
    }

    # get JSON-encoded presentation of perl structure
    my $JSONEncoded = $Self->{JSONObject}->encode( $Param{Data} ) || '""';

    return $JSONEncoded;
}

# function is not used yet
#=item Decode()
#
#Decode a JSON string to a perl data structure.
#
#    my $PerlStructurScalar = $JSONObject->Decode(
#        Data => $JSONString,
#    );
#
#=cut

sub Decode {
    my ( $Self, %Param ) = @_;

    # check for needed data
    return if !defined $Param{Data};

    # decode JSON encoded to perl structure
    my $Scalar = $Self->{JSONObject}->decode( $Param{Data} );

    return $Scalar;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=head1 VERSION

$Revision: 1.1 $ $Date: 2010/06/17 20:38:36 $

=cut
