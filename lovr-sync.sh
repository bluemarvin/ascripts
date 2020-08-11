#!/bin/sh
LOVR_APP_PATH=$1
if [ -z $LOVR_APP_PATH ] ; then
LOVR_APP_PATH="."
fi
echo adb push --sync $LOVR_APP_PATH /sdcard/Android/data/org.lovr.test/files/.lodr
adb push --sync $LOVR_APP_PATH /sdcard/Android/data/org.lovr.test/files/.lodr
