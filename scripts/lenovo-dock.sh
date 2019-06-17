#!/bin/bash
exec >/home/remi/udev.out 2>&1

MONITORS="$(xrandr --query | grep -o '^[^ ]* connected' | cut -d' ' -f1)"

if [[ "${MONITORS}" == *"DP-1-1"* ]]; then
    # Docked
    echo 'Docked' > /home/remi/lenovo-test.txt
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output DP-1-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
    ~/.config/polybar/launch.sh
    wal -R
else
    # Undocked
    echo 'Undocked' > /home/remi/lenovo-test.txt
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output DP-1-1 --off
    ~/.config/polybar/launch.sh
    wal -R
fi
