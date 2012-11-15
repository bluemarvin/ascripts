#!/bin/sh

NUM_OF_JOBS=`cat /proc/cpuinfo | grep processor | wc -l`
echo Number of jobs: $NUM_OF_JOBS
APK=false
INSTALL=false
GENERATE=false
STAGE=false
STAGING_DIR=$HOME/staging
BINARY=webruntime
TARGET_DIR=/data/data/com.amazon.webruntime/files/webruntime
SRC_NAME=chromium_16
BUILD_TYPE=Release
SKIP_STRIP=false

failed()
{
   echo $1
   exit 1
}

build_usage()
{
   echo options:
   echo "   -a        : create APK"
   echo "   -d        : build debug"
   echo "   -g        : generate gyp project"
   echo "   -i        : install on device"
   echo "   -l <name> : location name (i.e. chromium, upstream)"
   echo "   -s        : stage binary"
   echo "   -v        : verbose make"
   echo "   -w        : whole binary, skip binary strip"
}

while getopts adgil:svw ARG
do
   case "$ARG" in
   a) APK=true;;
   d) BUILD_TYPE=Debug;;
   g) GENERATE=true;;
   i) INSTALL=true;;
   l) SRC_NAME=$OPTARG;;
   s) STAGE=true;;
   v) VERBOSE="V=1";;
   w) SKIP_STRIP=true;;
   [?]) build_usage
        exit -1;;
   esac
done

SRC_DIR=$HOME/$SRC_NAME/src/out/$BUILD_TYPE
cd $HOME/$SRC_NAME/src

source build/android/envsetup.sh

if [ "true" = $GENERATE ] ; then
   android_gyp
fi

if [ "true" = $APK ] ; then
   make -j$NUM_OF_JOBS BUILDTYPE=$BUILD_TYPE $VERBOSE chrome_apk
else
   make -j$NUM_OF_JOBS BUILDTYPE=$BUILD_TYPE $VERBOSE webruntime
fi

[ "$?" = "0" ] || failed "Build Failed"

if [ ! -e "$STAGING_DIR" ] ; then
   mkdir --parents $STAGING_DIR
fi

if [ "true" = $STAGE -o \( "true" = $INSTALL -a "false" = $APK \) ] ; then
   if [ "Release" = $BUILD_TYPE -a "false" = $SKIP_STRIP ] ; then
      echo Stripping Binary $BINARY
      $HOME/android-toolchain-eabi-64/arm-eabi/bin/strip $SRC_DIR/$BINARY -o $STAGING_DIR/$BINARY
      [ "$?" = "0" ] || failed "Strip Failed"
   else
      echo Staging Binary $BINARY
      cp $SRC_DIR/$BINARY $STAGING_DIR/$BINARY
      [ "$?" = "0" ] || failed "Copy to Staging Failed"
   fi
   gzip --best -f $STAGING_DIR/$BINARY
   [ "$?" = "0" ] || failed "Compress Failed"
fi

if [ "true" = $INSTALL ] ; then
   adb shell /data/killwebruntime.sh > /dev/null
   if [ "true" = $APK ] ; then
      adb shell pm disable com.amazon.cloud9
      adb shell pm disable com.amazon.webruntime
      adb shell rm -r /data/data/com.amazon.webruntime
      adb install -r $SRC_DIR/WebRuntime-release.apk
      adb shell pm enable com.amazon.webruntime
      adb shell pm enable com.amazon.cloud9
      adb shell am start -a android.intent.action.VIEW -n com.amazon.cloud9/.BrowserActivity -d http://en.wikipedia.org/wiki/Microman > /dev/null
   else
      adb push $STAGING_DIR/$BINARY.gz $TARGET_DIR/.
      adb shell busybox gunzip -f $TARGET_DIR/$BINARY.gz
      adb push $SRC_DIR/webruntime.pak $TARGET_DIR/.
   fi
   [ "$?" = "0" ] || failed "Install Failed"
fi
