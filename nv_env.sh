#!/bin/bash

if ! which node > /dev/null; then

	# install nodejs >= 12.12
	ins_scr=$(curl -sL install-node.vercel.app/lts)
	yes y | bash $inr_scr
fi
