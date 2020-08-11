#!/bin/bash

VRBPACKAGE=`getvrbpackage.sh`

adb shell am force-stop org.mozilla.vrbrowser$VRBPACKAGE
adb shell pm clear org.mozilla.vrbrowser$VRBPACKAGE
adb uninstall org.mozilla.vrbrowser$VRBPACKAGE
