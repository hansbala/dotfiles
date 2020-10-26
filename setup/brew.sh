#!/bin/sh

# Author: Hans Bala
# Purpose: Install all applications that I use on my OS X machines
# Date Created: Tue May 26 01:10:26 IST 2020
# Date Modified: Tue May 26 01:10:38 IST 2020


# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install homebrew (OS X package manager so I can automate my installation)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update and upgrade existing formulae
brew update
brew upgrade

# Brew binaries
brew install python
brew install ffmpeg
brew install openssl
brew install git
brew install openssh
brew install wget
brew install zsh
brew install tree
brew install neofetch
brew install bluetoothconnector
brew install stow
brew install bitwarden-cli
brew install fzf
brew install ripgrep
brew install bat
brew install node

# Brew cask packages (mostly GUIs)
brew cask install alfred
brew cask install google-backup-and-sync
brew cask install between
brew cask install bitwarden
brew cask install cyberduck
brew cask install dozer
brew cask install evernote
brew cask install firefox
brew cask install iterm2
brew cask install spectacle
brew cask install spotify
brew cask install sublime-text
brew cask install teamviewer
brew cask install the-unarchiver
brew cask install tor-browser
brew cask install transmission
brew cask install cyberghost-vpn
brew cask install vlc
brew cask install itsycal
brew cask install oracle-jdk
brew cask install shift
brew cask install alacritty

# Cleanup the homebrew directory
brew cleanup
