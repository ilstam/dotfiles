#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "configuring i3...\n"

if [ ! -d ~/.i3blocks ]; then
	echo "--> install i3blocks"
	git clone https://github.com/vivien/i3blocks ~/.i3blocks
fi

if [ ! -d ~/.i3blocks-contrib ]; then
	echo "--> install i3blocks-contrib"
	git clone https://github.com/vivien/i3blocks-contrib ~/.i3blocks-contrib
fi

if [ -f ~/.config/i3/config ]; then
	echo "--> backup existing ~/.config/i3/config file to ~/.config/i3/config.orig"
	mv ~/.config/i3/config ~/.config/i3/config.orig
fi

if [ -f ~/.config/i3/i3blocks.conf ]; then
	echo "--> backup existing ~/.config/i3/i3blocks.conf file to ~/.config/i3/i3blocks.conf.orig"
	mv ~/.config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf.orig
fi

echo "--> symlink ~/.config/i3/config to the real config file"
ln -s "$DOTFILES/i3/config" ~/.config/i3/config

echo -e "\ndone...\n"
