use Test::More tests => 16;
use POSIX qw(strftime);
use Kernel::System::DateProcessing qw(ValidateAndTransformPendingTime);

ok (ValidateAndTransformPendingTime("2011-11-01 00:00:01") eq "2011-11-01 00:00:01");
ok( ValidateAndTransformPendingTime("+6 hours")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 6)));
ok( ValidateAndTransformPendingTime("+6 h")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 6)));
ok( ValidateAndTransformPendingTime("+6h")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 6)));
ok( ValidateAndTransformPendingTime("+1h")  eq strftime ("%F %T", localtime(time () + 60 * 60 )));
ok( ValidateAndTransformPendingTime("+1 h")  eq strftime ("%F %T", localtime(time () + 60 * 60 )));
ok( ValidateAndTransformPendingTime("+1 hours")  eq strftime ("%F %T", localtime(time () + 60 * 60 )));
ok( ValidateAndTransformPendingTime("+6 m")  eq strftime ("%F %T", localtime(time () + 60 * 6)));
ok( ValidateAndTransformPendingTime("Tomorrow")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24)));
ok( ValidateAndTransformPendingTime("+1 d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24)));
ok( ValidateAndTransformPendingTime("+1d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24)));
ok( ValidateAndTransformPendingTime("+ 1 d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24)));
ok( ValidateAndTransformPendingTime("+ 1d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24)));
ok( ValidateAndTransformPendingTime("+3 days")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24 * 3)));
ok( ValidateAndTransformPendingTime("+3d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24 * 3)));
ok( ValidateAndTransformPendingTime("+3 d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24 * 3)));


