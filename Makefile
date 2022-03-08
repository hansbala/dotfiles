# Quick and easy makefile to make sym-linking stuff
# really easy if I'm on a system that doesn't come
# with stow out of the box

all:
	link_alacritty
	link_bash
	link_git
	link_nvim
	link_starship
	link_tmux

minimal:
	link_bash
	link_starship
	link_nvim
	link_tmux

link_bash:
	ln -sf bash/.profile ~/.profile
	ln -sf bash/.config/bash ~/.config/bash

link_git:
	ln -sf git/.config/.gitconfig ~/.config/.gitconfig

link_nvim:
	ln -sf nvim/.config/nvim ~/.config/nvim

link_starship:
	@if test $(uname -s) != "Darwin"; then
	    @echo "Downloading starship for this machine in ~/bin"
	    @curl -fsSL https://github.com/starship/starship/releases/download/v1.3.0/starship-x86_64-unknown-linux-gnu.tar.gz -o /tmp/starship.tar.gz
	    @mkdir -p ~/bin
	    @tar -xf /tmp/starship.tar.gz -C ~/bin/
	fi
	ln -sf starship/.config/starship.toml ~/.config/starship.toml

link_tmux:
	ln -sf tmux/.config/tmux ~/.config/tmux
