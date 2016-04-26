#!/bin/bash

if [ ! $(which git) ]; then
    echo "Git is not installed"
else
	GITCONFIG="$(pwd)/files/git/.gitconfig"
    GITCONFIG_DEST="$HOME/.gitconfig"

	if [ ! -f $GITCONFIG_DEST ] || [ ! -h $GITCONFIG_DEST ]; then
	    echo "Create symbolik link form $GITCONFIG_DEST to $GITCONFIG"

	    ln --symbolic --force $GITCONFIG $GITCONFIG_DEST
	else
		echo $GITCONFIG_DEST already exists and is a symbolic link
	fi

	GITIGNOREGLOBAL="$(pwd)/files/git/.gitignore_global"
	GITIGNOREGLOBAL_DEST="$HOME/.gitignore_global"

	if [ ! -f $GITIGNOREGLOBAL_DEST ] || [ ! -h $GITIGNOREGLOBAL_DEST ]; then
	    echo "Create symbolik link form $GITIGNOREGLOBAL_DEST to $GITIGNOREGLOBAL"

	    ln --symbolic --force $GITIGNOREGLOBAL $GITIGNOREGLOBAL_DEST
	else
		echo $GITIGNOREGLOBAL_DEST already exists and is a symbolic link
	fi
fi
