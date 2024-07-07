#!/bin/sh
#
# This script prints out the current CPU usage percentage as an integer.
# This value is formatted with a percent-symbol, and intended to be used as a
# helper for various bar-modules.
#
# Ex: 21%

printf "$((100-$( \
	vmstat 1 2 \
	| tail -1 \
	| awk '{printf $15}')))%%"
