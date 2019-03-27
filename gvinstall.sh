#!/bin/sh
build_usage()
{
   echo options:
   echo "   -d        : use debug"
}

while getopts d ARG
do
   case "$ARG" in
   o) export BUILD_SETTING_DEBUG=true;;
   [?]) build_usage
        exit -1;;
   esac
done

if test "$BUILD_SETTING_DEBUG" = "true" ; then
  echo Building debug
fi

if [ -f ./mach ] ; then
./mach gradle geckoview_example:installWithGeckoBinariesDebug
else
echo Error, mach not found
fi
