#!/bin/sh
LNAME=$1
if [ -z $LNAME ] ; then
LNAME=`whoami`
fi
echo adb shell am start -a org.mozilla.gecko.SHUTDOWN -n org.mozilla.fennec_$LNAME/org.mozilla.gecko.BrowserApp
adb shell am start -a org.mozilla.gecko.SHUTDOWN -n org.mozilla.fennec_$LNAME/org.mozilla.gecko.BrowserApp
