#!/bin/sh

# Author: Hans Bala
# Purpose: Install all node packages that I need globally
# Date Created: Tue May 26 01:10:26 IST 2020
# Date Modified: Tue May 26 01:10:38 IST 2020


# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install the packages here
sudo npm install -g lite-server eslint
