#!/bin/sh
echo '#include <android/log.h>\n#define RLOG(format, ...) __android_log_print(ANDROID_LOG_INFO, "reb", format, ##__VA_ARGS__);\n#define RLINE RLOG("%s:%s:%d", __FILE__, __FUNCTION__, __LINE__)\n' | pbcopy
