#!/bin/bash
url=$1

exec adb shell am start -a android.intent.action.VIEW -d "$url"  org.mozilla.geckoviewvr/org.mozilla.geckoviewvr.MainActivity
