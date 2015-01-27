#!/bin/bash

if [ -n "$1" ] ; then
  COUNT="$1"
else
  COUNT="1"
fi

echo count = $COUNT $1

LIST=`git log --format=format:%H -$COUNT $2`

for h in $LIST ; do
if [ $COUNT -lt 10 ] ; then
  PAD='000'
elif [ $COUNT -lt 100 ] ; then
  PAD='00'
elif [ $COUNT -lt 1000 ] ; then
  PAD='00'
fi
DATE=`date "+%y%m%d%H"`
NAME=`git log -1 --format=format:$PAD$COUNT-%f-$DATE-%h.patch $h`
echo $NAME
git hgp $h > ~/$NAME
let COUNT-=1
done
