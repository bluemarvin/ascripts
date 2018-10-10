#!/bin/bash
if [ -f ./mach ] ; then
./mach lint mobile/android/chrome/geckoview mobile/android/components/geckoview mobile/android/modules/geckoview
else
echo Error, mach not found
fi
