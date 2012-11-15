#!/bin/sh
STAMP=`date +%y%m%d%M%S`
TARGET_DIR=$HOME/tombstones/$STAMP
mkdir -p $TARGET_DIR
adb pull /data/tombstones/ $TARGET_DIR
adb shell rm /data/tombstones/tombstone_*
