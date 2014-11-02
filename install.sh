#!/bin/sh

export DOTFILES=$HOME/.dotfiles
DOTFILESOLD="${DOTFILES}old"

if [ $(dirname $0) != "$DOTFILES" ]; then
	if [ -d "$DOTFILES" ]; then
		if [ -d "$DOTFILESOLD" ]; then
			rm -rf "$DOTFILESOLD"
		fi
		mv "$DOTFILES" "$DOTFILESOLD"
	fi
	cp -R $(dirname $0) "$DOTFILES"
fi

$DOTFILES/git/install.sh
$DOTFILES/vim/install.sh
$DOTFILES/zsh/install.sh
