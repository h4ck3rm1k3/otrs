package Test;
#  scripts/test/iso/001_iphone.t - all iPhone tests
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: iPhone.pm,v 1.68 2012/02/01 18:51:07 md Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.68 $) [1];

use strict;
use warnings;
use Kernel::System::Ticket;
use Kernel::System::PostMaster;
use Kernel::Config;
use Kernel::System::DB;
use Kernel::System::DynamicField;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::Time;
use Kernel::System::UnitTest;
use Kernel::System::User;
use Data::Dumper;
use YAML;
use Kernel::System::LinkObject;
use Kernel::System::iPhone;
my $ConfigObject = Kernel::Config->new();
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

die unless $DBObject;

my $Self = Kernel::System::UnitTest->new(
    EncodeObject => $EncodeObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    DBObject     => $DBObject,
    TimeObject   => $TimeObject,
    Debug =>10
    );

my $TicketObject = Kernel::System::Ticket->new(
    EncodeObject => $EncodeObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    DBObject     => $DBObject,
    TimeObject   => $TimeObject,   
    Debug => 10,
    );

my $user = Kernel::System::User->new(
    DBObject     => $DBObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    TimeObject   => $TimeObject,
    MainObject   => $MainObject,  
    EncodeObject => $EncodeObject, 
   );

my $group = Kernel::System::Group->new(
    DBObject     => $DBObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    TimeObject   => $TimeObject,
    MainObject   => $MainObject,  
    EncodeObject => $EncodeObject, 
   );

my $LanguageObject = Kernel::Language->new(
            MainObject   => $MainObject,
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        UserLanguage => 'de',
    );

my %Self=(
   
    DBObject     => $DBObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    TimeObject   => $TimeObject,
    MainObject   => $MainObject,  
    EncodeObject => $EncodeObject, 
    LanguageObject => $LanguageObject,
    %{$TicketObject}
   );

my  $queue   =  Kernel::System::Queue->new(    %Self   );
my  $service  = Kernel::System::Service->new(        %Self);
my  $type  =  Kernel::System::Type->new(%Self);
my  $state =  Kernel::System::State->new(%Self);
my  $lock  = Kernel::System::Lock->new(%Self);
my  $sla   =  Kernel::System::SLA->new(%Self);
my  $customeruser   =  Kernel::System::CustomerUser->new(%Self);
my  $ticket   = Kernel::System::Ticket->new(%Self);
my  $link   =  Kernel::System::LinkObject->new(%Self);



my $phone = Kernel::System::iPhone->new(
    %Self,
    UserObject => $user,
    GroupObject => $group,
    QueueObject => $queue,
    ServiceObject => $service,
    TypeObject => $type,
    #StateObject => $state,
    LockObject => $lock,
    SLAObject => $sla,
    CustomerUserObject => $customeruser,
    TicketObject => $TicketObject,
    LinkObject => $link,
    EncodeObject => $EncodeObject,
    ConfigObject => $ConfigObject,
    LogObject    => $LogObject,
    MainObject   => $MainObject,
    DBObject     => $DBObject,
    TimeObject   => $TimeObject,
    Debug =>10

);

my %param= (
   UserID=> 1,
   TicketID =>1,
   QueueID => 1,
   ResponseID => 1,
   Screen => "Phone",
   Subject => "Subject",
   TimeStamp => "2001-01-01 10:10:01",
   TicketFreeText1 => "freetext1",
);

##
$phone->{ConfigObject}->Set(Key=>'Ticket::Frontend::Quote', Value=>">");

$phone-> _GetScreenElements(%param);

$phone->ScreenConfig(%param);
$phone->Badges(%param);
$phone->EscalationView(%param);
$phone->StatusView(%param);
$phone->LockedView(%param);
#$phone->WatchedView(%param); TODO Ticket watcher feature is not enable in system configuration Please contact admin
$phone->ResponsibleView(%param);
$phone->QueueView(%param);
$phone->TicketList(%param);
$phone->TicketGet(%param);
$phone->ArticleGet(%param);
$phone->ServicesGet(%param);
$phone->SLAsGet(%param);
$phone->UsersGet(%param);
$phone->NextStatesGet(%param);
$phone->PrioritiesGet(%param);
$phone->CustomerSearch(%param);
$phone->ScreenActions(%param);
#$phone->VersionGet(%param); this is not needed in the test env
$phone->CustomerIDGet(%param);
$phone->ArticleIndex(%param);
$phone->InitConfigGet(%param);
$phone->_GetTypes(%param);
$phone-> _GetTos(%param);
$phone-> _GetNoteTypes(%param);
$phone-> _TicketPhoneNew(%param);
$phone-> _TicketCommonActions(%param);
$phone-> _TicketCompose(%param);
$phone-> _TicketMove(%param);
$phone-> _GetComposeDefaults(%param);
$phone-> _TransformDateSelection(%param);

##

$phone->_ArticleFreeTextSet (%param);
$phone->_CheckRequiredFreeTextField (%param);
$phone->_GetArticleDefaultSelections(%param);
$phone->_GetArticleFreeTextConfigOptions(%param);
$phone->_GetArticleFreeTextValues (\%param);
$phone->_GetFreeTextConfigOptions (%param);
$phone->_GetScreenElementsFreeTextFields(1, "test","test", %param);
$phone->_GetScreenElementsTicketFreeTimeFields(%param);
$phone->_GetTicketFreeTextValues (\%param);
$phone->_SetArticleFreeText(\%param);
$phone->_SetTicketFreeText(\%param);
$phone->_SetTicketFreeTime(\%param);
$phone->_TicketFreeTextSet (%param);
$phone->_TicketFreeTimeSet(\%param);
$phone->_TicketTransformFreeTime(\%param);


1

