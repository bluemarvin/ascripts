#!/bin/bash

if [ -z "$VRBSUFIX" ] ; then
  INTERNAL_INSTALLED=`adb shell pm list packages org.mozilla.vrbrowser.internal`
  DEV_INSTALLED=`adb shell pm list packages org.mozilla.vrbrowser.dev`
  if [ ! -z "$INTERNAL_INSTALLED" ] ; then
    >&2 echo Using $INTERNAL_INSTALLED
    VRBSUFIX=.internal
  elif [ ! -z "$DEV_INSTALLED" ] ; then
    >&2 echo Using $DEV_INSTALLED
    VRBSUFIX=.dev
  else
    >&2 echo Using default suffix
    VRBDEV=""
  fi
fi

echo $VRBSUFIX
