#!/bin/sh
# --
# auto_build.sh - build automatically OTRS tar, rpm and src-rpm
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: auto_build.sh,v 1.95 2011/10/11 11:39:14 mg Exp $
# --
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU AFFERO General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# or see http://www.gnu.org/licenses/agpl.txt.
# --

echo "auto_build.sh - build automatically OTRS tar, rpm and src-rpm <\$Revision: 1.95 $>"
echo "Copyright (C) 2001-2011 OTRS AG, http://otrs.org/\n";

PATH_TO_CVS_SRC=$1
PRODUCT=OTRS
VERSION=$2
RELEASE=$3
#RELEASE=01
#ARCHIVE_DIR="otrs-$VERSION-$RELEASE"
ARCHIVE_DIR="otrs-$VERSION"
#ARCHIVE_DIR="otrs"
PACKAGE=otrs
PACKAGE_BUILD_DIR="/tmp/$PACKAGE-build"
PACKAGE_DEST_DIR="/tmp/$PACKAGE-packages"
PACKAGE_TMP_SPEC="/tmp/$PACKAGE.spec"
RPM_BUILD="rpmbuild"
#RPM_BUILD="rpm"

SUPPORT_PACKAGE="http://ftp2.otrs.org/pub/otrs/packages/Support-1.2.8.opm"
IPHONE_PACKAGE="http://ftp.otrs.org/pub/otrs/packages/iPhoneHandle-1.0.3.opm"
MANUAL_EN="http://ftp.otrs.org/pub/otrs/doc/doc-admin/3.1/en/pdf/otrs_admin_book.pdf"
MANUAL_DE="http://ftp.otrs.org/pub/otrs/doc/doc-admin/3.1/de/pdf/otrs_admin_book.pdf"


if ! test $PATH_TO_CVS_SRC || ! test $VERSION || ! test $RELEASE; then
    # --
    # build src needed
    # --
    echo ""
    echo "Usage: auto_build.sh <PATH_TO_CVS_SRC> <VERSION>"
    echo ""
    echo "  Try: auto_build.sh /home/ernie/src/otrs 1.0.2"
    echo ""
    exit 1;
else
    # --
    # check dir
    # --
    if ! test -e $PATH_TO_CVS_SRC/RELEASE; then
        echo "Error: $PATH_TO_CVS_SRC is not OTRS CVS directory!"
        exit 1;
    fi
fi

# --
# get system info
# --
if test -d /usr/src/redhat/RPMS/; then
    SYSTEM_RPM_DIR=/usr/src/redhat/RPMS/
else
    SYSTEM_RPM_DIR=/usr/src/packages/RPMS/
fi

if test -d /usr/src/redhat/SRPMS/; then
    SYSTEM_SRPM_DIR=/usr/src/redhat/SRPMS/
else
    SYSTEM_SRPM_DIR=/usr/src/packages/SRPMS/
fi

if test -d /usr/src/redhat/SOURCES/; then
    SYSTEM_SOURCE_DIR=/usr/src/redhat/SOURCES/
else
    SYSTEM_SOURCE_DIR=/usr/src/packages/SOURCES/
fi

