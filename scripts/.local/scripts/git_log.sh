#!/usr/bin/env bash

git log \
	--oneline \
	--graph \
	--abbrev-commit \
	--perl-regexp --author='^((?!dependabot|renovate).*)$' \
	--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cD) %C(bold blue)<%an>%Creset'
