#!/bin/bash

if ! which node > /dev/null; then

	# install nodejs >= 12.12
	yes y | curl -sL install-node.vercel.app/lts | bash
fi
