#!/bin/sh

if [ -z "$ORIG_PATH" ] ; then
   export PATH=$HOME/depot_tools
else
   export PATH=$ORIG_PATH:$HOME/depot_tools
fi
export PS1='STOCK:\w$(__git_ps1 " [%s]")\n>> '
