#!/bin/bash
#
# run all dotfiles installers
export DOTFILES="$HOME/.dotfiles"

cd "$(dirname "$0")"/.. || exit
find -H "$DOTFILES" -maxdepth 4 -name 'install.sh' -not -path '*.git*' -exec sh -c 'FILE="$1"; "$FILE"' _ {} \;
