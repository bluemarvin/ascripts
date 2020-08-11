#!/bin/bash
url=$1

if [ -z "$url" ] ; then
exec adb shell am start -a android.intent.action.LAUNCH org.mozilla.vrbrowser.wavevr/org.mozilla.vrbrowser.VRBrowserActivity
else
exec adb shell am start -a android.intent.action.VIEW -d "$url" org.mozilla.vrbrowser.wavevr/org.mozilla.vrbrowser.VRBrowserActivity
fi
