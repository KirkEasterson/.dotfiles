#!/usr/bin/env sh

free -t |
	awk 'NR == 2 {printf("%.1f%"), $3/$2*100}'
