#!/bin/bash

# TODO: overwrite already existing items (or rename to *.old)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR
stow -S */
cd -
