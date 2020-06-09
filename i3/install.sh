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

if [ -f ~/.xinitrc ]; then
	echo "--> backup existing ~/.xinitrc file to ~/.xinitrc.orig"
	mv ~/.xinitrc ~/.xinitrc.orig
fi

echo "--> symlink ~/.config/i3/config to the real config file"
ln -s "$DOTFILES/i3/config" ~/.config/i3/config

echo "--> symlink ~/.xinitrc to the real xinitrc"
ln -s "$DOTFILES/i3/xinitrc" ~/.xinitrc


echo -n "--> do you want to have getty directly prompt just the password for $(whoami)? (y/n) "
an=$(read a && echo "$a" | tr '[:upper:]' '[:lower:]')
if [ -z "$an" -o "$an" == "y" -o "$an" == "yes" ]; then
	if [ ! -d /etc/systemd/system/getty@tty1.service.d/ ]; then
		sudo mkdir /etc/systemd/system/getty@tty1.service.d/
	fi
	if [ ! -f /etc/systemd/system/getty@tty1.service.d/override.conf ]; then
		echo "created /etc/systemd/system/getty@tty1.service.d/override.conf"
		sudo user=$(whoami) sh -c 'cat > /etc/systemd/system/getty@tty1.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty -n -o $user %I
EOF'
	fi
	sudo systemctl enable getty@tty1
fi

echo -e "\ndone...\n"
