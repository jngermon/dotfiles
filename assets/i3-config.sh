#!/bin/bash

if [ ! $(which i3) ]; then
    echo "i3 is not installed"
else
	I3CONFIG="$(pwd)/files/i3/config"
	I3CONFIG_LINK="$HOME/.config/i3/config"

	if [ ! -f $I3CONFIG_LINK ] || [ ! -h $I3CONFIG_LINK ]; then
		echo "Create symbolik link form $I3CONFIG_LINK to $I3CONFIG"

	    ln --symbolic --force $I3CONFIG $I3CONFIG_LINK

	    i3 reload
	else
		echo $I3CONFIG_LINK already exists and is a symbolic link
	fi
fi
