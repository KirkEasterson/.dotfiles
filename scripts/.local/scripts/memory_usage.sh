#!/bin/sh
#
# This script prints out the current memory usage as a float with one degree of
# precision. This value is formatted with a degree-symbol, and intended to be
# used as a helper for various bar-modules.
#
# Ex: 21%

free -t \
	| awk 'NR == 2 {printf("%.1f%"), $3/$2*100}'
