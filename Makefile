SYSTEMROOT=~/projects/otrs/git/vo/vo1029migrate/
PACKAGENAME=iPhoneHandle

test : test1 test2 test3 test4 test5 test6 test7 test8 test9 test10       test11 test12 test13 test14 test15 test16 test17 test18 test19 test20        test22 test23 

test1 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/003_json_screen_config_new_phone.t
test2 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/001_iphone.t

test3 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/001_iphone_freetext.t
test4 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/002_iphone_articleget.t
test5 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/002_iphone_getscreenelements_phone.t
test6 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso  scripts/test/iso/002_iphone_getscreenelements_phone_freearticlefields.t
test7 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/002_iphone_getscreenelements_phone_freetext.t
test8 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/002_iphone_getscreenelements_phone_freetimes.t
test9 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/002_iphone_ticketcommonactions.t
test10 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/002_iphone_ticketcompose.t
test11 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/002_iphone_ticketget.t
test12 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/002_iphone_ticketlist.t
test13 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/003_json_screen_config_new_phone.t
test14 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/003_json_screen_config_new_ticket.t
test15 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/003_json_screen_config_new_ticket2.t
test16 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/003_json_screen_config_new_ticket_a.t
test17 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/003_json_screen_config_new_ticket_freefields.t
test18 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/004_lwp_json.t
test19 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/004_lwp_json_2.t
test20 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/004_lwp_json_3.t

test22 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/006_tests_ticket.t
test23 :
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso scripts/test/iso/006_tests_ticket2.t



build : test
	perl $(SYSTEMROOT)/bin/otrs.PackageManager.pl  -a build -p ./$(PACKAGENAME).sopm -d . -o ../out/


reinstall : build
	perl $(SYSTEMROOT)/bin/otrs.PackageManager.pl -a reinstall -p ../out/$(PACKAGENAME)-0.0.0.opm 

commit :
	echo

push :
	echo


