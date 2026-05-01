#!/usr/bin/env bash

set -euo pipefail

CLAUDE_DIR="$HOME/.claude"
SKILLS_LINK="$CLAUDE_DIR/skills"
SKILLS_TARGET="$HOME/.config/agents/skills"

mkdir -p "$CLAUDE_DIR"

if [[ -L "$SKILLS_LINK" ]]; then
    rm "$SKILLS_LINK"
elif [[ -d "$SKILLS_LINK" ]]; then
    if [[ -z "$(ls -A "$SKILLS_LINK")" ]]; then
        rmdir "$SKILLS_LINK"
    else
        echo "error: $SKILLS_LINK is a non-empty directory; move or remove it before rerunning" >&2
        exit 1
    fi
fi

ln -s "$SKILLS_TARGET" "$SKILLS_LINK"
