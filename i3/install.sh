#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "configuring i3...\n"

if [ -f ~/.config/i3/config ]; then
	echo "--> backup existing ~/.config/i3/config file to ~/.config/i3/config.orig"
	mv ~/.config/i3/config ~/.config/i3/config.orig
fi

echo "--> symlink ~/.config/i3/config to the real config file"
ln -s "$DOTFILES/i3/config" ~/.config/i3/config

echo -e "\ndone...\n"
