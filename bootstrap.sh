#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$ROOT_DIR/bootstrap/install_brew.sh"
"$ROOT_DIR/bootstrap/install_dotfiles.sh"
"$ROOT_DIR/bootstrap/install_agents.sh"
"$ROOT_DIR/bootstrap/install_fonts.sh"
"$ROOT_DIR/bootstrap/mac_settings.sh"
