#!/bin/bash
echo
( set -x ; adb shell am startservice -n com.google.vr.vrcore/.capture.record.RecorderService --es command START --es path /sdcard/$1 )
echo Press any key to stop
read -n1 key
echo
( set -x ; adb shell am startservice -n com.google.vr.vrcore/.capture.record.RecorderService --es command STOP )
echo Press \'s\' to pull down file
read -n1 key
if [ "$key" = "s" ]; then
  echo ave
  echo
  ( set -x ; adb pull /sdcard/$1 )
fi
