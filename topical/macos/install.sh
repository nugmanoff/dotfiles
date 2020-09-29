#!/bin/bash

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

# softwareupdate -i -a

# source "${BASH_SOURCE%/*}"/set-defaults.sh

# needs to be signed in to Mac App Store vefore running these

mas install 441258766 # magnet
mas install 1289197285 # mindnode
mas install 955297617 # coderunner
mas install 928871589 # noizio
mas install 1091189122 # bear