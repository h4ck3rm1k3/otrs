package Kernel::System::Web::Request;
use strict;
#use warnings;
sub SetParam {
    my ( $Self, %Param ) = @_;
    my $Value = $Param{Value};
    $Self->{Query}->param( $Param{Param}, $Value );
    return $Value;
}

package Core;
use strict;
#use warnings;

#use vars qw($VERSION);
#$VERSION = qw($Revision: 1.16 $) [1];

# use ../../ as lib location
#use FindBin qw($Bin);
#use lib "$Bin/../..";
#use lib "$Bin/../../Kernel/cpan-lib";

use Kernel::Config;
# use Kernel::System::Encode;
# use Kernel::System::Log;
# use Kernel::System::DB;
# use Kernel::System::Main;
# use Kernel::System::Time;
# use Kernel::System::Auth;
# use Kernel::System::User;
# use Kernel::System::Group;
# use Kernel::System::Queue;
# use Kernel::System::Service;
# use Kernel::System::Type;
# use Kernel::System::State;
# use Kernel::System::Lock;
# use Kernel::System::SLA;
# use Kernel::System::CustomerUser;
# use Kernel::System::Ticket;
# use Kernel::System::LinkObject;
# use Kernel::System::JSON;
# use Kernel::System::iPhone;
# use JSON::PP;
# use Kernel::System::Web::Request;

