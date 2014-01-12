#!/bin/sh

export DOTFILES=$HOME/.dotfiles
current_dir=$(realpath $(dirname $0))
if [ $current_dir != $DOTFILES ]; then
	mv $current_dir $DOTFILES
fi

$DOTFILES/git/install.sh
$DOTFILES/vim/install.sh
$DOTFILES/zsh/install.sh
