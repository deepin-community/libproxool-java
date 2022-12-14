#!/bin/sh -e

# called by uscan with '--upstream-version' <version> <file>
DIR=libproxool-java-$2.orig

# clean up the upstream tarball
tar zxf $3
mv proxool-*/ $DIR
GZIP=--best tar -c -z -f $3 -X debian/orig-tar.exclude $DIR
rm -rf $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $3 $origDir
  echo "moved $3 to $origDir"
fi
