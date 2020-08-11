#!/bin/bash
FXR_SKYBOX_DIRECTORY=./app/src/main/assets/cubemap/space
#FXR_SKYBOX_DIRECTORY=./app/src/uncompressed_assets/main/assets/cubemap/space
adb shell rm -rf /storage/emulated/0/Android/data/org.mozilla.vrbrowser/files/skybox
adb push $FXR_SKYBOX_DIRECTORY /storage/emulated/0/Android/data/org.mozilla.vrbrowser/files/skybox
adb shell ls /storage/emulated/0/Android/data/org.mozilla.vrbrowser/files/skybox
