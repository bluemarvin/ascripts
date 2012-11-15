#!/bin/sh
echo
echo ======================
echo " Upload HTML Files"
echo ======================
echo
if [ -z "$HTML_SRC_LOCATION" ] ; then
  SRC_DIR=$HOME/src
else
  SRC_DIR=$HTML_SRC_LOCATION
fi
HTML=html.tgz
STARTDIR=$PWD
cd $SRC_DIR
tar --exclude=.git\* -czvf $HTML ./html > /dev/null
adb push $HTML /mnt/sdcard/.
adb shell busybox tar -C /mnt/sdcard -xvf /mnt/sdcard/$HTML > /dev/null
adb shell rm /mnt/sdcard/$HTML
rm -f $HTML
cd $STARTDIR

