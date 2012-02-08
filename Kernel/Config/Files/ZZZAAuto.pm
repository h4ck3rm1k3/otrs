# OTRS config file (automatically generated)
# VERSION:1.1
package Kernel::Config::Files::ZZZAAuto;
use utf8;
sub Load {
    my ($File, $Self) = @_;
$Self->{'Ticket::ResponsibleForQueue'} =  {};
$Self->{'Ticket::EventModulePost'}->{'ResponsibleForQueue'} =  {
  'Event' => 'TicketQueueUpdate',
  'Module' => 'Kernel::System::Ticket::Event::ResponsibleForQueue'
};
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'SearchCSVDynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'SearchOverviewDynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchCSVDynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'Defaults'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketPrint'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketPrint'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketZoom'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::OverviewPreview'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::OverviewMedium'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::OverviewSmall'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'DynamicField'} =  {};
$Self->{'DynamicFields::Backend'}->{'Multiselect'} =  {
  'ConfigDialog' => 'AdminDynamicFieldMultiselect',
  'DisplayName' => 'Multiselect',
  'ItemSeparator' => ', ',
  'Module' => 'Kernel::System::DynamicField::Backend::Multiselect'
};
$Self->{'DynamicFields::Backend'}->{'Date'} =  {
  'ConfigDialog' => 'AdminDynamicFieldDateTime',
  'DisplayName' => 'Date',
  'Module' => 'Kernel::System::DynamicField::Backend::Date'
};
$Self->{'DynamicFields::Backend'}->{'DateTime'} =  {
  'ConfigDialog' => 'AdminDynamicFieldDateTime',
  'DisplayName' => 'Date / Time',
  'Module' => 'Kernel::System::DynamicField::Backend::DateTime'
};
$Self->{'DynamicFields::Backend'}->{'Dropdown'} =  {
  'ConfigDialog' => 'AdminDynamicFieldDropdown',
  'DisplayName' => 'Dropdown',
  'Module' => 'Kernel::System::DynamicField::Backend::Dropdown'
};
$Self->{'DynamicFields::Backend'}->{'Checkbox'} =  {
  'ConfigDialog' => 'AdminDynamicFieldCheckbox',
  'DisplayName' => 'Checkbox',
  'Module' => 'Kernel::System::DynamicField::Backend::Checkbox'
};
$Self->{'DynamicFields::Backend'}->{'TextArea'} =  {
  'ConfigDialog' => 'AdminDynamicFieldText',
  'DisplayName' => 'Textarea',
  'Module' => 'Kernel::System::DynamicField::Backend::TextArea'
};
$Self->{'DynamicFields::Backend'}->{'Text'} =  {
  'ConfigDialog' => 'AdminDynamicFieldText',
  'DisplayName' => 'Text',
  'Module' => 'Kernel::System::DynamicField::Backend::Text'
};
$Self->{'DynamicFields::ObjectType'}->{'Article'} =  {
  'DisplayName' => 'Article',
  'Module' => 'Kernel::System::DynamicField::ObjectType::Article'
};
$Self->{'DynamicFields::ObjectType'}->{'Ticket'} =  {
  'DisplayName' => 'Ticket',
  'Module' => 'Kernel::System::DynamicField::ObjectType::Ticket'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldMultiselect'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.DynamicField.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js',
      'Core.Agent.Admin.DynamicFieldMultiselect.js'
    ]
  },
  'Title' => 'Dynamic Fields Multiselect Backend GUI'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldDateTime'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.DynamicField.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js',
      'Core.Agent.Admin.DynamicFieldDateTime.js'
    ]
  },
  'Title' => 'Dynamic Fields Date Time Backend GUI'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldDropdown'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.DynamicField.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js',
      'Core.Agent.Admin.DynamicFieldDropdown.js'
    ]
  },
  'Title' => 'Dynamic Fields Drop-down Backend GUI'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldCheckbox'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js'
    ]
  },
  'Title' => 'Dynamic Fields Checkbox Backend GUI'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldText'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js'
    ]
  },
  'Title' => 'Dynamic Fields Text Backend GUI'
};
$Self->{'PreferencesGroups'}->{'DynamicFieldsOverviewPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '25',
  'Key' => 'Dynamic fields limit per page for Dynamic Fields Overview',
  'Label' => 'Dynamic Fields Overview Limit',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'AdminDynamicFieldsOverviewPageShown',
  'Prio' => '8000'
};
$Self->{'Frontend::Module'}->{'AdminDynamicField'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.DynamicField.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage dynamic fields.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Dynamic Fields',
    'Prio' => '1000'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Dynamic Fields GUI'
};
$Self->{'Ticket::Frontend::ZoomRichTextForce'} =  '0';
$Self->{'Ticket::Frontend::HTMLArticleHeightMax'} =  '2500';
$Self->{'Ticket::Frontend::HTMLArticleHeightDefault'} =  '100';
$Self->{'Stats::DynamicObjectRegistration'}->{'TicketSolutionResponseTime'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::TicketSolutionResponseTime'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'TicketAccountedTime'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::TicketAccountedTime'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'TicketList'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::TicketList'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'Ticket'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::Ticket'
};
$Self->{'LinkObject::PossibleLink'}->{'0201'} =  {
  'Object1' => 'Ticket',
  'Object2' => 'Ticket',
  'Type' => 'ParentChild'
};
$Self->{'LinkObject::PossibleLink'}->{'0200'} =  {
  'Object1' => 'Ticket',
  'Object2' => 'Ticket',
  'Type' => 'Normal'
};
$Self->{'SendNoAutoResponseRegExp'} =  '(MAILER-DAEMON|postmaster|abuse)@.+?\\..+?';
$Self->{'PostMaster::PostFilterModule'}->{'000-FollowUpArticleTypeCheck'} =  {
  'ArticleType' => 'email-internal',
  'Module' => 'Kernel::System::PostMaster::Filter::FollowUpArticleTypeCheck',
  'SenderType' => 'customer'
};
$Self->{'PostMaster::PreFilterModule'}->{'000-MatchDBSource'} =  {
  'Module' => 'Kernel::System::PostMaster::Filter::MatchDBSource'
};
$Self->{'PostMaster::PreFilterModule::NewTicketReject::Body'} =  '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
';
$Self->{'PostMaster::PreFilterModule::NewTicketReject::Subject'} =  'Email Rejected';
$Self->{'PostmasterX-Header'} =  [
  'From',
  'To',
  'Cc',
  'Reply-To',
  'ReplyTo',
  'Subject',
  'Message-ID',
  'Message-Id',
  'Resent-To',
  'Resent-From',
  'Precedence',
  'Mailing-List',
  'List-Id',
  'List-Archive',
  'Errors-To',
  'References',
  'In-Reply-To',
  'X-Loop',
  'X-Spam-Flag',
  'X-Spam-Status',
  'X-Spam-Level',
  'X-No-Loop',
  'X-Priority',
  'Importance',
  'X-Mailer',
  'User-Agent',
  'Organization',
  'X-Original-To',
  'Delivered-To',
  'Envelope-To',
  'Return-Path',
  'X-OTRS-Loop',
  'X-OTRS-Info',
  'X-OTRS-Priority',
  'X-OTRS-Queue',
  'X-OTRS-Lock',
  'X-OTRS-Ignore',
  'X-OTRS-State',
  'X-OTRS-State-PendingTime',
  'X-OTRS-Type',
  'X-OTRS-Service',
  'X-OTRS-SLA',
  'X-OTRS-CustomerNo',
  'X-OTRS-CustomerUser',
  'X-OTRS-SenderType',
  'X-OTRS-ArticleType',
  'X-OTRS-FollowUp-Priority',
  'X-OTRS-FollowUp-Queue',
  'X-OTRS-FollowUp-Lock',
  'X-OTRS-FollowUp-State',
  'X-OTRS-FollowUp-State-PendingTime',
  'X-OTRS-FollowUp-Type',
  'X-OTRS-FollowUp-Service',
  'X-OTRS-FollowUp-SLA',
  'X-OTRS-FollowUp-SenderType',
  'X-OTRS-FollowUp-ArticleType'
];
$Self->{'PostmasterFollowUpOnUnlockAgentNotifyOnlyToOwner'} =  '0';
$Self->{'PostmasterFollowUpState'} =  'open';
$Self->{'PostmasterDefaultState'} =  'new';
$Self->{'PostmasterDefaultPriority'} =  '3 normal';
$Self->{'PostmasterDefaultQueue'} =  'Raw';
$Self->{'PostmasterUserID'} =  '1';
$Self->{'PostmasterFollowUpSearchInRaw'} =  '0';
$Self->{'PostmasterFollowUpSearchInAttachment'} =  '0';
$Self->{'PostmasterFollowUpSearchInBody'} =  '0';
$Self->{'PostmasterFollowUpSearchInReferences'} =  '0';
$Self->{'PostmasterAutoHTML2Text'} =  '1';
$Self->{'LoopProtectionLog'} =  '<OTRS_CONFIG_Home>/var/log/LoopProtection';
$Self->{'LoopProtectionModule'} =  'Kernel::System::PostMaster::LoopProtection::DB';
$Self->{'PostMasterReconnectMessage'} =  '20';
$Self->{'PostMasterMaxEmailSize'} =  '16384';
$Self->{'PostmasterMaxEmails'} =  '40';
$Self->{'TicketACL::Default::Action'} =  {};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketSearch'} =  {
  'Description' => 'Customer ticket search',
  'NavBar' => [
    {
      'AccessKey' => 's',
      'Block' => '',
      'Description' => 'Search',
      'Link' => 'Action=CustomerTicketSearch',
      'LinkOption' => '',
      'Name' => 'Search',
      'NavBar' => '',
      'Prio' => '300',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Search'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketAttachment'} =  {
  'Description' => 'To download attachments',
  'NavBarName' => '',
  'Title' => ''
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketPrint'} =  {
  'Description' => 'Customer Ticket Print Module',
  'NavBarName' => '',
  'Title' => 'Print'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketZoom'} =  {
  'Description' => 'Ticket zoom view',
  'Loader' => {
    'JavaScript' => [
      'Core.Customer.TicketZoom.js',
      'Core.UI.Popup.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Zoom'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketMessage'} =  {
  'Description' => 'Create tickets',
  'NavBar' => [
    {
      'AccessKey' => 'n',
      'Block' => '',
      'Description' => 'Create new Ticket',
      'Link' => 'Action=CustomerTicketMessage',
      'LinkOption' => '',
      'Name' => 'New Ticket',
      'NavBar' => '',
      'Prio' => '100',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'New Ticket'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketOverview'} =  {
  'Description' => 'Overview of customer tickets',
  'NavBar' => [
    {
      'AccessKey' => 'm',
      'Block' => '',
      'Description' => 'My Tickets',
      'Link' => 'Action=CustomerTicketOverview;Subaction=MyTickets',
      'LinkOption' => '',
      'Name' => 'My Tickets',
      'NavBar' => '',
      'Prio' => '110',
      'Type' => ''
    },
    {
      'AccessKey' => 'c',
      'Block' => '',
      'Description' => 'Company Tickets',
      'Link' => 'Action=CustomerTicketOverview;Subaction=CompanyTickets',
      'LinkOption' => '',
      'Name' => 'Company Tickets',
      'NavBar' => '',
      'Prio' => '120',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Overview'
};
$Self->{'Frontend::Module'}->{'AdminGenericAgent'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Manage periodic tasks.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'GenericAgent',
    'Prio' => '300'
  },
  'NavBarName' => 'Admin',
  'Title' => 'GenericAgent'
};
$Self->{'Frontend::Module'}->{'AdminPriority'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage ticket priorities.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Priorities',
    'Prio' => '850'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Priorities'
};
$Self->{'Frontend::Module'}->{'AdminState'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage ticket states.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'States',
    'Prio' => '800'
  },
  'NavBarName' => 'Admin',
  'Title' => 'States'
};
$Self->{'Frontend::Module'}->{'AdminType'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage ticket types.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Types',
    'Prio' => '700'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Types'
};
$Self->{'Frontend::Module'}->{'AdminSLA'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage Service Level Agreements (SLAs).',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Service Level Agreements',
    'Prio' => '1000'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Service Level Agreements'
};
$Self->{'Frontend::Module'}->{'AdminService'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage services.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Services',
    'Prio' => '900'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Services'
};
$Self->{'Frontend::Module'}->{'AdminNotificationEvent'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage event based notifications.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Notifications (Event)',
    'Prio' => '400'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Notifications (Event)'
};
$Self->{'Frontend::Module'}->{'AdminNotification'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage notifications that are sent to agents.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Agent Notifications',
    'Prio' => '400'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Agent Notifications'
};
$Self->{'Frontend::Module'}->{'AdminSystemAddress'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Email',
    'Description' => 'Set sender email addresses for this system.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Email Addresses',
    'Prio' => '300'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Email Addresses'
};
$Self->{'Frontend::Module'}->{'AdminSignature'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage signatures.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Signatures',
    'Prio' => '900'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Signatures'
};
$Self->{'Frontend::Module'}->{'AdminSalutation'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage salutations.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Salutations',
    'Prio' => '800'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Salutations'
};
$Self->{'Frontend::Module'}->{'AdminResponseAttachment'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Link attachments to responses templates.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Attachments <-> Responses',
    'Prio' => '700'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Attachments <-> Responses'
};
$Self->{'Frontend::Module'}->{'AdminAttachment'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage attachments.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Attachments',
    'Prio' => '600'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Attachments'
};
$Self->{'Frontend::Module'}->{'AdminQueueAutoResponse'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Link queues to auto responses.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Auto Responses <-> Queues',
    'Prio' => '500'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Auto Responses <-> Queues'
};
$Self->{'Frontend::Module'}->{'AdminAutoResponse'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage responses that are automatically sent.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Auto Responses',
    'Prio' => '400'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Auto Responses'
};
$Self->{'Frontend::Module'}->{'AdminQueueResponses'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Link responses to queues.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Responses <-> Queues',
    'Prio' => '300'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Responses <-> Queues'
};
$Self->{'Frontend::Module'}->{'AdminResponse'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage response templates.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Responses',
    'Prio' => '200'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Responses'
};
$Self->{'Frontend::Module'}->{'AdminQueue'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage queues.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Queues',
    'Prio' => '100'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Queues'
};
$Self->{'Frontend::Module'}->{'AgentTicketBulk'} =  {
  'Description' => 'Ticket bulk module',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Bulk-Action'
};
$Self->{'Frontend::Module'}->{'AgentTicketPrint'} =  {
  'Description' => 'Ticket Print',
  'NavBarName' => 'Ticket',
  'Title' => 'Print'
};
$Self->{'Frontend::Module'}->{'AgentTicketFreeText'} =  {
  'Description' => 'Ticket FreeText',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Free Fields'
};
$Self->{'Frontend::Module'}->{'AgentTicketClose'} =  {
  'Description' => 'Ticket Close',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Close'
};
$Self->{'Frontend::Module'}->{'AgentTicketCustomer'} =  {
  'Description' => 'Ticket Customer',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Customer'
};
$Self->{'Frontend::Module'}->{'AgentTicketForward'} =  {
  'Description' => 'Ticket Forward Email',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Forward'
};
$Self->{'Frontend::Module'}->{'AgentTicketBounce'} =  {
  'Description' => 'Ticket Compose Bounce Email',
  'NavBarName' => 'Ticket',
  'Title' => 'Bounce'
};
$Self->{'Frontend::Module'}->{'AgentTicketCompose'} =  {
  'Description' => 'Ticket Compose email Answer',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Compose'
};
$Self->{'Frontend::Module'}->{'AgentTicketResponsible'} =  {
  'Description' => 'Ticket Responsible',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Responsible'
};
$Self->{'Frontend::Module'}->{'AgentTicketOwner'} =  {
  'Description' => 'Ticket Owner',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Owner'
};
$Self->{'Frontend::Module'}->{'AgentTicketHistory'} =  {
  'Description' => 'Ticket History',
  'NavBarName' => 'Ticket',
  'Title' => 'History'
};
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'Subject'} =  '$Text{"Change Queue"}';
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'NextScreen'} =  'LastScreenView';
$Self->{'Frontend::Module'}->{'AgentTicketMove'} =  {
  'Description' => 'Ticket Move',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Move'
};
$Self->{'Frontend::Module'}->{'AgentTicketLock'} =  {
  'Description' => 'Ticket Lock',
  'NavBarName' => 'Ticket',
  'Title' => 'Lock'
};
$Self->{'Frontend::Module'}->{'AgentTicketPriority'} =  {
  'Description' => 'Ticket Priority',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Priority'
};
$Self->{'Frontend::Module'}->{'AgentTicketWatcher'} =  {
  'Description' => 'A TicketWatcher Module',
  'NavBarName' => 'Ticket-Watcher',
  'Title' => 'Ticket-Watcher'
};
$Self->{'Frontend::Module'}->{'AgentTicketPending'} =  {
  'Description' => 'Ticket Pending',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Pending'
};
$Self->{'Frontend::Module'}->{'AgentTicketMerge'} =  {
  'Description' => 'Ticket Merge',
  'NavBarName' => 'Ticket',
  'Title' => 'Merge'
};
$Self->{'Frontend::Module'}->{'AgentTicketNote'} =  {
  'Description' => 'Ticket Note',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Note'
};
$Self->{'Frontend::Module'}->{'AgentTicketPlain'} =  {
  'Description' => 'Ticket plain view of an email',
  'NavBarName' => 'Ticket',
  'Title' => 'Plain'
};
$Self->{'Frontend::Module'}->{'AgentTicketAttachment'} =  {
  'Description' => 'To download attachments',
  'NavBarName' => 'Ticket',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AgentTicketZoom'} =  {
  'Description' => 'Ticket Zoom',
  'Loader' => {
    'JavaScript' => [
      'thirdparty/jquery-tablesorter-2.0.5/jquery.tablesorter.js',
      'Core.UI.Table.Sort.js',
      'Core.Agent.TicketZoom.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Zoom'
};
$Self->{'Frontend::Module'}->{'AgentZoom'} =  {
  'Description' => 'compat module for AgentZoom to AgentTicketZoom',
  'NavBarName' => 'Ticket',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AgentTicketEscalationView'} =  {
  'Description' => 'Overview of all escalated tickets',
  'NavBar' => [
    {
      'AccessKey' => 'e',
      'Block' => '',
      'Description' => 'Overview Escalated Tickets',
      'Link' => 'Action=AgentTicketEscalationView',
      'LinkOption' => '',
      'Name' => 'Escalation view',
      'NavBar' => 'Ticket',
      'Prio' => '120',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Escalation view'
};
$Self->{'Frontend::Module'}->{'AgentTicketStatusView'} =  {
  'Description' => 'Overview of all open tickets',
  'NavBar' => [
    {
      'AccessKey' => 'v',
      'Block' => '',
      'Description' => 'Overview of all open Tickets.',
      'Link' => 'Action=AgentTicketStatusView',
      'LinkOption' => '',
      'Name' => 'Status view',
      'NavBar' => 'Ticket',
      'Prio' => '110',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Status view'
};
$Self->{'Frontend::Module'}->{'AgentCustomerSearch'} =  {
  'Description' => 'AgentCustomerSearch',
  'NavBarName' => 'Ticket',
  'Title' => 'AgentCustomerSearch'
};
$Self->{'Frontend::Module'}->{'AgentTicketWatchView'} =  {
  'Description' => 'Watched Tickets',
  'NavBarName' => 'Ticket',
  'Title' => 'Watched Tickets'
};
$Self->{'Frontend::Module'}->{'AgentTicketResponsibleView'} =  {
  'Description' => 'Responsible Tickets',
  'NavBarName' => 'Ticket',
  'Title' => 'Responsible Tickets'
};
$Self->{'Frontend::Module'}->{'AgentTicketLockedView'} =  {
  'Description' => 'Locked Tickets',
  'NavBarName' => 'Ticket',
  'Title' => 'Locked Tickets'
};
$Self->{'Frontend::Module'}->{'AgentTicketSearch'} =  {
  'Description' => 'Search Ticket',
  'NavBar' => [
    {
      'AccessKey' => 's',
      'Block' => '',
      'Description' => 'Search Tickets',
      'Link' => 'Action=AgentTicketSearch',
      'LinkOption' => 'onclick="window.setTimeout(function(){Core.Agent.Search.OpenSearchDialog(\'AgentTicketSearch\');}, 0); return false;"',
      'Name' => 'Search',
      'NavBar' => 'Ticket',
      'Prio' => '300',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Search'
};
$Self->{'Frontend::Module'}->{'AgentTicketEmail'} =  {
  'Description' => 'Create new email ticket',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'e',
      'Block' => '',
      'Description' => 'Create new email ticket and send this out (outbound)',
      'Link' => 'Action=AgentTicketEmail',
      'LinkOption' => '',
      'Name' => 'New email ticket',
      'NavBar' => 'Ticket',
      'Prio' => '210',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'New email ticket'
};
$Self->{'Frontend::Module'}->{'AgentTicketPhoneInbound'} =  {
  'Description' => 'Incoming Phone Call',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Phone-Ticket'
};
$Self->{'Frontend::Module'}->{'AgentTicketPhoneOutbound'} =  {
  'Description' => 'Phone Call',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Phone-Ticket'
};
$Self->{'Frontend::Module'}->{'AgentTicketPhone'} =  {
  'Description' => 'Create new phone ticket',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'n',
      'Block' => '',
      'Description' => 'Create new phone ticket (inbound)',
      'Link' => 'Action=AgentTicketPhone',
      'LinkOption' => '',
      'Name' => 'New phone ticket',
      'NavBar' => 'Ticket',
      'Prio' => '200',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'New phone ticket'
};
$Self->{'Frontend::Module'}->{'AgentTicketQueue'} =  {
  'Description' => 'Overview of all open Tickets',
  'Loader' => {
    'CSS' => [
      'Core.AgentTicketQueue.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'o',
      'Block' => '',
      'Description' => 'Overview of all open Tickets',
      'Link' => 'Action=AgentTicketQueue',
      'LinkOption' => '',
      'Name' => 'Queue view',
      'NavBar' => 'Ticket',
      'Prio' => '100',
      'Type' => ''
    },
    {
      'AccessKey' => 't',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AgentTicketQueue',
      'LinkOption' => '',
      'Name' => 'Tickets',
      'NavBar' => 'Ticket',
      'Prio' => '200',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'QueueView'
};
$Self->{'CustomerFrontend::HeaderMetaModule'}->{'2-TicketSearch'} =  {
  'Action' => 'CustomerTicketSearch',
  'Module' => 'Kernel::Output::HTML::CustomerHeaderMetaTicketSearch'
};
$Self->{'CustomerFrontend::CommonParam'}->{'TicketID'} =  '';
$Self->{'CustomerFrontend::CommonParam'}->{'Action'} =  'CustomerTicketOverview';
$Self->{'CustomerFrontend::CommonObject'}->{'TicketObject'} =  'Kernel::System::Ticket';
$Self->{'CustomerFrontend::CommonObject'}->{'QueueObject'} =  'Kernel::System::Queue';
$Self->{'Frontend::CommonParam'}->{'TicketID'} =  '';
$Self->{'Frontend::CommonParam'}->{'QueueID'} =  '0';
$Self->{'Frontend::CommonParam'}->{'Action'} =  'AgentDashboard';
$Self->{'Frontend::CommonObject'}->{'TicketObject'} =  'Kernel::System::Ticket';
$Self->{'Frontend::CommonObject'}->{'QueueObject'} =  'Kernel::System::Queue';
$Self->{'CustomerPreferencesGroups'}->{'RefreshTime'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Data' => {
    '' => 'off',
    '10' => '10 minutes',
    '15' => '15 minutes',
    '2' => ' 2 minutes',
    '5' => ' 5 minutes',
    '7' => ' 7 minutes'
  },
  'DataSelected' => '',
  'Key' => 'Refresh interval',
  'Label' => 'Ticket overview',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserRefreshTime',
  'Prio' => '4000'
};
$Self->{'CustomerPreferencesGroups'}->{'ShownTickets'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Data' => {
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30'
  },
  'DataSelected' => '25',
  'Key' => 'Tickets per page',
  'Label' => 'Number of displayed tickets',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserShowTickets',
  'Prio' => '4000'
};
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'SearchCSVData'} =  [
  'TicketNumber',
  'Age',
  'Created',
  'Closed',
  'State',
  'Priority',
  'Lock',
  'CustomerID',
  'CustomerName',
  'From',
  'Subject'
];
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'SearchArticleCSVTree'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'ExtendedSearchCondition'} =  '1';
$Self->{'Ticket::CustomerTicketSearch::Order::Default'} =  'Down';
$Self->{'Ticket::CustomerTicketSearch::SortBy::Default'} =  'Age';
$Self->{'Ticket::CustomerTicketSearch::SearchPageShown'} =  '40';
$Self->{'Ticket::CustomerTicketSearch::SearchLimit'} =  '5000';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'AttributesView'} =  {
  'Owner' => '0',
  'Priority' => '1',
  'Queue' => '1',
  'Responsible' => '0',
  'SLA' => '0',
  'Service' => '0',
  'State' => '1',
  'Type' => '0'
};
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'StateType'} =  [
  'open',
  'closed'
];
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'State'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'PriorityDefault'} =  '3 normal';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'Priority'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'HistoryType'} =  'FollowUp';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'SenderType'} =  'customer';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'ArticleType'} =  'webrequest';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'NextScreenAfterFollowUp'} =  'CustomerTicketOverview';
$Self->{'CustomerPanel::NewTicketQueueSelectionModule'} =  'Kernel::Output::HTML::CustomerNewTicketQueueSelectionGeneric';
$Self->{'CustomerPanelSelectionString'} =  '<Queue>';
$Self->{'CustomerPanelSelectionType'} =  'Queue';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'HistoryType'} =  'WebRequestCustomer';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'SenderType'} =  'customer';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'ArticleType'} =  'webrequest';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'StateDefault'} =  'new';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'SLA'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'Service'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'Queue'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'PriorityDefault'} =  '3 normal';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'Priority'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'NextScreenAfterNewTicket'} =  'CustomerTicketOverview';
$Self->{'AgentSelfNotifyOnAction'} =  '0';
$Self->{'CustomerNotifyJustToRealCustomer'} =  '0';
$Self->{'PreferencesGroups'}->{'CreateNextMask'} =  {
  'Active' => '1',
  'Column' => 'Other Settings',
  'Data' => {
    '' => 'CreateTicket',
    'AgentTicketZoom' => 'TicketZoom'
  },
  'DataSelected' => '',
  'Key' => 'Show this screen after I created a new ticket',
  'Label' => 'Screen after new ticket',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserCreateNextMask',
  'Prio' => '3000'
};
$Self->{'PreferencesGroups'}->{'TicketOverviewPreviewPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '15',
  'Key' => 'Ticket limit per page for Ticket Overview "Preview"',
  'Label' => 'Ticket Overview "Preview" Limit',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserTicketOverviewPreviewPageShown',
  'Prio' => '8200'
};
$Self->{'PreferencesGroups'}->{'TicketOverviewMediumPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '20',
  'Key' => 'Ticket limit per page for Ticket Overview "Medium"',
  'Label' => 'Ticket Overview "Medium" Limit',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserTicketOverviewMediumPageShown',
  'Prio' => '8100'
};
$Self->{'PreferencesGroups'}->{'TicketOverviewSmallPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '25',
  'Key' => 'Ticket limit per page for Ticket Overview "Small"',
  'Label' => 'Ticket Overview "Small" Limit',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserTicketOverviewSmallPageShown',
  'Prio' => '8000'
};
$Self->{'PreferencesGroups'}->{'RefreshTime'} =  {
  'Active' => '1',
  'Column' => 'Other Settings',
  'Data' => {
    '0' => 'off',
    '10' => '10 minutes',
    '15' => '15 minutes',
    '2' => ' 2 minutes',
    '5' => ' 5 minutes',
    '7' => ' 7 minutes'
  },
  'DataSelected' => '0',
  'Desc' => 'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.',
  'Key' => 'Refresh Overviews after',
  'Label' => 'Overview Refresh Time',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserRefreshTime',
  'Prio' => '2000'
};
$Self->{'PreferencesGroups'}->{'CustomQueue'} =  {
  'Active' => '1',
  'Column' => 'Other Settings',
  'Desc' => 'Your queue selection of your favorite queues. You also get notified about those queues via email if enabled.',
  'Key' => 'My Queues',
  'Label' => 'My Queues',
  'Module' => 'Kernel::Output::HTML::PreferencesCustomQueue',
  'Permission' => 'ro',
  'Prio' => '1000'
};
$Self->{'PreferencesGroups'}->{'WatcherNotify'} =  {
  'Active' => '1',
  'Column' => 'Email Settings',
  'Data' => {
    '0' => 'No',
    '1' => 'Yes'
  },
  'DataSelected' => '0',
  'Desc' => 'Send me the same notifications for my watched tickets that the ticket owners will get.',
  'Key' => 'Send ticket watch notifications',
  'Label' => 'Ticket watch notification',
  'Module' => 'Kernel::Output::HTML::PreferencesTicketWatcher',
  'PrefKey' => 'UserSendWatcherNotification',
  'Prio' => '5000'
};
$Self->{'PreferencesGroups'}->{'MoveNotify'} =  {
  'Active' => '1',
  'Column' => 'Email Settings',
  'Data' => {
    '0' => 'No',
    '1' => 'Yes'
  },
  'DataSelected' => '0',
  'Desc' => 'Send me a notification if a ticket is moved into one of "My Queues".',
  'Key' => 'Send ticket move notifications',
  'Label' => 'Ticket move notification',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserSendMoveNotification',
  'Prio' => '4000'
};
$Self->{'PreferencesGroups'}->{'LockTimeoutNotify'} =  {
  'Active' => '1',
  'Column' => 'Email Settings',
  'Data' => {
    '0' => 'No',
    '1' => 'Yes'
  },
  'DataSelected' => '0',
  'Desc' => 'Send me a notification if a ticket is unlocked by the system.',
  'Key' => 'Send ticket lock timeout notifications',
  'Label' => 'Ticket lock timeout notification',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserSendLockTimeoutNotification',
  'Prio' => '3000'
};
$Self->{'PreferencesGroups'}->{'FollowUpNotify'} =  {
  'Active' => '1',
  'Column' => 'Email Settings',
  'Data' => {
    '0' => 'No',
    '1' => 'Yes'
  },
  'DataSelected' => '0',
  'Desc' => 'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.',
  'Key' => 'Send ticket follow up notifications',
  'Label' => 'Ticket follow up notification',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserSendFollowUpNotification',
  'Prio' => '2000'
};
$Self->{'PreferencesGroups'}->{'NewTicketNotify'} =  {
  'Active' => '1',
  'Column' => 'Email Settings',
  'Data' => {
    '0' => 'No',
    '1' => 'Yes'
  },
  'DataSelected' => '0',
  'Desc' => 'Send me a notification if there is a new ticket in "My Queues".',
  'Key' => 'Send new ticket notifications',
  'Label' => 'New ticket notification',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserSendNewTicketNotification',
  'Prio' => '1000'
};
$Self->{'DashboardBackend'}->{'0260-TicketCalendar'} =  {
  'Block' => 'ContentSmall',
  'CacheTTL' => '2',
  'Default' => '1',
  'Group' => '',
  'Limit' => '6',
  'Module' => 'Kernel::Output::HTML::DashboardCalendar',
  'OwnerOnly' => '',
  'Permission' => 'rw',
  'Title' => 'Upcoming Events'
};
$Self->{'DashboardBackend'}->{'0250-TicketStats'} =  {
  'Block' => 'ContentSmall',
  'CacheTTL' => '30',
  'Closed' => '1',
  'Created' => '1',
  'Default' => '1',
  'Group' => '',
  'Module' => 'Kernel::Output::HTML::DashboardTicketStatsGeneric',
  'Permission' => 'rw',
  'Title' => '7 Day Stats'
};
$Self->{'DashboardBackend'}->{'0130-TicketOpen'} =  {
  'Attributes' => 'StateType=open;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'Description' => 'All open tickets, these tickets have already been worked on, but need a response',
  'Filter' => 'All',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::DashboardTicketGeneric',
  'Permission' => 'rw',
  'Time' => 'Age',
  'Title' => 'Open Tickets / Need to be answered'
};
$Self->{'DashboardBackend'}->{'0120-TicketNew'} =  {
  'Attributes' => 'StateType=new;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'Description' => 'All new tickets, these tickets have not been worked on yet',
  'Filter' => 'All',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::DashboardTicketGeneric',
  'Permission' => 'rw',
  'Time' => 'Age',
  'Title' => 'New Tickets'
};
$Self->{'DashboardBackend'}->{'0110-TicketEscalation'} =  {
  'Attributes' => 'TicketEscalationTimeOlderMinutes=1;SortBy=EscalationTime;OrderBy=Down;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'Description' => 'All escalated tickets',
  'Filter' => 'All',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::DashboardTicketGeneric',
  'Permission' => 'rw',
  'Time' => 'EscalationTime',
  'Title' => 'Escalated Tickets'
};
$Self->{'DashboardBackend'}->{'0100-TicketPendingReminder'} =  {
  'Attributes' => 'TicketPendingTimeOlderMinutes=1;StateType=pending reminder;SortBy=PendingTime;OrderBy=Down;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'Description' => 'All tickets with a reminder set where the reminder date has been reached',
  'Filter' => 'Locked',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::DashboardTicketGeneric',
  'Permission' => 'rw',
  'Time' => 'UntilTime',
  'Title' => 'Reminder Tickets'
};
$Self->{'Ticket::DefineEmailFromSeparator'} =  'via';
$Self->{'Ticket::DefineEmailFrom'} =  'SystemAddressName';
$Self->{'CustomerTicket::Permission'}->{'3-CustomerIDCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::CustomerPermission::CustomerIDCheck',
  'Required' => '0'
};
$Self->{'CustomerTicket::Permission'}->{'2-CustomerUserIDCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::CustomerPermission::CustomerUserIDCheck',
  'Required' => '0'
};
$Self->{'CustomerTicket::Permission'}->{'1-GroupCheck'} =  {
  'Granted' => '0',
  'Module' => 'Kernel::System::Ticket::CustomerPermission::GroupCheck',
  'Required' => '1'
};
$Self->{'Ticket::Permission'}->{'4-WatcherCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::Permission::WatcherCheck',
  'Required' => '0'
};
$Self->{'Ticket::Permission'}->{'3-GroupCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::Permission::GroupCheck',
  'Required' => '0'
};
$Self->{'Ticket::Permission'}->{'2-ResponsibleCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::Permission::ResponsibleCheck',
  'Required' => '0'
};
$Self->{'Ticket::Permission'}->{'1-OwnerCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::Permission::OwnerCheck',
  'Required' => '0'
};
$Self->{'System::Permission'} =  [
  'ro',
  'move_into',
  'create',
  'note',
  'owner',
  'priority',
  'rw'
];
$Self->{'Ticket::Frontend::PreMenuModule'}->{'445-Move'} =  {
  'Action' => 'AgentTicketMove',
  'Description' => 'Change queue!',
  'Module' => 'Kernel::Output::HTML::TicketMenuMove',
  'Name' => 'Move'
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'440-Close'} =  {
  'Action' => 'AgentTicketClose',
  'Description' => 'Close this ticket',
  'Link' => 'Action=AgentTicketClose;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Close',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'420-Note'} =  {
  'Action' => 'AgentTicketNote',
  'Description' => 'Add a note to this ticket',
  'Link' => 'Action=AgentTicketNote;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Note',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'300-Priority'} =  {
  'Action' => 'AgentTicketPriority',
  'Description' => 'Change the ticket priority!',
  'Link' => 'Action=AgentTicketPriority;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Priority',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'210-History'} =  {
  'Action' => 'AgentTicketHistory',
  'Description' => 'Shows the ticket history!',
  'Link' => 'Action=AgentTicketHistory;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'History',
  'PopupType' => 'TicketHistory',
  'Target' => ''
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'200-Zoom'} =  {
  'Action' => 'AgentTicketZoom',
  'Description' => 'Look into a ticket!',
  'Link' => 'Action=AgentTicketZoom;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Zoom',
  'PopupType' => '',
  'Target' => ''
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'100-Lock'} =  {
  'Action' => 'AgentTicketLock',
  'Module' => 'Kernel::Output::HTML::TicketMenuLock',
  'Name' => 'Lock',
  'PopupType' => '',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'450-Close'} =  {
  'Action' => 'AgentTicketClose',
  'Description' => 'Close this ticket',
  'Link' => 'Action=AgentTicketClose;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Close',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'448-Watch'} =  {
  'Action' => 'AgentTicketWatcher',
  'Module' => 'Kernel::Output::HTML::TicketMenuTicketWatcher',
  'Name' => 'Watch',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'440-Pending'} =  {
  'Action' => 'AgentTicketPending',
  'Description' => 'Set this ticket to pending',
  'Link' => 'Action=AgentTicketPending;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Pending',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'430-Merge'} =  {
  'Action' => 'AgentTicketMerge',
  'Description' => 'Merge into a different ticket',
  'Link' => 'Action=AgentTicketMerge;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Merge',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'420-Note'} =  {
  'Action' => 'AgentTicketNote',
  'Description' => 'Add a note to this ticket',
  'Link' => 'Action=AgentTicketNote;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Note',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'420-Customer'} =  {
  'Action' => 'AgentTicketCustomer',
  'Description' => 'Change the customer for this ticket',
  'Link' => 'Action=AgentTicketCustomer;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Customer',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'410-Responsible'} =  {
  'Action' => 'AgentTicketResponsible',
  'Description' => 'Change the responsible person for this ticket',
  'Link' => 'Action=AgentTicketResponsible;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuResponsible',
  'Name' => 'Responsible',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'400-Owner'} =  {
  'Action' => 'AgentTicketOwner',
  'Description' => 'Change the owner for this ticket',
  'Link' => 'Action=AgentTicketOwner;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Owner',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'320-Link'} =  {
  'Action' => 'AgentLinkObject',
  'Description' => 'Link this ticket to other objects',
  'Link' => 'Action=AgentLinkObject;SourceObject=Ticket;SourceKey=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Link',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'310-FreeText'} =  {
  'Action' => 'AgentTicketFreeText',
  'Description' => 'Change the free fields for this ticket',
  'Link' => 'Action=AgentTicketFreeText;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Free Fields',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'300-Priority'} =  {
  'Action' => 'AgentTicketPriority',
  'Description' => 'Change the ticket priority',
  'Link' => 'Action=AgentTicketPriority;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Priority',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'210-Print'} =  {
  'Action' => 'AgentTicketPrint',
  'Description' => 'Print this ticket',
  'Link' => 'Action=AgentTicketPrint;TicketID=$QData{"TicketID"}',
  'LinkParam' => 'target="print"',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Print',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'200-History'} =  {
  'Action' => 'AgentTicketHistory',
  'Description' => 'Shows the ticket history',
  'Link' => 'Action=AgentTicketHistory;TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'History',
  'PopupType' => 'TicketHistory',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'100-Lock'} =  {
  'Action' => 'AgentTicketLock',
  'Module' => 'Kernel::Output::HTML::TicketMenuLock',
  'Name' => 'Lock',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'000-Back'} =  {
  'Action' => '',
  'Description' => 'Back',
  'Link' => '$Env{"LastScreenOverview"};TicketID=$QData{"TicketID"}',
  'Module' => 'Kernel::Output::HTML::TicketMenuGeneric',
  'Name' => 'Back',
  'PopupType' => '',
  'Target' => ''
};
$Self->{'Ticket::Frontend::ArticleAttachmentModule'}->{'2-HTML-Viewer'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleAttachmentHTMLViewer'
};
$Self->{'Ticket::Frontend::ArticleAttachmentModule'}->{'1-Download'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleAttachmentDownload'
};
$Self->{'Ticket::Frontend::ArticleComposeModule'}->{'2-CryptEmail'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleComposeCrypt'
};
$Self->{'Ticket::Frontend::ArticleComposeModule'}->{'1-SignEmail'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleComposeSign'
};
$Self->{'Ticket::Frontend::ArticlePreViewModule'}->{'1-SMIME'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleCheckSMIME'
};
$Self->{'Ticket::Frontend::ArticlePreViewModule'}->{'1-PGP'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleCheckPGP'
};
$Self->{'Ticket::Frontend::ArticleViewModule'}->{'1-SMIME'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleCheckSMIME'
};
$Self->{'Ticket::Frontend::ArticleViewModule'}->{'1-PGP'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleCheckPGP'
};
$Self->{'Frontend::CustomerUser::Item'}->{'15-OpenTickets'} =  {
  'Action' => 'AgentTicketSearch',
  'Attributes' => 'StateType=Open;',
  'CSS' => 'Core.Agent.CustomerUser.OpenTicket.css',
  'CSSClassNoOpenTicket' => 'NoOpenTicket',
  'CSSClassOpenTicket' => 'OpenTicket',
  'CustomerUserLogin' => '0',
  'Module' => 'Kernel::Output::HTML::CustomerUserGenericTicket',
  'Subaction' => 'Search',
  'Target' => '_blank',
  'Text' => 'Open tickets'
};
$Self->{'Frontend::HeaderMetaModule'}->{'2-TicketSearch'} =  {
  'Action' => 'AgentTicketSearch',
  'Module' => 'Kernel::Output::HTML::HeaderMetaTicketSearch'
};
$Self->{'Frontend::ToolBarModule'}->{'8-Ticket::TicketLocked'} =  {
  'CssClass' => 'Locked',
  'CssClassNew' => 'Locked New',
  'CssClassReached' => 'Locked Reached',
  'Module' => 'Kernel::Output::HTML::ToolBarTicketLocked',
  'Priority' => '1030030'
};
$Self->{'Frontend::ToolBarModule'}->{'7-Ticket::TicketWatcher'} =  {
  'CssClass' => 'Watcher',
  'CssClassNew' => 'Watcher New',
  'CssClassReached' => 'Watcher Reached',
  'Module' => 'Kernel::Output::HTML::ToolBarTicketWatcher',
  'Priority' => '1030020'
};
$Self->{'Frontend::ToolBarModule'}->{'6-Ticket::TicketResponsible'} =  {
  'CssClass' => 'Responsible',
  'CssClassNew' => 'Responsible New',
  'CssClassReached' => 'Responsible Reached',
  'Module' => 'Kernel::Output::HTML::ToolBarTicketResponsible',
  'Priority' => '1030010'
};
$Self->{'CustomerDBLinkTarget'} =  '';
$Self->{'CustomerDBLink'} =  '$Env{"CGIHandle"}?Action=AgentTicketCustomer;TicketID=$Data{"TicketID"}';
$Self->{'Ticket::StateAfterPending'} =  {
  'pending auto close+' => 'closed successful',
  'pending auto close-' => 'closed unsuccessful'
};
$Self->{'Ticket::PendingAutoStateType'} =  [
  'pending auto'
];
$Self->{'Ticket::PendingReminderStateType'} =  [
  'pending reminder'
];
$Self->{'Ticket::PendingNotificationNotToResponsible'} =  '0';
$Self->{'Ticket::PendingNotificationOnlyToOwner'} =  '0';
$Self->{'Ticket::UnlockStateType'} =  [
  'new',
  'open'
];
$Self->{'Ticket::ViewableStateType'} =  [
  'new',
  'open',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::ViewableLocks'} =  [
  '\'unlock\'',
  '\'tmp_lock\''
];
$Self->{'Ticket::ViewableSenderTypes'} =  [
  '\'customer\''
];
$Self->{'Ticket::Frontend::AutomaticMergeText'} =  'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.';
$Self->{'Ticket::Frontend::MergeText'} =  'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".';
$Self->{'Ticket::Frontend::AgentTicketCustomer'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketCustomer'}->{'Permission'} =  'customer';
$Self->{'Ticket::Frontend::AgentTicketMerge'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketMerge'}->{'Permission'} =  'rw';
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'ArticleTypes'} =  [
  'email-external',
  'email-internal'
];
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'ArticleTypeDefault'} =  'email-external';
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'StateDefault'} =  'closed successful';
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'Permission'} =  'forward';
$Self->{'Ticket::Frontend::ComposeExcludeCcRecipients'} =  '0';
$Self->{'Ticket::Frontend::ComposeReplaceSenderAddress'} =  '0';
$Self->{'Ticket::Frontend::ComposeAddCustomerAddress'} =  '1';
$Self->{'Ticket::Frontend::Quote'} =  '>';
$Self->{'Ticket::Frontend::ResponseFormat'} =  '$QData{"Salutation"}
$QData{"StdResponse"}
$QData{"Signature"}

