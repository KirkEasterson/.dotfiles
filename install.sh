#!/bin/bash
set -euo pipefail

echo "Installing dotfiles"
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
cd "${SCRIPT_DIR}" || exit
stow -S */ --adopt

cd - >/dev/null || exit
