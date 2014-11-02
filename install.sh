#!/bin/sh

export DOTFILES=$HOME/.dotfiles
if [ $(pwd) != $DOTFILES ]; then
	cp -R $(pwd) $DOTFILES
fi

$DOTFILES/git/install.sh
$DOTFILES/vim/install.sh
$DOTFILES/zsh/install.sh
