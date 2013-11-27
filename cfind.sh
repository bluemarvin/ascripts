#!/bin/sh
find . -name \*.c | xargs grep -n $1
