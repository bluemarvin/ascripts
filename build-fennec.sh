#!/bin/sh
make -f client.mk && make -f client.mk package && install-fennec.sh
