#!/usr/bin/env bash

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install lsp servers
# typescript
npm install -g typescript typescript-langauge-server
# eslint
npm install -g vscode-langservers-extracted
