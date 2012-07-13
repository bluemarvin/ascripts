#!/bin/sh
echo
echo ======================
echo " Device Setup Started"
echo ======================
echo
FILE=setup.tgz
HTML=html.tgz
STARTDIR=$PWD
cd $HOME/scripts/device
LIST=`ls -1 *.sh`
rm -f $FILE
tar czvf $FILE *.sh
adb push $FILE /data/.
adb shell busybox tar -C /data -xvf /data/$FILE
adb shell rm /data/$FILE
for CURRENT in $LIST ; do
   adb shell chmod 755 /data/$CURRENT
done
rm -f $FILE
cd $HOME/src
tar --exclude=.git\* -czvf $HTML ./html
adb push $HTML /data/.
adb shell busybox tar -C /data -xvf /data/$HTML
adb shell rm /data/$HTML
rm -f $HTML
cd $STARTDIR
echo
echo ======================
echo Device Setup Completed
echo ======================
echo
