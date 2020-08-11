#!/bin/sh
echo $*
adb shell input text "$*"
