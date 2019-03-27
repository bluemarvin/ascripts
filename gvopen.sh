#!/bin/bash
url=""
multi="true"
while [ -n "$1" ]; do
    case $1 in
        --no-multi)
            multi="false"
            ;;
        *)
            url=$1
            ;;
    esac
    shift
done

exec adb shell am start -a android.intent.action.VIEW -d "$url" --ez use_multiprocess $multi org.mozilla.geckoview_example/.GeckoViewActivity
