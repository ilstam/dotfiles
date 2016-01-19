#!/bin/bash

USER="stamatis.iliass"
PASS=""

COUNT=`curl -su $USER:$PASS https://mail.google.com/mail/feed/atom || echo "<fullcount>unknown number of</fullcount>"`
COUNT=`echo "$COUNT" | grep -oPm1 "(?<=<fullcount>)[^<]+" `

if [ -z "$COUNT" ]; then
	echo " no access" # full text
	echo " no access" # short text
else
	echo " $COUNT new" # full text
	echo " $COUNT new" # short text

	if [ "$COUNT" -gt 0 ]; then
		echo \#FFFC00 # colored output
	fi
fi
