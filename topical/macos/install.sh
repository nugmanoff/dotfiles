#!/bin/bash

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

softwareupdate -i -a

# shellcheck disable=SC1090
source "${BASH_SOURCE%/*}"/set-defaults.sh

# needs to be signed in to Mac App Store vefore running these

mas install magnet
mas install mindnode
mas install coderunner
mas install noizio
mas install bear