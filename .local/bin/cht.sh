#!/bin/bash

languages=`echo "golang lua typescript nodejs c cpp" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk tar" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

if printf $languages | grep -qs $selected; then
	curl -s cht.sh/$selected/`echo $query | tr ' ' '+'` | batcat --paging=always
else
	curl -s cht.sh/$selected~`echo $query | tr ' ' '+'` | batcat --paging=always
fi
