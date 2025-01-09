#!/bin/bash
#
# This script prints out the current CPU temperature in celsius as an integer.
# This value is formatted with a degree-symbol, and intended to be used as a
# helper for various bar-modules.
#
# Ex: 48°C

awk '{printf $1/1000 "°C"}' "/sys/class/thermal/thermal_zone0/temp"
