#!/bin/sh

echo adb shell screenrecord /sdcard/$1
adb shell screenrecord /sdcard/$1
