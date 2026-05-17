# Function to pipe the absolute path of the current directory to the clipboard
dirpath() {
  pwd | pbcopy
}

# Function to pipe the absolute path of the given file to the clipboard
filepath() {
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")" | pbcopy
}

# cd into any directory under the cwd
fd() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# Open any file in vim under the cwd
fo() (
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
)

# Switches to a tmux session using fzf or will create it if it does not exist
tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) && \
             tmux $change -t "$session" || echo "No sessions found."
}

lightmode() {
  case "$(uname -s)" in
    Darwin)
      osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false" &> /dev/null
      ;;
    Linux)
      if command -v gsettings >/dev/null 2>&1; then
        gsettings set org.gnome.desktop.interface color-scheme prefer-light
      fi
      ;;
  esac
}

darkmode() {
  case "$(uname -s)" in
    Darwin)
      osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true" &> /dev/null
      ;;
    Linux)
      if command -v gsettings >/dev/null 2>&1; then
        gsettings set org.gnome.desktop.interface color-scheme prefer-dark
      fi
      ;;
  esac
}
