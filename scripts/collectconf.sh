#!/bin/bash
# Backup system and personal configuration files

# general
files[0]=/etc/fstab
files[1]=/etc/hosts
# arch
files[2]=/etc/pacman.conf
files[3]=/etc/makepkg.conf
files[4]=/etc/modprobe.d/modprobe.conf
# lxde and openbox
files[5]=/etc/lxdm/lxdm.conf
files[6]=~/.config/lxsession/LXDE/autostart
files[7]=~/.config/openbox/lxde-rc.xml
# syslinux
files[8]=/boot/syslinux/syslinux.cfg
# ssh
files[9]=~/.ssh/*
# add more...
#files[10]=...

if [ ! -f ~/conffilesbackup.tar ]; then
	tar -cvzf ~/conffilesbackup.tar ${files[*]}
else
	echo "~/conffilesbackup.tar already exists"
fi
