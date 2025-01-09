#!/bin/sh

wlr-randr \
	| grep -v "^ " \
	| cut -d " " -f1 \
	| xargs -I {} wlr-randr --output {} --$1
