#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "configuring zsh...\n"

if [ ! -d ~/.oh-my-zsh/ ]; then
	echo "--> install oh-my-zsh"
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [ -f ~/.zshrc ]; then
	echo "--> backup existing ~/.zshrc file to ~/.zshrc.orig"
	mv ~/.zshrc ~/.zshrc.orig
fi

if [ -f ~/.zshenv ]; then
	echo "--> backup existing ~/.zshenv file to ~/.zshenv.orig"
	mv ~/.zshenv ~/.zshenv.orig
fi

echo "--> install custom zshrc"
cat > ~/.zshrc <<EOF
source "$DOTFILES/zsh/zshrc"
source "$DOTFILES/zsh/zsh_aliases"
EOF

echo "--> install custom zshenv"
cat > ~/.zshenv <<EOF
source "$DOTFILES/zsh/zshenv"
EOF

if [ ! -f ~/.oh-my-zsh/themes/mytheme.zsh-theme -a ! -h ~/.oh-my-zsh/themes/mytheme.zsh-theme ]; then
	echo "--> install custom theme"
	ln -s "$DOTFILES/zsh/mytheme.zsh-theme" ~/.oh-my-zsh/themes/mytheme.zsh-theme
fi

echo -n "--> do you want to make zsh your default shell? (y/n) "
an=$(read a && echo "$a" | tr '[:upper:]' '[:lower:]')
if [ -z "$an" -o "$an" == "y" -o "$an" == "yes" ]; then
	chsh -s /bin/zsh
fi

echo -e "\ndone...\n"
