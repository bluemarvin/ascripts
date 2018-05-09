#!/bin/bash
TARGET=$1
if [ -z $TARGET ] ; then
TARGET="/Volumes/firefox/vr/obj-arm-linux-androideabi/gradle/build/mobile/android/geckoview"
fi
cd $TARGET && simple-server.sh
