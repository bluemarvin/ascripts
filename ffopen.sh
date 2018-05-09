#!/bin/sh
LNAME=$2
if [ -z $LNAME ] ; then
LNAME=`whoami`
fi
echo adb shell am start -a android.intent.action.VIEW -n org.mozilla.fennec_$LNAME/.App -d $1
adb shell am start -a android.intent.action.VIEW -n org.mozilla.fennec_$LNAME/org.mozilla.gecko.BrowserApp -d $1
