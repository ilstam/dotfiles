#!/bin/sh

# install oh-my-zsh
if [ ! -d ~/.oh-my-zsh/ ]; then
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# backup existing ~/.zshrc file
cp ~/.zshrc ~/.zshrc.orig

# overwrite zshrc
cat > ~/.zshrc << "EOF"
source $HOME/.dotfiles/zsh/zshrc
EOF

# set zsh as default shell
chsh -s /bin/zsh

# use mytheme
cp $DOTFILES/zsh/mytheme.zsh-theme ~/.oh-my-zsh/themes
