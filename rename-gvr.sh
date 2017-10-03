#!/bin/sh
SOURCE=$HOME/AndroidStudioProjects/GeckoViewVR/app/build/outputs/apk/app-debug.apk
TARGET=GeckoViewVR-`stat -f %Sm -t "%y%m%d%H%M%S" $SOURCE`.apk

echo cp $SOURCE $HOME/$TARGET
cp $SOURCE $HOME/$TARGET
