#!/bin/sh
find . -name \*.java | xargs grep -n $1
