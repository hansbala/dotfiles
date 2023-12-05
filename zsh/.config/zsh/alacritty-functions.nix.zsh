#!/usr/bin/env bash

alacritty-theme() {
  if ! test -f ~/.config/alacritty/color.yml; then
    echo "file ~/.config/alacritty/color.yml doesn't exist"
    return
  fi

  # sed doesn't like symlinks, get the absolute path
  config_path=$(realpath ~/.config/alacritty/color.yml)

  sed -i "" -e "s#^colors: \*.*#colors: *$1#g" "$config_path"

  echo "switched to $1."
}
