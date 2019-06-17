#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Find interfaces
INTERFACES="$(ip link show | grep -o '^[[:digit:]]: [[:alnum:]]\+' | cut -d' ' -f2)"
WIRELESS="$(grep '^wlp' <<<"${INTERFACES}" | tail -n1)"
WIRED="$(grep '^en' <<<"${INTERFACES}" | tail -n1)"

if type "xrandr" &>/dev/null ; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar -q --reload top &
        MONITOR=$m WIRELESS=$WIRELESS WIRED=$WIRED polybar -q --reload bottom &
    done
fi