$TimeShort{"$QData{"Created"}"} - $QData{"OrigFromName"} $Text{"wrote"}:
$QData{"Body"}
';
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'StateType'} =  [
  'open',
  'closed',
  'pending auto',
  'pending reminder'
];
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'Permission'} =  'compose';
$Self->{'Ticket::Frontend::BounceText'} =  'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.';
$Self->{'Ticket::Frontend::AgentTicketBounce'}->{'StateType'} =  [
  'open',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketBounce'}->{'StateDefault'} =  'closed successful';
$Self->{'Ticket::Frontend::AgentTicketBounce'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBounce'}->{'Permission'} =  'bounce';
$Self->{'Ticket::DefaultNextMoveStateType'} =  [
  'open',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'State'} =  '1';
$Self->{'Ticket::Frontend::MoveType'} =  'form';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'ArticleTypes'} =  {
  'note-external' => '1',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'Priority'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'State'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'Responsible'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'Owner'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'TicketType'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'HistoryComment'} =  '%%Responsible';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Title'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'ArticleTypes'} =  {
  'note-external' => '0',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Subject'} =  '$Text{"Responsible Update"}!';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'StateType'} =  [
  'open',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Responsible'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Permission'} =  'responsible';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'HistoryComment'} =  '%%Priority';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Title'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Priority'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'ArticleTypes'} =  {
  'note-external' => '0',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Subject'} =  '$Text{"Priority Update"}!';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'StateType'} =  [
  'open',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Permission'} =  'priority';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'HistoryComment'} =  '%%Pending';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Title'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'ArticleTypes'} =  {
  'note-external' => '0',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Subject'} =  '$Text{"Pending"}!';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'StateDefault'} =  'pending reminder';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'StateType'} =  [
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'State'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Permission'} =  'pending';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'HistoryComment'} =  '%%Owner';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Title'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'ArticleTypes'} =  {
  'note-external' => '0',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Subject'} =  '$Text{"Owner Update"}!';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'StateType'} =  [
  'open',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'OwnerMandatory'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Owner'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Permission'} =  'owner';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'HistoryComment'} =  '%%Note';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Title'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'ArticleTypes'} =  {
  'note-external' => '1',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Subject'} =  '$Text{"Note"}';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Permission'} =  'note';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'HistoryComment'} =  '%%Close';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Title'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'ArticleTypes'} =  {
  'note-external' => '0',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Subject'} =  '$Text{"Close"}';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'StateDefault'} =  'closed successful';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'StateType'} =  [
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'State'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Permission'} =  'close';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'HistoryType'} =  'EmailAgent';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'StateType'} =  [
  'open',
  'pending auto',
  'pending reminder',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'SenderType'} =  'agent';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'ArticleType'} =  'email-external';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'Priority'} =  '3 normal';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'SplitLinkType'} =  {
  'Direction' => 'Target',
  'LinkType' => 'ParentChild'
};
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'HistoryType'} =  'PhoneCallCustomer';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'StateType'} =  [
  'open',
  'pending auto',
  'pending reminder',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'SenderType'} =  'customer';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'ArticleType'} =  'phone';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'Priority'} =  '3 normal';
