#!/bin/sh -e

# called by uscan with '--upstream-version' <version> <file>

DIR=otrs-*

tar -x -z -f $3 --exclude '*/doc/manual*'
rm -rf $DIR/var/httpd/htdocs/yui/2.7.0
tar -c -z -f $3 $DIR
rm -rf $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $3 $origDir
  echo "moved $3 to $origDir"
fi
