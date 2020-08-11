#!/bin/sh

VRBPACKAGE=`getvrbpackage.sh`

adb shell pm clear org.mozilla.vrbrowser$VRBPACKAGE
