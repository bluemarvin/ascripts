#!/bin/sh
SOURCE=$HOME/AndroidStudioProjects/GeckoViewVR/app/build/outputs/apk/debug/app-debug.apk
#SOURCE=$HOME/AndroidStudioProjects/GeckoViewVR/app/app-release.apk
TARGET=GeckoViewVR-`stat -f %Sm -t "%y%m%d%H%M%S" $SOURCE`.apk

echo cp $SOURCE $HOME/$TARGET
cp $SOURCE $HOME/$TARGET
