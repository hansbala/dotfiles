#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$ROOT_DIR"

stow --restow --target="$HOME" ghostty git nix npm nvim starship tmux wall zsh bin agents lazygit
