#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_DIR="$ROOT_DIR/fonts"
TARGET_DIR="$HOME/Library/Fonts"

mkdir -p "$TARGET_DIR"

find "$SOURCE_DIR" -type f \
  \( -iname '*.otf' -o -iname '*.ttf' -o -iname '*.ttc' -o -iname '*.otc' \) \
  -exec cp -f {} "$TARGET_DIR"/ \;
