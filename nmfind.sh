#!/bin/sh

SYMBOL=$1

for FILE in *.so ; do
  if [ -n "`nm $FILE 2> /dev/null | grep -sl $SYMBOL`" ] ; then
    echo $FILE
    nm $FILE | grep $SYMBOL
  fi
done
