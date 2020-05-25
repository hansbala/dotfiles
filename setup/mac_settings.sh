#!/bin/sh

# Author: Hans Bala
# Purpose: Automate common Mac OS related settings across machines 
# Date Created: Tue May 26 01:07:26 IST 2020
# Date Modified: Tue May 26 01:07:45 IST 2020

# Shell script to change some OS X settings that I prefer
# Stop OS X from writing .DS_Store files in each directory
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Show all filename extensions in finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Stop finder from generating warnings when changing extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use jpg for screenshots
defaults write com.apple.screencapture type jpg

# Change default location of screenshots from Desktop to Pictures/Screenshots directory
SCREENSHOT_PATH=~/Pictures/screenshots
mkdir -p $SCREENSHOT_PATH
defaults write com.apple.screencapture location $SCREENSHOT_PATH

# Remove the dock auto-hide and show delay
defaults write com.apple.Dock autohide-delay -float 0

# Disable automatic application termination for apps with no windows
defaults write -g NSDisableAutomaticTermination -bool true

# Change default view style of finder to List View
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Stop apps from bouncing in the dock (very fucking annoying)
defaults write com.apple.dock no-bouncing -bool TRUE

# Show the path bar in finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable crash report dialogue
defaults write com.apple.CrashReporter DialogType none

# Disable resume system-wide as I usually never want to go back to the same after reboot
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Disable workspace switching animation
defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES

# Remove dashboard in mission control (again, fucking useless)
defaults write com.apple.dock dashboard-in-overlay -bool true

# Increase speed of OS X dialogue boxes (such as save-as)
defaults write NSGlobalDomain NSWindowResizeTime .1

# Disable animations for some stuff
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1

# Default directory for iterm2 preferences
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.config/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Install powerline fonts for Mac
git clone https://github.com/powerline/fonts.git /tmp/
sh /tmp/fonts/install.sh
# Purge the directory
rm -rf /tmp/fonts

# Restart finder, SystemUIServer
killall SystemUIServer
killall Dock
killall Finder
