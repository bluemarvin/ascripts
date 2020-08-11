#!/bin/bash
if [ -f ./mach ] ; then
./mach android api-lint && ./mach android archive-geckoview && ./mach lint mobile/android/chrome/geckoview mobile/android/components/geckoview mobile/android/modules/geckoview && ./mach android checkstyle
else
echo Error, mach not found
fi
