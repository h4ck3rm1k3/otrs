# --
# 100-Admin.t - frontend tests for admin area
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: 100-Admin.t,v 1.2 2010/12/20 16:00:17 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;

use vars qw($Self);

use Kernel::System::UnitTest::Selenium;
use Time::HiRes qw(sleep);

if ( !$Self->{ConfigObject}->Get('SeleniumTestsActive') ) {
    $Self->True( 1, 'Selenium testing is not active' );
    return 1;
}

# use local Config object because it will be modified
my $ConfigObject = Kernel::Config->new();

my $sel = Kernel::System::UnitTest::Selenium->new(
    Verbose        => 1,
    UnitTestObject => $Self,
);

$sel->Login(
    Type     => 'Agent',
    User     => 'root@localhost',
    Password => 'root',
);

my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

my @AdminModules = qw(
    AdminAttachment
    AdminAutoResponse
    AdminCustomerCompany
    AdminCustomerUser
    AdminCustomerUserGroup
    AdminCustomerUserService
    AdminEmail
    AdminGenericAgent
    AdminGroup
    AdminLog
    AdminMailAccount
    AdminNotification
    AdminNotificationEvent
    AdminPGP
    AdminPackageManager
    AdminPerformanceLog
    AdminPostMasterFilter
    AdminPriority
    AdminQueue
    AdminQueueAutoResponse
    AdminQueueResponses
    AdminResponse
    AdminResponseAttachment
    AdminRole
    AdminRoleGroup
    AdminRoleUser
    AdminSLA
    AdminSMIME
    AdminSalutation
    AdminSelectBox
    AdminService
    AdminSession
    AdminSignature
    AdminState
    AdminSysConfig
    AdminSystemAddress
    AdminType
    AdminUser
    AdminUserGroup
);

ADMINMODULE:
for my $AdminModule (@AdminModules) {
    $sel->open_ok("${ScriptAlias}index.pl?Action=$AdminModule");
    $sel->wait_for_page_to_load_ok("30000");

    # Guess if the page content is ok or an error message. Here we
    #   check for the presence of div.SidebarColumn because all Admin
    #   modules have this sidebar column present.
    $sel->is_element_present_ok("css=div.SidebarColumn");

    # Also check if the navigation is present (this is not the case
    #   for error messages and has "Admin" highlighted
    $sel->is_element_present_ok("css=li#nav-Admin.Selected");
}

1;