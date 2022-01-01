#!/bin/bash

if ! which node > /dev/null; then

	# install nodejs >= 12.12
	curl -sL install-node.vercel.app/lts | sudo bash
fi
