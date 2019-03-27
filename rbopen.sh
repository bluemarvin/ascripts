#!/bin/bash
url="$1"
echo adb shell am start -a android.intent.action.VIEW -d "$url" org.mozilla.reference.browser/
exec adb shell am start -a android.intent.action.VIEW -d "$url" org.mozilla.reference.browser/

