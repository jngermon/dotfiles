#!/bin/sh

killall -q wallpaper-rotate.sh

while pgrep -u $(whoami) -x wallpaper-rotate.sh >/dev/null; do sleep 1; done

cd $(dirname $0)

./wallpaper-rotate.sh &
