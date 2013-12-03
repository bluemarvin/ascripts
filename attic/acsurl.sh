#!/bin/sh
# Loading local files is no longer allowed. Load pages from github.
#if [ -z "$HTML_SRC_LOCATION" ] ; then
#  SRC_DIR=$HOME/src
#else
#  SRC_DIR=$HTML_SRC_LOCATION
#fi
#adb shell "test -f /data/html/$1 && echo 0 || echo 1" | grep 0 > /dev/null
#if [ "1" = "$?" ] ; then # Failed to find file on device
#   if [ -f $SRC_DIR/html/$1 ] ; then # Check if file exists locally
#      updatehtml.sh
#   else
#      echo
#      echo \* ERROR: HTML test $1 does not exist
#      echo
#      exit 1
#   fi
#fi
echo
echo Running HTML test: $1
echo
adb shell am start -a android.intent.action.VIEW -n org.chromium.content_shell/.ContentShellActivity -d http://bluemarvin.github.com/html/$1 > /dev/null
