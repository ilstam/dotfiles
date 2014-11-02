#!/bin/sh

export DOTFILES=$HOME/.dotfiles
if [ $(dirname $0) != "$DOTFILES" ]; then
	if [ -d "$DOTFILES" ]; then
		mv "$DOTFILES" "${DOTFILES}old"
	fi
	cp -R $(dirname $0) "$DOTFILES"
fi

$DOTFILES/git/install.sh
$DOTFILES/vim/install.sh
$DOTFILES/zsh/install.sh
