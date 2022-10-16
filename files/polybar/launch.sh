#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $(whoami) -x polybar >/dev/null; do sleep 1; done

cd $(dirname $0)

# Launch bar1 and bar2
SECONDARIES=$(xrandr --query | grep " connected" | grep -v " primary" | cut -d" " -f1)

polybar -c config.ini primary &

for i in $SECONDARIES
do
    echo "$i"
    MONITOR=$i polybar -c config.ini secondary &
done

echo "Bars launched..."

