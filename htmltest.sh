#!/bin/sh
adb shell am start -a android.intent.action.VIEW -n com.amazon.cloud9/.BrowserActivity -d file:///data/html/$1
