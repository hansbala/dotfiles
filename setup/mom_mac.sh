#!/bin/sh

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install necessary apps
brew install --cask google-chrome zoom microsoft-teams

# Microsoft Office 2016 (https://gist.github.com/zthxxx/9ddc171d00df98cbf8b4b0d8469ce90a)
# Install Office
brew install --cask https://github.com/Homebrew/homebrew-cask/raw/538c7cf34c085e3bb4fdac36f6370ded87930036/Casks/microsoft-office.rb
# Download and install key file
curl -sSL https://gist.githubusercontent.com/zthxxx/9ddc171d00df98cbf8b4b0d8469ce90a/raw/com.microsoft.office.licensingV2.plist -o /Library/Preferences/com.microsoft.office.licensingV2.plist

