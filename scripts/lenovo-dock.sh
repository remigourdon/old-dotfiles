#!/bin/bash

MONITORS="$(xrandr --query | grep -o '^[^ ]* connected' | cut -d' ' -f1)"

if [[ "${MONITORS}" == *"DP-1-1"* ]]; then
    # Docked
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output DP-1-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
    ~/.config/polybar/launch.sh
    set-wallpaper.sh -r
else
    # Undocked
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output DP-1-1 --off
    ~/.config/polybar/launch.sh
    set-wallpaper.sh -r
fi
