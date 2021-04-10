#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

if type "xrandr"; then
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload bar &
    done
else
    polybar --reload bar &
fi

echo "Bars launched..."
