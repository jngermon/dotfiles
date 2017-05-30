#!/bin/bash

function createSymlink {
    local source=$1
    local target=$2
    if [ ! $source ]; then
        echo "Source is required"
        return 1
    fi

    if [ ! $target ]; then
        echo "Target is required"
        return 1
    fi

    if [ ! -e $target ] || [ ! -h $target ]; then
        echo "Create symbolik link form $target to $source"

        if [ -e $target ]; then
            mv $target $target.bkp
        fi

        ln --symbolic --force $source $target

        return 0
    else
        echo "$target already exists and is a symbolic link"
        return 1
    fi
}
