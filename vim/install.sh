#!/bin/sh

echo -e "vim configuraton...\n"

# install vundle
if [ ! -d ~/.vim/bundle/vundle/ ]; then
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# backup existing ~/.vimrc file
if [ -f ~/vimrc ]; then
	cp ~/.vimrc ~/.vimrc.orig
fi

# overwrite vimrc
cat > ~/.vimrc << "EOF"
if filereadable(expand("/home/ilias/.dotfiles/vim/vimrc"))
    source /home/ilias/.dotfiles/vim/vimrc
endif
EOF

echo -e "\ndone...\n"
