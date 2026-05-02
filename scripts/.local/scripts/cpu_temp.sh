#!/usr/bin/env sh

awk '{printf $1/1000 "°C"}' "/sys/class/thermal/thermal_zone0/temp"
