#!/bin/bash

# https://github.com/holman/dotfiles/blob/master/macos/set-defaults.sh
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/cristiandean/dotfiles/blob/master/osx_config

####################
# [keyboard]
####################

# disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# set a really fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 1

# disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

####################
# [trackpad]
####################

# enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

####################
# [finder]
####################

# always open everything in Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# set the Finder prefs for showing a few different volumes on the Desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# show the ~/Library folder
chflags nohidden ~/Library

# avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

####################
# [dock]
####################

# remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock

# configure hot corners
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

# minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool false

# enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

####################
# [launch]
####################

# disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

####################
# [activity monitor]
####################

# visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

####################
# [airdrop]
####################

# use AirDrop over every interface
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
