#!/bin/sh
find . -name \*.h | xargs grep -n $1
