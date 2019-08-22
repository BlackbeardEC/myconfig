#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar bar1 &
#polybar bar2 &
polybar -r --config=/home/blackbeard/.config/polybar/config top -q &
#polybar -r --config=/home/blackbeard/.config/polybar/config.space bottom -q &

echo "Bars launched..."
