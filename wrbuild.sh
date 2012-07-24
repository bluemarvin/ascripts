#!/bin/sh

NUM_OF_JOBS=`cat /proc/cpuinfo | grep processor | wc -l`
echo Number of jobs: $NUM_OF_JOBS
APK=false
INSTALL=false
GENERATE=false
STAGE=false
STAGING_DIR=$HOME/staging
BINARY=webruntime
SRC_DIR=$HOME/chromium/src/out/Release
TARGET_DIR=/data/data/com.amazon.webruntime/files/webruntime

failed()
{
   echo $1
   exit 1
}

build_usage()
{
   echo options:
   echo "	-a            : create APK"
   echo "	-i            : install on device"
   echo "   -g            : generate gyp project"
   echo "   -s            : stage binary"
}

while getopts aigs ARG
do
   case "$ARG" in
   a) APK=true;;
   i) INSTALL=true;;
   g) GENERATE=true;;
   s) STAGE=true;;
   [?]) build_usage
        exit -1;;
   esac
done

cd $HOME/chromium/src

source build/android/envsetup.sh

if [ "true" = $GENERATE ] ; then
   android_gyp
fi

if [ "true" = $APK ] ; then
   make -j$NUM_OF_JOBS chrome_apk
else
   make -j$NUM_OF_JOBS webruntime
fi

[ "$?" = "0" ] || failed "Build Failed"

if [ ! -e "$STAGING_DIR" ] ; then
   mkdir --parents $STAGING_DIR
fi

if [ "true" = $STAGE -o \( "true" = $INSTALL -a "false" = $APK \) ] ; then
   $HOME/android-toolchain-eabi-64/arm-eabi/bin/strip $SRC_DIR/$BINARY -o $STAGING_DIR/$BINARY
   [ "$?" = "0" ] || failed "Strip Failed"
   gzip --best -f $STAGING_DIR/$BINARY
   [ "$?" = "0" ] || failed "Compress Failed"
fi

if [ "true" = $INSTALL ] ; then
   adb shell /data/killwebruntime.sh
   if [ "true" = $APK ] ; then
      adb shell pm disable com.amazon.cloud9
      adb shell pm disable com.amazon.webruntime
      adb install -r $SRC_DIR/WebRuntime-release.apk
      adb shell pm enable com.amazon.webruntime
      adb shell pm enable com.amazon.cloud9
   else
      adb push $STAGING_DIR/$BINARY.gz $TARGET_DIR/.
      adb shell busybox gunzip -f $TARGET_DIR/$BINARY.gz
      adb push $SRC_DIR/webruntime.pak $TARGET_DIR/.
   fi
   [ "$?" = "0" ] || failed "Install Failed"
fi
