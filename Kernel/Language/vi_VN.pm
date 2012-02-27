# --
# Kernel/Language/vi_VN.pm - provides Vietnamese language translation
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: vi_VN.pm,v 1.65 2012/02/27 08:26:11 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
package Kernel::Language::vi_VN;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.65 $) [1];

sub Data {
    my $Self = shift;

    # $$START$$
    # Last translation file sync: 2012-02-02 17:08:50

    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D.%M.%Y %T';
    $Self->{DateFormatLong}      = '%T - %D.%M.%Y';
    $Self->{DateFormatShort}     = '%D.%M.%Y';
    $Self->{DateInputFormat}     = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';

    # csv separator
    $Self->{Separator} = ';';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Có',
        'No' => 'Không',
        'yes' => 'Có',
        'no' => 'Không',
        'Off' => 'Tắt',
        'off' => 'tắt',
        'On' => 'Mở',
        'on' => 'mở',
        'top' => 'trên đầu',
        'end' => 'cuối',
        'Done' => 'Đã xong',
        'Cancel' => 'Hủy',
        'Reset' => 'Làm lại',
        'last' => 'Sau',
        'before' => 'Trước',
        'Today' => '',
        'Tomorrow' => '',
        'Next week' => '',
        'day' => 'ngày',
        'days' => 'ngày',
        'day(s)' => 'ngày',
        'd' => '',
        'hour' => 'giờ',
        'hours' => 'giờ',
        'hour(s)' => 'giờ',
        'Hours' => '',
        'h' => '',
        'minute' => 'phút',
        'minutes' => 'phút',
        'minute(s)' => 'phút',
        'Minutes' => '',
        'm' => '',
        'month' => 'tháng',
        'months' => 'tháng',
        'month(s)' => 'tháng',
        'week' => 'tuần',
        'week(s)' => 'tuần',
        'year' => 'năm',
        'years' => 'năm',
        'year(s)' => 'năm',
        'second(s)' => 'giây',
        'seconds' => 'giây',
        'second' => 'giây',
        's' => '',
        'wrote' => 'viết',
        'Message' => 'Thông báo',
        'Error' => 'Lỗi',
        'Bug Report' => 'Báo cáo lỗi',
        'Attention' => 'Chú ý',
        'Warning' => 'Cảnh báo',
        'Module' => 'Mô đun',
        'Modulefile' => 'File mô đun',
        'Subfunction' => 'Chức năng con',
        'Line' => 'Dòng',
        'Setting' => '',
        'Settings' => '',
        'Example' => 'Ví dụ',
        'Examples' => 'Các ví dụ',
        'valid' => 'Hợp lệ',
        'Valid' => 'Hợp lệ',
        'invalid' => 'Không hợp lệ',
        'Invalid' => '',
        '* invalid' => '* không hợp lệ',
        'invalid-temporarily' => 'tạm thời không hợp lệ',
        ' 2 minutes' => '2 phút',
        ' 5 minutes' => '5 phút',
        ' 7 minutes' => '7 phút',
        '10 minutes' => '10 phút',
        '15 minutes' => '15 phút',
        'Mr.' => 'Ông',
        'Mrs.' => 'Bà',
        'Next' => 'Tiếp',
        'Back' => 'Trở lại',
        'Next...' => 'Tiếp...',
        '...Back' => '...Trở lại',
        '-none-' => 'không',
        'none' => 'không',
        'none!' => 'không!',
        'none - answered' => 'không được trả lời',
        'please do not edit!' => 'Xin đừng chỉnh sửa!',
        'Need Action' => '',
        'AddLink' => 'Thêm liên kết',
        'Link' => 'Liên kết',
        'Unlink' => '',
        'Linked' => 'Đã liên kết',
        'Link (Normal)' => 'Liên kết (Thường)',
        'Link (Parent)' => 'Liên kết (Cha)',
        'Link (Child)' => 'Liên kết (Con)',
        'Normal' => 'Thường',
        'Parent' => 'Cha',
        'Child' => 'Con',
        'Hit' => 'Nhấn chuột',
        'Hits' => 'Nhấn chuột',
        'Text' => 'Văn bản',
        'Standard' => '',
        'Lite' => 'Nhẹ',
        'User' => 'Người dùng',
        'Username' => 'Tên đăng nhập',
        'Language' => 'Ngôn ngữ',
        'Languages' => 'Các ngôn ngữ',
        'Password' => 'Mật khẩu',
        'Preferences' => 'Giao diện',
        'Salutation' => 'Lời chào',
        'Salutations' => 'Lời chào',
        'Signature' => 'Chữ ký',
        'Signatures' => 'Chữ ký',
        'Customer' => 'Khách hàng',
        'CustomerID' => 'Mã khách hàng',
        'CustomerIDs' => 'Mã khách hàng',
        'customer' => 'khách hàng',
        'agent' => 'nhân viên',
        'system' => 'hệ thống',
        'Customer Info' => 'Thông tin khách hàng',
        'Customer Information' => '',
        'Customer Company' => 'Công ty khách hàng',
        'Customer Companies' => '',
        'Company' => 'Công ty',
        'go!' => 'tiếp tục!',
        'go' => 'tiếp tục',
        'All' => 'tất cả',
        'all' => 'tất cả',
        'Sorry' => 'Xin lỗi',
        'update!' => 'cập nhật!',
        'update' => 'cập nhật',
        'Update' => 'Cập nhật',
        'Updated!' => '',
        'submit!' => 'xác nhận!',
        'submit' => 'xác nhận',
        'Submit' => 'Xác nhận',
        'change!' => 'thay đổi!',
        'Change' => 'Thay đổi',
        'change' => 'thay đổi',
        'click here' => 'Nhấn chuột vào đây',
        'Comment' => 'Nhận xét',
        'Invalid Option!' => 'Lựa chọn không hợp lệ!',
        'Invalid time!' => 'Thời gian không hợp lệ!',
        'Invalid date!' => 'Ngày tháng không hợp lệ!',
        'Name' => 'Tên',
        'Group' => 'Nhóm',
        'Description' => 'Mô tả',
        'description' => 'mô tả',
        'Theme' => 'Giao diện',
        'Created' => 'Đã khởi tạo',
        'Created by' => 'Khởi tạo bởi',
        'Changed' => 'Đã thay đổi',
        'Changed by' => 'Thay đổi bởi',
        'Search' => 'Tìm kiếm',
        'and' => 'và',
        'between' => 'giữa',
        'Fulltext Search' => 'Tìm kiếm toàn bộ văn bản',
        'Data' => 'Dữ liệu',
        'Options' => 'Các tùy chọn',
        'Title' => 'Tiêu đề',
        'Item' => 'Mục',
        'Delete' => 'Xóa',
        'Edit' => 'Sửa',
        'View' => 'Xem',
        'Number' => 'Số',
        'System' => 'Hệ thống',
        'Contact' => 'Liên hệ',
        'Contacts' => 'Liên hệ',
        'Export' => 'Xuất',
        'Up' => 'Trên',
        'Down' => 'Dưới',
        'Add' => 'Thêm',
        'Added!' => '',
        'Category' => 'Phân loại',
        'Viewer' => 'Trình xem',
        'Expand' => '',
        'Small' => '',
        'Medium' => '',
        'Large' => '',
        'Date picker' => '',
        'New message' => 'Tin nhắn mới',
        'New message!' => 'Tin nhắn mới!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Hãy trả lời thẻ này để trở lại phần xem các hàng đợi thông thường!',
        'You have %s new message(s)!' => 'Bạn có %s tin nhắn mới!',
        'You have %s reminder ticket(s)!' => 'Bạn có %s thẻ nhắc công việc!',
        'The recommended charset for your language is %s!' => 'Bộ ký tự gợi ý cho ngôn ngữ của bạn là %s!',
        'Change your password.' => '',
        'Please activate %s first!' => '',
        'No suggestions' => 'Không có gợi ý nào',
        'Word' => 'Từ',
        'Ignore' => 'Bỏ qua',
        'replace with' => 'thay thế bằng',
        'There is no account with that login name.' => 'Không có tài khoản nào với tên truy cập như thế.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            '',
        'There is no acount with that user name.' => '',
        'Please contact your administrator' => '',
        'Logout' => 'Đăng xuất',
        'Logout successful. Thank you for using OTRS!' => 'Đăng xuất thành công! Cảm ơn bạn đã sử dụng OTRS!',
        'Invalid SessionID!' => 'Mã phiên không hợp lệ!',
        'Feature not active!' => 'Tính năng không hoạt động!',
        'Agent updated!' => '',
        'Create Database' => 'Tạo cơ sở dữ liệu',
        'System Settings' => 'Thiết đặt hệ thống',
        'Mail Configuration' => '',
        'Finished' => 'Kết thúc',
        'Install OTRS' => '',
        'Intro' => '',
        'License' => 'Giấy phép',
        'Database' => 'Cơ sở dữ liệu',
        'Configure Mail' => '',
        'Database deleted.' => '',
        'Database setup succesful!' => '',
        'Login is needed!' => 'Cần đăng nhập!',
        'Password is needed!' => 'Cần mật khẩu!',
        'Take this Customer' => 'Chấp nhận khách hàng này',
        'Take this User' => 'Chấp nhận người dùng này',
        'possible' => 'có thể',
        'reject' => 'từ chối',
        'reverse' => 'đảo ngược',
        'Facility' => 'Tiện ích',
        'Time Zone' => '',
        'Pending till' => 'Treo tới khi',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            '',
        'Dispatching by email To: field.' => 'Gửi bằng email tới: trường.',
        'Dispatching by selected Queue.' => 'Gửi bởi hàng đợi đã chọn.',
        'No entry found!' => 'Không tìm thấy mục nào!',
        'Session has timed out. Please log in again.' => 'Phiên đã bị gián đoạn. Xin hãy đăng nhập lại.',
        'No Permission!' => 'Không có quyền!',
        'To: (%s) replaced with database email!' => 'Tới: (%s) được thay thế bởi email cơ sở dữ liệu!',
        'Cc: (%s) added database email!' => 'Cc: (%s) email cơ sở dữ liệu thêm!',
        '(Click here to add)' => '(Nhấn chuột vào đây để thêm)',
        'Preview' => 'Xem trước',
        'Package not correctly deployed! Please reinstall the package.' =>
            '',
        '%s is not writable!' => '',
        'Cannot create %s!' => '',
        'Check to activate this date' => '',
        'You have Out of Office enabled, would you like to disable it?' =>
            '',
        'Customer %s added' => '',
        'Role added!' => '',
        'Role updated!' => '',
        'Attachment added!' => '',
        'Attachment updated!' => '',
        'Response added!' => '',
        'Response updated!' => '',
        'Group updated!' => '',
        'Queue added!' => '',
        'Queue updated!' => '',
        'State added!' => '',
        'State updated!' => '',
        'Type added!' => '',
        'Type updated!' => '',
        'Customer updated!' => '',
        'Customer company added!' => '',
        'Customer company updated!' => '',
        'Mail account added!' => '',
        'Mail account updated!' => '',
        'System e-mail address added!' => '',
        'System e-mail address updated!' => '',
        'Contract' => 'Hợp đồng',
        'Online Customer: %s' => 'Khách hàng trực tuyến: %s',
        'Online Agent: %s' => 'Nhân viên đang online: %s',
        'Calendar' => 'Lịch',
        'File' => 'File',
        'Filename' => 'Tên file',
        'Type' => 'Loại',
        'Size' => 'Cỡ',
        'Upload' => 'Tải lên',
        'Directory' => 'Đường dẫn',
        'Signed' => 'Đã ký',
        'Sign' => 'Ký',
        'Crypted' => 'Đã gắn mã',
        'Crypt' => 'Gắn mã',
        'PGP' => '',
        'PGP Key' => '',
        'PGP Keys' => '',
        'S/MIME' => '',
        'S/MIME Certificate' => '',
        'S/MIME Certificates' => '',
        'Office' => 'Văn phòng',
        'Phone' => 'Điện thoại',
        'Fax' => 'Fax',
        'Mobile' => 'Di động',
        'Zip' => 'Mã vùng',
        'City' => 'Thành phố',
        'Street' => '',
        'Country' => 'Nước',
        'Location' => '',
        'installed' => 'đã cài đặt',
        'uninstalled' => 'đã gỡ cài đặt',
        'Security Note: You should activate %s because application is already running!' =>
            'Lưu ý bảo mật: Bạn nên kích hoạt %s bởi ứng dụng đã hoạt động!',
        'Unable to parse repository index document.' => '',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            '',
        'No packages, or no new packages, found in selected repository.' =>
            '',
        'Edit the system configuration settings.' => '',
        'printed at' => 'được in tại',
        'Loading...' => '',
        'Dear Mr. %s,' => '',
        'Dear Mrs. %s,' => '',
        'Dear %s,' => '',
        'Hello %s,' => '',
        'This email address already exists. Please log in or reset your password.' =>
            '',
        'New account created. Sent login information to %s. Please check your email.' =>
            '',
        'Please press Back and try again.' => 'Xin hãy nhấn Trở lại và thử lại lần nữa.',
        'Sent password reset instructions. Please check your email.' => '',
        'Sent new password to %s. Please check your email.' => '',
        'Upcoming Events' => '',
        'Event' => 'Sự kiện',
        'Events' => '',
        'Invalid Token!' => '',
        'more' => '',
        'For more info see:' => '',
        'Package verification failed!' => '',
        'Collapse' => '',
        'Shown' => '',
        'News' => '',
        'Product News' => '',
        'OTRS News' => '',
        '7 Day Stats' => '',
        'Bold' => '',
        'Italic' => '',
        'Underline' => '',
        'Font Color' => '',
        'Background Color' => '',
        'Remove Formatting' => '',
        'Show/Hide Hidden Elements' => '',
        'Align Left' => '',
        'Align Center' => '',
        'Align Right' => '',
        'Justify' => '',
        'Header' => 'Đầu trang',
        'Indent' => '',
        'Outdent' => '',
        'Create an Unordered List' => '',
        'Create an Ordered List' => '',
        'HTML Link' => '',
        'Insert Image' => '',
        'CTRL' => '',
        'SHIFT' => '',
        'Undo' => '',
        'Redo' => '',
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
        'Jan' => 'Tháng 1',
        'Feb' => 'Tháng 2',
        'Mar' => 'Tháng 3',
        'Apr' => 'Tháng 4',
        'May' => 'Tháng 5',
        'Jun' => 'Tháng 6',
        'Jul' => 'Tháng 7',
        'Aug' => 'Tháng 8',
        'Sep' => 'Tháng 9',
        'Oct' => 'Tháng 10',
        'Nov' => 'Tháng 11',
        'Dec' => 'Tháng 12',
        'January' => 'Tháng Một',
        'February' => 'Tháng Hai',
        'March' => 'Tháng Ba',
        'April' => 'Tháng Tư',
        'May_long' => 'Tháng Năm',
        'June' => 'Tháng Sáu',
        'July' => 'Tháng Bảy',
        'August' => 'Tháng Tám',
        'September' => 'Tháng Chín',
        'October' => 'Tháng Mười',
        'November' => 'Tháng Mười một',
        'December' => 'Tháng Mười hai',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'Giao diện đã được cập nhật thành công!',
        'User Profile' => '',
        'Email Settings' => '',
        'Other Settings' => '',
        'Change Password' => 'Đổi mật khẩu',
        'Current password' => '',
        'New password' => 'Mật khẩu mới',
        'Verify password' => '',
        'Spelling Dictionary' => 'Từ điển chính tả',
        'Default spelling dictionary' => '',
        'Max. shown Tickets a page in Overview.' => 'Số thẻ hiển thị tối đa trên một trang trong phần Tổng quan.',
        'The current password is not correct. Please try again!' => '',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            '',
        'Can\'t update password, it contains invalid characters!' => '',
        'Can\'t update password, it must be at least %s characters long!' =>
            '',
        'Can\'t update password, it must contain at least 2 lowercase  and 2 uppercase characters!' =>
            '',
        'Can\'t update password, it must contain at least 1 digit!' => '',
        'Can\'t update password, it must contain at least 2 characters!' =>
            '',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            '',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            '',
        'CSV Separator' => '',

        # Template: AAAStats
        'Stat' => 'Thống kê',
        'Sum' => '',
        'Please fill out the required fields!' => 'Hãy nhập vào các trường bắt buộc!',
        'Please select a file!' => 'Hãy chọn 1 file!',
        'Please select an object!' => 'Hãy chọn 1 đối tượng!',
        'Please select a graph size!' => 'Hãy chọn 1 cỡ biểu đồ!',
        'Please select one element for the X-axis!' => 'Hãy chọn 1 thành tố cho trục X!',
        'Please select only one element or turn off the button \'Fixed\' where the select field is marked!' =>
            'Hãy chọn duy nhất 1 thành tố hoặc tắt nút \'Đã sửa\'nơi trường đã chọn được đánh dấu!',
        'If you use a checkbox you have to select some attributes of the select field!' =>
            'Nếu bạn sử dụng một hộp chọn bạn phải chọn một số thuộc tính của trường đã chọn!',
        'Please insert a value in the selected input field or turn off the \'Fixed\' checkbox!' =>
            'Hãy chèn một giá trị trong trường nhập đã chọn hoặc tắt hộp chọn \'Đã sửa\'!',
        'The selected end time is before the start time!' => 'Thời gian kết thúc đã chọn trước thời gian bắt đầu!',
        'You have to select one or more attributes from the select field!' =>
            'Bạn phải chọn 1 hoặc nhiều thuộc tính từ trường đã chọn!',
        'The selected Date isn\'t valid!' => 'Ngày đã chọn không hợp lệ!',
        'Please select only one or two elements via the checkbox!' => 'Hãy chọn chỉ 1 hoặc 2 thành tố thông qua hộp chọn!',
        'If you use a time scale element you can only select one element!' =>
            'Nếu bạn sử dụng thành tố khung thời gian bạn có thể chỉ chọn 1 thành tố!',
        'You have an error in your time selection!' => 'Có 1 lỗi trong quá trình chọn thời gian của bạn!',
        'Your reporting time interval is too small, please use a larger time scale!' =>
            'Khoảng thời gian báo cáo quá nhỏ, hãy sử dụng khung thời gian lớn hơn!',
        'The selected start time is before the allowed start time!' => 'Thời gian bắt đầu đã chọn trước thời gian bắt đầu cho phép!',
        'The selected end time is after the allowed end time!' => 'Thời gian kết thúc đã chọn sau thời gian kết thúc cho phép!',
        'The selected time period is larger than the allowed time period!' =>
            'Khoảng thời gian đã chọn lớn hơn khoảng thời gian cho phép!',
        'Common Specification' => 'Đặc tả chung',
        'X-axis' => 'trục X',
        'Value Series' => 'Chuỗi giá trị',
        'Restrictions' => 'Các hạn chế',
        'graph-lines' => 'Biểu đồ đường kẻ',
        'graph-bars' => 'Biểu đồ thanh',
        'graph-hbars' => 'Biểu đồ thanh ngang',
        'graph-points' => 'Biểu đồ chấm',
        'graph-lines-points' => 'Biểu đồ đường kẻ chấm',
        'graph-area' => 'Biểu đồ vùng',
        'graph-pie' => 'Biểu đồ tròn',
        'extended' => 'mở rộng',
        'Agent/Owner' => 'Nhân viên/Phụ trách',
        'Created by Agent/Owner' => 'Được tạo bởi nhân viên/người phụ trách',
        'Created Priority' => 'Ưu tiên khởi tạo',
        'Created State' => 'Trạng thái khởi tạo',
        'Create Time' => 'Thời gian khởi tạo',
        'CustomerUserLogin' => 'Người dùng khách hàng đăng nhập',
        'Close Time' => 'Thờigian đóng',
        'TicketAccumulation' => '',
        'Attributes to be printed' => '',
        'Sort sequence' => '',
        'Order by' => '',
        'Limit' => 'Giới hạn',
        'Ticketlist' => '',
        'ascending' => '',
        'descending' => '',
        'First Lock' => '',
        'Evaluation by' => '',
        'Total Time' => '',
        'Ticket Average' => '',
        'Ticket Min Time' => '',
        'Ticket Max Time' => '',
        'Number of Tickets' => '',
        'Article Average' => '',
        'Article Min Time' => '',
        'Article Max Time' => '',
        'Number of Articles' => '',
        'Accounted time by Agent' => '',
        'Ticket/Article Accounted Time' => '',
        'TicketAccountedTime' => '',
        'Ticket Create Time' => '',
        'Ticket Close Time' => '',

        # Template: AAATicket
        'Status View' => '',
        'Bulk' => '',
        'Lock' => 'Khóa',
        'Unlock' => 'Mở khóa',
        'History' => 'Lịch sử',
        'Zoom' => 'Phóng đại',
        'Age' => 'Tuổi',
        'Bounce' => 'Bỏ',
        'Forward' => 'Chuyển tiếp',
        'From' => 'Từ',
        'To' => 'Tới',
        'Cc' => 'Cc',
        'Bcc' => 'Bcc',
        'Subject' => 'Tiêu đề',
        'Move' => 'Chuyển',
        'Queue' => 'Hàng đợi',
        'Queues' => 'Hàng đợi',
        'Priority' => 'Ưu tiên',
        'Priorities' => '',
        'Priority Update' => '',
        'Priority added!' => '',
        'Priority updated!' => '',
        'Signature added!' => '',
        'Signature updated!' => '',
        'SLA' => 'SLA',
        'Service Level Agreement' => '',
        'Service Level Agreements' => '',
        'Service' => 'Dịch vụ',
        'Services' => '',
        'State' => 'Trạng thái',
        'States' => '',
        'Status' => 'Trạng thái',
        'Statuses' => '',
        'Ticket Type' => '',
        'Ticket Types' => '',
        'Compose' => 'Tạo',
        'Pending' => 'Đang treo',
        'Owner' => 'Phụ trách',
        'Owner Update' => 'Cập nhật phụ trách',
        'Responsible' => 'Chịu trách nhiệm',
        'Responsible Update' => 'Cập nhật trách nhiệm',
        'Sender' => 'Người gửi',
        'Article' => 'Bài viết',
        'Ticket' => 'Thẻ',
        'Createtime' => 'Thời gian khởi tạo',
        'plain' => 'gốc',
        'Email' => 'E-Mail',
        'email' => 'E-Mail',
        'Close' => 'Đóng',
        'Action' => 'Hành động',
        'Attachment' => 'Đính kèm',
        'Attachments' => 'Đính kèm',
        'This message was written in a character set other than your own.' =>
            'Tin nhắn này đã được viết bằng bộ ký tự khác với của bạn.',
        'If it is not displayed correctly,' => 'Nếu nó không hiển thị chính xác,',
        'This is a' => 'Đây là một',
        'to open it in a new window.' => 'mở trong cửa sổ mới',
        'This is a HTML email. Click here to show it.' => 'Đây là một email HTML. Nhấn chuột vào đây để xem.',
        'Free Fields' => 'Các trường tự do',
        'Merge' => 'Trộn',
        'merged' => 'đã trộn',
        'closed successful' => 'đóng thành công',
        'closed unsuccessful' => 'đóng không thành công',
        'Locked Tickets Total' => '',
        'Locked Tickets Reminder Reached' => '',
        'Locked Tickets New' => '',
        'Responsible Tickets Total' => '',
        'Responsible Tickets New' => '',
        'Responsible Tickets Reminder Reached' => '',
        'Watched Tickets Total' => '',
        'Watched Tickets New' => '',
        'Watched Tickets Reminder Reached' => '',
        'All tickets' => 'Tất cả các thẻ',
        'Available tickets' => '',
        'Escalation' => '',
        'last-search' => '',
        'QueueView' => 'Xem hàng đợi',
        'Ticket Escalation View' => '',
        'Message from' => '',
        'End message' => '',
        'Forwarded message from' => '',
        'End forwarded message' => '',
        'new' => 'mới',
        'open' => 'mở',
        'Open' => '',
        'Open tickets' => '',
        'closed' => 'đóng',
        'Closed' => '',
        'Closed tickets' => '',
        'removed' => 'gỡ bỏ',
        'pending reminder' => 'đang treo nhắc nhở',
        'pending auto' => 'đang treo tự động',
        'pending auto close+' => 'đang treo tự động đóng+',
        'pending auto close-' => 'đang treo tự động đóng-',
        'email-external' => 'E-mail bên ngoài',
        'email-internal' => 'E-mail nội bộ',
        'note-external' => 'lưu ý bên ngoài',
        'note-internal' => 'lưu ý nội bộ',
        'note-report' => 'lưu ý báo cáo',
        'phone' => 'điện thoại',
        'sms' => 'tin nhắn sms',
        'webrequest' => 'yêu cầu web',
        'lock' => 'khóa',
        'unlock' => 'không khóa',
        'very low' => 'rất chậm',
        'low' => 'chậm',
        'normal' => 'bình thường',
        'high' => 'cao',
        'very high' => 'rất cao',
        '1 very low' => '1 rất chậm',
        '2 low' => '2 chậm',
        '3 normal' => '3 bình thường',
        '4 high' => '4 cao',
        '5 very high' => '5 rất cao',
        'auto follow up' => '',
        'auto reject' => '',
        'auto remove' => '',
        'auto reply' => '',
        'auto reply/new ticket' => '',
        'Ticket "%s" created!' => 'Thẻ "%s" đã được tạo!',
        'Ticket Number' => 'Số thẻ',
        'Ticket Object' => 'Đối tượng thẻ',
        'No such Ticket Number "%s"! Can\'t link it!' => 'Không có thẻ nào có số "%s" như vậy! Không thể liên kết tới đó!',
        'You don\'t have write access to this ticket.' => '',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            '',
        'Ticket selected.' => '',
        'Ticket is locked by another agent.' => '',
        'Ticket locked.' => '',
        'Don\'t show closed Tickets' => 'Không hiển thị các thẻ đã đóng',
        'Show closed Tickets' => 'Hiển thị các thẻ đã đóng',
        'New Article' => 'Bài viết mới',
        'Unread article(s) available' => '',
        'Remove from list of watched tickets' => '',
        'Add to list of watched tickets' => '',
        'Email-Ticket' => 'Thẻ e-mail',
        'Create new Email Ticket' => 'Tạo thẻ e-mail mới',
        'Phone-Ticket' => 'Thẻ Cuộc gọi',
        'Search Tickets' => 'Tìm kiếm thẻ',
        'Edit Customer Users' => 'Sửa người dùng khách hàng',
        'Edit Customer Company' => '',
        'Bulk Action' => 'Lệnh lô',
        'Bulk Actions on Tickets' => 'Lệnh lô trên các thẻ',
        'Send Email and create a new Ticket' => 'Gửi e-mail và tạo 1 thẻ mới',
        'Create new Email Ticket and send this out (Outbound)' => 'Tạo 1 thẻ e-mail mới và gửi ra ngoài',
        'Create new Phone Ticket (Inbound)' => 'Tạo thẻ cuộc gọi mới (vào trong)',
        'Overview of all open Tickets' => 'Tổng quan tất cả các thẻ mở',
        'Locked Tickets' => 'Các thẻ đã khóa',
        'My Locked Tickets' => '',
        'My Watched Tickets' => '',
        'My Responsible Tickets' => '',
        'Watched Tickets' => 'Các thẻ đã xem',
        'Watched' => 'Đã xem',
        'Watch' => '',
        'Unwatch' => '',
        'Lock it to work on it' => '',
        'Unlock to give it back to the queue' => '',
        'Show the ticket history' => '',
        'Print this ticket' => '',
        'Print this article' => '',
        'Split this article' => '',
        'Forward article via mail' => '',
        'Change the ticket priority' => '',
        'Change the ticket free fields!' => 'Thay đổi các trường tự do của thẻ',
        'Link this ticket to other objects' => '',
        'Change the owner for this ticket' => '',
        'Change the  customer for this ticket' => '',
        'Add a note to this ticket' => '',
        'Merge into a different ticket' => '',
        'Set this ticket to pending' => '',
        'Close this ticket' => '',
        'Look into a ticket!' => 'Xem xét một thẻ!',
        'Delete this ticket' => '',
        'Mark as Spam!' => 'Đánh dấu là thư rác!',
        'My Queues' => 'Hàng đợi của tôi',
        'Shown Tickets' => 'Các thẻ được hiển thị',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'E-mail của bạn với số thẻ "<OTRS_TICKET>" được trộn thành "<OTRS_MERGE_TO_TICKET>"!',
        'Ticket %s: first response time is over (%s)!' => 'Thẻ %s: lần phản hồi đầu tiên quá (%s)!',
        'Ticket %s: first response time will be over in %s!' => 'Thẻ %s: lần phản hồi đầu tiên sẽ quá %s!',
        'Ticket %s: update time is over (%s)!' => 'Thẻ %s: lần cập nhật quá (%s)!',
        'Ticket %s: update time will be over in %s!' => 'Thẻ %s: lần cập nhật sẽ quá %s!',
        'Ticket %s: solution time is over (%s)!' => 'Ticket %s: L?sungszeit ist abgelaufen (%s)!',
        'Ticket %s: solution time will be over in %s!' => 'Thẻ %s: lần giải pháp sẽ quá %s!',
        'There are more escalated tickets!' => 'Có nhiều thẻ hơn!',
        'Plain Format' => '',
        'Reply All' => '',
        'Direction' => '',
        'Agent (All with write permissions)' => '',
        'Agent (Owner)' => '',
        'Agent (Responsible)' => '',
        'New ticket notification' => 'Thông báo thẻ mới',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Gửi thông báo cho tôi nếu có thẻ mới trong "Hàng đợi của tôi".',
        'Send new ticket notifications' => '',
        'Ticket follow up notification' => '',
        'Ticket lock timeout notification' => 'Thông báo thời gian chờ khóa thẻ',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Gửi thông báo cho tôi nếu một thẻ chưa được khóa bởi hệ thống.',
        'Send ticket lock timeout notifications' => '',
        'Ticket move notification' => '',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Gửi thông báo cho tôi nếu một thẻ được chuyển vào trong "Hàng đợi của tôi".',
        'Send ticket move notifications' => '',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            '',
        'Custom Queue' => '',
        'QueueView refresh time' => 'Thời gian làm mới Hàng đợi',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            '',
        'Refresh QueueView after' => '',
        'Screen after new ticket' => 'Màn hình sau khi tạo thẻ mới',
        'Show this screen after I created a new ticket' => '',
        'Closed Tickets' => 'Các thẻ đã đóng',
        'Show closed tickets.' => 'Hiển thị các thẻ đã đóng.',
        'Max. shown Tickets a page in QueueView.' => 'Các thẻ hiển thị tối đa trên mỗi trang trong Hàng đợi.',
        'Ticket Overview "Small" Limit' => '',
        'Ticket limit per page for Ticket Overview "Small"' => '',
        'Ticket Overview "Medium" Limit' => '',
        'Ticket limit per page for Ticket Overview "Medium"' => '',
        'Ticket Overview "Preview" Limit' => '',
        'Ticket limit per page for Ticket Overview "Preview"' => '',
        'Ticket watch notification' => '',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            '',
        'Send ticket watch notifications' => '',
        'Out Of Office Time' => '',
        'New Ticket' => 'Thẻ mới',
        'Create new Ticket' => 'Tạo thẻ mới',
        'Customer called' => 'Khách hàng được gọi',
        'phone call' => 'cuộc gọi',
        'Phone Call Outbound' => '',
        'Phone Call Inbound' => '',
        'Reminder Reached' => '',
        'Reminder Tickets' => '',
        'Escalated Tickets' => '',
        'New Tickets' => '',
        'Open Tickets / Need to be answered' => '',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            '',
        'All new tickets, these tickets have not been worked on yet' => '',
        'All escalated tickets' => '',
        'All tickets with a reminder set where the reminder date has been reached' =>
            '',
        'Archived tickets' => '',
        'Unarchived tickets' => '',
        'History::Move' => 'Lịch sử::Chuyển.',
        'History::TypeUpdate' => 'Lịch sử::Cập nhật loại.',
        'History::ServiceUpdate' => 'Lịch sử::Cập nhật dịch vụ.',
        'History::SLAUpdate' => 'Lịch sử::Cập nhật SLA "%s" (ID=%s).',
        'History::NewTicket' => 'Lịch sử::Thẻ mới [%s] (Q=%s;P=%s;S=%s).',
        'History::FollowUp' => 'Lịch sử::Theo dõi',
        'History::SendAutoReject' => 'Lịch sử::Gửi từ chối tự động.',
        'History::SendAutoReply' => 'Lịch sử::Gửi phản hồi tự động.',
        'History::SendAutoFollowUp' => 'Lịch sử::Gửi theo dõi tự động.',
        'History::Forward' => 'Lịch sử::Chuyển tiếp.',
        'History::Bounce' => 'Lịch sử::Từ bỏ',
        'History::SendAnswer' => 'Lịch sử::Gửi trả lời',
        'History::SendAgentNotification' => 'Lịch sử::Gửi thông báo cho nhân viên phụ trách',
        'History::SendCustomerNotification' => 'Lịch sử::Gửi thông báo khách hàng',
        'History::EmailAgent' => 'Lịch sử::Email nhân viên',
        'History::EmailCustomer' => 'Lịch sử::Email khách hàng',
        'History::PhoneCallAgent' => 'Lịch sử::Cuộc gọi nhân viên',
        'History::PhoneCallCustomer' => 'Lịch sử::Cuộc gọi khách hàng',
        'History::AddNote' => 'Lịch sử::Thêm lưu ý',
        'History::Lock' => 'Lịch sử::Khóa',
        'History::Unlock' => 'Lịch sử::Mở khóa',
        'History::TimeAccounting' => 'Lịch sử::Giải thích thời gian',
        'History::Remove' => 'Lịch sử::Gỡ bỏ',
        'History::CustomerUpdate' => 'Lịch sử::Cập nhật khách hàng',
        'History::PriorityUpdate' => 'Lịch sử::Cập nhật ưu tiên',
        'History::OwnerUpdate' => 'Lịch sử::Cập nhật phụ trách',
        'History::LoopProtection' => 'Lịch sử::Bảo vệ vòng lặp',
        'History::Misc' => 'Lịch sử::Khác',
        'History::SetPendingTime' => 'Lịch sử::Đặt thời gian treo',
        'History::StateUpdate' => 'Lịch sử::Cập nhật trạng thái',
        'History::TicketDynamicFieldUpdate' => 'Lịch sử::Cập nhật thẻ',
        'History::WebRequestCustomer' => 'Lịch sử::Khách hàng yêu cầu web',
        'History::TicketLinkAdd' => 'Lịch sử::Thêm liên kết thẻ',
        'History::TicketLinkDelete' => 'Lịch sử::Xóa liên kết thẻ',
        'History::Subscribe' => 'Added subscription for user "%s".',
        'History::Unsubscribe' => 'Removed subscription for user "%s".',
        'History::SystemRequest' => '',
        'History::ResponsibleUpdate' => '',
        'History::ArchiveFlagUpdate' => '',

        # Template: AAAWeekDay
        'Sun' => 'Chủ nhật',
        'Mon' => 'Thứ hai',
        'Tue' => 'Thứ ba',
        'Wed' => 'Thứ tư',
        'Thu' => 'Thứ năm',
        'Fri' => 'Thứ sáu',
        'Sat' => 'Thứ bảy',

        # Template: AdminAttachment
        'Attachment Management' => 'Quản trị đính kèm',
        'Actions' => '',
        'Go to overview' => '',
        'Add attachment' => '',
        'List' => 'Danh sách',
        'Validity' => '',
        'No data found.' => '',
        'Download file' => '',
        'Delete this attachment' => '',
        'Add Attachment' => '',
        'Edit Attachment' => '',
        'This field is required.' => '',
        'or' => 'hoặc',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Quản trị phản hồi tự động',
        'Add auto response' => '',
        'Add Auto Response' => '',
        'Edit Auto Response' => '',
        'Response' => 'Phản hồi',
        'Auto response from' => '',
        'Reference' => 'Tham chiếu',
        'You can use the following tags' => '',
        'To get the first 20 character of the subject.' => 'Lấy 20 ký tự đầu tiên của tiêu đề',
        'To get the first 5 lines of the email.' => 'Lấy 5 dòng đầu tiên của email',
        'To get the realname of the sender (if given).' => 'Lấy tên thực của người gửi (nếu đã cho)',
        'To get the article attribute' => '',
        ' e. g.' => '',
        'Options of the current customer user data' => '',
        'Ticket owner options' => '',
        'Ticket responsible options' => '',
        'Options of the current user who requested this action' => '',
        'Options of the ticket data' => '',
        'Config options' => '',
        'Example response' => '',

        # Template: AdminCustomerCompany
        'Customer Company Management' => 'Quản trị công ty khách hàng',
        'Wildcards like \'*\' are allowed.' => '',
        'Add customer company' => '',
        'Please enter a search term to look for customer companies.' => '',
        'Add Customer Company' => 'Thêm công ty khách hàng',

        # Template: AdminCustomerUser
        'Customer Management' => '',
        'Add customer' => '',
        'Select' => 'Chọn',
        'Hint' => '',
        'Customer will be needed to have a customer history and to login via customer panel.' =>
            '',
        'Please enter a search term to look for customers.' => '',
        'Last Login' => '',
        'Add Customer' => '',
        'Edit Customer' => '',
        'This field is required and needs to be a valid email address.' =>
            '',
        'This email address is not allowed due to the system configuration.' =>
            '',
        'This email address failed MX check.' => '',
        'DNS problem, please check your configuration and the error log.' =>
            '',
        'The syntax of this email address is incorrect.' => '',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => '',
        'Notice' => '',
        'This feature is disabled!' => 'Tính năng này đã bị vô hiệu hóa!',
        'Just use this feature if you want to define group permissions for customers.' =>
            '',
        'Enable it here!' => 'Kích hoạt tại đây!',
        'Search for customers.' => '',
        'Edit Customer Default Groups' => '',
        'These groups are automatically assigned to all customers.' => '',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            '',
        'Filter for Groups' => '',
        'Select the customer:group permissions.' => '',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            '',
        'Search Result:' => '',
        'Customers' => '',
        'Groups' => 'Nhóm',
        'No matches found.' => '',
        'Change Group Relations for Customer' => '',
        'Change Customer Relations for Group' => '',
        'Toggle %s Permission for all' => '',
        'Toggle %s permission for %s' => '',
        'Customer Default Groups:' => '',
        'No changes can be made to these groups.' => '',
        'ro' => 'Chỉ đọc',
        'Read only access to the ticket in this group/queue.' => 'Quyền chỉ đọc truy cập vào thẻ trong nhóm/hàng đợi này.',
        'rw' => 'đọc và ghi',
        'Full read and write access to the tickets in this group/queue.' =>
            'Quyền đọc và ghi truy cập vào thẻ trong nhóm/hàng đợi này.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => '',
        'Edit default services' => '',
        'Filter for Services' => '',
        'Allocate Services to Customer' => '',
        'Allocate Customers to Service' => '',
        'Toggle active state for all' => '',
        'Active' => 'Hoạt động',
        'Toggle active state for %s' => '',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => '',
        'Add new field for object' => '',
        'To add a new field, select the field type form one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            '',
        'Dynamic Fields List' => '',
        'Dynamic fields per page' => '',
        'Label' => '',
        'Order' => 'Trật tự',
        'Object' => 'Đối tượng',

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
        'Default value' => '',
        'This is the default value for this field.' => '',
        'Save' => 'Lưu',

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
        'Key' => 'Khóa',
        'Value' => 'Giá trị',
        'Remove value' => '',
        'Add value' => '',
        'Add Value' => '',
        'Add empty value' => '',
        'Activate this option to create an empty selectable value.' => '',
        'Translatable values' => '',
        'If you activate this option the values will be translated to the user defined language.' =>
            '',
        'Note' => 'Lưu ý',
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
        'Admin Notification' => 'Thông báo quản trị',
        'With this module, administrators can send messages to agents, group or role members.' =>
            '',
        'Create Administrative Message' => '',
        'Your message was sent to' => '',
        'Send message to users' => '',
        'Send message to group members' => '',
        'Group members need to have permission' => '',
        'Send message to role members' => '',
        'Also send to customers in groups' => '',
        'Body' => 'Nội dung',
        'Send' => 'Gửi',

        # Template: AdminGenericAgent
        'Generic Agent' => '',
        'Add job' => '',
        'Last run' => 'Lần vận hành trước',
        'Run Now!' => 'Vận hành ngay!',
        'Delete this task' => '',
        'Run this task' => '',
        'Job Settings' => '',
        'Job name' => '',
        'Currently this generic agent job will not run automatically.' =>
            '',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            '',
        'Schedule minutes' => '',
        'Schedule hours' => '',
        'Schedule days' => '',
        'Toggle this widget' => '',
        'Ticket Filter' => '',
        '(e. g. 10*5155 or 105658*)' => 'ví dụ: 10*5144 hoặc 105658*',
        '(e. g. 234321)' => 'ví dụ: 234321',
        'Customer login' => '',
        '(e. g. U5150)' => 'ví dụ: U5150',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => '',
        'Agent' => 'Nhân viên',
        'Ticket lock' => '',
        'Create times' => '',
        'No create time settings.' => 'Không có thiết đặt lần khởi tạo',
        'Ticket created' => 'Thẻ đã tạo',
        'Ticket created between' => 'Thẻ đã tạo giữa',
        'Change times' => '',
        'No change time settings.' => '',
        'Ticket changed' => '',
        'Ticket changed between' => '',
        'Close times' => '',
        'No close time settings.' => '',
        'Ticket closed' => '',
        'Ticket closed between' => '',
        'Pending times' => '',
        'No pending time settings.' => 'Không có thiết đặt lần treo',
        'Ticket pending time reached' => 'Lần treo thẻ đã đạt tới',
        'Ticket pending time reached between' => 'Lần treo thẻ đã đạt tới giữa',
        'Escalation times' => '',
        'No escalation time settings.' => '',
        'Ticket escalation time reached' => '',
        'Ticket escalation time reached between' => '',
        'Escalation - first response time' => '',
        'Ticket first response time reached' => '',
        'Ticket first response time reached between' => '',
        'Escalation - update time' => '',
        'Ticket update time reached' => '',
        'Ticket update time reached between' => '',
        'Escalation - solution time' => '',
        'Ticket solution time reached' => '',
        'Ticket solution time reached between' => '',
        'Archive search option' => '',
        'Ticket Action' => '',
        'Set new service' => '',
        'Set new Service Level Agreement' => '',
        'Set new priority' => '',
        'Set new queue' => '',
        'Set new state' => '',
        'Set new agent' => '',
        'new owner' => '',
        'new responsible' => '',
        'Set new ticket lock' => '',
        'New customer' => '',
        'New customer ID' => '',
        'New title' => '',
        'New type' => '',
        'New Dynamic Field Values' => '',
        'Archive selected tickets' => '',
        'Add Note' => 'Thêm lưu ý',
        'Time units' => 'Các đơn vị thời gian',
        ' (work units)' => ' (các đơn vị làm việc)',
        'Ticket Commands' => '',
        'Send agent/customer notifications on changes' => '',
        'CMD' => 'CMD',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Lệnh này sẽ được chạy. ARG[0] sẽ là số thẻ. ARG[1] là mã thẻ.',
        'Delete tickets' => 'Xóa thẻ',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            '',
        'Execute Custom Module' => '',
        'Param %s key' => '',
        'Param %s value' => '',
        'Save Changes' => '',
        'Results' => 'Kết quả',
        '%s Tickets affected! What do you want to do?' => '',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            '',
        'Edit job' => '',
        'Run job' => '',
        'Affected Tickets' => '',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => '',
        'Web Services' => '',
        'Debugger' => '',
        'Go back to web service' => '',
        'Clear' => '',
        'Do you really want to clear the debug log of this web service?' =>
            '',
        'Request List' => '',
        'Time' => 'Thời giab',
        'Remote IP' => '',
        'Loading' => '',
        'Select a single request to see its details.' => '',
        'Filter by type' => '',
        'Filter from' => '',
        'Filter to' => '',
        'Filter by remote IP' => '',
        'Refresh' => 'Làm mới',
        'Request Details' => '',
        'An error occurred during communication.' => '',
        'Show or hide the content' => '',
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
        'Import' => 'Nhập',
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
        'Version' => 'Phiên bản',
        'Create time' => '',
        'Select a single configuration version to see its details.' => '',
        'Export web service configuration' => '',
        'Restore web service configuration' => '',
        'Do you really want to restore this version of the web service configuration?' =>
            '',
        'Your current web service configuration will be overwritten.' => '',
        'Show or hide the content.' => '',
        'Restore' => '',

        # Template: AdminGroup
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            '',
        'Group Management' => 'Quản trị nhóm',
        'Add group' => '',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Nhóm quản trị lấy trong khu vực quản trị và nhóm thống kê lấy trong khu vực thống kê.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            '',
        'It\'s useful for ASP solutions. ' => '',
        'Add Group' => 'Thêm nhóm',
        'Edit Group' => '',

        # Template: AdminLog
        'System Log' => 'Bản ghi hệ thống',
        'Here you will find log information about your system.' => '',
        'Hide this message' => '',
        'Recent Log Entries' => '',

        # Template: AdminMailAccount
        'Mail Account Management' => '',
        'Add mail account' => '',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Tất cả các email đến với 1 tài khoản sẽ được gửi vào trong hàng đợi đã chọn!',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Nếu tài khoản của bạn là đáng tin cậy, đầu trang X-OTRS đã có tại thời gian đến (cho mức độ ưu tiên, ...) sẽ được sử dụng! Bộ lọc PostMaster cũng sẽ được dùng.',
        'Host' => 'Máy chủ host',
        'Delete account' => '',
        'Fetch mail' => '',
        'Add Mail Account' => '',
        'Example: mail.example.com' => '',
        'IMAP Folder' => '',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            '',
        'Trusted' => 'Tin cậy',
        'Dispatching' => 'Đang gửi',
        'Edit Mail Account' => '',

        # Template: AdminNavigationBar
        'Admin' => 'Quản trị',
        'Agent Management' => '',
        'Queue Settings' => '',
        'Ticket Settings' => '',
        'System Administration' => '',

        # Template: AdminNotification
        'Notification Management' => 'Quản trị thông báo',
        'Select a different language' => '',
        'Filter for Notification' => '',
        'Notifications are sent to an agent or a customer.' => 'Các thông báo đã được gửi tới 1 nhân viên hoặc khách hàng.',
        'Notification' => 'Thông báo',
        'Edit Notification' => '',
        'e. g.' => '',
        'Options of the current customer data' => '',

        # Template: AdminNotificationEvent
        'Add notification' => '',
        'Delete this notification' => '',
        'Add Notification' => '',
        'Recipient groups' => '',
        'Recipient agents' => '',
        'Recipient roles' => '',
        'Recipient email addresses' => '',
        'Article type' => 'Loại bài viết',
        'Only for ArticleCreate event' => '',
        'Subject match' => '',
        'Body match' => '',
        'Include attachments to notification' => '',
        'Notification article type' => '',
        'Only for notifications to specified email addresses' => '',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            '',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            '',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            '',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            '',

        # Template: AdminPGP
        'PGP Management' => 'Quản trị PGP',
        'Use this feature if you want to work with PGP keys.' => '',
        'Add PGP key' => '',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'Theo cách này bạn có thể sửa trực tiếp cấu hình khóa trong Cấu hình hệ thống.',
        'Introduction to PGP' => '',
        'Result' => 'Kết quả',
        'Identifier' => 'Từ định danh',
        'Bit' => 'Bit',
        'Fingerprint' => 'Dấu tay',
        'Expires' => 'Hết hạn',
        'Delete this key' => '',
        'Add PGP Key' => '',
        'PGP key' => '',

        # Template: AdminPackageManager
        'Package Manager' => 'Quản trị gói',
        'Uninstall package' => '',
        'Do you really want to uninstall this package?' => 'Bạn có thực sự muốn gỡ cài đặt gói này?',
        'Reinstall package' => '',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            '',
        'Continue' => 'Tiếp tục',
        'Install' => 'Cài đặt',
        'Install Package' => '',
        'Update repository information' => '',
        'Did not find a required feature? OTRS Group provides their subscription customers with exclusive Add-Ons:' =>
            '',
        'Online Repository' => 'Kho trực tuyến',
        'Vendor' => 'Người bán',
        'Module documentation' => '',
        'Upgrade' => 'Nâng cấp',
        'Local Repository' => 'Kho cục bộ',
        'Uninstall' => 'Gỡ cài đặt',
        'Reinstall' => 'Cài lại',
        'Download package' => '',
        'Rebuild package' => '',
        'Metadata' => '',
        'Change Log' => '',
        'Date' => 'Dữ liệu',
        'List of Files' => '',
        'Permission' => 'Quyền',
        'Download' => 'Tải xuống',
        'Download file from package!' => 'Tải file từ gói xuống!',
        'Required' => 'Được yêu cầu',
        'PrimaryKey' => 'Khóa chính',
        'AutoIncrement' => 'Gia tăng tự động',
        'SQL' => 'SQL',
        'File differences for file %s' => '',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Bản ghi thực thi',
        'This feature is enabled!' => 'Tính năng này đã được kích hoạt!',
        'Just use this feature if you want to log each request.' => 'Chỉ sử dụng tính năng này nếu bạn muốn ghi mỗi yêu cầu.',
        'Activating this feature might affect your system performance!' =>
            '',
        'Disable it here!' => 'Vô hiệu hóa tại đây!',
        'Logfile too large!' => 'File bản ghi quá lớn!',
        'The logfile is too large, you need to reset it' => '',
        'Overview' => 'Tổng quan',
        'Range' => 'Dải',
        'Interface' => 'Giao diện',
        'Requests' => 'Yêu cầu',
        'Min Response' => 'Phản hồi tối thiểu',
        'Max Response' => 'Phản hồi tối đa',
        'Average Response' => 'Phản hồi trung bình',
        'Period' => '',
        'Min' => '',
        'Max' => '',
        'Average' => '',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'Quản trị bộ lọc PostMaster',
        'Add filter' => '',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            '',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Nếu bạn muốn kết hợp các địa chỉ email, hãy dùng EMAILADDRESS:info@example.com trong trường Từ, Đến hoặc Cc.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            '',
        'Delete this filter' => '',
        'Add PostMaster Filter' => '',
        'Edit PostMaster Filter' => '',
        'Filter name' => '',
        'The name is required.' => '',
        'Stop after match' => '',
        'Filter Condition' => '',
        'The field needs to be a valid regular expression or a literal word.' =>
            '',
        'Set Email Headers' => '',
        'The field needs to be a literal word.' => '',

        # Template: AdminPriority
        'Priority Management' => '',
        'Add priority' => '',
        'Add Priority' => '',
        'Edit Priority' => '',

        # Template: AdminQueue
        'Manage Queues' => '',
        'Add queue' => '',
        'Add Queue' => '',
        'Edit Queue' => '',
        'Sub-queue of' => '',
        'Unlock timeout' => 'Thời gian chờ mở khóa',
        '0 = no unlock' => '0 = không mở khóa',
        'Only business hours are counted.' => '',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            '',
        'Notify by' => '',
        '0 = no escalation' => '0 = không tiếp tục',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            '',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            '',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            '',
        'Follow up Option' => 'Theo dõi tùy chọn',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            '',
        'Ticket lock after a follow up' => 'Khóa thẻ sau khi theo dõi',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            '',
        'System address' => '',
        'Will be the sender address of this queue for email answers.' => 'Sẽ là địa chỉ người gửi của hàng đợi này cho các email trả lời.',
        'Default sign key' => '',
        'The salutation for email answers.' => 'Lời chào cho các email trả lời.',
        'The signature for email answers.' => 'Chữ ký cho các email trả lời.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => '',
        'Filter for Queues' => '',
        'Filter for Auto Responses' => '',
        'Auto Responses' => 'Các trả lời tự động',
        'Change Auto Response Relations for Queue' => '',
        'settings' => '',

        # Template: AdminQueueResponses
        'Manage Response-Queue Relations' => '',
        'Filter' => 'Lọc',
        'Filter for Responses' => '',
        'Responses' => 'Các trả lời',
        'Change Queue Relations for Response' => '',
        'Change Response Relations for Queue' => '',

        # Template: AdminResponse
        'Manage Responses' => '',
        'Add response' => '',
        'A response is default text to write faster answer (with default text) to customers.' =>
            'Một phản hồi là một văn bản mặc định được viết câu trả lời nhanh gửi cho khách hàng.',
        'Don\'t forget to add a new response a queue!' => 'Đừng quên thêm phản hồi mới vào hàng đợi!',
        'Delete this entry' => '',
        'Add Response' => '',
        'Edit Response' => '',
        'The current ticket state is' => 'Trạng thái thẻ hiện tại là',
        'Your email address is' => '',

        # Template: AdminResponseAttachment
        'Manage Responses <-> Attachments Relations' => '',
        'Filter for Attachments' => '',
        'Change Response Relations for Attachment' => '',
        'Change Attachment Relations for Response' => '',
        'Toggle active for all' => '',
        'Link %s to selected %s' => '',

        # Template: AdminRole
        'Role Management' => 'Quản trị vai trò',
        'Add role' => '',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Tạo 1 vai trò và đặt các nhóm vào đó. Rồi thêm vai trò cho người dùng.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            '',
        'Add Role' => 'Thêm vai trò',
        'Edit Role' => '',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => '',
        'Filter for Roles' => '',
        'Roles' => 'Vai trò',
        'Select the role:group permissions.' => '',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            '',
        'Change Role Relations for Group' => '',
        'Change Group Relations for Role' => '',
        'Toggle %s permission for all' => '',
        'move_into' => 'chuyển tới',
        'Permissions to move tickets into this group/queue.' => 'Các quyền để chuyển thẻ vào trong nhóm/hàng đợi này.',
        'create' => 'tạo',
        'Permissions to create tickets in this group/queue.' => 'Các quyền để tạo thẻ trong nhóm/hàng đợi này.',
        'priority' => 'Ưu tiên',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Các quyền để thay đổi ưu tiên thẻ trong nhóm/hàng đợi này.',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => '',
        'Filter for Agents' => '',
        'Agents' => '',
        'Manage Role-Agent Relations' => '',
        'Change Role Relations for Agent' => '',
        'Change Agent Relations for Role' => '',

        # Template: AdminSLA
        'SLA Management' => 'Quản trị SLA',
        'Add SLA' => 'Thêm SLA',
        'Edit SLA' => '',
        'Please write only numbers!' => '',

        # Template: AdminSMIME
        'S/MIME Management' => 'Quản trị S/MIME',
        'Add certificate' => '',
        'Add private key' => '',
        'Filter for certificates' => '',
        'Filter for SMIME certs' => '',
        'Here you can add relations to your private certificate, these will be embedded to the SMIME signature every time you use this certificate to sign an email.' =>
            '',
        'See also' => 'Xem',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'Theo cách này bạn có thể sửa chứng chỉ và khóa cá nhân trực tiếp trong hệ thống file.',
        'Hash' => 'Băm',
        'Create' => 'Tạo',
        'Handle related certificates' => '',
        'Delete this certificate' => '',
        'Add Certificate' => 'Thêm chứng chỉ',
        'Add Private Key' => 'Thêm khóa cá nhân',
        'Secret' => 'Bí mật',
        'Related Certificates for' => '',
        'Delete this relation' => '',
        'Available Certificates' => '',
        'Relate this certificate' => '',

        # Template: AdminSalutation
        'Salutation Management' => 'Quản trị lời chào',
        'Add salutation' => '',
        'Add Salutation' => 'Thêm lời chào',
        'Edit Salutation' => '',
        'Example salutation' => '',

        # Template: AdminScheduler
        'This option will force Scheduler to start even if the process is still registered in the database' =>
            '',
        'Start scheduler' => '',
        'Scheduler could not be started. Check if scheduler is not running and try it again with Force Start option' =>
            '',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => '',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            '',
        'Secure mode must be disabled in order to reinstall using the web-installer.' =>
            '',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            '',

        # Template: AdminSelectBox
        'SQL Box' => '',
        'Here you can enter SQL to send it directly to the application database.' =>
            '',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            '',
        'There is at least one parameter missing for the binding. Please check it.' =>
            '',
        'Result format' => '',
        'Run Query' => '',

        # Template: AdminService
        'Service Management' => 'Quản trị dịch vụ',
        'Add service' => '',
        'Add Service' => 'Thêm dịch vụ',
        'Edit Service' => '',
        'Sub-service of' => '',

        # Template: AdminSession
        'Session Management' => 'Quản trị phiên',
        'All sessions' => '',
        'Agent sessions' => '',
        'Customer sessions' => '',
        'Unique agents' => '',
        'Unique customers' => '',
        'Kill all sessions' => 'Xóa tất cả các phiên',
        'Kill this session' => '',
        'Session' => 'Phiên',
        'Kill' => '',
        'Detail View for SessionID' => '',

        # Template: AdminSignature
        'Signature Management' => 'Quản trị chữ ký',
        'Add signature' => '',
        'Add Signature' => 'Thêm chữ ký',
        'Edit Signature' => '',
        'Example signature' => '',

        # Template: AdminState
        'State Management' => 'Quản trị trạng thái',
        'Add state' => '',
        'Please also update the states in SysConfig where needed.' => '',
        'Add State' => 'Thêm trạng thái',
        'Edit State' => '',
        'State type' => '',

        # Template: AdminSysConfig
        'SysConfig' => 'Cấu hình hệ thống',
        'Navigate by searching in %s settings' => '',
        'Navigate by selecting config groups' => '',
        'Download all system config changes' => '',
        'Export settings' => '',
        'Load SysConfig settings from file' => '',
        'Import settings' => '',
        'Import Settings' => '',
        'Please enter a search term to look for settings.' => '',
        'Subgroup' => 'Nhóm con',
        'Elements' => 'Các thành tố',

        # Template: AdminSysConfigEdit
        'Edit Config Settings' => '',
        'This config item is only available in a higher config level!' =>
            '',
        'Reset this setting' => '',
        'Error: this file could not be found.' => '',
        'Error: this directory could not be found.' => '',
        'Error: an invalid value was entered.' => '',
        'Content' => 'Nội dung',
        'Remove this entry' => '',
        'Add entry' => '',
        'Remove entry' => '',
        'Add new entry' => '',
        'Create new entry' => '',
        'New group' => '',
        'Group ro' => '',
        'Readonly group' => '',
        'New group ro' => '',
        'Loader' => '',
        'File to load for this frontend module' => '',
        'New Loader File' => '',
        'NavBarName' => 'Tên thanh điều hướng',
        'NavBar' => 'Thanh điều hướng',
        'LinkOption' => '',
        'Block' => 'Khối',
        'AccessKey' => 'Phím truy cập',
        'Add NavBar entry' => '',
        'Year' => 'Năm',
        'Month' => 'Tháng',
        'Day' => 'Ngày',
        'Invalid year' => '',
        'Invalid month' => '',
        'Invalid day' => '',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Quản trị địa chỉ email hệ thống',
        'Add system address' => '',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            '',
        'Email address' => '',
        'Display name' => '',
        'Add System Email Address' => '',
        'Edit System Email Address' => '',
        'The display name and email address will be shown on mail you send.' =>
            '',

        # Template: AdminType
        'Type Management' => 'Quản trị loại',
        'Add ticket type' => '',
        'Add Type' => 'Thêm loại',
        'Edit Type' => '',

        # Template: AdminUser
        'Add agent' => '',
        'Agents will be needed to handle tickets.' => '',
        'Don\'t forget to add a new agent to groups and/or roles!' => '',
        'Please enter a search term to look for agents.' => '',
        'Last login' => '',
        'Login as' => 'Đăng nhập với',
        'Switch to agent' => '',
        'Add Agent' => '',
        'Edit Agent' => '',
        'Firstname' => 'Họ',
        'Lastname' => 'Tên',
        'Password is required.' => '',
        'Start' => 'bắt đầu',
        'End' => '',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => '',
        'Change Group Relations for Agent' => '',
        'Change Agent Relations for Group' => '',
        'note' => '',
        'Permissions to add notes to tickets in this group/queue.' => '',
        'owner' => 'phụ trách',
        'Permissions to change the owner of tickets in this group/queue.' =>
            '',

        # Template: AgentBook
        'Address Book' => 'Sổ địa chỉ',
        'Search for a customer' => '',
        'Add email address %s to the To field' => '',
        'Add email address %s to the Cc field' => '',
        'Add email address %s to the Bcc field' => '',
        'Apply' => '',

        # Template: AgentCustomerSearch
        'Search Customer' => 'Tìm kiếm khách hàng',
        'Duplicated entry' => '',
        'This address already exists on the address list.' => '',

        # Template: AgentCustomerTableView

        # Template: AgentDashboard
        'Dashboard' => '',

        # Template: AgentDashboardCalendarOverview
        'in' => '',

        # Template: AgentDashboardIFrame

        # Template: AgentDashboardImage

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '',
        'Please update now.' => '',
        'Release Note' => '',
        'Level' => '',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => '',

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
        'The ticket has been locked' => '',
        'Undo & close window' => '',

        # Template: AgentInfo
        'Info' => 'Thông tin',
        'To accept some news, a license or some changes.' => '',

        # Template: AgentLinkObject
        'Link Object: %s' => '',
        'Close window' => '',
        'go to link delete screen' => '',
        'Select Target Object' => '',
        'Link Object' => 'Đối tượng liên kết',
        'with' => 'với',
        'Unlink Object: %s' => '',
        'go to link add screen' => '',

        # Template: AgentNavigationBar

        # Template: AgentPreferences
        'Edit your preferences' => '',

        # Template: AgentSpelling
        'Spell Checker' => 'Kiểm tra chính tả',
        'spelling error(s)' => 'Lỗi chính tả',
        'Apply these changes' => 'Áp dụng những thay đổi này',

        # Template: AgentStatsDelete
        'Delete stat' => '',
        'Stat#' => 'Thống kê số',
        'Do you really want to delete this stat?' => '',

        # Template: AgentStatsEditRestrictions
        'Step %s' => '',
        'General Specifications' => '',
        'Select the element that will be used at the X-axis' => '',
        'Select the elements for the value series' => 'Chọn các thành tố cho chuỗi giá trị',
        'Select the restrictions to characterize the stat' => '',
        'Here you can make restrictions to your stat.' => 'Bạn có thể tạo các giới hạn cho thống kê tại đây.',
        'If you remove the hook in the "Fixed" checkbox, the agent generating the stat can change the attributes of the corresponding element.' =>
            'Nếu bạn bỏ đánh dấu trong ô "Đã sửa", nhân viên phụ trách sinh thống kê có thể thay đổi các thuộc tính của thành tố liên quan.',
        'Fixed' => 'Đã sửa',
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Hãy chọn chỉ 1 thành tố hoặc tắt nút \'Đã sửa\'!',
        'Absolute Period' => '',
        'Between' => 'Giữa',
        'Relative Period' => 'Chu kỳ liên quan',
        'The last' => 'Cuối cùng',
        'Finish' => 'Kết thúc',

        # Template: AgentStatsEditSpecification
        'Permissions' => 'Các quyền',
        'You can select one or more groups to define access for different agents.' =>
            '',
        'Some result formats are disabled because at least one needed package is not installed.' =>
            '',
        'Please contact your administrator.' => '',
        'Graph size' => '',
        'If you use a graph as output format you have to select at least one graph size.' =>
            'Nếu bạn dùng một biểu đồ làm định dạng đầu ra, bạn phải chọn ít nhất 1 cỡ biểu đồ.',
        'Sum rows' => 'Tổng số hàng',
        'Sum columns' => 'Tổng số cột',
        'Use cache' => '',
        'Most of the stats can be cached. This will speed up the presentation of this stat.' =>
            'Hầu hết các thống kê đều có thể được lưu. Điều này sẽ đẩy nhanh tốc độ trình diễn của thống kê.',
        'If set to invalid end users can not generate the stat.' => '',

        # Template: AgentStatsEditValueSeries
        'Here you can define the value series.' => '',
        'You have the possibility to select one or two elements.' => '',
        'Then you can select the attributes of elements.' => '',
        'Each attribute will be shown as single value series.' => '',
        'If you don\'t select any attribute all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            '',
        'Scale' => 'Phạm vi',
        'minimal' => 'tối thiểu',
        'Please remember, that the scale for value series has to be larger than the scale for the X-axis (e.g. X-Axis => Month, ValueSeries => Year).' =>
            'Hãy nhớ rằng, phạm vi cho chuỗi giá trị phải lớn hơn phạm vi cho trục X (ví dụ: trục X => Tháng; Chuỗi giá trị => Năm).',

        # Template: AgentStatsEditXaxis
        'Here you can define the x-axis. You can select one element via the radio button.' =>
            '',
        'maximal period' => 'chu kỳ tối đa',
        'minimal scale' => 'phạm vi tối thiểu',

        # Template: AgentStatsImport
        'Import Stat' => '',
        'File is not a Stats config' => 'File không phải là một cấu hình thống kê',
        'No File selected' => 'Không có file nào được chọn',

        # Template: AgentStatsOverview
        'Stats' => 'Thống kê',

        # Template: AgentStatsPrint
        'Print' => 'In',
        'No Element selected.' => 'Không thành tố nào được chọn.',

        # Template: AgentStatsView
        'Export config' => '',
        'With the input and select fields you can influence the format and contents of the statistic.' =>
            '',
        'Exactly what fields and formats you can influence is defined by the statistic administrator.' =>
            '',
        'Stat Details' => '',
        'Format' => 'Định dạng',
        'Graphsize' => 'Cỡ biểu đồ',
        'Cache' => 'Lưu trữ',
        'Exchange Axis' => 'Trục trao đổi',
        'Configurable params of static stat' => 'Tham số cấu hình của thống kê tĩnh',
        'No element selected.' => 'Không thành tố nào được chọn.',
        'maximal period from' => 'chu kỳ tối đa từ',
        'to' => 'đến',

        # Template: AgentTicketActionCommon
        'Change Free Text of Ticket' => '',
        'Change Owner of Ticket' => '',
        'Close Ticket' => '',
        'Add Note to Ticket' => '',
        'Set Pending' => 'Thiết đặt treo',
        'Change Priority of Ticket' => '',
        'Change Responsible of Ticket' => '',
        'Cancel & close window' => '',
        'Service invalid.' => '',
        'New Owner' => 'Phụ trách mới',
        'Please set a new owner!' => '',
        'Previous Owner' => 'Phụ trách trước',
        'Inform Agent' => 'Nhân viên thông báo',
        'Optional' => 'Tùy chọn',
        'Inform involved Agents' => 'Thông báo các nhân viên liên quan',
        'Spell check' => '',
        'Note type' => 'Loại lưu ý',
        'Next state' => 'Trạng thái tiếp',
        'Pending date' => 'Ngày treo',
        'Date invalid!' => '',

        # Template: AgentTicketActionPopupClose

        # Template: AgentTicketBounce
        'Bounce Ticket' => '',
        'Bounce to' => 'Từ bỏ từ',
        'You need a email address.' => '',
        'Need a valid email address or don\'t use a local email address.' =>
            '',
        'Next ticket state' => 'Trạng thái thẻ tiếp theo',
        'Inform sender' => 'Thông báo người gửi',
        'Send mail!' => 'Gửi mail!',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Lệnh lô trên thẻ',
        'Send Email' => '',
        'Merge to' => 'Trộn với',
        'Invalid ticket identifier!' => '',
        'Merge to oldest' => '',
        'Link together' => '',
        'Link to parent' => '',
        'Unlock tickets' => '',

        # Template: AgentTicketClose

        # Template: AgentTicketCompose
        'Compose answer for ticket' => 'Soạn trả lời cho thẻ',
        'Remove Ticket Customer' => '',
        'Please remove this entry and enter a new one with the correct value.' =>
            '',
        'Please include at least one recipient' => '',
        'Remove Cc' => '',
        'Remove Bcc' => '',
        'Address book' => '',
        'Pending Date' => 'Ngày treo',
        'for pending* states' => 'đối với các trạng thái treo*',
        'Date Invalid!' => '',

        # Template: AgentTicketCustomer
        'Change customer of ticket' => 'Thay đổi khách hàng của thẻ',
        'Customer Data' => 'Dữ liệu khách hàng',
        'Customer user' => '',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => '',
        'From queue' => '',
        'To customer' => '',
        'Please include at least one customer for the ticket.' => '',
        'Get all' => '',

        # Template: AgentTicketEscalation

        # Template: AgentTicketForward
        'Forward ticket: %s - %s' => '',
        'Need a valid email address or don\'t use a local email address' =>
            '',

        # Template: AgentTicketFreeText

        # Template: AgentTicketHistory
        'History of' => 'Lịch sử của',
        'History Content' => '',
        'Zoom view' => '',

        # Template: AgentTicketMerge
        'Ticket Merge' => 'Trộn thẻ',
        'You need to use a ticket number!' => 'Bạn cần dùng số thẻ!',
        'A valid ticket number is required.' => '',
        'Need a valid email address.' => '',

        # Template: AgentTicketMove
        'Move Ticket' => 'Chuyển thẻ',
        'New Queue' => 'Hàng đợi mới',

        # Template: AgentTicketNote

        # Template: AgentTicketOverviewMedium
        'Select all' => '',
        'No ticket data found.' => '',
        'First Response Time' => 'Lần phản hồi đầu tiên',
        'Service Time' => 'Thời gian dịch vụ',
        'Update Time' => 'Thời gian cập nhật',
        'Solution Time' => 'Thời gian giải pháp',
        'Move ticket to a different queue' => '',
        'Change queue' => 'Thay đổi hàng đợi',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Thay đổi tùy chọn tìm kiếm',
        'Tickets per page' => '',

        # Template: AgentTicketOverviewPreview
        '","26' => '',

        # Template: AgentTicketOverviewSmall
        'Escalation in' => 'Tiếp tục trong',
        'Locked' => 'Đã khóa',
        '","30' => '',

        # Template: AgentTicketOwner

        # Template: AgentTicketPending

        # Template: AgentTicketPhone
        'Create New Phone Ticket' => '',
        'From customer' => '',
        'To queue' => '',

        # Template: AgentTicketPhoneCommon
        'Phone call' => 'Cuộc gọi',

        # Template: AgentTicketPlain
        'Email Text Plain View' => '',
        'Plain' => 'Gốc',
        'Download this email' => '',

        # Template: AgentTicketPrint
        'Ticket-Info' => 'Thông tin thẻ',
        'Accounted time' => 'Thời gian kê khai',
        'Linked-Object' => 'Đối tượng liên kết',
        'by' => 'bởi',

        # Template: AgentTicketPriority

        # Template: AgentTicketQueue

        # Template: AgentTicketResponsible

        # Template: AgentTicketSearch
        'Search template' => 'Tìm kiếm mẫu',
        'Create Template' => '',
        'Create New' => '',
        'Profile link' => '',
        'Save changes in template' => '',
        'Add another attribute' => '',
        'Output' => 'Kết quả từ',
        'Fulltext' => 'Toàn bộ văn bản',
        'Remove' => '',
        'Customer User Login' => 'Đăng nhập người dùng khách hàng',
        'Created in Queue' => 'Đã tạo trong hàng đợi',
        'Lock state' => '',
        'Watcher' => 'Người xem',
        'Article Create Time (before/after)' => '',
        'Article Create Time (between)' => '',
        'Ticket Create Time (before/after)' => '',
        'Ticket Create Time (between)' => '',
        'Ticket Change Time (before/after)' => '',
        'Ticket Change Time (between)' => '',
        'Ticket Close Time (before/after)' => '',
        'Ticket Close Time (between)' => '',
        'Archive Search' => '',
        'Run search' => '',

        # Template: AgentTicketSearchOpenSearchDescriptionFulltext

        # Template: AgentTicketSearchOpenSearchDescriptionTicketNumber

        # Template: AgentTicketSearchResultPrint

        # Template: AgentTicketZoom
        'Article filter' => '',
        'Article Type' => '',
        'Sender Type' => '',
        'Save filter settings as default' => '',
        'Ticket Information' => '',
        'Linked Objects' => '',
        'Article(s)' => '',
        'Change Queue' => '',
        'Article Filter' => '',
        'Add Filter' => '',
        'Set' => 'Thiết đặt',
        'Reset Filter' => '',
        'Show one article' => '',
        'Show all articles' => '',
        'Unread articles' => '',
        'No.' => '',
        'Unread Article!' => '',
        'Incoming message' => '',
        'Outgoing message' => '',
        'Internal message' => '',
        'Resize' => '',

        # Template: AttachmentBlocker
        'To protect your privacy, active or/and remote content has blocked.' =>
            '',
        'Load blocked content.' => '',

        # Template: Copyright

        # Template: CustomerAccept

        # Template: CustomerError
        'Traceback' => 'Truy nguyên',

        # Template: CustomerFooter
        'Powered by' => 'Chạy trên nền',
        'One or more errors occurred!' => '',
        'Close this dialog' => '',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            '',

        # Template: CustomerHeader

        # Template: CustomerLogin
        'Login' => 'Đăng nhập',
        'User name' => '',
        'Your user name' => '',
        'Your password' => '',
        'Forgot password?' => '',
        'Log In' => '',
        'Not yet registered?' => '',
        'Sign up now' => '',
        'Request new password' => 'Yêu cầu mật khẩu mới',
        'Your User Name' => '',
        'A new password will be sent to your email address.' => '',
        'Create Account' => 'Tạo tài khoản',
        'Please fill out this form to receive login credentials.' => '',
        'How we should address you' => '',
        'Your First Name' => '',
        'Please supply a first name' => '',
        'Your Last Name' => '',
        'Please supply a last name' => '',
        'Your email address (this will become your username)' => '',
        'Please supply a' => '',

        # Template: CustomerNavigationBar
        'Edit personal preferences' => '',
        'Logout %s' => '',

        # Template: CustomerPreferences

        # Template: CustomerRichTextEditor

        # Template: CustomerTicketMessage
        'Service level agreement' => '',

        # Template: CustomerTicketOverview
        'Welcome!' => '',
        'Please click the button below to create your first ticket.' => '',
        'Create your first ticket' => '',

        # Template: CustomerTicketPrint
        'Ticket Print' => '',

        # Template: CustomerTicketSearch
        'Profile' => 'Hồ sơ',
        'e. g. 10*5155 or 105658*' => '',
        'Customer ID' => '',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => '',
        'Recipient' => '',
        'Carbon Copy' => '',
        'Time restrictions' => '',
        'No time settings' => '',
        'Only tickets created' => '',
        'Only tickets created between' => '',
        'Ticket archive system' => '',
        'Save search as template?' => '',
        'Save as Template?' => '',
        'Save as Template' => '',
        'Template Name' => '',
        'Pick a profile name' => '',
        'Output to' => '',

        # Template: CustomerTicketSearchOpenSearchDescription

        # Template: CustomerTicketSearchResultPrint

        # Template: CustomerTicketSearchResultShort
        'of' => 'của',
        'Page' => 'Trang',
        'Search Results for' => '',
        '","18' => '',

        # Template: CustomerTicketZoom
        'Expand article' => '',
        'Reply' => '',

        # Template: CustomerWarning

        # Template: Datepicker
        'Invalid date (need a future date)!' => '',
        'Previous' => '',
        'Sunday' => '',
        'Monday' => '',
        'Tuesday' => '',
        'Wednesday' => '',
        'Thursday' => '',
        'Friday' => '',
        'Saturday' => '',
        'Su' => '',
        'Mo' => '',
        'Tu' => '',
        'We' => '',
        'Th' => '',
        'Fr' => '',
        'Sa' => '',
        'Open date selection' => '',

        # Template: Error
        'Oops! An Error occurred.' => '',
        'Error Message' => '',
        'You can' => '',
        'Send a bugreport' => '',
        'go back to the previous page' => '',
        'Error Details' => '',

        # Template: Footer
        'Top of page' => '',

        # Template: FooterJS
        'If you now leave this page, all open popup windows will be closed, too!' =>
            '',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            '',
        'Please enter at least one search value or * to find anything.' =>
            '',

        # Template: FooterSmall

        # Template: HTMLHead

        # Template: HTMLHeadBlockEvents

        # Template: Header
        'You are logged in as' => '',

        # Template: HeaderSmall

        # Template: Installer
        'JavaScript not available' => '',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            '',
        'Database Settings' => '',
        'General Specifications and Mail Settings' => '',
        'Registration' => '',
        'Welcome to %s' => 'Chào mừng tới %s',
        'Web site' => '',
        'Database check successful.' => '',
        'Mail check successful.' => '',
        'Error in the mail settings. Please correct and try again.' => '',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => '',
        'Outbound mail type' => '',
        'Select outbound mail type.' => '',
        'Outbound mail port' => '',
        'Select outbound mail port.' => '',
        'SMTP host' => '',
        'SMTP host.' => '',
        'SMTP authentication' => '',
        'Does your SMTP host need authentication?' => '',
        'SMTP auth user' => '',
        'Username for SMTP auth.' => '',
        'SMTP auth password' => '',
        'Password for SMTP auth.' => '',
        'Configure Inbound Mail' => '',
        'Inbound mail type' => '',
        'Select inbound mail type.' => '',
        'Inbound mail host' => '',
        'Inbound mail host.' => '',
        'Inbound mail user' => '',
        'User for inbound mail.' => '',
        'Inbound mail password' => '',
        'Password for inbound mail.' => '',
        'Result of mail configuration check' => '',
        'Check mail configuration' => '',
        'Skip this step' => '',
        'Skipping this step will automatically skip the registration of your OTRS. Are you sure you want to continue?' =>
            '',

        # Template: InstallerDBResult
        'False' => '',

        # Template: InstallerDBStart
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty. For security reasons we do recommend setting a root password. For more information please refer to your database documentation.' =>
            '',
        'Currently only MySQL is supported in the web installer.' => '',
        'If you want to install OTRS on another database type, please refer to the file README.database.' =>
            '',
        'Database-User' => 'Người dùng cơ sở dữ liệu',
        'New' => 'Mới',
        'A new database user with limited rights will be created for this OTRS system.' =>
            '',
        'default \'hot\'' => 'mặc định \'hot\'',
        'DB--- host' => '',
        'Check database settings' => '',
        'Result of database check' => '',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Để có thể sử dụng OTRS bạn phải nhập dòng sau vào dòng lệnh của bạn (Terminal/Shell) làm gốc.',
        'Restart your webserver' => 'Khởi động lại máy chủ web.',
        'After doing so your OTRS is up and running.' => 'Sau khi thực hiện OTRS của bạn đã hoạt động.',
        'Start page' => 'Trang bắt đầu',
        'Your OTRS Team' => 'Đội OTRS của bạn',

        # Template: InstallerLicense
        'Accept license' => 'Chấp nhận giấy phép',
        'Don\'t accept license' => 'Không chấp nhận giấy phép',

        # Template: InstallerLicenseText

        # Template: InstallerRegistration
        'Organization' => 'Tổ chức',
        'Position' => '',
        'Complete registration and continue' => '',
        'Please fill in all fields marked as mandatory.' => '',

        # Template: InstallerSystem
        'SystemID' => 'Mã hệ thống',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            '',
        'System FQDN' => 'Hệ thống FQDN',
        'Fully qualified domain name of your system.' => '',
        'AdminEmail' => 'Email quản trị',
        'Email address of the system administrator.' => '',
        'Log' => 'Bản ghi',
        'LogModule' => 'Mô đun bản ghi',
        'Log backend to use.' => '',
        'LogFile' => '',
        'Log file location is only needed for File-LogModule!' => '',
        'Webfrontend' => 'Mặt ngoài web',
        'Default language' => '',
        'Default language.' => '',
        'CheckMXRecord' => 'Kiểm tra bản ghi MX',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            '',

        # Template: LinkObject
        'Object#' => '',
        'Add links' => '',
        'Delete links' => '',

        # Template: Login
        'JavaScript Not Available' => '',
        'Browser Warning' => '',
        'The browser you are using is too old.' => '',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            '',
        'Please see the documentation or ask your admin for further information.' =>
            '',
        'Lost your password?' => 'Mất mật khẩu?',
        'Request New Password' => '',
        'Back to login' => '',

        # Template: Motd
        'Message of the Day' => '',

        # Template: NoPermission
        'Insufficient Rights' => '',
        'Back to the previous page' => '',

        # Template: Notify

        # Template: Pagination
        'Show first page' => '',
        'Show previous pages' => '',
        'Show page %s' => '',
        'Show next pages' => '',
        'Show last page' => '',

        # Template: PictureUpload
        'Need FormID!' => '',
        'No file found!' => '',
        'The file is not an image that can be shown inline!' => '',

        # Template: PrintFooter
        'URL' => 'URL',

        # Template: PrintHeader
        'printed by' => 'được in bởi',

        # Template: PublicDefault

        # Template: Redirect

        # Template: RichTextEditor

        # Template: SpellingInline

        # Template: Test
        'OTRS Test Page' => 'Trang test OTRS',
        'Welcome %s' => 'Chào mừng %s',
        'Counter' => 'Bộ đếm',

        # Template: Warning
        'Go back to the previous page' => '',

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
        'Agent Notifications' => '',
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
        'Agents <-> Groups' => '',
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
        'Attachments <-> Responses' => 'Các đính kèm <-> Các trả lời',
        'Auto Responses <-> Queues' => 'Các trả lời tự động <-> Hàng đợi',
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
        'Change password' => '',
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
        'Converts HTML mails into text messages.' => '',
        'Create and manage Service Level Agreements (SLAs).' => '',
        'Create and manage agents.' => '',
        'Create and manage attachments.' => '',
        'Create and manage companies.' => '',
        'Create and manage customers.' => '',
        'Create and manage dynamic fields.' => '',
        'Create and manage event based notifications.' => '',
        'Create and manage groups.' => '',
        'Create and manage notifications that are sent to agents.' => '',
        'Create and manage queues.' => '',
        'Create and manage response templates.' => '',
        'Create and manage responses that are automatically sent.' => '',
        'Create and manage roles.' => '',
        'Create and manage salutations.' => '',
        'Create and manage services.' => '',
        'Create and manage signatures.' => '',
        'Create and manage ticket priorities.' => '',
        'Create and manage ticket states.' => '',
        'Create and manage ticket types.' => '',
        'Create and manage web services.' => '',
        'Create new email ticket and send this out (outbound)' => '',
        'Create new phone ticket (inbound)' => '',
        'Custom text for the page shown to customers that have no tickets yet.' =>
            '',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customers <-> Groups' => '',
        'Customers <-> Services' => '',
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
        'Email Addresses' => 'Địa chỉ email',
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
        'Execute SQL statements.' => '',
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
        'Filter incoming emails.' => '',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            '',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            '',
        'Forces to unlock tickets after being moved to another queue.' =>
            '',
        'Frontend language' => '',
        'Frontend module registration (disable company link if no company feature is used).' =>
            '',
        'Frontend module registration for the agent interface.' => '',
        'Frontend module registration for the customer interface.' => '',
        'Frontend theme' => '',
        'GenericAgent' => 'Nhân viên phụ trách chung',
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
        'Link agents to groups.' => '',
        'Link agents to roles.' => '',
        'Link attachments to responses templates.' => '',
        'Link customers to groups.' => '',
        'Link customers to services.' => '',
        'Link queues to auto responses.' => '',
        'Link responses to queues.' => '',
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
        'Manage PGP keys for email encryption.' => '',
        'Manage POP3 or IMAP accounts to fetch email from.' => '',
        'Manage S/MIME certificates for email encryption.' => '',
        'Manage existing sessions.' => '',
        'Manage periodic tasks.' => '',
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
        'New email ticket' => '',
        'New phone ticket' => '',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Notifications (Event)' => '',
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
        'PostMaster Filters' => '',
        'PostMaster Mail Accounts' => '',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see http://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            '',
        'Queue view' => '',
        'Refresh Overviews after' => '',
        'Refresh interval' => '',
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
        'Responses <-> Queues' => 'Các trả lời <-> Hàng đợi',
        'Restores a ticket from the archive (only if the event is a state change, from closed to any open available state).' =>
            '',
        'Roles <-> Groups' => 'Vai trò <-> Nhóm',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            '',
        'Runs the system in "Demo" mode. If set to "Yes", agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            '',
        'S/MIME Certificate Upload' => '',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the OTRS user. You can switch between the modules even on a system that is already in production without any loss of data.' =>
            '',
        'Saves the login and password on the session table in the database, if "DB" was selected for SessionModule.' =>
            '',
        'Search backend default router.' => '',
        'Search backend router.' => '',
        'Select your frontend Theme.' => 'Hãy chọn giao diện mặt ngoài của bạn.',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            '',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            '',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            '',
        'Send notifications to users.' => '',
        'Send ticket follow up notifications' => '',
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
        'Set sender email addresses for this system.' => '',
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
        'Skin' => '',
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
        'Statistics' => '',
        'Status view' => '',
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
        'Ticket overview' => '',
        'Tickets' => 'Các thẻ',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            '',
        'Toolbar Item for a shortcut.' => '',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            '',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            '',
        'Types' => '',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            '',
        'Update and extend your system with software packages.' => '',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            '',
        'Updates the ticket index accelerator.' => '',
        'Uses Cc recipients in reply Cc list on compose an email answer in the ticket compose screen of the agent interface.' =>
            '',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard responses, auto responses and notifications.' =>
            '',
        'View performance benchmark results.' => '',
        'View system log messages.' => '',
        'Wear this frontend skin' => '',
        'Webservice path separator.' => '',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. In this text area you can define this text (This text cannot be changed by the agent).' =>
            '',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            '',
        'Your language' => '',
        'Your queue selection of your favorite queues. You also get notified about those queues via email if enabled.' =>
            'Lựa chọn hàng đợi trong số các hàng đợi ưa thích của bạn. Bạn cũng sẽ nhận được thông báo về chúng thông qua email nếu chức năng được kích hoạt',

        #
        # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
        #
        '%s Tickets affected! Do you really want to use this job?' => '%s thẻ bị ảnh hưởng! Bạn có thực sự muốn dùng công việc này?',
        '(Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behinde a dial-up line $!)' =>
            '(Kiểm tra các bản ghi MX của các địa chỉ email đã sử dụng bằng cách tạo một trả lời. Không dùng Kiểm tra bản ghi MX nếu hệ thống OTRS của bạn nằm sau 1 đường dial-up!)',
        '(Email of the system admin)' => '(Email của quản trị hệ thống)',
        '(Full qualified domain name of your system)' => '(Tên miền đầy đủ điều kiện của hệ thống)',
        '(Logfile just needed for File-LogModule!)' => '(File bản ghi chỉ cần cho mô đun File-Log!)',
        '(Note: It depends on your installation how many dynamic objects you can use)' =>
            '(Lưu ý: Nó phụ thuộc vào cài đặt của bạn có bao nhiêu đối tượng động bạn muốn dùng)',
        '(Note: Useful for big databases and low performance server)' => '(Lưu ý: Hữu dụng đối với các cơ sở dữ liệu lớn và máy chủ cấu hình thấp)',
        '(The identify of the system. Each ticket number and each http session id starts with this number)' =>
            '(Nhận dạng của hệ thống. Mỗi số thẻ và mỗi mã phiên http đều bắt đầu bằng số này)',
        '(Ticket identifier. Some people want toset this to e. g. \'Ticket#\', \'Call#\' or \'MyTicket#\')' =>
            '(Nhận dạng thẻ. Một số người muốn thiết đặt điều này thành ví dụ như \'Ticket#\', \'Call#\' hoặc \'MyTicket#\')',
        '(Used default language)' => '(Dùng ngôn ngữ mặc định)',
        '(Used log backend)' => '(Đã sử dụng các bản ghi mặt sau)',
        '(Used ticket number format)' => '(Định dạng số thẻ sử dụng)',
        'A article should have a title!' => 'Bài viết nên có tiêu đề!',
        'A message must be spell checked!' => 'Tin nhắn phải được kiểm tra chính tả!',
        'A message should have a To: recipient!' => 'Một tin nhắn nên có trường người nhận!',
        'A message should have a body!' => 'Tin nhắn nên có nội dung!',
        'A message should have a subject!' => 'Thư nên có tiêu đề!',
        'Absolut Period' => 'Chu kỳ tuyệt đối',
        'Add Customer User' => 'Thêm người dùng khách hàng',
        'Add System Address' => 'Thêm địa chỉ hệ thống',
        'Add User' => 'Thêm người dùng',
        'Add a new Agent.' => 'Thêm một nhân viên mới.',
        'Add a new Customer Company.' => 'Thêm 1 công ty khách hàng mới',
        'Add a new Group.' => 'Thêm 1 nhóm mới.',
        'Add a new Role.' => 'Thêm vai trò mới.',
        'Add a new SLA.' => 'Thêm SLA mới.',
        'Add a new Salutation.' => 'Thêm lời chào mới.',
        'Add a new Service.' => 'Thêm dịch vụ mới.',
        'Add a new Signature.' => 'Thêm chữ ký mới.',
        'Add a new State.' => 'Thêm trạng thái mới.',
        'Add a new System Address.' => 'Thêm địa chỉ hệ thống mới.',
        'Add a new Type.' => 'Thêm loại mới.',
        'Add a note to this ticket!' => 'Thêm lưu ý đối với thẻ này!',
        'Add note to ticket' => 'Thêm lưu ý cho thẻ',
        'Added User "%s"' => 'Người dùng "%s" đã được thêm.',
        'Admin-Area' => 'Khu vực dành cho quản trị',
        'Admin-Password' => 'Mật khẩu quản trị',
        'Admin-User' => 'Tên truy cập quản trị',
        'Agent Mailbox' => 'Hộp thư dành cho nhân viên',
        'Agent Preferences' => 'Giao diện cho nhân viên phụ trách',
        'Agent-Area' => 'Khu vực dành cho nhân viên',
        'All Agent variables.' => 'Tất cả các biến số nhân viên',
        'All Agents' => 'Tất cả nhân viên',
        'All Customer variables like defined in config option CustomerUser.' =>
            'Tất cả các biến số khách hàng đã định nghĩa trong cấu hình tùy chọn người dùng khách hàng.',
        'All customer tickets.' => 'Tất cả các thẻ khách hàng.',
        'All incoming emails with this "Email" (To:) will be dispatched in the selected queue!' =>
            'Tất cả các email đến với có từ "Email" (Tới:) sẽ được gửi vào trong hàng đợi đã chọn.',
        'All messages' => 'Tất cả tin nhắn',
        'Allocate CustomerUser to service' => 'Phân phối người dùng khách hàng tới dịch vụ',
        'Allocate services to CustomerUser' => 'Phân phối dịch vụ tới người dùng khách hàng',
        'Answer' => 'Trả lời',
        'Attach' => 'Đính kèm',
        'Attribute' => 'Thuộc tính',
        'Auto Response From' => 'Phàn hồi tự động từ',
        'Bounce ticket' => 'Thẻ đã bỏ',
        'CSV' => 'CSV',
        'Can\'t update password, invalid characters!' => 'Không thể cập nhật mật khẩu, các ký tự không hợp lệ.',
        'Can\'t update password, must be at least %s characters!' => 'Không thể cập nhật mật khẩu, mật khẩu phải ít nhất %s ký tự.',
        'Can\'t update password, must contain 2 lower and 2 upper characters!' =>
            'Không thể cập nhật mật khẩu, cần có 2 ký tự dưới và 2 ký tự trên.',
        'Can\'t update password, needs at least 1 digit!' => 'Không thể cập nhật mật khẩu, mật khẩu cần có ít nhất 1 con số!',
        'Can\'t update password, needs at least 2 characters!' => 'Không thể cập nhật mật khẩu, mật khẩu cần có ít nhất 2 ký tự!',
        'Can\'t update password, your new passwords do not match! Please try again!' =>
            'Không thể cập nhật mật khẩu, các mật khẩu không khớp nhau! Hãy thử lại lần nữa!',
        'Category Tree' => 'Cây thư mục',
        'Change %s settings' => 'Thay đổi %s thiết đặt',
        'Change Time' => 'Thay đổi thời gian',
        'Change free text of ticket' => 'Thay đổi nội dung thẻ',
        'Change owner of ticket' => 'Thay đổi phụ trách thẻ',
        'Change priority of ticket' => 'Thay đổi mức độ ưu tiên của thẻ',
        'Change responsible of ticket' => 'Thay đổi người chịu trách nhiệm của thẻ',
        'Change the ticket customer!' => 'Thay đổi khách hàng thẻ!',
        'Change the ticket owner!' => 'Thay đổi phụ trách thẻ!',
        'Change the ticket priority!' => 'Thay đổi ưu tiên thẻ',
        'Change user <-> group settings' => 'Thay đổi người dùng <-> các thiết đặt nhóm',
        'ChangeLog' => 'Bản ghi thay đổi',
        'Child-Object' => 'Đối tượng con',
        'Classification' => 'Phân loại',
        'Clear From' => 'Xóa từ',
        'Clear To' => 'Xóa tới',
        'Click here to report a bug!' => 'Nhấn chuột vào đây để gửi báo cáo lỗi!',
        'Close this ticket!' => 'Đóng thẻ này!',
        'Close ticket' => 'Đóng thẻ',
        'Close type' => 'Đóng loại',
        'Close!' => 'Đóng!',
        'Comment (internal)' => 'Nhận xét (nội bộ)',
        'CompanyTickets' => 'Thẻ công ty',
        'Compose Answer' => 'Soạn trả lời',
        'Compose Email' => 'Soạn email',
        'Compose Follow up' => 'Soạn theo dõi',
        'Config Options' => 'Các tùy chọn cấu hình',
        'Config options (e. g. &lt;OTRS_CONFIG_HttpType&gt;)' => 'Các tùy chọn cấu hình (ví dụ: &lt;OTRS_CONFIG_HttpType&gt;)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>)' => 'Các tùy chọn cấu hình (ví dụ: <OTRS_CONFIG_HttpType>)',
        'Config options (e. g. <OTRS_CONFIG_HttpType>).' => 'Tùy chọn cấu hình (ví dụ: <OTRS_CONFIG_HttpType).',
        'Contact customer' => 'Liên hệ khách hàng',
        'Create Times' => 'Các lần khởi tạo',
        'Create new Phone Ticket' => 'Tạo thẻ cuộc gọi mới',
        'Create new database' => 'Tạo cơ sở dữ liệu mới',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...).' =>
            'Tạo các nhóm mới để điều khiển quyền truy cập cho các nhóm nhân viên khác nhau (ví dụ: bộ phận mua hàng, bộ phận hỗ trợ, bộ phận kinh doanh,...).',
        'CreateTicket' => 'Tạo thẻ',
        'Current Impact Rating' => 'Mức ảnh hưởng hiện tại',
        'Customer Move Notify' => 'Thông báo chuyển khách hàng',
        'Customer Owner Notify' => 'Thông báo phụ trách khách hàng',
        'Customer State Notify' => 'Thông báo trạng thái khách hàng',
        'Customer User' => 'Người dùng khách hàng',
        'Customer User Management' => 'Quản trị người dùng khách hàng',
        'Customer Users' => 'Người dùng khách hàng',
        'Customer Users <-> Groups' => 'Người dùng khách hàng <-> Nhóm',
        'Customer Users <-> Groups Management' => 'Người dùng khách hàng <-> Quản trị nhóm',
        'Customer Users <-> Services' => 'Người dùng khách hàng <-> Dịch vụ',
        'Customer Users <-> Services Management' => 'Người dùng khách hàng <-> Quản trị dịch vụ',
        'Customer history' => 'Lịch sử khách hàng',
        'Customer history search' => 'Tìm kiếm lịch sử khách hàng',
        'Customer history search (e. g. "ID342425").' => 'Tìm kiếm lịch sử khách hàng (ví dụ: "ID342425").',
        'Customer user will be needed to have a customer history and to login via customer panel.' =>
            'Người dùng khách hàng sẽ cần có một lịch sử khách hàng và đăng nhập thông qua bảng điều khiển khách hàng',
        'CustomerUser' => 'Người dùng khách hàng',
        'D' => 'D',
        'DB Admin Password' => 'Mật khẩu quản trị Cơ sở dữ liệu',
        'DB Admin User' => 'Người dùng quản trị Cơ sở dữ liệu',
        'DB connect host' => 'Máy chủ host kết nối cơ sở dữ liệu',
        'Default' => 'Mặc định',
        'Default Charset' => 'Mã ký tự mặc định',
        'Default Language' => 'Ngôn ngữ mặc định',
        'Delete old database' => 'Xóa cơ sở dữ liệu cũ',
        'Delete this ticket!' => 'Xóa thẻ này!',
        'Detail' => 'Chi tiết',
        'Diff' => 'Khác nhau',
        'Discard all changes and return to the compose screen' => 'Từ bỏ mọi thay đổi và trở lại màn hình soạn',
        'Do dispatch or filter incoming emails based on email X-Headers! RegExp is also possible.' =>
            'Gửi hoặc lọc các email đến dựa trên X-Headers email! RegExp cũng có thể.',
        'Do you really want to delete this Object?' => 'Bạn có thực sự muốn xóa đối tượng này không?',
        'Do you really want to reinstall this package (all manual changes get lost)?' =>
            'Bạn có thực sự muốn cài lại đặt gói này (tất cả những thay đổi bị mất)?',
        'Don\'t forget to add a new user to groups and/or roles!' => 'Đừng quên thêm một người dùng mới vào nhóm và/hoặc vai trò!',
        'Don\'t forget to add a new user to groups!' => 'Đừng quên bổ sung một người dùng mới vào nhóm!',
        'Don\'t work with UserID 1 (System account)! Create new users!' =>
            'Không làm việc với mã người dùng 1 (tài khoản hệ thống)! Hãy tạo người dùng mới!',
        'Download Settings' => 'Các thiết đặt tải xuống',
        'Download all system config changes.' => 'Tải xuống các thay đổi cấu hình hệ thống.',
        'Drop Database' => 'Bỏ qua Cơ sở dữ liệu',
        'Dynamic-Object' => 'Đối tượng động',
        'Edit default services.' => 'Sửa dịch vụ mặc định.',
        'Escalation - First Response Time' => 'Tiếp tục - Thời gian phản hồi đầu tiên',
        'Escalation - Solution Time' => 'Tiếp tục - Thời gian giải pháp',
        'Escalation - Update Time' => 'Tiếp tục - Thời gian cập nhật',
        'Escalation time' => 'Thời gian tiếp tục',
        'Explanation' => 'Giải thích',
        'Export Config' => 'Cấu hình xuất',
        'FAQ Search Result' => 'Kết quả tìm kiếm FAQ',
        'FAQ System History' => 'Lịch sử hệ thống FAQ',
        'File-Name' => 'Tên file',
        'File-Path' => 'Đường dẫn file',
        'Filelist' => 'Danh sách file',
        'Filtername' => 'Lọc tên',
        'Follow up' => 'Theo dõi',
        'Follow up notification' => 'Thông báo theo dõi',
        'For very complex stats it is possible to include a hardcoded file.' =>
            'Đối với các thống kê phức tạp có thể bao gồm cả file đã mã hóa.',
        'Frontend' => 'Mặt ngoài',
        'Fulltext-Search in Article (e. g. "Mar*in" or "Baue*")' => 'Tìm kiếm trong bài viết (ví dụ: "Mar*in" hoặc "Baue*")',
        'Go' => 'Tới',
        'Group Ro' => 'Nhóm chỉ đọc',
        'Group selection' => 'Lựa chọn nhóm',
        'Have a lot of fun!' => 'Hãy tận hưởng sự vui thích!',
        'Here you can define the value series. You have the possibility to select one or two elements. Then you can select the attributes of elements. Each attribute will be shown as single value series. If you don\'t select any attribute all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Bạn có thể định nghĩa chuỗi giá trị tại đây. Bạn có khả năng chon 1 hoặc 2 thành tố. Sau đó có thể chọn các thuộc tính của thành tố. Mỗi thuộc tính sẽ được hiển thị là một chuỗi giá trị đơn lẻ. Nếu không chọn thuộc tính nào, tất cả thuộc tính của thành tố sẽ được sử dụng nếu bạn sinh thống kê. Cùng với đó một thuộc tính mới cũng được thêm kể từ lần cấu hình cuối cùng.',
        'Here you can define the x-axis. You can select one element via the radio button. Then you you have to select two or more attributes of the element. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'Bạn có thể định nghĩa trục X tại đây. Bạn có thể chọn 1 thành tố thông qua nút bấm radio. Sau đó phải chọn 1 hoặc nhiều thuộc tính của thành tố. Nếu không chọn tất cả thuộc tính của thành tố sẽ được sử dụng nếu bạn sinh thống kê. Cùng với đó một thuộc tính mới cũng được thêm kể từ lần cấu hình cuối cùng.',
        'Here you can insert a description of the stat.' => 'Bạn có thể chèn mô tả thống kê tại đây.',
        'Here you can select the dynamic object you want to use.' => 'Bạn có thể chọn đối tượng động muốn sử dụng tại đây.',
        'Home' => 'Trang chủ',
        'If a new hardcoded file is available this attribute will be shown and you can select one.' =>
            'Nếu một file đã mã hóa sẵn sàng sử dụng, thuộc tính này sẽ được hiển thị và bạn có thể chọn nó.',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked for the old owner.' =>
            'Nếu một thẻ được đóng và khách hàng gửi theo dõi, thẻ sẽ bị khóa cho người phụ trách cũ.',
        'If a ticket will not be answered in this time, just only this ticket will be shown.' =>
            'Nếu một thẻ không được trả lời trong thời gian này, chỉ duy nhất thẻ này sẽ được hiển thị.',
        'If an agent locks a ticket and he/she will not send an answer within this time, the ticket will be unlock automatically. So the ticket is viewable for all other agents.' =>
            'Nếu 1 nhân viên khóa thẻ và họ không gửi trả lời trong thời gian này, thẻ sẽ được tự động mở khóa. Do vậy tất cả các nhân viên khác đều có thể nhìn thấy thẻ đó.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the user).' =>
            'Nếu không chọn cái gì thì sẽ không có quyền nào trong nhóm này (các thẻ sẽ không sẵn sàng sử dụng đối với người dùng).',
        'If you need the sum of every column select yes.' => 'Nếu bạn cần tổng số cột, Hãy chọn \'Có\'.',
        'If you need the sum of every row select yes' => 'Nếu bạn cần tổng số hàng, Hãy chọn \'Có\'.',
        'If you use RegExp, you also can use the matched value in () as [***] in \'Set\'.' =>
            'Nếu bạn dùng RegExp, bạn cũng có thể sử dụng giá trị kết hợp trong () thành [***] trong \'Thiết đặt\'.',
        'Image' => 'Ảnh',
        'Important' => 'Quan trọng',
        'Imported' => 'Nhập',
        'Imported by' => 'Nhập bởi',
        'In this form you can select the basic specifications.' => 'Trong mẫu này bạn có thể chọn các đặc tả cơ bản.',
        'In this way you can directly edit the keyring configured in Kernel/Config.pm.' =>
            'Theo cách này bạn có thể sửa trực tiếp cấu hình khóa trong Kernel/Config.pm',
        'Information about the Stat' => 'Thông tin về thống kê',
        'Insert of the common specifications' => 'Chèn cấu hình chung',
        'Instance' => 'Trường hợp',
        'Is Job Valid' => 'Công việc có hợp lệ',
        'Is Job Valid?' => 'Công việc có hợp lệ?',
        'It\'s useful for ASP solutions.' => 'Nó hữu ích cho giải pháp ASP.',
        'It\'s useful for a lot of users and groups.' => 'Nó hữu ích đối với nhiều người dùng và nhóm.',
        'Job-List' => 'Danh sách công việc',
        'Keyword' => 'Từ khóa',
        'Keywords' => 'Từ khóa',
        'Last update' => 'Lần cập nhật trước',
        'Link this ticket to an other objects!' => 'Liên kết thẻ này với các đối tượng khác!',
        'Load' => 'Tải',
        'Load Settings' => 'Các thiết đặt tải',
        'Lock it to work on it!' => 'Khóa để làm việc trên đó!',
        'Logfile' => 'File bản ghi',
        'Logfile too large, you need to reset it!' => 'File bản ghi quá lớn, bạn cần thiết đặt lại!',
        'Login failed! Your username or password was entered incorrectly.' =>
            'Đăng nhập thất bại! Tên truy cập hoặc mật khẩu nhập không chính xác.',
        'Lookup' => 'Tra',
        'Mail Management' => 'Quản trị mail',
        'Mailbox' => 'Hộp mail',
        'Match' => 'Kết hợp',
        'Merge this ticket!' => 'Trộn thẻ này!',
        'Message for new Owner' => 'Tin nhắn cho phụ trách mới',
        'Message sent to' => 'Tin nhắn được gửi tới',
        'Misc' => 'Khác',
        'Modified' => 'Đã chỉnh sửa',
        'Modules' => 'Mô đun',
        'Move notification' => 'Thông báo chuyển',
        'Multiple selection of the output format.' => 'Nhiều lựa chọn của định dạng đầu ra.',
        'My Queue' => 'Hàng đợi của tôi',
        'MyTickets' => 'Thẻ của tôi',
        'Name is required!' => 'Tên được yêu cầu!',
        'New Agent' => 'Nhân viên mới',
        'New Customer' => 'Khách hàng mới',
        'New Group' => 'Nhóm mới',
        'New Group Ro' => 'Nhóm chỉ đọc mới',
        'New Priority' => 'Ưu tiên mới',
        'New State' => 'Trạng thái mới',
        'New Ticket Lock' => 'Khóa thẻ mới',
        'New TicketFreeFields' => 'Các trường không thẻ mới',
        'New messages' => 'Tin nhắn mới',
        'New password again' => 'Gõ lại mật khẩu mới',
        'No * possible!' => 'Không * có thể!',
        'No Packages for requested Framework in this Online Repository, but Packages for other Frameworks!' =>
            'Không có gói nào cho cấu trúc yêu cầu trong Kho chứa trực tuyến này, nhưng có các gói cho những cấu trúc khác.',
        'No Packages or no new Packages in selected Online Repository!' =>
            'Không có gói nào hoặc không có gói mới nào trong Kho chứa trực tuyến đã chọn!',
        'No Permission' => 'Không có quyền',
        'No means, send agent and customer notifications on changes.' => 'Không, nghĩa là, gửi thông báo cho nhân viên và khách hàng về các thay đổi.',
        'No time settings.' => 'Không có thiết đặt thời gian.',
        'Node-Address' => 'Địa chỉ nút',
        'Node-Name' => 'Tên nút',
        'Note Text' => 'Lưu ý',
        'Notification (Customer)' => 'Thông báo (Khách hàng)',
        'Notifications' => 'Thông báo',
        'OTRS DB Password' => 'Mật khẩu cơ sở dữ liệu OTRS',
        'OTRS sends an notification email to the customer if the ticket is moved.' =>
            'OTRS gửi một email thông báo tới khách hàng nếu thẻ được chuyển.',
        'OTRS sends an notification email to the customer if the ticket owner has changed.' =>
            'OTRS gửi một email thông báo tới khách hàng nếu phụ trách thẻ thay đổi.',
        'OTRS sends an notification email to the customer if the ticket state has changed.' =>
            'OTRS gửi một email thông báo tới khách hàng nếu trạng thái thẻ thay đổi.',
        'Of couse this feature will take some system performance it self!' =>
            'Tất nhiên tính năng này sẽ tự thực thi hệ thống.',
        'Open Tickets' => 'Mở thẻ',
        'Options of the current customer user data (e. g. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)' =>
            'Các tùy chọn của dữ liệu người dùng khách hàng hiện tại ((ví dụ: &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;).',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>)' =>
            'Các tùy chọn của dữ liệu người dùng khách hàng hiện tại (ví dụ: <OTRS_CUSTOMER_DATA_UserFirstname>)',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>).' =>
            'Các tùy chọn của dữ liệu người dùng khách hàng hiện tại (ví dụ: <OTRS_CUSTOMER_DATA_UserFirstname>)',
        'Options of the current user who requested this action (e. g. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)' =>
            'Các tùy chọn của người dùng hiện tại yêu cầu hành động này (ví dụ: &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>)' =>
            'Các tùy chọn của người dùng hiện tại người yêu cầu hành động này (ví dụ: <OTRS_CURRENT_UserFirstname>)',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>).' =>
            'Các tùy chọn của người dùng khách hàng yêu cầu hành động này (ví dụ: <OTRS_CURRENT_UserFirstname).',
        'Options of the ticket data (e. g. &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)' =>
            'Các tùy chọn của dữ liệu thẻ (ví dụ: &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)',
        'Options of the ticket data (e. g. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Các tùy chọn của dữ liệu thẻ (ví dụ: <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'Các tùy chọn của dữ liệu thẻ (ví dụ: <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).' =>
            'Các tùy chọn của dữ liệu thẻ (ví dụ: <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).',
        'Other Options' => 'Các tùy chọn khác',
        'POP3 Account Management' => 'Quản trị tài khoản POP3',
        'Package' => 'Gói',
        'Package not correctly deployed! You should reinstall the Package again!' =>
            'Gói chưa được triển khai chính xác! Bạn nên cài đặt lại gói lần nữa!',
        'Param 1' => 'Tham số 1',
        'Param 2' => 'Tham số 2',
        'Param 3' => 'Tham số 3',
        'Param 4' => 'Tham số 4',
        'Param 5' => 'Tham số 5',
        'Param 6' => 'Tham số 6',
        'Parent-Object' => 'Đối tượng cha',
        'Password is already in use! Please use an other password!' => 'Mật khẩu đã từng được sử dụng! Hãy sử dụng một mật khẩu khác!',
        'Password is already used! Please use an other password!' => 'Mật khẩu đã từng được sử dụng! Hãy sử dụng một mật khẩu khác!',
        'Passwords doesn\'t match! Please try it again!' => 'Các mật khẩu không khớp nhau! Hãy thử lại!',
        'Pending Times' => 'Các lần treo',
        'Pending messages' => 'Các tin nhắn treo',
        'Pending type' => 'Loại treo',
        'Permission settings. You can select one or more groups to make the configurated stat visible for different agents.' =>
            'Các thiết đặt quyền. Bạn có thể lựa chọn 1 hoặc nhiều nhóm để tạo thống kê đã được cấu hình mà các nhân viên khác nhau đều có thể nhìn thấy.',
        'Permissions to change the ticket owner in this group/queue.' => 'Các quyền để thay đổi phụ trách thẻ trong nhóm/hàng đợi này.',
        'PhoneView' => 'Xem số điện thoại',
        'Please contact your admin' => 'Hãy liên hệ với quản trị hệ thống của bạn',
        'Print this ticket!' => 'In thẻ này!',
        'Prio' => 'Ưu tiên',
        'Process-Path' => 'Đường dẫn quy trình',
        'Product' => 'Sản phẩm',
        'Queue <-> Auto Responses Management' => 'Hàng đợi <-> Quản trị phản hồi tự động',
        'Queue Management' => 'Quản trị hàng đợi',
        'Realname' => 'Tên thực',
        'Rebuild' => 'Dựng lại',
        'Recipients' => 'Người nhận',
        'Reminder' => 'Nhắc nhở',
        'Reminder messages' => 'Tin nhắn nhắc nhở',
        'Reporter' => 'Người báo cáo',
        'Required Field' => 'Trường bắt buộc',
        'Response Management' => 'Quản trị phản hồi',
        'Responses <-> Attachments Management' => 'Phản hồi <-> Quản trị đính kèm',
        'Responses <-> Queue Management' => 'Phản hồi <-> Quản trị hàng đợi',
        'Return to the compose screen' => 'Trở lại màn hình soạn',
        'Role' => 'Vai trò',
        'Roles <-> Groups Management' => 'Vai trò <-> Quản trị nhóm',
        'Roles <-> Users' => 'Vai trò <-> Người dùng',
        'Roles <-> Users Management' => 'Vai trò <-> Quản trị người dùng',
        'Save Job as?' => 'Lưu công việc?',
        'Save Search-Profile as Template?' => 'Lưu hồ sơ tìm kiếm thành mẫu?',
        'Schedule' => 'Kế hoạch',
        'Search Result' => 'Kết quả tìm kiếm',
        'Search for' => 'Tìm kiếm cho',
        'Select Box' => 'Chọn ô',
        'Select Box Result' => 'Chọn ô kết quả',
        'Select Source (for add)' => 'Chọn nguồn (để thêm)',
        'Select the customeruser:service relations.' => 'Chọn mối quan hệ người dùng khách hàng:dịch vụ.',
        'Select the element, which will be used at the X-axis' => 'Chọn thành tố sử dụng trên trục X.',
        'Select the restrictions to characterise the stat' => 'Lựa chọn các giới hạn đặc trưng cho thống kê',
        'Select the role:user relations.' => 'Chọn mối quan hệ vai trò:người dùng.',
        'Select the user:group permissions.' => 'Lựa chọn người dùng: các quyền của nhóm.',
        'Select your QueueView refresh time.' => 'Hãy chọn thời gian làm mới hàng đợi của bạn.',
        'Select your default spelling dictionary.' => 'Hãy chọn từ điển chính tả mặc định của bạn.',
        'Select your frontend Charset.' => 'Hãy chọn bộ mã ký tự mặt ngoài của bạn.',
        'Select your frontend QueueView.' => 'Hãy chọn cách xem hàng đợi mặt ngoài của bạn.',
        'Select your frontend language.' => 'Hãy chọn ngôn ngữ mặt ngoài của bạn.',
        'Select your screen after creating a new ticket.' => 'Hãy lựa chọn màn hình sau khi tạo một thẻ mới.',
        'Selection needed' => 'Lựa chọn cần',
        'Send Notification' => 'Gửi thông báo',
        'Send me a notification if a customer sends a follow up and I\'m the owner of this ticket.' =>
            'Gửi thông báo cho tôi nếu có khách hàng gửi theo dõi và tôi là phụ trách của thẻ này.',
        'Send no notifications' => 'Không gửi thông báo nào',
        'Sent new password to: ' => 'Đã gửi mật khẩu mới tới: ',
        'Service-Name' => 'Tên dịch vụ',
        'Sessions' => 'Các phiên',
        'Set customer user and customer id of a ticket' => 'Thiết đặt mã khách hàng và người dùng khách hàng của thẻ',
        'Set this ticket to pending!' => 'Thiết đặt treo thẻ này!',
        'Show' => 'Hiển thị',
        'Shows the ticket history!' => 'Xem lịch sử thẻ!',
        'Site' => 'Site',
        'Solution' => 'Giải pháp',
        'Sort by' => 'Sắp xếp theo',
        'Source' => 'Nguồn',
        'Spell Check' => 'Kiểm tra chính tả',
        'Split' => 'Chia',
        'State Type' => 'Loại trạng thái',
        'Static-File' => 'File tĩnh',
        'Stats-Area' => 'Khu vực dành cho thống kê',
        'Sub-Queue of' => 'Hàng đợi con của',
        'Sub-Service of' => 'Dịch vụ con của',
        'Subscribe' => 'Xác nhận',
        'System State Management' => 'Quản trị trạng thái hệ thống',
        'System Status' => 'Trạng thái hệ thống',
        'Systemaddress' => 'Địa chỉ hệ thống',
        'Take care that you also updated the default states in you Kernel/Config.pm!' =>
            'Hãy lưu ý rằng bạn đã cập nhật các trạng thái mặc định trong Kernel/Config.pm!',
        'The message being composed has been closed.  Exiting.' => 'Tin nhắn đang soạn bị đóng. Đang thoát.',
        'These values are read-only.' => 'Giá trị này chỉ đọc',
        'These values are required.' => 'Giá trị này được yêu cầu',
        'This account exists.' => 'Tài khoản này đã tồn tại.',
        'This is useful if you want that no one can get the result of the stat or the stat isn\'t ready configurated.' =>
            'Điều này sẽ có ích nếu bạn muốn không ai có thể lấy kết quả của thống kê hoặc thống kê không sẵn sàng được cấu hình.',
        'This window must be called from compose window' => 'Cửa sổ này cần phải được gọi từ cửa sổ soạn thảo',
        'Ticket Lock' => 'Khóa thẻ',
        'Ticket Number Generator' => 'Hệ sinh số thẻ',
        'Ticket Search' => 'Tìm kiếm thẻ',
        'Ticket Status View' => 'Xem trạng thái thẻ',
        'Ticket escalation!' => 'Các thẻ tiếp tục!',
        'Ticket locked!' => 'Thẻ khóa!',
        'Ticket owner options (e. g. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)' =>
            'Các tùy chọn phụ trách thẻ (ví dụ: &lt;OTRS_OWNER_USERFIRSTNAME&gt;)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>)' => 'Các tùy chọn chủ thẻ (ví dụ <OTRS_OWNER_UserFirstname>)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>).' => 'Các tùy chọn của phụ trách thẻ (ví dụ: <OTRS_OWNER_UserFirstname>).',
        'Ticket responsible options (e. g. <OTRS_RESPONSIBLE_UserFirstname>).' =>
            'Các tùy chọn trách nhiệm thẻ (ví dụ:<OTRS_RESPONSIBLE_UserFirstname>).',
        'Ticket selected for bulk action!' => 'Thẻ đã được chọn cho lệnh lô',
        'Ticket unlock!' => 'Thẻ mở!',
        'Ticket-Area' => 'Khu vực thẻ',
        'TicketFreeFields' => 'Các trường không thẻ',
        'TicketFreeText' => 'Nội dung thẻ',
        'TicketZoom' => 'Phóng đại thẻ',
        'Tickets available' => 'Các thẻ sẵn sàng sử dụng',
        'Tickets shown' => 'Các thẻ hiển thị',
        'Timeover' => 'Hết thời gian',
        'Times' => 'Lần',
        'Title of the stat.' => 'Tiêu đề thống kê.',
        'To get the article attribute (e. g. (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).' =>
            'Lấy thuộc tính bài viết (ví dụ: (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).',
        'Top of Page' => 'Đầu trang',
        'Total hits' => 'Tổng số lượt bấm',
        'U' => 'U',
        'Unable to parse Online Repository index document!' => 'Không thể phân tách tài liệu chỉ mục Kho chứa trực tuyến!',
        'Uniq' => 'Duy nhất',
        'Unlock Tickets' => 'Các thẻ mở',
        'Unlock to give it back to the queue!' => 'Mở khóa để đưa trả về hàng đợi!',
        'Unsubscribe' => 'Không xác nhận',
        'Use utf-8 it your database supports it!' => 'Hãy dùng utf-8 nếu cơ sở dữ liệu của bạn có hỗ trợ!',
        'Useable options' => 'Các tùy chọn có thể sử dụng',
        'User Management' => 'Quản trị người dùng',
        'User will be needed to handle tickets.' => 'Người dùng sẽ cần điều khiển thẻ.',
        'User-Name' => 'Tên đăng nhập',
        'User-Number' => 'Số người dùng',
        'Users' => 'Người dùng',
        'Users <-> Groups' => 'Người dùng <-> Nhóm',
        'Users <-> Groups Management' => 'Người dùng <-> Quản trị nhóm',
        'Warning! This tickets will be removed from the database! This tickets are lost!' =>
            'Lưu ý! Các thẻ này sẽ bị gỡ bỏ khỏi cơ sở dữ liệu! Các thẻ này sẽ bị mất!',
        'Web-Installer' => 'Người cài đặt web',
        'Welcome to OTRS' => 'Chào mừng bạn đến với OTRS',
        'With an invalid stat it isn\'t feasible to generate a stat.' => 'Đối với thống kê không hợp lệ, không khả thi để sinh thống kê.',
        'With the input and select fields you can configurate the stat at your needs. Which elements of a stat you can edit depends on your stats administrator who configurated the stat.' =>
            'Với các trường đầu vào và đã chọn bạn có thể cấu hình thống kê theo yêu cầu. Với các thành tố của một thống kê bạn có thể sửa tùy theo người quản trị thống kê đó đã cấu hình',
        'Workflow Groups' => 'Các nhóm Dòng công việc',
        'Yes means, send no agent and customer notifications on changes.' =>
            'Có, nghĩa là, không gửi thông báo cho nhân viên và khách hàng nào về các thay đổi.',
        'Yes, save it with name' => 'Có, lưu với cùng một tên',
        'You got new message!' => 'Bạn có tin nhắn mới!',
        'You have to select two or more attributes from the select field!' =>
            'Bạn phải chọn 2 hay nhiều thuộc tính từ trường đã chọn!',
        'You need a email address (e. g. customer@example.com) in To:!' =>
            'Bạn cần địa chỉ email trong trường Tới (ví dụ: kunde@example.com)!',
        'You need min. one selected Ticket!' => 'Bạn cần tối thiểu 1 thẻ được chọn!',
        'You need to account time!' => 'Bạn cần tới thời gian tài khoản!',
        'You need to activate %s first to use it!' => '%s cần được kích hoạt lần đầu tiên để sử dụng!',
        'You use the DELETE option! Take care, all deleted Tickets are lost!!!' =>
            'Bạn sử dụng tùy chọn Xóa! Hãy cẩn thận, tất cả các thẻ xóa sẽ bị mất!',
        'Your email address is new' => 'Địa chỉ email của bạn là mới',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Email của bạn với số thẻ "<OTRS_TICKET>" được chuyển tới "<OTRS_BOUNCE_TO>". Hãy liên hệ với địa chỉ này để có thêm thông tin.',
        'Your own Ticket' => 'Thẻ của bạn',
        'customer realname' => 'tên thực khách hàng',
        'down' => 'xuống',
        'false' => 'Lỗi',
        'for agent firstname' => 'cho họ (tên) của nhân viên',
        'for agent lastname' => 'tên nhân viên',
        'for agent login' => 'cho nhân viên đăng nhập',
        'for agent user id' => 'đối với mã người dùng nhân viên',
        'kill all sessions' => 'xóa tất cả các phiên',
        'kill session' => 'xóa phiên',
        'modified' => 'đã chỉnh sửa',
        'new ticket' => 'thẻ mới',
        'next step' => 'bước tiếp theo',
        'not rated' => 'chưa xếp hạng',
        'not verified' => 'chưa được xác nhận',
        'read' => 'đọc',
        'send' => 'gửi',
        'sort downward' => 'sắp xếp theo hướng giảm',
        'sort upward' => 'sắp xếp theo hướng tăng',
        'tmp_lock' => 'khóa_tmp',
        'to get the first 20 character of the subject' => 'để lấy 20 ký tự đầu tiên của tiêu đề',
        'to get the first 5 lines of the email' => 'để lấy 5 dòng đầu tiên của email',
        'to get the from line of the email' => 'để lấy từ dòng email',
        'to get the realname of the sender (if given)' => 'để lấy tên thực của người gửi (nếu có)',
        'unknown' => 'chưa xác định',
        'unread' => 'chưa đọc',
        'up' => 'lên',
        'verified' => 'xác nhận',
        'x' => 'x',
        'your MySQL DB should have a root password! Default is empty!' =>
            'Cơ sở dữ liệu MySQL của bạn nên có mật khẩu gốc! Mặc định là để trống!',

    };
    # $$STOP$$
    return;
}

1;
