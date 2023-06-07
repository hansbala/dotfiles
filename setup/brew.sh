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
brew install tree
brew install neofetch
brew install stow
brew install fzf
brew install ripgrep
brew install bat
brew install node
brew install bash
brew install exa
brew install neovim
brew install fig

# Brew cask packages (mostly GUIs)
brew install --cask google-chrome
brew install --cask dropbox
brew install --cask alfred
brew install --cask bitwarden
brew install --cask cyberduck
brew install --cask spectacle
brew install --cask spotify
brew install --cask sublime-text
brew install --cask teamviewer
brew install --cask the-unarchiver
brew install --cask tor-browser
brew install --cask transmission
brew install --cask vlc
brew install --cask itsycal
brew install --cask alacritty
brew install --cask tunnelblick
brew install --cask visual-studio-code
brew install --cask teamviewer
brew install --cask slack
brew install --cask skype
brew install --cask postman
brew install --cask obs
brew install --cask discord
brew install --cask cloudflare-warp
brew install --cask microsoft-office
brew install --cask stats

# Cleanup the homebrew directory
brew cleanup
