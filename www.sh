#!/bin/sh
if [ -n "$1" ] ; then
  PORT="$1"
else
  PORT="8000"
fi
ifconfig | grep inet[^6] | grep -v 127.0.0.1
python -m SimpleHTTPServer $PORT
