#!/bin/bash
#
# run all dotfiles installers
export DOTFILES="$HOME/.dotfiles"

cd "$(dirname "$0")"/.. || exit

steps_order=( homebrew langenv shell nvim macos )
for step in "${steps_order[@]}"; do
    sh "$DOTFILES/topical/$step/install.sh"
done