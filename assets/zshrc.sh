#!/bin/bash

if [ ! $(which zsh) ]; then
    echo "Zsh is not installed"
else
	ZSHRC="$(pwd)/files/zsh/.zshrc"

	if [ ! -f ~/.zshrc ] || [ ! -h ~/.zshrc ]; then
		echo "Create symbolik link form ~/.zshrc to $ZSHRC"

	    ln --symbolic --force $ZSHRC ~/.zshrc

	    echo "You have to restart your console"
	else
		echo ~/.zshrc already exists and is a symbolic link
	fi
fi
