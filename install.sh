#!/bin/bash

export DOTFILES=~/.dotfiles
DOTFILESOLD="${DOTFILES}old"

if [ $(readlink -f .) != "$DOTFILES" ]; then
	if [ -d "$DOTFILES" ]; then
		if [ -d "$DOTFILESOLD" ]; then
			rm -rf "$DOTFILESOLD"
		fi
		mv "$DOTFILES" "$DOTFILESOLD"
	fi
	cp -R $(dirname "$0") "$DOTFILES"
fi


for i in vim zsh git; do
	echo -n "Install ${i} configuration? (y/n) "
	an=$(read a && echo "$a" | tr '[:upper:]' '[:lower:]')
	echo ""

	if [ -z "$an" -o "$an" == "y" -o "$an" == "yes" ]; then
		"$DOTFILES/$i/install.sh"
	fi
done
