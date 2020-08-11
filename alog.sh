#!/bin/sh -x
CLIPBOARD=`command -v xclip`
if [ -z "$CLIPBOARD" ] ; then
CLIPBOARD=`command -v pbcopy`
else
CLIPBOARD="$CLIPBOARD -selection c"
fi
if [ -z "$CLIPBOARD" ] ; then
echo "Unable to find clipboard application"
exit -1
fi
echo '#include <android/log.h>\n#define RLOG(format, ...) __android_log_print(ANDROID_LOG_INFO, "reb", format, ##__VA_ARGS__);\n#define RLINE RLOG("%s:%s:%d", __FILE__, __FUNCTION__, __LINE__)\n' | $CLIPBOARD
