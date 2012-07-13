#!/bin/sh
find . -name \*.cc | xargs grep -n $1
