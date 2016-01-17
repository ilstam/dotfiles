#!/bin/bash

USER="stamatis.iliass"
PASS=""

COUNT=`curl -su $USER:$PASS https://mail.google.com/mail/feed/atom || echo "<fullcount>unknown number of</fullcount>"`
COUNT=`echo "$COUNT" | grep -oPm1 "(?<=<fullcount>)[^<]+" `

if [ -z "$COUNT" ]; then
	echo " no access"
else
	echo " $COUNT new"
fi
