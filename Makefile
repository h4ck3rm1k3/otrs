
package :
	perl ../otrs/bin/otrs.PackageManager.pl -a build -p ./SystemMonitoring.sopm

test : test1 test2 test_install test4 test5

test1 :
	perl -I ../otrs/ scripts/test/SystemMonitoring_Backend.t

test2 :
	perl -I ../otrs/ scripts/test/SystemMonitoring.t   

test_install :
	perl -I ../otrs/ scripts/test/SystemMonitoringInstall.t   

test4 :
	perl -I ../otrs/ scripts/test/SystemMonitoring_TicketSearch.t

test5 :
	perl -I ../otrs/ scripts/test/SystemMonitoring2.t  

test6 :
	perl -I ../otrs/ scripts/test/SystemMonitoring_newmail.t