# --
# cleanup system dirs
# --
rm -rf $SYSTEM_RPM_DIR/*/$PACKAGE*$VERSION*$RELEASE*.rpm
rm -rf $SYSTEM_SRPM_DIR/$PACKAGE*$VERSION*$RELEASE*.src.rpm

# --
# RPM and SRPM dir
# --
rm -rf $PACKAGE_DEST_DIR
mkdir $PACKAGE_DEST_DIR
mkdir $PACKAGE_DEST_DIR/RPMS
mkdir $PACKAGE_DEST_DIR/RPMS/suse
mkdir $PACKAGE_DEST_DIR/RPMS/suse/9.0
mkdir $PACKAGE_DEST_DIR/RPMS/suse/9.1
mkdir $PACKAGE_DEST_DIR/RPMS/suse/10.0
mkdir $PACKAGE_DEST_DIR/RPMS/suse/11.0
mkdir $PACKAGE_DEST_DIR/RPMS/fedora
mkdir $PACKAGE_DEST_DIR/RPMS/fedora/4
mkdir $PACKAGE_DEST_DIR/SRPMS
mkdir $PACKAGE_DEST_DIR/SRPMS/suse
mkdir $PACKAGE_DEST_DIR/SRPMS/suse/9.0
mkdir $PACKAGE_DEST_DIR/SRPMS/suse/9.1
mkdir $PACKAGE_DEST_DIR/SRPMS/suse/10.0
mkdir $PACKAGE_DEST_DIR/SRPMS/suse/11.0
mkdir $PACKAGE_DEST_DIR/SRPMS/fedora
mkdir $PACKAGE_DEST_DIR/SRPMS/fedora/4

# --
# build
# --
rm -rf $PACKAGE_BUILD_DIR || exit 1;
mkdir -p $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ || exit 1;

cp -a $PATH_TO_CVS_SRC/.*rc.dist $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ || exit 1;
cp -a $PATH_TO_CVS_SRC/.mailfilter.dist $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ || exit 1;
cp -a $PATH_TO_CVS_SRC/* $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ || exit 1;

# --
# update RELEASE
# --
RELEASEFILE=$PACKAGE_BUILD_DIR/$ARCHIVE_DIR/RELEASE
echo "PRODUCT = $PRODUCT" > $RELEASEFILE
echo "VERSION = $VERSION" >> $RELEASEFILE
#echo "VERSION = $VERSION $RELEASE" >> $RELEASEFILE
echo "BUILDDATE = `date`" >> $RELEASEFILE
echo "BUILDHOST = `hostname -f`" >> $RELEASEFILE

# --
# cleanup
# --
cd $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ || exit 1;

# remove CVS dirs
find $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ -name CVS | xargs rm -rf || exit 1;
# remove .cvs ignore files
find -name ".cvsignore" | xargs rm -rf

#
# remove old sessions, articles and spool and other stuff
# (remainders of a running system, should not really happen)
#
rm -f var/sessions/*
rm -rf var/article/*
rm -rf var/spool/*
rm -rf Kernel/Config.pm

# remove development content
rm -rf development

# remove swap stuff
find -name ".#*" | xargs rm -rf

# include pdf docs
mkdir -p doc/manual/en
wget "$MANUAL_EN" || exit 1;
mv otrs_admin_book.pdf doc/manual/en

mkdir -p doc/manual/de
wget "$MANUAL_DE" || exit 1;
mv otrs_admin_book.pdf doc/manual/de

# mk ARCHIVE
bin/otrs.CheckSum.pl -a create

# add pre installed packages
mkdir var/packages/
wget "$SUPPORT_PACKAGE"
mv Support*.opm var/packages/

wget "$IPHONE_PACKAGE"
mv iPhoneHandle*.opm var/packages/

# --
# create tar
# --
cd $PACKAGE_BUILD_DIR/ || exit 1;
SOURCE_LOCATION=$SYSTEM_SOURCE_DIR/$PACKAGE-$VERSION.tar.gz
rm $SOURCE_LOCATION
echo "Building tar.gz..."
tar -czf $SOURCE_LOCATION $ARCHIVE_DIR/ || exit 1;
cp $SOURCE_LOCATION $PACKAGE_DEST_DIR/

# --
# create bzip2
# --
cd $PACKAGE_BUILD_DIR/ || exit 1;
SOURCE_LOCATION=$SYSTEM_SOURCE_DIR/$PACKAGE-$VERSION.tar.bz2
rm $SOURCE_LOCATION
echo "Building tar.bz2..."
tar -cjf $SOURCE_LOCATION $ARCHIVE_DIR/ || exit 1;
cp $SOURCE_LOCATION $PACKAGE_DEST_DIR/

# --
# create zip
# --
cd $PACKAGE_BUILD_DIR/ || exit 1;
SOURCE_LOCATION=$SYSTEM_SOURCE_DIR/$PACKAGE-$VERSION.zip
rm $SOURCE_LOCATION
echo "Building zip..."
zip -r $SOURCE_LOCATION $ARCHIVE_DIR/ || exit 1;
cp $SOURCE_LOCATION $PACKAGE_DEST_DIR/


# --
# create rpm spec files
# --
DESCRIPTION=$PATH_TO_CVS_SRC/scripts/auto_build/description.txt
FILES=$PATH_TO_CVS_SRC/scripts/auto_build/files.txt

# --
# build SuSE 11.0 rpm
# --
specfile=$PACKAGE_TMP_SPEC
# replace version and release
cat $ARCHIVE_DIR/scripts/suse-otrs-11.0.spec | sed "s/^Version:.*/Version:      $VERSION/" | sed "s/^Release:.*/Release:      $RELEASE/" > $specfile.tmp
# replace sourced files
perl -e "open(SPEC, '< $specfile.tmp');while(<SPEC>){\$spec.=\$_;};open(IN, '< $FILES');while(<IN>){\$i.=\$_;}\$spec=~s/<FILES>/\$i/g;print \$spec;" > $specfile.tmp1
# replace package description
perl -e "open(SPEC, '< $specfile.tmp1');while(<SPEC>){\$spec.=\$_;};open(IN, '< $DESCRIPTION');while(<IN>){\$i.=\$_;}\$spec=~s/<DESCRIPTION>/\$i/g;print \$spec;" > $specfile
$RPM_BUILD -ba --clean $specfile || exit 1;
rm $specfile || exit 1;

