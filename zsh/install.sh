#!/bin/sh

echo -e "zsh configuration...\n"

# install oh-my-zsh
if [ ! -d ~/.oh-my-zsh/ ]; then
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# backup existing ~/.zshrc file
if [ -f ~/.zshrc ]; then
	cp ~/.zshrc ~/.zshrc.orig
fi

# overwrite zshrc
cat > ~/.zshrc << "EOF"
source $HOME/.dotfiles/zsh/zshrc
EOF

# use mytheme
cp $(dirname $0)/mytheme.zsh-theme ~/.oh-my-zsh/themes

echo -e "\ndone...\n"
