#!/bin/sh

if [ -z $NM ] ; then
  NM=nm
fi

SYMBOL=$1

for FILE in *.a *.so ; do
  if [ -n "`$NM $FILE 2> /dev/null | grep -sl $SYMBOL`" ] ; then
    echo
    echo $FILE
    $NM $FILE | grep $SYMBOL
  fi
done