mv $SYSTEM_RPM_DIR/*/$PACKAGE*$VERSION*$RELEASE*.rpm $PACKAGE_DEST_DIR/RPMS/suse/11.0/
mv $SYSTEM_SRPM_DIR/$PACKAGE*$VERSION*$RELEASE*.src.rpm $PACKAGE_DEST_DIR/SRPMS/suse/11.0/

# --
# build SuSE 10.0 rpm
# --
specfile=$PACKAGE_TMP_SPEC
# replace version and release
cat $ARCHIVE_DIR/scripts/suse-otrs-10.0.spec | sed "s/^Version:.*/Version:      $VERSION/" | sed "s/^Release:.*/Release:      $RELEASE/" > $specfile.tmp
# replace sourced files
perl -e "open(SPEC, '< $specfile.tmp');while(<SPEC>){\$spec.=\$_;};open(IN, '< $FILES');while(<IN>){\$i.=\$_;}\$spec=~s/<FILES>/\$i/g;print \$spec;" > $specfile.tmp1
# replace package description
perl -e "open(SPEC, '< $specfile.tmp1');while(<SPEC>){\$spec.=\$_;};open(IN, '< $DESCRIPTION');while(<IN>){\$i.=\$_;}\$spec=~s/<DESCRIPTION>/\$i/g;print \$spec;" > $specfile
$RPM_BUILD -ba --clean $specfile || exit 1;
rm $specfile || exit 1;

mv $SYSTEM_RPM_DIR/*/$PACKAGE*$VERSION*$RELEASE*.rpm $PACKAGE_DEST_DIR/RPMS/suse/10.0/
mv $SYSTEM_SRPM_DIR/$PACKAGE*$VERSION*$RELEASE*.src.rpm $PACKAGE_DEST_DIR/SRPMS/suse/10.0/
# --
# build SuSE 9.1 rpm
# --
specfile=$PACKAGE_TMP_SPEC
# replace version and release
cat $ARCHIVE_DIR/scripts/suse-otrs-9.1.spec | sed "s/^Version:.*/Version:      $VERSION/" | sed "s/^Release:.*/Release:      $RELEASE/" > $specfile.tmp
# replace sourced files
perl -e "open(SPEC, '< $specfile.tmp');while(<SPEC>){\$spec.=\$_;};open(IN, '< $FILES');while(<IN>){\$i.=\$_;}\$spec=~s/<FILES>/\$i/g;print \$spec;" > $specfile.tmp1
# replace package description
perl -e "open(SPEC, '< $specfile.tmp1');while(<SPEC>){\$spec.=\$_;};open(IN, '< $DESCRIPTION');while(<IN>){\$i.=\$_;}\$spec=~s/<DESCRIPTION>/\$i/g;print \$spec;" > $specfile
$RPM_BUILD -ba --clean $specfile || exit 1;
rm $specfile || exit 1;

mv $SYSTEM_RPM_DIR/*/$PACKAGE*$VERSION*$RELEASE*.rpm $PACKAGE_DEST_DIR/RPMS/suse/9.1/
mv $SYSTEM_SRPM_DIR/$PACKAGE*$VERSION*$RELEASE*.src.rpm $PACKAGE_DEST_DIR/SRPMS/suse/9.1/
# --
# build SuSE 9.0 rpm
# --
specfile=$PACKAGE_TMP_SPEC
# replace version and release
cat $ARCHIVE_DIR/scripts/suse-otrs-9.0.spec | sed "s/^Version:.*/Version:      $VERSION/" | sed "s/^Release:.*/Release:      $RELEASE/" > $specfile.tmp
# replace sourced files
perl -e "open(SPEC, '< $specfile.tmp');while(<SPEC>){\$spec.=\$_;};open(IN, '< $FILES');while(<IN>){\$i.=\$_;}\$spec=~s/<FILES>/\$i/g;print \$spec;" > $specfile.tmp1
# replace package description
perl -e "open(SPEC, '< $specfile.tmp1');while(<SPEC>){\$spec.=\$_;};open(IN, '< $DESCRIPTION');while(<IN>){\$i.=\$_;}\$spec=~s/<DESCRIPTION>/\$i/g;print \$spec;" > $specfile
$RPM_BUILD -ba --clean $specfile || exit 1;
rm $specfile || exit 1;

