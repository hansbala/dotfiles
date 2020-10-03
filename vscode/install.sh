#!/bin/sh

SETTINGS_LOCATION=$HOME/"Library/Application Support/Code/User/"

# Install extensions
while read line; do
    code --install-extension "$line";
done < extensions.txt

# Copy over settings.json file to apply user settings
cp settings.json $SETTINGS_LOCATION/settings.json


