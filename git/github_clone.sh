#!/bin/bash

# Script for cloning all my repos hosted on github and keeping them up-do-date locally
# $GITHUB_AUTH_TOKEN must be set for fetching private repos too

DIR=~/.gitrepos
USER=ilstam

[ ! -d $DIR ] && mkdir $DIR

cd $DIR

remotes=$(curl -H "Authorization: token $GITHUB_AUTH_TOKEN" "https://api.github.com/search/repositories?q=user:$USER" 2>&1 | grep 'git@' | grep -o '/[^\.]*' | cut -c2-)

# Don't clone these...
remotes=("${remotes[@]/l4linux/}")
remotes=("${remotes[@]/libvirt/}")

# Check if there's anything local that hasn't been pushed upstream
locals=$(ls)
for l in $locals; do
	inarray=$(echo ${remotes[@]} | grep -o "$l" | wc -w)
	if [ $inarray -eq "0" ]; then
		echo "WARNING: $l doesn't exist on github"
	fi
done

echo ""

for r in $remotes; do
	if [ ! -d "$r" ]; then
		git clone git@github.com:${USER}/${r}.git
	fi

	echo "Updating $r"
	cd $r
	# create local branches that track all remote branches
	for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote 2>/dev/null ; done
	# pull changes from all remote branches
	git pull --all
	cd ..
	echo ""
done
