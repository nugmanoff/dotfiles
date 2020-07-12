#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode command line tools
if xcode-select --install 2> /dev/null; then
  read -p '? Press [Enter] key when Xcode command line tools are installed...' -r
fi

# Install Homebrew if we don't have it
if ! hash brew 2>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  # Make sure we’re using the latest Homebrew
  brew update
fi

# Install coreutils
brew install coreutils

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install rcm
brew install thoughtbot/formulae/rcm

# Install git just in case it isn't present
brew install git

# Clone dotfiles from Github
# git clone --recursive https://github.com/anvilabs/dotfiles.git ~/.dotfiles
 
# Synchronize symlinks
# rcup -v -d ~/.dotfiles/symlinks

# Copy fonts
# rsync -av --no-perms ~/.dotfiles/resources/fonts/ ~/Library/Fonts

# Install Cmake for building from source
brew install cmake

# Install git-extras for custom git aliases
brew install git-extras

# Install keybase and gpg for signatures
brew install keybase
brew install gnupg2

# Install system utilities
brew install tree
brew install wget
pip install glances

# Install apps with brew cask and mas
source ~/.dotfiles/apps.sh

# Remove outdated versions from the cellar
brew cleanup

# Set up GPG
# https://anvilabs.co/blog/setup-gpg-commits/
echo '** Settings up GPG with Keybase'
keybase login
keybase pgp gen

# Set up SSH
# https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
echo '** Setting up SSH'
ssh-keygen -t rsa -b 4096 -C 'a.nugmanoff@gmail.com'
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Open the GitHub settings page
open 'https://github.com/account/keys'

# Add the SSH key to GitHub
pbcopy < ~/.ssh/id_rsa.pub
echo 'SSH key copied to clipboard'
read -p 'Press [Enter] key when you'\''re done...' -r

# Add the PGP key to GitHub
keybase pgp export | pbcopy
echo 'PGP key copied to clipboard'
read -p 'Press [Enter] key when you'\''re done...' -r

echo 'Done!'