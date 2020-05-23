#!/bin/bash

USER=stamatis.iliass@gmail.com
PASS=`secret-tool lookup app gmail`

COUNT=`curl -su $USER:$PASS https://mail.google.com/mail/feed/atom/ \
	|  grep -oPm1 "(?<=<fullcount>)[^<]+"`

if ! [[ "$COUNT" =~ ^[0-9]+$ ]] ; then
	echo " ✖" # full text
	echo " ✖" # short text
	echo \#FF0000     # output in red
else
	echo " $COUNT new" # full text
	echo " $COUNT new" # short text

	if [ "$COUNT" -gt 0 ]; then
		echo \#FFFC00 # output in yellow
	fi
fi
