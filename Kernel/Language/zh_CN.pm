# --
# Kernel/Language/zh_CN.pm -  provides Chinese Simple language translation
# Copyright (C) 2005 zuowei <j2ee at hirain-sh.com>
# Copyright (C) 2008-2010 Never Min <never at qnofae.org>
# Copyright (C) 2009 Bin Du <bindu2008 at gmail.com>,
# Copyright (C) 2009 Yiye Huang <yiyehuang at gmail.com>
# Copyright (C) 2009 Qingjiu Jia <jiaqj at yahoo.com>
# Copyright (C) 2011 Martin Liu <liuzh66 at gmail.com> http://martinliu.cn
# --
# $Id: zh_CN.pm,v 1.109 2012/02/27 08:26:13 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.109 $) [1];

sub Data {
    my $Self = shift;

    # $$START$$
    # Last translation file sync: 2012-02-02 17:08:51

    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%Y.%M.%D %T';
    $Self->{DateFormatLong}      = ' %A %Y/%M/%D %T';
    $Self->{DateFormatShort}     = '%Y.%M.%D';
    $Self->{DateInputFormat}     = '%Y.%M.%D';
    $Self->{DateInputFormatLong} = '%Y.%M.%D - %T';

    # csv separator
    $Self->{Separator} = '';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => '是',
        'No' => '否',
        'yes' => '是',
        'no' => '未设置',
        'Off' => '关',
        'off' => '关',
        'On' => '开',
        'on' => '开',
        'top' => '顶端',
        'end' => '底部',
        'Done' => '确认',
        'Cancel' => '取消',
        'Reset' => '重置',
        'last' => '最后',
        'before' => '早于',
        'Today' => '今天',
        'Tomorrow' => '明天',
        'Next week' => '',
        'day' => '天',
        'days' => '天',
        'day(s)' => '天',
        'd' => '天',
        'hour' => '小时',
        'hours' => '小时',
        'hour(s)' => '小时',
        'Hours' => '小时',
        'h' => '时',
        'minute' => '分钟',
        'minutes' => '分钟',
        'minute(s)' => '分钟',
        'Minutes' => '分钟',
        'm' => '分',
        'month' => '月',
        'months' => '月',
        'month(s)' => '月',
        'week' => '星期',
        'week(s)' => '星期',
        'year' => '年',
        'years' => '年',
        'year(s)' => '年',
        'second(s)' => '秒',
        'seconds' => '秒',
        'second' => '秒',
        's' => '秒',
        'wrote' => '写道',
        'Message' => '消息',
        'Error' => '错误',
        'Bug Report' => 'Bug 报告',
        'Attention' => '注意',
        'Warning' => '警告',
        'Module' => '模块',
        'Modulefile' => '模块文件',
        'Subfunction' => '子功能',
        'Line' => '行',
        'Setting' => '设置',
        'Settings' => '设置',
        'Example' => '范例',
        'Examples' => '范例',
        'valid' => '有效',
        'Valid' => '有效',
        'invalid' => '无效',
        'Invalid' => '',
        '* invalid' => '* 无效',
        'invalid-temporarily' => '暂时无效',
        ' 2 minutes' => ' 2 分钟',
        ' 5 minutes' => ' 5 分钟',
        ' 7 minutes' => ' 7 分钟',
        '10 minutes' => '10 分钟',
        '15 minutes' => '15 分钟',
        'Mr.' => '先生',
        'Mrs.' => '夫人',
        'Next' => '下一个',
        'Back' => '后退',
        'Next...' => '下一个...',
        '...Back' => '...后退',
        '-none-' => '-无-',
        'none' => '无',
        'none!' => '无!',
        'none - answered' => '无 - 已答复的',
        'please do not edit!' => '不要编辑!',
        'Need Action' => '需要动作',
        'AddLink' => '增加链接',
        'Link' => '链接',
        'Unlink' => '未链接',
        'Linked' => '已链接',
        'Link (Normal)' => '链接 (正常)',
        'Link (Parent)' => '链接 (父)',
        'Link (Child)' => '链接 (子)',
        'Normal' => '正常',
        'Parent' => '父',
        'Child' => '子',
        'Hit' => '点击',
        'Hits' => '点击数',
        'Text' => '正文',
        'Standard' => '标准',
        'Lite' => '简洁',
        'User' => '用户',
        'Username' => '用户名称',
        'Language' => '语言',
        'Languages' => '语言',
        'Password' => '密码',
        'Preferences' => '设置',
        'Salutation' => '称谓',
        'Salutations' => '称谓',
        'Signature' => '签名',
        'Signatures' => '签名',
        'Customer' => '客户',
        'CustomerID' => '客户编号',
        'CustomerIDs' => '客户编号',
        'customer' => '客户',
        'agent' => '服务人员',
        'system' => '系统',
        'Customer Info' => '客户信息',
        'Customer Information' => '客户信息',
        'Customer Company' => '客户单位',
        'Customer Companies' => '客户单位',
        'Company' => '单位',
        'go!' => '开始!',
        'go' => '开始',
        'All' => '全部',
        'all' => '全部',
        'Sorry' => '对不起',
        'update!' => '更新!',
        'update' => '更新',
        'Update' => '更新',
        'Updated!' => '已更新',
        'submit!' => '提交!',
        'submit' => '提交',
        'Submit' => '提交',
        'change!' => '修改!',
        'Change' => '修改',
        'change' => '修改',
        'click here' => '点击这里',
        'Comment' => '注释',
        'Invalid Option!' => '无效选项!',
        'Invalid time!' => '无效时间!',
        'Invalid date!' => '无效日期!',
        'Name' => '名称',
        'Group' => '组名',
        'Description' => '描述',
        'description' => '描述',
        'Theme' => '主题',
        'Created' => '创建',
        'Created by' => '创建人',
        'Changed' => '修改于',
        'Changed by' => '修改人',
        'Search' => '搜索',
        'and' => '到',
        'between' => '在',
        'Fulltext Search' => '全文搜索',
        'Data' => '日期',
        'Options' => '选项',
        'Title' => '称谓',
        'Item' => '条目',
        'Delete' => '删除',
        'Edit' => '修改',
        'View' => '查看',
        'Number' => '编号',
        'System' => '系统',
        'Contact' => '联系人',
        'Contacts' => '联系人',
        'Export' => '导出',
        'Up' => '上',
        'Down' => '下',
        'Add' => '增加',
        'Added!' => '已增加!',
        'Category' => '目录',
        'Viewer' => '查看器',
        'Expand' => '展开',
        'Small' => '简洁',
        'Medium' => '基本',
        'Large' => '详细',
        'Date picker' => '日期选择器',
        'New message' => '新消息',
        'New message!' => '新消息!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            '请先回复该票单，然后回到正常队列视图!',
        'You have %s new message(s)!' => '您有 %s 条新消息!',
        'You have %s reminder ticket(s)!' => '您有 %s 个提醒!',
        'The recommended charset for your language is %s!' => '建议您所用语言的字符集 %s!',
        'Change your password.' => '改变你的密码.',
        'Please activate %s first!' => '请首先激活 %s',
        'No suggestions' => '无建议',
        'Word' => '字',
        'Ignore' => '忽略',
        'replace with' => '替换',
        'There is no account with that login name.' => '该用户名没有帐户信息.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            '登录失败！用户名或密码错误。',
        'There is no acount with that user name.' => '没有此用户。',
        'Please contact your administrator' => '请联系管理员',
        'Logout' => '注销',
        'Logout successful. Thank you for using OTRS!' => '成功注销，谢谢使用!',
        'Invalid SessionID!' => '无效的会话标识符!',
        'Feature not active!' => '该特性尚未激活!',
        'Agent updated!' => '服务人员已被更新！',
        'Create Database' => '创建数据库',
        'System Settings' => '数据库设置 ',
        'Mail Configuration' => '邮件配置',
        'Finished' => '完成',
        'Install OTRS' => '',
        'Intro' => '',
        'License' => '许可证',
        'Database' => '数据库',
        'Configure Mail' => '',
        'Database deleted.' => '',
        'Database setup succesful!' => '',
        'Login is needed!' => '需要先登录!',
        'Password is needed!' => '需要密码!',
        'Take this Customer' => '取得这个客户',
        'Take this User' => '取得这个用户',
        'possible' => '可能',
        'reject' => '拒绝',
        'reverse' => '后退',
        'Facility' => '类别',
        'Time Zone' => '时区',
        'Pending till' => '等待至',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            '',
        'Dispatching by email To: field.' => '分派邮件到: 域.',
        'Dispatching by selected Queue.' => '分派邮件到所选队列.',
        'No entry found!' => '无内容!',
        'Session has timed out. Please log in again.' => '会话超时，请重新登录.',
        'No Permission!' => '无权限!',
        'To: (%s) replaced with database email!' => 'To: (%s) 被数据库邮件地址所替代',
        'Cc: (%s) added database email!' => 'Cc: (%s) 增加数据库邮件地址!',
        '(Click here to add)' => '(点击此处增加)',
        'Preview' => '预览',
        'Package not correctly deployed! Please reinstall the package.' =>
            '',
        '%s is not writable!' => '%s 是不可写的!',
        'Cannot create %s!' => '无法创建 %s!',
        'Check to activate this date' => '',
        'You have Out of Office enabled, would you like to disable it?' =>
            '',
        'Customer %s added' => '客户 %s 已增加',
        'Role added!' => '角色已增加!',
        'Role updated!' => '角色已更新',
        'Attachment added!' => '附件已增加',
        'Attachment updated!' => '附件已更新',
        'Response added!' => '回复已增加',
        'Response updated!' => '回复已更新',
        'Group updated!' => '群组已更新',
        'Queue added!' => '队列已增加',
        'Queue updated!' => '队列已更新',
        'State added!' => '状态已增加',
        'State updated!' => '状态已更新',
        'Type added!' => '类型已增加',
        'Type updated!' => '类型已更新',
        'Customer updated!' => '客户已更新',
        'Customer company added!' => '',
        'Customer company updated!' => '',
        'Mail account added!' => '',
        'Mail account updated!' => '',
        'System e-mail address added!' => '',
        'System e-mail address updated!' => '',
        'Contract' => '合同',
        'Online Customer: %s' => '在线客户: %s',
        'Online Agent: %s' => '在线服务人员：%s',
        'Calendar' => '日历',
        'File' => '文件',
        'Filename' => '文件名',
        'Type' => '类型',
        'Size' => '大小',
        'Upload' => '上传',
        'Directory' => '目录',
        'Signed' => '已签名',
        'Sign' => '签署',
        'Crypted' => '已加密',
        'Crypt' => '加密',
        'PGP' => 'PGP',
        'PGP Key' => 'PGP密钥',
        'PGP Keys' => 'PGP密钥',
        'S/MIME' => 'S/MIME',
        'S/MIME Certificate' => 'S/MIME 证书',
        'S/MIME Certificates' => 'S/MIME 证书',
        'Office' => '办公室',
        'Phone' => '电话',
        'Fax' => '传真',
        'Mobile' => '手机',
        'Zip' => '邮编',
        'City' => '城市',
        'Street' => '街道',
        'Country' => '国家',
        'Location' => '区域',
        'installed' => '已安装',
        'uninstalled' => '未安装',
        'Security Note: You should activate %s because application is already running!' =>
            '安全提示: 您不能激活 %s, 因为此应用已经在运行!',
        'Unable to parse repository index document.' => '无法解析软件仓库索引文档',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            '软件仓库中没有当前系统版本可用的软件包。',
        'No packages, or no new packages, found in selected repository.' =>
            '选中的软件仓库中没有需要安装的软件包。',
        'Edit the system configuration settings.' => '编辑系统配置',
        'printed at' => '打印日期',
        'Loading...' => '加载中...',
        'Dear Mr. %s,' => '尊敬的 %s 先生:',
        'Dear Mrs. %s,' => '尊敬的 %s 女士:',
        'Dear %s,' => '尊敬的 %s:',
        'Hello %s,' => '您好, %s:',
        'This email address already exists. Please log in or reset your password.' =>
            '邮件地址已存在，请登录或重新初始化密码。',
        'New account created. Sent login information to %s. Please check your email.' =>
            '帐户创建成功。登录信息发送到 %s ，请查收邮件。',
        'Please press Back and try again.' => '请返回再试一次.',
        'Sent password reset instructions. Please check your email.' => '密码初始化说明已发送，请检查邮件。',
        'Sent new password to %s. Please check your email.' => '新密码已发送到 %s ，请检查邮件。',
        'Upcoming Events' => '即将到来的事件',
        'Event' => '事件',
        'Events' => '事件',
        'Invalid Token!' => '非法的标记',
        'more' => '更多',
        'For more info see:' => '更多信息请看',
        'Package verification failed!' => '软件包验证失败',
        'Collapse' => '收起',
        'Shown' => '显示',
        'News' => '新闻',
        'Product News' => '产品新闻',
        'OTRS News' => 'OTRS 新闻',
        '7 Day Stats' => '最近 7 天统计',
        'Bold' => '黑体',
        'Italic' => '斜体',
        'Underline' => '底线',
        'Font Color' => '字型颜色',
        'Background Color' => '背景色',
        'Remove Formatting' => '删除格式',
        'Show/Hide Hidden Elements' => '显示/隐藏 隐藏要素',
        'Align Left' => '左对齐',
        'Align Center' => '居中对齐',
        'Align Right' => '右对齐',
        'Justify' => '对齐',
        'Header' => '信息头',
        'Indent' => '缩',
        'Outdent' => '外突',
        'Create an Unordered List' => '创建一个无序列表',
        'Create an Ordered List' => '创建一个有序列表',
        'HTML Link' => 'HTML链接',
        'Insert Image' => '插入图像',
        'CTRL' => '按CTRL',
        'SHIFT' => '按SHIFT',
        'Undo' => '复原',
        'Redo' => '重做',
        'Scheduler process is registered but might not be running.' => '',
        'Scheduler is not running.' => '',

        # Template: AAACalendar
        'New Year\'s Day' => '',
        'International Workers\' Day' => '',
        'Christmas Eve' => '',
        'First Christmas Day' => '',
        'Second Christmas Day' => '',
        'New Year\'s Eve' => '',

        # Template: AAAGenericInterface
        'OTRS as requester' => '',
        'OTRS as provider' => '',
        'Webservice "%s" created!' => '',
        'Webservice "%s" updated!' => '',

        # Template: AAAMonth
        'Jan' => '一月',
        'Feb' => '二月',
        'Mar' => '三月',
        'Apr' => '四月',
        'May' => '五月',
        'Jun' => '六月',
        'Jul' => '七月',
        'Aug' => '八月',
        'Sep' => '九月',
        'Oct' => '十月',
        'Nov' => '十一月',
        'Dec' => '十二月',
        'January' => '一月',
        'February' => '二月',
        'March' => '三月',
        'April' => '四月',
        'May_long' => '五月',
        'June' => '六月',
        'July' => '七月',
        'August' => '八月',
        'September' => '九月',
        'October' => '十月',
        'November' => '十一月',
        'December' => '十二月',

        # Template: AAAPreferences
        'Preferences updated successfully!' => '设置更新成功！',
        'User Profile' => '偏好设置',
        'Email Settings' => '通知邮件设置',
        'Other Settings' => '其它设置',
        'Change Password' => '修改密码',
        'Current password' => '当前密码',
        'New password' => '新密码',
        'Verify password' => '重复新密码',
        'Spelling Dictionary' => '拼写检查字典',
        'Default spelling dictionary' => '默认字典',
        'Max. shown Tickets a page in Overview.' => '单页最大票单数。',
        'The current password is not correct. Please try again!' => '当前密码不正确，请重新输入！',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            '无法更改密码。新密码不一致，请重新输入！',
        'Can\'t update password, it contains invalid characters!' => '无法更改密码，密码不能包含非法字符！',
        'Can\'t update password, it must be at least %s characters long!' =>
            '无法更改密码，密码至少 %s 个字符长度！',
        'Can\'t update password, it must contain at least 2 lowercase  and 2 uppercase characters!' =>
            '无法更改密码，密码必须包含至少2个小写和2个大写字符！',
        'Can\'t update password, it must contain at least 1 digit!' => '无法更改密码，密码必须包含至少1个数字！',
        'Can\'t update password, it must contain at least 2 characters!' =>
            '无法更改密码，密码必须包含至少2个字符！',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            '无法更改密码，该密码已被使用。 请选择一个新密码！',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            '选择CSV文件（统计和搜索）中使用的分隔符。如果不指定，系统将使用默认分隔符。',
        'CSV Separator' => 'CSV分隔符',

        # Template: AAAStats
        'Stat' => '统计',
        'Sum' => '总和',
        'Please fill out the required fields!' => '请填写必填字段',
        'Please select a file!' => '请选择一个文件！',
        'Please select an object!' => '请选择一个对象！',
        'Please select a graph size!' => '请选择图片尺寸！',
        'Please select one element for the X-axis!' => '请为X轴选择一个元素',
        'Please select only one element or turn off the button \'Fixed\' where the select field is marked!' =>
            '请只选择一个元素或关闭被选字段的\'Fixed\'按钮',
        'If you use a checkbox you have to select some attributes of the select field!' =>
            '如果使用复选框，必须选择被选字段的部分属性！',
        'Please insert a value in the selected input field or turn off the \'Fixed\' checkbox!' =>
            '在选定的输入框中请插入一个值，或关闭\'Fixed\'复选框！',
        'The selected end time is before the start time!' => '选定的结束时间早于开始时间！',
        'You have to select one or more attributes from the select field!' =>
            '必须从被选字段中选择一个或多个属性！',
        'The selected Date isn\'t valid!' => '所选日期无效',
        'Please select only one or two elements via the checkbox!' => '请通过复选框选择一个或两个要素！',
        'If you use a time scale element you can only select one element!' =>
            '如果使用时间尺度要素，只能选择其中一个',
        'You have an error in your time selection!' => '选择时间错误！',
        'Your reporting time interval is too small, please use a larger time scale!' =>
            '报告时间间隔太短，请使用更长的间隔！',
        'The selected start time is before the allowed start time!' => '选定的开始时间早于允许的开始时间！',
        'The selected end time is after the allowed end time!' => '选定的结束时间晚于允许的结束时间！',
        'The selected time period is larger than the allowed time period!' =>
            '选定时间段大于允许的时间段！',
        'Common Specification' => '共同规范',
        'X-axis' => 'X轴',
        'Value Series' => '值列',
        'Restrictions' => '限制',
        'graph-lines' => '线图',
        'graph-bars' => '柱状图',
        'graph-hbars' => 'H柱状图',
        'graph-points' => '图点',
        'graph-lines-points' => '图线点',
        'graph-area' => '区图',
        'graph-pie' => '饼图',
        'extended' => '扩展',
        'Agent/Owner' => '服务人员',
        'Created by Agent/Owner' => '创建人',
        'Created Priority' => '创建优先级',
        'Created State' => '创建状态',
        'Create Time' => '创建时间',
        'CustomerUserLogin' => '客户登陆',
        'Close Time' => '关闭时间',
        'TicketAccumulation' => '票单积累',
        'Attributes to be printed' => '打印的属性',
        'Sort sequence' => '排序',
        'Order by' => '排序',
        'Limit' => '限制',
        'Ticketlist' => '票单清单',
        'ascending' => '升序',
        'descending' => '降序',
        'First Lock' => '首先锁定',
        'Evaluation by' => '评价人',
        'Total Time' => '总时间',
        'Ticket Average' => '票单平均处理时间',
        'Ticket Min Time' => '票单最小处理时间',
        'Ticket Max Time' => '票单最大处理时间',
        'Number of Tickets' => '票单数',
        'Article Average' => '文章平均处理时间',
        'Article Min Time' => '文章最小处理时间',
        'Article Max Time' => '文章最大处理时间',
        'Number of Articles' => '文章数',
        'Accounted time by Agent' => '服务人员处理票单所用的时间',
        'Ticket/Article Accounted Time' => '票单/文章所占用的时间',
        'TicketAccountedTime' => '票单所占用的时间',
        'Ticket Create Time' => '票单创建时间',
        'Ticket Close Time' => '票单关闭时间',

        # Template: AAATicket
        'Status View' => '状态视图',
        'Bulk' => '批量',
        'Lock' => '锁定',
        'Unlock' => '解锁',
        'History' => '历史',
        'Zoom' => '展开',
        'Age' => '总时长',
        'Bounce' => '退回',
        'Forward' => '转发',
        'From' => '发件人',
        'To' => '收件人',
        'Cc' => '抄送',
        'Bcc' => '暗送',
        'Subject' => '标题',
        'Move' => '移动',
        'Queue' => '队列',
        'Queues' => '队列',
        'Priority' => '优先级',
        'Priorities' => '优先级',
        'Priority Update' => '更新优先级',
        'Priority added!' => '',
        'Priority updated!' => '',
        'Signature added!' => '',
        'Signature updated!' => '',
        'SLA' => 'SLA',
        'Service Level Agreement' => '服务级别协议',
        'Service Level Agreements' => '服务级别协议',
        'Service' => '服务',
        'Services' => '服务',
        'State' => '状态',
        'States' => '状态',
        'Status' => '状态',
        'Statuses' => '状态',
        'Ticket Type' => '票单类型',
        'Ticket Types' => '票单类型',
        'Compose' => '撰写',
        'Pending' => '等待',
        'Owner' => '所有者',
        'Owner Update' => '更新所有者',
        'Responsible' => '负责人',
        'Responsible Update' => '更新负责人',
        'Sender' => '发件人',
        'Article' => '文章',
        'Ticket' => '票单',
        'Createtime' => '创建时间',
        'plain' => '纯文本',
        'Email' => '邮件地址',
        'email' => 'E-Mail',
        'Close' => '关闭',
        'Action' => '动作',
        'Attachment' => '附件',
        'Attachments' => '附件',
        'This message was written in a character set other than your own.' =>
            '这封邮件所用字符集与您的系统字符集不符',
        'If it is not displayed correctly,' => '如果没有给正确地显示,',
        'This is a' => '这是一个',
        'to open it in a new window.' => '在新窗口中打开它',
        'This is a HTML email. Click here to show it.' => '这是一封HTML格式邮件，点击这里显示.',
        'Free Fields' => '自定义字段',
        'Merge' => '合并',
        'merged' => '已合并',
        'closed successful' => '成功关闭',
        'closed unsuccessful' => '失败关闭',
        'Locked Tickets Total' => '锁定票单总数',
        'Locked Tickets Reminder Reached' => '锁定票单提醒',
        'Locked Tickets New' => '锁定的新票单',
        'Responsible Tickets Total' => '负责票单总数',
        'Responsible Tickets New' => '负责的新票单',
        'Responsible Tickets Reminder Reached' => '负责新票单提醒',
        'Watched Tickets Total' => '关注票单总数',
        'Watched Tickets New' => '关注的新票单',
        'Watched Tickets Reminder Reached' => '关注新票单提醒',
        'All tickets' => '所有票单',
        'Available tickets' => '',
        'Escalation' => '升级',
        'last-search' => '上次搜索',
        'QueueView' => '队列视图',
        'Ticket Escalation View' => '票单升级视图',
        'Message from' => '',
        'End message' => '',
        'Forwarded message from' => '',
        'End forwarded message' => '',
        'new' => '新建',
        'open' => '打开',
        'Open' => '打开',
        'Open tickets' => '',
        'closed' => '已关闭',
        'Closed' => '已关闭',
        'Closed tickets' => '',
        'removed' => '已删除',
        'pending reminder' => '等待提醒',
        'pending auto' => '自动等待',
        'pending auto close+' => '等待自动关闭+',
        'pending auto close-' => '等待自动关闭-',
        'email-external' => '外部邮件',
        'email-internal' => '内部邮件',
        'note-external' => '外部注解',
        'note-internal' => '内部注解',
        'note-report' => '注解报告',
        'phone' => '电话',
        'sms' => '短信',
        'webrequest' => 'Web请求',
        'lock' => '锁定',
        'unlock' => '未锁定',
        'very low' => '非常低',
        'low' => '低',
        'normal' => '正常',
        'high' => '高',
        'very high' => '非常高',
        '1 very low' => '1-非常低',
        '2 low' => '2-低',
        '3 normal' => '3-正常',
        '4 high' => '4-高',
        '5 very high' => '5-非常高',
        'auto follow up' => '',
        'auto reject' => '',
        'auto remove' => '',
        'auto reply' => '',
        'auto reply/new ticket' => '',
        'Ticket "%s" created!' => '有"%s"个票单创建!',
        'Ticket Number' => '票单编号',
        'Ticket Object' => '票单对象',
        'No such Ticket Number "%s"! Can\'t link it!' => '编号为"%s"的票单不存在，不能链接!',
        'You don\'t have write access to this ticket.' => '',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            '',
        'Ticket selected.' => '',
        'Ticket is locked by another agent.' => '',
        'Ticket locked.' => '',
        'Don\'t show closed Tickets' => '不显示已关闭的票单',
        'Show closed Tickets' => '显示已关闭的票单',
        'New Article' => '新文章',
        'Unread article(s) available' => '未读文章',
        'Remove from list of watched tickets' => '从关注票单中删除',
        'Add to list of watched tickets' => '添加到关注票单清单',
        'Email-Ticket' => '邮件票单',
        'Create new Email Ticket' => '创建邮件票单',
        'Phone-Ticket' => '电话票单',
        'Search Tickets' => '搜索票单',
        'Edit Customer Users' => '修改客户帐户',
        'Edit Customer Company' => '修改客户公司',
        'Bulk Action' => '批量处理',
        'Bulk Actions on Tickets' => '批量处理票单',
        'Send Email and create a new Ticket' => '发送邮件并创建新票单',
        'Create new Email Ticket and send this out (Outbound)' => '创建邮件票单（出栈）',
        'Create new Phone Ticket (Inbound)' => '创建电话票单（入栈）',
        'Overview of all open Tickets' => '所有开放票单概况',
        'Locked Tickets' => '锁定的票单',
        'My Locked Tickets' => '我的锁定票单',
        'My Watched Tickets' => '我的关注票单',
        'My Responsible Tickets' => '我负责的票单',
        'Watched Tickets' => '关注的票单',
        'Watched' => '已关注',
        'Watch' => '关注',
        'Unwatch' => '不关注',
        'Lock it to work on it' => '',
        'Unlock to give it back to the queue' => '',
        'Show the ticket history' => '',
        'Print this ticket' => '',
        'Print this article' => '',
        'Split this article' => '',
        'Forward article via mail' => '',
        'Change the ticket priority' => '',
        'Change the ticket free fields!' => '修改自定义字段',
        'Link this ticket to other objects' => '',
        'Change the owner for this ticket' => '',
        'Change the  customer for this ticket' => '',
        'Add a note to this ticket' => '',
        'Merge into a different ticket' => '',
        'Set this ticket to pending' => '',
        'Close this ticket' => '',
        'Look into a ticket!' => '查看票单内容',
        'Delete this ticket' => '',
        'Mark as Spam!' => '标记为垃圾!',
        'My Queues' => '我的队列',
        'Shown Tickets' => '显示票单',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            '您的单号为"<OTRS_TICKET>"的邮件票单 被合并到单号"<OTRS_MERGE_TO_TICKET>" !',
        'Ticket %s: first response time is over (%s)!' => '票单%s：首次响应时间已超过(%s)!',
        'Ticket %s: first response time will be over in %s!' => '票单%s: 首次响应时间将在(%s)内超时!',
        'Ticket %s: update time is over (%s)!' => '票单%s: 更新时间已超过(%s)!',
        'Ticket %s: update time will be over in %s!' => '票单%s: 更新时间将在(%s)内超时!',
        'Ticket %s: solution time is over (%s)!' => '票单%s: 解决时间已超过(%s)!',
        'Ticket %s: solution time will be over in %s!' => '解决时间将在(%s)内超时!',
        'There are more escalated tickets!' => '有更多升级的票单',
        'Plain Format' => '纯文本格式',
        'Reply All' => '回复所有',
        'Direction' => '方向',
        'Agent (All with write permissions)' => '服务人员（所有写权限）',
        'Agent (Owner)' => '服务人员（所有人）',
        'Agent (Responsible)' => '服务人员（负责人）',
        'New ticket notification' => '新票单通知',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            '如果我的队列中有新的票单，发通知给我.',
        'Send new ticket notifications' => '发送新票单通知',
        'Ticket follow up notification' => '票单跟进通知',
        'Ticket lock timeout notification' => '票单锁定超时通知',
        'Send me a notification if a ticket is unlocked by the system.' =>
            '如果票单被系统解锁，请通知我.',
        'Send ticket lock timeout notifications' => '发送票单锁定超时间通知',
        'Ticket move notification' => '票单移动通知',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            '如果有票单被转入我的队列，请通知我.',
        'Send ticket move notifications' => '发送票单移动通知',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            '',
        'Custom Queue' => '客户队列',
        'QueueView refresh time' => '队列视图刷新频率',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            '如果启用此功能, 队列视图会自动在指定时间内自动刷新.',
        'Refresh QueueView after' => '队列视图多久后刷新',
        'Screen after new ticket' => '创建新后的视图',
        'Show this screen after I created a new ticket' => '创建完新的票单之后返回创建票单页面还是显示该票单',
        'Closed Tickets' => '关闭的票单',
        'Show closed tickets.' => '显示已关闭票单',
        'Max. shown Tickets a page in QueueView.' => '队列视图每页最大显示数',
        'Ticket Overview "Small" Limit' => '票单概览“小”模式限制',
        'Ticket limit per page for Ticket Overview "Small"' => '票单概览“小”模式每页数量',
        'Ticket Overview "Medium" Limit' => '票单概览“中”模式限制',
        'Ticket limit per page for Ticket Overview "Medium"' => '票单概览“中”模式每页数量',
        'Ticket Overview "Preview" Limit' => '票单概览“预览”模式限制',
        'Ticket limit per page for Ticket Overview "Preview"' => '票单概览“预览”模式每页数量',
        'Ticket watch notification' => '票单关注通知',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            '对我所关注的票单，给所有者发送通知时，也给我发送相同的通知',
        'Send ticket watch notifications' => '发送票单关注通知',
        'Out Of Office Time' => '不在办公室的时间',
        'New Ticket' => '新的票单',
        'Create new Ticket' => '创建票单',
        'Customer called' => '客户致电',
        'phone call' => '电话呼叫',
        'Phone Call Outbound' => '电话呼叫出栈',
        'Phone Call Inbound' => '',
        'Reminder Reached' => '提醒已达',
        'Reminder Tickets' => '提醒票单',
        'Escalated Tickets' => '升级的票单',
        'New Tickets' => '新的票单',
        'Open Tickets / Need to be answered' => '打开的/需要回答的票单',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            '所有打开票单，这些票单已经在处理中，但是需要一个回复',
        'All new tickets, these tickets have not been worked on yet' => '所有新建票单，这些票单目前还没有被处理',
        'All escalated tickets' => '所有升级的票单',
        'All tickets with a reminder set where the reminder date has been reached' =>
            '所有设置提醒日期已经到达的票单',
        'Archived tickets' => '归档的票单',
        'Unarchived tickets' => '未归档的票单',
        'History::Move' => '历史：移动。票单移到队列 "%s" (%s)， 从队列 "%s" (%s).',
        'History::TypeUpdate' => '历史：类型更新。更新类型为 %s (ID=%s).',
        'History::ServiceUpdate' => '历史：服务更新。服务更新为 %s (ID=%s).',
        'History::SLAUpdate' => '历史：SLA更新。更新SLA为 %s (ID=%s).',
        'History::NewTicket' => '历史：新建票单。新票单 [%s] 被创建 (Q=%s;P=%s;S=%s).',
        'History::FollowUp' => '历史：后续。后续为[%s]. %s',
        'History::SendAutoReject' => '历史：自动拒绝发送给 "%s".',
        'History::SendAutoReply' => '历史：自动回复发送给 "%s".',
        'History::SendAutoFollowUp' => '历史：自动跟踪发送给 "%s".',
        'History::Forward' => '历史：转发给 "%s".',
        'History::Bounce' => '历史：退回给 "%s".',
        'History::SendAnswer' => '历史：发送回复给 "%s".',
        'History::SendAgentNotification' => '历史：发送通知"%s" 给服务人员"%s".',
        'History::SendCustomerNotification' => '历史：发送客户通知给 "%s".',
        'History::EmailAgent' => '历史：发邮件给服务人员.',
        'History::EmailCustomer' => '历史：发邮件给客户 %s',
        'History::PhoneCallAgent' => '历史：打电话给客户',
        'History::PhoneCallCustomer' => '历史：客户已打过电话',
        'History::AddNote' => '历史：添加注释 (%s)',
        'History::Lock' => '历史：票单锁定.',
        'History::Unlock' => '历史：票单解锁.',
        'History::TimeAccounting' => '历史：工时管理， %s 时间单位(天)被记录。 总共 %s 时间单位被记录.',
        'History::Remove' => '历史：移动 %s',
        'History::CustomerUpdate' => '历史：客户更新 %s',
        'History::PriorityUpdate' => '历史：优先度更新，从 "%s" (%s) 更新到 "%s" (%s).',
        'History::OwnerUpdate' => '历史：所有人更新，新所有人是 "%s" (ID=%s).',
        'History::LoopProtection' => '历史：循环保护! 未发生自动回复 "%s".',
        'History::Misc' => '历史：其他 %s',
        'History::SetPendingTime' => '历史：刷新%s',
        'History::StateUpdate' => '历史：状态从"%s" 更新为 "%s"',
        'History::TicketDynamicFieldUpdate' => '历史：票单自定义文本更新， %s=%s;%s=%s;',
        'History::WebRequestCustomer' => '历史：客户进行网上请求.',
        'History::TicketLinkAdd' => '历史：到票单"%s" 的链接被建立',
        'History::TicketLinkDelete' => '历史：票单"%s" 的链接被删除',
        'History::Subscribe' => '历史：为"%s" 用户添加订阅.',
        'History::Unsubscribe' => '历史：为用户 "%s" 取消订阅',
        'History::SystemRequest' => '历史：系统请求',
        'History::ResponsibleUpdate' => '历史：负责人更新',
        'History::ArchiveFlagUpdate' => '',

        # Template: AAAWeekDay
        'Sun' => '日',
        'Mon' => '一',
        'Tue' => '二',
        'Wed' => '三',
        'Thu' => '四',
        'Fri' => '五',
        'Sat' => '六',

        # Template: AdminAttachment
        'Attachment Management' => '附件管理',
        'Actions' => '动作',
        'Go to overview' => '返回概览',
        'Add attachment' => '新增附件',
        'List' => '列表',
        'Validity' => '',
        'No data found.' => '没有找到数据。',
        'Download file' => '下载文件',
        'Delete this attachment' => '删除该附件',
        'Add Attachment' => '新增附件',
        'Edit Attachment' => '修改附件',
        'This field is required.' => '该字段是必须的。',
        'or' => '或者',

        # Template: AdminAutoResponse
        'Auto Response Management' => '自动回复管理',
        'Add auto response' => '新增自动回复',
        'Add Auto Response' => '新增自动回复',
        'Edit Auto Response' => '修改自动回复',
        'Response' => '回复',
        'Auto response from' => '自动回复的发件人',
        'Reference' => '相关参考',
        'You can use the following tags' => '你可以使用以下的标记',
        'To get the first 20 character of the subject.' => '显示标题的前20个字节',
        'To get the first 5 lines of the email.' => '显示邮件的前五行',
        'To get the realname of the sender (if given).' => '显示发件人的真实名字',
        'To get the article attribute' => '取得信件的一些属性',
        ' e. g.' => '例如',
        'Options of the current customer user data' => '客户相关的一些数据',
        'Ticket owner options' => '票单所有者相关的一些数据',
        'Ticket responsible options' => '票单负责人相关的一些数据',
        'Options of the current user who requested this action' => '当时操作人相关的一些数据',
        'Options of the ticket data' => '票单相关的一些数据',
        'Config options' => '系统配置数据',
        'Example response' => '这里有一个范例',

        # Template: AdminCustomerCompany
        'Customer Company Management' => '管理客户单位',
        'Wildcards like \'*\' are allowed.' => '',
        'Add customer company' => '新增客户单位',
        'Please enter a search term to look for customer companies.' => '请输入一个搜索条件以查找客户单位。',
        'Add Customer Company' => '新增客户单位',

        # Template: AdminCustomerUser
        'Customer Management' => '客户管理',
        'Add customer' => '新增客户',
        'Select' => '选择',
        'Hint' => '提示',
        'Customer will be needed to have a customer history and to login via customer panel.' =>
            '需要建立客户档案以记录服务过程，并可让客户从自助服务界面登录。',
        'Please enter a search term to look for customers.' => '请输入一个搜索条件以寻找客户的资料.',
        'Last Login' => '最后一次登录',
        'Add Customer' => '新增客户',
        'Edit Customer' => '修改客户',
        'This field is required and needs to be a valid email address.' =>
            '该栏位必须输入有效的邮件地址。',
        'This email address is not allowed due to the system configuration.' =>
            '该邮件地址不符合系统配置要求。',
        'This email address failed MX check.' => '该邮件地址MX检查无效。',
        'DNS problem, please check your configuration and the error log.' =>
            '',
        'The syntax of this email address is incorrect.' => '该邮件地址语法错误。',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => '管理客户与群组的对应关系',
        'Notice' => '注意',
        'This feature is disabled!' => '该功能已关闭',
        'Just use this feature if you want to define group permissions for customers.' =>
            '该功能用于为客户定义权限组。',
        'Enable it here!' => '打开该功能',
        'Search for customers.' => '',
        'Edit Customer Default Groups' => '修改客户默认群组',
        'These groups are automatically assigned to all customers.' => '全部客户将被自动加入该群组。',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            '可以通过系统配置项 "CustomerGroupAlwaysGroups"修改默认群组。',
        'Filter for Groups' => '群组过滤',
        'Select the customer:group permissions.' => '选择客户:群组设定权限。',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            '如果没有选择，将无法给客户设定群组权限（票单将对该客户不可用）。',
        'Search Result:' => '搜索结果',
        'Customers' => '客户',
        'Groups' => '群组',
        'No matches found.' => '没有找到相匹配的.',
        'Change Group Relations for Customer' => '为客户修改群组',
        'Change Customer Relations for Group' => '为群组修改客户',
        'Toggle %s Permission for all' => '切换 %s 权限给全部',
        'Toggle %s permission for %s' => '切换 %s 权限给 %s',
        'Customer Default Groups:' => '客户默认群组：',
        'No changes can be made to these groups.' => '该群组无法修改。',
        'ro' => '只读',
        'Read only access to the ticket in this group/queue.' => '群组/队列中的票单只读。',
        'rw' => '读写',
        'Full read and write access to the tickets in this group/queue.' =>
            '群组/队列中的票单可读写.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => '管理客户与服务的对应关系',
        'Edit default services' => '修改默认服务',
        'Filter for Services' => '过滤服务',
        'Allocate Services to Customer' => '为客户指定服务',
        'Allocate Customers to Service' => '为服务指定客户',
        'Toggle active state for all' => '切换激活状态给全部',
        'Active' => '激活',
        'Toggle active state for %s' => '切换激活状态给 %s',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => '',
        'Add new field for object' => '',
        'To add a new field, select the field type form one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            '',
        'Dynamic Fields List' => '',
        'Dynamic fields per page' => '',
        'Label' => '',
        'Order' => '次序',
        'Object' => '对象',

        # Template: AdminDynamicFieldCheckbox
        'Dynamic Fields' => '',
        'Field' => '',
        'Go back to overview' => '',
        'General' => '',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            '',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            '',
        'Changing this value will require manual changes in the system.' =>
            '',
        'This is the name to be shown on the screens where the field is active.' =>
            '',
        'Field order' => '',
        'This field is required and must be numeric.' => '',
        'This is the order in which this field will be shown on the screens where is active.' =>
            '',
        'Field type' => '',
        'Object type' => '',
        'Field Settings' => '',
        'Default value' => '默认值',
        'This is the default value for this field.' => '',
        'Save' => '保存',

        # Template: AdminDynamicFieldDateTime
        'Default date difference' => '',
        'This field must be numeric.' => '',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            '',
        'Define years period' => '',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            '',
        'Years in the past' => '',
        'Years in the past to display (default: 5 years).' => '',
        'Years in the future' => '',
        'Years in the future to display (default: 5 years).' => '',
        'Show link' => '',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            '',

        # Template: AdminDynamicFieldDropdown
        'Possible values' => '',
        'Key' => '字段',
        'Value' => '值',
        'Remove value' => '',
        'Add value' => '',
        'Add Value' => '',
        'Add empty value' => '',
        'Activate this option to create an empty selectable value.' => '',
        'Translatable values' => '',
        'If you activate this option the values will be translated to the user defined language.' =>
            '',
        'Note' => '注解',
        'You need to add the translations manually into the language translation files.' =>
            '',

        # Template: AdminDynamicFieldMultiselect

        # Template: AdminDynamicFieldText
        'Number of rows' => '',
        'Specify the height (in lines) for this field in the edit mode.' =>
            '',
        'Number of cols' => '',
        'Specify the width (in characters) for this field in the edit mode.' =>
            '',

        # Template: AdminEmail
        'Admin Notification' => '管理员通知',
        'With this module, administrators can send messages to agents, group or role members.' =>
            '通过此模块，管理员客户发送消息给服务人员/群组/角色成员。',
        'Create Administrative Message' => '创建管理员通知',
        'Your message was sent to' => '你的信息已被发送到',
        'Send message to users' => '发送信息给注册用户',
        'Send message to group members' => '发送信息到组成员',
        'Group members need to have permission' => '组成员需要权限',
        'Send message to role members' => '发送信息到角色成员',
        'Also send to customers in groups' => '同样发送到该组的客户',
        'Body' => '内容',
        'Send' => '发送',

        # Template: AdminGenericAgent
        'Generic Agent' => '计划任务',
        'Add job' => '新增任务',
        'Last run' => '最后运行',
        'Run Now!' => '现在运行!',
        'Delete this task' => '删除这个任务',
        'Run this task' => '执行这个任务',
        'Job Settings' => '任务设置',
        'Job name' => '任务名称',
        'Currently this generic agent job will not run automatically.' =>
            '目前这一通用Agent作业将不会自动运行',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            '启用自动执行至少选择一个值分钟，时间和日期',
        'Schedule minutes' => '分',
        'Schedule hours' => '时',
        'Schedule days' => '日',
        'Toggle this widget' => '收起/展开Widget',
        'Ticket Filter' => '票单过滤',
        '(e. g. 10*5155 or 105658*)' => '  例如: 10*5144 或者 105658*',
        '(e. g. 234321)' => '例如: 234321',
        'Customer login' => '客户登录',
        '(e. g. U5150)' => '例如: U5150',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => '在文章中全文检索（例如："Mar*in" or "Baue*"）',
        'Agent' => '服务人员',
        'Ticket lock' => '票单锁定',
        'Create times' => '创建时间',
        'No create time settings.' => '没有创建时间。',
        'Ticket created' => '票单创建在',
        'Ticket created between' => '票单创建时间自',
        'Change times' => '',
        'No change time settings.' => '不改变时间设置',
        'Ticket changed' => '',
        'Ticket changed between' => '',
        'Close times' => '关闭时间',
        'No close time settings.' => '没有关闭时间。',
        'Ticket closed' => '票单关闭在',
        'Ticket closed between' => '票单关闭时间自',
        'Pending times' => '等待时间',
        'No pending time settings.' => '没有待定时间',
        'Ticket pending time reached' => '票单待定时间在',
        'Ticket pending time reached between' => '票单待定时间自',
        'Escalation times' => '升级时间',
        'No escalation time settings.' => '没有升级时间',
        'Ticket escalation time reached' => '票单升级时间在',
        'Ticket escalation time reached between' => '票单升级时间自',
        'Escalation - first response time' => '升级 - 首次回复时间',
        'Ticket first response time reached' => '票单首次回复时间在',
        'Ticket first response time reached between' => '票单首次回复时间自',
        'Escalation - update time' => '升级 - 更新时间',
        'Ticket update time reached' => '票单更新时间在',
        'Ticket update time reached between' => '票单更新时间自',
        'Escalation - solution time' => '升级 - 解决时间',
        'Ticket solution time reached' => '票单解决时间在',
        'Ticket solution time reached between' => '票单解决时间自',
        'Archive search option' => '归档查询选项',
        'Ticket Action' => '票单处理',
        'Set new service' => '设置新服务',
        'Set new Service Level Agreement' => '指定服务级别协议',
        'Set new priority' => '指定优先级',
        'Set new queue' => '指定队列',
        'Set new state' => '指定状态',
        'Set new agent' => '指定服务人员',
        'new owner' => '指定所有者',
        'new responsible' => '',
        'Set new ticket lock' => '票单锁定',
        'New customer' => '指定客户',
        'New customer ID' => '指定客户ID',
        'New title' => '指定称谓',
        'New type' => '指定类型',
        'New Dynamic Field Values' => '',
        'Archive selected tickets' => '归档选中的票单',
        'Add Note' => '添加注解',
        'Time units' => '时间单元',
        ' (work units)' => '工作单元',
        'Ticket Commands' => '票单命令',
        'Send agent/customer notifications on changes' => '发送代理/客户通知变更',
        'CMD' => '命令',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            '将执行这个命令, 第一个参数是票单 编号，第二个参数是票单的标识符.',
        'Delete tickets' => '删除票单',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            '警告：所有影响的票单从数据库删除，将无法恢复！',
        'Execute Custom Module' => '执行客户模块',
        'Param %s key' => '参数 %s key',
        'Param %s value' => '参数 %s value',
        'Save Changes' => '修改保存',
        'Results' => '结果',
        '%s Tickets affected! What do you want to do?' => '%s 个票单将被影响！你确定要这么做?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            '警告：你选择了"删除"指令。所有删除的票单数据将无法恢复。',
        'Edit job' => '修改任务',
        'Run job' => '执行任务',
        'Affected Tickets' => '受影响的票单',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => '',
        'Web Services' => '',
        'Debugger' => '',
        'Go back to web service' => '',
        'Clear' => '',
        'Do you really want to clear the debug log of this web service?' =>
            '',
        'Request List' => '',
        'Time' => '时间',
        'Remote IP' => '',
        'Loading' => '装载',
        'Select a single request to see its details.' => '',
        'Filter by type' => '',
        'Filter from' => '',
        'Filter to' => '',
        'Filter by remote IP' => '',
        'Refresh' => '刷新',
        'Request Details' => '',
        'An error occurred during communication.' => '',
        'Show or hide the content' => '显示或隐藏内容',
        'Clear debug log' => '',

        # Template: AdminGenericInterfaceInvokerDefault
        'Add new Invoker to Web Service %s' => '',
        'Change Invoker %s of Web Service %s' => '',
        'Add new invoker' => '',
        'Change invoker %s' => '',
        'Do you really want to delete this invoker?' => '',
        'All configuration data will be lost.' => '',
        'Invoker Details' => '',
        'The name is typically used to call up an operation of a remote web service.' =>
            '',
        'Please provide a unique name for this web service invoker.' => '',
        'The name you entered already exists.' => '',
        'Invoker backend' => '',
        'This OTRS invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            '',
        'Mapping for outgoing request data' => '',
        'Configure' => '',
        'The data from the invoker of OTRS will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            '',
        'Mapping for incoming response data' => '',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of OTRS expects.' =>
            '',
        'Event Triggers' => '',
        'Asynchronous' => '',
        'Delete this event' => '',
        'This invoker will be triggered by the configured events.' => '',
        'Do you really want to delete this event trigger?' => '',
        'Add Event Trigger' => '',
        'To add a new event select the event object and event name and click on the "+" button' =>
            '',
        'Asynchronous event triggers are handled by the OTRS Scheduler in background (recommended).' =>
            '',
        'Synchronous event triggers would be processed directly during the web request.' =>
            '',
        'Save and continue' => '',
        'Save and finish' => '',
        'Delete this Invoker' => '',
        'Delete this Event Trigger' => '',

        # Template: AdminGenericInterfaceMappingSimple
        'GenericInterface Mapping Simple for Web Service %s' => '',
        'Go back to' => '',
        'Mapping Simple' => '',
        'Default rule for unmapped keys' => '',
        'This rule will apply for all keys with no mapping rule.' => '',
        'Default rule for unmapped values' => '',
        'This rule will apply for all values with no mapping rule.' => '',
        'New key map' => '',
        'Add key mapping' => '',
        'Mapping for Key ' => '',
        'Remove key mapping' => '',
        'Key mapping' => '',
        'Map key' => '',
        'matching the' => '',
        'to new key' => '',
        'Value mapping' => '',
        'Map value' => '',
        'to new value' => '',
        'Remove value mapping' => '',
        'New value map' => '',
        'Add value mapping' => '',
        'Do you really want to delete this key mapping?' => '',
        'Delete this Key Mapping' => '',

        # Template: AdminGenericInterfaceOperationDefault
        'Add new Operation to Web Service %s' => '',
        'Change Operation %s of Web Service %s' => '',
        'Add new operation' => '',
        'Change operation %s' => '',
        'Do you really want to delete this operation?' => '',
        'Operation Details' => '',
        'The name is typically used to call up this web service operation from a remote system.' =>
            '',
        'Please provide a unique name for this web service.' => '',
        'Mapping for incoming request data' => '',
        'The request data will be processed by this mapping, to transform it to the kind of data OTRS expects.' =>
            '',
        'Operation backend' => '',
        'This OTRS operation backend module will be called internally to process the request, generating data for the response.' =>
            '',
        'Mapping for outgoing response data' => '',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            '',
        'Delete this Operation' => '',

        # Template: AdminGenericInterfaceTransportHTTPSOAP
        'GenericInterface Transport HTTP::SOAP for Web Service %s' => '',
        'Network transport' => '',
        'Properties' => '',
        'Endpoint' => '',
        'URI to indicate a specific location for accessing a service.' =>
            '',
        'e.g. http://local.otrs.com:8000/Webservice/Example' => '',
        'Namespace' => '',
        'URI to give SOAP methods a context, reducing ambiguities.' => '',
        'e.g urn:otrs-com:soap:functions or http://www.otrs.com/GenericInterface/actions' =>
            '',
        'Maximum message length' => '',
        'This field should be an integer number.' => '',
        'Here you can specify the maximum size (in bytes) of SOAP messages that OTRS will process.' =>
            '',
        'Encoding' => '',
        'The character encoding for the SOAP message contents.' => '',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => '',
        'SOAPAction' => '',
        'Set to "Yes" to send a filled SOAPAction header.' => '',
        'Set to "No" to send an empty SOAPAction header.' => '',
        'SOAPAction separator' => '',
        'Character to use as separator between name space and SOAP method.' =>
            '',
        'Usually .Net web services uses a "/" as separator.' => '',
        'Authentication' => '',
        'The authentication mechanism to access the remote system.' => '',
        'A "-" value means no authentication.' => '',
        'The user name to be used to access the remote system.' => '',
        'The password for the privileged user.' => '',

        # Template: AdminGenericInterfaceWebservice
        'GenericInterface Web Service Management' => '',
        'Add web service' => '',
        'Clone web service' => '',
        'The name must be unique.' => '',
        'Clone' => '',
        'Export web service' => '',
        'Import web service' => '',
        'Configuration File' => '',
        'The file must be a valid web service configuration YAML file.' =>
            '',
        'Import' => '导入',
        'Configuration history' => '',
        'Delete web service' => '',
        'Do you really want to delete this web service?' => '',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            '',
        'If you want to return to overview please click the "Go to overview" button.' =>
            '',
        'Web Service List' => '',
        'Remote system' => '',
        'Provider transport' => '',
        'Requester transport' => '',
        'Details' => '',
        'Debug threshold' => '',
        'In provider mode, OTRS offers web services which are used by remote systems.' =>
            '',
        'In requester mode, OTRS uses web services of remote systems.' =>
            '',
        'Operations are individual system functions which remote systems can request.' =>
            '',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            '',
        'Controller' => '',
        'Inbound mapping' => '',
        'Outbound mapping' => '',
        'Delete this action' => '',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            '',
        'Delete webservice' => '',
        'Delete operation' => '',
        'Delete invoker' => '',
        'Clone webservice' => '',
        'Import webservice' => '',

        # Template: AdminGenericInterfaceWebserviceHistory
        'GenericInterface Configuration History for Web Service %s' => '',
        'Go back to Web Service' => '',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            '',
        'Configuration History List' => '',
        'Version' => '版本',
        'Create time' => '',
        'Select a single configuration version to see its details.' => '',
        'Export web service configuration' => '',
        'Restore web service configuration' => '',
        'Do you really want to restore this version of the web service configuration?' =>
            '',
        'Your current web service configuration will be overwritten.' => '',
        'Show or hide the content.' => '显示或隐藏该内容.',
        'Restore' => '',

        # Template: AdminGroup
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            '警告：当您更改\'管理\'组的名称时，在SysConfig作出相应的变化之前，你将被管理面板锁住！如果发生这种情况，请用SQL语句把组名改回到\'admin\'',
        'Group Management' => '群组管理',
        'Add group' => '新增群组',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Admin 组可以进入系统管理区域, Stats 组可以进入统计管理区',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            '通过创建群组来为不同部门（比如采购部门，支持部门，销售部门等）的服务人员设定权限。',
        'It\'s useful for ASP solutions. ' => '常用作ASP方案。',
        'Add Group' => '新增群组',
        'Edit Group' => '修改群组',

        # Template: AdminLog
        'System Log' => '系统日志',
        'Here you will find log information about your system.' => '查看系统日志信息。',
        'Hide this message' => '隐藏此消息',
        'Recent Log Entries' => '最近的日志',

        # Template: AdminMailAccount
        'Mail Account Management' => '邮件帐号管理',
        'Add mail account' => '新增邮件帐号',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            '所有来自一个邮件账号的邮件将会被分发到所选队列!',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            '如果您的帐户是值得信赖的，现有的X-OTRS标题到达时间（优先， ... ）将被使用！邮件过滤器将被使用',
        'Host' => '主机',
        'Delete account' => '删除帐号',
        'Fetch mail' => '查收邮件',
        'Add Mail Account' => '新增邮件帐号',
        'Example: mail.example.com' => '范例：mail.example.com',
        'IMAP Folder' => '',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            '',
        'Trusted' => '是否信任',
        'Dispatching' => '分派',
        'Edit Mail Account' => '修改邮件帐号',

        # Template: AdminNavigationBar
        'Admin' => '系统管理',
        'Agent Management' => '服务人员管理',
        'Queue Settings' => '队列设置',
        'Ticket Settings' => '票单设置',
        'System Administration' => '系统管理员',

        # Template: AdminNotification
        'Notification Management' => '通知管理',
        'Select a different language' => '选择不同的语言',
        'Filter for Notification' => '过滤特定的通知',
        'Notifications are sent to an agent or a customer.' => '通知被发送到服务人员或者客户。',
        'Notification' => '系统通知',
        'Edit Notification' => '修改通知',
        'e. g.' => '例如',
        'Options of the current customer data' => '当前客户数据选项',

        # Template: AdminNotificationEvent
        'Add notification' => '新增通知',
        'Delete this notification' => '删除通知',
        'Add Notification' => '新增通知',
        'Recipient groups' => '收件人群组',
        'Recipient agents' => '收件服务人员',
        'Recipient roles' => '收件人角色',
        'Recipient email addresses' => '收件人邮件地址',
        'Article type' => '文章类型',
        'Only for ArticleCreate event' => '仅对ArticleCreate事件有效',
        'Subject match' => '标题匹配',
        'Body match' => '内容匹配',
        'Include attachments to notification' => '通知包含附件',
        'Notification article type' => '文章类型',
        'Only for notifications to specified email addresses' => '仅对指定邮件地址发送通知',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            '截取服务人员新邮件主题的前 20 个字符.',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            '截取服务人员新邮件正文内容前 5 行.',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            '截取客户最新邮件主题的前 20 个字符.',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            '截取客户最新邮件正文内容前 5 行.',

        # Template: AdminPGP
        'PGP Management' => 'PGP 管理',
        'Use this feature if you want to work with PGP keys.' => '该功能用于管理PGP密钥',
        'Add PGP key' => '新增PGP密钥',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            '通过此模块可以直接编辑在SysConfig中设置的密钥环。',
        'Introduction to PGP' => 'PGP介绍',
        'Result' => '结果',
        'Identifier' => '标识符',
        'Bit' => '位',
        'Fingerprint' => '指纹',
        'Expires' => '过期',
        'Delete this key' => '删除密钥',
        'Add PGP Key' => '新增PGP密钥',
        'PGP key' => 'PGP密钥',

        # Template: AdminPackageManager
        'Package Manager' => '软件包管理',
        'Uninstall package' => '卸载软件包',
        'Do you really want to uninstall this package?' => '是否确认卸载该软件包?',
        'Reinstall package' => '重新安装软件包',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            '你确定要重新安装该软包吗? 所有该模块的手工设置将丢失.',
        'Continue' => '继续',
        'Install' => '安装',
        'Install Package' => '安装软件包',
        'Update repository information' => '更新软件仓库信息',
        'Did not find a required feature? OTRS Group provides their subscription customers with exclusive Add-Ons:' =>
            '',
        'Online Repository' => '在线软件仓库',
        'Vendor' => '提供者',
        'Module documentation' => '模块文档',
        'Upgrade' => '升级',
        'Local Repository' => '本地软件仓库',
        'Uninstall' => '卸载',
        'Reinstall' => '重新安装',
        'Download package' => '下载该软件包',
        'Rebuild package' => '重新编译',
        'Metadata' => '元数据',
        'Change Log' => '更新记录',
        'Date' => '日期',
        'List of Files' => '文件清单',
        'Permission' => '权限',
        'Download' => '下载',
        'Download file from package!' => '从软件包中下载这个文件',
        'Required' => '必需的',
        'PrimaryKey' => '关键的Key',
        'AutoIncrement' => '自动递增',
        'SQL' => 'SQL',
        'File differences for file %s' => '文件跟 %s 文件不相符',

        # Template: AdminPerformanceLog
        'Performance Log' => '系统监视器',
        'This feature is enabled!' => '该功能已启用',
        'Just use this feature if you want to log each request.' => '如果您想详细记录每个请求, 您可以使用该功能.',
        'Activating this feature might affect your system performance!' =>
            '启动该功能可能影响您的系统性能',
        'Disable it here!' => '关闭该功能',
        'Logfile too large!' => '日志文件过大',
        'The logfile is too large, you need to reset it' => '日志文件太大，请重新初始化。',
        'Overview' => '概况',
        'Range' => '范围',
        'Interface' => '界面',
        'Requests' => '请求',
        'Min Response' => '最小回应',
        'Max Response' => '最大回应',
        'Average Response' => '平均回应',
        'Period' => '周期',
        'Min' => '最小',
        'Max' => '最大',
        'Average' => '平均',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => '邮件过滤器管理',
        'Add filter' => '新增过滤器',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            '根据email的头部信息分发和过滤邮件，可以使用正则表达式匹配',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            '',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            '',
        'Delete this filter' => '删除此过滤器',
        'Add PostMaster Filter' => '新增邮件过滤器',
        'Edit PostMaster Filter' => '修改邮件过滤器',
        'Filter name' => '过滤器名称',
        'The name is required.' => '过滤器名称是必输项。',
        'Stop after match' => '匹配后停止',
        'Filter Condition' => '过滤条件',
        'The field needs to be a valid regular expression or a literal word.' =>
            '该栏位需使用有效的正则表达式或文字。',
        'Set Email Headers' => '设置邮件头',
        'The field needs to be a literal word.' => '该栏位需为文字。',

        # Template: AdminPriority
        'Priority Management' => '优先级管理',
        'Add priority' => '新增优先级',
        'Add Priority' => '新增优先级',
        'Edit Priority' => '修改优先级',

        # Template: AdminQueue
        'Manage Queues' => '队列管理',
        'Add queue' => '新增队列',
        'Add Queue' => '新增队列',
        'Edit Queue' => '修改队列',
        'Sub-queue of' => '子队列',
        'Unlock timeout' => '自动解锁超时期限',
        '0 = no unlock' => '0 = 不自动解锁  ',
        'Only business hours are counted.' => '仅以上班时间计算',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            '如果服务人员在自动解锁超时期限内没有关闭票单，该票单将被自动解锁。',
        'Notify by' => '进度通知',
        '0 = no escalation' => '0 = 无限时  ',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            '',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            '',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            '',
        'Follow up Option' => '跟进选项',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            '',
        'Ticket lock after a follow up' => '跟进确认以后，票单将被自动锁定',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            '客户对已关闭的票单提交跟进后，该票单将自动被前一个所有者锁定。',
        'System address' => '系统邮件地址',
        'Will be the sender address of this queue for email answers.' => '回复邮件所用的发送者地址',
        'Default sign key' => '默认签名密钥',
        'The salutation for email answers.' => '回复邮件所用称谓.',
        'The signature for email answers.' => '回复邮件所用签名.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => '管理队列与自动回复的对应关系',
        'Filter for Queues' => '定位队列',
        'Filter for Auto Responses' => '定位自动回复',
        'Auto Responses' => '自动回复功能',
        'Change Auto Response Relations for Queue' => '改变该队列的自动回复',
        'settings' => '设置',

        # Template: AdminQueueResponses
        'Manage Response-Queue Relations' => '管理回复与队列的对应关系',
        'Filter' => '过滤器',
        'Filter for Responses' => '快速定位',
        'Responses' => '回复',
        'Change Queue Relations for Response' => '为回复修改队列',
        'Change Response Relations for Queue' => '为队列修改回复',

        # Template: AdminResponse
        'Manage Responses' => '管理回复',
        'Add response' => '新增回复',
        'A response is default text to write faster answer (with default text) to customers.' =>
            '为了快速回复，回复内容定义了每个回复中重复的内容.',
        'Don\'t forget to add a new response a queue!' => '不要忘记增加一个新的回复内容到队列!',
        'Delete this entry' => '删除该条目',
        'Add Response' => '新增回复',
        'Edit Response' => '修改回复',
        'The current ticket state is' => '当前票单状态是',
        'Your email address is' => '你的邮件地址是',

        # Template: AdminResponseAttachment
        'Manage Responses <-> Attachments Relations' => '管理回复与附件的对应关系',
        'Filter for Attachments' => '附件过滤',
        'Change Response Relations for Attachment' => '为附件修改回复',
        'Change Attachment Relations for Response' => '为回复修改附件',
        'Toggle active for all' => '切换激活给全部',
        'Link %s to selected %s' => '链接 %s 到选中的 %s',

        # Template: AdminRole
        'Role Management' => '角色管理',
        'Add role' => '新增角色',
        'Create a role and put groups in it. Then add the role to the users.' =>
            '创建一个角色并将组加入角色,然后将角色赋给用户.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            '有没有角色定义. 请使用 \'添加\' 按钮来创建一个新的角色',
        'Add Role' => '新增角色',
        'Edit Role' => '修改角色',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => '管理角色与群组的对应关系',
        'Filter for Roles' => '快速定位角色',
        'Roles' => '角色',
        'Select the role:group permissions.' => '选择角色:群组许可。',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            '',
        'Change Role Relations for Group' => '为群组修改角色',
        'Change Group Relations for Role' => '为角色修改群组',
        'Toggle %s permission for all' => '切换 %s 权限给全部',
        'move_into' => '移动到',
        'Permissions to move tickets into this group/queue.' => '允许移动票单到群组/队列。',
        'create' => '创建',
        'Permissions to create tickets in this group/queue.' => '允许在群组/队列中创建票单。',
        'priority' => '优先级',
        'Permissions to change the ticket priority in this group/queue.' =>
            '允许在群组/队列中修改票单优先级。',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => '管理服务人员与角色的对应关系',
        'Filter for Agents' => '查找服务人员',
        'Agents' => '服务人员',
        'Manage Role-Agent Relations' => '管理服务人员与角色的对应关系',
        'Change Role Relations for Agent' => '为服务人员修改角色',
        'Change Agent Relations for Role' => '为角色修改服务人员',

        # Template: AdminSLA
        'SLA Management' => 'SLA管理',
        'Add SLA' => '新增SLA',
        'Edit SLA' => '修改SLA',
        'Please write only numbers!' => '仅可填写数字！',

        # Template: AdminSMIME
        'S/MIME Management' => 'S/MIME 管理',
        'Add certificate' => '新增证书',
        'Add private key' => '新增私匙',
        'Filter for certificates' => '',
        'Filter for SMIME certs' => '',
        'Here you can add relations to your private certificate, these will be embedded to the SMIME signature every time you use this certificate to sign an email.' =>
            '',
        'See also' => '参见',
        'In this way you can directly edit the certification and private keys in file system.' =>
            '该功能可用于直接编辑证书和私匙。',
        'Hash' => 'Hash',
        'Create' => '创建',
        'Handle related certificates' => '',
        'Delete this certificate' => '删除证书',
        'Add Certificate' => '新增证书',
        'Add Private Key' => '新增私匙',
        'Secret' => '密码',
        'Related Certificates for' => '',
        'Delete this relation' => '',
        'Available Certificates' => '',
        'Relate this certificate' => '',

        # Template: AdminSalutation
        'Salutation Management' => '称谓管理',
        'Add salutation' => '新增称谓',
        'Add Salutation' => '新增称谓',
        'Edit Salutation' => '修改称谓',
        'Example salutation' => '这里有一个范例',

        # Template: AdminScheduler
        'This option will force Scheduler to start even if the process is still registered in the database' =>
            '',
        'Start scheduler' => '',
        'Scheduler could not be started. Check if scheduler is not running and try it again with Force Start option' =>
            '',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => '安全模式需要被启用！',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            '在初始安装结束后，安全模式通常将被设置',
        'Secure mode must be disabled in order to reinstall using the web-installer.' =>
            '为了重新用Web 界面安装，安全模式必须禁用',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            '系统已启用，请通过SysConfig启用安全模式。',

        # Template: AdminSelectBox
        'SQL Box' => 'SQL查询窗口',
        'Here you can enter SQL to send it directly to the application database.' =>
            '可以提交SQL到应用数据库执行。',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'SQL查询的语法有一个错误，请核对。',
        'There is at least one parameter missing for the binding. Please check it.' =>
            '至少有一个参数丢失，请核对。',
        'Result format' => '结果格式',
        'Run Query' => '执行查询',

        # Template: AdminService
        'Service Management' => '服务管理',
        'Add service' => '新增服务',
        'Add Service' => '新增服务',
        'Edit Service' => '修改服务',
        'Sub-service of' => '子服务',

        # Template: AdminSession
        'Session Management' => '会话管理',
        'All sessions' => '所有会话',
        'Agent sessions' => '服务人员会话',
        'Customer sessions' => '客户会话',
        'Unique agents' => '实际服务人员',
        'Unique customers' => '实际在线客户',
        'Kill all sessions' => '终止所有会话',
        'Kill this session' => '终止该会话',
        'Session' => '会话',
        'Kill' => '终止',
        'Detail View for SessionID' => '该会话的详细记录',

        # Template: AdminSignature
        'Signature Management' => '签名管理',
        'Add signature' => '新增签名',
        'Add Signature' => '新增签名',
        'Edit Signature' => '修改签名',
        'Example signature' => '这里有一个范例',

        # Template: AdminState
        'State Management' => '状态管理',
        'Add state' => '新增状态',
        'Please also update the states in SysConfig where needed.' => '',
        'Add State' => '新增状态',
        'Edit State' => '修改状态',
        'State type' => '状态类型',

        # Template: AdminSysConfig
        'SysConfig' => '系统配置',
        'Navigate by searching in %s settings' => '浏览从 %s 个配置项中查找的结果',
        'Navigate by selecting config groups' => '浏览选中的配置群组',
        'Download all system config changes' => '下载所有配置(不包括默认配置)',
        'Export settings' => '导出设置',
        'Load SysConfig settings from file' => '从指定文件加载系统配置',
        'Import settings' => '导入设置',
        'Import Settings' => '导入设置',
        'Please enter a search term to look for settings.' => '请输入关键词来查找相关的设置.',
        'Subgroup' => '子组',
        'Elements' => '元素',

        # Template: AdminSysConfigEdit
        'Edit Config Settings' => '修改系统配置',
        'This config item is only available in a higher config level!' =>
            '该配置项只在高级配置可用！',
        'Reset this setting' => '重置设定',
        'Error: this file could not be found.' => '错误：文件不存在。',
        'Error: this directory could not be found.' => '错误：目录不存在。',
        'Error: an invalid value was entered.' => '错误：输入无效的值。',
        'Content' => '值',
        'Remove this entry' => '删除该条目',
        'Add entry' => '新增条目',
        'Remove entry' => '删除条目',
        'Add new entry' => '新增新条目',
        'Create new entry' => '创建新条目',
        'New group' => '新群组',
        'Group ro' => '群组ro',
        'Readonly group' => '只读群组',
        'New group ro' => '新群组ro',
        'Loader' => '加载',
        'File to load for this frontend module' => '文件装载界面模块',
        'New Loader File' => '新加载文件',
        'NavBarName' => '导航栏名称',
        'NavBar' => '导航栏',
        'LinkOption' => '链接选项',
        'Block' => '块',
        'AccessKey' => '进钥',
        'Add NavBar entry' => '新增导航栏条目',
        'Year' => '年',
        'Month' => '月',
        'Day' => '日',
        'Invalid year' => '非法的年份',
        'Invalid month' => '非法的月份',
        'Invalid day' => '非法的日期',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => '系统邮件地址管理',
        'Add system address' => '新增系统邮件地址',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            '收件人或抄送队列中包含该地址的邮件将被分发到所选队列。',
        'Email address' => '邮件地址',
        'Display name' => '名称',
        'Add System Email Address' => '新增系统邮件地址',
        'Edit System Email Address' => '修改系统邮件地址',
        'The display name and email address will be shown on mail you send.' =>
            '邮件地址和名称将在邮件中显示。',

        # Template: AdminType
        'Type Management' => '类型管理',
        'Add ticket type' => '新增票单类型',
        'Add Type' => '新增类型',
        'Edit Type' => '修改类型',

        # Template: AdminUser
        'Add agent' => '新增服务人员',
        'Agents will be needed to handle tickets.' => '服务人员需要处理票单。',
        'Don\'t forget to add a new agent to groups and/or roles!' => '请别忘了添加服务人员到群组 或 角色里!',
        'Please enter a search term to look for agents.' => '请输入一个搜索条件以快速查找服务人员的登录信息.',
        'Last login' => '最后一次登录',
        'Login as' => '登录名',
        'Switch to agent' => '切换服务人员',
        'Add Agent' => '新增服务人员',
        'Edit Agent' => '修改服务人员',
        'Firstname' => '名',
        'Lastname' => '姓',
        'Password is required.' => '请输入密码。',
        'Start' => '开始',
        'End' => '结束',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => '管理服务人员与群组的对应关系',
        'Change Group Relations for Agent' => '为服务人员修改群组',
        'Change Agent Relations for Group' => '为群组修改服务人员',
        'note' => '注意',
        'Permissions to add notes to tickets in this group/queue.' => '允许给群组/队列票单添加注释。',
        'owner' => '所有者',
        'Permissions to change the owner of tickets in this group/queue.' =>
            '允许改变群组/队列中票单所有者。',

        # Template: AgentBook
        'Address Book' => '地址簿',
        'Search for a customer' => '查找客户',
        'Add email address %s to the To field' => '增加邮件地址到收件人栏位',
        'Add email address %s to the Cc field' => '增加邮件地址到抄送栏位',
        'Add email address %s to the Bcc field' => '增加邮件地址到密送栏位',
        'Apply' => '应用',

        # Template: AgentCustomerSearch
        'Search Customer' => '搜索客户',
        'Duplicated entry' => '',
        'This address already exists on the address list.' => '',

        # Template: AgentCustomerTableView

        # Template: AgentDashboard
        'Dashboard' => '仪表板',

        # Template: AgentDashboardCalendarOverview
        'in' => '之内',

        # Template: AgentDashboardIFrame

        # Template: AgentDashboardImage

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s is 可用！',
        'Please update now.' => '请更新',
        'Release Note' => '版本发布注释',
        'Level' => '级别',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => '发布于 %s 之前',

        # Template: AgentDashboardTicketGeneric
        'My locked tickets' => '',
        'My watched tickets' => '',
        'My responsibilities' => '',
        'Tickets in My Queues' => '',

        # Template: AgentDashboardTicketStats

        # Template: AgentDashboardUserOnline

        # Template: AgentHTMLReferenceForms

        # Template: AgentHTMLReferenceOverview

        # Template: AgentHTMLReferencePageLayout
        'The ticket has been locked' => '票单已锁定',
        'Undo & close window' => '取消关闭窗口',

        # Template: AgentInfo
        'Info' => '详情',
        'To accept some news, a license or some changes.' => '接收新闻，许可证或者变更。',

        # Template: AgentLinkObject
        'Link Object: %s' => '连接对象: %s',
        'Close window' => '关闭窗口',
        'go to link delete screen' => '转到链接删除窗口',
        'Select Target Object' => '选择目标对象',
        'Link Object' => '链接对象',
        'with' => '和',
        'Unlink Object: %s' => '未连接对象 %s',
        'go to link add screen' => '转到链接新增窗口',

        # Template: AgentNavigationBar

        # Template: AgentPreferences
        'Edit your preferences' => '编辑个人设置',

        # Template: AgentSpelling
        'Spell Checker' => '拼写检查',
        'spelling error(s)' => '拼写错误',
        'Apply these changes' => '应用这些改变',

        # Template: AgentStatsDelete
        'Delete stat' => '删除统计',
        'Stat#' => '统计号',
        'Do you really want to delete this stat?' => '你确认要删除该统计?',

        # Template: AgentStatsEditRestrictions
        'Step %s' => '第 %s 步',
        'General Specifications' => '一般设定',
        'Select the element that will be used at the X-axis' => '选择x轴使用的要素',
        'Select the elements for the value series' => '选择值列的要素',
        'Select the restrictions to characterize the stat' => '选择限制条件',
        'Here you can make restrictions to your stat.' => '您可以为统计指定限制参数',
        'If you remove the hook in the "Fixed" checkbox, the agent generating the stat can change the attributes of the corresponding element.' =>
            '如果您删除钩在“固定”复选框，生成该统计的技术支持代表可以改变相应要素的属性',
        'Fixed' => '修正',
        'Please select only one element or turn off the button \'Fixed\'.' =>
            '请只选择一个元素或关闭被选域的\'Fixed\'按钮',
        'Absolute Period' => '绝对周期',
        'Between' => '在',
        'Relative Period' => '相对周期',
        'The last' => '最后',
        'Finish' => '结束',

        # Template: AgentStatsEditSpecification
        'Permissions' => '权限',
        'You can select one or more groups to define access for different agents.' =>
            '可选中一个或多个群组定义服务人员访问权限。',
        'Some result formats are disabled because at least one needed package is not installed.' =>
            '至少一个必须的软件包没有安装，部分结果格式无法使用。',
        'Please contact your administrator.' => '请联系系统管理员',
        'Graph size' => '图形尺寸',
        'If you use a graph as output format you have to select at least one graph size.' =>
            '如果您使用的是图形的输出格式你必须至少选择一个图形的大小',
        'Sum rows' => '总和行',
        'Sum columns' => '总和列',
        'Use cache' => '使用缓存',
        'Most of the stats can be cached. This will speed up the presentation of this stat.' =>
            '大多数的统计资料可以缓存，将加快统计计算。',
        'If set to invalid end users can not generate the stat.' => '如果被设置为无效，用户将不能进行统计。',

        # Template: AgentStatsEditValueSeries
        'Here you can define the value series.' => '定义值列',
        'You have the possibility to select one or two elements.' => '可选择一个或两个要素，',
        'Then you can select the attributes of elements.' => '然后可以指定要素属性。',
        'Each attribute will be shown as single value series.' => '每个属性将被显示为独立的值列',
        'If you don\'t select any attribute all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            '',
        'Scale' => '尺度',
        'minimal' => '最小化',
        'Please remember, that the scale for value series has to be larger than the scale for the X-axis (e.g. X-Axis => Month, ValueSeries => Year).' =>
            '请记住，这比额表的价值系列要大于X轴的尺度（如X -轴=>本月， ValueSeries =>年） ',

        # Template: AgentStatsEditXaxis
        'Here you can define the x-axis. You can select one element via the radio button.' =>
            '定义x轴，可以使用单选按钮选择要素。',
        'maximal period' => '最大周期',
        'minimal scale' => '最小尺度',

        # Template: AgentStatsImport
        'Import Stat' => '导入统计',
        'File is not a Stats config' => '文件不是一个统计配置',
        'No File selected' => '没有文件被选中',

        # Template: AgentStatsOverview
        'Stats' => '统计',

        # Template: AgentStatsPrint
        'Print' => '打印',
        'No Element selected.' => '没有元素被选中',

        # Template: AgentStatsView
        'Export config' => '导出配置',
        'With the input and select fields you can influence the format and contents of the statistic.' =>
            '',
        'Exactly what fields and formats you can influence is defined by the statistic administrator.' =>
            '',
        'Stat Details' => '统计详情',
        'Format' => '格式',
        'Graphsize' => '图形化',
        'Cache' => '缓存',
        'Exchange Axis' => '转换轴',
        'Configurable params of static stat' => '静态统计的配置参数',
        'No element selected.' => '没有被选参数',
        'maximal period from' => '最大周期表',
        'to' => '至',

        # Template: AgentTicketActionCommon
        'Change Free Text of Ticket' => '修改票单自定义文本',
        'Change Owner of Ticket' => '修改票单所有者',
        'Close Ticket' => '关闭票单',
        'Add Note to Ticket' => '给票单增加注解',
        'Set Pending' => '设置待处理状态',
        'Change Priority of Ticket' => '修改票单优先级',
        'Change Responsible of Ticket' => '修改票单负责人',
        'Cancel & close window' => '取消并关闭窗口',
        'Service invalid.' => '服务无效。',
        'New Owner' => '新所有者',
        'Please set a new owner!' => '请指定新的所有者！',
        'Previous Owner' => '前一个所有者',
        'Inform Agent' => '通知服务人员',
        'Optional' => '选项',
        'Inform involved Agents' => '通知相关服务人员',
        'Spell check' => '拼写检查',
        'Note type' => '注释类型',
        'Next state' => '票单状态',
        'Pending date' => '待处理日期',
        'Date invalid!' => '日期无效!',

        # Template: AgentTicketActionPopupClose

        # Template: AgentTicketBounce
        'Bounce Ticket' => '',
        'Bounce to' => '回退到 ',
        'You need a email address.' => '需要邮件地址。',
        'Need a valid email address or don\'t use a local email address.' =>
            '需要有效的邮件地址/不可以使用本地邮件地址。',
        'Next ticket state' => '票单状态',
        'Inform sender' => '通知发送者',
        'Send mail!' => '发送!',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => '票单批量处理',
        'Send Email' => '',
        'Merge to' => '合并到',
        'Invalid ticket identifier!' => '无效的票单标识符!',
        'Merge to oldest' => '合并到最老的',
        'Link together' => '相互链接',
        'Link to parent' => '链接到上一级',
        'Unlock tickets' => '解锁票单',

        # Template: AgentTicketClose

        # Template: AgentTicketCompose
        'Compose answer for ticket' => '撰写答复票单',
        'Remove Ticket Customer' => '',
        'Please remove this entry and enter a new one with the correct value.' =>
            '',
        'Please include at least one recipient' => '',
        'Remove Cc' => '',
        'Remove Bcc' => '',
        'Address book' => '地址簿',
        'Pending Date' => '进入等待状态日期',
        'for pending* states' => '针对等待状态',
        'Date Invalid!' => '日期无效！',

        # Template: AgentTicketCustomer
        'Change customer of ticket' => '修改票单所属客户',
        'Customer Data' => '客户数据',
        'Customer user' => '客户用户',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => '创建邮件票单',
        'From queue' => '来自队列',
        'To customer' => '',
        'Please include at least one customer for the ticket.' => '',
        'Get all' => '获取全部',

        # Template: AgentTicketEscalation

        # Template: AgentTicketForward
        'Forward ticket: %s - %s' => '',
        'Need a valid email address or don\'t use a local email address' =>
            '需要有效的邮件地址/不可以使用本地邮件地址。',

        # Template: AgentTicketFreeText

        # Template: AgentTicketHistory
        'History of' => '历史',
        'History Content' => '历史内容',
        'Zoom view' => '缩放视图',

        # Template: AgentTicketMerge
        'Ticket Merge' => '票单合并',
        'You need to use a ticket number!' => '您需要使用一个票单编号!',
        'A valid ticket number is required.' => '需要有效的票单编号。',
        'Need a valid email address.' => '需要有效的邮件地址。',

        # Template: AgentTicketMove
        'Move Ticket' => '移动票单',
        'New Queue' => '新队列',

        # Template: AgentTicketNote

        # Template: AgentTicketOverviewMedium
        'Select all' => '选择全部',
        'No ticket data found.' => '没有找到票单数据。',
        'First Response Time' => '首次报告时间',
        'Service Time' => '服务时间',
        'Update Time' => '更新时间',
        'Solution Time' => '解决时间',
        'Move ticket to a different queue' => '移动票单到不同的队列',
        'Change queue' => '改变队列',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => '修改搜索选项',
        'Tickets per page' => '票单/页',

        # Template: AgentTicketOverviewPreview
        '","26' => '',

        # Template: AgentTicketOverviewSmall
        'Escalation in' => '限时',
        'Locked' => '锁定状态',
        '","30' => '',

        # Template: AgentTicketOwner

        # Template: AgentTicketPending

        # Template: AgentTicketPhone
        'Create New Phone Ticket' => '新建电话票单',
        'From customer' => '来自客户',
        'To queue' => '到',

        # Template: AgentTicketPhoneCommon
        'Phone call' => '电话',

        # Template: AgentTicketPlain
        'Email Text Plain View' => '以纯文本方式显示的邮件内容',
        'Plain' => '纯文本',
        'Download this email' => '下载该邮件',

        # Template: AgentTicketPrint
        'Ticket-Info' => '票单信息',
        'Accounted time' => '所用时间',
        'Linked-Object' => '已链接对象',
        'by' => '由',

        # Template: AgentTicketPriority

        # Template: AgentTicketQueue

        # Template: AgentTicketResponsible

        # Template: AgentTicketSearch
        'Search template' => '搜索模板',
        'Create Template' => '创建模板',
        'Create New' => '创建',
        'Profile link' => '',
        'Save changes in template' => '保存变更为模板',
        'Add another attribute' => '增加另一个搜索条件',
        'Output' => '搜索结果显示为',
        'Fulltext' => '全文',
        'Remove' => '删除',
        'Customer User Login' => '客户登录用户名',
        'Created in Queue' => '创建队列',
        'Lock state' => '锁定状态',
        'Watcher' => '关注人',
        'Article Create Time (before/after)' => '文章创建时间（之前/之后）',
        'Article Create Time (between)' => '文章创建时间（之间）',
        'Ticket Create Time (before/after)' => '票单创建时间（之前/之后）',
        'Ticket Create Time (between)' => '票单创建时间（之间）',
        'Ticket Change Time (before/after)' => '票单更新时间（之前/之后）',
        'Ticket Change Time (between)' => '票单更新时间（之间）',
        'Ticket Close Time (before/after)' => '票单关闭时间（之前/之后）',
        'Ticket Close Time (between)' => '票单关闭时间（之间）',
        'Archive Search' => '归档搜索',
        'Run search' => '',

        # Template: AgentTicketSearchOpenSearchDescriptionFulltext

        # Template: AgentTicketSearchOpenSearchDescriptionTicketNumber

        # Template: AgentTicketSearchResultPrint

        # Template: AgentTicketZoom
        'Article filter' => '文章过滤器',
        'Article Type' => '文章类别 ',
        'Sender Type' => '发送人类别',
        'Save filter settings as default' => '保存过滤设置为缺省值',
        'Ticket Information' => '票单详情',
        'Linked Objects' => '已连接的对象',
        'Article(s)' => '文章',
        'Change Queue' => '改变队列',
        'Article Filter' => '文章过滤器',
        'Add Filter' => '新增过滤器',
        'Set' => '设置',
        'Reset Filter' => '重置过滤器',
        'Show one article' => '显示单一文章',
        'Show all articles' => '显示所有文章',
        'Unread articles' => '未读文章',
        'No.' => '编号：',
        'Unread Article!' => '未读文章!',
        'Incoming message' => '入栈信息',
        'Outgoing message' => '出栈信息',
        'Internal message' => '内部信息',
        'Resize' => '调整大小',

        # Template: AttachmentBlocker
        'To protect your privacy, active or/and remote content has blocked.' =>
            '为了保护您的隐私，远程内容加载被阻止。',
        'Load blocked content.' => '载入被阻挡的内容。',

        # Template: Copyright

        # Template: CustomerAccept

        # Template: CustomerError
        'Traceback' => '追溯',

        # Template: CustomerFooter
        'Powered by' => 'Powered by',
        'One or more errors occurred!' => '一个或多个错误!',
        'Close this dialog' => '关闭该对话',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            '无法打开弹出窗口，请禁用弹出窗口拦截。',

        # Template: CustomerHeader

        # Template: CustomerLogin
        'Login' => '登录',
        'User name' => '用户名',
        'Your user name' => '你的用户名',
        'Your password' => '你的密码',
        'Forgot password?' => '密码遗忘?',
        'Log In' => '登录',
        'Not yet registered?' => '还未注册?',
        'Sign up now' => '现在注册',
        'Request new password' => '请求新密码',
        'Your User Name' => '你的用户名',
        'A new password will be sent to your email address.' => '新密码将会发送到您的邮箱中',
        'Create Account' => '创建帐户',
        'Please fill out this form to receive login credentials.' => '',
        'How we should address you' => '称谓',
        'Your First Name' => '名字',
        'Please supply a first name' => '请提供您的名字',
        'Your Last Name' => '姓',
        'Please supply a last name' => '请提供您的姓',
        'Your email address (this will become your username)' => '',
        'Please supply a' => '请提供',

        # Template: CustomerNavigationBar
        'Edit personal preferences' => '编辑个人设置',
        'Logout %s' => '',

        # Template: CustomerPreferences

        # Template: CustomerRichTextEditor

        # Template: CustomerTicketMessage
        'Service level agreement' => '服务级别协议',

        # Template: CustomerTicketOverview
        'Welcome!' => '欢迎！',
        'Please click the button below to create your first ticket.' => '请点击下面的按钮创建第一个票单。',
        'Create your first ticket' => '创建第一个票单',

        # Template: CustomerTicketPrint
        'Ticket Print' => '票单打印',

        # Template: CustomerTicketSearch
        'Profile' => '搜索条件',
        'e. g. 10*5155 or 105658*' => '例如: 10*5155 或 105658*',
        'Customer ID' => '客户编号',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => '票单全文搜索 (例如: "John*n" 或 "Will*")',
        'Recipient' => '收件人',
        'Carbon Copy' => '抄送',
        'Time restrictions' => '时间查询条件',
        'No time settings' => '',
        'Only tickets created' => '票单创建于',
        'Only tickets created between' => '票单创建自',
        'Ticket archive system' => '',
        'Save search as template?' => '',
        'Save as Template?' => '保存为模板',
        'Save as Template' => '',
        'Template Name' => '模板名称',
        'Pick a profile name' => '',
        'Output to' => '输出为',

        # Template: CustomerTicketSearchOpenSearchDescription

        # Template: CustomerTicketSearchResultPrint

        # Template: CustomerTicketSearchResultShort
        'of' => '在',
        'Page' => '页',
        'Search Results for' => '搜索结果',
        '","18' => '',

        # Template: CustomerTicketZoom
        'Expand article' => '展开文章',
        'Reply' => '回复',

        # Template: CustomerWarning

        # Template: Datepicker
        'Invalid date (need a future date)!' => '无效的日期（需使用未来的日期）！',
        'Previous' => '往前',
        'Sunday' => '星期天',
        'Monday' => '星期一',
        'Tuesday' => '星期二',
        'Wednesday' => '星期三',
        'Thursday' => '星期四',
        'Friday' => '星期五',
        'Saturday' => '星期六',
        'Su' => '日',
        'Mo' => '一',
        'Tu' => '二',
        'We' => '三',
        'Th' => '四',
        'Fr' => '五',
        'Sa' => '六',
        'Open date selection' => '打开日历',

        # Template: Error
        'Oops! An Error occurred.' => '糟, 发生一个错误.',
        'Error Message' => '出错信息',
        'You can' => '你可以',
        'Send a bugreport' => '发送一个错误报告',
        'go back to the previous page' => '返回上一页',
        'Error Details' => '详细错误信息',

        # Template: Footer
        'Top of page' => '返回顶部',

        # Template: FooterJS
        'If you now leave this page, all open popup windows will be closed, too!' =>
            '如果你现在离开该页, 所有弹出的窗口也随之关闭!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            '一个弹出窗口已经打开，是否继续关闭？',
        'Please enter at least one search value or * to find anything.' =>
            '',

        # Template: FooterSmall

        # Template: HTMLHead

        # Template: HTMLHeadBlockEvents

        # Template: Header
        'You are logged in as' => '您已登录为',

        # Template: HeaderSmall

        # Template: Installer
        'JavaScript not available' => 'JavaScript 没有启用',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            '要继续使用 OTRS，请打开浏览器的 JavaScript 功能.',
        'Database Settings' => '数据库设置',
        'General Specifications and Mail Settings' => '一般设定和邮件配置',
        'Registration' => '',
        'Welcome to %s' => '欢迎使用 %s',
        'Web site' => '网址',
        'Database check successful.' => '数据库检查完成.',
        'Mail check successful.' => '邮件配置检查完成',
        'Error in the mail settings. Please correct and try again.' => '邮件设置错误, 请重新修正.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => '外发邮件配置',
        'Outbound mail type' => '外发邮件类型',
        'Select outbound mail type.' => '选择外发邮件类型。',
        'Outbound mail port' => '外发邮件端口',
        'Select outbound mail port.' => '选择外发邮件端口。',
        'SMTP host' => 'SMTP服务器',
        'SMTP host.' => 'SMTP服务器。',
        'SMTP authentication' => 'SMTP认证',
        'Does your SMTP host need authentication?' => 'SMTP服务器是否需要验证？',
        'SMTP auth user' => 'SMTP认证用户名',
        'Username for SMTP auth.' => 'SMTP认证用户名。',
        'SMTP auth password' => 'SMTP认证密码',
        'Password for SMTP auth.' => 'SMTP认证密码。',
        'Configure Inbound Mail' => '接收邮件配置',
        'Inbound mail type' => '接收邮件类型',
        'Select inbound mail type.' => '选择接收邮件类型。',
        'Inbound mail host' => '接收邮件服务器',
        'Inbound mail host.' => '接收邮件服务器。',
        'Inbound mail user' => '接收邮件用户名',
        'User for inbound mail.' => '接收邮件用户名。',
        'Inbound mail password' => '接收邮件密码',
        'Password for inbound mail.' => '接收邮件密码',
        'Result of mail configuration check' => '邮件服务器配置检查结果',
        'Check mail configuration' => '检查邮件配置',
        'Skip this step' => '跳过这一步',
        'Skipping this step will automatically skip the registration of your OTRS. Are you sure you want to continue?' =>
            '',

        # Template: InstallerDBResult
        'False' => '出错',

        # Template: InstallerDBStart
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty. For security reasons we do recommend setting a root password. For more information please refer to your database documentation.' =>
            '如果您的数据库有设置 root 密码, 请在这里输入, 否则, 请保留空白. 出于安全考虑, 我们建议您为 root 设置一个密码, 更多信息请参考数据库帮助文档.',
        'Currently only MySQL is supported in the web installer.' => 'Web安装向导目前仅支持MySQL。',
        'If you want to install OTRS on another database type, please refer to the file README.database.' =>
            '如果使用其他数据库安装OTRS，请参考README文档。',
        'Database-User' => '数据库用户名',
        'New' => '新建',
        'A new database user with limited rights will be created for this OTRS system.' =>
            '已经为OTRS系统创建了新的数据库用户',
        'default \'hot\'' => '默认密码 \'hot\'',
        'DB--- host' => '数据库服务器',
        'Check database settings' => '测试数据库设置',
        'Result of database check' => '数据库检查结果',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            '为了能够使用OTRS, 您必须以root身份输入以下行在命令行中(Terminal/Shell).',
        'Restart your webserver' => '请重启您web服务器.',
        'After doing so your OTRS is up and running.' => '完成后，您可以启动OTRS系统了.',
        'Start page' => '开始页面',
        'Your OTRS Team' => '您的OTRS小组.',

        # Template: InstallerLicense
        'Accept license' => '同意许可',
        'Don\'t accept license' => '不同意',

        # Template: InstallerLicenseText

        # Template: InstallerRegistration
        'Organization' => '组织',
        'Position' => '',
        'Complete registration and continue' => '',
        'Please fill in all fields marked as mandatory.' => '',

        # Template: InstallerSystem
        'SystemID' => '系统ID',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            '每个票单和HTTP会话ID包含系统标识符。',
        'System FQDN' => '系统全称域名',
        'Fully qualified domain name of your system.' => '系统FQDN（全称域名）',
        'AdminEmail' => '管理员地址',
        'Email address of the system administrator.' => '系统管理员邮件地址。',
        'Log' => '日志',
        'LogModule' => '日志模块',
        'Log backend to use.' => '日志后台使用。',
        'LogFile' => '日志文件',
        'Log file location is only needed for File-LogModule!' => '只需要为File-LogModule指定日志文件位置!',
        'Webfrontend' => 'Web 前端',
        'Default language' => '默认语言',
        'Default language.' => '默认语言',
        'CheckMXRecord' => '检查 MX 记录',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            '手动输入的电子邮件地址将通过DNS服务器验证MX记录。如果DNS服务器响应慢或无法提供公网解析，请不要使用此选项。',

        # Template: LinkObject
        'Object#' => '对象#',
        'Add links' => '新增链接',
        'Delete links' => '删除链接',

        # Template: Login
        'JavaScript Not Available' => '没有启用 JavaScript',
        'Browser Warning' => '提示',
        'The browser you are using is too old.' => '你使用的游览器太旧了.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            'OTRS 已确认下列的游览器可正常显示, 请挑一个你喜欢用的升级之.',
        'Please see the documentation or ask your admin for further information.' =>
            '欲了解更多信息, 请向你的管理询问或参考相关文档.',
        'Lost your password?' => '忘记密码?',
        'Request New Password' => '请求新密码',
        'Back to login' => '重新登录',

        # Template: Motd
        'Message of the Day' => '今日消息',

        # Template: NoPermission
        'Insufficient Rights' => '没有足够的权限',
        'Back to the previous page' => '返回前一页',

        # Template: Notify

        # Template: Pagination
        'Show first page' => '首页',
        'Show previous pages' => '前页',
        'Show page %s' => '第 %s 页',
        'Show next pages' => '后页',
        'Show last page' => '尾页',

        # Template: PictureUpload
        'Need FormID!' => '需要FormID',
        'No file found!' => '找不到文件！',
        'The file is not an image that can be shown inline!' => '此文件是不是一个可以显示的图像!',

        # Template: PrintFooter
        'URL' => '网址',

        # Template: PrintHeader
        'printed by' => '打印',

        # Template: PublicDefault

        # Template: Redirect

        # Template: RichTextEditor

        # Template: SpellingInline

        # Template: Test
        'OTRS Test Page' => 'OTRS 测试页',
        'Welcome %s' => '欢迎 %s',
        'Counter' => '计数器',

        # Template: Warning
        'Go back to the previous page' => '返回前一页',

        # SysConfig
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            '',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            '',
        'Activates lost password feature for agents, in the agent interface.' =>
            '',
        'Activates lost password feature for customers.' => '',
        'Activates support for customer groups.' => '',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            '',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            '',
        'Activates the ticket archive system search in the customer interface.' =>
            '',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            '',
        'Activates time accounting.' => '',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            '',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface.' =>
            '',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Agent Notifications' => '服务人员通知',
        'Agent interface article notification module to check PGP.' => '',
        'Agent interface article notification module to check S/MIME.' =>
            '',
        'Agent interface module to access fulltext search via nav bar.' =>
            '',
        'Agent interface module to access search profiles via nav bar.' =>
            '',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            '',
        'Agent interface notification module to check the used charset.' =>
            '',
        'Agent interface notification module to see the number of tickets an agent is responsible for.' =>
            '',
        'Agent interface notification module to see the number of watched tickets.' =>
            '',
        'Agents <-> Groups' => '服务人员 <-> 群组',
        'Agents <-> Roles' => '',
        'Allows adding notes in the close ticket screen of the agent interface.' =>
            '',
        'Allows adding notes in the ticket free text screen of the agent interface.' =>
            '',
        'Allows adding notes in the ticket note screen of the agent interface.' =>
            '',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows adding notes in the ticket responsible screen of the agent interface.' =>
            '',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            '',
        'Allows agents to generate individual-related stats.' => '',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            '',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            '',
        'Allows customers to change the ticket priority in the customer interface.' =>
            '',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            '',
        'Allows customers to set the ticket priority in the customer interface.' =>
            '',
        'Allows customers to set the ticket queue in the customer interface. If this is set to \'No\', QueueDefault should be configured.' =>
            '',
        'Allows customers to set the ticket service in the customer interface.' =>
            '',
        'Allows defining new types for ticket (if ticket type feature is enabled).' =>
            '',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            '',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search w. g. with this kind of conditions like "(key1&&key2)" or "(key1||key2)".' =>
            '',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search w. g. with this kind of conditions like "(key1&&key2)" or "(key1||key2)".' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            '',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            '',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            '',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            '',
        'Attachments <-> Responses' => '附件 <-> 回复',
        'Auto Responses <-> Queues' => '自动回复 <-> 队列',
        'Automated line break in text messages after x number of chars.' =>
            '',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            '',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled).' =>
            '',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            '',
        'Balanced white skin by Felix Niklas.' => '',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            '',
        'Builds an article index right after the article\'s creation.' =>
            '',
        'CMD example setup. Ignores emails where external CMD returns some output on STDOUT (email will be piped into STDIN of some.bin).' =>
            '',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for the web service config backend.' => '',
        'Change password' => '改变密码',
        'Change queue!' => '',
        'Change the customer for this ticket' => '',
        'Change the free fields for this ticket' => '',
        'Change the priority for this ticket' => '',
        'Change the responsible person for this ticket' => '',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            '',
        'Checkbox' => '',
        'Checks the SystemID in ticket number detection for follow-ups (use "No" if SystemID has been changed after using the system).' =>
            '',
        'Closed tickets of customer' => '',
        'Comment for new history entries in the customer interface.' => '',
        'Companies' => '',
        'Company Tickets' => '',
        'Company name for the customer web interface. Will also be included in emails as an X-Header.' =>
            '',
        'Configure your own log text for PGP.' => '',
        'Configures a default TicketDynmicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (http://doc.otrs.org/), chapter "Ticket Event Module".' =>
            '',
        'Configures the full-text index. Execute "bin/otrs.RebuildFulltextIndex.pl" in order to generate a new index.' =>
            '',
        'Controls if customers have the ability to sort their tickets.' =>
            '',
        'Converts HTML mails into text messages.' => '转换 HTML 邮件为文本信息.',
        'Create and manage Service Level Agreements (SLAs).' => '创建和管理服务品质协议 (SLA)',
        'Create and manage agents.' => '创建和管理服务人员.',
        'Create and manage attachments.' => '创建和管理附件.',
        'Create and manage companies.' => '创建和管理客户单位.',
        'Create and manage customers.' => '创建和管理客户.',
        'Create and manage dynamic fields.' => '',
        'Create and manage event based notifications.' => '创建和管理基于事件的通知.',
        'Create and manage groups.' => '创建和管理群组.',
        'Create and manage notifications that are sent to agents.' => '创建和管理由系统发给服务人员的通知.',
        'Create and manage queues.' => '创建和管理队列.',
        'Create and manage response templates.' => '创建和管理回复模板.',
        'Create and manage responses that are automatically sent.' => '创建和管理自动发送的回复.',
        'Create and manage roles.' => '创建和管理角色.',
        'Create and manage salutations.' => '创建和管理邮件开头的问候语.',
        'Create and manage services.' => '创建和管理服务',
        'Create and manage signatures.' => '创建和管理签名',
        'Create and manage ticket priorities.' => '创建和管理 Ticket 的优先级别.',
        'Create and manage ticket states.' => '创建和管理 Ticket 统计.',
        'Create and manage ticket types.' => '创建和管理 Ticket 的类型. ',
        'Create and manage web services.' => '',
        'Create new email ticket and send this out (outbound)' => '创建新的邮件 Ticket 并发送给用户 (内)',
        'Create new phone ticket (inbound)' => '创建新的电话 Ticket (外)',
        'Custom text for the page shown to customers that have no tickets yet.' =>
            '',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customers <-> Groups' => '客户 <-> 群组',
        'Customers <-> Services' => '客户 <-> 服务',
        'DEPRECATED! This setting is not used any more and will be removed in a future version of OTRS.' =>
            '',
        'Data used to export the search result in CSV format.' => '',
        'Date / Time' => '',
        'Debugs the translation set. If this is set to "Yes" all strings (text) without translations are written to STDERR. This can be helpful when you are creating a new translation file. Otherwise, this option should remain set to "No".' =>
            '',
        'Default ACL values for ticket actions.' => '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            '',
        'Default loop protection module.' => '',
        'Default queue ID used by the system in the agent interface.' => '',
        'Default skin for OTRS 3.0 interface.' => '',
        'Default skin for interface.' => '',
        'Default ticket ID used by the system in the agent interface.' =>
            '',
        'Default ticket ID used by the system in the customer interface.' =>
            '',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Define the start day of the week for the date picker.' => '',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            '',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            '',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            '',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            '',
        'Defines a default list of words, that are ignored by the spell checker.' =>
            '',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            '',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            '',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            '',
        'Defines a useful module to load specific user options or to display news.' =>
            '',
        'Defines all the X-headers that should be scanned.' => '',
        'Defines all the languages that are available to the application. The Key/Content pair links the front-end display name to the appropriate language PM file. The "Key" value should be the base-name of the PM file (i.e. de.pm is the file, then de is the "Key" value). The "Content" value should be the display name for the front-end. Specify any own-defined language here (see the developer documentation http://doc.otrs.org/ for more infomation). Please remember to use the HTML equivalents for non-ASCII characters (i.e. for the German oe = o umlaut, it is necessary to use the &ouml; symbol).' =>
            '',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            '',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            '',
        'Defines all the parameters for this item in the customer preferences.' =>
            '',
        'Defines all the possible stats output formats.' => '',
        'Defines an alternate URL, where the login link refers to.' => '',
        'Defines an alternate URL, where the logout link refers to.' => '',
        'Defines an alternate login URL for the customer panel..' => '',
        'Defines an alternate logout URL for the customer panel.' => '',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=$Data{"CustomerID"}\' or \'\').' =>
            '',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            '',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if composed messages have to be spell checked in the agent interface.' =>
            '',
        'Defines if time accounting is mandatory in the agent interface.' =>
            '',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            '',
        'Defines scheduler PID update time in seconds (floating point number).' =>
            '',
        'Defines scheduler sleep time in seconds after processing all available tasks (floating point number).' =>
            '',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            '',
        'Defines the URL CSS path.' => '',
        'Defines the URL base path of icons, CSS and Java Script.' => '',
        'Defines the URL image path of icons for navigation.' => '',
        'Defines the URL java script path.' => '',
        'Defines the URL rich text editor path.' => '',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            '',
        'Defines the body text for notification mails sent to agents, about new password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for notification mails sent to agents, with token about new requested password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            '',
        'Defines the body text for notification mails sent to customers, about new password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for notification mails sent to customers, with token about new requested password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for rejected emails.' => '',
        'Defines the boldness of the line drawed by the graph.' => '',
        'Defines the colors for the graphs.' => '',
        'Defines the column to store the keys for the preferences table.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view. Take care to maintain the dictionaries installed in the system in the data section.' =>
            '',
        'Defines the connections for http/ftp, via a proxy.' => '',
        'Defines the date input format used in forms (option or input fields).' =>
            '',
        'Defines the default CSS used in rich text editors.' => '',
        'Defines the default auto response type of the article for this operation.' =>
            '',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. The default themes are Standard and Lite. If you like, you can add your own theme. Please refer the administrator manual located at http://doc.otrs.org/.' =>
            '',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            '',
        'Defines the default history type in the customer interface.' => '',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            '',
        'Defines the default maximum number of search results shown on the overview page.' =>
            '',
        'Defines the default next state for a ticket after customer follow up in the customer interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default priority of follow up customer tickets in the ticket zoom screen in the customer interface.' =>
            '',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            '',
        'Defines the default priority of new tickets.' => '',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            '',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            '',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            '',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            '',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            '',
        'Defines the default sender type of the article for this operation.' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen. Example: a text, 1, DynamicField_Field1StartYear=2002;DynamicField_Field1StartMonth=12;DynamicField_Field1StartDay=12;DynamicField_Field1StartHour=00;DynamicField_Field1StartMinute=00;DynamicField_Field1StartSecond=00;DynamicField_Field1StopYear=2009;DynamicField_Field1StopMonth=02;DynamicField_Field1StopDay=10;DynamicField_Field1StopHour=23;DynamicField_Field1StopMinute=59;DynamicField_Field1StopSecond=59;.' =>
            '',
        'Defines the default sort criteria for all queues displayed in the queue view, after sort by priority is done.' =>
            '',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            '',
        'Defines the default spell checker dictionary.' => '',
        'Defines the default state of new customer tickets in the customer interface.' =>
            '',
        'Defines the default state of new tickets.' => '',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            '',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default type for article in the customer interface.' =>
            '',
        'Defines the default type of forwarded message in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the default type of the article for this operation.' => '',
        'Defines the default type of the note in the close ticket screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket zoom screen of the customer interface.' =>
            '',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            '',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            '',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            '',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            '',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            '',
        'Defines the format of responses in the ticket compose screen of the agent interface ($QData{"OrigFrom"} is From 1:1, $QData{"OrigFromName"} is only realname of From).' =>
            '',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            '',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every user for these groups).' =>
            '',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the height of the legend.' => '',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            '',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            '',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            '',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            '',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            '',
        'Defines the hours and week days to count the working time.' => '',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            '',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            '',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            '',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            '',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            '',
        'Defines the list of online repositories. Another installations can be used as repository, for example: Key="http://example.com/otrs/public.pl?Action=PublicRepository;File=" and Content="Some Name".' =>
            '',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            '',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            '',
        'Defines the maximal size (in bytes) for file uploads via the browser.' =>
            '',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            '',
        'Defines the maximum number of pages per PDF file.' => '',
        'Defines the maximum size (in MB) of the log file.' => '',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            '',
        'Defines the module that shows all the currently loged in customers in the agent interface.' =>
            '',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            '',
        'Defines the module that shows the currently loged in agents in the customer interface.' =>
            '',
        'Defines the module that shows the currently loged in customers in the customer interface.' =>
            '',
        'Defines the module to authenticate customers.' => '',
        'Defines the module to display a notification in the agent interface, (only for agents on the admin group) if the scheduler is not running.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            '',
        'Defines the module to generate html refresh headers of html sites, in the customer interface.' =>
            '',
        'Defines the module to generate html refresh headers of html sites.' =>
            '',
        'Defines the module to send emails. "Sendmail" directly uses the sendmail binary of your operating system. Any of the "SMTP" mechanisms use a specified (external) mailserver. "DoNotSendEmail" doesn\'t send emails and it is useful for test systems.' =>
            '',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            '',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            '',
        'Defines the name of the column to store the data in the preferences table.' =>
            '',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            '',
        'Defines the name of the indicated calendar.' => '',
        'Defines the name of the key for customer sessions.' => '',
        'Defines the name of the session key. E.g. Session, SessionID or OTRS.' =>
            '',
        'Defines the name of the table, where the customer preferences are stored.' =>
            '',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            '',
        'Defines the parameters for the customer preferences table.' => '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            '',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            '',
        'Defines the path for scheduler to store its console output (SchedulerOUT.log and SchedulerERR.log).' =>
            '',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Standard/CustomerAccept.dtl.' =>
            '',
        'Defines the path to PGP binary.' => '',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            '',
        'Defines the placement of the legend. This should be a two letter key of the form: \'B[LCR]|R[TCB]\'. The first letter indicates the placement (Bottom or Right), and the second letter the alignment (Left, Right, Center, Top, or Bottom).' =>
            '',
        'Defines the postmaster default queue.' => '',
        'Defines the receipent target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "SystemAddress" displays all system addresses) in the agent interface.' =>
            '',
        'Defines the receipent target of the tickets ("Queue" shows all queues, "SystemAddress" displays all system addresses) in the customer interface.' =>
            '',
        'Defines the search limit for the stats.' => '',
        'Defines the sender for rejected emails.' => '',
        'Defines the separator between the agents real name and the given queue email address.' =>
            '',
        'Defines the spacing of the legends.' => '',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            '',
        'Defines the standard size of PDF pages.' => '',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            '',
        'Defines the state of a ticket if it gets a follow-up.' => '',
        'Defines the state type of the reminder for pending tickets.' => '',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            '',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            '',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            '',
        'Defines the subject for rejected emails.' => '',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            '',
        'Defines the system identifier. Every ticket number and http session string contain this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of OTRS).' =>
            '',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            '',
        'Defines the time in days to keep log backup files.' => '',
        'Defines the time in seconds after which the Scheduler performs an automatic self-restart.' =>
            '',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            '',
        'Defines the type of protocol, used by ther web server, to serve the application. If https protocol will be used instead of plain http, it must be specified it here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            '',
        'Defines the used character for email quotes in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the user identifier for the customer panel.' => '',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            '',
        'Defines the valid state types for a ticket.' => '',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/otrs.UnlockTickets.pl" can be used.' =>
            '',
        'Defines the viewable locks of a ticket. Default: unlock, tmp_lock.' =>
            '',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the width of the legend.' => '',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            '',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            '',
        'Defines wich article type should be expanded when entering the overview. If nothing defined, latest article will be expanded.' =>
            '',
        'Delay time between autocomplete queries in milliseconds.' => '',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            '',
        'Deletes requested sessions if they have timed out.' => '',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            '',
        'Determines if the search results container for the autocomplete feature should adjust its width dynamically.' =>
            '',
        'Determines if the statistics module may generate ticket lists.' =>
            '',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            '',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            '',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            '',
        'Determines the next screen after the follow up screen of a zoomed ticket in the customer interface.' =>
            '',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return to search results, queueview, dashboard or the like, LastScreenView will return to TicketZoom.' =>
            '',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            '',
        'Determines the strings that will be shown as receipent (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the receipent.' =>
            '',
        'Determines the strings that will be shown as receipent (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the receipent.' =>
            '',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            '',
        'Determines which options will be valid of the recepient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            '',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            '',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be activated).' =>
            '',
        'Disables the web installer (http://yourhost.example.com/otrs/installer.pl), to prevent the system from being hijacked. If set to "No", the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If not active, it also disables the GenericAgent, PackageManager and SQL Box (to avoid the use of destructive queries, such as DROP DATABASE, and also to steal user passwords).' =>
            '',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            '',
        'Dropdown' => '',
        'Dynamic Fields Checkbox Backend GUI' => '',
        'Dynamic Fields Date Time Backend GUI' => '',
        'Dynamic Fields Drop-down Backend GUI' => '',
        'Dynamic Fields GUI' => '',
        'Dynamic Fields Multiselect Backend GUI' => '',
        'Dynamic Fields Overview Limit' => '',
        'Dynamic Fields Text Backend GUI' => '',
        'Dynamic Fields used to export the search result in CSV format.' =>
            '',
        'Dynamic fields limit per page for Dynamic Fields Overview' => '',
        'Dynamic fields options shown in the ticket message screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###AttributesView.' =>
            '',
        'Dynamic fields shown in the ticket close screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket compose screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket email screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket forward screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket free text screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket medium format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket move screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket note screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket owner screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket pending screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone inbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket preview format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket priority screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket responsible screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'DynamicField backend registration.' => '',
        'DynamicField object registration.' => '',
        'Email Addresses' => 'Email 地址',
        'Enables PDF output. The CPAN module PDF::API2 is required, if not installed, PDF output will be disabled.' =>
            '',
        'Enables PGP support. When PGP support is enabled for signing and securing mail, it is HIGHLY recommended that the web server be run as the OTRS user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            '',
        'Enables S/MIME support.' => '',
        'Enables customers to create their own accounts.' => '',
        'Enables file upload in the package manager frontend.' => '',
        'Enables or disable the debug mode over frontend interface.' => '',
        'Enables or disables the autocomplete feature for the customer search in the agent interface.' =>
            '',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            '',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            '',
        'Enables spell checker support.' => '',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            '',
        'Enables ticket bulk action feature only for the listed groups.' =>
            '',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            '',
        'Enables ticket watcher feature only for the listed groups.' => '',
        'Escalation view' => '',
        'Event list to be displayed on GUI to trigger generic interface invokers.' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Example for dynamic dield' => '',
        'Example for dynamic field' => '',
        'Example for free text' => '',
        'Execute SQL statements.' => '执行 SQL 命令',
        'Executes follow up checks on In-Reply-To or References headers for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow up mail attachments checks in  mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow up mail body checks in mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow up plain/raw mail checks in mails that don\'t have a ticket number in the subject.' =>
            '',
        'Experimental "Slim" skin which tries to save screen space for power users.' =>
            '',
        'Exports the whole article tree in search result (it can affect the system performance).' =>
            '',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            '',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Standard/AgentInfo.dtl.' =>
            '',
        'Filter incoming emails.' => '过滤收到的邮件.',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            '',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            '',
        'Forces to unlock tickets after being moved to another queue.' =>
            '',
        'Frontend language' => '语言介面',
        'Frontend module registration (disable company link if no company feature is used).' =>
            '',
        'Frontend module registration for the agent interface.' => '',
        'Frontend module registration for the customer interface.' => '',
        'Frontend theme' => '介面风格',
        'GenericAgent' => '计划任务',
        'GenericInterface Debugger GUI' => '',
        'GenericInterface Invoker GUI' => '',
        'GenericInterface Operation GUI' => '',
        'GenericInterface TransportHTTPSOAP GUI' => '',
        'GenericInterface Web Service GUI' => '',
        'GenericInterface Webservice History GUI' => '',
        'GenericInterface Webservice Mapping GUI' => '',
        'GenericInterface module registration for the invoker layer.' => '',
        'GenericInterface module registration for the mapping layer.' => '',
        'GenericInterface module registration for the operation layer.' =>
            '',
        'GenericInterface module registration for the transport layer.' =>
            '',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files.' =>
            '',
        'Grants access, if the customer ID of the ticket matches the customer user\'s ID and the customer user has group permissions on the queue the ticket is in.' =>
            '',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). Runtime will do full-text searches on live data (it works fine for up to 50.000 tickets). StaticDB will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/otrs.RebuildFulltextIndex.pl".' =>
            '',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the crypt type of passwords must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            '',
        'If "DB" was selected for SessionModule, a column for the identifiers in session table must be specified.' =>
            '',
        'If "DB" was selected for SessionModule, a column for the values in session table must be specified.' =>
            '',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            '',
        'If "FS" was selected for SessionModule, a directory where the session data will be stored must be specified.' =>
            '',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            '',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and special paramaters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            '',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use OTRS. Specify the group, who may access the system.' =>
            '',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            '',
        'If "Sendmail" was selected as SendmailModule, the location of the sendmail binary and the needed options must be specified.' =>
            '',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            '',
        'If "SysLog" was selected for LogModule, a special log sock can be specified (on solaris you may need to use \'stream\').' =>
            '',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            '',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            '',
        'If a note is added by an agent, sets the state of a ticket in the close ticket screen of the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of a ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of a ticket in the ticket free text screen of the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of a ticket in the ticket note screen of the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of a ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'If a note is added by an agent, sets the state of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            '',
        'If enabled, OTRS will deliver all CSS files in minified form. WARNING: If you turn this off, there will likely be problems in IE 7, because it cannot load more than 32 CSS files.' =>
            '',
        'If enabled, OTRS will deliver all JavaScript files in minified form.' =>
            '',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            '',
        'If enabled, the OTRS version tag will be removed from the HTTP headers.' =>
            '',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            '',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            '',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty.' =>
            '',
        'If this regex matches, no message will be send by the autoresponder.' =>
            '',
        'If you want to use a mirror database for agent ticket fulltext search or to generate stats, specify the DSN to this database.' =>
            '',
        'If you want to use a mirror database for agent ticket fulltext search or to generate stats, the password to authenticate to this database can be specified.' =>
            '',
        'If you want to use a mirror database for agent ticket fulltext search or to generate stats, the user to authenticate to this database can be specified.' =>
            '',
        'Ignore article with system sender type for new article feature (e. g. auto responses or email notifications).' =>
            '',
        'Includes article create times in the ticket search of the agent interface.' =>
            '',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the script "bin/otrs.RebuildTicketIndex.pl" for initial index update.' =>
            '',
        'Install ispell or aspell on the system, if you want to use a spell checker. Please specify the path to the aspell or ispell binary on your operating system.' =>
            '',
        'Interface language' => '',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'Link agents to groups.' => '链接服务人员到群组.',
        'Link agents to roles.' => '链接服务人员到角色.',
        'Link attachments to responses templates.' => '链接附件到回复模板.',
        'Link customers to groups.' => '链接客户到群组.',
        'Link customers to services.' => '链接客户到服务.',
        'Link queues to auto responses.' => '',
        'Link responses to queues.' => '链接回复模板到队列',
        'Link roles to groups.' => '',
        'Links 2 tickets with a "Normal" type link.' => '',
        'Links 2 tickets with a "ParentChild" type link.' => '',
        'List of CSS files to always be loaded for the agent interface.' =>
            '',
        'List of CSS files to always be loaded for the customer interface.' =>
            '',
        'List of IE6-specific CSS files to always be loaded for the customer interface.' =>
            '',
        'List of IE7-specific CSS files to always be loaded for the agent interface.' =>
            '',
        'List of IE7-specific CSS files to always be loaded for the customer interface.' =>
            '',
        'List of IE8-specific CSS files to always be loaded for the agent interface.' =>
            '',
        'List of IE8-specific CSS files to always be loaded for the customer interface.' =>
            '',
        'List of JS files to always be loaded for the agent interface.' =>
            '',
        'List of JS files to always be loaded for the customer interface.' =>
            '',
        'List of default StandardResponses which are assigned automatically to new Queues upon creation.' =>
            '',
        'Log file for the ticket counter.' => '',
        'Mail Accounts' => '',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            '',
        'Makes the application check the syntax of email addresses.' => '',
        'Makes the picture transparent.' => '',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            '',
        'Manage PGP keys for email encryption.' => '管理用户邮件加密的 PGP 密钥.',
        'Manage POP3 or IMAP accounts to fetch email from.' => '管理收取邮件的 POP3 或 IMAP 帐号.',
        'Manage S/MIME certificates for email encryption.' => '管理邮件的 S/MIME 加密证书.',
        'Manage existing sessions.' => '管理当前登录会话.',
        'Manage periodic tasks.' => '管理周期性执行的任务.',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            '',
        'Max size of the subjects in an email reply.' => '',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            '',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            '',
        'Maximum size (in characters) of the customer info table in the queue view.' =>
            '',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            '',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            '',
        'Module to check customer permissions.' => '',
        'Module to check if a user is in a special group. Access is granted, if the user is in the specified group and has ro and rw permissions.' =>
            '',
        'Module to check if arrived emails should be marked as email-internal (because of original forwared internal email it college). ArticleType and SenderType define the values for the arrived email/article.' =>
            '',
        'Module to check the agent responsible of a ticket.' => '',
        'Module to check the group permissions for the access to customer tickets.' =>
            '',
        'Module to check the owner of a ticket.' => '',
        'Module to check the watcher agents of a ticket.' => '',
        'Module to compose signed messages (PGP or S/MIME).' => '',
        'Module to crypt composed messages (PGP or S/MIME).' => '',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            '',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            '',
        'Module to generate accounted time ticket statistics.' => '',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            '',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            '',
        'Module to generate ticket solution and response time statistics.' =>
            '',
        'Module to generate ticket statistics.' => '',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            '',
        'Module to use database filter storage.' => '',
        'Multiselect' => '',
        'My Tickets' => '',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            '',
        'New email ticket' => '新的邮件 Ticket',
        'New phone ticket' => '新的电话 Ticket',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Notifications (Event)' => '通知（事件）',
        'Number of displayed tickets' => '',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            '',
        'Open tickets of customer' => '',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            '',
        'Overview Escalated Tickets' => '',
        'Overview Refresh Time' => '',
        'Overview of all open Tickets.' => '',
        'PGP Key Management' => '',
        'PGP Key Upload' => '',
        'Parameters for the CreateNextMask object in the preference view of the agent interface.' =>
            '',
        'Parameters for the CustomQueue object in the preference view of the agent interface.' =>
            '',
        'Parameters for the FollowUpNotify object in the preference view of the agent interface.' =>
            '',
        'Parameters for the LockTimeoutNotify object in the preference view of the agent interface.' =>
            '',
        'Parameters for the MoveNotify object in the preference view of the agent interface.' =>
            '',
        'Parameters for the NewTicketNotify object in the preferences view of the agent interface.' =>
            '',
        'Parameters for the RefreshTime object in the preference view of the agent interface.' =>
            '',
        'Parameters for the WatcherNotify object in the preference view of the agent interface.' =>
            '',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket calendar of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket stats of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the pages (in which the dynamic fields are shown) of the dynamic fields overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the medium ticket overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the small ticket overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the ticket preview overview.' =>
            '',
        'Parameters of the example SLA attribute Comment2.' => '',
        'Parameters of the example queue attribute Comment2.' => '',
        'Parameters of the example service attribute Comment2.' => '',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            '',
        'Path of the file that stores all the settings for the QueueObject object for the agent interface.' =>
            '',
        'Path of the file that stores all the settings for the QueueObject object for the customer interface.' =>
            '',
        'Path of the file that stores all the settings for the TicketObject for the agent interface.' =>
            '',
        'Path of the file that stores all the settings for the TicketObject for the customer interface.' =>
            '',
        'Performs the configured action for each event (as an Invoker) for each configured Webservice.' =>
            '',
        'Permitted width for compose email windows.' => '',
        'Permitted width for compose note windows.' => '',
        'Picture-Upload' => '',
        'PostMaster Filters' => '收件过滤器',
        'PostMaster Mail Accounts' => '邮件帐号管理',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see http://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            '',
        'Queue view' => '队列视图',
        'Refresh Overviews after' => '',
        'Refresh interval' => '刷新间隔时间',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            '',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            '',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket merge screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            '',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            '',
        'Responses <-> Queues' => '回复 <-> 队列',
        'Restores a ticket from the archive (only if the event is a state change, from closed to any open available state).' =>
            '',
        'Roles <-> Groups' => '角色 <-> 组',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            '',
        'Runs the system in "Demo" mode. If set to "Yes", agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            '',
        'S/MIME Certificate Upload' => '已上传的 S/MIME 证书',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the OTRS user. You can switch between the modules even on a system that is already in production without any loss of data.' =>
            '',
        'Saves the login and password on the session table in the database, if "DB" was selected for SessionModule.' =>
            '',
        'Search backend default router.' => '',
        'Search backend router.' => '',
        'Select your frontend Theme.' => '界面主题.',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            '',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            '',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            '如果客人回复的 Ticket 属于我, 或者该 Ticket 未锁定但在我的队列, 请发送一个通知给我.',
        'Send notifications to users.' => '发送通知给用户.',
        'Send ticket follow up notifications' => '发送 Ticket 跟进通知',
        'Sender type for new tickets from the customer inteface.' => '',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            '',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            '',
        'Sends customer notifications just to the mapped customer. Normally, if no customer is mapped, the latest customer sender gets the notification.' =>
            '',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            '',
        'Sends the notifications which are configured in the admin interface under "Notfication (Event)".' =>
            '',
        'Set sender email addresses for this system.' => '为系统设置寄件人的邮件地址.',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            '',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            '',
        'Set this to yes if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            '',
        'Sets if ticket owner must be selected by the agent.' => '',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            '',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            '',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            '',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            '',
        'Sets the default article type for new email tickets in the agent interface.' =>
            '',
        'Sets the default article type for new phone tickets in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            '',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            '',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            '',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            '',
        'Sets the default priority for new email tickets in the agent interface.' =>
            '',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            '',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            '',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the default text for new email tickets in the agent interface.' =>
            '',
        'Sets the display order of the different items in the preferences view.' =>
            '',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is loged out.' =>
            '',
        'Sets the minimal ticket counter size (if "AutoIncrement" was selected as TicketNumberGenerator). Default is 5, this means the counter starts from 10000.' =>
            '',
        'Sets the minimum number of characters before autocomplete query is sent.' =>
            '',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            '',
        'Sets the number of search results to be displayed for the autocomplete feature.' =>
            '',
        'Sets the options for PGP binary.' => '',
        'Sets the order of the different items in the customer preferences view.' =>
            '',
        'Sets the password for private PGP key.' => '',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            '',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            '',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the size of the statistic graph.' => '',
        'Sets the stats hook.' => '',
        'Sets the system time zone (required a system with UTC as system time). Otherwise this is a diff time to the local time.' =>
            '',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the time type which should be shown.' => '',
        'Sets the timeout (in seconds) for http/ftp downloads.' => '',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            '',
        'Sets the user time zone per user (required a system with UTC as system time and UTC under TimeZone). Otherwise this is a diff time to the local time.' =>
            '',
        'Sets the user time zone per user based on java script / browser time zone offset feature at login time.' =>
            '',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            '',
        'Show article as rich text even if rich text writing is disabled.' =>
            '',
        'Shows a count of icons in the ticket zoom, if the article has attachments.' =>
            '',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            '',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to see the customer who requested the ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to see the owner of a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to see the responsible agent of a ticket in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to set a ticket as spam in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            '',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            '',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            '',
        'Shows a link to see a zoomed email ticket in plain text.' => '',
        'Shows a link to set a ticket as spam in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            '',
        'Shows all both ro and rw queues in the queue view.' => '',
        'Shows all open tickets (even if they are locked) in the escalation view of the agent interface.' =>
            '',
        'Shows all open tickets (even if they are locked) in the status view of the agent interface.' =>
            '',
        'Shows all the articles of the ticket (expanded) in the zoom view.' =>
            '',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            '',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            '',
        'Shows colors for different article types in the article table.' =>
            '',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            '',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            '',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            '',
        'Shows the activated ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            '',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            '',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            '',
        'Shows the customer user\'s info in the ticket zoom view.' => '',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.' =>
            '',
        'Shows the message of the day on login screen of the agent interface.' =>
            '',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            '',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows the title fields in the close ticket screen of the agent interface.' =>
            '',
        'Shows the title fields in the ticket free text screen of the agent interface.' =>
            '',
        'Shows the title fields in the ticket note screen of the agent interface.' =>
            '',
        'Shows the title fields in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows time in long format (days, hours, minutes), if set to "Yes"; or in short format (days, hours), if set to "No".' =>
            '',
        'Shows time use complete description (days, hours, minutes), if set to "Yes"; or just first letter (d, h, m), if set to "No".' =>
            '',
        'Skin' => '皮肤',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            '',
        'Spam Assassin example setup. Ignores emails that are marked with SpamAssassin.' =>
            '',
        'Spam Assassin example setup. Moves marked mails to spam queue.' =>
            '',
        'Specifies if an agent should receive email notification of his own actions.' =>
            '',
        'Specifies the background color of the chart.' => '',
        'Specifies the background color of the picture.' => '',
        'Specifies the border color of the chart.' => '',
        'Specifies the border color of the legend.' => '',
        'Specifies the bottom margin of the chart.' => '',
        'Specifies the different article types that will be used in the system.' =>
            '',
        'Specifies the different note types that will be used in the system.' =>
            '',
        'Specifies the directory to store the data in, if "FS" was selected for TicketStorageModule.' =>
            '',
        'Specifies the directory where SSL certificates are stored.' => '',
        'Specifies the directory where private SSL certificates are stored.' =>
            '',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "OTRS Notification Master" otrs@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address. Notifications are messages such as en::Customer::QueueUpdate or en::Agent::Move.' =>
            '',
        'Specifies the left margin of the chart.' => '',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "OTRS Notification Master" otrs@your.example.com). Notifications are messages such as en::Customer::QueueUpdate or en::Agent::Move.' =>
            '',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png, 700 x 100 pixel).' =>
            '',
        'Specifies the path of the file for the performance log.' => '',
        'Specifies the path to the converter that allows the view of Microsoft Excel files, in the web interface.' =>
            '',
        'Specifies the path to the converter that allows the view of Microsoft Word files, in the web interface.' =>
            '',
        'Specifies the path to the converter that allows the view of PDF documents, in the web interface.' =>
            '',
        'Specifies the path to the converter that allows the view of XML files, in the web interface.' =>
            '',
        'Specifies the right margin of the chart.' => '',
        'Specifies the text color of the chart (e. g. caption).' => '',
        'Specifies the text color of the legend.' => '',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            '',
        'Specifies the top margin of the chart.' => '',
        'Specifies user id of the postmaster data base.' => '',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            '',
        'Start number for statistics counting. Every new stat increments this number.' =>
            '',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            '',
        'Statistics' => '统计',
        'Status view' => '状态视图',
        'Stores cookies after the browser has been closed.' => '',
        'Strips empty lines on the ticket preview in the queue view.' => '',
        'Textarea' => '',
        'The "bin/PostMasterMailAccount.pl" will reconnect to POP3/POP3S/IMAP/IMAPS host after the specified count of messages.' =>
            '',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            '',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            '',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            '',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            '',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the last case you should enable PostmasterFollowupSearchInRaw or PostmasterFollowUpSearchInReferences to recognize followups based on email headers and/or body.' =>
            '',
        'The headline shown in the customer interface.' => '',
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            '',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The logo shown on top of the login box of the agent interface. The URL to the image must be relative URL to the skin image directory.' =>
            '',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            '',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            '',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            '',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            '',
        'Ticket event module that triggers the escalation stop events.' =>
            '',
        'Ticket overview' => '票单一览',
        'Tickets' => '票单',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            '',
        'Toolbar Item for a shortcut.' => '',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            '',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            '',
        'Types' => '类型',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            '',
        'Update and extend your system with software packages.' => '更新或安装系统的软件包或模块.',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            '',
        'Updates the ticket index accelerator.' => '',
        'Uses Cc recipients in reply Cc list on compose an email answer in the ticket compose screen of the agent interface.' =>
            '',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard responses, auto responses and notifications.' =>
            '',
        'View performance benchmark results.' => '查看性能基准测试结果.',
        'View system log messages.' => '查看系统日志信息',
        'Wear this frontend skin' => '当前使用的皮肤',
        'Webservice path separator.' => '',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. In this text area you can define this text (This text cannot be changed by the agent).' =>
            '',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            '',
        'Your language' => '',
        'Your queue selection of your favorite queues. You also get notified about those queues via email if enabled.' =>
            '您的最常用队列，如果您设置了邮件通知，您将会得到该队列的状态通知.',

        #
        # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
        #
        '%s Tickets affected! Do you really want to use this job?' => '%s Tickets 受到影响! 您确定要使用这个计划任务?',
        '(Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behinde a dial-up line $!)' =>
            '通过撰写答案来检查用过的电子邮件地址的MX记录。您OTRS机器在拨号接入的低速网络里，请不要使用CheckMXRecord!',
        '(Email of the system admin)' => '(系统管理员邮件地址)',
        '(Full qualified domain name of your system)' => '(系统域名)',
        '(Logfile just needed for File-LogModule!)' => '(只有激活 File-LogModule 时才需要 Logfile!)',
        '(Note: It depends on your installation how many dynamic objects you can use)' =>
            '注：这取决于您的安装多少动态对象可以使用',
        '(Note: Useful for big databases and low performance server)' => '注：适用于大型数据库和低性能的服务器',
        '(The identify of the system. Each ticket number and each http session id starts with this number)' =>
            '(系统标识符. Ticket 编号和 http 会话都以这个标识符开头)',
        '(Used default language)' => '(使用缺省语言)',
        '(Used log backend)' => '使用日志后端',
        '(Used ticket number format)' => '(使用 Ticket 编号格式)',
        'A article should have a title!' => '文章必须有标题!',
        'A message must be spell checked!' => '消息必须经过拼写检查!',
        'A message should have a To: recipient!' => '邮件必须有收件人!',
        'A message should have a body!' => '邮件必须包含内容!',
        'A message should have a subject!' => '邮件必须有标题!',
        'A new password will be sent to your e-mail adress.' => '一个新密码已经发送到你的邮箱',
        'A required field is:' => '必须的字段是',
        'A web calendar' => 'Web 日历',
        'A web file manager' => 'Web 文件管理器',
        'A web mail client' => 'WebMail 客户端',
        'About OTRS' => '关于 OTRS',
        'Absolut Period' => '绝对周期',
        'Add Customer User' => '增加客人',
        'Add System Address' => '增加系统邮件地址',
        'Add User' => '增加人员',
        'Add a new Agent.' => '增加一个新的人员',
        'Add a new Customer Company.' => '增加客人到单位里',
        'Add a new Group.' => '增加一个新组',
        'Add a new Notification.' => '新增一个通知.',
        'Add a new Priority.' => '增加一个新的优先级',
        'Add a new Role.' => '新增一个角色',
        'Add a new SLA.' => '新增一个服务级别协议(SLA).',
        'Add a new Salutation.' => '增加一个新的称呼语',
        'Add a new Service.' => '新增一个服务',
        'Add a new Signature.' => '新增一个签名',
        'Add a new State.' => '增加一个新的状态',
        'Add a new System Address.' => '增加一个新的系统邮件地址.',
        'Add a new Type.' => '增加一个新的类型',
        'Add a note to this ticket!' => '添加注解!',
        'Add new attachment' => '增加新的附件',
        'Add note to ticket' => '增加注解到 Ticket',
        'Added User "%s"' => '增加用户 "%s".',
        'Admin-Area' => '管理区域',
        'Admin-Password' => '管理员密码',
        'Admin-User' => '数据库管理员',
        'Admin-password' => '管理员密码',
        'Agent Mailbox' => '技术支持人员邮箱',
        'Agent Preferences' => '个人设置',
        'Agent based' => '基于技术支持代表的',
        'Agent-Area' => '技术支持人员区',
        'All Agent variables.' => '所有的技术人员变量',
        'All Agents' => '所有技术支持人员',
        'All Customer variables like defined in config option CustomerUser.' =>
            '所有客户变量可以在配置选项CustomerUser中定义',
        'All customer tickets.' => '该客户所有 Tickets 记录.',
        'All email addresses get excluded on replaying on composing and email.' =>
            '所有被取消撰写邮件功能的邮件地址',
        'All incoming emails with this "Email" (To:) will be dispatched in the selected queue!' =>
            '所有发送到该收件人的消息将被转到所选择的队列',
        'All messages' => '所有消息',
        'All new tickets!' => '所有新的tickets',
        'All tickets where the reminder date has reached!' => '所有已到提醒日期的Ticket',
        'All tickets which are escalated!' => '所有升级的tickets',
        'Allocate CustomerUser to service' => '指派客户到服务',
        'Allocate services to CustomerUser' => '分配服务给客户',
        'Answer' => '回复',
        'Article Create Times' => '信件创建时间',
        'Article Create Times (between)' => '信件创建于指定时间范围',
        'Article created between' => '信件创建于指定时间范围',
        'Article filter settings' => 'Article 过滤设置',
        'Attach' => '附件',
        'Attribute' => '属性',
        'Auto Response From' => '自动回复来自',
        'Bounce Ticket: ' => '回退票单：',
        'Bounce ticket' => '回退 Ticket ',
        'Can not create link with %s!' => '不能为 %s 创建连接',
        'Can not delete link with %s!' => '不能删除 %s 的连接',
        'Can\'t update password, invalid characters!' => '无法更新密码，包含无效字符.',
        'Can\'t update password, must be at least %s characters!' => '无法更新密码，密码长度至少%s位.',
        'Can\'t update password, must contain 2 lower and 2 upper characters!' =>
            '无法更新密码，至少包含2个大写字符和2个小写字符.',
        'Can\'t update password, needs at least 1 digit!' => '无法更新密码，至少包含1位数字',
        'Can\'t update password, needs at least 2 characters!' => '无法更新密码，至少包含2个字母!',
        'Can\'t update password, your new passwords do not match! Please try again!' =>
            '密码两次不符，无法更新，请重新输入',
        'Category Tree' => '目录树',
        'Change %s settings' => '修改 %s 设置',
        'Change Times' => '改变时间',
        'Change free text of ticket' => '修改 Ticket 额外信息',
        'Change owner of ticket' => '修改 Ticket 所有者',
        'Change priority of ticket' => '调整 Ticket 优先级',
        'Change responsible of ticket' => '更改 Ticket 的负责人',
        'Change the ticket customer!' => '修改客户!',
        'Change the ticket owner!' => '变更所有者!',
        'Change the ticket priority!' => '修改优先级',
        'Change user <-> group settings' => '修改 用户 <-> 组 设置',
        'ChangeLog' => '改变记录',
        'Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behind a dial-up line!' =>
            '检查 MX 记录可校验邮件地址的正确性, 如果你的 OTRS 系统是使用拔号方式接入互联网, 请不要打开此功能!',
        'Child-Object' => '子对象',
        'Clear From' => '重置',
        'Clear To' => '清空',
        'Click here to report a bug!' => '点击这里报告一个 Bug!',
        'Close Times' => '关闭时间',
        'Close this ticket!' => '关闭票单!',
        'Close ticket' => '关闭 Ticket',
        'Close type' => '关闭类型',
        'Close!' => '关闭!',
        'Collapse View' => '折叠',
        'Comment (internal)' => '注释 (内部)',
        'CompanyTickets' => '公司Tickets',
        'Compose Answer' => '撰写答复',
        'Compose Email' => '撰写 Email',
        'Compose Follow up' => '撰写跟踪答复',
        'Config Options' => '配置选项',
        'Config options (e. g. &lt;OTRS_CONFIG_HttpType&gt;)' => '配置选项 (例如: &lt;OTRS_CONFIG_HttpType&gt;)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>)' => '配置选项 (例如:<OTRS_CONFIG_HttpType>)',
        'Contact customer' => '联系客户',
        'Create New Template' => '创建新的模板',
        'Create Times' => '创建时间',
        'Create new Phone Ticket' => '创建新的电话 Ticket',
        'Create new database' => '创建新的数据库',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...).' =>
            '创建新的组来控制不同的存取权限',
        'Create/Expires' => '创建/过期',
        'CreateTicket' => '创建 Ticket',
        'Customer Move Notify' => 'Ticket 移动客户通知',
        'Customer Owner Notify' => '客户所有者通告',
        'Customer State Notify' => 'Ticket 状态客户通知',
        'Customer User' => '客户用户',
        'Customer User Management' => '客户用户管理',
        'Customer Users' => '客户用户',
        'Customer Users <-> Groups' => '客户用户 <-> 组',
        'Customer Users <-> Groups Management' => '客户用户 <-> 组 管理',
        'Customer Users <-> Services' => '客户帐号 <-> 服务管理',
        'Customer Users <-> Services Management' => '客户帐号 <-> 服务管理',
        'Customer history' => '客户历史情况',
        'Customer history search' => '客户历史搜索',
        'Customer history search (e. g. "ID342425").' => '搜索客户历史 (例如： "ID342425").',
        'Customer user will be needed to have a customer history and to login via customer panel.' =>
            '客户用户必须有一个账号从客户登录页面登录系统.',
        'CustomerUser' => '客户用户',
        'D' => '降序',
        'DB Admin Password' => '数据系统管理员密码',
        'DB Admin User' => '数据库管理员用户名',
        'DB Host' => '数据库主机',
        'DB Type' => '数据库类型',
        'DB connect host' => '数据连接主机',
        'Days' => '天',
        'Default' => '缺省',
        'Default Charset' => '缺省字符集',
        'Default Language' => '缺省语言',
        'Delete old database' => '删除旧数据库',
        'Delete this ticket!' => '删除票单!',
        'Detail' => '细节',
        'Diff' => '比较',
        'Discard all changes and return to the compose screen' => '放弃所有修改,回到撰写页面',
        'Do dispatch or filter incoming emails based on email X-Headers! RegExp is also possible.' =>
            '如果您想根据 X-Headers 内容来过滤，可以使用正规则表达式.',
        'Do you really want to delete this Object?' => '您是否确认删除该对象?',
        'Do you really want to reinstall this package (all manual changes get lost)?' =>
            '您是否准备好重新安装这些软件包 (所有手工设置将会不见)?',
        'Don\'t forget to add a new user to groups and/or roles!' => '不要忘记增加一个用户到组和角色!',
        'Don\'t forget to add a new user to groups!' => '不要忘记增加新的用户到组!',
        'Don\'t work with UserID 1 (System account)! Create new users!' =>
            '不要使用 UserID 1 (系统账号)! 请创建一个新的用户!',
        'Download Settings' => '下载设置',
        'Download all system config changes.' => '下载所有的系统配置变化.',
        'Drop Database' => '删除数据库',
        'Dynamic-Object' => '动态对象',
        'Edit Article' => '编辑信件',
        'Edit default services.' => '编辑默认服务',
        'Email based' => '基于电邮的',
        'Email of the system admin.' => '管理员的邮件地址',
        'Escalation - First Response Time' => '任务调升 - 首次回复的时间',
        'Escalation - Solution Time' => '任务调升 - 解决的时间',
        'Escalation - Update Time' => '任务调升 - 更新的时间',
        'Escalation Times' => '升级时间',
        'Escalation time' => '限时答复时间',
        'Event is required!' => '需要事件',
        'Expand View' => '展开',
        'Explanation' => '解释',
        'Export Config' => '导出配置',
        'FileManager' => '文件管理器',
        'Filelist' => '文件清单',
        'Filter for Language' => '过滤特定的语言',
        'Filtername' => '过滤器名称',
        'Follow up' => '跟进',
        'Follow up notification' => '跟踪通知',
        'For very complex stats it is possible to include a hardcoded file.' =>
            '对于非常复杂的统计有可能包括一个硬编码文件',
        'Forward ticket: ' => '转发票单：',
        'Frontend' => '前端界面',
        'Full qualified domain name of your system.' => '为系统指定一个域名(FQDN)',
        'Fulltext-Search in Article (e. g. "Mar*in" or "Baue*")' => '文章全文搜索 (例如: "Mar*in" 或者 "Baue*")',
        'General Catalog' => '总目录',
        'Go' => '执行',
        'Group Ro' => '只读权限的组',
        'Group based' => '基于组的',
        'Group selection' => '选择组',
        'Hash/Fingerprint' => '哈希/指纹',
        'Have a lot of fun!' => 'Have a lot of fun!',
        'Have you lost your password?' => '你的密码忘记了?',
        'Help' => '帮助',
        'Here you can define the value series. You have the possibility to select one or two elements. Then you can select the attributes of elements. Each attribute will be shown as single value series. If you don\'t select any attribute all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            '在这里，您可以定义一系列的值。你有可能选择一个或两个元素。然后您可以选择元素的属性。每个属性将显示为单一的值。如果您不选择任何属性, 那么当您生成一个统计的时候所有元素的属性将被使用。并且一个新的属性被更新到上次配置中',
        'Here you can define the x-axis. You can select one element via the radio button. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            '在这里，您可以定义x轴。您可以选择的一个因素通过单选按钮。如果你没有选择，所有元素的属性将被使用当您生成一个统计的时候。并且一个新的属性被更新到上次配置中',
        'Here you can define the x-axis. You can select one element via the radio button. Then you you have to select two or more attributes of the element. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            '在这里，您可以定义x轴。您可以选择的一个因素通过单选按钮。然后，你必须选择该元素两个或两个以上的属性。如果您不选择任何属性, 那么当您生成一个统计的时候所有元素的属性将被使用。并且一个新的属性被更新到上次配置中',
        'Here you can insert a description of the stat.' => '您可以插入统计的描述',
        'Here you can select the dynamic object you want to use.' => '您可以选择您需要使用的动态对象',
        'Home' => '首页',
        'How we should adress you' => '我们应该如何称呼你?',
        'If Secure Mode is not activated, activate it via SysConfig because your application is already running.' =>
            '如果启动模式没有被启动，请通过系统设置启动它因为您的OTRS程序已经运行',
        'If a new hardcoded file is available this attribute will be shown and you can select one.' =>
            '如果一个新的硬编码文件存在，可此属性将显示，您可以选择其中一个',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked for the old owner.' =>
            '如果 Ticket 已经处于关闭状态，而客户就发送了一个跟进 Ticket，那么这个 Ticket 将会被直接加锁，而所有者被定义为原来所有者',
        'If a ticket will not be answered in this time, just only this ticket will be shown.' =>
            '该队列只显示规定时间内没有被处理的 Ticket',
        'If an agent locks a ticket and he/she will not send an answer within this time, the ticket will be unlock automatically. So the ticket is viewable for all other agents.' =>
            '如果技术支持人员锁定了 Ticket,但是在一定的时间内没有回复，该 Ticket 将会被自动解锁，而对所有的技术支持人员可视.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the user).' =>
            '如果不选择，则该组没有权限 (该组无法处理 Ticket)',
        'If you need the sum of every column select yes.' => '如需要每列的总和选择’yes’',
        'If you need the sum of every row select yes' => '如需要每行的总和选择 yes’',
        'If you use RegExp, you also can use the matched value in () as [***] in \'Set\'.' =>
            '如果您用RegExp，您也能使用匹配值in () as [***] in \'Set\'',
        'If you want to install OTRS on other database systems, please refer to the file README.database.' =>
            '如果你想在其它的数据系统上安装 OTRS, 请参考 README.database 文件.',
        'Image' => '图片',
        'Important' => '重要',
        'In order to experience OTRS, you\'ll need to enable Javascript in your browser.' =>
            '如果你想继续体验OTRS， 你需要启用浏览器的 JavaScript 功能',
        'In this form you can select the basic specifications.' => '以这种形式，您可以选择基本规范',
        'Information about the Stat' => '关于统计的信息',
        'Insert of the common specifications' => '插入共同规范',
        'Is Job Valid' => '工作有效',
        'Is Job Valid?' => '工作是否有效?',
        'It\'s useful for ASP solutions.' => '这是一个有效的应用服务提供商(ASP)解决方案.',
        'It\'s useful for a lot of users and groups.' => '当有大量的用户和组的时候，角色非常适合.',
        'Job-List' => '工作列表',
        'Keyword' => '关键字',
        'Keywords' => '关键字',
        'Last update' => '最后更新于',
        'Link auto responses to queues.' => '链接自动回复到队列.',
        'Link groups to roles.' => '链接群组到角色.',
        'Link this ticket to an other objects!' => '链接到其他对象!',
        'Link to Parent' => '合并到上一级',
        'LinkType' => '连接类型',
        'Linked as' => '已连接为',
        'Load' => '加载',
        'Load Settings' => '加载设置',
        'Lock it to work on it!' => '锁定并开始工作 !',
        'Logfile' => '日志文件',
        'Logfile too large, you need to reset it!' => '日志文件过大, 你需要重置它',
        'Login failed! Your username or password was entered incorrectly.' =>
            '登录失败，您的用户名或密码不正确.',
        'Mail Management' => '邮件相关设置',
        'Mailbox' => '邮箱',
        'Match' => '匹配',
        'Merge this ticket!' => '合并票单!',
        'Message for new Owner' => '给所有者的消息',
        'Message sent to' => '消息发送给',
        'Misc' => '综合',
        'Modified' => '修改于',
        'Move notification' => '移动通知',
        'Multiple selection of the output format.' => '输出格式的多种选择',
        'My Queue' => '我的队列',
        'MyTickets' => '我的 Tickets',
        'Name is required!' => '需要名称!',
        'New Agent' => '新技术支持人员',
        'New Customer' => '新客户',
        'New Group' => '新组',
        'New Group Ro' => '新的只读权限的组',
        'New Password' => '新密码',
        'New Priority' => '新优先级',
        'New SLA' => '新的服务级别协议(SLA)',
        'New Service' => '新的服务级别',
        'New State' => '新状态',
        'New Ticket Lock' => '新 Ticket 锁',
        'New TicketFreeFields' => '指定票单自定义字段',
        'New Title' => '新的标题',
        'New Type' => '新的类型',
        'New account created. Sent Login-Account to %s.' => '新的帐号已创建, 并寄送通知给 %s.',
        'New messages' => '新消息',
        'New password again' => '重复新密码',
        'Next Week' => '下周',
        'No * possible!' => '不可使用通配符 "*" !',
        'No Packages for requested Framework in this Online Repository, but Packages for other Frameworks!' =>
            '在线资源中没有软件包对应需要的框架，但有其他的框架所需软件包',
        'No Packages or no new Packages in selected Online Repository!' =>
            '在所选的在线资源中，没有现存或新的软件包',
        'No Permission' => '无权限',
        'No matches found' => '没有匹配的数据',
        'No means, send agent and customer notifications on changes.' => '当有改变时不发送通知给技术人员或客户.',
        'No time settings.' => '无时间约束.',
        'Note Text' => '注解',
        'Notification (Customer)' => '通知(客户)',
        'Notifications' => '系统通知',
        'OTRS DB Name' => '数据库名称',
        'OTRS DB Password' => 'OTRS 用户密码',
        'OTRS DB User' => 'OTRS 数据库用户名',
        'OTRS DB connect host' => 'OTRS 数据库主机',
        'OTRS sends an notification email to the customer if the ticket is moved.' =>
            '如果 Ticket 被移动，系统将会发送一个通知邮件给客户',
        'OTRS sends an notification email to the customer if the ticket owner has changed.' =>
            '如果 Ticket 所有者改变，系统将会发送通知邮件给客户.',
        'OTRS sends an notification email to the customer if the ticket state has changed.' =>
            '如果 Ticket 状态改变，系统将会发送通知邮件给客户',
        'Object already linked as %s.' => '对象已连接到 %s.',
        'Of couse this feature will take some system performance it self!' =>
            '当然, 该功能会占用一定的系统资源, 加重系统的负担!',
        'One or more errors occured!' => '发生了一个或多个错误!',
        'Online' => '在线人员',
        'Only for ArticleCreate Event.' => '仅适用于 ArticleCreate 事件',
        'Open Tickets' => '开放 Tickets',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>)' =>
            '当前客户用户信息 (例如: <OTRS_CUSTOMER_DATA_UserFirstname>)',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>).' =>
            '当前客户信息的可选项 (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>)',
        'Options of the current user who requested this action (e. g. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)' =>
            '选择当前用户谁需要这个动作 (例如: &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>)' =>
            '动作请求者信息 (例如: <OTRS_CURRENT_UserFirstname>)',
        'Options of the ticket data (e. g. &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)' =>
            '可选的 ticket 数据 (例如: &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)',
        'Options of the ticket data (e. g. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            '可选的 ticket 数据 (例如: <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).' =>
            '可选的 ticket 数据 (例如: <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Other Options' => '其他选项',
        'Out Of Office' => '不在办公室',
        'POP3 Account Management' => 'POP3 帐户管理',
        'Package' => '软件包',
        'Package not correctly deployed! You should reinstall the Package again!' =>
            '软件包展开不正常! 您需要重新安装这个软件包',
        'Package not correctly deployed! You should reinstall the package again!' =>
            '该软件没有正确展开! 你应该再试重新安装该软件包!',
        'Param 1' => '参数 1',
        'Param 2' => '参数 2',
        'Param 3' => '参数 3',
        'Param 4' => '参数 4',
        'Param 5' => '参数 5',
        'Param 6' => '参数 6',
        'Parent-Object' => '父对象',
        'Password is already in use! Please use an other password!' => '该密码被使用，请使用其他密码!',
        'Password is already used! Please use an other password!' => '该密码被使用，请使用其他密码!',
        'Passwords doesn\'t match! Please try it again!' => '密码不符，请重试!',
        'Pending Times' => '待定时间',
        'Pending messages' => '消息转入等待状态',
        'Pending type' => '待处理类型',
        'Permission settings. You can select one or more groups to make the configurated stat visible for different agents.' =>
            '权限设置。您可以选择一个或多个团体，不同的技术支持代表都可看见该配置的统计',
        'Permissions to change the ticket owner in this group/queue.' => '在该组/队列中修改 Tickets 所有者的权限.',
        'PhoneView' => '电话视图',
        'Please contact your admin' => '请联系系统管理员',
        'Please enter subject.' => '请输入主题',
        'Please fill out this form to recieve login credentials.' => '请填写下面的表格来获取登录名和密码',
        'Please provide a name.' => '请提供一个任务',
        'PostMaster Filter' => '邮件内容过滤',
        'PostMaster Mail Account' => '邮件帐号管理',
        'Print this ticket!' => '打印票单!',
        'Prio' => '优先级',
        'Problem' => '问题',
        'Queue <-> Auto Responses Management' => '队列 <-> 自动回复管理',
        'Queue ID' => '队列编号',
        'Queue Management' => '队列管理',
        'Queue is required.' => '需要指定一个队列.',
        'QueueView Refresh Time' => '队列视图刷新时间',
        'QuickSearch' => '快速搜索',
        'Realname' => '真实姓名',
        'Rebuild' => '重新构建',
        'Recipients' => '收件人',
        'Reminder' => '提醒',
        'Reminder messages' => '消息提醒',
        'Remove this Search Term.' => '删除此搜索关键词',
        'Required Field' => '必填字段',
        'Required!' => '必须的!',
        'Response Management' => '回复内容管理',
        'Responses <-> Attachments Management' => '回复 <-> 附件管理',
        'Responses <-> Queue Management' => '回复 <-> 队列管理',
        'Return to the compose screen' => '回到撰写页面',
        'Role' => '角色',
        'Roles <-> Agents' => '角色 <-> 服务人员',
        'Roles <-> Groups Management' => '角色 <-> 组管理',
        'Roles <-> Users' => '角色 <-> 用户',
        'Roles <-> Users Management' => '角色 <-> 用户管理',
        'Run Search' => '搜索',
        'Save Job as?' => '保存工作为?',
        'Save Search-Profile as Template?' => '将搜索条件保存为模板',
        'Schedule' => '安排',
        'Search Result' => '搜索结果',
        'Search for' => '搜索',
        'Search for customers (wildcards are allowed).' => '查找客户（可使用通配符）。',
        'Search-Profile as Template?' => '保持当前搜索条件为模板',
        'Secure Mode need to be enabled!' => '安全模式需要启动',
        'Select Box' => '选择方框',
        'Select Box Result' => '查询结果',
        'Select Group' => '选择组件',
        'Select Source (for add)' => '选择数据源(增加功能使用)',
        'Select group' => '选择组件',
        'Select the customeruser:service relations.' => '选择客户和服务关系.',
        'Select the element, which will be used at the X-axis' => '选择将用在x轴的元素',
        'Select the restrictions to characterise the stat' => '选择限制参数，使统计特征化',
        'Select the role:user relations.' => '选择 角色:用户 关联.',
        'Select the user:group permissions.' => '选择 用户:组 权限.',
        'Select your QueueView refresh time.' => '队列视图刷新时间.',
        'Select your default spelling dictionary.' => '选择你默认的拼写检查字典.',
        'Select your frontend Charset.' => '界面字符集.',
        'Select your frontend QueueView.' => '队列视图.',
        'Select your frontend language.' => '界面语言',
        'Select your out of office time.' => '选择你不在办公室的时间',
        'Select your screen after creating a new ticket.' => '选择您创建新 Ticket 后，所显示的视图.',
        'Selection needed' => '选择需要',
        'Send Administrative Message to Agents' => '发送管理上的信息给服务人员',
        'Send Notification' => '发送通知',
        'Send me a notification if a customer sends a follow up and I\'m the owner of this ticket.' =>
            '如果客户发送了 Ticket 回复，并且我是该 Ticket 的所有者.',
        'Send me a notification of an watched ticket like an owner of an ticket.' =>
            '对我所关注的ticket，像该ticket的拥有人一样，给我也发一份通知',
        'Send no notifications' => '不发送通知',
        'Sent new password to: %s' => '发送新的密码到: %s',
        'Sent password token to: %s' => '发送密码到: %s',
        'Sessions' => '会话',
        'Set customer user and customer id of a ticket' => '设置 Ticket 所属客户用户',
        'Set this ticket to pending!' => '转入等待状态',
        'Show' => '显示',
        'Shows the ticket history!' => '显示处理历史!',
        'Site' => '站点',
        'Solution' => '解决方案',
        'Sort by' => '排序',
        'Source' => '数据源',
        'Spell Check' => '拼写检查',
        'Split' => '分解',
        'State Type' => '状态类型',
        'Static-File' => '静态文件',
        'Stats-Area' => '统计区',
        'Sub-Queue of' => '子队列',
        'Sub-Service of' => '子服务隶属于',
        'Subscribe' => '订阅',
        'Symptom' => '症状',
        'System History' => '系统历史',
        'System State Management' => '系统状态管理',
        'Systemaddress' => '系统邮件地址',
        'Take care that you also updated the default states in you Kernel/Config.pm!' =>
            '您同时更新了 Kernel/Config.pm 中的缺省状态!',
        'The User Name you wish to have' => '希望使用的系统登录用户名',
        'The customer is required.' => '客户字段是必须的.',
        'The field is required.' => '该字段是必需的',
        'The identify of the system. Each ticket number and each http session id starts with this number.' =>
            '这是系统的标识符. 每一个 Ticket 和 http 会话都使用此数字.',
        'The message being composed has been closed.  Exiting.' => '进行消息撰写的窗口已经被关闭,退出.',
        'The ticket was locked' => '此票单被锁定',
        'These values are read-only.' => '该数据只读.',
        'These values are required.' => '该条目必须填写.',
        'This account exists.' => '这个帐户已存在',
        'This is useful if you want that no one can get the result of the stat or the stat isn\'t ready configurated.' =>
            '这是非常有用的，如果你不想让人得到统计的结果或统计结果并不完整',
        'This window must be called from compose window' => '该窗口必须由撰写窗口调用',
        'Ticket Change Times (before/after)' => 'Ticket 更改时间 (之前/之后)',
        'Ticket Change Times (between)' => 'Ticket 更改时间 (时间范围)',
        'Ticket Change Times (from moment)' => 'Ticket 更改时间 (月份)',
        'Ticket Close Times (before/after)' => 'Ticket 关闭时间',
        'Ticket Close Times (between)' => 'Ticket 关闭时间 (时间范围)',
        'Ticket Close Times (from moment)' => 'Ticket 关闭时间 (月份)',
        'Ticket Create Times (before/after)' => 'Ticket 创建时间 (之前/之后)',
        'Ticket Create Times (between)' => 'Ticket 创建时间 (时间范围)',
        'Ticket Create Times (from moment)' => 'Ticket 创建时间 (月份)',
        'Ticket Lock' => 'Ticket 锁状态',
        'Ticket Number Generator' => 'Ticket 编号生成器',
        'Ticket Search' => 'Ticket 搜索',
        'Ticket Status View' => 'Ticket 状态视图',
        'Ticket Type is required!' => 'Ticket 的类型是必须的!',
        'Ticket escalation!' => 'Ticket 限时处理!',
        'Ticket locked!' => 'Ticket 被锁定!',
        'Ticket owner options (e. g. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)' =>
            '可用的 Ticket 归属人信息 (例如: &lt;OTRS_OWNER_USERFIRSTNAME&gt;)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>)' => 'Ticket 所有者选项 (例如: <OTRS_OWNER_UserFirstname>)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>).' => 'Ticket拥有者的可选项 e. g. <OTRS_OWNER_UserFirstname>).',
        'Ticket responsible options (e. g. <OTRS_RESPONSIBLE_UserFirstname>).' =>
            'Ticket责任选项 (e. g. <OTRS_RESPONSIBLE_UserFirstname>).',
        'Ticket selected for bulk action!' => '被选中进行批量操作的 Tickets',
        'Ticket unlock!' => '解锁 Ticket!',
        'Ticket#' => 'Ticket 号码',
        'Ticket-Area' => 'Ticket区',
        'TicketFreeFields' => '票单自定义字段',
        'TicketFreeText' => 'Ticket 额外信息',
        'TicketZoom' => 'Ticket 展开',
        'Tickets available' => '可用的票单',
        'Tickets shown' => '显示 Ticket',
        'Tickets which need to be answered!' => '需要回答的 Ticket',
        'Time units is a required field.' => '时间单位为必须的字段.',
        'Time1' => '时间1',
        'Time2' => '时间2',
        'Time3' => '时间3',
        'Time4' => '时间4',
        'Time5' => '时间5',
        'Time6' => '时间6',
        'Timeover' => '结束',
        'Times' => '时间',
        'Title of the stat.' => '统计的标题',
        'To get the article attribute (e. g. (<OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).' =>
            '取得信件的属性 (例如: <OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).',
        'Top of Page' => '页面顶端',
        'Total hits' => '点击数',
        'U' => '升序',
        'Unable to parse Online Repository index document!' => '不能分列在线资源索引文档',
        'Uniq' => '单一',
        'Unlock Tickets' => '解锁 Tickets',
        'Unlock to give it back to the queue!' => '解锁并送回队列!',
        'Unsubscribe' => '退订',
        'Use utf-8 it your database supports it!' => '如果您的数据库支持，使用UTF-8字符编码!',
        'Useable options' => '可用宏变量',
        'Used default language.' => '指定默认语言.',
        'User Management' => '人员管理',
        'User will be needed to handle tickets.' => '需要用户来处理 Tickets.',
        'Users' => '用户',
        'Users <-> Groups' => '用户 <-> 组',
        'Users <-> Groups Management' => '用户 <-> 组管理',
        'Verify Password' => '确认新密码',
        'Warning! This tickets will be removed from the database! This tickets are lost!' =>
            '警告! 该 Ticket 将会从数据库删除，无法恢复!',
        'Watch notification' => '关注通知',
        'Web-Installer' => 'WEB 安装向导',
        'WebMail' => 'WebMail',
        'Wildcards are allowed.' => '允许使用通配符.',
        'With an invalid stat it isn\'t feasible to generate a stat.' => '用无效的统计不可生成统计',
        'With the input and select fields you can configurate the stat at your needs. Which elements of a stat you can edit depends on your stats administrator who configurated the stat.' =>
            '通过输入和选择字段，您可以按您的需求来配置统计。您可以修改编辑那些统计要素由您的统计资料管理员来设置。',
        'Yes means, send no agent and customer notifications on changes.' =>
            '当有改变时不发送通知给技术人员或客户.',
        'Yes, save it with name' => '是, 保存为名称',
        'You got new message!' => '您有新消息!',
        'You have to select two or more attributes from the select field!' =>
            '你必须从所选字段中选择两个或两个以上的属性',
        'You need a email address (e. g. customer@example.com) in To:!' =>
            '收件人信息必须是邮件地址(例如：customer@example.com)',
        'You need min. one selected Ticket!' => '您至少需要选择一个 Ticket!',
        'You need to account time!' => '您需要记录时间',
        'You need to activate %s first to use it!' => '%s 在使用之前请先激活!',
        'Your Password' => '你的密码',
        'Your email address is new' => '您的邮件地址是新的',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            '您的邮件 编号: "<OTRS_TICKET>" 回退到 "<OTRS_BOUNCE_TO>" . 请联系以下地址获取详细信息.',
        'Your own Ticket' => '您自己的 Ticket',
        'customer realname' => '客户真实姓名',
        'delete' => '删除',
        'down' => '下',
        'false' => '假',
        'for agent firstname' => '技术支持人员 名',
        'for agent lastname' => '技术支持人员 名',
        'for agent login' => '技术支持人员 登录名',
        'for agent user id' => '技术支持人员 用户名',
        'kill all sessions' => '中止所有会话',
        'kill session' => '终止会话',
        'maximal period form' => '最大周期表',
        'modified' => '修改于',
        'new ticket' => '新建 Ticket',
        'next step' => '下一步',
        'not rated' => '不予评级',
        'send' => '发送',
        'sort downward' => '逆序排序',
        'sort upward' => '正序排序',
        'to get the first 20 character of the subject' => '邮件标题前20个字符',
        'to get the first 5 lines of the email' => '邮件正文前5行',
        'to get the from line of the email' => '邮件来自',
        'to get the realname of the sender (if given)' => '邮件发送人的真实姓名 (如果存在)',
        'up' => '上',
        'utf8' => 'UTF-8',
        'x' => 'x',

    };
    # $$STOP$$
    return;
}

1;
