SYSTEMROOT=~/projects/otrs/git/vo/vo1029migrate/
PACKAGENAME=iPhoneHandle
test :
	perl -I. -I $(SYSTEMROOT) scripts/test/iso/003_json_screen_config_new_phone.t

build : test
	perl $(SYSTEMROOT)/bin/otrs.PackageManager.pl  -a build -p ./$(PACKAGENAME).sopm -d . -o ../out/


reinstall : build
	perl $(SYSTEMROOT)/bin/otrs.PackageManager.pl -a reinstall -p ../out/$(PACKAGENAME)-0.0.0.opm 

commit :
	echo

push :
	echo
