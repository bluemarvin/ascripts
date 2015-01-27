#!/bin/sh
PKG_FILE=webrtcplayer_cramfs.bin
TARGET=/tmp/$PKG_FILE
scp work:~/src/webrtc-roku/$PKG_FILE $TARGET
curl -v --user rokudev:1111 --anyauth -S -F "mysubmit=Install" -F "archive=@$TARGET" -F "passwd=" http://10.0.1.3/plugin_install
