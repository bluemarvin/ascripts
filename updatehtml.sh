#!/bin/sh
echo
echo ======================
echo " Upload HTML Files"
echo ======================
echo
if [ "$HTML_SRC_LOCATION" = "" ] ; then
  SRC_DIR=$HOME/src
else
  SRC_DIR=$HTML_SRC_LOCATION
fi
HTML=html.tgz
STARTDIR=$PWD
cd $SRC_DIR
tar --exclude=.git\* -czvf $HTML ./html > /dev/null
adb push $HTML /data/.
adb shell busybox tar -C /data -xvf /data/$HTML > /dev/null
adb shell rm /data/$HTML
rm -f $HTML
cd $STARTDIR

