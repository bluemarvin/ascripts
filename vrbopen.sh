#!/bin/bash
url=$1

exec adb shell am start -a android.intent.action.VIEW -d "$url"  org.mozilla.vrbrowser/org.mozilla.vrbrowser.VRBrowserActivity
