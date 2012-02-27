# --
# Kernel/Language/fa.pm - provides Persian language translation
# Copyright (C) 2006-2009 Amir Shams Parsa <a.parsa at gmail.com>
# Copyright (C) 2008 Hooman Mesgary <info at mesgary.com>
# Copyright (C) 2009 Afshar Mohebbi <afshar.mohebbi at gmail.com>
# --
# $Id: fa.pm,v 1.106 2012/02/27 08:26:10 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fa;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.106 $) [1];

sub Data {
    my $Self = shift;

    # $$START$$
    # Last translation file sync: 2012-02-02 17:08:24

    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D.%M.%Y %T';
    $Self->{DateFormatLong}      = '%A %D %B %T %Y';
    $Self->{DateFormatShort}     = '%D.%M.%Y';
    $Self->{DateInputFormat}     = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';

    # csv separator
    $Self->{Separator} = '';

    # TextDirection rtl or ltr
    $Self->{TextDirection} = 'rtl';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'بله',
        'No' => 'خیر',
        'yes' => 'بله',
        'no' => 'خیر',
        'Off' => 'خاموش',
        'off' => 'خاموش',
        'On' => 'روشن',
        'on' => 'روشن',
        'top' => 'بالا',
        'end' => 'پایان',
        'Done' => 'انجام شد',
        'Cancel' => 'لغو',
        'Reset' => 'ورود مجدد',
        'last' => 'آخرین',
        'before' => 'قبل از',
        'Today' => 'امروز ',
        'Tomorrow' => 'فردا ',
        'Next week' => '',
        'day' => 'روز',
        'days' => 'روز',
        'day(s)' => 'روز',
        'd' => '',
        'hour' => 'ساعت',
        'hours' => 'ساعت',
        'hour(s)' => 'ساعت',
        'Hours' => 'ساعت',
        'h' => '',
        'minute' => 'دقیقه',
        'minutes' => 'دقیقه',
        'minute(s)' => 'دقیقه',
        'Minutes' => '',
        'm' => '',
        'month' => 'ماه',
        'months' => 'ماه',
        'month(s)' => 'ماه',
        'week' => 'هفته',
        'week(s)' => 'هفته',
        'year' => 'سال',
        'years' => 'سال',
        'year(s)' => 'سال',
        'second(s)' => 'ثانیه',
        'seconds' => 'ثانیه',
        'second' => 'ثانیه',
        's' => '',
        'wrote' => 'نوشته شد',
        'Message' => 'پیام',
        'Error' => 'خطا',
        'Bug Report' => 'گزارش خطا',
        'Attention' => 'توجه',
        'Warning' => 'اخطار',
        'Module' => 'ماژول',
        'Modulefile' => 'فایل ماژول',
        'Subfunction' => 'زیر تابع',
        'Line' => 'خط',
        'Setting' => 'تنظیم',
        'Settings' => 'تنظیمات',
        'Example' => 'مثال',
        'Examples' => 'مثال',
        'valid' => 'معتبر',
        'Valid' => 'معتبر',
        'invalid' => 'غیر معتبر',
        'Invalid' => '',
        '* invalid' => 'غیر معتبر',
        'invalid-temporarily' => 'موقتا غیر معتبر',
        ' 2 minutes' => '۲ دقیقه',
        ' 5 minutes' => '۵ دقیقه',
        ' 7 minutes' => '۷ دقیقه',
        '10 minutes' => '۱۰ دقیقه',
        '15 minutes' => '۱۵ دقیقه',
        'Mr.' => 'آقای',
        'Mrs.' => 'خانم',
        'Next' => 'بعدی',
        'Back' => 'بازگشت',
        'Next...' => 'بعدی...',
        '...Back' => '...قبلی',
        '-none-' => '--',
        'none' => '--',
        'none!' => '--!',
        'none - answered' => 'هیچکدام پاسخ داده نشده',
        'please do not edit!' => 'لطفا ویرایش نکنید!',
        'Need Action' => 'نیاز به عملیات',
        'AddLink' => 'افزودن لینک',
        'Link' => 'لینک',
        'Unlink' => 'حذف لینک',
        'Linked' => 'لینک شده',
        'Link (Normal)' => 'لینک (معمولی)',
        'Link (Parent)' => 'لینک (اصلی)',
        'Link (Child)' => 'لینک (فرعی)',
        'Normal' => 'عادی',
        'Parent' => 'اصلی',
        'Child' => 'فرعی',
        'Hit' => 'بازدید',
        'Hits' => 'بازدید',
        'Text' => 'متن',
        'Standard' => 'استاندارد',
        'Lite' => 'اولیه',
        'User' => 'کاربر',
        'Username' => 'نام کاربری',
        'Language' => 'زبان',
        'Languages' => 'زبان',
        'Password' => 'رمز عبور',
        'Preferences' => 'تنظیمات',
        'Salutation' => 'عنوان',
        'Salutations' => 'عنوان',
        'Signature' => 'امضاء',
        'Signatures' => 'امضاء',
        'Customer' => 'مشترک',
        'CustomerID' => 'کد اشتراک',
        'CustomerIDs' => 'کد اشتراک',
        'customer' => 'مشترک',
        'agent' => 'کارشناس',
        'system' => 'سیستم',
        'Customer Info' => 'اطلاعات مشترک',
        'Customer Information' => 'اطلاعات مشترک',
        'Customer Company' => 'شرکت/سازمان مشترک',
        'Customer Companies' => 'شرکت/سازمان‌های مشترک',
        'Company' => 'شرکت/سازمان',
        'go!' => 'تائید!',
        'go' => 'تائید',
        'All' => 'همه',
        'all' => 'همه',
        'Sorry' => 'متاسفیم',
        'update!' => 'بروزرسانی !',
        'update' => 'بروزرسانی',
        'Update' => 'بروزرسانی',
        'Updated!' => 'به روز رسانی شد!',
        'submit!' => 'ارسال !',
        'submit' => 'ارسال',
        'Submit' => 'ارسال',
        'change!' => 'تغییر !',
        'Change' => 'تغییر',
        'change' => 'تغییر',
        'click here' => 'اینجا کلیک کنید',
        'Comment' => 'توضیح',
        'Invalid Option!' => 'انتخاب نا معتبر',
        'Invalid time!' => 'زمان نا معتبر',
        'Invalid date!' => 'تاریخ نا معتبر',
        'Name' => 'نام',
        'Group' => 'گروه',
        'Description' => 'توضیحات',
        'description' => 'توضیحات',
        'Theme' => 'طرح زمینه',
        'Created' => 'ایجاد شد',
        'Created by' => 'ایجاد شده توسط',
        'Changed' => 'تغییر یافت',
        'Changed by' => 'تغییر یافته توسط',
        'Search' => 'جستجو',
        'and' => 'و',
        'between' => 'بین',
        'Fulltext Search' => 'جستجوی متنی',
        'Data' => 'داده‌ها',
        'Options' => 'گزینه‌ها',
        'Title' => 'عنوان',
        'Item' => 'مورد',
        'Delete' => 'حذف',
        'Edit' => 'ویرایش',
        'View' => 'نمایش',
        'Number' => 'عدد',
        'System' => 'سیستم',
        'Contact' => 'تماس',
        'Contacts' => 'تماس',
        'Export' => 'خروجی به',
        'Up' => 'بالا',
        'Down' => 'پائین',
        'Add' => 'افزودن',
        'Added!' => 'اضافه شد!',
        'Category' => 'دسته بندی',
        'Viewer' => 'نمایش دهنده',
        'Expand' => 'گسترش',
        'Small' => 'کوچک',
        'Medium' => 'متوسط',
        'Large' => 'بزرگ',
        'Date picker' => 'تقویم',
        'New message' => 'پیام جدید',
        'New message!' => 'پیام جدید !',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'لطفا برای بازگشت به نمایش عادی درخواست‌ها به این درخواست پاسخ دهید!',
        'You have %s new message(s)!' => 'شما %s پیام جدید دارید !',
        'You have %s reminder ticket(s)!' => 'شما %s درخواست جهت یادآوری دارید !',
        'The recommended charset for your language is %s!' => 'Charset پیشنهادی برای زبان شما  %s است!',
        'Change your password.' => 'کلمه عبور خود را تغییر دهید.',
        'Please activate %s first!' => 'لطفا ابتدا %s را فعال نمایید.',
        'No suggestions' => 'هیچ پیشنهادی وجود ندارد',
        'Word' => 'کلمه',
        'Ignore' => 'صرف نظر',
        'replace with' => 'جایگزین کن با',
        'There is no account with that login name.' => 'نام کاربری وارد شده موجود نیست',
        'Login failed! Your user name or password was entered incorrectly.' =>
            'ورود ناموفق! نام کاربری یا کلمه عبور وارد شده اشتباه می‌باشد.',
        'There is no acount with that user name.' => 'حساب کاربری با این نام کاربری موجود نیست.',
        'Please contact your administrator' => 'لطفا با مدیر تماس بگیرید',
        'Logout' => 'خروج ',
        'Logout successful. Thank you for using OTRS!' => 'خروج از سیستم با موفقیت انجام شد . از همراهی شما متشکریم.',
        'Invalid SessionID!' => 'شناسه Session  نا معتبر!',
        'Feature not active!' => 'این ویژگی فعال نیست.',
        'Agent updated!' => 'کارشناس به روز شد!',
        'Create Database' => 'ایجاد بانک',
        'System Settings' => 'تنظیمات سیستم',
        'Mail Configuration' => 'پیکربندی پست الکترونیک',
        'Finished' => 'پایان یافت',
        'Install OTRS' => '',
        'Intro' => '',
        'License' => 'مجوز بهره برداری سیستم',
        'Database' => 'پایگاه داده',
        'Configure Mail' => '',
        'Database deleted.' => '',
        'Database setup succesful!' => '',
        'Login is needed!' => 'نیاز است به سیستم وارد شوید',
        'Password is needed!' => 'ورود رمز عبور الزامی است',
        'Take this Customer' => 'این مشترک را بگیر',
        'Take this User' => 'این کاربر را بگیر',
        'possible' => 'بله',
        'reject' => 'خیر',
        'reverse' => 'برگردان',
        'Facility' => 'سهولت',
        'Time Zone' => 'منطقه زمانی',
        'Pending till' => 'تا زمانی که',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            'برای کار با سیستم از حساب کاربری پیش‌فرض استفاده ننمایید! لطفا یک کارشناس جدید ساخته و با آن کار نمایید.',
        'Dispatching by email To: field.' => 'ارسال با پست الکترونیکی به:فیلد',
        'Dispatching by selected Queue.' => 'ارسال بوسیله لیست انتخاب شده',
        'No entry found!' => 'موردی پیدا نشد!',
        'Session has timed out. Please log in again.' => 'مهلت Session شما به اتمام رسید . لطفا مجددا وارد سیستم شوید..',
        'No Permission!' => 'دسترسی به این قسمت امکانپذیر نیست!',
        'To: (%s) replaced with database email!' => 'گیرنده: (%s) با آدرس e-mail موجود در بانک جایگزین شد!',
        'Cc: (%s) added database email!' => 'رونوشت: (%s)آدرس e-mail اضافه شد.',
        '(Click here to add)' => '(برای افزودن کلیک کنید)',
        'Preview' => 'پیش نمایش',
        'Package not correctly deployed! Please reinstall the package.' =>
            '',
        '%s is not writable!' => '%s قابل نوشتن نمی‌باشد!',
        'Cannot create %s!' => '%s نمی‌تواند ساخته شود!',
        'Check to activate this date' => '',
        'You have Out of Office enabled, would you like to disable it?' =>
            '',
        'Customer %s added' => 'مشترک %s افزوده شد',
        'Role added!' => 'نقش افزوده شد!',
        'Role updated!' => 'نقش به روزرسانی شد!',
        'Attachment added!' => 'پیوست افزوده شد!',
        'Attachment updated!' => 'پیوست به روزرسانی شد!',
        'Response added!' => 'پاسخ افزوده شد!',
        'Response updated!' => 'پاسخ به روزرسانی شد!',
        'Group updated!' => 'گروه به روزرسانی شد!',
        'Queue added!' => 'صف افزوده شد!',
        'Queue updated!' => 'صف به روزرسانی شد!',
        'State added!' => 'وضعیت افزوده شد!',
        'State updated!' => 'وضعیت به روزرسانی شد',
        'Type added!' => 'نوع افزوده شد!',
        'Type updated!' => 'نوع به روزرسانی شد!',
        'Customer updated!' => 'مشترک به روزرسانی شد!',
        'Customer company added!' => '',
        'Customer company updated!' => '',
        'Mail account added!' => '',
        'Mail account updated!' => '',
        'System e-mail address added!' => '',
        'System e-mail address updated!' => '',
        'Contract' => 'قرارداد',
        'Online Customer: %s' => 'مشترک فعال: %s',
        'Online Agent: %s' => 'کارشناس فعال: %s',
        'Calendar' => 'تقویم',
        'File' => 'فایل',
        'Filename' => 'نام فایل',
        'Type' => 'نوع',
        'Size' => 'اندازه',
        'Upload' => 'ارسال فایل',
        'Directory' => 'پوشه',
        'Signed' => 'امضاء شده',
        'Sign' => 'امضاء',
        'Crypted' => 'رمز گذاری شده',
        'Crypt' => 'رمز',
        'PGP' => '',
        'PGP Key' => 'کلید PGP',
        'PGP Keys' => 'کلیدهای PGP',
        'S/MIME' => '',
        'S/MIME Certificate' => 'گواهینامه S/MIME',
        'S/MIME Certificates' => 'گواهینامه‌های S/MIME',
        'Office' => 'محل کار',
        'Phone' => 'تلفن',
        'Fax' => 'نمابر',
        'Mobile' => 'تلفن همراه',
        'Zip' => 'کد پستی',
        'City' => 'شهر',
        'Street' => 'استان',
        'Country' => 'کشور',
        'Location' => 'موقعیت',
        'installed' => 'نصب شده',
        'uninstalled' => 'نصب نشده',
        'Security Note: You should activate %s because application is already running!' =>
            'نکته امنیتی:شما باید %s را فعال کنید زیرا نرم افزار در حال اجراست',
        'Unable to parse repository index document.' => 'ناتوانی در تجزیه کردن مستند',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            '',
        'No packages, or no new packages, found in selected repository.' =>
            '',
        'Edit the system configuration settings.' => 'ویرایش تنظیمات پیکربندی سیستم',
        'printed at' => 'چاپ شده در',
        'Loading...' => 'بارگذاری...',
        'Dear Mr. %s,' => 'جناب آقای %s',
        'Dear Mrs. %s,' => 'سرکار خانم %s',
        'Dear %s,' => '%s گرامی',
        'Hello %s,' => 'سلام %s',
        'This email address already exists. Please log in or reset your password.' =>
            'این آدرس ایمیل موجود است. لطفا یا وارد شوید و یا رمز عبور خود را مجدد وارد نمایید.',
        'New account created. Sent login information to %s. Please check your email.' =>
            'حساب کاربری جدید ساخته شد. اطلاعات ورود به %s ارسال شد. لطفا ایمیل خود را چک نمایید. ',
        'Please press Back and try again.' => 'کلید بازگشت را بزنید و دوباره سعی کنید',
        'Sent password reset instructions. Please check your email.' => 'دستورالعمل تنظیم مجدد کلمه عبور ارسال شد. لطفا ایمیل خود را چک نمایید.',
        'Sent new password to %s. Please check your email.' => 'کلمه عبور جدید به %s ارسال شد. لطفا ایمیل خود را چک نمایید.',
        'Upcoming Events' => 'رویدادهای پیش رو',
        'Event' => 'رویداد',
        'Events' => 'رویدادها',
        'Invalid Token!' => 'کد بازیابی معتبر نیست',
        'more' => 'بیشتر',
        'For more info see:' => 'برای کسب اطلاع بیشتر:',
        'Package verification failed!' => 'وارسی بسته ناموفق بود',
        'Collapse' => 'باز کردن',
        'Shown' => 'نمایش داده شده',
        'News' => 'اخبار',
        'Product News' => 'اخبار محصولات',
        'OTRS News' => 'اخبار سامانه پشتیبانی',
        '7 Day Stats' => 'گزارش ۷ روز',
        'Bold' => 'تو پر',
        'Italic' => 'کج',
        'Underline' => 'زیرخط',
        'Font Color' => 'رنگ قلم',
        'Background Color' => 'رنگ پس زمینه',
        'Remove Formatting' => 'برداشتن قالب‌بندی',
        'Show/Hide Hidden Elements' => 'نمایش/اختفای عناصر مخفی',
        'Align Left' => 'تنظیم از چپ',
        'Align Center' => 'تنظیم از وسط',
        'Align Right' => 'تنظیم از راست',
        'Justify' => 'هم تراز کردن',
        'Header' => 'سرصفحه',
        'Indent' => 'تو رفتگی',
        'Outdent' => 'بیرون آمدگی',
        'Create an Unordered List' => 'ایجاد یک لیست مرتب نشده',
        'Create an Ordered List' => 'ایجاد یک لیست مرتب شده',
        'HTML Link' => 'لینک HTML',
        'Insert Image' => 'درج تصویر',
        'CTRL' => 'CTRL',
        'SHIFT' => 'SHIFT',
        'Undo' => 'پس‌گرد',
        'Redo' => 'از نو',
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
        'Jan' => 'ژانویه',
        'Feb' => 'فوریه',
        'Mar' => 'مارس',
        'Apr' => 'آپریل',
        'May' => 'می',
        'Jun' => 'ژون',
        'Jul' => 'جولای',
        'Aug' => 'آگوست',
        'Sep' => 'سپتامبر',
        'Oct' => 'اکتبر',
        'Nov' => 'نوامبر',
        'Dec' => 'دسامبر',
        'January' => 'ژانویه',
        'February' => 'فوریه',
        'March' => 'مارس',
        'April' => 'آپریل',
        'May_long' => 'می',
        'June' => 'ژون',
        'July' => 'جولای',
        'August' => 'آگوست',
        'September' => 'سپتامبر',
        'October' => 'اکتبر',
        'November' => 'نوامبر',
        'December' => 'دسامبر',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'تنظیمات با موفقیت ثبت شد.!',
        'User Profile' => 'مشخصات کاربر',
        'Email Settings' => 'تنظیمات پست الکترونیک',
        'Other Settings' => 'تنظیمات دیگر',
        'Change Password' => 'تغیر رمز عبور',
        'Current password' => 'رمز عبور کنونی',
        'New password' => 'رمز عبور جدید',
        'Verify password' => 'تکرار رمز عبور',
        'Spelling Dictionary' => 'لغت‌نامه غلط یابی',
        'Default spelling dictionary' => 'لغت‌نامه غلط یابی پیش‌فرض',
        'Max. shown Tickets a page in Overview.' => 'حداکثر تعداد نمایش درخواست‌ها در نمای خلاصه',
        'The current password is not correct. Please try again!' => 'رمز عبور کنونی صحیح نمی‌باشد. لطفا مجددا تلاش نمایید!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'نمی‌توان کلمه عبور را به روز کرد، رمزهای عبور جدید با هم مطابقت ندارند. لطفا مجددا تلاش نمایید!',
        'Can\'t update password, it contains invalid characters!' => 'نمی‌توان کلمه عبور را به روز کرد، شامل کاراکترهای غیرمجاز می‌باشد!',
        'Can\'t update password, it must be at least %s characters long!' =>
            'نمی‌توان کلمه عبور را به روز کرد، باید حداقل شامل %s کاراکتر باشد!',
        'Can\'t update password, it must contain at least 2 lowercase  and 2 uppercase characters!' =>
            'نمی‌توان کلمه عبور را به روز کرد، باید شامل حداقل ۲ حرف کوچک و ۲ حرف بزرگ باشد!',
        'Can\'t update password, it must contain at least 1 digit!' => 'نمی‌توان کلمه عبور را به روز کرد، باید شامل حداقل یک عدد باشد!',
        'Can\'t update password, it must contain at least 2 characters!' =>
            'نمی‌توان کلمه عبور را به روز کرد، حداقل باید شامل ۲ کاراکتر باشد!',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            'نمی‌توان کلمه عبور را به روز کرد، این رمز عبور در حال حاضر استفاده می‌شود. لطفا یک مورد جدید وارد نمایید.',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'لطفا کاراکتر استفاده شده برای فایل‌های CSV را انتخاب نمایید. اگر جداکننده‌ای را انتخاب نکنید، جداکننده پیش‌فرض زبان انتخاب شده توسط شما استفاده می‌گردد.',
        'CSV Separator' => 'جداکننده CSV',

        # Template: AAAStats
        'Stat' => 'گزارش',
        'Sum' => 'جمع',
        'Please fill out the required fields!' => 'لطفا ستون‌های لازم را تکمیل نمائید',
        'Please select a file!' => 'لطفا یک فایل را انتخاب نمائید',
        'Please select an object!' => 'لطفا یک مورد را انتخاب نمائید',
        'Please select a graph size!' => 'لطفا اندازه نمودار را انتخاب نمائید',
        'Please select one element for the X-axis!' => 'لطفا محور افقی را انتخاب نمائید',
        'Please select only one element or turn off the button \'Fixed\' where the select field is marked!' =>
            'لطفا فقط یک مورد را انتخاب نمائید یا دکمه \'  ثابت شده (Fixed) \'  را جایی که ستون را علامت میزنید خاموش نمائید',
        'If you use a checkbox you have to select some attributes of the select field!' =>
            'اگر گزینه ای را استفاده میکنید باید بعضی از مشخصات آنرا نیز وارد کنید',
        'Please insert a value in the selected input field or turn off the \'Fixed\' checkbox!' =>
            'مقدار ستون را وارد نمائید و یا گزینه \'ثابت(Fixed)\'  را خاموش کنید.',
        'The selected end time is before the start time!' => 'زمان پایان انتخاب شده قبل از زمان شروع است',
        'You have to select one or more attributes from the select field!' =>
            'شما مجبور به انتخاب دست کم یکی از مشخصات ستون هستید',
        'The selected Date isn\'t valid!' => 'زمان انتخاب شده معتبر نیست',
        'Please select only one or two elements via the checkbox!' => 'یک یا دو مورد را در گزینه‌ها انتخاب نمائید',
        'If you use a time scale element you can only select one element!' =>
            'در صورتیکه از مقیاس زمان استفاده می‌کنید میتوانید فقط یک مورد را انتخاب نمائید',
        'You have an error in your time selection!' => 'خطا در انتخاب زمان',
        'Your reporting time interval is too small, please use a larger time scale!' =>
            'بازه زمانی گزارش خیلی کوتاه است',
        'The selected start time is before the allowed start time!' => 'زمان شروع انتخاب شده کمتر از حد مجاز است',
        'The selected end time is after the allowed end time!' => 'زمان پایان انتخاب شده بیشتر از حد مجاز است',
        'The selected time period is larger than the allowed time period!' =>
            'دوره زمانی انتخاب شده بزرگتر از حد مجاز است',
        'Common Specification' => 'مشخصات عمومی',
        'X-axis' => 'محور افقی',
        'Value Series' => 'لیست مقادیر',
        'Restrictions' => 'محدوده',
        'graph-lines' => 'نمودار خطی',
        'graph-bars' => 'نمودار ستونی',
        'graph-hbars' => 'نمودار ستونی - افقی',
        'graph-points' => 'نمودار نقطه ای',
        'graph-lines-points' => 'نمودار نقطه ای خطی',
        'graph-area' => 'نمودار سطحی',
        'graph-pie' => 'نمودار دایره ای',
        'extended' => 'پیشرفته',
        'Agent/Owner' => 'کارشناس/صاحب',
        'Created by Agent/Owner' => 'ایجاد شده توسط کارشناس/صاحب',
        'Created Priority' => 'اولویت ایجاد',
        'Created State' => 'وضعیت ایجاد',
        'Create Time' => 'زمان ایجاد ',
        'CustomerUserLogin' => 'نام کاربری مشترک',
        'Close Time' => 'زمان بسته شدن',
        'TicketAccumulation' => 'تجمیع درخواست',
        'Attributes to be printed' => 'خواصی که قرار است چاپ شوند',
        'Sort sequence' => 'توالی ترتیب',
        'Order by' => 'مرتب‌سازی بر اساس',
        'Limit' => 'محدوده',
        'Ticketlist' => 'لیست درخواست‌ها',
        'ascending' => 'صعودی',
        'descending' => 'نزولی',
        'First Lock' => 'قفل اول',
        'Evaluation by' => 'ارزیابی شده به وسیله',
        'Total Time' => 'کل زمان‌ها',
        'Ticket Average' => 'میانگین درخواست',
        'Ticket Min Time' => 'حداقل زمان درخواست',
        'Ticket Max Time' => 'حداکثر زمان درخواست',
        'Number of Tickets' => 'تعداد درخواست‌ها',
        'Article Average' => 'میانگین نوشته',
        'Article Min Time' => 'حداقل زمان نوشته',
        'Article Max Time' => 'حداکثر زمان نوشته',
        'Number of Articles' => 'تعداد نوشته‌ها',
        'Accounted time by Agent' => 'زمان محاسبه شده توسط کارشناس',
        'Ticket/Article Accounted Time' => 'زمان محاسبه شده برای درخواست/نوشته',
        'TicketAccountedTime' => 'زمان محاسبه شده برای درخواست',
        'Ticket Create Time' => 'زمان ایجاد درخواست',
        'Ticket Close Time' => 'زمان بسته شدن درخواست',

        # Template: AAATicket
        'Status View' => 'نمای وضعیت',
        'Bulk' => 'دسته جمعی',
        'Lock' => 'تحویل گرفتن',
        'Unlock' => 'تحویل دادن',
        'History' => 'سابقه',
        'Zoom' => 'نمایش کامل',
        'Age' => 'طول عمر درخواست',
        'Bounce' => 'ارجاع',
        'Forward' => 'ارسال به دیگری',
        'From' => 'فرستنده',
        'To' => 'گیرنده',
        'Cc' => 'رونوشت',
        'Bcc' => 'رونوشت پنهان',
        'Subject' => 'موضوع',
        'Move' => 'انتقال',
        'Queue' => 'لیست درخواست',
        'Queues' => 'لیست‌های درخواست',
        'Priority' => 'اولویت',
        'Priorities' => 'الویت‌ها',
        'Priority Update' => 'بروزرسانی اولویت',
        'Priority added!' => '',
        'Priority updated!' => '',
        'Signature added!' => '',
        'Signature updated!' => '',
        'SLA' => 'موافقت نامه مطلوبیت ارائه خدمات (SLA)',
        'Service Level Agreement' => 'توافق سطح سرویس',
        'Service Level Agreements' => 'توافقات سطح سرویس',
        'Service' => 'خدمات',
        'Services' => 'خدمات',
        'State' => 'وضعیت',
        'States' => 'وضعیت‌ها',
        'Status' => 'وضعیت',
        'Statuses' => 'وضعیت‌ها',
        'Ticket Type' => 'نوع درخواست',
        'Ticket Types' => 'انواع درخواست',
        'Compose' => 'ارسال',
        'Pending' => 'معلق',
        'Owner' => 'صاحب',
        'Owner Update' => 'بروز رسانی توسط صاحب',
        'Responsible' => 'مسئول',
        'Responsible Update' => 'بروزرسانی توسط مسئول',
        'Sender' => 'فرستنده',
        'Article' => 'نوشته',
        'Ticket' => 'درخواست‌ها',
        'Createtime' => 'زمان ایجاد ',
        'plain' => 'ساده',
        'Email' => 'ایمیل',
        'email' => 'ایمیل',
        'Close' => 'بستن',
        'Action' => 'فعالیت',
        'Attachment' => 'پیوست',
        'Attachments' => 'پیوست‌ها',
        'This message was written in a character set other than your own.' =>
            'این پیام با charset دیگری بجز charset  شما نوشته شده است.',
        'If it is not displayed correctly,' => 'اگر به درستی نمایش داده نشده است',
        'This is a' => 'این یک',
        'to open it in a new window.' => 'برای باز شدن در پنجره جدید',
        'This is a HTML email. Click here to show it.' => 'این یک نامه با فرمت HTML است برای نمایش اینجا کلیک کنید.',
        'Free Fields' => 'فیلد‌های آزاد',
        'Merge' => 'ادغام ',
        'merged' => 'ادغام شد',
        'closed successful' => 'با موفقیت بسته شد',
        'closed unsuccessful' => 'با موفقیت بسته نشد',
        'Locked Tickets Total' => 'تمامی درخواست‌های تحویل گرفته شده',
        'Locked Tickets Reminder Reached' => 'درخواست‌های تحویل گرفته شده‌ای که زمان یادآوری آن رسیده',
        'Locked Tickets New' => 'درخواست‌های تازه تحویل گرفته شده',
        'Responsible Tickets Total' => 'تمام درخواست‌های من',
        'Responsible Tickets New' => 'تمام درخواست‌های جدید من',
        'Responsible Tickets Reminder Reached' => 'درخواست‌های من که زمان یادآوری آن‌ها رسیده',
        'Watched Tickets Total' => 'تمامی درخواست‌های مشاهده شده',
        'Watched Tickets New' => 'درخواست‌های مشاهده شده جدید',
        'Watched Tickets Reminder Reached' => 'درخواست‌های مشاهده شدهکه زمان یادآوری آن رسیده',
        'All tickets' => 'همه درخواست‌ها',
        'Available tickets' => '',
        'Escalation' => '',
        'last-search' => '',
        'QueueView' => 'نمای صف درخواست',
        'Ticket Escalation View' => 'نمای درخواست‌های خیلی مهم',
        'Message from' => '',
        'End message' => '',
        'Forwarded message from' => '',
        'End forwarded message' => '',
        'new' => 'جدید',
        'open' => 'باز',
        'Open' => 'باز',
        'Open tickets' => '',
        'closed' => 'بسته شده',
        'Closed' => 'بسته شده',
        'Closed tickets' => '',
        'removed' => 'حذف شده',
        'pending reminder' => 'یادآوری حالت معلق',
        'pending auto' => 'حالت خودکار معلق',
        'pending auto close+' => 'حالت تعلیق-بستن خودکار(+)',
        'pending auto close-' => 'حالت تعلیق-بستن خودکار(-)',
        'email-external' => 'ایمیل-خارجی',
        'email-internal' => 'ایمیل-داخلی',
        'note-external' => 'یادداشت- خارجی',
        'note-internal' => 'یادداشت-داخلی',
        'note-report' => 'یادداشت-گزارش',
        'phone' => 'تلفن',
        'sms' => 'پیامک-SMS',
        'webrequest' => 'درخواست از طریق وب',
        'lock' => 'تحویل گرفته شده',
        'unlock' => 'تحویل داده شده',
        'very low' => 'خیلی پائین',
        'low' => 'پائین',
        'normal' => 'عادی',
        'high' => 'بالا',
        'very high' => 'خیلی بالا',
        '1 very low' => '۱ خیلی پائین',
        '2 low' => '۲ پائین',
        '3 normal' => '۳ عادی',
        '4 high' => '۴ بالا',
        '5 very high' => '۵ خیلی بالا',
        'auto follow up' => '',
        'auto reject' => '',
        'auto remove' => '',
        'auto reply' => '',
        'auto reply/new ticket' => '',
        'Ticket "%s" created!' => 'درخواست %s ایجاد شد !',
        'Ticket Number' => 'شماره درخواست',
        'Ticket Object' => 'موضوع درخواست',
        'No such Ticket Number "%s"! Can\'t link it!' => 'این شماره درخواست وجود ندارد "%s"! نمایش امکانپذیر نیست',
        'You don\'t have write access to this ticket.' => '',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            '',
        'Ticket selected.' => '',
        'Ticket is locked by another agent.' => '',
        'Ticket locked.' => '',
        'Don\'t show closed Tickets' => 'درخواست‌های بسته شده را نمایش نده',
        'Show closed Tickets' => 'نمایش درخواست‌های بسته',
        'New Article' => 'نوشته جدید',
        'Unread article(s) available' => 'مطالب خوانده نشده وجود دارد',
        'Remove from list of watched tickets' => 'حذف از فهرست درخواست‌های مشاهده شده',
        'Add to list of watched tickets' => 'افزودن به فهرست درخواست‌های مشاهده شده',
        'Email-Ticket' => 'درخواست با ایمیل',
        'Create new Email Ticket' => 'ایجاد درخواست با ایمیل',
        'Phone-Ticket' => 'درخواست تلفنی',
        'Search Tickets' => 'جستجو در درخواست‌ها',
        'Edit Customer Users' => 'ویرایش مشترکین',
        'Edit Customer Company' => 'ویرایش شرکت/سازمان مشترک',
        'Bulk Action' => 'اعمال کلی',
        'Bulk Actions on Tickets' => 'اعمال کلی روی درخواست‌ها',
        'Send Email and create a new Ticket' => 'ارسال ایمیل و ایجاد درخواست جدید',
        'Create new Email Ticket and send this out (Outbound)' => 'ایجاد درخواست جدید با ایمیل و ارسال - بیرونی',
        'Create new Phone Ticket (Inbound)' => 'ایجاد درخواست جدید تلفنی- داخلی',
        'Overview of all open Tickets' => 'پیش نمایش همه درخواست‌های باز',
        'Locked Tickets' => 'درخواست‌های تحویل گرفته شده',
        'My Locked Tickets' => 'درخواست‌های تحویل گرفته شده من',
        'My Watched Tickets' => 'درخواست‌های مشاهده شده من',
        'My Responsible Tickets' => 'درخواست‌های وظیفه من',
        'Watched Tickets' => 'درخواست‌های مشاهده شده',
        'Watched' => 'مشاهده شده',
        'Watch' => 'پیگیری',
        'Unwatch' => 'عدم پیگیری',
        'Lock it to work on it' => '',
        'Unlock to give it back to the queue' => '',
        'Show the ticket history' => '',
        'Print this ticket' => '',
        'Print this article' => '',
        'Split this article' => '',
        'Forward article via mail' => '',
        'Change the ticket priority' => '',
        'Change the ticket free fields!' => 'تغییر فیلدهای خالی درخواست',
        'Link this ticket to other objects' => '',
        'Change the owner for this ticket' => '',
        'Change the  customer for this ticket' => '',
        'Add a note to this ticket' => '',
        'Merge into a different ticket' => '',
        'Set this ticket to pending' => '',
        'Close this ticket' => '',
        'Look into a ticket!' => 'مشاهده درخواست',
        'Delete this ticket' => '',
        'Mark as Spam!' => 'به‌عنوان هرزنامه علامت بزن',
        'My Queues' => 'لیست درخواست‌های من',
        'Shown Tickets' => 'درخواست‌های نمایش داده شده',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Email شما با شماره درخواست  "<OTRS_TICKET>" با درخواست "<OTRS_MERGE_TO_TICKET>"  ادغام گردید.',
        'Ticket %s: first response time is over (%s)!' => ' زمان اولین پاسخ برای درخواست %s: %s ',
        'Ticket %s: first response time will be over in %s!' => 'زمان اولین پاسخ به درخواست %s ،  %sخواهد بود.',
        'Ticket %s: update time is over (%s)!' => 'زمان بروزرسانی درخواست %s: %s',
        'Ticket %s: update time will be over in %s!' => 'زمان بروزرسانی درخواست %s ، %s خواهد بود',
        'Ticket %s: solution time is over (%s)!' => 'زمان ارائه راهکار برای درخواست %s : %s ',
        'Ticket %s: solution time will be over in %s!' => ' زمان ارائه راهکار برای درخواست %s ، %s خواهد بود ',
        'There are more escalated tickets!' => 'درخواست‌های اولویت داده شده بیشتری وجود دارد',
        'Plain Format' => 'قالب ساده',
        'Reply All' => 'پاسخ به همه',
        'Direction' => 'جهت',
        'Agent (All with write permissions)' => 'کاربر (همه با درسترسی‌های نوشتن)',
        'Agent (Owner)' => 'کاربر (صاحب)',
        'Agent (Responsible)' => 'کاربر (مسئول)',
        'New ticket notification' => 'اعلام درخواست جدید',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'دریافت درخواست جدید را به من اطلاع بده.',
        'Send new ticket notifications' => 'ارسال اعلان‌های درخواست جدید',
        'Ticket follow up notification' => 'اعلان پیگیری درخواست',
        'Ticket lock timeout notification' => 'پایان مهلت تحویل گرفتن درخواست را به من اطلاع بده',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'اگر درخواست توسط سیستم تحویل داده شد به من اطلاع بده',
        'Send ticket lock timeout notifications' => 'ارسال اعلان‌های خاتمه زمان تحویل درخواست',
        'Ticket move notification' => 'اعلان انتقال درخواست',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'انتقال یک درخواست به لیست درخواست‌های من را اطلاع بده.',
        'Send ticket move notifications' => 'ارسال اعلان‌های انتقال درخواست',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            '',
        'Custom Queue' => 'لیست سفارشی',
        'QueueView refresh time' => 'زمان بازیابی لیست درخواست‌ها',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            'اگر مشخص شده باشد، صف درخواست به صورت خودکار پس از زمان مشخص شده مجددا بارگذاری می‌شود.',
        'Refresh QueueView after' => 'بارگذاری مجدد صف پس از',
        'Screen after new ticket' => 'وضعیت نمایش پس از دریافت درخواست جدید',
        'Show this screen after I created a new ticket' => 'این صفحه را پس از اینکه یک درخواست جدید ساختم، نمایش بده',
        'Closed Tickets' => 'درخواست بسته شده',
        'Show closed tickets.' => 'نمایش درخواست‌های بسته شده',
        'Max. shown Tickets a page in QueueView.' => 'تعداد درخواست‌ها در صفحه نمایش',
        'Ticket Overview "Small" Limit' => '',
        'Ticket limit per page for Ticket Overview "Small"' => '',
        'Ticket Overview "Medium" Limit' => '',
        'Ticket limit per page for Ticket Overview "Medium"' => '',
        'Ticket Overview "Preview" Limit' => '',
        'Ticket limit per page for Ticket Overview "Preview"' => '',
        'Ticket watch notification' => 'اعلان دیدن درخواست',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            '',
        'Send ticket watch notifications' => 'ارسال اعلان‌های مشاهده شدن درخواست',
        'Out Of Office Time' => 'زمان بیرون بودن از محل کار',
        'New Ticket' => 'درخواست جدید',
        'Create new Ticket' => 'ایجاد درخواست جدید',
        'Customer called' => 'مشترک تماس گرفته',
        'phone call' => 'تماس تلفنی',
        'Phone Call Outbound' => 'تماس تلفنی راه دور',
        'Phone Call Inbound' => '',
        'Reminder Reached' => 'زمان اعلام یک یادآوری است',
        'Reminder Tickets' => 'درخواست‌های یادآوری شده',
        'Escalated Tickets' => 'درخواست های خیلی مهم',
        'New Tickets' => 'درخواست‌های جدید',
        'Open Tickets / Need to be answered' => 'درخواست‌های باز / درخواست‌های نیازمند به پاسخ',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            'تمام درخواست‌های باز، روی این درخواست‌ها کار شده اما به یک مسئول نیاز دارند ',
        'All new tickets, these tickets have not been worked on yet' => 'تمام درخواست‌های جدید، روی این درخواست‌ها هنوز کاری انجام شده',
        'All escalated tickets' => 'تمام درخواست‌هایی که زمان پاسخگویی آن‌ها رو به پایان است',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'تمام درخواست‌هایی که برای آن‌ها یک یادآوری تنظیم شده و زمان یادآوری فرا رسیده است',
        'Archived tickets' => '',
        'Unarchived tickets' => '',
        'History::Move' => 'سابقه::انتقال',
        'History::TypeUpdate' => 'نوع بروز شده به %s (ID=%s).',
        'History::ServiceUpdate' => ' خدمات بروز شده به %s (ID=%s).',
        'History::SLAUpdate' => ' SLA بروز شده به  %s (ID=%s).',
        'History::NewTicket' => 'درخواست جدید::سابقه',
        'History::FollowUp' => 'سابقه::پیگیری',
        'History::SendAutoReject' => 'سابقه::ارسال رد کردن خودکار ',
        'History::SendAutoReply' => 'سابقه::ارسال پاسخ خودکار',
        'History::SendAutoFollowUp' => 'سابقه:: ارسال پیگیری خودکار',
        'History::Forward' => 'سابقه::ارسال به دیگری',
        'History::Bounce' => 'سابقه:: ارجاع',
        'History::SendAnswer' => 'سابقه::ارسال پاسخ',
        'History::SendAgentNotification' => 'سابقه::ارسال اعلام به کارشناس',
        'History::SendCustomerNotification' => 'سابقه::ارسال اعلام به مشترک',
        'History::EmailAgent' => 'سابقه:: نامه کارشناس',
        'History::EmailCustomer' => 'سابقه::نامه مشترک',
        'History::PhoneCallAgent' => 'سابقه::تماسهای تلفنی کارشناس',
        'History::PhoneCallCustomer' => 'سابقه:: تماسهای تلفنی مشترک',
        'History::AddNote' => 'سابقه::افزودن یادداشت',
        'History::Lock' => 'سابقه::تحویل گرفتن درخواست',
        'History::Unlock' => 'سابقه::تحویل دادن درخواست',
        'History::TimeAccounting' => 'سابقه::حساب زمان',
        'History::Remove' => 'سابقه::حذف درخواست',
        'History::CustomerUpdate' => 'سابقه::بروزرسانی مشترک',
        'History::PriorityUpdate' => 'سابقه::بروزرسانی اولویت',
        'History::OwnerUpdate' => 'سابقه::بروزرسانی صاحب درخواست',
        'History::LoopProtection' => 'سابقه::حفاظت گردشی',
        'History::Misc' => 'سابقه::سایر',
        'History::SetPendingTime' => 'سابقه::تنظیم زمان تعلیق',
        'History::StateUpdate' => 'سابقه::بروزرسانی وضعیت',
        'History::TicketDynamicFieldUpdate' => 'سابقه::بروزرسانی درخواست متنی',
        'History::WebRequestCustomer' => 'سابقه::درخواست از طریق وب توسط مشترک',
        'History::TicketLinkAdd' => 'سابقه::لینک افزودن درخواست ',
        'History::TicketLinkDelete' => 'سابقه::لینک حذف درخواست ',
        'History::Subscribe' => 'عضویت اضافه شده برای کاربر "%s".',
        'History::Unsubscribe' => 'عضویت حذف شده برای کاربر"%s".',
        'History::SystemRequest' => 'سابقه::درخواست سیستم',
        'History::ResponsibleUpdate' => 'سابقه::به روزرسانی مسئولیت',
        'History::ArchiveFlagUpdate' => '',

        # Template: AAAWeekDay
        'Sun' => 'یکشنبه',
        'Mon' => 'دوشنبه',
        'Tue' => 'سه‌شنبه',
        'Wed' => 'چهارشنبه',
        'Thu' => 'پنجشنبه',
        'Fri' => 'جمعه',
        'Sat' => 'شنبه',

        # Template: AdminAttachment
        'Attachment Management' => 'مدیریت پیوست‌ها',
        'Actions' => 'عملیات‌ها',
        'Go to overview' => 'به نمای کلی برو',
        'Add attachment' => 'افزودن پیوست',
        'List' => 'فهرست',
        'Validity' => '',
        'No data found.' => 'داده‌ای یافت نشد',
        'Download file' => 'بارگیری فایل',
        'Delete this attachment' => 'حذف این پیوست',
        'Add Attachment' => 'افزودن پیوست',
        'Edit Attachment' => 'ویرایش پیوست',
        'This field is required.' => 'این فیلد مورد نیاز است.',
        'or' => 'یا',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'مدیریت پاسخ خودکار',
        'Add auto response' => 'افزودن پاسخ خودکار',
        'Add Auto Response' => 'افزودن پاسخ خودکار',
        'Edit Auto Response' => 'ویرایش پاسخ خودکار',
        'Response' => 'پاسخ',
        'Auto response from' => 'پاسخ خودکار از طرف',
        'Reference' => 'منبع',
        'You can use the following tags' => 'شما می‌توانید از برچسب‌های زیر استفاده نمایید.',
        'To get the first 20 character of the subject.' => 'برای دریافت ۲۰ حرف اول موضوع',
        'To get the first 5 lines of the email.' => 'برای دریافت ۵ خط اول نامه',
        'To get the realname of the sender (if given).' => 'برای دریافت نام فرستنده',
        'To get the article attribute' => 'برای گرفتن ویژگی مطلب',
        ' e. g.' => 'به عنوان مثال',
        'Options of the current customer user data' => 'گزینه‌هایی از داده مشترک کنونی',
        'Ticket owner options' => 'گزینه‌های صاحب درخواست',
        'Ticket responsible options' => 'گزینه‌های مسئول درخواست',
        'Options of the current user who requested this action' => 'گزینه‌هایی از کاربر کنونی که این عملیات را درخواست کرده است',
        'Options of the ticket data' => 'گزینه‌هایی از داده‌های درخواست',
        'Config options' => 'گزینه‌های پیکربندی',
        'Example response' => 'پاسخ نمونه',

        # Template: AdminCustomerCompany
        'Customer Company Management' => 'مدیریت شرکت مشترک',
        'Wildcards like \'*\' are allowed.' => '',
        'Add customer company' => 'افزودن شرکت مشترک',
        'Please enter a search term to look for customer companies.' => 'لطفا عبارت جستجو را وارد کنید تا شرکت‌های مشترک را جستجو نمایید.',
        'Add Customer Company' => 'افزودن شرکت مشترک ',

        # Template: AdminCustomerUser
        'Customer Management' => 'مدیریت مشترک',
        'Add customer' => 'افزودن مشترک',
        'Select' => 'انتخاب',
        'Hint' => 'تذکر',
        'Customer will be needed to have a customer history and to login via customer panel.' =>
            'مشترک نیاز دارد که دارای تاریخچه مشترک باشد و از پنل مشترک وارد شود.',
        'Please enter a search term to look for customers.' => 'لطفا عبارت جستجو را وارد نمایید تا مشترکین را جستجو نمایید.',
        'Last Login' => 'آخرین ورود',
        'Add Customer' => 'افزودن مشترک',
        'Edit Customer' => 'ویرایش مشترک',
        'This field is required and needs to be a valid email address.' =>
            'این گزینه مورد نیاز است و باید یک آدرس ایمیل معتبر باشد.',
        'This email address is not allowed due to the system configuration.' =>
            'این آدرس ایمیل با توجه به پیکربندی سیستم، نامعتبر است.',
        'This email address failed MX check.' => 'این آدرس ایمیل در چک MX ناموفق بوده است.',
        'DNS problem, please check your configuration and the error log.' =>
            '',
        'The syntax of this email address is incorrect.' => 'گرامر این آدرس ایمیل نادرست می‌باشد.',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => 'مدیریت روابط مشترک-گروه',
        'Notice' => 'توجه',
        'This feature is disabled!' => 'این ویژگی غیر فعال است',
        'Just use this feature if you want to define group permissions for customers.' =>
            'فقط زمانی از این ویژگی استفاده کنید که می‌خواهید از دسترسی‌های گروه برای مشترکین استفاده نمایید.',
        'Enable it here!' => 'از اینجا فعال نمائید',
        'Search for customers.' => '',
        'Edit Customer Default Groups' => 'ویرایش گروه‌های پیش‌فرض مشترکین',
        'These groups are automatically assigned to all customers.' => 'این گروه‌ها به صورت خودکار به تمام مشترکین اعمال می‌شوند.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'شما می‌توانید این گروه‌ها را از طریق تنظیم پیکربندی "CustomerGroupAlwaysGroups" مدیریت نمایید.',
        'Filter for Groups' => 'فیلتر برای گروه‌ها',
        'Select the customer:group permissions.' => 'انتخاب دسترسی‌های مشترک:گروه',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'اگرچیزی انتخاب نشود، هیچ دسترسی در این گروه موجود نیست (درخواست‌ها برای مشترک در دسترس نیست)',
        'Search Result:' => 'نتیجه جستجو:',
        'Customers' => 'مشترکین',
        'Groups' => 'گروه‌ها',
        'No matches found.' => 'هیچ موردی یافت نشد.',
        'Change Group Relations for Customer' => 'تغییر ارتباطات گروه برای مشترک',
        'Change Customer Relations for Group' => 'تغییر ارتباطات مشترک برای گروه',
        'Toggle %s Permission for all' => 'اعمال دسترسی %s برای همه',
        'Toggle %s permission for %s' => '',
        'Customer Default Groups:' => 'گروه‌های پیش‌فرض مشترک',
        'No changes can be made to these groups.' => 'هیچ تغییری نمی‌توان به این گروه‌ها اعمال کرد.',
        'ro' => 'فقط خواندنی',
        'Read only access to the ticket in this group/queue.' => 'حق فقط خواندنی برای درخواست‌ها در این گروه /لیست.',
        'rw' => 'خواندنی و نوشتنی',
        'Full read and write access to the tickets in this group/queue.' =>
            'دسترسی کامل به درخواست‌ها در این لیست / گروه.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => 'مدیریت روابط مشترک-خدمات',
        'Edit default services' => 'ویرایش خدمات پیش‌فرض',
        'Filter for Services' => 'فیلتر برای خدمات',
        'Allocate Services to Customer' => 'اختصاص خدمات به مشترک',
        'Allocate Customers to Service' => 'اختصاص مشترکین به خدمت',
        'Toggle active state for all' => 'اعمال وضعیت فعال برای همه',
        'Active' => 'فعال',
        'Toggle active state for %s' => 'اعمال وضعیت فعال برای %s',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => '',
        'Add new field for object' => '',
        'To add a new field, select the field type form one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            '',
        'Dynamic Fields List' => '',
        'Dynamic fields per page' => '',
        'Label' => '',
        'Order' => 'ترتیب',
        'Object' => 'مورد',

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
        'Default value' => 'مقدار پیش‌فرض',
        'This is the default value for this field.' => '',
        'Save' => 'ذخیره',

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
        'Key' => 'کلید',
        'Value' => 'مقدار',
        'Remove value' => '',
        'Add value' => '',
        'Add Value' => '',
        'Add empty value' => '',
        'Activate this option to create an empty selectable value.' => '',
        'Translatable values' => '',
        'If you activate this option the values will be translated to the user defined language.' =>
            '',
        'Note' => 'یادداشت',
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
        'Admin Notification' => 'اعلام مدیر سیستم',
        'With this module, administrators can send messages to agents, group or role members.' =>
            'با استفاده از این ماژول، مدیران سیستم می‌توانند پیغام‌ها را به کارشناسان، گروه‌ها و یا اعضای با نقش خاص ارسال کنند.',
        'Create Administrative Message' => 'ساخت پیغام مدیریتی',
        'Your message was sent to' => 'پیغام شما ارسال شد برای',
        'Send message to users' => 'ارسال پیغام به کاربران',
        'Send message to group members' => 'ارسال پیغام به اعضای گروه',
        'Group members need to have permission' => 'اعضای گروه نیاز به داشتن دسترسی دارند',
        'Send message to role members' => 'ارسال پیغام به اعضای یک نقش',
        'Also send to customers in groups' => 'برای مشترکین عضو گروه هم ارسال شود',
        'Body' => 'متن نامه',
        'Send' => 'ارسال',

        # Template: AdminGenericAgent
        'Generic Agent' => 'کارشناس عمومی',
        'Add job' => 'افزودن کار',
        'Last run' => 'آخرین اجرا',
        'Run Now!' => 'اجرا',
        'Delete this task' => 'حذف این وظیفه',
        'Run this task' => 'اجرای این وظیفه',
        'Job Settings' => 'تنظیمات کار',
        'Job name' => 'نام کار',
        'Currently this generic agent job will not run automatically.' =>
            'این کار اتوماتیک در حال حاضر به طور خودکار انجام نخواهد شد',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'برای فعال کردن اجرای خودکار اقلا یکی از موارد دقیقه، ساعت یا روز را مقدار دهی کنید!',
        'Schedule minutes' => 'زمانبندی دقایق',
        'Schedule hours' => 'زمانبندی ساعات',
        'Schedule days' => 'زمانبندی روزها',
        'Toggle this widget' => 'اعمال این ابزارک',
        'Ticket Filter' => 'فیلتر درخواست',
        '(e. g. 10*5155 or 105658*)' => '(مثال: ۱۰*۵۱۵۵ یا ۱۰۵۶۵۸*)',
        '(e. g. 234321)' => '(مثال: ۲۳۴۳۲۱)',
        'Customer login' => 'ورود مشترک',
        '(e. g. U5150)' => '(مثال: U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'جستجوی تمام متن در مطالب (مثال: "Mar*in")',
        'Agent' => 'کارشناس',
        'Ticket lock' => 'تحویل درخواست',
        'Create times' => 'زمان‌های ساخت',
        'No create time settings.' => 'تنظیمی برای زمان ایجاد درخواست وجود ندارد',
        'Ticket created' => 'زمان ایجاد درخواست',
        'Ticket created between' => 'بازه زمانی ایجاد درخواست',
        'Change times' => '',
        'No change time settings.' => 'هیچ تنظیمی برای تغییر زمان وجود ندارد',
        'Ticket changed' => 'درخواست تغییر داده شده',
        'Ticket changed between' => 'درخواست تغییر داده شده بین',
        'Close times' => 'زمان‌های بستن',
        'No close time settings.' => 'زمان بستن تنظیم نشده است',
        'Ticket closed' => 'درخواست بسته شده',
        'Ticket closed between' => 'درخواست بسته شده بین',
        'Pending times' => 'زمان‌های تعلیق',
        'No pending time settings.' => ' تنظیمی برای زمان تعلیق درخواست وجود ندارد ',
        'Ticket pending time reached' => 'زمان سررسید تعلیق ',
        'Ticket pending time reached between' => 'بازه زمانی سررسید تعلیق',
        'Escalation times' => 'زمان‌های نهایی پاسخگویی',
        'No escalation time settings.' => 'بدون هر گونه تنظیم برای زمان ارتقای اولویت در صف',
        'Ticket escalation time reached' => 'زمان ارتقای اولویت درخواست در صف فرا رسیده است',
        'Ticket escalation time reached between' => 'زمان ارتقای اولویت در صف بین',
        'Escalation - first response time' => 'زمان نهایی پاسخ - زمان اولین پاسخگویی',
        'Ticket first response time reached' => 'زمان اولین پاسخگویی به درخواست فرا رسیده است',
        'Ticket first response time reached between' => 'زمان اولین پاسخگویی به درخواست بین',
        'Escalation - update time' => 'زمان نهایی پاسخ - زمان به‌روز رسانی',
        'Ticket update time reached' => 'زمان به‌روز رسانی درخواست فرا رسیده است',
        'Ticket update time reached between' => 'زمان به‌روز رسانی درخواست بین',
        'Escalation - solution time' => 'زمان نهایی پاسخ - زمان حل درخواست',
        'Ticket solution time reached' => 'زمان حل درخواست فرا رسیده است',
        'Ticket solution time reached between' => 'زمان حل درخواست بین',
        'Archive search option' => 'آرشیو گزینه‌های جستجو',
        'Ticket Action' => 'عملیات مربوط به درخواست',
        'Set new service' => 'تنظیم سرویس جدید',
        'Set new Service Level Agreement' => 'تنظیم توافق سطح سرویس جدید',
        'Set new priority' => 'تنظیم الویت جدید',
        'Set new queue' => 'تنظیم صف درخواست جدید',
        'Set new state' => 'تنظیم وضعیت جدید',
        'Set new agent' => 'تنظیم کارشناس جدید',
        'new owner' => 'صاحب جدید',
        'new responsible' => '',
        'Set new ticket lock' => 'تنظیم تحویل درخواست جدید',
        'New customer' => 'مشترک جدید',
        'New customer ID' => 'شناسه مشترک جدید',
        'New title' => 'عنوان جدید',
        'New type' => 'نوع جدید',
        'New Dynamic Field Values' => '',
        'Archive selected tickets' => 'آرشیو درخواست‌های انتخاب شده',
        'Add Note' => 'افزودن یادداشت',
        'Time units' => 'واحد زمان',
        ' (work units)' => '(واحد کار)',
        'Ticket Commands' => 'دستورهای درخواست',
        'Send agent/customer notifications on changes' => 'آگاه کردن کارشناس/مشتری به هنگام ایجاد تغییرات',
        'CMD' => 'CMD',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'این دستور اجرا خواهد شد. ARG[0] شماره درخواست و ARG[1] id آن خواهد بود.',
        'Delete tickets' => 'حذف درخواست‌ها',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'اخطار: تمامی درخواست‌های تاثیر یافته از پایگاه داده حذف خواهد شد و قابل بازیابی نخواهد بود!',
        'Execute Custom Module' => 'اجرای ماژول سفارشی',
        'Param %s key' => '',
        'Param %s value' => '',
        'Save Changes' => 'ذخیره‌سازی تغییرات',
        'Results' => 'نتیجه',
        '%s Tickets affected! What do you want to do?' => '%s درخواست تاثیر خواهند پذیرفت! می‌خواهید چه کاری انجام دهید؟',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'اخطار: شما از گزینه حذف استفاده کرده‌اید. تمامی درخواست‌های حذف شده از بین خواهند رفت!',
        'Edit job' => 'ویرایش کار',
        'Run job' => 'اجرای کار',
        'Affected Tickets' => 'درخواست‌های تاثیر یافته',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => '',
        'Web Services' => '',
        'Debugger' => '',
        'Go back to web service' => '',
        'Clear' => '',
        'Do you really want to clear the debug log of this web service?' =>
            '',
        'Request List' => '',
        'Time' => 'زمان',
        'Remote IP' => '',
        'Loading' => '',
        'Select a single request to see its details.' => '',
        'Filter by type' => '',
        'Filter from' => '',
        'Filter to' => '',
        'Filter by remote IP' => '',
        'Refresh' => 'بازیابی',
        'Request Details' => '',
        'An error occurred during communication.' => '',
        'Show or hide the content' => 'نمایش یا عدم نمایش محتوا',
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
        'Import' => 'ورود اطلاعات',
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
        'Version' => 'نسخه',
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
            'هشدار: اگر قبل از اعمال تغییرات مناسب در SysConfig نام گروه admin را تغییر دهید، دسترسی‌تان به بخش مدیریت سیستم از بین می‌رود! اگر چنین اتفاقی افتاد، نام آن را از طریق SQL دوباره به admin تغییر دهید.',
        'Group Management' => 'مدیریت گروه‌ها',
        'Add group' => 'افزودن گروه',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'گروه admin برای دسترسی به بخش مدیریت سیستم و گروه stats برای دسترسی به بخش گزارشات است.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'گروه‌های جدید بسازید تا دسترسی‌ها را برای گروه‌های مختلف کارشناسان مدیریت کنید (مثال: بخش خرید، بخش پشتیبانی، بخش فروش و ...)',
        'It\'s useful for ASP solutions. ' => 'این برای راه‌حل‌های ASP مفید می‌باشد.',
        'Add Group' => 'ایجاد گروه',
        'Edit Group' => 'ویرایش گروه',

        # Template: AdminLog
        'System Log' => 'وقایع ثبت شده سیستم',
        'Here you will find log information about your system.' => 'در اینجا اطلاعات ثبت شده‌ای در رابطه با سیستم پیدا خواهید کرد.',
        'Hide this message' => 'پنهان کردن این پیغام',
        'Recent Log Entries' => 'وقایع ثبت شده جدید',

        # Template: AdminMailAccount
        'Mail Account Management' => 'مدیریت حساب‌های ایمیل ',
        'Add mail account' => 'افزودن حساب ایمیل',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'همه ایمیل‌های وارده از طریق یک آدرس به لیست درخواست انتخاب شده منتقل خواهد شد !',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'درصورتیکه آدرس شما مجاز و قابل اطمینان باشد زمان دریافت در header سیستم اولویت را تعیین کرده و پیام‌ها ارسال خواهد شد',
        'Host' => 'میزبان',
        'Delete account' => 'حذف حساب',
        'Fetch mail' => 'واکشی ایمیل',
        'Add Mail Account' => 'افزودن حساب ایمیل',
        'Example: mail.example.com' => 'مثال: mail.example.com',
        'IMAP Folder' => '',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            '',
        'Trusted' => 'مجاز',
        'Dispatching' => 'توزیع',
        'Edit Mail Account' => 'ویرایش حساب ایمیل',

        # Template: AdminNavigationBar
        'Admin' => 'مدیریت سیستم',
        'Agent Management' => 'مدیریت کارشناس',
        'Queue Settings' => 'تنظیمات صف درخواست',
        'Ticket Settings' => 'تنظیمات درخواست',
        'System Administration' => 'مدیریت سیستم',

        # Template: AdminNotification
        'Notification Management' => 'مدیریت اعلان‌ها',
        'Select a different language' => '',
        'Filter for Notification' => 'فیلتر اعلان',
        'Notifications are sent to an agent or a customer.' => 'اعلام به یک کارشناس یا مشترک ارسال شد.',
        'Notification' => 'اعلان',
        'Edit Notification' => 'ویرایش اعلان',
        'e. g.' => 'به عنوان مثال',
        'Options of the current customer data' => 'گزینه‌های مربوط به اطلاعات مشترک کنونی',

        # Template: AdminNotificationEvent
        'Add notification' => 'افزودن اعلان',
        'Delete this notification' => 'حذف این اعلان',
        'Add Notification' => 'افزودن اعلان',
        'Recipient groups' => 'گروه‌های دریافت‌کننده',
        'Recipient agents' => 'کارشناسان دریافت‌کننده',
        'Recipient roles' => 'نقش‌های دریافت‌کننده',
        'Recipient email addresses' => 'آدرس‌های ایمیل دریافت‌کننده',
        'Article type' => 'نوع نوشته',
        'Only for ArticleCreate event' => 'فقط برای رویداد ArticleCreate',
        'Subject match' => 'تطبیق موضوع',
        'Body match' => 'تطبیق بدنه',
        'Include attachments to notification' => 'الحاق پیوست‌ها به اعلان',
        'Notification article type' => 'نوع نوشته اعلان',
        'Only for notifications to specified email addresses' => 'فقط برای اعلان‌ها به آدرس‌های ایمیل مشخص شده',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'برای گرفتن ۲۰ کاراکتر اول موضوع (از آخرین نوشته کارشناس).',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'برای گرفتن اولین ۵ خط بدنه (از آخرین نوشته کارشناس).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'برای گرفتن اولین ۲۰ کاراکتر موضوع (از آخرین نوشته مشتری).',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'برای گرفتن اولین ۵ خط بدنه (از آخرین نوشته مشتری).',

        # Template: AdminPGP
        'PGP Management' => 'مدیریت رمزگذاری PGP',
        'Use this feature if you want to work with PGP keys.' => 'اگر می‌خواهید با کلیدهای رمزگذاری PGP کار کنید از این ویژگی استفاده نمایید.',
        'Add PGP key' => 'افزودن کلید PGP',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'از این طریق شما می‌توانید مستقیما کلید‌های خود را درسیستم تنظیم نمائید',
        'Introduction to PGP' => 'معرفی به PGP',
        'Result' => 'نتیجه',
        'Identifier' => 'شناسه',
        'Bit' => 'Bit',
        'Fingerprint' => 'اثر انگشت',
        'Expires' => 'ابطال',
        'Delete this key' => 'حذف این کلید',
        'Add PGP Key' => 'افزودن کلید PGP',
        'PGP key' => 'کلید PGP',

        # Template: AdminPackageManager
        'Package Manager' => 'مدیریت بسته‌ها',
        'Uninstall package' => 'حذف بسته',
        'Do you really want to uninstall this package?' => 'از حذف این بسته اطمینان دارید؟',
        'Reinstall package' => 'نصب مجدد بسته',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'آیا واقعا می‌خواهید این بسته را مجددا نصب نمایید؟ تمام تغییرات دستی از بین خواهد رفت.',
        'Continue' => 'ادامه',
        'Install' => 'نصب',
        'Install Package' => 'نصب بسته',
        'Update repository information' => 'به‌روز رسانی اطلاعات مخزن',
        'Did not find a required feature? OTRS Group provides their subscription customers with exclusive Add-Ons:' =>
            '',
        'Online Repository' => 'مخزن آنلاین بسته‌ها',
        'Vendor' => 'عرضه‌کننده',
        'Module documentation' => 'مستندات ماژول',
        'Upgrade' => 'ارتقاء',
        'Local Repository' => 'مخزن محلی بسته‌ها',
        'Uninstall' => 'حذف بسته',
        'Reinstall' => 'نصب مجدد',
        'Download package' => 'دریافت بسته',
        'Rebuild package' => 'ساخت مجدد بسته',
        'Metadata' => 'ابرداده',
        'Change Log' => 'وقایع ثبت شده تغییرات',
        'Date' => 'تاریخ',
        'List of Files' => 'فهرست فایل‌ها',
        'Permission' => 'حقوق دسترسی',
        'Download' => 'دریافت',
        'Download file from package!' => 'دریافت فایل از بسته!',
        'Required' => 'الزامی',
        'PrimaryKey' => 'کلید اصلی',
        'AutoIncrement' => 'افزایشی خودکار',
        'SQL' => 'SQL',
        'File differences for file %s' => 'تفاوت‌های فایل برای فایل %s',

        # Template: AdminPerformanceLog
        'Performance Log' => 'گزارش عملکرد',
        'This feature is enabled!' => 'این ویژگی فعال است.',
        'Just use this feature if you want to log each request.' => 'این ویژگی امکان ثبت همه درخواست‌ها را می‌دهد',
        'Activating this feature might affect your system performance!' =>
            'فعال کردن این خاصیت ممکن است سیستم شما را کند سازد!',
        'Disable it here!' => 'اینجا غیر فعال نمائید',
        'Logfile too large!' => 'فایل ثبت وقایع بیش از حد بزرگ است',
        'The logfile is too large, you need to reset it' => 'فایل ثبت وقایع بیش از حد بزرگ است، نیاز دارید که مجدد آن را بسازید',
        'Overview' => 'پیش نمایش',
        'Range' => 'حدود',
        'Interface' => 'واسط',
        'Requests' => 'درخواست‌ها',
        'Min Response' => 'کمترین پاسخ',
        'Max Response' => 'بیشترین پاسخ',
        'Average Response' => 'میانگین پاسخ',
        'Period' => 'دوره',
        'Min' => 'کمترین',
        'Max' => 'بیشترین',
        'Average' => 'میانگین',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'مدیریت فیلتر پستی',
        'Add filter' => 'افزودن فیلتر',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'برای توزیع یا پالایش ایمیل‌ها وارده بر اساس هدرهای ایمیل. تطابق بر اساس عبارات منظم نیز مجاز است.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'برای انطباق اختصاصی Email از EMAILADDRESS:info@example.com در فرستنده،گیرنده و رونوشت استفاده نمائید.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'اگر از عبارات منظم استفاده می‌کنید، می‌توانید از مقدار تطابق یافته در () به عنوان [***] در عملیات Set استفاده نمایید.',
        'Delete this filter' => 'حذف این فیلتر',
        'Add PostMaster Filter' => 'افزودن فیلتر پستی',
        'Edit PostMaster Filter' => 'ویرایش فیلتر پستی',
        'Filter name' => 'نام فیلتر',
        'The name is required.' => '',
        'Stop after match' => 'توقف بعد از تطبیق',
        'Filter Condition' => 'شرط تطابق',
        'The field needs to be a valid regular expression or a literal word.' =>
            '',
        'Set Email Headers' => 'تنظیم هدرهای ایمیل',
        'The field needs to be a literal word.' => '',

        # Template: AdminPriority
        'Priority Management' => 'مدیریت اولویت‌ها',
        'Add priority' => 'افزودن الویت',
        'Add Priority' => 'افزودن اولویت',
        'Edit Priority' => 'ویرایش الویت',

        # Template: AdminQueue
        'Manage Queues' => 'مدیریت صف‌های درخواست',
        'Add queue' => 'افزودن صف درخواست',
        'Add Queue' => 'افزودن صف درخواست',
        'Edit Queue' => 'ویرایش صف درخواست',
        'Sub-queue of' => 'زیر صف مربوط به',
        'Unlock timeout' => 'مهلت تحویل دادن درخواست',
        '0 = no unlock' => '0 = تحویل داده نشود',
        'Only business hours are counted.' => ' فقط ساعات اداری محاسبه شده است ',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'اگر یک کارشناس درخواستی را تحویل بگیرد و آن را قبل از زمان خاتمه تحویل بگذرد، نبندد، درخواست از دست کارشناس خارج شده و برای کارشناسان دیگر در دسترس خواهند شد.',
        'Notify by' => 'اعلان توسط',
        '0 = no escalation' => '0 = بدون زمان پاسخگویی نهایی',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'اگر مشخصات تماس مشترک، ایمیل خارجی و یا تلفن، قبل از اینکه زمان تعریف شده در اینجا به پایان برسد، اضافه نشده باشد، درخواست به زمان نهایی پاسخ خود رسیده است.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'اگر یک مطلب افزوده شده موجود باشد، مانند یک پیگیری از طریق ایمیل یا پرتال مشتری، زمان به‌روز رسانی برای زمان نهایی پاسخگویی تنظیم مجدد می‌شود. اگر مشخصات تماس مشترک، ایمیل خارجی و یا تلفن، قبل از اینکه زمان تعریف شده در اینجا به پایان برسد، اضافه نشده باشد، درخواست به زمان نهایی پاسخ خود رسیده است.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'اگر درخواستی تنظیم نشده که قبل از زمان تعریف شده در اینجا بسته شده، زمان پاسخگویی نهایی می‌رسد.',
        'Follow up Option' => 'گزینه پیگیری',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'مشخص می‌کند که اگر پیگیری درخواست‌های بسته شده باعث باز شدن مجدد آن شود، رد شده یا به یک درخواست جدید منتهی گردد.',
        'Ticket lock after a follow up' => 'درخواست بعد از پیگیری تحویل گرفته شود',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'اگر یک درخواست بسته شده و مشترک یک پیگیری ارسال کند، درخواست تحویل صاحب قدیمی خواهد شد.',
        'System address' => 'آدرس سیستم',
        'Will be the sender address of this queue for email answers.' => 'آدرس ارسال کننده این لیست برای پاسخ به ایمیل استفاده خواهد شد.',
        'Default sign key' => 'کلید امضای پیش‌فرض',
        'The salutation for email answers.' => 'عنوان برای پاسخ‌های ایمیلی',
        'The signature for email answers.' => 'یامضاء برای پاسخ‌های ایمیل ',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => 'مدیریت روابط صف درخواست-پاسخ خودکار',
        'Filter for Queues' => 'فیلتر برای صف‌های درخواست',
        'Filter for Auto Responses' => 'فیلتر برای پاسخ‌های خودکار',
        'Auto Responses' => 'پاسخ خودکار',
        'Change Auto Response Relations for Queue' => 'تغییر روابط پاسخ خودکار برای صف درخواست',
        'settings' => 'تنظیمات',

        # Template: AdminQueueResponses
        'Manage Response-Queue Relations' => 'مدیریت روابط پاسخ-صف درخواست',
        'Filter' => 'فیلتر',
        'Filter for Responses' => 'فیلتر برای پاسخ‌ها',
        'Responses' => 'پاسخ‌ها',
        'Change Queue Relations for Response' => 'تغییر روابط صف درخواست برای پاسخ',
        'Change Response Relations for Queue' => 'تغییر روابط پاسخ برای صف درخواست',

        # Template: AdminResponse
        'Manage Responses' => 'مدیریت پاسخ‌ها',
        'Add response' => 'افزودن پاسخ',
        'A response is default text to write faster answer (with default text) to customers.' =>
            'یک پاسخ متنی است که برای تسریع در پاسخگویی به مشترکین ارسال میشود.',
        'Don\'t forget to add a new response a queue!' => 'فراموش نکنید که یک پاسخ به لیست اضافه کنید !',
        'Delete this entry' => 'حذف این ورودی',
        'Add Response' => 'افزودن پاسخ',
        'Edit Response' => 'ویرایش پاسخ',
        'The current ticket state is' => 'وضعیت فعلی درخواست',
        'Your email address is' => 'آدرس ایمیل شما:',

        # Template: AdminResponseAttachment
        'Manage Responses <-> Attachments Relations' => 'مدیریت روابط پاسخ‌ها <-> پیوست‌ها',
        'Filter for Attachments' => 'فیلتر برای پیوست‌ها',
        'Change Response Relations for Attachment' => 'تغییر روابط پاسخ برای پیوست',
        'Change Attachment Relations for Response' => 'تغییر روابط پیوست برای پاسخ',
        'Toggle active for all' => 'اعمال فعال برای همه',
        'Link %s to selected %s' => 'ارتباط %s به %s انتخاب شده',

        # Template: AdminRole
        'Role Management' => 'مدیریت نقش',
        'Add role' => 'افزودن نقش',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'یک نقش بسازید و گروه را در آن قرار دهید سپس نقش را به کاربرها اضافه کنید',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'هیچ نقشی ساخته نشده است. لطفا از کلید «افزودن» برای ساخت نقش جدید استفاده نمایید.',
        'Add Role' => 'افزودن نقش',
        'Edit Role' => 'ویرایش نقش',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => 'مدیریت روابط نقش-گروه',
        'Filter for Roles' => 'فیلتر برای نقش‌ها',
        'Roles' => 'نقش‌ها',
        'Select the role:group permissions.' => 'نقش را انتخاب کنید: دسترسی‌های گروه.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'اگر چیزی انتخاب نشود، هیچ دسترسی در این گروه وجود نخواهد داشت (درخواست‌ها برای نقش در دسترس نخواهند بود)',
        'Change Role Relations for Group' => 'تغییر روابط نقش برای گروه',
        'Change Group Relations for Role' => 'تغییر روابط گروه برای نقش',
        'Toggle %s permission for all' => 'اعمال دسترسی %s برای همه',
        'move_into' => 'انتقال به',
        'Permissions to move tickets into this group/queue.' => 'مجوز انتقال درخواست به این گروه/لیست.',
        'create' => 'ساختن',
        'Permissions to create tickets in this group/queue.' => 'مجوز ایجاد درخواست در این گروه/لیست.',
        'priority' => 'الویت',
        'Permissions to change the ticket priority in this group/queue.' =>
            'مجوز تغییر اولویت درخواست در این گروه/لیست.',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => 'مدیریت روابط کارشناس-نقش',
        'Filter for Agents' => 'فیلتر برای کارشناسان',
        'Agents' => 'کارشناسان',
        'Manage Role-Agent Relations' => 'مدیریت روابط نقش-کارشناس',
        'Change Role Relations for Agent' => 'تغییر روابط نقش برای کارشناس',
        'Change Agent Relations for Role' => 'تغییر روابط کارشناس برای نقش',

        # Template: AdminSLA
        'SLA Management' => 'مدیریت SLA',
        'Add SLA' => 'افزودن توافقنامه SLA',
        'Edit SLA' => 'ویرایش SLA',
        'Please write only numbers!' => 'لطفا فقط ارقام را بنویسید!',

        # Template: AdminSMIME
        'S/MIME Management' => 'مدیریت S/MIME',
        'Add certificate' => 'افزودن گواهینامه',
        'Add private key' => 'افزودن کلید خصوصی',
        'Filter for certificates' => '',
        'Filter for SMIME certs' => '',
        'Here you can add relations to your private certificate, these will be embedded to the SMIME signature every time you use this certificate to sign an email.' =>
            '',
        'See also' => 'همچنین ببنید',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'از این طریق شما میتوانید کلید‌های رمز خود را برای رمز گذاری نامه‌ها و پیامها به سیستم وارد نمائید',
        'Hash' => 'Hash',
        'Create' => 'ایجاد',
        'Handle related certificates' => '',
        'Delete this certificate' => 'حذف این گواهینامه',
        'Add Certificate' => 'افزودن گواهینامه',
        'Add Private Key' => 'افزودن کلید خصوصی',
        'Secret' => 'مخفی',
        'Related Certificates for' => '',
        'Delete this relation' => '',
        'Available Certificates' => '',
        'Relate this certificate' => '',

        # Template: AdminSalutation
        'Salutation Management' => 'مدیریت عنوان‌ها',
        'Add salutation' => 'افزودن عنوان',
        'Add Salutation' => 'افزودن عنوان',
        'Edit Salutation' => 'ویرایش عنوان',
        'Example salutation' => 'نمونه عنوان',

        # Template: AdminScheduler
        'This option will force Scheduler to start even if the process is still registered in the database' =>
            '',
        'Start scheduler' => '',
        'Scheduler could not be started. Check if scheduler is not running and try it again with Force Start option' =>
            '',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => 'نیاز است که حالت امن فعال شده باشد!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'حالت امن (به طور معمول) بعد از تکمیل نصب قابل تنظیم خواهد بود.',
        'Secure mode must be disabled in order to reinstall using the web-installer.' =>
            'برای باز-نصب از طریق وب باید حالت امن غیر فعال گردد',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'اگر حالت امن فعال نشده است، آن را از طریق تنظیم سیستم فعال نمایید زیرا نرم‌افزار شما در حال اجرا می‌باشد.',

        # Template: AdminSelectBox
        'SQL Box' => 'جعبه SQL',
        'Here you can enter SQL to send it directly to the application database.' =>
            'در اینجا می‌توانید کوئری SQL وارد نمایید تا آن را به صورت مستقیم به پایگاه داده برنامه بفرستید.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'گرامر نوشتاری کوئری SQL شما دارای اشتباه می‌باشد. لطفا آن را کنترل نمایید.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'حداقل یک پارامتر برای اجرا وجود ندارد. لطفا آن را کنترل نمایید.',
        'Result format' => 'قالب نتیجه',
        'Run Query' => 'اجرای کوئری',

        # Template: AdminService
        'Service Management' => 'مدیریت خدمات',
        'Add service' => 'افزودن خدمت',
        'Add Service' => 'افزودن خدمت',
        'Edit Service' => 'ویرایش خدمت',
        'Sub-service of' => 'زیرمجموعه‌ای از خدمت',

        # Template: AdminSession
        'Session Management' => 'مدیریت Session‌ها',
        'All sessions' => 'تمام sessionها',
        'Agent sessions' => 'session کارشناسان',
        'Customer sessions' => 'session مشترکین',
        'Unique agents' => 'کارشناسان یکه',
        'Unique customers' => 'مشترکین یکه',
        'Kill all sessions' => 'همه Session‌ها را از بین ببر',
        'Kill this session' => 'از بین بردن session',
        'Session' => 'Session',
        'Kill' => '',
        'Detail View for SessionID' => 'نمای جزئیات برای SessionID',

        # Template: AdminSignature
        'Signature Management' => 'مدیریت امضاء',
        'Add signature' => 'افزودن امضاء',
        'Add Signature' => 'افزودن امضاء',
        'Edit Signature' => 'ویرایش امضاء',
        'Example signature' => 'امضای نمونه',

        # Template: AdminState
        'State Management' => 'مدیریت وضعیت',
        'Add state' => 'افزودن وضعیت',
        'Please also update the states in SysConfig where needed.' => '',
        'Add State' => 'افزودن وضعیت',
        'Edit State' => 'ویرایش وضعیت',
        'State type' => 'نوع وضعیت',

        # Template: AdminSysConfig
        'SysConfig' => 'تنظیم سیستم',
        'Navigate by searching in %s settings' => 'حرکت توسط جستجو در تنظیمات %s',
        'Navigate by selecting config groups' => 'حرکت توسط انتخاب گروه‌های پیکربندی',
        'Download all system config changes' => 'دریافت تمام تغییرات پیکربندی سیستم',
        'Export settings' => 'ارسال تنظیمات',
        'Load SysConfig settings from file' => 'بارگذاری تنظیمات پیکربندی از فایل',
        'Import settings' => 'ورود تنظیمات',
        'Import Settings' => 'ورود تنظیمات',
        'Please enter a search term to look for settings.' => 'لطفا یک عبارت جستجو برای گشتن تنظیمات وارد نمایید.',
        'Subgroup' => 'زیرگروه',
        'Elements' => 'قسمت',

        # Template: AdminSysConfigEdit
        'Edit Config Settings' => 'ویرایش تنظیمات پیکربندی',
        'This config item is only available in a higher config level!' =>
            'این آیتم پیکربندی فقط در سطح بالاتر پیکربندی در دسترس است!',
        'Reset this setting' => 'تنظیم مجدد تنظیمات',
        'Error: this file could not be found.' => 'خطا: این فایل یافت نمی‌شود.',
        'Error: this directory could not be found.' => 'خطا: این دایرکتوری یافت نمی‌شود.',
        'Error: an invalid value was entered.' => 'خطا: یک مقدار نامعتبر وارد شده است.',
        'Content' => 'محتوا',
        'Remove this entry' => 'پاک کردن این ورودی',
        'Add entry' => 'افزودن ورودی',
        'Remove entry' => 'پاک کردن ورودی',
        'Add new entry' => 'افزودن ورودی جدید',
        'Create new entry' => 'ساختن ورودی جدید',
        'New group' => 'گروه جدید',
        'Group ro' => 'گروه ro',
        'Readonly group' => 'گروه فقط خواندنی',
        'New group ro' => 'گروه ro جدید',
        'Loader' => 'بارکننده',
        'File to load for this frontend module' => 'فایل برای بارگذاری این ماژول پشتی',
        'New Loader File' => 'فایل بارکننده جدید',
        'NavBarName' => 'نام میله کنترل',
        'NavBar' => 'میله کنترل',
        'LinkOption' => 'گزینه رابطه',
        'Block' => 'بسته',
        'AccessKey' => 'کلید دسترسی',
        'Add NavBar entry' => 'افزودن ورودی میله کنترل',
        'Year' => 'سال',
        'Month' => 'ماه',
        'Day' => 'روز',
        'Invalid year' => 'سال نامعتبر',
        'Invalid month' => 'ماه نامعتبر',
        'Invalid day' => 'روز نامعتبر',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'مدیریت آدرس‌های ایمیل سیستم',
        'Add system address' => 'افزودن آدرس سیستم',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'تمام ایمیل‌های وارده با این آدرس در To یا Cc به صف درخواست انتخاب شده توزیع خواهد شد.',
        'Email address' => 'آدرس ایمیل',
        'Display name' => 'نام نمایش داده شده',
        'Add System Email Address' => 'افزودن آدرس ایمیل سیستم',
        'Edit System Email Address' => 'ویرایش آدرس ایمیل سیستم',
        'The display name and email address will be shown on mail you send.' =>
            'نام نمایش داده شده و آدرس ایمیل در ایمیلی که شما می‌فرستید نمایش داده خواهد شد.',

        # Template: AdminType
        'Type Management' => 'مدیریت نوع‌ها',
        'Add ticket type' => 'افزودن نوع درخواست',
        'Add Type' => 'افزودن نوع',
        'Edit Type' => 'ویرایش درخواست',

        # Template: AdminUser
        'Add agent' => 'افزودن کارشناس',
        'Agents will be needed to handle tickets.' => 'کارشناسان نیاز دارند که به درخواست‌ها رسیدگی کنند.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'فراموش نکنید که یک کارشناس جدید را به گروه‌ها و/یا نقش‌ها بیفزایید!',
        'Please enter a search term to look for agents.' => 'لطفا یک عبارت جستجو برای گشتن کارشناسان وارد نمایید.',
        'Last login' => 'آخرین ورود',
        'Login as' => 'ورود به عنوان',
        'Switch to agent' => 'سوئیچ به کارشناس',
        'Add Agent' => 'افزودن کارشناس',
        'Edit Agent' => 'ویرایش کارشناس',
        'Firstname' => 'نام',
        'Lastname' => 'نام خانوادگی',
        'Password is required.' => 'رمز عبور الزامی است.',
        'Start' => 'شروع',
        'End' => 'پایان',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => 'مدیریت روابط کارشناس-گروه',
        'Change Group Relations for Agent' => 'تغییر روابط گروه برای کارشناس',
        'Change Agent Relations for Group' => 'تغییر روابط کارشناس برای گروه',
        'note' => 'یادداشت',
        'Permissions to add notes to tickets in this group/queue.' => 'دسترسی‌ها برای افزودن یادداشت به درخواست‌ها در این گروه/صف درخواست',
        'owner' => 'صاحب',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'دسترسی‌ها برای تغییر صاحب درخواست‌ها در این گروه/صف درخواست',

        # Template: AgentBook
        'Address Book' => 'دفترچه  آدرس و تماس‌ها',
        'Search for a customer' => 'جستجو برای مشترک',
        'Add email address %s to the To field' => 'افزودن آدرس ایمیل %s به فیلد To',
        'Add email address %s to the Cc field' => 'افزودن آدرس ایمیل %s به فیلد Cc',
        'Add email address %s to the Bcc field' => 'افزودن آدرس ایمیل %s به فیلد Bcc',
        'Apply' => 'اعمال',

        # Template: AgentCustomerSearch
        'Search Customer' => 'جستجوی مشترک',
        'Duplicated entry' => '',
        'This address already exists on the address list.' => '',

        # Template: AgentCustomerTableView

        # Template: AgentDashboard
        'Dashboard' => 'داشبورد',

        # Template: AgentDashboardCalendarOverview
        'in' => 'در',

        # Template: AgentDashboardIFrame

        # Template: AgentDashboardImage

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s موجود است.',
        'Please update now.' => 'لطفا بروزرسانی کنید.',
        'Release Note' => 'یادداشت انتشار',
        'Level' => 'سطح',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => '%s وقت پیش ارسال شد',

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
        'The ticket has been locked' => 'درخواست تحویل گرفته شده است',
        'Undo & close window' => 'عملیات را برگردان و پنجره را ببند',

        # Template: AgentInfo
        'Info' => 'اطلاعات',
        'To accept some news, a license or some changes.' => 'برای پذیرش برخی اخبار، یک گواهینامه یا برخی تغییرات.',

        # Template: AgentLinkObject
        'Link Object: %s' => 'مورد مرتبط:%s',
        'Close window' => 'بستن پنجره',
        'go to link delete screen' => 'به لینک صفحه حذف کردن برو',
        'Select Target Object' => 'آبجکت مقصد را انتخاب نمایید',
        'Link Object' => 'لینک',
        'with' => 'با',
        'Unlink Object: %s' => 'مورد نا مرتبط:%s',
        'go to link add screen' => 'به لینک صفحه افزودن برو',

        # Template: AgentNavigationBar

        # Template: AgentPreferences
        'Edit your preferences' => 'تنظیمات شخصی خودتان را ویرایش نمایید',

        # Template: AgentSpelling
        'Spell Checker' => 'غلط یاب',
        'spelling error(s)' => 'خطاهای غلط یابی',
        'Apply these changes' => 'این تغییرات را در اعمال کن',

        # Template: AgentStatsDelete
        'Delete stat' => 'گزارش حذف',
        'Stat#' => 'شماره گزارش',
        'Do you really want to delete this stat?' => 'آیا از حذف این گزارش اطمینان دارید؟',

        # Template: AgentStatsEditRestrictions
        'Step %s' => 'مرحله %s',
        'General Specifications' => 'تنظیمات عمومی',
        'Select the element that will be used at the X-axis' => 'لطفا عنصری را که در محور افقی استفاده می‌شود را انتخاب نمایید',
        'Select the elements for the value series' => 'برای لیست مقادیر گزینه مورد نظر را انتخاب نمایید',
        'Select the restrictions to characterize the stat' => 'لطفا محدودیت‌های مورد نظر را برای گزارش انتخاب نمایید',
        'Here you can make restrictions to your stat.' => 'در این قسمت میتوانید محدوده گزارش را تعیین نمایید.',
        'If you remove the hook in the "Fixed" checkbox, the agent generating the stat can change the attributes of the corresponding element.' =>
            'اگر تیک گزینه “ثابت” را بردارید با تولید آمار ویژگی موارد مرتبط با آن نیز تغییر خواهد کرد',
        'Fixed' => 'ثابت',
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'فقط یک گزینه را انتخاب نمائید و یا کلید ثابت را خاموش نمائید',
        'Absolute Period' => 'دوره قطعی',
        'Between' => 'بین',
        'Relative Period' => 'دوره نسبی',
        'The last' => 'آخرین',
        'Finish' => 'پایان',

        # Template: AgentStatsEditSpecification
        'Permissions' => 'دسترسی‌ها',
        'You can select one or more groups to define access for different agents.' =>
            'شما می‌توانید یک یا چندین گروه را برای دسترسی برای کارشناسان مختلف تعریف نمایید.',
        'Some result formats are disabled because at least one needed package is not installed.' =>
            'برخی از قالب‌های خروجی نتایج غیرفعالند زیرا حداقل یک بسته مورد نیاز نصب نشده است.',
        'Please contact your administrator.' => 'لطفا با مدیر سیستم تماس بگیرید.',
        'Graph size' => 'اندازه نمودار',
        'If you use a graph as output format you have to select at least one graph size.' =>
            'اگر از یک نمودار برای خروجی استفاده میکنید حتما اندازه آن‌را تعیین کنید.',
        'Sum rows' => 'جمع سطر‌ها',
        'Sum columns' => 'جمع ستون‌ها',
        'Use cache' => 'از cache استفاده کن',
        'Most of the stats can be cached. This will speed up the presentation of this stat.' =>
            'اغلب گزارشات میتوانند نگهداری شوند. این به سرعت تولید گزارش کمک میکند.',
        'If set to invalid end users can not generate the stat.' => 'اگر به کاربران نهایی نامعتبر تنظیم شده باشد، نمی‌توان گزارش را تولید کرد.',

        # Template: AgentStatsEditValueSeries
        'Here you can define the value series.' => 'در اینجا می‌توانید مجموعه مقادیر را تعریف کنید.',
        'You have the possibility to select one or two elements.' => 'شما این امکان را دارید که چندین عنصر را انتخاب نمایید.',
        'Then you can select the attributes of elements.' => 'سپس می‌توانید ویژگی‌های عناصر را انتخاب نمایید.',
        'Each attribute will be shown as single value series.' => 'هر ویژگی به عنوان یک مجموعه مقادیر واحد نمایش داده می‌شود.',
        'If you don\'t select any attribute all attributes of the element will be used if you generate a stat, as well as new attributes which were added since the last configuration.' =>
            'اگر هیچ ویژگی را انتخاب نکنید، تمام ویژگی‌ها استفاده می‌شوند، ویژگی‌های جدید که از آخرین پیکربندی افزوده شده‌اند نیز افزوده می‌شوند.',
        'Scale' => 'مقیاس',
        'minimal' => 'کمترین',
        'Please remember, that the scale for value series has to be larger than the scale for the X-axis (e.g. X-Axis => Month, ValueSeries => Year).' =>
            'مقیاس لیست مقادیر باید بزرگتر از مقیاس محور افقی باشد ',

        # Template: AgentStatsEditXaxis
        'Here you can define the x-axis. You can select one element via the radio button.' =>
            'در اینجا می‌توانید محور افقی را تعریف نمایید. شما می‌توانید یک عنصر را انتخا نمایید.',
        'maximal period' => 'کمترین دوره',
        'minimal scale' => 'کمترین مقیاس',

        # Template: AgentStatsImport
        'Import Stat' => 'ورود گزارش',
        'File is not a Stats config' => 'این یک فایل تنظیمات گزارش آماری نیست',
        'No File selected' => 'فایلی انتخاب نشده است',

        # Template: AgentStatsOverview
        'Stats' => 'گزارشات',

        # Template: AgentStatsPrint
        'Print' => 'چاپ',
        'No Element selected.' => 'گزینه ای انتخاب نشده است',

        # Template: AgentStatsView
        'Export config' => 'ارسال پیکربندی',
        'With the input and select fields you can influence the format and contents of the statistic.' =>
            'با ورود و انتخاب قالب‌ها، می‌توانید بر قالب و محتوای گزارش تاثیر گذارید.',
        'Exactly what fields and formats you can influence is defined by the statistic administrator.' =>
            'چه فیلدها و قالب‌های موثری توسط مدیر گزارش انتخاب شده.',
        'Stat Details' => 'جزئیات گزارش',
        'Format' => 'فرمت',
        'Graphsize' => 'نموداری',
        'Cache' => 'نگهداری',
        'Exchange Axis' => 'جابجایی محورها',
        'Configurable params of static stat' => 'پارامترهای قابل تنظیم گزارش ثابت',
        'No element selected.' => 'هیچ گزینه ای انتخاب نشده است',
        'maximal period from' => 'بیشترین دوره از',
        'to' => 'تا',

        # Template: AgentTicketActionCommon
        'Change Free Text of Ticket' => 'تغییر متن آزاد درخواست',
        'Change Owner of Ticket' => 'تغییر صاحب درخواست',
        'Close Ticket' => 'بستن درخواست',
        'Add Note to Ticket' => 'افزودن یادداشت به درخواست',
        'Set Pending' => 'ثبت تعلیق',
        'Change Priority of Ticket' => 'تغییر الویت درخواست',
        'Change Responsible of Ticket' => 'تغییر مسئول پاسخگوی درخواست',
        'Cancel & close window' => 'لغو کن و پنجره را ببند',
        'Service invalid.' => 'سرویس نامعتبر',
        'New Owner' => 'صاحب جدید',
        'Please set a new owner!' => 'لطفا یک صاحب جدید مشخص نمایید!',
        'Previous Owner' => 'صاحب قبلی',
        'Inform Agent' => 'اطلاع به کارشناس',
        'Optional' => 'اختیاری',
        'Inform involved Agents' => 'اطلاع به کارشناسان مربوطه',
        'Spell check' => 'غلط‌یابی',
        'Note type' => 'نوع یادداشت',
        'Next state' => 'وضعیت بعدی',
        'Pending date' => 'تاریخ تعلیق',
        'Date invalid!' => 'تاریخ نامعتبر!',

        # Template: AgentTicketActionPopupClose

        # Template: AgentTicketBounce
        'Bounce Ticket' => '',
        'Bounce to' => 'ارجاع شده به',
        'You need a email address.' => 'به یک آدرس ایمیل نیاز دارید',
        'Need a valid email address or don\'t use a local email address.' =>
            'به یک آدرس ایمیل معتبر نیاز دارید یا از یک آدرس ایمیل محلی استفاده نکنید.',
        'Next ticket state' => 'وضعیت بعدی درخواست',
        'Inform sender' => 'به ارسال کننده اطلاع بده',
        'Send mail!' => 'ارسال ایمیل!',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'عملیات کلی روی درخواست',
        'Send Email' => '',
        'Merge to' => 'ادغام با',
        'Invalid ticket identifier!' => 'شناسه درخواست نامعتبر',
        'Merge to oldest' => 'ترکیب با قدیمی‌ترین',
        'Link together' => 'ارتباط با یک دیگر',
        'Link to parent' => 'ارتباط به والد',
        'Unlock tickets' => 'درخواست‌های تحویل داده شده',

        # Template: AgentTicketClose

        # Template: AgentTicketCompose
        'Compose answer for ticket' => 'ارسال پاسخ برای درخواست',
        'Remove Ticket Customer' => '',
        'Please remove this entry and enter a new one with the correct value.' =>
            '',
        'Please include at least one recipient' => '',
        'Remove Cc' => '',
        'Remove Bcc' => '',
        'Address book' => 'دفترچه آدرس',
        'Pending Date' => 'مهلت تعلیق',
        'for pending* states' => 'برای حالات تعلیق',
        'Date Invalid!' => 'تاریخ نامعتبر!',

        # Template: AgentTicketCustomer
        'Change customer of ticket' => 'تغییر مشترک',
        'Customer Data' => 'اطلاعات مشترک',
        'Customer user' => 'مشترک',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => 'ساخت درخواست ایمیلی جدید',
        'From queue' => 'از صف درخواست',
        'To customer' => '',
        'Please include at least one customer for the ticket.' => '',
        'Get all' => 'گرفتن همه',

        # Template: AgentTicketEscalation

        # Template: AgentTicketForward
        'Forward ticket: %s - %s' => '',
        'Need a valid email address or don\'t use a local email address' =>
            'به یک آدرس ایمیل معتبر نیاز دارید یا از یک آدرس ایمیل محلی استفاده نکنید.',

        # Template: AgentTicketFreeText

        # Template: AgentTicketHistory
        'History of' => 'سوابق',
        'History Content' => 'محتوای سابقه',
        'Zoom view' => 'نمای کامل',

        # Template: AgentTicketMerge
        'Ticket Merge' => 'ادغام درخواست',
        'You need to use a ticket number!' => 'شما باید از شماره درخواست استفاده نمائید!',
        'A valid ticket number is required.' => 'شماره درخواست معتبر مورد نیاز است.',
        'Need a valid email address.' => 'به آدرس ایمیل معتبر نیاز است.',

        # Template: AgentTicketMove
        'Move Ticket' => 'انتقال درخواست',
        'New Queue' => 'لیست درخواست جدید',

        # Template: AgentTicketNote

        # Template: AgentTicketOverviewMedium
        'Select all' => 'انتخاب همه',
        'No ticket data found.' => 'اطلاعات درخواست یافت نشد.',
        'First Response Time' => 'زمان اولین پاسخ',
        'Service Time' => 'زمان سرویس',
        'Update Time' => 'زمان بروز رسانی',
        'Solution Time' => 'زمان ارائه راهکار',
        'Move ticket to a different queue' => 'انتقال درخواست یه صف درخواست دیگر',
        'Change queue' => 'تغییر لیست درخواست',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'تغییر گزینه‌های جستجو',
        'Tickets per page' => 'درخواست در هر صفحه',

        # Template: AgentTicketOverviewPreview
        '","26' => '',

        # Template: AgentTicketOverviewSmall
        'Escalation in' => 'بالارفتن اولویت در',
        'Locked' => 'تحویل گرفته شده',
        '","30' => '',

        # Template: AgentTicketOwner

        # Template: AgentTicketPending

        # Template: AgentTicketPhone
        'Create New Phone Ticket' => 'ساخت درخواست تلفنی جدید',
        'From customer' => 'از مشترک',
        'To queue' => 'به صف درخواست',

        # Template: AgentTicketPhoneCommon
        'Phone call' => 'تماس تلفنی',

        # Template: AgentTicketPlain
        'Email Text Plain View' => 'نمای ساده متنی ایمیل',
        'Plain' => 'ساده',
        'Download this email' => 'دریافت این ایمیل',

        # Template: AgentTicketPrint
        'Ticket-Info' => 'اطلاعات درخواست',
        'Accounted time' => 'زمان محاسبه شده',
        'Linked-Object' => 'مربوط شده',
        'by' => 'توسط',

        # Template: AgentTicketPriority

        # Template: AgentTicketQueue

        # Template: AgentTicketResponsible

        # Template: AgentTicketSearch
        'Search template' => 'الگوی جستجو',
        'Create Template' => 'ساخت قالب',
        'Create New' => 'ساخت مورد جدید',
        'Profile link' => '',
        'Save changes in template' => 'ذخیره تغییرات در قالب',
        'Add another attribute' => 'افزودن ویژگی دیگر',
        'Output' => 'نوع نتیجه',
        'Fulltext' => 'جستجوی تمام متن',
        'Remove' => 'حذف کردن',
        'Customer User Login' => 'ورود مشترک به سیستم',
        'Created in Queue' => 'ایجاد شده در صف درخواست',
        'Lock state' => 'وضعیت تحویل',
        'Watcher' => 'مشاهده‌کننده',
        'Article Create Time (before/after)' => 'زمان ساخت مطلب (قبل از/بعد از)',
        'Article Create Time (between)' => 'زمان ساخت مطلب (بین)',
        'Ticket Create Time (before/after)' => 'زمان ساخت درخواست (قبل از/بعد از)',
        'Ticket Create Time (between)' => 'زمان ساخت درخواست (بین)',
        'Ticket Change Time (before/after)' => 'زمان تغییر درخواست (قبل از/بعد از)',
        'Ticket Change Time (between)' => 'زمان تغییر درخواست (بین)',
        'Ticket Close Time (before/after)' => 'زمان بستن درخواست (قبل از/بعد از)',
        'Ticket Close Time (between)' => 'زمان بستن درخواست (بین)',
        'Archive Search' => 'جستجوی آرشیو',
        'Run search' => '',

        # Template: AgentTicketSearchOpenSearchDescriptionFulltext

        # Template: AgentTicketSearchOpenSearchDescriptionTicketNumber

        # Template: AgentTicketSearchResultPrint

        # Template: AgentTicketZoom
        'Article filter' => 'فیلتر مطلب',
        'Article Type' => 'نوع مطلب',
        'Sender Type' => 'نوع فرستنده',
        'Save filter settings as default' => 'ذخیره تنظیمات فیلتر به عنوان تنظیمات پیش فرض',
        'Ticket Information' => 'اطلاعات درخواست',
        'Linked Objects' => 'آبجکت‌های مرتبط شده',
        'Article(s)' => 'مطلب (ها)',
        'Change Queue' => 'تغییر صف درخواست',
        'Article Filter' => 'فیلتر مطلب',
        'Add Filter' => 'افزودن فیلتر',
        'Set' => 'ثبت',
        'Reset Filter' => 'تنظیم مجدد فیلتر',
        'Show one article' => 'نمایش یک مطلب',
        'Show all articles' => 'نمایش تمام مطالب',
        'Unread articles' => 'مطالب خوانده نشده',
        'No.' => '',
        'Unread Article!' => 'مطلب خوانده نشده!',
        'Incoming message' => 'پیغام وارده',
        'Outgoing message' => 'پیغام ارسالی',
        'Internal message' => 'پیغام داخلی',
        'Resize' => 'تغییر اندازه',

        # Template: AttachmentBlocker
        'To protect your privacy, active or/and remote content has blocked.' =>
            'برای حفظ حریم شخصی خود،محتوای فعال و/یا محتوای راه دور مسدود شده است.',
        'Load blocked content.' => 'بارگذاری محتوای مسدود شده.',

        # Template: Copyright

        # Template: CustomerAccept

        # Template: CustomerError
        'Traceback' => 'بازبینی',

        # Template: CustomerFooter
        'Powered by' => ' قدرت گرفته از ',
        'One or more errors occurred!' => 'یک یا جچند خطا رخ داده است!',
        'Close this dialog' => 'بستن این پنجره',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'پنجره popup نمی‌تواند باز شود. لطفا همه مسدودکننده‌های popup را برای این نرم‌افزار غیرفعال نمایید.',

        # Template: CustomerHeader

        # Template: CustomerLogin
        'Login' => 'ورود به سیستم',
        'User name' => 'نام کاربری',
        'Your user name' => 'نام کاربری شما',
        'Your password' => 'رمز عبور شما',
        'Forgot password?' => 'رمز عبور را فراموش کردید؟',
        'Log In' => 'ورود',
        'Not yet registered?' => 'هنوز ثبت نام نشده‌اید؟',
        'Sign up now' => 'اکنون عضو شوید',
        'Request new password' => 'درخواست رمز عبور جدید',
        'Your User Name' => 'نام کاربری شما',
        'A new password will be sent to your email address.' => 'رمز عبور جدید برای آدرس ایمیل شما ارسال خواهد شد.',
        'Create Account' => 'ثبت نام',
        'Please fill out this form to receive login credentials.' => '',
        'How we should address you' => 'ما چگونه شما را خطاب کنیم',
        'Your First Name' => 'نام شما',
        'Please supply a first name' => 'لطفا نام خود را وارد نمایید',
        'Your Last Name' => 'نام خانوادگی شما',
        'Please supply a last name' => 'لطفا نام خانوادگی خود را وارد نمایید',
        'Your email address (this will become your username)' => '',
        'Please supply a' => 'لطفا وارد کنید یک',

        # Template: CustomerNavigationBar
        'Edit personal preferences' => 'ویرایش تنظیمات شخصی',
        'Logout %s' => '',

        # Template: CustomerPreferences

        # Template: CustomerRichTextEditor

        # Template: CustomerTicketMessage
        'Service level agreement' => 'توافقنامه سطح سرویس',

        # Template: CustomerTicketOverview
        'Welcome!' => 'خوش آمدید',
        'Please click the button below to create your first ticket.' => 'لطفا دکمه زیر را برای ساخت اولین درخواست خود بفشارید.',
        'Create your first ticket' => 'ساخت اولین درخواست شما',

        # Template: CustomerTicketPrint
        'Ticket Print' => 'چاپ درخواست',

        # Template: CustomerTicketSearch
        'Profile' => 'مشخصات کاربری',
        'e. g. 10*5155 or 105658*' => 'به عنوان مثال 10*5155 یا 105658*',
        'Customer ID' => 'شناسه مشترک',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => 'جستجوی تمام متن درخواست‌ها (به عنوان مثال  "John*n" or "Will*")',
        'Recipient' => 'گیرنده',
        'Carbon Copy' => 'رونوشت کاربونی',
        'Time restrictions' => 'محدودیت‌های زمان',
        'No time settings' => '',
        'Only tickets created' => 'فقط درخواست‌های ساخته شده',
        'Only tickets created between' => 'فقط درخواست‌های ساخته شده بین',
        'Ticket archive system' => '',
        'Save search as template?' => '',
        'Save as Template?' => 'ذخیره به عنوان قالب؟',
        'Save as Template' => '',
        'Template Name' => 'نام قالب',
        'Pick a profile name' => '',
        'Output to' => 'خروجی به',

        # Template: CustomerTicketSearchOpenSearchDescription

        # Template: CustomerTicketSearchResultPrint

        # Template: CustomerTicketSearchResultShort
        'of' => ' از ',
        'Page' => 'صفحه',
        'Search Results for' => 'نتایج جستجو برای',
        '","18' => '',

        # Template: CustomerTicketZoom
        'Expand article' => 'گسترش مطلب',
        'Reply' => 'پاسخ',

        # Template: CustomerWarning

        # Template: Datepicker
        'Invalid date (need a future date)!' => 'تاریخ نامعتبر (نیاز به تاریخی در آینده)!',
        'Previous' => 'قبلی',
        'Sunday' => 'یکشنبه',
        'Monday' => 'دوشنبه',
        'Tuesday' => 'سه‌شنبه',
        'Wednesday' => 'چهارشنبه',
        'Thursday' => 'پنجشنبه',
        'Friday' => 'جمعه',
        'Saturday' => 'شنبه',
        'Su' => 'یک',
        'Mo' => 'دو',
        'Tu' => 'سه',
        'We' => 'چهار',
        'Th' => 'پنج',
        'Fr' => 'جمعه',
        'Sa' => 'شنبه',
        'Open date selection' => 'باز کردن انتخاب تاریخ',

        # Template: Error
        'Oops! An Error occurred.' => 'متاسفانه خطایی رخ داده است.',
        'Error Message' => 'پیغام خطا',
        'You can' => 'شما می‌توانید',
        'Send a bugreport' => 'ارسال گزارش خطا',
        'go back to the previous page' => 'به صفحه قبل برگرد',
        'Error Details' => 'جزئیات خطا',

        # Template: Footer
        'Top of page' => 'بالای صفحه',

        # Template: FooterJS
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'اگر اکنون این صفحه را ترک نمایید، تمام پنجره‌های popup باز شده نیز بسته خواهند شد!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'popup ای از این صفحه هم اکنون باز است. آیا می‌خواهید این را بسته و آن را به جایش بارگذاری نمایید؟',
        'Please enter at least one search value or * to find anything.' =>
            '',

        # Template: FooterSmall

        # Template: HTMLHead

        # Template: HTMLHeadBlockEvents

        # Template: Header
        'You are logged in as' => 'شما با این عنوان وارد شده‌اید',

        # Template: HeaderSmall

        # Template: Installer
        'JavaScript not available' => 'جاوا اسکریپت در دسترس نیست',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            'به منظور تجربه این نرم‌افزار ، نیاز دارید که جاوااسکریپت مرورگر خود را فعال نمایید.',
        'Database Settings' => 'تنظیمات پایگاه داده',
        'General Specifications and Mail Settings' => 'مشخصات عمومی و تنظیمات ایمیل',
        'Registration' => '',
        'Welcome to %s' => 'به %s خوش آمدید',
        'Web site' => 'وب سایت',
        'Database check successful.' => 'کنترل پایگاه داده با موفقیت انجام شد.',
        'Mail check successful.' => 'کنترل تنظیمات ایمیل موفقیت‌آمیز بود.',
        'Error in the mail settings. Please correct and try again.' => 'خطا در تنظیمات ایمیل. لطفا تصحیح نموده و مجددا تلاش نمایید.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => 'پیکربندی ایمیل ارسالی',
        'Outbound mail type' => 'نوع ایمیل ارسالی',
        'Select outbound mail type.' => 'نوع ایمیل ارسالی را انتخا نمایید.',
        'Outbound mail port' => 'پورت ایمیل ارسالی',
        'Select outbound mail port.' => 'پورت ایمیل ارسالی را انتخاب نمایید.',
        'SMTP host' => 'میزبان SMTP',
        'SMTP host.' => 'میزبان SMTP.',
        'SMTP authentication' => 'تصدیق SMTP',
        'Does your SMTP host need authentication?' => 'آیا میزبان SMTP شما نیاز به authentication دارد؟',
        'SMTP auth user' => 'کاربر SMTP',
        'Username for SMTP auth.' => 'نام کاربری برای تصدیق SMTP',
        'SMTP auth password' => 'رمز عبور SMTP',
        'Password for SMTP auth.' => 'رمز عبور برای تصدیق SMTP',
        'Configure Inbound Mail' => 'پیکربندی ایمیل وارده',
        'Inbound mail type' => 'نوع ایمیل وارده',
        'Select inbound mail type.' => 'نوع ایمیل وارده را انتخاب نمایید.',
        'Inbound mail host' => 'میزبان ایمیل وارده',
        'Inbound mail host.' => 'میزبان ایمیل وارده.',
        'Inbound mail user' => 'کاربر ایمیل وارده',
        'User for inbound mail.' => 'کاربر برای ایمیل وارده.',
        'Inbound mail password' => 'رمز عبور ایمیل وارده',
        'Password for inbound mail.' => 'رمز عبور برای ایمیل وارده.',
        'Result of mail configuration check' => 'نتیجه کنترل پیکربندی ایمیل',
        'Check mail configuration' => 'کنترل پیکربندی ایمیل',
        'Skip this step' => 'از این مرحله بگذر',
        'Skipping this step will automatically skip the registration of your OTRS. Are you sure you want to continue?' =>
            '',

        # Template: InstallerDBResult
        'False' => 'نادرست',

        # Template: InstallerDBStart
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty. For security reasons we do recommend setting a root password. For more information please refer to your database documentation.' =>
            'در صورتی که کاربر root در بانک اطلاعاتی رمز عبور دارد، آنرا در این قسمت وارد نمائید.برای امنیت بیشتر پیشنهاد میکنیم برای این کاربر رمز عبور وارد نمائید',
        'Currently only MySQL is supported in the web installer.' => 'هم اکنون فقط MySQL در نصب‌کننده تحت وب پشتیبانی می‌شود.',
        'If you want to install OTRS on another database type, please refer to the file README.database.' =>
            'اگر می‌خواهید که نرم‌افزار را روی نوع دیگری از پایگاه داده نصب کنید، لطفا به فایل RAEDME.database. مراجعه نمایید.',
        'Database-User' => 'نام کاربری بانک اطلاعاتی',
        'New' => 'جدید',
        'A new database user with limited rights will be created for this OTRS system.' =>
            'یک کاربر برای پایگاه داده با دسترسی‌های محدود برای این سیستم ساخته خواهند شد.',
        'default \'hot\'' => 'پیش فرض \'hot\'',
        'DB--- host' => 'میزبان--- پایگاه داده',
        'Check database settings' => 'کنترل تنظیمات پایگاه داده',
        'Result of database check' => 'نتیجه کنترل پایگاه داده',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'برای استفاده از سیستم خط زیر را در Command Prompt اجرا نمائید.',
        'Restart your webserver' => 'سرور وب خود را راه اندازی مجدد نمائید',
        'After doing so your OTRS is up and running.' => 'بعد از انجام سیستم قابل استفاده خواهد بود',
        'Start page' => 'صفحه شروع',
        'Your OTRS Team' => 'تیم نرم‌افزار',

        # Template: InstallerLicense
        'Accept license' => 'تائید مجوز بهره برداری',
        'Don\'t accept license' => 'عدم تائید مجوز بهره برداری',

        # Template: InstallerLicenseText

        # Template: InstallerRegistration
        'Organization' => 'سازمان',
        'Position' => '',
        'Complete registration and continue' => '',
        'Please fill in all fields marked as mandatory.' => '',

        # Template: InstallerSystem
        'SystemID' => 'شناسه سیستم',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'شناسه سیستم. هر شماره درخواست و هر شناسه HTTP Session شامل این شماره می‌باشد.',
        'System FQDN' => 'FQDN سیستم',
        'Fully qualified domain name of your system.' => 'FQDN سیستم شما',
        'AdminEmail' => 'ایمیل مدیر',
        'Email address of the system administrator.' => 'آدرس ایمیل مدیریت سیستم',
        'Log' => 'وقایع ثبت شده',
        'LogModule' => 'ماژول ثبت وقایع',
        'Log backend to use.' => '',
        'LogFile' => 'فایل ثبت وقایع',
        'Log file location is only needed for File-LogModule!' => 'محل فایل ثبت وقایع فقط برای File-LogModule مورد نیاز است!',
        'Webfrontend' => 'محیط کار وب',
        'Default language' => 'زبان پیش‌فرض',
        'Default language.' => 'زبان پیش‌فرض',
        'CheckMXRecord' => 'بررسی Mx Record',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'آدرس‌های ایمیل که به صورت دستی وارده شده در برابر رکوردهای MX یافت شده در DNS کنترل می‌شود. اگر DNS شما کند است و یا آدرس‌های عمومی را عبور نمی‌دهد از این گزینه استفاده نکنید.',

        # Template: LinkObject
        'Object#' => 'شماره آبجکت',
        'Add links' => 'افزودن رابطه‌ها',
        'Delete links' => 'حذف رابطه‌ها',

        # Template: Login
        'JavaScript Not Available' => 'جاوااسکریپت در دسترس نیست',
        'Browser Warning' => 'اخطار مرورگر',
        'The browser you are using is too old.' => 'مرورگری که استفاده می‌کنید خیلی قدیمی است.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            'این نرم‌افزار با تعداد زیادی از مرورگرها کار می‌کند. لطفا به یکی از آنها ارتقاء دهید.',
        'Please see the documentation or ask your admin for further information.' =>
            'لطفا مستندات را مشاهده کنید یا از مدیر سیستم برای اطلاعات بیشتر سوال بپرسید.',
        'Lost your password?' => 'رمز عبور خود را فراموش کرده اید؟',
        'Request New Password' => 'درخواست رمز عبور جدید',
        'Back to login' => 'بازگشت به صفحه ورود',

        # Template: Motd
        'Message of the Day' => 'پیام روز',

        # Template: NoPermission
        'Insufficient Rights' => 'حقوق دسترسی ناکافی',
        'Back to the previous page' => 'بازگشت به صفحه قبل',

        # Template: Notify

        # Template: Pagination
        'Show first page' => 'نمایش اولین صفحه',
        'Show previous pages' => 'نمایش صفحات قبلی',
        'Show page %s' => 'نمایش صفحه %s',
        'Show next pages' => 'نمایش صفحات بعدی',
        'Show last page' => 'نمایش آخرین صفحه',

        # Template: PictureUpload
        'Need FormID!' => 'شناسه فرم مورد نیاز است',
        'No file found!' => 'فایلی یافت نشد!',
        'The file is not an image that can be shown inline!' => 'فایل مورد نظر تصویری نیست که بتواند به صورت inline نمایش داده شود.',

        # Template: PrintFooter
        'URL' => 'مسیر',

        # Template: PrintHeader
        'printed by' => 'چاپ شده توسط  :',

        # Template: PublicDefault

        # Template: Redirect

        # Template: RichTextEditor

        # Template: SpellingInline

        # Template: Test
        'OTRS Test Page' => 'صفحه آزمایش سیستم',
        'Welcome %s' => '%s به سیستم خوش آمدید',
        'Counter' => 'شمارنده',

        # Template: Warning
        'Go back to the previous page' => 'به صفحه قبل بازگرد',

        # SysConfig
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'ماژول ACL فقط زمانی که تمام درخواست‌های فرزند بسته شده باشد، اجازه بستن درخواست‌های والد را می‌دهد. ("وضعیت" نان می‌دهد که کدام وضعیت‌ها برای درخواست والدتا زمانی که تمام درخواست‌های فرزند بسته شده است، در دسترس می‌باشد.)',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'مکانیزم چشمک زدن را برای صف درخواستی که شامل قدیمی‌ترین درخواست می‌باشد فعال می‌کند.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'ویژگی رمز عبور فراموش شده را برای کارشناسان فعال می‌کند.',
        'Activates lost password feature for customers.' => 'ویژگی رمز عبور فراموش شده را برای مشترکین فعال می‌کند.',
        'Activates support for customer groups.' => 'پشتیبانی از گروه‌های مشترکین را فعال می‌سازد.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'فیلتر مطلب را در نمای نمایش کامل برای مشخص کردن اینکه کدام مطلب نمایش داده شود، فعال می‌کند.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'پوسته‌های ظاهری را در سیستم فعال می‌کند. مقدار ۱ یعنی فعال و مقدار ۰ یعنی غیرفعال.',
        'Activates the ticket archive system search in the customer interface.' =>
            '',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'سیستم آرشیو درخواست را با انتقال برخی درخواست‌ها به خارج از ناحیه روزانه به منظور داشتن سیستمی سریع‌تر، فعال می‌کند. برای جستجوی این درخواست‌ها باید چک آرشیو در جستجوی درخواست انتخاب شده باشد.',
        'Activates time accounting.' => 'محاسبه زمان را فعال می‌کند.',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            'پسوند سال و ماه به فایل ثبت وقایع می‌افزاید. برای هر ماه یک فایل ساخته خواهد شد.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface.' =>
            'آدرس‌های ایمیل مشترکین را به صفحه ساختن درخواست در واسط کاربری مربوط به کارشناس می‌افزاید.',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی موقتی می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی دائمی می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Agent Notifications' => 'اعلان‌های کارشناس',
        'Agent interface article notification module to check PGP.' => 'ماژول اعلان مطلب برای کارشناس به جهت کنترل PGP',
        'Agent interface article notification module to check S/MIME.' =>
            'ماژول اعلان مطلب برای کارشناس به جهت کنترل S/MIME',
        'Agent interface module to access fulltext search via nav bar.' =>
            'ماژول واسط کارشناس برای دسترسی به جستجوی تمام متن از طریق میله کنترل',
        'Agent interface module to access search profiles via nav bar.' =>
            'ماژول واسط کارشناس برای دسترسی به جستجوی مشخصات کاربری از طریق میله کنترل',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'ماژول واسط کارشناس برای کنترل ایمیل‌های وارده در نمای نمایش کامل درخواست در صورتی که کلید S/MIME موجود و صحیح باشد.',
        'Agent interface notification module to check the used charset.' =>
            'ماژول اعلان به کارشناس برای کنترل charset استفاده شده.',
        'Agent interface notification module to see the number of tickets an agent is responsible for.' =>
            'ماژول اعلان برای کارشناس برای دیدن تعداد درخواست‌هایی که یک کارشناس مسئول پاسخگویی به آن است.',
        'Agent interface notification module to see the number of watched tickets.' =>
            'ماژول اعلان برای کارشناس برای دیدن درخواست‌های مشاهده شده.',
        'Agents <-> Groups' => 'کارشناسان <-> گروه‌ها',
        'Agents <-> Roles' => 'کارشناسان <-> نقش‌ها',
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
        'Attachments <-> Responses' => 'پاسخ‌ها <-> پیوست‌ها',
        'Auto Responses <-> Queues' => 'پاسخ خودکار <-> لیست درخواست',
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
        'Change password' => 'تغییر رمز عبور',
        'Change queue!' => 'تغییر صف درخواست!',
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
        'Companies' => 'سازمان‌ها',
        'Company Tickets' => 'درخواست‌های سازمانی/شرکتی',
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
        'Create and manage Service Level Agreements (SLAs).' => 'ساخت و مدیریت توافقات سطح سرویس (SLA)',
        'Create and manage agents.' => 'ساخت و مدیریت کارشناسان',
        'Create and manage attachments.' => 'ساخت و مدیریت پیوست‌ها',
        'Create and manage companies.' => 'ساخت و مدیریت سازمان‌ها',
        'Create and manage customers.' => 'ساخت و مدیریت مشترکین',
        'Create and manage dynamic fields.' => '',
        'Create and manage event based notifications.' => 'ساخت و مدیریت اعلان‌های بر مبنای رویداد',
        'Create and manage groups.' => 'ساخت و مدیریت گروه‌ها',
        'Create and manage notifications that are sent to agents.' => 'ساخت و مدیریت اعلان‌هایی که به کارشناسان فرستاده می‌شوند.',
        'Create and manage queues.' => 'ساخت و مدیریت صف‌های درخواست',
        'Create and manage response templates.' => 'ساخت و مدیریت قالب پاسخ‌ها',
        'Create and manage responses that are automatically sent.' => 'ساخت و مدیریت پاسخ‌های خودکار',
        'Create and manage roles.' => 'ساخت و مدیریت نقش‌ها',
        'Create and manage salutations.' => 'ساخت و مدیریت عناوین',
        'Create and manage services.' => 'ساخت و مدیریت خدمات',
        'Create and manage signatures.' => 'ساخت و مدیریت امضاءها',
        'Create and manage ticket priorities.' => 'ساخت و مدیریت خصوصیات درخواست',
        'Create and manage ticket states.' => 'ساخت و مدیریت وضعیت درخواست‌ها',
        'Create and manage ticket types.' => 'ساخت و مدیریت انواع درخواست',
        'Create and manage web services.' => '',
        'Create new email ticket and send this out (outbound)' => 'ساخت درخواست ایمیلی جدید و ارسال آن به خارج',
        'Create new phone ticket (inbound)' => 'ساخت درخواست تلفنی جدید (وارده)',
        'Custom text for the page shown to customers that have no tickets yet.' =>
            'متن سفارشی شده برای نمایش به مشترکین برای جاهایی که هیچ درخواستی موجود نیست.',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customers <-> Groups' => 'مشترکین <-> گروه‌ها',
        'Customers <-> Services' => 'مشترکین <-> خدمات',
        'DEPRECATED! This setting is not used any more and will be removed in a future version of OTRS.' =>
            '',
        'Data used to export the search result in CSV format.' => 'داده استفاده شده برای ارسال نتایج جستجو به قالب CSV',
        'Date / Time' => '',
        'Debugs the translation set. If this is set to "Yes" all strings (text) without translations are written to STDERR. This can be helpful when you are creating a new translation file. Otherwise, this option should remain set to "No".' =>
            '',
        'Default ACL values for ticket actions.' => 'مقادیر ACL پیش‌فرض برای عملیات‌های درخواست',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            '',
        'Default loop protection module.' => 'ماژول جلوگیری از تشکیل حلقه پیش‌فرض',
        'Default queue ID used by the system in the agent interface.' => 'شناسه پیش‌فرض صف استفاده شده برای سیستم در واسط کاربری کارشناس',
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
        'Email Addresses' => 'آدرس‌های ایمیل',
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
        'Escalation view' => 'نمای درخواست‌های خیلی مهم',
        'Event list to be displayed on GUI to trigger generic interface invokers.' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Example for dynamic dield' => '',
        'Example for dynamic field' => '',
        'Example for free text' => 'مثال برای متن آزاد',
        'Execute SQL statements.' => 'اجرای عبارات SQL',
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
        'Filter incoming emails.' => 'فیلتر ایمیل‌های ورودی',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            '',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            '',
        'Forces to unlock tickets after being moved to another queue.' =>
            '',
        'Frontend language' => 'زبان واسط',
        'Frontend module registration (disable company link if no company feature is used).' =>
            '',
        'Frontend module registration for the agent interface.' => '',
        'Frontend module registration for the customer interface.' => '',
        'Frontend theme' => 'طرح زمینه واسط',
        'GenericAgent' => 'کارشناس عمومی',
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
        'Interface language' => 'زبان واسط',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'Link agents to groups.' => 'برقراری ارتباط بین کارشناسان و گروه‌ها',
        'Link agents to roles.' => 'برقراری ارتباط بین کارشناسان و نقش‌ها',
        'Link attachments to responses templates.' => 'برقراری ارتباط بین پیوست‌ها و قالب پاسخ‌ها',
        'Link customers to groups.' => 'برقراری ارتباط بین مشترکین و گروه‌ها',
        'Link customers to services.' => 'برقراری ارتباط بین مشترکین و خدمات',
        'Link queues to auto responses.' => 'برقراری ارتباط بین صف‌های درخواست و پاسخ‌های خودکار',
        'Link responses to queues.' => 'برقراری ارتباط بین پاسخ‌ها و صف‌های درخواست',
        'Link roles to groups.' => 'برقراری ارتباط بین نقش‌ها و گروه‌ها',
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
        'Log file for the ticket counter.' => 'فایل ثبت وقایع برای شمارنده درخواست',
        'Mail Accounts' => '',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            '',
        'Makes the application check the syntax of email addresses.' => '',
        'Makes the picture transparent.' => '',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            '',
        'Manage PGP keys for email encryption.' => 'مدیریت کلیدهای PGP برای رمزنگاری ایمیل',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'مدیریت حساب‌های POP3 و IMAP برای واکشی ایمیل‌ها',
        'Manage S/MIME certificates for email encryption.' => 'مدیریت گواهینامه‌ها برای رمزنگاری ایمیل‌ها',
        'Manage existing sessions.' => 'مدیریت session های موجود',
        'Manage periodic tasks.' => 'مدیریت وظایف دوره‌ای',
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
        'My Tickets' => 'درخواست‌های من',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            '',
        'New email ticket' => 'درخواست ایمیلی جدید',
        'New phone ticket' => 'درخواست تلفنی جدید',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Notifications (Event)' => 'اعلام -رویداد',
        'Number of displayed tickets' => 'تعداد درخواست‌های نمایش داده شده',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            '',
        'Open tickets of customer' => '',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            '',
        'Overview Escalated Tickets' => 'نمایی کلی از درخواست‌هایی که زمان پاسخگویی به آن‌ها رو به پایا ن است',
        'Overview Refresh Time' => '',
        'Overview of all open Tickets.' => 'نمایی کلی از تمام درخواست‌های باز',
        'PGP Key Management' => '',
        'PGP Key Upload' => 'ارسال کلید PGP',
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
        'PostMaster Filters' => 'فیلترهای پستی',
        'PostMaster Mail Accounts' => 'حساب‌های ایمیل پستی',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see http://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            '',
        'Queue view' => 'نمای صف درخواست',
        'Refresh Overviews after' => '',
        'Refresh interval' => 'بارگذاری مجدد ورودی',
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
        'Responses <-> Queues' => 'پاسخ <-> لیست درخواست',
        'Restores a ticket from the archive (only if the event is a state change, from closed to any open available state).' =>
            '',
        'Roles <-> Groups' => 'نقش <-> گروه',
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
        'Select your frontend Theme.' => 'الگوی نمایش سیستم را انتخاب نمائید',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            '',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            '',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            'در صورتی‌که مشترک یک پیگیری ارسال کرد و من صاحب درخواست بودم یا درخواست تحویل داده شده و در یکی از صف‌هایی است که من عضو آن هستم، اعلانی برای من ارسال کن.',
        'Send notifications to users.' => 'ارسال اعلان‌ها به کاربران',
        'Send ticket follow up notifications' => 'ارسال اعلان‌های پیگیری درخواست',
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
        'Set sender email addresses for this system.' => 'تنظیم آدرس ایمیل‌های ارسال‌کننده برای این سیستم',
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
        'Skin' => 'پوسته',
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
        'Statistics' => 'گزارشات',
        'Status view' => 'نمای وضعیت',
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
        'Ticket overview' => 'نمای کلی درخواست',
        'Tickets' => 'درخواست‌ها',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            '',
        'Toolbar Item for a shortcut.' => '',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            '',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            '',
        'Types' => 'انواع',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            '',
        'Update and extend your system with software packages.' => 'به روزرسانی و گسترش سیستم به کمک بسته‌های نرم‌افزاری',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            '',
        'Updates the ticket index accelerator.' => '',
        'Uses Cc recipients in reply Cc list on compose an email answer in the ticket compose screen of the agent interface.' =>
            '',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard responses, auto responses and notifications.' =>
            '',
        'View performance benchmark results.' => 'نمایش نتایج آزمون کارایی',
        'View system log messages.' => 'نمایش پیغام‌های ثبت وقایع سیستم',
        'Wear this frontend skin' => 'اعمال این پسته واسط',
        'Webservice path separator.' => '',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. In this text area you can define this text (This text cannot be changed by the agent).' =>
            '',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            '',
        'Your language' => 'زبان شما',
        'Your queue selection of your favorite queues. You also get notified about those queues via email if enabled.' =>
            'شما از طریق ایمیل از وضعیت لیست خود مطلع خواهید شد - در صورتیکه این گزینه در سیستم فعال باشد',

        #
        # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
        #
        '"}' => '{',
        '%s Tickets affected! Do you really want to use this job?' => '%s درخواست مطابقت دارد.آیا واقعا قصد اجرای این کار را دارید؟',
        '(Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behinde a dial-up line $!)' =>
            '(با ارسال یک نامه پست‌های الکترونیکی و تنظیمات آن را بررسی میکند)',
        '(Email of the system admin)' => '(Email مدیر سیستم)',
        '(Full qualified domain name of your system)' => '(نام کامل سیستم همراه دامنه)',
        '(Logfile just needed for File-LogModule!)' => '(این فایل مورد نیاز ماژول گزارش است!)',
        '(Note: It depends on your installation how many dynamic objects you can use)' =>
            'بستگی به نصب شما دارد که چه تعداد موارد متغیر میتوانید استفاده کنید ',
        '(Note: Useful for big databases and low performance server)' => '(مناسب برای بانکهای اطلاعاتی بزرگ و سرور‌های کوچک)',
        '(The identify of the system. Each ticket number and each http session id starts with this number)' =>
            '(همه درخواست‌ها و Session‌ها با این شناسه شروع خواهند شد)',
        '(Ticket identifier. Some people want toset this to e. g. \'Ticket#\', \'Call#\' or \'MyTicket#\')' =>
            '(مشخصه درخواست‌ها. اکثر کاربران مایلنداز این ترکیب استفاده کنند مثال: \'شماره درخواست\', \'شماره تماس#\' یا \'نام دلخواه #\')',
        '(Used default language)' => '(زبان پیش فرض)',
        '(Used log backend)' => '(نگهداری گزارش استفاده)',
        '(Used ticket number format)' => '(فرمت شماره درخواست)',
        'A article should have a title!' => 'یک نوشته باید دارای عنوان باشد',
        'A message must be spell checked!' => 'پیام باید غلط یابی شده باشد!',
        'A message should have a To: recipient!' => 'آدرس گیرنده پیام مشخص نشده است!',
        'A message should have a body!' => 'پیام میبایست دارای متن باشد !',
        'A message should have a subject!' => 'یک پیام میبایست دارای عنوان باشد',
        'A required field is:' => 'یک فیلد مورد نیاز:',
        'A web calendar' => 'یک تقویم تحت وب',
        'A web file manager' => 'یک محیط مدیریت فایل تحت وب',
        'A web mail client' => 'یک محیط پست الکترونیکی',
        'Absolut Period' => 'دوره مطلق',
        'Activates TypeAhead for the autocomplete feature, that enables users to type in whatever speed they desire, without losing any information. Often this means that keystrokes entered will not be displayed on the screen immediately.' =>
            'برای ویژگی کامل‌کننده خودکار، TypeAhead را فعال نمایید. این قابلیت این امکان را می‌دهد که با هر سرعتی که می‌خواهید تایپ کنید و نتیجه خروجی پیشنهادی را ببینید.',
        'Add Customer User' => 'افزودن کاربر مشترک',
        'Add System Address' => 'افزودن آدرس سیستم',
        'Add User' => 'افزودن کاربر',
        'Add a new Agent.' => 'افزودن کاربر جدید',
        'Add a new Customer Company.' => 'افزودن شرکت جدید ',
        'Add a new Group.' => 'ایجاد گروه جدید',
        'Add a new Notification.' => 'اضافه کردن یک هشدارنامه جدید',
        'Add a new Priority.' => 'افزودن اولویت جدید',
        'Add a new Role.' => 'افزودن نقش جدید',
        'Add a new SLA.' => 'افزودن توافقنامه SLA جدید',
        'Add a new Salutation.' => 'افزودن عنوان جدید',
        'Add a new Service.' => 'افزودن خدمت جدید',
        'Add a new Signature.' => 'افزودن امضای جدید',
        'Add a new State.' => 'افزودن وضعیت جدید',
        'Add a new System Address.' => ' افزودن آدرس سیستم  جدید',
        'Add a new Type.' => 'افزودن نوع جدید',
        'Add a note to this ticket!' => 'افزودن یادداشت به درخواست',
        'Add note to ticket' => 'افزودن یادداشت به درخواست',
        'Added User "%s"' => 'کاربر اضافه شده "%s"',
        'Adds the one time vacation days for the calendar number 1. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی موقتی به تقویم شماره ۱ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the one time vacation days for the calendar number 2. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی موقتی به تقویم شماره ۲ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the one time vacation days for the calendar number 3. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی موقتی به تقویم شماره ۳ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the one time vacation days for the calendar number 4. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی موقتی به تقویم شماره ۴ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the one time vacation days for the calendar number 5. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی موقتی به تقویم شماره ۵ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the one time vacation days for the calendar number 6. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی موقتی به تقویم شماره ۶ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the one time vacation days for the calendar number 7. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی موقتی به تقویم شماره ۷ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the one time vacation days for the calendar number 8. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی موقتی به تقویم شماره ۸ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the one time vacation days for the calendar number 9. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی موقتی به تقویم شماره ۹ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the permanent vacation days for the calendar number 1. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی دائمی به تقویم شماره ۱ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the permanent vacation days for the calendar number 2. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی دائمی به تقویم شماره ۲ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the permanent vacation days for the calendar number 3. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی دائمی به تقویم شماره ۳ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the permanent vacation days for the calendar number 4. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی دائمی به تقویم شماره ۴ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the permanent vacation days for the calendar number 5. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی دائمی به تقویم شماره ۵ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the permanent vacation days for the calendar number 6. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی دائمی به تقویم شماره ۶ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the permanent vacation days for the calendar number 7. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی دائمی به تقویم شماره ۷ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the permanent vacation days for the calendar number 8. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی دائمی به تقویم شماره ۸ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Adds the permanent vacation days for the calendar number 9. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'یک روز تعطیلی دائمی به تقویم شماره ۹ می‌افزاید. لطفا از الگوی عددی واحدی از ۱ تا ۹ استفاده نمایید (به جای 01 - 09 )',
        'Admin-Area' => 'بخش مدیریت',
        'Admin-Email' => 'e-mail مدیر سیستم',
        'Admin-Password' => 'رمز عبور',
        'Admin-Support Overview' => 'نمای کلی پشتیبانی مدیریت سیستم',
        'Admin-User' => 'مدیر سیستم',
        'Advisory' => 'مشورتی',
        'Agent Mailbox' => 'صندوق پستی کارشناس',
        'Agent Preferences' => 'تنظیمات بخش پشتیبانی',
        'Agent based' => 'مبتنی بر کارشناس',
        'Agent-Area' => 'بخش پشتیبانی',
        'All Agents' => 'همه کارشناسان',
        'All Customer variables like defined in config option CustomerUser.' =>
            'همه تنظیمات مشترکین در فایل تنظیمات سیستم ذخیره شده است',
        'All customer tickets.' => 'همه درخواست‌های مشترک',
        'All email addresses get excluded on replaying on composing an email.' =>
            'به هنگام پاسخگویی و ارسال ایمیل جدید به هیچ ایمیلی توجه نخواهد داشت',
        'All email addresses get excluded on replaying on composing and email.' =>
            'به هنگام پاسخگویی یا نوشتن یک ایمیل جدید هیچ کدام از آدرس ایمیل‌ها در نظر گرفته نمی‌شوند.',
        'All incoming emails with this "Email" (To:) will be dispatched in the selected queue!' =>
            'همه نامه‌ها با گیرنده مشخص شده به لیست انتخاب شده منتقل خواهد شد!',
        'All messages' => 'همه پیام‌ها',
        'All new tickets!' => 'همه درخواست های جدید',
        'All tickets where the reminder date has reached!' => 'همه درخواست‌هایی که تاریخ یادآوری آنها فرا رسیده',
        'All tickets which are escalated!' => 'همه درخواستهایی که اولویت آنها ارتقاء داده شده',
        'Allocate CustomerUser to service' => 'مشترکین تخصیص داده شده به این خدمت',
        'Allocate services to CustomerUser' => 'خدمات تخصیص داده شده به مشترک',
        'Answer' => 'پاسخ',
        'Artefact' => 'محصول خروجی',
        'Article Create Times' => 'زمان‌های ایجاد نوشته‌ها',
        'Article created' => 'نوشته ایجاد شده',
        'Article created between' => 'نوشته ایجاد شده مابین',
        'Article filter settings' => 'تنظیمات فیلتر نوشته',
        'ArticleID' => 'شناسه نوشته',
        'Attach' => 'پیوست',
        'Attribute' => 'ویژگی',
        'Auto Response From' => 'فرستنده پاسخ خودکار',
        'Bounce Ticket: ' => 'درخواست ارجاع',
        'Bounce ticket' => 'درخواست ارجاعی',
        'CVS' => 'CVS',
        'Can not create link with %s!' => 'نمیتوان لینک را با %s ایجاد نمود',
        'Can not delete link with %s!' => ' نمیتوان لینک را با %s حذف نمود ',
        'Can\'t update password, invalid characters!' => 'کاراکتر غیر مجاز !',
        'Can\'t update password, must be at least %s characters!' => 'رمز عبور باید دست کم از %s تشکیل شده باشد.',
        'Can\'t update password, must contain 2 lower and 2 upper characters!' =>
            'رمز عبور باید دست کم شامل دو کاراکتر کوچک و 2 کاراکتر بزرگ باشد.',
        'Can\'t update password, need 2 lower and 2 upper characters!' =>
            'دست کم ۲ حرف کوچک و ۲ حرف بزرگ در رمز عبور خود استفاده نمائید!',
        'Can\'t update password, need min. 1 digit!' => 'دست کم ۱ عدد در رمز عبور خود استفاده نمائید.!',
        'Can\'t update password, need min. 2 characters!' => 'دست کم ۲ کاراکتر در رمز عبور خود استفاده نمائید.!',
        'Can\'t update password, need min. 8 characters!' => 'طول رمز عبور معتبر ۸ رقم است!',
        'Can\'t update password, needs at least 1 digit!' => 'رمز عبور باید دست کم شامل 1 عدد باشد.',
        'Can\'t update password, needs at least 2 characters!' => 'رمز عبور باید دست کم شامل 1 کاراکتر باشد.',
        'Can\'t update password, passwords doesn\'t match! Please try it again!' =>
            'رمز‌های عبور وارد شده یکسان نیست!',
        'Can\'t update password, your new passwords do not match! Please try again!' =>
            'رمز عبور جدید مطابقت ندارد. مجددا تلاش نمائید.',
        'Category Tree' => 'درخت دسته بندی',
        'Change %s settings' => 'تغییر تنظیمات %s',
        'Change Times' => 'زمان‌های تغییر',
        'Change free text of ticket' => 'تغییر متن درخواست',
        'Change owner of ticket' => 'تغییر صاحب درخواست',
        'Change priority of ticket' => 'تغییر اولویت درخواست',
        'Change responsible of ticket' => 'تغییر مسئول درخواست',
        'Change roles <-> groups settings' => 'تغییر تنظیمات نقش <-> گروه',
        'Change the ticket customer!' => 'تغییر مشترک درخواست',
        'Change the ticket owner!' => 'تغییر صاحب درخواست',
        'Change the ticket priority!' => 'ویرایش اولویت درخواست',
        'Change user <-> group settings' => 'تغییر تنظیمات کاربر <-> گروه',
        'Change users <-> roles settings' => 'تغییر تنظیمات کاربر <-> نقش',
        'ChangeLog' => 'گزارش تغیرات',
        'Child-Object' => 'فرعی',
        'Clear From' => 'تحویل شده از',
        'Clear To' => 'تحویل بده به',
        'Click here to report a bug!' => 'برای گزارش یک اشکال اینجا کلیک کنید !',
        'Close Times' => 'زمان بستن',
        'Close this ticket!' => 'درخواست را ببند',
        'Close ticket' => 'بستن درخواست',
        'Close type' => 'نوع بستن',
        'Close!' => 'بستن!',
        'Collapse View' => 'جمع کردن نما',
        'Comment (internal)' => 'توضیح (داخلی)',
        'CompanyTickets' => 'درخواست‌های شرکت',
        'Compose Answer' => 'ارسال پاسخ',
        'Compose Email' => 'ارسال Email',
        'Compose Follow up' => 'ارسال پیگیری',
        'Config Options' => 'انتخاب‌هاب تنظیمات',
        'Config options (e. g. &lt;OTRS_CONFIG_HttpType&gt;)' => 'گزینه‌های تنظیمات ',
        'Config options (e. g. <OTRS_CONFIG_HttpType>)' => 'گزینه‌های تنظیمات ',
        'Config options (e. g. <OTRS_CONFIG_HttpType>).' => 'گزینه‌های پیکره بندی',
        'Contact customer' => 'تماس با مشترک',
        'Create Times' => 'زمان‌های ایجاد درخواست',
        'Create new Phone Ticket' => 'ایجاد درخواست تلفنی',
        'Create new database' => 'ایجاد بانک جدید',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...).' =>
            'برای مدیریت بهتر بر دسترسی گروههای کارشناسی گروه جدید بسازید.',
        'CreateTicket' => 'ایجاد درخواست',
        'Customer Move Notify' => 'اعلام انتقال به مشترک',
        'Customer Owner Notify' => 'اعلام تعیین صاحب به مشترک',
        'Customer State Notify' => 'اعلام وضعیت به مشترک',
        'Customer User' => 'مشترک',
        'Customer User Management' => 'مدیریت مشترکین',
        'Customer Users' => 'مشترکین',
        'Customer Users <-> Groups' => 'مشترک <-> گروه',
        'Customer Users <-> Groups Management' => 'مدیریت مشترکین  کاربر <-> گروه',
        'Customer Users <-> Services' => 'مشترک <-> خدمات',
        'Customer Users <-> Services Management' => 'مدیریت مشترک <-> خدمات',
        'Customer history' => 'سوابق مشترک',
        'Customer history search' => 'جستجو در سوابق مشترک',
        'Customer history search (e. g. "ID342425").' => 'جستجو در سوابق مشترک (مثال: "ID342425")',
        'Customer item (icon) which shows the open tickets of this customer as info block.' =>
            'آیتم مشترک که درخواست‌های باز این مشترک را به عنوان یک بلوک اطلاعاتی نمایش می‌دهد.',
        'Customer user will be needed to have a customer history and to login via customer panel.' =>
            'نام کاربری مشترکین برای ورود به سیستم و نگهداری سوابق مورد استفاده قرار خواهد گرفت',
        'CustomerUser' => 'مشترک',
        'D' => 'A-Z, الف-ی',
        'DB Admin Password' => 'رمز عبور مدیر سیستم',
        'DB Admin User' => 'نام کاربری مدیر بانک اطلاعاتی ',
        'DB Host' => 'سرور بانک اطلاعاتی',
        'DB Type' => 'نوع بانک اطلاعاتی سیستم',
        'DB connect host' => 'سرور بانک اطلاعاتی',
        'Days' => 'روز',
        'Default' => 'پیش فرض',
        'Default Charset' => 'Charset پیشفرض',
        'Default Language' => 'زبان پیش فرض',
        'Delete old database' => 'حذف بانک قبلی',
        'Delete this ticket!' => 'حذف درخواست',
        'Detail' => 'جزئیات',
        'Diff' => 'Diff',
        'Discard all changes and return to the compose screen' => 'همه تغییرات را نادیده بگیر و به صفحه ارسال بازگرد',
        'Do dispatch or filter incoming emails based on email X-Headers! RegExp is also possible.' =>
            'email‌ها را از طریق Header یا RegExp فیلتر کن.',
        'Do you really want to delete this Object?' => 'آیا واقعا قصد حذف این مورد را دارید؟',
        'Do you really want to reinstall this package (all manual changes get lost)?' =>
            ' آیا از نصب مجدد این بسته اطمینان دارید. همه تغیرات دستی رونویسی خواهد شد ',
        'Don\'t forget to add a new user to groups and/or roles!' => 'فراموش نکنید که کاربر میبایست به گروه و نقش مربوطه مرتبط شود',
        'Don\'t forget to add a new user to groups!' => 'فراموش نکنید که کاربرجدید را به گروه‌ها اضافه کنید!',
        'Don\'t work with UserID 1 (System account)! Create new users!' =>
            'با نام کاربری سیستم کار نکنید برای ادامه یک نام کاربری جدید بسازید.!',
        'Download Settings' => 'دریافت تنظیمات',
        'Download all system config changes.' => 'دریافت همه تغیرات سیستم',
        'Drop Database' => 'حذف کامل بانک اطلاعاتی',
        'Dynamic-Object' => 'مورد متغیر',
        'Edit Article' => 'ویرایش نوشته',
        'Edit default services.' => 'ویرایش خدمات پیش فرض',
        'Email based' => 'مبتنی بر ایمیل',
        'Escaladed Tickets' => 'درخواست‌های اولویت داده شده در صف',
        'Escalation - First Response Time' => 'آخرین مهلت برای اولین پاسخگویی',
        'Escalation - Solution Time' => ' آخرین مهلت برای ارائه راهکار',
        'Escalation - Update Time' => ' آخرین مهلت برای رسیدگی به یک درخواست',
        'Escalation Times' => 'زمانهای ارتقای اولویت',
        'Escalation time' => 'زمان در اولویت قرارگرفتن درخواست',
        'Event is required!' => 'رویداد مورد نیاز است!',
        'Expand View' => 'باز کردن نما',
        'Explanation' => 'شرح',
        'Export Config' => 'دریافت خروجی از تنظیمات',
        'FileManager' => 'میریت فایل',
        'Filelist' => 'لیست فایل‌ها',
        'Filter for Language' => 'فیلتر زبان',
        'Filtername' => 'نام فیلتر',
        'Follow up' => 'پیگیری',
        'Follow up notification' => 'اعلام پیگیری درخواست',
        'For very complex stats it is possible to include a hardcoded file.' =>
            'برای گزارش‌های خیلی پیچیده امکان گنجاندن فایل کد وجود دارد',
        'Forward ticket: ' => 'ارسال مجدد درخواست: ',
        'Frontend' => 'رابط نمایشی',
        'Fulltext-Search in Article (e. g. "Mar*in" or "Baue*")' => 'جستجوی متنی در موارد به شکل ( "Mar*in" یا "Baue*")',
        'Go' => 'اجرا ',
        'Group Ro' => 'گروه فقط خواندنی',
        'Group based' => 'مبتنی بر گروه',
        'Group selection' => 'انتخاب گروه',
        'HTML' => 'HTML',
        'Have a lot of fun!' => 'موفق و پیروز باشید!',
        'Here you can define the value series. You have the possibility to select one or two elements. Then you can select the attributes of elements. Each attribute will be shown as single value series. If you don\'t select any attribute all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'لیست‌ها را در این بخش میتوانید مقداردهی نمائید، یک یا دو گزینه را انتخاب نمائید، خصوصیات گزینه را انتخاب نمائید.هر ویژگی به عنوان یک لیست نمایش داده خواهد شد.اگر هیچ ویژگی انتخاب نشود همه ویژگی‌های گزینه در تهیه گزارش منظور خواهد شد.همینطور ویژگی‌های اضافه شده پس از این تنظیمات ',
        'Here you can define the x-axis. You can select one element via the radio button. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'در اینجا می‌توانید محور افقی را تعریف کنید. شما می‌توانید عناصر را از طریق دکمه رادیویی انتخاب کنید. اگر شما هیچ چیزی انتخاب نکنید، همه خواص عنصر مورد نظر در تولید گزارشات مورد استفاده قرار می‌گیرند. این اتفاق در مورد هر خاصیتی که بعد از آخرین تنظیم اضافه شده باشد هم صادق است.',
        'Here you can define the x-axis. You can select one element via the radio button. Then you you have to select two or more attributes of the element. If you make no selection all attributes of the element will be used if you generate a stat. As well a new attribute is added since the last configuration.' =>
            'در این بخش میتوانید محور افقی نمودار را مشخص نمائید.شما میتوانید یک گزینه را انتخاب نمائید سپس دست کم دو ویژگی را برای گزینه انتخاب شده تعیین کنید.در غیر اینصورت همه ویژگی‌ها فعال خواهند بود.',
        'Here you can insert a description of the stat.' => 'شرح آمار',
        'Here you can select the dynamic object you want to use.' => 'شما میتوانید موارد متغیر را انتخاب نمائید',
        'Home' => 'صفحه اول',
        'If Secure Mode is not activated, activate it via SysConfig because your application is already running.' =>
            'اگر حالت ایمن فعال نگردیده، آن را از طریق SysConfig فعال کنید چون نرم افزار شما در حال حاضر در حال اجراست.',
        'If a new hardcoded file is available this attribute will be shown and you can select one.' =>
            'اگر یک فایل کد وجود داشته باشد این ویژگی نمایش داده میشود و شما میتوانید آن را به کار ببرید',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked for the old owner.' =>
            'اگر یک درخواست بسته شود و مشترک دوباره آنرا پیگیری کند بطور خودکار به صاحب  قبلی آن تحویل داده خواهد شد',
        'If a ticket will not be answered in this time, just only this ticket will be shown.' =>
            'اگر به یک درخواست در این زمان پاسخ داده نشد بجای نمایش لیست فقط این درخواست نمایش داده شود',
        'If an agent locks a ticket and he/she will not send an answer within this time, the ticket will be unlock automatically. So the ticket is viewable for all other agents.' =>
            'اگر یک کارشناس درخواست را تحویل بگیرد و در این مدت زمان نتواند به آن پاسخ دهد درخواست تحویل دااده شده و به لیست باز میگردد و قابل دسترس برای سایر کارشناسان خواهد شد',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the user).' =>
            'اگر هیچ گزینه ای انتخاب نشده باشد دسترسی به درخواست‌ها برای این گروه امکانپذیر نخواهد بود.',
        'If you need the sum of every column select yes.' => ' اگر به جمع هر ستون نیاز دارید گزینه بله را انتخاب نمائید ',
        'If you need the sum of every row select yes' => 'اگر به جمع هر سطر نیاز دارید گزینه بله را انتخاب نمائید',
        'If you use RegExp, you also can use the matched value in () as [***] in \'Set\'.' =>
            'اگر از RegExp استفاده میکنید میتوانید از مقادیر مطابق در () بعنوان[***] در ثبت استفاده نمائید',
        'Image' => 'تصویر',
        'Important' => 'مهم',
        'In this form you can select the basic specifications.' => 'در این فرم شما میتوانید تنظیمات اولیه را انجام دهید',
        'In this way you can directly edit the keyring configured in Kernel/Config.pm.' =>
            'تنظیم مستقیم کلید‌ها در Kernel/Config.pm',
        'Incident' => 'رویداد',
        'Information about the Stat' => 'اطلاعات گزارش آماری',
        'Insert of the common specifications' => 'ورود مشخصات عمومی',
        'Is Job Valid' => 'آیا کار معتبر است',
        'Is Job Valid?' => 'آیا کار معتبر است؟',
        'It\'s useful for ASP solutions.' => 'این مورد برای راه حل‌های ASP مناسب میباشد.',
        'It\'s useful for a lot of users and groups.' => 'این برای اکثر کاربران و گروه‌ها قابل استفاده است',
        'Job-List' => 'لیست کارها',
        'Keyword' => 'کلید واژه',
        'Keywords' => 'کلید واژه‌ها',
        'Last update' => 'آخرین بروزرسانی',
        'Link this ticket to an other objects!' => 'این درخواست را به مورد دیگری لینک کن',
        'Link this ticket to other objects!' => 'برقراری ارتباط بین این درخواست و آبجکت‌های دیگر',
        'Link to Parent' => 'ارتباط با والد',
        'Linked as' => 'مرتبط شده به عنوان',
        'Load Settings' => 'بازیابی تنظیمات',
        'Location on Map' => 'موقعیت روی نقشه',
        'Lock it to work on it!' => 'برای کار روی درخواست آن را تحویل بگیرید',
        'Logfile' => 'فایل گزارش',
        'Logfile too large, you need to reset it!' => 'فایل گزارش بیش از حد بزرگ شده است،آن راپاکسازی نمائید',
        'Login failed! Your username or password was entered incorrectly.' =>
            'ورود ناموفق . اطلاعات وارد شده صحیح نیست.',
        'Lookup' => 'مراجعه',
        'Mail Management' => 'مدیریت نامه‌ها',
        'Mailbox' => 'صندوق نامه‌ها',
        'Match' => 'مطابقت',
        'Max. displayed tickets' => 'حداکثر درخواست‌های نمایش داده شده',
        'Merge this ticket!' => 'ادغام این درخواست',
        'Message for new Owner' => 'پیام برای صاحب جدید درخواست',
        'Message sent to' => 'پیام ارسال شد به',
        'Misc' => 'سایر',
        'Modified' => 'تغییر یافته',
        'Modules' => 'ماژول‌ها',
        'Move notification' => 'اعلام انتقال',
        'Multiple selection of the output format.' => 'انتخاب چند گزینه برای فرمت خروجی',
        'MyTickets' => 'درخواست‌های من',
        'Name is required!' => 'نام الزامی است!',
        'New Agent' => 'کارشناس جدید',
        'New Customer' => 'مشترک جدید',
        'New Group' => 'گروه جدید',
        'New Group Ro' => 'گروه جدید فقط خواندنی',
        'New Priority' => 'اولویت جدید',
        'New SLA' => ' موافقت نامه مطلوبیت ارائه خدمات (SLA) جدید',
        'New Service' => 'خدمات جدید',
        'New State' => 'وضعیت جدید',
        'New Ticket Lock' => 'تحویل گیرنده جدید',
        'New TicketFreeFields' => 'ستون آزاد درخواست جدید',
        'New Title' => 'عنوان جدید',
        'New Type' => 'نوع جدید',
        'New account created. Sent Login-Account to %s.' => 'حساب کاربری جدید ایجاد شد.اطلاعات ورود به سیستم به %s ارسال شد.',
        'New messages' => 'پیام جدید',
        'New password again' => 'تکرار رمز عبور',
        'Next Week' => 'هفته آینده ',
        'No * possible!' => 'هیچ * ممکن نیست !',
        'No Packages for requested Framework in this Online Repository, but Packages for other Frameworks!' =>
            'برای Framework درخواست شده بسته ای وجود ندارد اما برای سایر Framework‌ها!',
        'No Packages or no new Packages in selected Online Repository!' =>
            'در مخزن انتخاب شده بسته جدیدی وجود ندارد',
        'No Permission' => 'حق دسترسی کافی نیست',
        'No means, send agent and customer notifications on changes.' => ' پاسخ خیر به معنی ارسال اعلام به کارشناس و مشترک پس از اعمال تغییرات است ',
        'No time settings.' => 'بدون تنظیمات زمان',
        'Note Text' => 'یادداشت',
        'Notification (Customer)' => 'اعلام(مشترک)',
        'Notifications' => 'اعلام‌ها',
        'OS' => 'سیستم عامل',
        'OTRS DB Name' => 'نام بانک اطلاعاتی سیستم',
        'OTRS DB Password' => 'رمز عبور بانک اطلاعاتی سیستم
