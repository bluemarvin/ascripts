#!/bin/bash
url=$1

if [ -z "$url" ] ; then
exec adb shell am start -n com.oculus.vrshell/.MainActivity -d apk://com.oculus.browser
else
exec adb shell am start -n com.oculus.vrshell/.MainActivity -d apk://com.oculus.browser -e uri $url
fi
