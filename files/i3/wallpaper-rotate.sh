#!/bin/sh

while true
do
    #feh --bg-fill --randomize -r -D 2 ~/Images/wallpapers/
    feh --bg-fill $(find ~/Images/wallpapers -type f -follow | sort -R | tail -1)
    sleep 60
done
