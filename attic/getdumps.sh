#!/bin/sh
STAMP=`date +%y%m%d%M%S`
TARGET_DIR=$HOME/screendumps/$STAMP
mkdir -p $TARGET_DIR
PREFIX=screendump-
FILE=sdfiles-$STAMP.tgz
STARTDIR=$PWD
adb shell busybox tar -czvf /data/$FILE /data/$PREFIX*.png # > /dev/null
adb pull /data/$FILE $TARGET_DIR/$FILE
adb shell rm /data/$FILE /data/$PREFIX*.png
cd $TARGET_DIR
tar xvf $FILE
eog ./data/$PREFIX*.png
cd $STARTDIR
