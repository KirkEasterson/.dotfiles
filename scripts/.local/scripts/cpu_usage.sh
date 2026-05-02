#!/usr/bin/env sh

printf "$((100 - $(
	vmstat 1 2 |
		tail -1 |
		awk '{printf $15}'
)))%%"
