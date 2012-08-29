#!/bin/sh

TARGET_DIR=/data/data/com.amazon.webruntime/files/webruntime
PAKS_DIR=$TARGET_DIR/config/paks
LOCAL_DIR=$TARGET_DIR/locales
SRC_NAME=chromium

failed()
{
   echo $1
   exit 1
}

build_usage()
{
   echo options:
   echo "   -l            : location"
}


while getopts agil:sv ARG
do
   case "$ARG" in
   l) SRC_NAME=$OPTARG;;
   v) VERBOSE="V=1";;
   [?]) build_usage
        exit -1;;
   esac
done

SRC_DIR=$HOME/$SRC_NAME/src/out/Release
cd $HOME/$SRC_NAME/src

adb shell busybox mkdir -p $PAKS_DIR
adb push $SRC_DIR/webruntime.pak $PAKS_DIR/.
adb push $SRC_DIR/theme_resources_standard.pak $PAKS_DIR/.
adb push $SRC_DIR/ui_resources_standard.pak $PAKS_DIR/.
cd $SRC_DIR/locales/
tar czvf ~/local.tgz *.pak
adb shell busybox mkdir -p $LOCAL_DIR
adb push ~/local.tgz $LOCAL_DIR
adb shell busybox tar -C $LOCAL_DIR -xvf $LOCAL_DIR/local.tgz
rm ~/local.tgz
