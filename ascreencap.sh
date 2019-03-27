#!/bin/sh
FILE_NAME=$1
if [ -z "$FILE_NAME" ] ; then
  FILE_NAME="Screen_Shot_`date +%y%m%d%M%S`.png"
fi

adb exec-out screencap -p > $FILE_NAME
