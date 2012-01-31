# --
# SystemMonitoring.t - SystemMonitoring tests
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: SystemMonitoring.t,v 1.2 2010/02/15 18:16:06 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
use strict;
use warnings;
use YAML;
use Kernel::System::Ticket;
use Kernel::System::PostMaster;
use Kernel::System::User;
use Kernel::System::DB;
use Kernel::System::Log;
use Kernel::System::Encode;
use Kernel::System::Main;
use Kernel::Config;
use Kernel::System::UnitTest;
use YAML;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::DB;
use Kernel::System::Time;
use Kernel::System::UnitTest;
use Kernel::System::DynamicField;

my $ConfigObject = Kernel::Config->new();
#warn "Config Object :" . Dump ($ConfigObject);

my $EncodeObject = Kernel::System::Encode->new(
    ConfigObject => $ConfigObject,
    );

my $LogObject = Kernel::System::Log->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    );

my $MainObject = Kernel::System::Main->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    );
    
my $TimeObject = Kernel::System::Time->new(
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    );

my $DBObject = Kernel::System::DB->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    );

my $Self = Kernel::System::UnitTest->new(
    EncodeObject => $EncodeObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    DBObject     => $DBObject,
    TimeObject   => $TimeObject,
    );



my %Query = (
          'StateType' => 'Open',
          'Result' => 'ARRAY',
          'DynamicField_TicketFreeText12' => {
                                  'Equals' => 'Router7'
                                },
          'UserID' => 1,
          'Limit' => 1,
	  'DynamicField_FieldNameTicketFreeText9'  => {
                                 'Equals' => 'HTTP5'
                               },

          'DynamicField_TicketFreeText9' => {
                                 'Equals' => 'HTTP5'
                               }
        );


my $TicketObject = Kernel::System::Ticket->new( %{$Self} );

my @TicketIDs = $TicketObject->TicketSearch(%Query);	
use YAML;
warn Dump(@TicketIDs);

