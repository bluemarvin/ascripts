#!/bin/sh
./build.sh gecko && ./flash.sh gecko && adb reboot && adb logcat | grep reb
