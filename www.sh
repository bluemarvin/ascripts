#!/bin/sh
if [ -n "$1" ] ; then
  PORT="$1"
else
  PORT="8000"
fi

python -m SimpleHTTPServer $PORT
