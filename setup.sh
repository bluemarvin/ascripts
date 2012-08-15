#!/bin/sh
echo
echo ======================
echo " Device Setup Started"
echo ======================
echo
FILE=setup.tgz
STARTDIR=$PWD
echo
echo ======================
echo "   Upload Scripts"
echo ======================
echo
cd $HOME/scripts/device
LIST=`ls -1 *.sh`
rm -f $FILE
tar czvf $FILE *.sh > /dev/null
adb push $FILE /data/.
adb shell busybox tar -C /data -xvf /data/$FILE > /dev/null
adb shell rm /data/$FILE
for CURRENT in $LIST ; do
   adb shell chmod 755 /data/$CURRENT
done
rm -f $FILE
echo
echo ======================
echo " Developer Options"
echo ======================
echo
adb shell /data/developer_options.sh
# Don't bother uploading html files since they can no longer be loaded in the browser.
#updatehtml.sh
cd $STARTDIR
echo
echo ======================
echo Device Setup Completed
echo ======================
echo
