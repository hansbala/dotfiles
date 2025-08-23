#!/usr/bin/env bash
set -euo pipefail

pwd
git diff | pbcopy
open "https://diffy.org"
