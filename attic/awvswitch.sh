#!/bin/sh
if [ "$ADB" = "" ] ; then
  ADB=adb
fi

if [ "$1" = "android" ] ; then
FACTORY=com.amazon.android.webkit.android.AndroidWebKitFactory
else
FACTORY=com.amazon.android.webkit.embedded.EmbeddedWebKitFactory
fi

$ADB shell setprop "Standalone AmazonWebViewApp.wv" $FACTORY
