#!/bin/sh
find . -name \*.js | xargs grep -n $1
