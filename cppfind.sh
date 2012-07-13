#!/bin/sh
find . -name \*.cpp | xargs grep -n $1
