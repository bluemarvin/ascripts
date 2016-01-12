#!/bin/sh
if [ -f ./mach ] ; then
./mach build && ./mach package && ./mach install
else
echo Error, mach not found
fi
