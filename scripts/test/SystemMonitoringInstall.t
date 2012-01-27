# --
# SystemMonitoringInstall.t - code to test the system monitoring basic installation
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: SystemMonitoring.pm,v 1.17 2011/12/09 15:41:34 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::Time;
use Kernel::System::DB;
use Kernel::System::XML;
use var::packagesetup::SystemMonitoring;

my $ConfigObject = Kernel::Config->new();
my $EncodeObject = Kernel::System::Encode->new(
    ConfigObject => $ConfigObject,
    );
my $LogObject    = Kernel::System::Log->new(
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
    my $XMLObject = Kernel::System::XML->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        MainObject   => $MainObject,
    );
    my $CodeObject = var::packagesetup::SystemMonitoring->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
        TimeObject   => $TimeObject,
        DBObject     => $DBObject,
        XMLObject    => $XMLObject,
    );

my $Result = $CodeObject->CodeInstall();

my $Result2 =  $CodeObject->CodeUpgradeFromLowerThan_3_0_93 ();
