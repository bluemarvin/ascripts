#!/bin/sh
build_usage()
{
   echo options:
   echo "   -o        : use opt"
}

while getopts o ARG
do
   case "$ARG" in
   o) export BUILD_SETTING_OPT=true;;
   [?]) build_usage
        exit -1;;
   esac
done

if test "$BUILD_SETTING_OPT" = "true" ; then
  echo Building optimized
fi

if [ -f ./mach ] ; then
./mach gradle geckoview_example:installLocalWithGeckoBinariesNoMinApiDebug
else
echo Error, mach not found
fi
