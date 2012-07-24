#!/bin/sh
NUM_OF_JOBS=`cat /proc/cpuinfo | grep processor | wc -l`

alias go="cd $HOME/chromium_stock/src"
alias bld="time make -j$NUM_OF_JOBS BUILDTYPE=Release chrome"

export USE_64BIT_TC=1
export USE_CCACHE=1
export PREBUILT_CCACHE_PATH=/usr/bin/ccache
export CCACHE_DIR=$HOME/.ccache_stock

MY_PATH=$HOME/scripts:$HOME/depot_tools

if [ -z "$ORIG_PATH" ] ; then
   export PATH=$MY_PATH
else
   export PATH=$ORIG_PATH:$MY_PATH
fi

export PS1='\[\e[1;31m\]STOCK\[\e[m\]:\w$(__git_ps1 " [%s]")\n>> '
