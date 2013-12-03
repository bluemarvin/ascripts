#!/bin/sh

SRC_NAME=chromium
BUILD_TYPE=Release

failed()
{
   echo $1
   exit 1
}

build_usage()
{
   echo options:
   echo "   -d        : use debug"
   echo "   -l <name> : location name (i.e. chromium, upstream)"
}

while getopts dl: ARG
do
   case "$ARG" in
   d) BUILD_TYPE=Debug;;
   l) SRC_NAME=$OPTARG;;
   [?]) build_usage
        exit -1;;
   esac
done

SRC_DIR=$HOME/$SRC_NAME/src/out/$BUILD_TYPE
cd $HOME/$SRC_NAME/src

adb shell pm disable com.amazon.cloud9
adb shell pm disable com.amazon.webruntime
adb shell rm -r /data/data/com.amazon.webruntime
adb install -r $SRC_DIR/WebRuntime-release.apk
adb shell pm enable com.amazon.webruntime
adb shell pm enable com.amazon.cloud9
