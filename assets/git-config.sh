#!/bin/bash

if [ ! $(which git) ]; then
    echo "Git is not installed"
else
	GITCONFIG="$(pwd)/files/git/.gitconfig"

	if [ ! -f ~/.gitconfig ] || [ ! -h ~/.gitconfig ]; then
	    echo "Create symbolik link form ~/.gitconfig to $GITCONFIG"

	    ln --symbolic --force $GITCONFIG ~/.gitconfig
	else
		echo ~/.gitconfig already exists and is a symbolic link
	fi
fi
