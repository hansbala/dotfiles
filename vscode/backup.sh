#!/bin/sh

SETTINGS_LOCATION=$HOME/"Library/Application Support/Code/User/"

# Update the installed extensions
code --list-extensions > extensions.txt

# Update the settings file
cp $SETTINGS_LOCATION/settings.json .