mv $SYSTEM_RPM_DIR/*/$PACKAGE*$VERSION*$RELEASE*.rpm $PACKAGE_DEST_DIR/RPMS/suse/9.0/
mv $SYSTEM_SRPM_DIR/$PACKAGE*$VERSION*$RELEASE*.src.rpm $PACKAGE_DEST_DIR/SRPMS/suse/9.0/

# --
# build Fedora rpm
# --
cp $ARCHIVE_DIR/scripts/redhat-rpmmacros ~/.rpmmacros || exit 1
specfile=$PACKAGE_TMP_SPEC
cat $ARCHIVE_DIR/scripts/fedora-otrs-4.spec | sed "s/^Version:.*/Version:      $VERSION/" | sed "s/^Release:.*/Release:      $RELEASE/" > $specfile.tmp
# replace sourced files
perl -e "open(SPEC, '< $specfile.tmp');while(<SPEC>){\$spec.=\$_;};open(IN, '< $FILES');while(<IN>){\$i.=\$_;}\$spec=~s/<FILES>/\$i/g;print \$spec;" > $specfile.tmp1
# replace package description
perl -e "open(SPEC, '< $specfile.tmp1');while(<SPEC>){\$spec.=\$_;};open(IN, '< $DESCRIPTION');while(<IN>){\$i.=\$_;}\$spec=~s/<DESCRIPTION>/\$i/g;print \$spec;" > $specfile
$RPM_BUILD -ba --clean $specfile || exit 1;
rm $specfile || exit 1;
rm ~/.rpmmacros || exit 1;

mv $SYSTEM_RPM_DIR/*/$PACKAGE*$VERSION*$RELEASE*.rpm $PACKAGE_DEST_DIR/RPMS/fedora/4/
mv $SYSTEM_SRPM_DIR/$PACKAGE*$VERSION*$RELEASE*.src.rpm $PACKAGE_DEST_DIR/SRPMS/fedora/4/

# --
# stats
# --
echo "-----------------------------------------------------------------";
echo -n "Source code lines (*.sh) : "
find $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ -name *.sh | xargs cat | wc -l
echo -n "Source code lines (*.pl) : "
find $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ -name *.pl | xargs cat | wc -l
echo -n "Source code lines (*.pm) : "
find $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ -name *.pm | xargs cat | wc -l
echo -n "Source code lines (*.t) : "
find $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ -name *.t | xargs cat | wc -l
echo -n "Source code lines (*.dtl): "
find $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ -name *.dtl | xargs cat | wc -l
echo -n "Source code lines (*.xml): "
find $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ -name *.xml | xargs cat | wc -l
echo -n "Source code lines (*.js): "
find $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ -name *.js | xargs cat | wc -l
echo -n "Source code lines (*.css): "
find $PACKAGE_BUILD_DIR/$ARCHIVE_DIR/ -name *.css | xargs cat | wc -l
echo "-----------------------------------------------------------------";
echo "You will find your tar.gz, RPMs and SRPMs in $PACKAGE_DEST_DIR";
cd $PACKAGE_DEST_DIR
find . -name "*$PACKAGE*" | xargs ls -lo
echo "-----------------------------------------------------------------";
if which md5sum >> /dev/null; then
    echo "MD5 message digest (128-bit) checksums";
    find . -name "*$PACKAGE*" | xargs md5sum
else
    echo "No md5sum found in \$PATH!"
fi
echo "-----------------------------------------------------------------";
echo "Note: You may have to tag your cvs tree:     cvs tag rel-2_x_x";
echo "Note: You may have to branch your cvs tree:  cvs tag -b rel-2_x";
echo "Note: To delete a tag:                       cvs tag -d rel-2_x_x";
echo "Note: To check out by timestamp:             cvs co -r rel-2_x -D \"2008-10-02 17:00\" otrs";
echo "-----------------------------------------------------------------";

# --
# cleanup
# --
rm -rf $PACKAGE_BUILD_DIR
rm -rf $PACKAGE_TMP_SPEC
