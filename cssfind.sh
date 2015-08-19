#!/bin/sh
find . -name '*.css' | xargs grep -n $1
