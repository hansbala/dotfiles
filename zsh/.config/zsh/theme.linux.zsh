function toggleTheme() {
  if [ "$1" = "dark" ]; then
    echo "Switching to dark mode..."
    # KDE Theme.
    lookandfeeltool -a org.kde.breezedark.desktop > /dev/null 2>&1
    # Ghostty theme.
    ln -sf ~/.config/ghostty/config.dark.linux ~/.config/ghostty/config
  else
    echo "Switching to light mode..."
    # KDE Theme.
    lookandfeeltool -a org.kde.breeze.desktop > /dev/null 2>&1
    # Ghostty theme.
    ln -sf ~/.config/ghostty/config.light.linux ~/.config/ghostty/config
  fi
}

alias lightmode='toggleTheme light'
alias darkmode='toggleTheme dark'
