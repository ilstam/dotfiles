#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "configuring git...\n"

if [ -f ~/.gitconfig ]; then
	echo "--> backup existing ~/.gitconfig file to ~/gitconfig.orig"
	mv ~/.gitconfig ~/.gitconfig.orig
fi

echo "--> symlink ~/.gitconfig to the real gitconfig"
ln -s "$DOTFILES/git/gitconfig" ~/.gitconfig

echo -e "\ndone...\n"