',
        'OTRS DB User' => 'نام کاربری بانک اطلاعاتی سیستم',
        'OTRS DB connect host' => 'سرور میزبان بانک اطلاعاتی ',
        'OTRS sends an notification email to the customer if the ticket is moved.' =>
            'اگر درخواست به شخص دیگری منتقل شد سیستم با Email اطلاع خواهد داد.',
        'OTRS sends an notification email to the customer if the ticket owner has changed.' =>
            'اگر صاحب درخواست تغییر کرد سیستم با Email اطلاع خواهد داد.',
        'OTRS sends an notification email to the customer if the ticket state has changed.' =>
            'اگر وضعیت درخواست تغییر کرد سیستم با Email اطلاع خواهد داد',
        'Object already linked as %s.' => 'مورد اکنون به عنوان %s مرتبط شده است',
        'Of couse this feature will take some system performance it self!' =>
            'این ویژگی خود بعضی از عملکردهای سیستم را میگیرد',
        'Only for ArticleCreate Event.' => 'فقط برای رویداد ArticleCreate',
        'Open Tickets' => 'درخواست‌های باز',
        'Options ' => 'گزینه‌ها',
        'Options of the current customer user data (e. g. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)' =>
            'گزینه‌های اطلاعات مشترک کنونی',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>)' =>
            'گزینه‌های اطلاعات مشترک فعلی',
        'Options of the current customer user data (e. g. <OTRS_CUSTOMER_DATA_UserFirstname>).' =>
            'گزینه‌های اطلاعات این مشترک',
        'Options of the current user who requested this action (e. g. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)' =>
            'گزینه‌های تنظیمات صاحب درخواست',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>)' =>
            'گزینه‌های کاربر فعلی که این فعالیت را درخواست نموده',
        'Options of the current user who requested this action (e. g. <OTRS_CURRENT_UserFirstname>).' =>
            'گزینه‌های این کاربر که درخواست این فعالیت را داده ',
        'Options of the ticket data (e. g. &lt;OTRS_TICKET_Number&gt;, &lt;OTRS_TICKET_ID&gt;, &lt;OTRS_TICKET_Queue&gt;, &lt;OTRS_TICKET_State&gt;)' =>
            'گزینه‌های اطلاعات درخواست(مانند شماره درخواست، لیست مرتبط، شناسه درخواست و وضعیت درخواست)',
        'Options of the ticket data (e. g. <OTRS_TICKET_Number>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'گزینه‌های اطلاعات درخواست(شماره درخواست،شناسه درخواست،لیست مربوطه و وضعیت)',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_ID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'گزینه‌های اطلاعات درخواست',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>)' =>
            'گزینه‌های اطلاعات درخواست‌ها',
        'Options of the ticket data (e. g. <OTRS_TICKET_TicketNumber>, <OTRS_TICKET_TicketID>, <OTRS_TICKET_Queue>, <OTRS_TICKET_State>).' =>
            'گزینه‌های اطلاعات درخواست',
        'Other Options' => 'سایر گزینه‌ها',
        'Out Of Office' => 'بیرون محل کار',
        'POP3 Account Management' => 'مدیریت حساب POP3',
        'Package' => 'بسته',
        'Package not correctly deployed! You should reinstall the Package again!' =>
            'نرم افزار بدرستی نصب نشده است، شما میبایست عملیات نصب را مجددا اجرا نمائید.',
        'Package not correctly deployed! You should reinstall the package again!' =>
            'بسته به درستی نصب نشده است! باید مجددا بسته را نصب نمایید!',
        'Param 1' => 'پارامتر ۱',
        'Param 2' => 'پارامتر ۲',
        'Param 3' => 'پارامتر ۳',
        'Param 4' => 'پارامتر ۴',
        'Param 5' => 'پارامتر ۵',
        'Param 6' => 'پارامتر ۶',
        'Parent-Object' => 'اصلی',
        'Password is already in use! Please use an other password!' => 'این رمز عبور در حال استفاده است لطفا آنرا تغییر دهید!',
        'Password is already used! Please use an other password!' => 'این رمز عبور در حال استفاده است لطفا آنرا تغییر دهید!',
        'Passwords doesn\'t match! Please try it again!' => 'رمز عبور‌ها یکسان نیست لطفا مجددا سعی نمائید!',
        'Pending Times' => 'زمان‌های تعلیق درخواست',
        'Pending messages' => 'پیامهای معلق',
        'Pending type' => 'نوع تعلیق',
        'Permission settings. You can select one or more groups to make the configurated stat visible for different agents.' =>
            'تنظیمات دسترسی',
        'Permissions to change the ticket owner in this group/queue.' => 'مجوز تغییردرخواست در این گروه/لیست.',
        'PhoneView' => 'نمایش تلفن',
        'Please contact your admin' => 'لطفا با مدیر سیستم تماس بگیرید',
        'Please fill out this form to recieve login credentials.' => 'لطفا این فرم را برای دریافت جزئیات ورود تکمیل نمایید.',
        'PostMaster Filter' => 'فیلتر Email سیستم',
        'PostMaster Mail Account' => 'حساب Email سیستم',
        'Print this ticket!' => 'این درخواست را چاپ کن',
        'Prio' => 'اولویت',
        'Problem' => 'مسئله',
        'Queue <-> Auto Responses Management' => 'مدیریت لیست <-> پاسخ خودکار',
        'Queue ID' => 'شناسه لیست',
        'Queue Management' => 'مدیریت لیست‌های درخواست',
        'QueueView Refresh Time' => 'زمان بارگذاری مجدد صف درخواست',
        'Realname' => 'نام و نام خانوادگی',
        'Rebuild' => 'ساخت مجدد',
        'Recipients' => 'گیرنده',
        'Reminder' => 'یادآوری',
        'Reminder messages' => 'پیامهای یادآوری',
        'Required Field' => 'ستون‌های الزامی',
        'Response Management' => 'مدیریت پاسخ‌ها',
        'Responses <-> Attachments Management' => 'مدیریت پیوست‌ها <-> پاسخ‌ها',
        'Responses <-> Queue Management' => 'مدیریت لیست <-> پاسخ',
        'Return to the compose screen' => 'بازگشت به صفحه ارسال',
        'Role' => 'نقش',
        'Roles <-> Groups Management' => 'مدیریت نقش <-> گروه',
        'Roles <-> Users' => 'نقش <-> کابر',
        'Roles <-> Users Management' => 'مدیریت کاربران <-> نقش‌ها',
        'Run Search' => 'اجرای جستجو',
        'SQL benchmark' => 'آزمون SQL',
        'Save Job as?' => 'کار را ذخیره کن با عنوان',
        'Save Search-Profile as Template?' => 'ذخیره بعنوان الگوی جستجو?',
        'Schedule' => 'زمان بندی',
        'Search Result' => 'نتیجه جستجو',
        'Search for' => 'جستجو برای',
        'Search for customers (wildcards are allowed).' => 'جستجوی مشترکین (کاراکترهای عام مجازند)',
        'Search-Profile as Template?' => 'ذخیره جستجوی مشخصات به عنوان قالب؟',
        'Secure Mode need to be enabled!' => 'باید حالت ایمن فعال گردد',
        'Select Box' => 'جعبه انتخاب.',
        'Select Box Result' => 'نتیجه جعبه انتخاب',
        'Select Source (for add)' => 'منبع را انتخاب نمائید (برای افزودن)',
        'Select the customeruser:service relations.' => 'ارتباط مشترک را با خدمات مشخض نمائید',
        'Select the element, which will be used at the X-axis' => 'گزینه ای را برای استفاده در محور افقی انتخاب نمائید',
        'Select the restrictions to characterise the stat' => 'برای توصیف این آمار محدودیت‌ها را انتخاب نمائید ',
        'Select the role:user relations.' => 'ارتباط هر کاربر را با نقش مربوط به آن مشخص کنید',
        'Select the user:group permissions.' => 'حقوق دسترسی (کاربر:گروه) را انتخاب نمائید',
        'Select your QueueView refresh time.' => 'زمان بازیابی لیست را انتخاب نمائید',
        'Select your default spelling dictionary.' => ' لغت نامه غلط یابی خود را انتخاب نمائید',
        'Select your frontend Charset.' => 'Charset خود را انتخاب نمائید',
        'Select your frontend QueueView.' => 'شیوه نمایش لیست را انتخاب نمائید',
        'Select your frontend language.' => 'زبان سیستم را انتخاب نمائید',
        'Select your out of office time.' => 'زمان بیرون بودن از محل کار را مشخص کنید',
        'Select your screen after creating a new ticket.' => 'وضعیت نمایش را بعد از ایجاد درخواست جدید انتخاب کنید.',
        'Selection needed' => 'انتخاب لازم است',
        'Send Administrative Message to Agents' => 'ارسال پیغام مدیریتی به کاربران',
        'Send Notification' => 'ارسال اعلام',
        'Send me a notification if a customer sends a follow up and I\'m the owner of this ticket.' =>
            'در صورت ارسال یک پیگیری از طرف مشترک به من اطلاع بده.',
        'Send me a notification of an watched ticket like an owner of an ticket.' =>
            'در مورد درخواست‌های تحت نظر گرفته شده من را هم همچون صاحب درخواست در جریان قرار بده.',
        'Send no notifications' => 'اعلام‌ها را ارسال نکن',
        'Sent new password to: %s' => 'رمز عبور جدید به آدرس %s ارسال شد',
        'Sent password token to: %s' => 'کد بازیابی رمز عبور به آدرس %s ارسال شد.',
        'Sessions' => 'Session‌ها',
        'Set customer user and customer id of a ticket' => 'ثبت نام و کد مشترک در درخواست.',
        'Set this ticket to pending!' => 'این درخواست را به حال معلق ببر',
        'Show' => 'نمایش',
        'Shows the ticket history!' => 'نمایش سابقه درخواست',
        'Site' => 'سایت',
        'Solution' => 'راهکار',
        'Sort by' => 'مرتب سازی بر حسب',
        'Source' => 'منبع',
        'Spell Check' => 'غلط یابی',
        'Split' => 'تقسیم درخواست',
        'Start Support' => 'آغاز پشتیبانی',
        'State Type' => 'نوع وضعیت',
        'Static-File' => 'فایل ثابت',
        'Stats-Area' => 'بخش گزارشات ',
        'Sub-Queue of' => 'لیست فرعی',
        'Sub-Service of' => 'خدمت فرعی',
        'Subscribe' => 'عضویت',
        'Support Assessment' => 'ارزیابی پشتیبانی',
        'Symptom' => 'نشانه',
        'System History' => 'سوابق سیستم',
        'System State Management' => 'مدیریت وضعیت سیستم',
        'System Status' => 'وضعیت سیستم',
        'Systemaddress' => 'آدرس سیستمی',
        'Take care that you also updated the default states in you Kernel/Config.pm!' =>
            'دقت کنید که حتما وضعیت پیشفرض را در Kernel/Config.pm ذخیره کرده باشید.',
        'The User Name you wish to have' => 'نام کاربری که می‌خواهید',
        'The message being composed has been closed.  Exiting.' => 'پیامی که ارسال شد بسته شد..',
        'These values are read-only.' => 'این مقادیر فقط قابل خواندن هستند.',
        'These values are required.' => 'این مقادیر مورد نیاز هستند.',
        'This account exists.' => 'این حساب کاربری موجود است',
        'This is useful if you want that no one can get the result of the stat or the stat isn\'t ready configurated.' =>
            'این مفید است اگر میخواهید کسی تنواند نتیجه آمار را مشاهده نماید',
        'This window must be called from compose window' => 'این پنجره میبایست از طریق پنجره ارسال فراخوانی شود',
        'Ticket Lock' => 'تحویل گیرنده درخواست',
        'Ticket Number Generator' => 'تولید کننده شماره درخواست‌ها',
        'Ticket Search' => 'جستجوی درخواست',
        'Ticket Status View' => 'نمایش وضعیت درخواست',
        'Ticket Type is required!' => 'تعیین نوع درخواست ضروری اس!',
        'Ticket escalation!' => 'در اولویت قرارگرفتن درخواست !',
        'Ticket locked!' => 'درخواست تحویل گرفته شده !',
        'Ticket owner options (e. g. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)' =>
            'گزینه‌های صاحب درخواست',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>)' => 'گزینه‌های صاحب درخواست (مثال: <OTRS_OWNER_UserFirstname>)',
        'Ticket owner options (e. g. <OTRS_OWNER_UserFirstname>).' => 'گزینه‌های صاحب درخواست',
        'Ticket responsible options (e. g. <OTRS_RESPONSIBLE_UserFirstname>).' =>
            'گزینه‌های مسئول درخواست',
        'Ticket selected for bulk action!' => 'درخواست برای اعمال عملیات کلی انتخاب شد!',
        'Ticket unlock!' => 'درخواست تحویل داده شده !',
        'Ticket#' => 'شماره درخواست',
        'Ticket-Area' => 'بخش درخواست',
        'TicketFreeFields' => 'ستون‌های آزاد درخواست',
        'TicketFreeText' => 'متن درخواست',
        'TicketID' => 'شناسه درخواست',
        'TicketZoom' => 'نمایش کامل درخواست',
        'Tickets available' => 'درخواست‌های در دسترس',
        'Tickets shown' => 'نمایش درخواست',
        'Tickets which need to be answered!' => 'درخواست‌هایی که لازم است پاسخ داده شوند',
        'Times' => 'زمان',
        'Title of the stat.' => 'عنوان آمار',
        'To get the article attribute (e. g. (<OTRS_AGENT_From>, <OTRS_AGENT_To>, <OTRS_AGENT_Cc>, <OTRS_AGENT_Subject> and <OTRS_AGENT_Body>).' =>
            'برای گرفتن خاصیت نوشته (برای مثال <OTRS_AGENT_From>، <OTRS_AGENT_To>، <OTRS_AGENT_Cc>، <OTRS_AGENT_Subject> و <OTRS_AGENT_Body>).',
        'To get the article attribute (e. g. (<OTRS_CUSTOMER_From>, <OTRS_CUSTOMER_To>, <OTRS_CUSTOMER_Cc>, <OTRS_CUSTOMER_Subject> and <OTRS_CUSTOMER_Body>).' =>
            'برای دریافت مشخصات مورد نظیر(<OTRS_CUSTOMER_From>، <OTRS_CUSTOMER_To>، <OTRS_CUSTOMER_Cc>، <OTRS_CUSTOMER_Subject>  و <OTRS_CUSTOMER_Body>)',
        'Top of Page' => 'بالای صفحه',
        'Total hits' => 'مجموع بازدید‌ها',
        'U' => 'Z-A, ی-الف',
        'Unable to parse Online Repository index document!' => 'خطا در بازیابی مخزن نرم افزارها',
        'Uniq' => 'واحد',
        'Unlock Tickets' => 'درخواست‌های تحویل داده شده',
        'Unlock to give it back to the queue!' => 'برای بازگرداندن درخواست به لیست آن را تحویل دادن کنید',
        'Unsubscribe' => 'لغو عضویت',
        'Use utf-8 it your database supports it!' => 'اگر بانک اطلاعاتی شما utf8 را پشتیبانی میکند از این کدینگ استفاده نمائید. !',
        'Useable options' => 'گزینه‌های قابل استفاده',
        'User Management' => 'مدیریت کاربران',
        'User will be needed to handle tickets.' => 'کاربر نیاز خواهد داشت که درخواست‌ها را کنترل کند.',
        'Users' => 'کاربر‌ها',
        'Users <-> Groups' => 'کاربر <-> گروه',
        'Users <-> Groups Management' => 'مدیریت کاربر <-> گروه',
        'Warning! This tickets will be removed from the database! This tickets are lost!' =>
            'توجه !این درخواست‌ها از بانک حذف خواهد شد . ',
        'Watch notification' => 'مشاهده آگهی/اخطارها',
        'Web-Installer' => 'برنامه نصب تحت وب',
        'WebMail' => 'پست الکترونیکی',
        'WebWatcher' => 'بازرسی وب',
        'Webserver' => 'سرور وب',
        'Welcome to OTRS' => 'به سیستم پشتیبانی سورس باز (OTRS) خوش آمدید',
        'Wildcards are allowed.' => 'کاراکترهای عام مجازند.',
        'With an invalid stat it isn\'t feasible to generate a stat.' => 'با یک آمار غیر معتبر امکان تولید گزارش وجود ندارد ',
        'With the input and select fields you can configurate the stat at your needs. Which elements of a stat you can edit depends on your stats administrator who configurated the stat.' =>
            'با ورود اطلاعات و انتخاب گزینه‌ها میتوانید گزارش آماری خود را بسازید.گزینه‌هایی را میتوانید ویرایش نمائید که مدیر گزارش‌ها برای شما تنظیم کرده است',
        'Yes means, send no agent and customer notifications on changes.' =>
            'پاسخ بله به معنی عدم ارسال اعلام به کارشناس و مشترک پس از اعمال تغییرات است',
        'Yes, save it with name' => 'بله آنرا ذخیره کن با نام',
        'You got new message!' => 'شما پیام جدیدی دریافت کرده اید !',
        'You have to select two or more attributes from the select field!' =>
            'از قسمت انتخاب ستون دست کم ۲ مورد را انتخاب نمائید',
        'You need a email address (e. g. customer@example.com) in To:!' =>
            'آدرس email وارد شده معتبر نیست!',
        'You need min. one selected Ticket!' => 'شما دست کم به یک درخواست انتخاب شده نیاز دارید!',
        'You need to account time!' => 'شما نیاز به محاسبه زمان دارید!',
        'You need to activate %s first to use it!' => 'شما برای استفاده  %s ابتدا میبایست آنرا فعال نمائید!',
        'Your email address is new' => 'آدرس Email شما جدید است.',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'پیام شما در درخواست به شماره "<OTRS_TICKET> ارجاع شد به "<OTRS_BOUNCE_TO>".  اطلاعات بیشتر را از این آدرس دریافت نمائید',
        'Your own Ticket' => 'درخواست شما',
        'accept license' => 'تائید مجوز بهره برداری',
        'customer realname' => 'نام و نام خانوادگی مشترک',
        'don\'t accept license' => 'مجوز را تائید نکن',
        'down' => 'نزولی',
        'false' => 'خیر',
        'for agent firstname' => 'برای نام کارشناس',
        'for agent lastname' => 'برای نام خانوادگی کارشناس',
        'for agent login' => 'برای ورود کارشناس به سیستم',
        'for agent user id' => 'برای شناسه کاربری کارشناس',
        'kill all sessions' => 'همه Session‌ها را از بین ببر',
        'kill session' => 'session را از بین ببر',
        'modified' => 'تغییر یافته',
        'new ticket' => 'درخواست جدید',
        'next step' => 'قدم بعدی',
        'send' => 'ارسال',
        'sort downward' => 'مرتب سازی نزولی',
        'sort upward' => 'مرتب سازی صعودی',
        'to get the first 20 character of the subject' => 'برای گرفتن ۲۰ کاراکتر اول موضوع',
        'to get the first 5 lines of the email' => 'برای گرفتن ۵ خط اول نامه ',
        'to get the from line of the email' => 'برای گرفتن خط (از) email',
        'to get the realname of the sender (if given)' => 'برای گرفتن نام فرستنده',
        'up' => 'صعودی',
        'utf8' => 'utf8',
        'x' => '*',

    };
    # $$STOP$$
    return;
}

1;
