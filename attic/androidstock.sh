#!/bin/sh
NUM_OF_JOBS=`cat /proc/cpuinfo | grep processor | wc -l`

alias go="cd $HOME/chromium_stock/src"
alias bld="time make -j$NUM_OF_JOBS BUILDTYPE=Release"
alias dbld="time make -j$NUM_OF_JOBS BUILDTYPE=Debug"
alias nbld="time ninja -C out/Release"
alias ndbld="time ninja -C out/Debug"

MY_PATH=$HOME/scripts:$HOME/depot_tools

if [ -z "$ORIG_PATH" ] ; then
   export PATH=$MY_PATH
else
   export PATH=$ORIG_PATH:$MY_PATH
fi

source $HOME/chromium_stock/src/build/android/envsetup.sh

export PS1='\[\e[1;31m\]ANDROID\[\e[m\]:\w$(__git_ps1 " [%s]")\n>> '
