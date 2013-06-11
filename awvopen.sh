#!/bin/sh
echo
echo Running HTML test: $1
echo
adb shell am start -a android.intent.action.VIEW -n com.amazon.webview.app/.MainActivity -d $1 > /dev/null
