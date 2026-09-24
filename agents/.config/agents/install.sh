#!/usr/bin/env bash

set -euo pipefail

SKILLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/skills" && pwd)"

link_skills() {
    local link="$1"

    mkdir -p "$(dirname "$link")"

    if [[ -L "$link" ]]; then
        rm "$link"
    elif [[ -e "$link" ]]; then
        if [[ -d "$link" && -z "$(ls -A "$link")" ]]; then
            rmdir "$link"
        else
            printf 'error: %s exists and is not an empty directory or symlink\n' "$link" >&2
            exit 1
        fi
    fi

    ln -s "$SKILLS_DIR" "$link"
}

for link in \
    "$HOME/.codex/skills" \
    "$HOME/.claude/skills" \
    "$HOME/.config/opencode/skills"; do
    link_skills "$link"
done
