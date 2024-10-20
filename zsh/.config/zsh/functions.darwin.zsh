# All Mac OS specific functions go in here

# update all Wallpapers
function wallpaper() {
  sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$1'" && killall Dock 
}

function it2prof() {
  it2prof() { echo -e "\033]50;SetProfile=$1\a" }
}

# switching color modes
function lightmode() {
  osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false" &> /dev/null
  alacritty-theme gruvbox_light_hard &> /dev/null
}

function darkmode() {
  osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true" &> /dev/null
  alacritty-theme gruvbox_dark_hard &> /dev/null
}
