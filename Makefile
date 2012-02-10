SYSTEMROOT=~/projects/otrs/git/vo/vo1029migrate/
PACKAGENAME=iPhoneHandle

TESTS := $(wildcard scripts/test/iso/*.t)
TESTOUT := $(patsubst %.t,%.out,$(TESTS))

test : $(TESTOUT)
	echo done
#echo $(TESTOUT)

clean :
	rm $(TESTOUT)

%.out : %.t scripts/test/iso/basetest.pm
	echo going to process $<
	perl -I. -I $(SYSTEMROOT) -I scripts/test/iso $< > $@ 2>&1
	tail	$@ 

build : test
	perl $(SYSTEMROOT)/bin/otrs.PackageManager.pl  -a build -p ./$(PACKAGENAME).sopm -d . -o ../out/


reinstall : build
	perl $(SYSTEMROOT)/bin/otrs.PackageManager.pl -a reinstall -p ../out/$(PACKAGENAME)-0.0.0.opm 

commit :
	echo

push :
	echo


