#!/bin/sh

export DOTFILES=$HOME/.dotfiles
mv $(pwd) $DOTFILES

$DOTFILES/git/install.sh
$DOTFILES/vim/install.sh
$DOTFILES/zsh/install.sh
