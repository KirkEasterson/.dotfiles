#!/usr/bin/env bash

git log \
	--oneline \
	--graph \
	--abbrev-commit \
	--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
