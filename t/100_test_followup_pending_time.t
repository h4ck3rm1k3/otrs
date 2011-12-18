use Test::More tests => 17;
use POSIX qw(strftime);
use Kernel::System::DateProcessing qw(ValidateAndTransformPendingTime);
use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Log;
my $ConfigObject = Kernel::Config->new();
my $EncodeObject = Kernel::System::Encode->new(
    ConfigObject => $ConfigObject,
    );

my $LogObject = Kernel::System::Log->new(
    ConfigObject => $ConfigObject,
    EncodeObject => $EncodeObject,
    );

my $Self={
   LogObject => $LogObject
};

ok (ValidateAndTransformPendingTime($Self,"2011-11-01 00:00:01") eq "2011-11-01 00:00:01");
ok( ValidateAndTransformPendingTime($Self,"+6 hours")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 6)));
ok( ValidateAndTransformPendingTime($Self,"+6 h")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 6)));
ok( ValidateAndTransformPendingTime($Self,"+6h")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 6)));
ok( ValidateAndTransformPendingTime($Self,"+1h")  eq strftime ("%F %T", localtime(time () + 60 * 60 )));
ok( ValidateAndTransformPendingTime($Self,"+1 h")  eq strftime ("%F %T", localtime(time () + 60 * 60 )));
ok( ValidateAndTransformPendingTime($Self,"+1 hours")  eq strftime ("%F %T", localtime(time () + 60 * 60 )));
ok( ValidateAndTransformPendingTime($Self,"+6 m")  eq strftime ("%F %T", localtime(time () + 60 * 6)));
ok( ValidateAndTransformPendingTime($Self,"Tomorrow")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24)));
ok( ValidateAndTransformPendingTime($Self,"+1 d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24)));
ok( ValidateAndTransformPendingTime($Self,"+1d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24)));
ok( ValidateAndTransformPendingTime($Self,"+ 1 d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24)));
ok( ValidateAndTransformPendingTime($Self,"+ 1d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24)));
ok( ValidateAndTransformPendingTime($Self,"+3 days")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24 * 3)));
ok( ValidateAndTransformPendingTime($Self,"+3d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24 * 3)));
ok( ValidateAndTransformPendingTime($Self,"+3 d")  eq strftime ("%F %T", localtime(time () + 60 * 60 * 24 * 3)));

eval {
    ValidateAndTransformPendingTime($Self,"+3 error");
};
ok $@ =~ /Date Parsing Failed/;


