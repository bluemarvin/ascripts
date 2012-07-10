#!/bin/sh
WRPATH=/data/data/com.amazon.webruntime
adb shell pm disable com.amazon.webruntime
adb shell /data/killwebruntime.sh
adb shell "cd $WRPATH/files/webruntime; LD_LIBRARY_PATH=$WRPATH/lib ./webruntime"
