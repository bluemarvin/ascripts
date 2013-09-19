#!/bin/sh
find . -name \*.ipdl | xargs grep -n $1