$Self->{'NewTicketInNewWindow::Enabled'} =  '0';
$Self->{'Ticket::Frontend::ShowCustomerTickets'} =  '1';
$Self->{'Ticket::Frontend::NewQueueSelectionString'} =  '<Queue>';
$Self->{'Ticket::Frontend::NewQueueSelectionType'} =  'Queue';
$Self->{'Ticket::Frontend::NewResponsibleSelection'} =  '1';
$Self->{'Ticket::Frontend::NewOwnerSelection'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'HistoryType'} =  'PhoneCallCustomer';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'StateType'} =  [
  'open',
  'pending auto',
  'pending reminder',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'State'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'Subject'} =  '$Text{"Phone call"}!';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'SenderType'} =  'customer';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'ArticleType'} =  'phone';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'Permission'} =  'phone';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'HistoryType'} =  'PhoneCallAgent';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'StateType'} =  [
  'open',
  'pending auto',
  'pending reminder',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'State'} =  'closed successful';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'Subject'} =  '$Text{"Phone call"}!';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'SenderType'} =  'agent';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'ArticleType'} =  'phone';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'Permission'} =  'phone';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'HistoryComment'} =  '%%FreeText';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Title'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'ArticleTypes'} =  {
  'note-external' => '1',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Subject'} =  '$Text{"Note"}';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Note'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Service'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'TicketType'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Permission'} =  'rw';
