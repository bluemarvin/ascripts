#!/bin/sh
build_usage()
{
   echo options:
   echo "   -s        : start recording"
}

export RECORD_MODE=0

while getopts s ARG
do
   case "$ARG" in
   s) export RECORD_MODE=1;;
   [?]) build_usage
        exit -1;;
   esac
done

adb shell setprop debug.oculus.enableVideoCapture $RECORD_MODE
