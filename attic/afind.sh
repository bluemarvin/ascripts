#!/bin/sh
find . -type f -exec file --mime-type {} \; | grep ": text" | cut -d ':' -f1 | xargs grep -n $1