$Self->{'Ticket::Frontend::AgentTicketWatchView'}->{'Order::Default'} =  'Up';
$Self->{'Ticket::Frontend::AgentTicketWatchView'}->{'SortBy::Default'} =  'Age';
$Self->{'Ticket::Frontend::AgentTicketResponsibleView'}->{'Order::Default'} =  'Up';
$Self->{'Ticket::Frontend::AgentTicketResponsibleView'}->{'SortBy::Default'} =  'Age';
$Self->{'Ticket::Frontend::AgentTicketLockedView'}->{'Order::Default'} =  'Up';
$Self->{'Ticket::Frontend::AgentTicketLockedView'}->{'SortBy::Default'} =  'Age';
$Self->{'Frontend::Search'}->{'Ticket'} =  {
  '^AgentTicket' => 'Action=AgentTicketSearch;Subaction=AJAX'
};
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'Defaults'}->{'Fulltext'} =  '';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'ArticleCreateTime'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchCSVData'} =  [
  'TicketNumber',
  'Age',
  'Created',
  'Closed',
  'FirstLock',
  'FirstResponse',
  'State',
  'Priority',
  'Queue',
  'Lock',
  'Owner',
  'UserFirstname',
  'UserLastname',
  'CustomerID',
  'CustomerName',
  'From',
  'Subject',
  'AccountedTime',
  'ArticleTree',
  'SolutionInMin',
  'SolutionDiffInMin',
  'FirstResponseInMin',
  'FirstResponseDiffInMin'
];
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchArticleCSVTree'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'Order::Default'} =  'Down';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SortBy::Default'} =  'Age';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchViewableTicketLines'} =  '10';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchPageShown'} =  '40';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchLimit'} =  '2000';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'ExtendedSearchCondition'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketEscalationView'}->{'Order::Default'} =  'Up';
$Self->{'Ticket::Frontend::AgentTicketEscalationView'}->{'SortBy::Default'} =  'EscalationTime';
$Self->{'Ticket::Frontend::AgentTicketEscalationView'}->{'ViewableTicketsPage'} =  '50';
$Self->{'Ticket::Frontend::AgentTicketStatusView'}->{'Order::Default'} =  'Down';
$Self->{'Ticket::Frontend::AgentTicketStatusView'}->{'SortBy::Default'} =  'Age';
$Self->{'Ticket::Frontend::AgentTicketStatusView'}->{'ViewableTicketsPage'} =  '50';
$Self->{'Ticket::Frontend::NeedSpellCheck'} =  '0';
$Self->{'Ticket::Frontend::BulkAccountedTime'} =  '1';
$Self->{'Ticket::Frontend::NeedAccountedTime'} =  '0';
$Self->{'Ticket::Frontend::TimeUnits'} =  ' (work units)';
$Self->{'Ticket::Frontend::AccountTime'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'Order::Default'} =  'Up';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'SortBy::Default'} =  'Age';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'Blink'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'HighlightAge2'} =  '2880';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'HighlightAge1'} =  '1440';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'ViewAllPossibleTickets'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'StripEmptyLines'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketOverviewSortable'} =  '';
$Self->{'Ticket::Frontend::CustomerInfoQueueMaxSize'} =  '18';
$Self->{'Ticket::Frontend::CustomerInfoZoomMaxSize'} =  '22';
$Self->{'Ticket::Frontend::CustomerInfoZoom'} =  '1';
$Self->{'Ticket::Frontend::CustomerInfoComposeMaxSize'} =  '22';
$Self->{'Ticket::Frontend::CustomerInfoCompose'} =  '1';
$Self->{'Ticket::Frontend::TextAreaNote'} =  '78';
$Self->{'Ticket::Frontend::TextAreaEmail'} =  '82';
$Self->{'Ticket::Frontend::HistoryOrder'} =  'normal';
$Self->{'Ticket::Frontend::TicketArticleFilter'} =  '0';
$Self->{'Ticket::ZoomAttachmentDisplayCount'} =  '20';
$Self->{'Ticket::Frontend::ZoomExpandSort'} =  'normal';
$Self->{'Ticket::Frontend::ZoomExpand'} =  '0';
$Self->{'Ticket::Frontend::PlainView'} =  '0';
$Self->{'Ticket::Frontend::BulkFeature'} =  '1';
$Self->{'Ticket::Watcher'} =  '0';
$Self->{'Ticket::Frontend::ListType'} =  'tree';
$Self->{'Ticket::Frontend::PendingDiffTime'} =  '86400';
$Self->{'Ticket::Frontend::CustomerSearchAutoComplete::DynamicWidth'} =  '1';
$Self->{'Ticket::Frontend::CustomerSearchAutoComplete'}->{'MaxResultsDisplayed'} =  '20';
$Self->{'Ticket::Frontend::CustomerSearchAutoComplete'}->{'QueryDelay'} =  '100';
$Self->{'Ticket::Frontend::CustomerSearchAutoComplete'}->{'MinQueryLength'} =  '2';
$Self->{'Ticket::Frontend::CustomerSearchAutoComplete'}->{'Active'} =  '1';
$Self->{'Ticket::Frontend::Overview'}->{'Preview'} =  {
  'CustomerInfo' => '0',
  'CustomerInfoMaxSize' => '18',
  'DefaultPreViewLines' => '25',
  'DefaultViewNewLine' => '90',
  'Module' => 'Kernel::Output::HTML::TicketOverviewPreview',
  'Name' => 'Preview',
  'NameShort' => 'L',
  'StripEmptyLines' => '0',
  'TicketActionsPerTicket' => '0'
};
$Self->{'Ticket::Frontend::Overview'}->{'Medium'} =  {
  'CustomerInfo' => '0',
  'Module' => 'Kernel::Output::HTML::TicketOverviewMedium',
  'Name' => 'Medium',
  'NameShort' => 'M',
  'TicketActionsPerTicket' => '0'
};
$Self->{'Ticket::Frontend::OverviewSmall'}->{'ColumnHeader'} =  'LastCustomerSubject';
$Self->{'Ticket::Frontend::Overview'}->{'Small'} =  {
  'CustomerInfo' => '1',
  'Module' => 'Kernel::Output::HTML::TicketOverviewSmall',
  'Name' => 'Small',
  'NameShort' => 'S'
};
$Self->{'Ticket::EventModulePost'}->{'98-ArticleSearchIndex'} =  {
  'Event' => '(ArticleCreate|ArticleUpdate)',
  'Module' => 'Kernel::System::Ticket::Event::ArticleSearchIndex'
};
$Self->{'Ticket::SearchIndex::Attribute'} =  {
  'WordCountMax' => '1000',
  'WordLengthMax' => '30',
  'WordLengthMin' => '3'
};
$Self->{'Ticket::SearchIndexModule'} =  'Kernel::System::Ticket::ArticleSearchIndex::RuntimeDB';
$Self->{'Ticket::EventModulePost'}->{'920-TicketArticleNewMessageUpdate'} =  {
  'Event' => 'ArticleCreate|ArticleFlagSet',
  'Module' => 'Kernel::System::Ticket::Event::TicketNewMessageUpdate'
};
$Self->{'Ticket::EventModulePost'}->{'910-ForceUnlockOnMove'} =  {
  'Event' => 'TicketQueueUpdate',
  'Module' => 'Kernel::System::Ticket::Event::ForceUnlock'
};
$Self->{'OTRSEscalationEvents::DecayTime'} =  '1440';
$Self->{'Ticket::EventModulePost'}->{'900-EscalationIndex'} =  {
  'Event' => 'TicketSLAUpdate|TicketQueueUpdate|TicketStateUpdate|TicketCreate|ArticleCreate',
  'Module' => 'Kernel::System::Ticket::Event::TicketEscalationIndex'
};
$Self->{'Ticket::EventModulePost'}->{'500-NotificationEvent'} =  {
  'Event' => '',
  'Module' => 'Kernel::System::Ticket::Event::NotificationEvent',
  'Transaction' => '1'
};
$Self->{'Ticket::EventModulePost'}->{'150-TicketPendingTimeReset'} =  {
  'Event' => 'TicketStateUpdate',
  'Module' => 'Kernel::System::Ticket::Event::TicketPendingTimeReset'
};
$Self->{'Ticket::EventModulePost'}->{'140-ResponsibleAutoSet'} =  {
  'Event' => 'TicketOwnerUpdate',
  'Module' => 'Kernel::System::Ticket::Event::ResponsibleAutoSet'
};
$Self->{'Ticket::EventModulePost'}->{'110-AcceleratorUpdate'} =  {
  'Event' => 'TicketStateUpdate|TicketQueueUpdate|TicketLockUpdate',
  'Module' => 'Kernel::System::Ticket::Event::TicketAcceleratorUpdate'
};
$Self->{'Ticket::EventModulePost'}->{'100-ArchiveRestore'} =  {
  'Event' => 'TicketStateUpdate',
  'Module' => 'Kernel::System::Ticket::Event::ArchiveRestore'
};
$Self->{'ArticleDir'} =  '<OTRS_CONFIG_Home>/var/article';
$Self->{'Ticket::StorageModule'} =  'Kernel::System::Ticket::ArticleStorageDB';
$Self->{'Ticket::IndexModule'} =  'Kernel::System::Ticket::IndexAccelerator::RuntimeDB';
$Self->{'Ticket::CounterLog'} =  '<OTRS_CONFIG_Home>/var/log/TicketCounter.log';
$Self->{'Ticket::NumberGenerator::CheckSystemID'} =  '1';
$Self->{'Ticket::NumberGenerator::MinCounterSize'} =  '5';
$Self->{'Ticket::NumberGenerator'} =  'Kernel::System::Ticket::Number::DateChecksum';
$Self->{'Ticket::CustomerArchiveSystem'} =  '0';
$Self->{'Ticket::ArchiveSystem'} =  '0';
$Self->{'Ticket::Service'} =  '0';
$Self->{'Ticket::Type'} =  '0';
$Self->{'Ticket::ResponsibleAutoSet'} =  '1';
$Self->{'Ticket::Responsible'} =  '0';
$Self->{'Ticket::ChangeOwnerToEveryone'} =  '0';
$Self->{'Ticket::NewArticleIgnoreSystemSender'} =  '0';
$Self->{'Ticket::CustomQueue'} =  'My Queues';
$Self->{'Ticket::SubjectFormat'} =  'Left';
$Self->{'Ticket::SubjectFwd'} =  'Fwd';
$Self->{'Ticket::SubjectRe'} =  'Re';
$Self->{'Ticket::SubjectSize'} =  '100';
$Self->{'Ticket::HookDivider'} =  '';
$Self->{'Ticket::Hook'} =  'Ticket#';
$Self->{'Nagios::Acknowledge::HTTP::Password'} =  'some_pass';
$Self->{'Nagios::Acknowledge::HTTP::User'} =  'John';
$Self->{'Nagios::Acknowledge::HTTP::URL'} =  'http://nagios.example.com/nagios/cgi-bin/cmd.cgi?cmd_typ=<CMD_TYP>&cmd_mod=2&host=<HOST_NAME>&service=<SERVICE_NAME>&sticky_ack=on&send_notification=on&persistent=on&com_data=<TicketNumber>&btnSubmit=Commit';
$Self->{'Ticket::EventModulePost'}->{'9-NagiosAcknowledge'} =  {
  'Event' => 'TicketLockUpdate',
  'Module' => 'Kernel::System::Ticket::Event::NagiosAcknowledge'
};
$Self->{'Nagios::Acknowledge::NamedPipe::Service'} =  '[<UNIXTIME>] ACKNOWLEDGE_SVC_PROBLEM;<HOST_NAME>;<SERVICE_NAME>;1;1;1;<LOGIN>;<a href="<CONFIG_HttpType>://<CONFIG_FQDN>/<CONFIG_ScriptAlias>index.pl?Action=AgentTicketZoom&TicketID=<TicketID>"><CONFIG_Ticket::Hook><TicketNumber></a>';
$Self->{'Nagios::Acknowledge::NamedPipe::Host'} =  '[<UNIXTIME>] ACKNOWLEDGE_HOST_PROBLEM;<HOST_NAME>;1;1;1;<LOGIN>;<a href="<CONFIG_HttpType>://<CONFIG_FQDN>/<CONFIG_ScriptAlias>index.pl?Action=AgentTicketZoom&TicketID=<TicketID>"><CONFIG_Ticket::Hook><TicketNumber></a>';
$Self->{'Nagios::Acknowledge::NamedPipe::CMD'} =  'echo \'<OUTPUTSTRING>\' > /usr/local/nagios/var/rw/nagios.cmd';
$Self->{'Nagios::Acknowledge::Type'} =  '';
$Self->{'Nagios::Acknowledge::FreeField::Service'} =  'TicketFreeText2';
$Self->{'Nagios::Acknowledge::FreeField::Host'} =  'TicketFreeText1';
$Self->{'SystemMonitoring::LinkTicketWithCI'} =  '0';
$Self->{'SystemMonitoring::SetIncidentState'} =  '0';
$Self->{'PostMaster::PreFilterModule'}->{'1-SystemMonitoring'} =  {
  'ArticleType' => 'note-report',
  'CloseActionState' => 'closed successful',
  'ClosePendingTime' => '172800',
  'CloseTicketRegExp' => 'OK|UP',
  'DefaultService' => 'Host',
  'FreeTextHost' => '1',
  'FreeTextService' => '2',
  'FreeTextState' => '1',
  'FromAddressRegExp' => 'nagios@example.com',
  'HostRegExp' => '\\s*Host:\\s+(.*)\\s*',
  'Module' => 'Kernel::System::PostMaster::Filter::SystemMonitoring',
  'NewTicketRegExp' => 'CRITICAL|DOWN',
  'SenderType' => 'system',
  'ServiceRegExp' => '\\s*Service:\\s+(.*)\\s*',
  'StateRegExp' => '\\s*State:\\s+(\\S+)'
};
$Self->{'Loader::Agent::CommonJS'}->{'000-GenericInterface'} =  [
  'Core.Agent.Admin.Scheduler.js'
];
$Self->{'Frontend::NotifyModule'}->{'800-Scheduler-Check'} =  {
  'Module' => 'Kernel::Output::HTML::NotificationSchedulerCheck',
  'NotifyGroups' => {
    'admin' => '1',
    'users' => '0'
  }
};
$Self->{'Frontend::Module'}->{'AdminScheduler'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Title' => 'GenericInterface Webservice Mapping GUI'
};
$Self->{'Scheduler::RestartAfterSeconds'} =  '86400';
$Self->{'Scheduler::PIDUpdateTime'} =  '60.0';
$Self->{'Scheduler::SleepTime'} =  '1.0';
$Self->{'Scheduler::LogPath'} =  '<OTRS_CONFIG_Home>/var/log';
$Self->{'GenericInterface::Operation::TicketUpdate'}->{'AutoResponseType'} =  'auto follow up';
$Self->{'GenericInterface::Operation::TicketUpdate'}->{'HistoryComment'} =  '%%GenericInterface Note';
$Self->{'GenericInterface::Operation::TicketUpdate'}->{'HistoryType'} =  'AddNote';
$Self->{'GenericInterface::Operation::TicketUpdate'}->{'SenderType'} =  'agent';
$Self->{'GenericInterface::Operation::TicketUpdate'}->{'ArticleType'} =  'webrequest';
$Self->{'GenericInterface::Operation::TicketCreate'}->{'AutoResponseType'} =  'auto reply';
$Self->{'GenericInterface::Operation::TicketCreate'}->{'HistoryComment'} =  '%%GenericInterface Create';
$Self->{'GenericInterface::Operation::TicketCreate'}->{'HistoryType'} =  'NewTicket';
$Self->{'GenericInterface::Operation::TicketCreate'}->{'SenderType'} =  'agent';
$Self->{'GenericInterface::Operation::TicketCreate'}->{'ArticleType'} =  'webrequest';
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::TicketSearch'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'TicketGet'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::TicketGet'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'TicketGet'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::TicketUpdate'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'TicketUpdate'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::TicketCreate'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'TicketCreate'
};
$Self->{'GenericInterface::Operation::Module'}->{'Session::SessionIDGet'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Session',
  'Name' => 'SessionIDGet'
};
$Self->{'GenericInterface::Mapping::Module'}->{'Simple'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceMappingSimple'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceMappingSimple'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'CSS_IE7' => [
      'Core.Agent.Admin.GenericInterface.IE7.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceMappingSimple.js'
    ]
  },
  'Title' => 'GenericInterface Webservice Mapping GUI'
};
$Self->{'GenericInterface::Transport::Module'}->{'HTTP::SOAP'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceTransportHTTPSOAP',
  'Name' => 'SOAP',
  'Protocol' => 'HTTP'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceInvokerDefault'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceInvoker.js'
    ]
  },
  'Title' => 'GenericInterface Invoker GUI'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceOperationDefault'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceOperation.js'
    ]
  },
  'Title' => 'GenericInterface Operation GUI'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceWebserviceHistory'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceWebserviceHistory.js'
    ]
  },
  'Title' => 'GenericInterface Webservice History GUI'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceTransportHTTPSOAP'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ]
  },
  'Title' => 'GenericInterface TransportHTTPSOAP GUI'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceWebservice'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceWebservice.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Create and manage web services.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Web Services',
    'Prio' => '1000'
  },
  'NavBarName' => 'Admin',
  'Title' => 'GenericInterface Web Service GUI'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceDebugger'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'CSS_IE7' => [
      'Core.Agent.Admin.GenericInterface.IE7.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceDebugger.js'
    ]
  },
  'Title' => 'GenericInterface Debugger GUI'
};
$Self->{'GenericInterface::Invoker::Event'}->{'Article'} =  {
  'ArticleAgentNotification' => '1',
  'ArticleAutoResponse' => '1',
  'ArticleBounce' => '1',
  'ArticleCreate' => '1',
  'ArticleCustomerNotification' => '1',
  'ArticleFlagDelete' => '1',
  'ArticleFlagSet' => '1',
  'ArticleFreeTextUpdate' => '1',
  'ArticleSend' => '1',
  'ArticleUpdate' => '1'
};
$Self->{'GenericInterface::Invoker::Event'}->{'Ticket'} =  {
  'HistoryAdd' => '1',
  'HistoryDelete' => '1',
  'TicketAccountTime' => '1',
  'TicketArchiveFlagUpdate' => '1',
  'TicketCreate' => '1',
  'TicketCustomerUpdate' => '1',
  'TicketDelete' => '1',
  'TicketFlagDelete' => '1',
  'TicketFlagSet' => '1',
  'TicketFreeTextUpdate' => '1',
  'TicketFreeTimeUpdate' => '1',
  'TicketLockUpdate' => '1',
  'TicketMasterLinkDelete' => '1',
  'TicketMerge' => '1',
  'TicketOwnerUpdate' => '1',
  'TicketPendingTimeUpdate' => '1',
  'TicketPriorityUpdate' => '1',
  'TicketQueueUpdate' => '1',
  'TicketResponsibleUpdate' => '1',
  'TicketSLAUpdate' => '1',
  'TicketServiceUpdate' => '1',
  'TicketSlaveLinkAdd' => '1',
  'TicketSlaveLinkDelete' => '1',
  'TicketStateUpdate' => '1',
  'TicketSubscribe' => '1',
  'TicketTitleUpdate' => '1',
  'TicketTypeUpdate' => '1',
  'TicketUnlockTimeoutUpdate' => '1',
  'TicketUnsubscribe' => '1'
};
$Self->{'GenericInterface::Webservice::Path::Separator'} =  '»';
$Self->{'GenericInterface::Operation::Common::CachedAuth::CustomerCacheTTL'} =  '300';
$Self->{'GenericInterface::Operation::Common::CachedAuth::AgentCacheTTL'} =  '300';
$Self->{'GenericInterface::WebserviceConfig::CacheTTL'} =  '3600';
$Self->{'Ticket::EventModulePost'}->{'1000-GenericInterface'} =  {
  'Event' => '.*',
  'Module' => 'Kernel::GenericInterface::Event::Handler',
  'Transaction' => '1'
};
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'TicketFreeText'} =  {
  '1' => '0',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'ArticleFreeText'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'TicketFreeTime'} =  {
  '1' => '0',
  '2' => '0',
  '3' => '0',
  '4' => '0',
  '5' => '0',
  '6' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'TicketFreeText'} =  {
  '1' => '1',
  '10' => '0',
  '11' => '0',
  '12' => '0',
  '13' => '0',
  '14' => '0',
  '15' => '0',
  '16' => '0',
  '2' => '1',
  '3' => '1',
  '4' => '1',
  '5' => '0',
  '6' => '0',
  '7' => '0',
  '8' => '0',
  '9' => '0'
};
$Self->{'TicketFreeTimeOptional6'} =  '1';
$Self->{'TicketFreeTimeKey6'} =  'Time6';
$Self->{'TicketFreeTimeOptional5'} =  '1';
$Self->{'TicketFreeTimeKey5'} =  'Time5';
$Self->{'TicketFreeTimeOptional4'} =  '1';
$Self->{'TicketFreeTimeKey4'} =  'Time4';
$Self->{'TicketFreeTimeOptional3'} =  '1';
$Self->{'TicketFreeTimeKey3'} =  'Time3';
$Self->{'TicketFreeTimeOptional2'} =  '1';
$Self->{'TicketFreeTimeKey2'} =  'Time2';
$Self->{'TicketFreeTimeOptional1'} =  '1';
$Self->{'TicketFreeTimeKey1'} =  'Time1';
$Self->{'AdminCustomerUser::RunInitialWildcardSearch'} =  '1';
$Self->{'TimeShowCompleteDescription'} =  '0';
$Self->{'Loader::Customer::SelectedSkin'} =  'default';
$Self->{'Loader::Customer::Skin'}->{'000-default'} =  {
  'Description' => 'This is the default orange - black skin for OTRS 3.0.',
  'HomePage' => 'www.otrs.org',
  'InternalName' => 'default',
  'VisibleName' => 'Default'
};
$Self->{'Loader::Agent::DefaultSelectedSkin'} =  'default';
$Self->{'Loader::Agent::Skin'}->{'001-slim'} =  {
  'Description' => 'Experimental "Slim" skin which tries to save screen space for power users.',
  'HomePage' => 'www.otrs.org',
  'InternalName' => 'slim',
  'VisibleName' => 'Slim'
};
$Self->{'Loader::Agent::Skin'}->{'001-ivory'} =  {
  'Description' => 'Balanced white skin by Felix Niklas',
  'HomePage' => 'www.felixniklas.de',
  'InternalName' => 'ivory',
  'VisibleName' => 'Ivory'
};
$Self->{'Loader::Agent::Skin'}->{'000-default'} =  {
  'Description' => 'This is the default orange - black skin.',
  'HomePage' => 'www.otrs.org',
  'InternalName' => 'default',
  'VisibleName' => 'Default'
};
$Self->{'OpenMainMenuOnHover'} =  '0';
$Self->{'Loader::Customer::CommonJS'}->{'000-Framework'} =  [
  'thirdparty/jquery-1.6.4/jquery.js',
  'thirdparty/jquery-validate-1.9/jquery.validate.js',
  'thirdparty/jquery-ui-1.8.16/jquery-ui.js',
  'thirdparty/stacktrace-0.3/stacktrace.js',
  'Core.Debug.js',
  'Core.Data.js',
  'Core.Exception.js',
  'Core.JavaScriptEnhancements.js',
  'Core.Config.js',
  'Core.App.js',
  'Core.UI.js',
  'Core.UI.IE7Fixes.js',
  'Core.UI.Accessibility.js',
  'Core.UI.Dialog.js',
  'Core.UI.RichTextEditor.js',
  'Core.UI.Datepicker.js',
  'Core.UI.Popup.js',
  'Core.Form.js',
  'Core.Form.ErrorTooltips.js',
  'Core.Form.Validate.js',
  'Core.Customer.js'
];
$Self->{'Loader::Customer::CommonCSS::IE8'}->{'000-Framework'} =  [];
$Self->{'Loader::Customer::CommonCSS::IE7'}->{'000-Framework'} =  [
  'Core.IE7.css',
  'Core.Tooltip.IE7.css',
  'Core.Dialog.IE7.css'
];
$Self->{'Loader::Customer::CommonCSS::IE6'}->{'000-Framework'} =  [
  'Core.IE6.css',
  'Core.Tooltip.IE6.css'
];
$Self->{'Loader::Customer::CommonCSS'}->{'000-Framework'} =  [
  'Core.Reset.css',
  'Core.Default.css',
  'Core.Form.css',
  'Core.Dialog.css',
  'Core.Tooltip.css',
  'Core.Login.css',
  'Core.Control.css',
  'Core.Table.css',
  'Core.TicketZoom.css',
  'Core.Print.css'
];
$Self->{'Loader::Agent::CommonJS'}->{'000-Framework'} =  [
  'thirdparty/json/json2.js',
  'thirdparty/jquery-1.6.4/jquery.js',
  'thirdparty/jquery-ui-1.8.16/jquery-ui.js',
  'thirdparty/jquery-validate-1.9/jquery.validate.js',
  'thirdparty/stacktrace-0.3/stacktrace.js',
  'Core.JavaScriptEnhancements.js',
  'Core.Debug.js',
  'Core.Data.js',
  'Core.Config.js',
  'Core.Exception.js',
  'Core.JSON.js',
  'Core.AJAX.js',
  'Core.UI.js',
  'Core.UI.IE7Fixes.js',
  'Core.UI.Accordion.js',
  'Core.UI.Datepicker.js',
  'Core.UI.Resizable.js',
  'Core.UI.Table.js',
  'Core.UI.Accessibility.js',
  'Core.UI.RichTextEditor.js',
  'Core.UI.Dialog.js',
  'Core.UI.ActionRow.js',
  'Core.UI.Popup.js',
  'Core.Form.js',
  'Core.Form.ErrorTooltips.js',
  'Core.Form.Validate.js',
  'Core.App.js',
  'Core.Agent.js',
  'Core.Agent.Search.js'
];
$Self->{'Loader::Agent::CommonCSS::IE8'}->{'000-Framework'} =  [
  'Core.OverviewSmall.IE8.css'
];
$Self->{'Loader::Agent::CommonCSS::IE7'}->{'000-Framework'} =  [
  'Core.Default.IE7.css',
  'Core.Header.IE7.css',
  'Core.OverviewControl.IE7.css',
  'Core.OverviewSmall.IE7.css',
  'Core.OverviewMedium.IE7.css',
  'Core.OverviewLarge.IE7.css',
  'Core.PageLayout.IE7.css',
  'Core.Form.IE7.css',
  'Core.Widget.IE7.css',
  'Core.WidgetMenu.IE7.css',
  'Core.Tooltip.IE7.css',
  'Core.Dialog.IE7.css',
  'Core.TicketDetail.IE7.css',
  'Core.Table.IE7.css'
];
$Self->{'Loader::Agent::CommonCSS'}->{'000-Framework'} =  [
  'Core.Reset.css',
  'Core.Default.css',
  'Core.Header.css',
  'Core.OverviewControl.css',
  'Core.OverviewSmall.css',
  'Core.OverviewMedium.css',
  'Core.OverviewLarge.css',
  'Core.Footer.css',
  'Core.PageLayout.css',
  'Core.Form.css',
  'Core.Table.css',
  'Core.Widget.css',
  'Core.WidgetMenu.css',
  'Core.TicketDetail.css',
  'Core.Tooltip.css',
  'Core.Dialog.css',
  'Core.Print.css'
];
$Self->{'Loader::Enabled::JS'} =  '1';
$Self->{'Loader::Enabled::CSS'} =  '1';
$Self->{'Frontend::AgentLinkObject::WildcardSearch'} =  '0';
$Self->{'DashboardBackend'}->{'0410-RSS'} =  {
  'Block' => 'ContentSmall',
  'CacheTTL' => '360',
  'Default' => '1',
  'Description' => '',
  'Group' => '',
  'Limit' => '6',
  'Module' => 'Kernel::Output::HTML::DashboardRSS',
  'Title' => 'OTRS News',
  'URL' => 'http://www.otrs.com/en/rss.xml',
  'URL_de' => 'http://www.otrs.com/de/rss.xml',
  'URL_es' => 'http://www.otrs.com/es/rss.xml'
};
$Self->{'DashboardBackend'}->{'0400-UserOnline'} =  {
  'Block' => 'ContentSmall',
  'CacheTTLLocal' => '5',
  'Default' => '0',
  'Description' => '',
  'Filter' => 'Agent',
  'Group' => '',
  'IdleMinutes' => '60',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::DashboardUserOnline',
  'ShowEmail' => '1',
  'SortBy' => 'UserLastname',
  'Title' => 'Online'
};
$Self->{'DashboardBackend'}->{'0000-ProductNotify'} =  {
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '1440',
  'Default' => '1',
  'Description' => 'News about OTRS releases!',
  'Group' => 'admin',
  'Module' => 'Kernel::Output::HTML::DashboardProductNotify',
  'Title' => 'Product News',
  'URL' => 'http://otrs.org/product.xml'
};
$Self->{'Stats::CustomerIDAsMultiSelect'} =  '1';
$Self->{'Stats::TimeType'} =  'Extended';
$Self->{'Stats::Graph::legend_marker_height'} =  '8';
$Self->{'Stats::Graph::legend_marker_width'} =  '12';
$Self->{'Stats::Graph::legend_spacing'} =  '4';
$Self->{'Stats::Graph::legend_placement'} =  'BC';
$Self->{'Stats::Graph::line_width'} =  '1';
$Self->{'Stats::Graph::dclrs'} =  [
  'red',
  'green',
  'blue',
  'yellow',
  'black',
  'purple',
  'orange',
  'pink',
  'marine',
  'cyan',
  'lgray',
  'lblue',
  'lyellow',
  'lgreen',
  'lred',
  'lpurple',
  'lorange',
  'lbrown'
];
$Self->{'Stats::Graph::textclr'} =  'black';
$Self->{'Stats::Graph::legendclr'} =  'black';
$Self->{'Stats::Graph::accentclr'} =  'black';
$Self->{'Stats::Graph::boxclr'} =  'white';
$Self->{'Stats::Graph::fgclr'} =  'black';
$Self->{'Stats::Graph::transparent'} =  '0';
$Self->{'Stats::Graph::bgclr'} =  'white';
$Self->{'Stats::Graph::r_margin'} =  '20';
$Self->{'Stats::Graph::b_margin'} =  '10';
$Self->{'Stats::Graph::l_margin'} =  '10';
$Self->{'Stats::Graph::t_margin'} =  '10';
$Self->{'Stats::GraphSize'} =  {
  '1200x800' => '1200x800',
  '1600x1200' => '1600x1200',
  '800x600' => '800x600'
};
$Self->{'Stats::Format'} =  {
  'CSV' => 'CSV',
  'GD::Graph::area' => 'graph-area',
  'GD::Graph::bars' => 'graph-bars',
  'GD::Graph::hbars' => 'graph-hbars',
  'GD::Graph::lines' => 'graph-lines',
  'GD::Graph::linespoints' => 'graph-lines-points',
  'GD::Graph::pie' => 'graph-pie',
  'GD::Graph::points' => 'graph-points',
  'Print' => 'Print'
};
$Self->{'Stats::SearchLimit'} =  '500';
$Self->{'Stats::DefaultSelectedFormat'} =  [
  'Print',
  'CSV'
];
$Self->{'Stats::DefaultSelectedPermissions'} =  [
  'stats'
];
$Self->{'Stats::DefaultSelectedDynamicObject'} =  'Ticket';
$Self->{'Stats::SearchPageShown'} =  '20';
$Self->{'Stats::StatsStartNumber'} =  '10000';
$Self->{'Stats::StatsHook'} =  'Stat#';
$Self->{'Frontend::Module'}->{'AgentStats'} =  {
  'Description' => 'Stats',
  'Group' => [
    'stats'
  ],
  'GroupRo' => [
    'stats'
  ],
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.Stats.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AgentStats;Subaction=Overview',
      'LinkOption' => '',
      'Name' => 'Statistics',
      'NavBar' => 'Stats',
      'Prio' => '8500',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview',
      'GroupRo' => [
        'stats'
      ],
      'Link' => 'Action=AgentStats;Subaction=Overview',
      'LinkOption' => '',
      'Name' => 'Overview',
      'NavBar' => 'Stats',
      'Prio' => '100',
      'Type' => ''
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'New',
      'Group' => [
        'stats'
      ],
      'Link' => 'Action=AgentStats;Subaction=Add',
      'LinkOption' => '',
      'Name' => 'New',
      'NavBar' => 'Stats',
      'Prio' => '200',
      'Type' => ''
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Import',
      'Group' => [
        'stats'
      ],
      'Link' => 'Action=AgentStats;Subaction=Import',
      'LinkOption' => '',
      'Name' => 'Import',
      'NavBar' => 'Stats',
      'Prio' => '300',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Stats',
  'Title' => 'Stats'
};
$Self->{'Frontend::Module'}->{'AgentHTMLReference'} =  {
  'Description' => 'HTML Reference',
  'Group' => [
    'users'
  ],
  'GroupRo' => [
    'users'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.HTMLReference.css'
    ]
  },
  'NavBarName' => '',
  'Title' => 'HTML Reference'
};
$Self->{'PublicFrontend::Module'}->{'PublicRepository'} =  {
  'Description' => 'PublicRepository',
  'NavBarName' => '',
  'Title' => 'PublicRepository'
};
$Self->{'PublicFrontend::Module'}->{'PublicDefault'} =  {
  'Description' => 'PublicDefault',
  'NavBarName' => '',
  'Title' => 'PublicDefault'
};
$Self->{'PublicFrontend::CommonParam'}->{'Action'} =  'PublicDefault';
$Self->{'Frontend::Themes'} =  {
  'Lite' => '0',
  'Standard' => '1'
};
$Self->{'CustomerFrontend::Module'}->{'SpellingInline'} =  {
  'Description' => 'Spell checker',
  'NavBarName' => '',
  'Title' => 'Spell Checker'
};
$Self->{'CustomerFrontend::Module'}->{'PictureUpload'} =  {
  'Description' => 'Picture upload module',
  'NavBarName' => 'Ticket',
  'Title' => 'Picture-Upload'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerAccept'} =  {
  'Description' => 'To accept login information, such as an EULA or license.',
  'NavBarName' => '',
  'Title' => 'Info'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerPreferences'} =  {
  'Description' => 'Customer preferences',
  'NavBarName' => '',
  'Title' => 'Preferences'
};
$Self->{'CustomerFrontend::Module'}->{'Logout'} =  {
  'Description' => 'Logout of customer panel',
  'NavBarName' => '',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AdminPackageManager'} =  {
  'Description' => 'Software Package Manager',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Update and extend your system with software packages.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Package Manager',
    'Prio' => '1000'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Package Manager'
};
$Self->{'Frontend::Module'}->{'AdminSelectBox'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Execute SQL statements.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'SQL Box',
    'Prio' => '700'
  },
  'NavBarName' => 'Admin',
  'Title' => 'SQL Box'
};
$Self->{'Frontend::Module'}->{'AdminLog'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'View system log messages.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'System Log',
    'Prio' => '600'
  },
  'NavBarName' => 'Admin',
  'Title' => 'System Log'
};
$Self->{'Frontend::Module'}->{'AdminPerformanceLog'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.PerformanceLog.css'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'View performance benchmark results.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Performance Log',
    'Prio' => '550'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Performance Log'
};
$Self->{'Frontend::Module'}->{'AdminSession'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Manage existing sessions.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Session Management',
    'Prio' => '500'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Session Management'
};
$Self->{'Frontend::Module'}->{'AdminEmail'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Send notifications to users.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Admin Notification',
    'Prio' => '400'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Admin Notification'
};
$Self->{'Frontend::Module'}->{'AdminPostMasterFilter'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Email',
    'Description' => 'Filter incoming emails.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'PostMaster Filters',
    'Prio' => '200'
  },
  'NavBarName' => 'Admin',
  'Title' => 'PostMaster Filters'
};
$Self->{'Frontend::Module'}->{'AdminMailAccount'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Email',
    'Description' => 'Manage POP3 or IMAP accounts to fetch email from.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'PostMaster Mail Accounts',
    'Prio' => '100'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Mail Accounts'
};
$Self->{'Frontend::Module'}->{'AdminPGP'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Email',
    'Description' => 'Manage PGP keys for email encryption.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'PGP Keys',
    'Prio' => '1200'
  },
  'NavBarName' => 'Admin',
  'Title' => 'PGP Key Management'
};
$Self->{'Frontend::Module'}->{'AdminSMIME'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Email',
    'Description' => 'Manage S/MIME certificates for email encryption.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'S/MIME Certificates',
    'Prio' => '1100'
  },
  'NavBarName' => 'Admin',
  'Title' => 'S/MIME Management'
};
$Self->{'Frontend::Module'}->{'AdminRoleGroup'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Link roles to groups.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Roles <-> Groups',
    'Prio' => '800'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Roles <-> Groups'
};
$Self->{'Frontend::Module'}->{'AdminRoleUser'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Link agents to roles.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Agents <-> Roles',
    'Prio' => '700'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Agents <-> Roles'
};
$Self->{'Frontend::Module'}->{'AdminRole'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Create and manage roles.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Roles',
    'Prio' => '600'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Roles'
};
$Self->{'Frontend::Module'}->{'AdminCustomerUserService'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Link customers to services.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Customers <-> Services',
    'Prio' => '500'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Customers <-> Services'
};
$Self->{'Frontend::Module'}->{'AdminCustomerUserGroup'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Link customers to groups.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Customers <-> Groups',
    'Prio' => '400'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Customers <-> Groups'
};
$Self->{'Frontend::NavBarModule'}->{'6-CustomerCompany'} =  {
  'Module' => 'Kernel::Output::HTML::NavBarCustomerCompany'
};
$Self->{'Frontend::Module'}->{'AdminCustomerCompany'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin',
    'users'
  ],
  'GroupRo' => [
    ''
  ],
  'NavBar' => [
    {
      'AccessKey' => 'c',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AdminCustomerCompany;Nav=Agent',
      'LinkOption' => '',
      'Name' => 'Companies',
      'NavBar' => 'Companies',
      'Prio' => '9100',
      'Type' => 'Menu'
    }
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Create and manage companies.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Customer Companies',
    'Prio' => '310'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Customer Companies'
};
$Self->{'Frontend::Module'}->{'AdminCustomerUser'} =  {
  'Description' => 'Edit Customers',
  'Group' => [
    'admin',
    'users'
  ],
  'GroupRo' => [
    ''
  ],
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'c',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AdminCustomerUser;Nav=Agent',
      'LinkOption' => '',
      'Name' => 'Customers',
      'NavBar' => 'Customers',
      'Prio' => '9000',
      'Type' => 'Menu'
    }
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Create and manage customers.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Customers',
    'Prio' => '300'
  },
  'NavBarName' => 'Customers',
  'Title' => 'Customers'
};
$Self->{'Frontend::Module'}->{'AdminUserGroup'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Link agents to groups.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Agents <-> Groups',
    'Prio' => '200'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Agents <-> Groups'
};
$Self->{'Frontend::Module'}->{'AdminGroup'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Create and manage groups.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Groups',
    'Prio' => '150'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Groups'
};
$Self->{'Frontend::Module'}->{'AdminUser'} =  {
  'Description' => 'Create and manage agents.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Create and manage agents.',
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin',
    'Name' => 'Agents',
    'Prio' => '100'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Agents'
};
$Self->{'Frontend::Module'}->{'AdminInit'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarName' => '',
  'Title' => 'Init'
};
$Self->{'Frontend::Module'}->{'Admin'} =  {
  'Description' => 'Admin-Area',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.css'
    ],
    'CSS_IE7' => [
      'Core.Agent.AdminIE7.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.SysConfig.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'a',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=Admin',
      'LinkOption' => '',
      'Name' => 'Admin',
      'NavBar' => 'Admin',
      'Prio' => '10000',
      'Type' => 'Menu'
    }
  ],
  'NavBarModule' => {
    'Module' => 'Kernel::Output::HTML::NavBarModuleAdmin'
  },
  'NavBarName' => 'Admin',
  'Title' => ''
};
$Self->{'Frontend::SearchDefault'} =  'Action=AgentTicketSearch;Subaction=AJAX';
$Self->{'Frontend::Module'}->{'AgentSearch'} =  {
  'Description' => 'Global Search Module',
  'NavBarName' => '',
  'Title' => 'Search'
};
$Self->{'Frontend::Module'}->{'AgentInfo'} =  {
  'Description' => 'Generic Info module',
  'NavBarName' => '',
  'Title' => 'Info'
};
$Self->{'Frontend::Module'}->{'AgentLinkObject'} =  {
  'Description' => 'Link Object',
  'NavBarName' => '',
  'Title' => 'Link Object'
};
$Self->{'Frontend::Module'}->{'AgentBook'} =  {
  'Description' => 'Address book of CustomerUser sources',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => '',
  'Title' => 'Address Book'
};
$Self->{'Frontend::Module'}->{'SpellingInline'} =  {
  'Description' => 'Spell checker',
  'NavBarName' => '',
  'Title' => 'Spell Checker'
};
$Self->{'Frontend::Module'}->{'AgentSpelling'} =  {
  'Description' => 'Spell checker',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => '',
  'Title' => 'Spell Checker'
};
$Self->{'Frontend::Module'}->{'PictureUpload'} =  {
  'Description' => 'Picture upload module',
  'NavBarName' => 'Ticket',
  'Title' => 'Picture-Upload'
};
$Self->{'Frontend::Module'}->{'AgentPreferences'} =  {
  'Description' => 'Agent Preferences',
  'NavBarName' => 'Preferences',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AgentDashboard'} =  {
  'Description' => 'Agent Dashboard',
  'Loader' => {
    'JavaScript' => [
      'thirdparty/flot-0.7/excanvas.js',
      'thirdparty/flot-0.7/jquery.flot.js',
      'Core.UI.Chart.js',
      'Core.UI.DnD.js',
      'Core.Agent.Dashboard.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'd',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AgentDashboard',
      'LinkOption' => '',
      'Name' => 'Dashboard',
      'NavBar' => 'Dashboard',
      'Prio' => '50',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Dashboard',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'Logout'} =  {
  'Description' => 'Logout',
  'NavBarName' => '',
  'Title' => ''
};
$Self->{'CustomerPreferencesGroups'}->{'SMIME'} =  {
  'Active' => '1',
  'Column' => 'Other Settings',
  'Key' => 'S/MIME Certificate Upload',
  'Label' => 'S/MIME Certificate',
  'Module' => 'Kernel::Output::HTML::PreferencesSMIME',
  'PrefKey' => 'UserSMIMEKey',
  'Prio' => '11000'
};
$Self->{'CustomerPreferencesGroups'}->{'PGP'} =  {
  'Active' => '1',
  'Column' => 'Other Settings',
  'Key' => 'PGP Key Upload',
  'Label' => 'PGP Key',
  'Module' => 'Kernel::Output::HTML::PreferencesPGP',
  'PrefKey' => 'UserPGPKey',
  'Prio' => '10000'
};
$Self->{'CustomerPreferencesGroups'}->{'TimeZone'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Key' => 'Time Zone',
  'Label' => 'Time Zone',
  'Module' => 'Kernel::Output::HTML::PreferencesTimeZone',
  'PrefKey' => 'UserTimeZone',
  'Prio' => '5000'
};
$Self->{'CustomerPreferencesGroups'}->{'Theme'} =  {
  'Active' => '0',
  'Column' => 'User Profile',
  'Key' => 'Select your frontend Theme.',
  'Label' => 'Theme',
  'Module' => 'Kernel::Output::HTML::PreferencesTheme',
  'PrefKey' => 'UserTheme',
  'Prio' => '1000'
};
$Self->{'CustomerPreferencesGroups'}->{'Language'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Key' => 'Your language',
  'Label' => 'Interface language',
  'Module' => 'Kernel::Output::HTML::PreferencesLanguage',
  'PrefKey' => 'UserLanguage',
  'Prio' => '2000'
};
$Self->{'CustomerPreferencesGroups'}->{'Password'} =  {
  'Active' => '1',
  'Area' => 'Customer',
  'Column' => 'Other Settings',
  'Label' => 'Change password',
  'Module' => 'Kernel::Output::HTML::PreferencesPassword',
  'PasswordMin2Characters' => '0',
  'PasswordMin2Lower2UpperCharacters' => '0',
  'PasswordMinSize' => '0',
  'PasswordNeedDigit' => '0',
  'PasswordRegExp' => '',
  'Prio' => '1000'
};
$Self->{'CustomerPreferencesView'} =  [
  'User Profile',
  'Other Settings'
];
$Self->{'CustomerPreferences'} =  {
  'Module' => 'Kernel::System::CustomerUser::Preferences::DB',
  'Params' => {
    'Table' => 'customer_preferences',
    'TableKey' => 'preferences_key',
    'TableUserID' => 'user_id',
    'TableValue' => 'preferences_value'
  }
};
$Self->{'Customer::AuthModule::Radius::Die'} =  '1';
$Self->{'Customer::AuthModule::LDAP::Die'} =  '1';
$Self->{'Customer::AuthModule::DB::CustomerPassword'} =  'pw';
$Self->{'Customer::AuthModule::DB::CustomerKey'} =  'login';
$Self->{'Customer::AuthModule::DB::Table'} =  'customer_user';
$Self->{'Customer::AuthModule::DB::CryptType'} =  'md5';
$Self->{'Customer::AuthModule'} =  'Kernel::System::CustomerAuth::DB';
$Self->{'CustomerPanelBodyNewAccount'} =  'Hi <OTRS_USERFIRSTNAME>,

You or someone impersonating you has created a new OTRS account for
you.

Full name: <OTRS_USERFIRSTNAME> <OTRS_USERLASTNAME>
User name: <OTRS_USERLOGIN>
Password : <OTRS_USERPASSWORD>

You can log in via the following URL. We encourage you to change your password
via the Preferences button after logging in.

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>customer.pl
            ';
$Self->{'CustomerPanelSubjectNewAccount'} =  'New OTRS Account!';
$Self->{'CustomerPanelBodyLostPassword'} =  'Hi <OTRS_USERFIRSTNAME>,


New password: <OTRS_NEWPW>

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>customer.pl
            ';
$Self->{'CustomerPanelSubjectLostPassword'} =  'New OTRS password';
$Self->{'CustomerPanelBodyLostPasswordToken'} =  'Hi <OTRS_USERFIRSTNAME>,

You or someone impersonating you has requested to change your OTRS
password.

If you want to do this, click on this link. You will receive another email containing the password.

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>customer.pl?Action=CustomerLostPassword;Token=<OTRS_TOKEN>

If you did not request a new password, please ignore this email.
            ';
$Self->{'CustomerPanelSubjectLostPasswordToken'} =  'New OTRS password request';
$Self->{'CustomerPanelCreateAccount'} =  '1';
$Self->{'CustomerPanelLostPassword'} =  '1';
$Self->{'Frontend::CustomerUser::Item'}->{'1-GoogleMaps'} =  {
  'Attributes' => 'UserStreet;UserCity;UserCountry;',
  'CSS' => 'Core.Agent.CustomerUser.GoogleMaps.css',
  'CSSClass' => 'GoogleMaps',
  'Module' => 'Kernel::Output::HTML::CustomerUserGeneric',
  'Required' => 'UserStreet;UserCity;',
  'Target' => '_blank',
  'Text' => 'Location',
  'URL' => 'http://maps.google.com/maps?z=7&q='
};
$Self->{'CustomerFrontend::HeaderMetaModule'}->{'1-Refresh'} =  {
  'Module' => 'Kernel::Output::HTML::HeaderMetaRefresh'
};
$Self->{'CustomerGroupAlwaysGroups'} =  [
  'users'
];
$Self->{'CustomerGroupSupport'} =  '0';
$Self->{'CustomerPanelUserID'} =  '1';
$Self->{'CustomerPanelSessionName'} =  'CSID';
$Self->{'PreferencesGroups'}->{'TimeZone'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Key' => 'Time Zone',
  'Label' => 'Time Zone',
  'Module' => 'Kernel::Output::HTML::PreferencesTimeZone',
  'PrefKey' => 'UserTimeZone',
  'Prio' => '5000'
};
$Self->{'PreferencesGroups'}->{'OutOfOffice'} =  {
  'Active' => '1',
  'Block' => 'OutOfOffice',
  'Column' => 'User Profile',
  'Key' => '',
  'Label' => 'Out Of Office Time',
  'Module' => 'Kernel::Output::HTML::PreferencesOutOfOffice',
  'PrefKey' => 'UserOutOfOffice',
  'Prio' => '4000'
};
$Self->{'PreferencesGroups'}->{'Theme'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Key' => 'Frontend theme',
  'Label' => 'Theme',
  'Module' => 'Kernel::Output::HTML::PreferencesTheme',
  'PrefKey' => 'UserTheme',
  'Prio' => '3000'
};
$Self->{'PreferencesGroups'}->{'Skin'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Key' => 'Wear this frontend skin',
  'Label' => 'Skin',
  'Module' => 'Kernel::Output::HTML::PreferencesSkin',
  'PrefKey' => 'UserSkin',
  'Prio' => '2000'
};
$Self->{'PreferencesGroups'}->{'Language'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Key' => 'Frontend language',
  'Label' => 'Language',
  'Module' => 'Kernel::Output::HTML::PreferencesLanguage',
  'PrefKey' => 'UserLanguage',
  'Prio' => '1000'
};
$Self->{'PreferencesGroups'}->{'Comment'} =  {
  'Active' => '0',
  'Block' => 'Input',
  'Column' => 'Other Settings',
  'Data' => '$Env{"UserComment"}',
  'Key' => 'Comment',
  'Label' => 'Comment',
  'Module' => 'Kernel::Output::HTML::PreferencesGeneric',
  'PrefKey' => 'UserComment',
  'Prio' => '6000'
};
delete $Self->{'PreferencesGroups'}->{'SpellDict'};
$Self->{'PreferencesGroups'}->{'Password'} =  {
  'Active' => '1',
  'Area' => 'Agent',
  'Column' => 'User Profile',
  'Label' => 'Change password',
  'Module' => 'Kernel::Output::HTML::PreferencesPassword',
  'PasswordMaxLoginFailed' => '0',
  'PasswordMin2Characters' => '0',
  'PasswordMin2Lower2UpperCharacters' => '0',
  'PasswordMinSize' => '0',
  'PasswordNeedDigit' => '0',
  'PasswordRegExp' => '',
  'Prio' => '0500'
};
$Self->{'PreferencesView'} =  [
  'User Profile',
  'Email Settings',
  'Other Settings'
];
$Self->{'PreferencesTableUserID'} =  'user_id';
$Self->{'PreferencesTableValue'} =  'preferences_value';
$Self->{'PreferencesTableKey'} =  'preferences_key';
$Self->{'PreferencesTable'} =  'user_preferences';
$Self->{'PerformanceLog::FileMax'} =  '25';
$Self->{'PerformanceLog::File'} =  '<OTRS_CONFIG_Home>/var/log/Performance.log';
$Self->{'PerformanceLog'} =  '0';
$Self->{'System::Customer::Permission'} =  [
  'ro',
  'rw'
];
$Self->{'NotificationBodyLostPassword'} =  'Hi <OTRS_USERFIRSTNAME>,


Here\'s your new OTRS password.

New password: <OTRS_NEWPW>

You can log in via the following URL:

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl
            ';
$Self->{'NotificationSubjectLostPassword'} =  'New OTRS password';
$Self->{'NotificationBodyLostPasswordToken'} =  'Hi <OTRS_USERFIRSTNAME>,

You or someone impersonating you has requested to change your OTRS
password.

If you want to do this, click on the link below. You will receive another email containing the password.

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=LostPassword;Token=<OTRS_TOKEN>

If you did not request a new password, please ignore this email.
            ';
$Self->{'NotificationSubjectLostPasswordToken'} =  'New OTRS password request';
$Self->{'NotificationSenderEmail'} =  'otrs@<OTRS_CONFIG_FQDN>';
$Self->{'NotificationSenderName'} =  'OTRS Notification Master';
$Self->{'SMIME::PrivatePath'} =  '/etc/ssl/private';
$Self->{'SMIME::CertPath'} =  '/etc/ssl/certs';
$Self->{'SMIME::Bin'} =  '/usr/bin/openssl';
$Self->{'SMIME'} =  '0';
$Self->{'PGP::Log'} =  {
  'BADSIG' => 'The PGP signature with the keyid has not been verified successfully.',
  'ERRSIG' => 'It was not possible to check the PGP signature, this may be caused by a missing public key or an unsupported algorithm.',
  'EXPKEYSIG' => 'The PGP signature was made by an expired key.',
  'GOODSIG' => 'Good PGP signature.',
  'KEYREVOKED' => 'The PGP signature was made by a revoked key, this could mean that the signature is forged.',
  'NODATA' => 'No valid OpenPGP data found.',
  'NO_PUBKEY' => 'No public key found.',
  'REVKEYSIG' => 'The PGP signature was made by a revoked key, this could mean that the signature is forged.',
  'SIGEXPIRED' => 'The PGP signature is expired.',
  'SIG_ID' => 'Signature data.',
  'TRUST_UNDEFINED' => 'This key is not certified with a trusted signature!.',
  'VALIDSIG' => 'The PGP signature with the keyid is good.'
};
$Self->{'PGP::TrustedNetwork'} =  '0';
$Self->{'PGP::Key::Password'} =  {
  '488A0B8F' => 'SomePassword',
  'D2DF79FA' => 'SomePassword'
};
$Self->{'PGP::Options'} =  '--homedir /opt/otrs/.gnupg/ --batch --no-tty --yes';
$Self->{'PGP::Bin'} =  '/usr/bin/gpg';
$Self->{'PGP'} =  '0';
$Self->{'PDF::TTFontFile'}->{'Monospaced'} =  'DejaVuSansMono.ttf';
$Self->{'PDF::TTFontFile'}->{'ProportionalBoldItalic'} =  'DejaVuSans-BoldOblique.ttf';
$Self->{'PDF::TTFontFile'}->{'ProportionalBold'} =  'DejaVuSans-Bold.ttf';
$Self->{'PDF::TTFontFile'}->{'Proportional'} =  'DejaVuSans.ttf';
$Self->{'PDF::MaxPages'} =  '100';
$Self->{'PDF::PageSize'} =  'a4';
$Self->{'PDF::LogoFile'} =  '<OTRS_CONFIG_Home>/var/logo-otrs.png';
$Self->{'PDF'} =  '1';
$Self->{'Package::Timeout'} =  '15';
$Self->{'Package::RepositoryRoot'} =  [
  'http://ftp.otrs.org/pub/otrs/misc/packages/repository.xml',
  'http://otrs.org/repository.xml'
];
$Self->{'Package::FileUpload'} =  '1';
$Self->{'WebUserAgent::Timeout'} =  '15';
$Self->{'SpellCheckerIgnore'} =  [
  'www',
  'webmail',
  'https',
  'http',
  'html',
  'rfc'
];
$Self->{'SpellCheckerDictDefault'} =  'english';
$Self->{'SpellCheckerBin'} =  '/usr/bin/ispell';
$Self->{'SpellChecker'} =  '0';
$Self->{'SwitchToUser'} =  '0';
$Self->{'DemoSystem'} =  '0';
$Self->{'ShowMotd'} =  '0';
$Self->{'LostPassword'} =  '1';
$Self->{'Frontend::Output::FilterText'}->{'AAAURL'} =  {
  'Module' => 'Kernel::Output::HTML::OutputFilterTextURL'
};
$Self->{'CGILogPrefix'} =  'OTRS-CGI';
$Self->{'WebUploadCacheModule'} =  'Kernel::System::Web::UploadCache::DB';
$Self->{'WebMaxFileUpload'} =  '16777216';
$Self->{'TimeWorkingHours::Calendar9'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar9'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar9'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'TimeZone::Calendar9'} =  '0';
$Self->{'TimeZone::Calendar9Name'} =  'Calendar Name 9';
$Self->{'TimeWorkingHours::Calendar8'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar8'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar8'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'TimeZone::Calendar8'} =  '0';
$Self->{'TimeZone::Calendar8Name'} =  'Calendar Name 8';
$Self->{'TimeWorkingHours::Calendar7'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar7'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar7'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'TimeZone::Calendar7'} =  '0';
$Self->{'TimeZone::Calendar7Name'} =  'Calendar Name 7';
$Self->{'TimeWorkingHours::Calendar6'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar6'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar6'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'TimeZone::Calendar6'} =  '0';
$Self->{'TimeZone::Calendar6Name'} =  'Calendar Name 6';
$Self->{'TimeWorkingHours::Calendar5'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar5'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar5'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'TimeZone::Calendar5'} =  '0';
$Self->{'TimeZone::Calendar5Name'} =  'Calendar Name 5';
$Self->{'TimeWorkingHours::Calendar4'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar4'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar4'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'TimeZone::Calendar4'} =  '0';
$Self->{'TimeZone::Calendar4Name'} =  'Calendar Name 4';
$Self->{'TimeWorkingHours::Calendar3'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar3'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar3'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'TimeZone::Calendar3'} =  '0';
$Self->{'TimeZone::Calendar3Name'} =  'Calendar Name 3';
$Self->{'TimeWorkingHours::Calendar2'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar2'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar2'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'TimeZone::Calendar2'} =  '0';
$Self->{'TimeZone::Calendar2Name'} =  'Calendar Name 2';
$Self->{'TimeWorkingHours::Calendar1'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar1'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar1'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'TimeZone::Calendar1'} =  '0';
$Self->{'TimeZone::Calendar1Name'} =  'Calendar Name 1';
$Self->{'TimeWorkingHours'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'CalendarWeekDayStart'} =  '1';
$Self->{'TimeZoneUserBrowserAutoOffset'} =  '1';
$Self->{'TimeZoneUser'} =  '0';
$Self->{'SessionSaveLoginPasswd'} =  '0';
$Self->{'SessionTableValue'} =  'session_value';
$Self->{'SessionTableID'} =  'session_id';
$Self->{'SessionTable'} =  'sessions';
$Self->{'SessionDir'} =  '<OTRS_CONFIG_Home>/var/sessions';
$Self->{'SessionCSRFProtection'} =  '1';
$Self->{'SessionUseCookieAfterBrowserClose'} =  '0';
$Self->{'SessionUseCookie'} =  '1';
$Self->{'SessionDeleteIfTimeToOld'} =  '1';
$Self->{'SessionMaxIdleTime'} =  '21600';
$Self->{'SessionMaxTime'} =  '57600';
$Self->{'SessionDeleteIfNotRemoteID'} =  '1';
$Self->{'SessionCheckRemoteIP'} =  '1';
$Self->{'SessionName'} =  'Session';
$Self->{'SessionModule'} =  'Kernel::System::AuthSession::DB';
$Self->{'Frontend::NotifyModule'}->{'500-OutofOffice-Check'} =  {
  'Module' => 'Kernel::Output::HTML::NotificationOutofOfficeCheck'
};
$Self->{'Frontend::NotifyModule'}->{'200-UID-Check'} =  {
  'Module' => 'Kernel::Output::HTML::NotificationUIDCheck'
};
$Self->{'Frontend::HeaderMetaModule'}->{'100-Refresh'} =  {
  'Module' => 'Kernel::Output::HTML::HeaderMetaRefresh'
};
$Self->{'SendmailBcc'} =  '';
$Self->{'SendmailModule::Host'} =  'mail.example.com';
$Self->{'SendmailModule::CMD'} =  '/usr/sbin/sendmail -i -f';
$Self->{'SendmailModule'} =  'Kernel::System::Email::Sendmail';
$Self->{'LogModule::LogFile::Date'} =  '0';
$Self->{'LogModule::LogFile'} =  '/tmp/otrs.log';
$Self->{'LogModule::SysLog::Charset'} =  'utf-8';
$Self->{'LogModule::SysLog::LogSock'} =  'unix';
$Self->{'LogModule::SysLog::Facility'} =  'user';
$Self->{'LogModule'} =  'Kernel::System::Log::SysLog';
$Self->{'LinkObject::TypeGroup'}->{'0001'} =  [
  'Normal',
  'ParentChild'
];
$Self->{'LinkObject::Type'}->{'ParentChild'} =  {
  'SourceName' => 'Parent',
  'TargetName' => 'Child'
};
$Self->{'LinkObject::Type'}->{'Normal'} =  {
  'SourceName' => 'Normal',
  'TargetName' => 'Normal'
};
$Self->{'LinkObject::ViewMode'} =  'Simple';
$Self->{'CheckEmailInvalidAddress'} =  '@(example)\\.(..|...)$';
$Self->{'CheckEmailValidAddress'} =  '^(root@localhost|admin@localhost)$';
$Self->{'CheckEmailAddresses'} =  '1';
$Self->{'CheckMXRecord'} =  '1';
$Self->{'AttachmentDownloadType'} =  'attachment';
$Self->{'TimeShowAlwaysLong'} =  '0';
$Self->{'TimeInputFormat'} =  'Option';
$Self->{'Frontend::AnimationEnabled'} =  '1';
$Self->{'DefaultViewLines'} =  '6000';
$Self->{'DefaultViewNewLine'} =  '90';
$Self->{'Frontend::RichText::DefaultCSS'} =  'font-family:Geneva,Helvetica,Arial,sans-serif; font-size: 12px;';
$Self->{'Frontend::RichTextHeight'} =  '320';
$Self->{'Frontend::RichTextWidth'} =  '620';
$Self->{'Frontend::RichTextPath'} =  '<OTRS_CONFIG_Frontend::WebPath>js/thirdparty/ckeditor-3.6.2/';
$Self->{'Frontend::RichText'} =  '1';
$Self->{'Frontend::JavaScriptPath'} =  '<OTRS_CONFIG_Frontend::WebPath>js/';
$Self->{'Frontend::CSSPath'} =  '<OTRS_CONFIG_Frontend::WebPath>css/';
$Self->{'Frontend::ImagePath'} =  '<OTRS_CONFIG_Frontend::WebPath>skins/Agent/default/img/';
$Self->{'Frontend::WebPath'} =  '/otrs-web/';
$Self->{'AgentLogo'} =  {
  'StyleHeight' => '67px',
  'StyleRight' => '38px',
  'StyleTop' => '-4px',
  'StyleWidth' => '244px',
  'URL' => 'skins/Agent/default/img/logo_bg.png'
};
$Self->{'CustomerHeadline'} =  'Example Company Support';
$Self->{'DefaultTheme'} =  'Standard';
$Self->{'DefaultUsedLanguages'} =  {
  'ar_SA' => 'Arabic (Saudi Arabia)',
  'bg' => 'Bulgarian (&#x0411;&#x044a;&#x043b;&#x0433;&#x0430;&#x0440;&#x0441;&#x043a;&#x0438;)',
  'ca' => 'Catal&agrave;',
  'cs' => 'Czech (&#x010c;esky)',
  'da' => 'Dansk',
  'de' => 'Deutsch',
  'el' => 'Greek (&#x0395;&#x03bb;&#x03bb;&#x03b7;&#x03bd;&#x03b9;&#x03ba;&#x03ac;)',
  'en' => 'English (United States)',
  'en_CA' => 'English (Canada)',
  'en_GB' => 'English (United Kingdom)',
  'es' => 'Espa&ntilde;ol',
  'es_MX' => 'Espa&ntilde;ol (M&eacute;xico)',
  'et' => 'Eesti',
  'fa' => 'Persian (&#x0641;&#x0627;&#x0631;&#x0633;&#x0649;)',
  'fi' => 'Suomi',
  'fr' => 'Fran&ccedil;ais',
  'hi' => 'Hindi',
  'hr' => 'Hrvatski',
  'hu' => 'Magyar',
  'it' => 'Italiano',
  'ja' => 'Japanese (&#x65e5;&#x672c;&#x8a9e)',
  'lt' => "Lietuvi\x{173} kalba",
  'lv' => 'Latvijas',
  'nb_NO' => 'Norsk bokm&aring;l',
  'nl' => 'Nederlands',
  'pl' => 'Polski',
  'pt' => 'Portugu&ecirc;s',
  'pt_BR' => 'Portugu&ecirc;s Brasileiro',
  'ru' => 'Russian (&#x0420;&#x0443;&#x0441;&#x0441;&#x043a;&#x0438;&#x0439;)',
  'sk_SK' => 'Slovak (Sloven&#x010d;ina)',
  'sr_Cyrl' => "Serbian Cyrillic (\x{441}\x{440}\x{43f}\x{441}\x{43a}\x{438})",
  'sr_Latn' => 'Serbian Latin (Srpski)',
  'sv' => 'Svenska',
  'tr' => 'T&uuml;rk&ccedil;e',
  'uk' => 'Ukrainian (&#x0423;&#x043a;&#x0440;&#x0430;&#x0457;&#x043d;&#x0441;&#x044c;&#x043a;&#x0430;)',
  'vi_VN' => 'Vietnam (Vi&#x0246;t Nam)',
  'zh_CN' => 'Chinese (Sim.) (&#x7b80;&#x4f53;&#x4e2d;&#x6587;)',
  'zh_TW' => 'Chinese (Tradi.) (&#x6b63;&#x9ad4;&#x4e2d;&#x6587;)'
};
$Self->{'DefaultLanguage'} =  'en';
$Self->{'Organization'} =  'Example Company';
$Self->{'AdminEmail'} =  'admin@example.com';
$Self->{'ScriptAlias'} =  'otrs/';
$Self->{'HttpType'} =  'http';
$Self->{'FQDN'} =  'yourhost.example.com';
$Self->{'SystemID'} =  '10';
$Self->{'ProductName'} =  'OTRS';
$Self->{'ConfigLevel'} =  '100';
$Self->{'Frontend::DebugMode'} =  '0';
$Self->{'SecureMode'} =  '0';
}
1;
