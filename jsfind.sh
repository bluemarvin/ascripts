#!/bin/sh
find . \( -name '*.js' -o -name '*.jsm' \) | xargs grep -n $1
