#!/bin/bash

VRBPACKAGE=`getvrbpackage.sh`

adb shell am force-stop org.mozilla.vrbrowser$VRBPACKAGE
