#!/usr/bin/env bash
set -euo pipefail

git diff | pbcopy
open "https://diffy.org"
