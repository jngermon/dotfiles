#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which git) ]; then
    echo "Git is not installed"
else
    GITCONFIG="$(pwd)/files/git/.gitconfig"
    GITCONFIG_DEST="$HOME/.gitconfig"

    createSymlink $GITCONFIG $GITCONFIG_DEST

    GITIGNOREGLOBAL="$(pwd)/files/git/.gitignore_global"
    GITIGNOREGLOBAL_DEST="$HOME/.gitignore_global"

    createSymlink $GITIGNOREGLOBAL $GITIGNOREGLOBAL_DEST

    exit 0
fi
