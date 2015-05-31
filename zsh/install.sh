#!/bin/sh

if [ -z "$DOTFILES" ]; then
	DOTFILES=$HOME/.dotfiles
fi

echo -e "configuring zsh...\n"

if [ ! -d ~/.oh-my-zsh/ ]; then
	echo "--> install oh-my-zsh"
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [ -f ~/.zshrc ]; then
	echo "--> backup existing ~/.zshrc file to ~/zshrc.orig"
	cp ~/.zshrc ~/.zshrc.orig
fi

echo "--> overwrite ~/.zshrc"
cat > ~/.zshrc << EOF
source $DOTFILES/zsh/zshrc
EOF

if [ ! -f ~/.oh-my-zsh/themes/mytheme.zsh-theme -a ! -h ~/.oh-my-zsh/themes/mytheme.zsh-theme ]; then
	echo "--> install custom theme"
	ln -s "$DOTFILES"/zsh/mytheme.zsh-theme ~/.oh-my-zsh/themes/mytheme.zsh-theme
fi

echo -e "\ndone...\n"
