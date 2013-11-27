#!/bin/sh
./mach build && ./mach package && adb install -r `find . -name fennec-\*.android-arm.apk`
