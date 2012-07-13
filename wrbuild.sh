#!/bin/sh

APK=false
INSTALL=false

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
}


while getopts ai ARG
do
   case "$ARG" in
   a) APK=true;;
   i) INSTALL=true;;
   [?]) build_usage
        exit -1;;
   esac
done
cd $HOME/chromium/src
source build/android/envsetup.sh
android_gyp
if [ "true" = $APK ] ; then
  make -j8 chrome_apk
else
  make -j8 webruntime
fi

[ "$?" = "0" ] || failed "Build Failed"

if [ "true" = $INSTALL ] ; then
   adb shell /data/killwebruntime.sh
   if [ "true" = $APK ] ; then
      adb shell pm disable com.amazon.cloud9
      adb shell pm disable com.amazon.webruntime
      adb install -r out/Release/WebRuntime-release.apk
      adb shell pm enable com.amazon.webruntime
      adb shell pm enable com.amazon.cloud9
   else
      adb push out/Release/webruntime /data/data/com.amazon.webruntime/files/webruntime/.
      adb push out/Release/webruntime.pak /data/data/com.amazon.webruntime/files/webruntime/.
   fi
fi
