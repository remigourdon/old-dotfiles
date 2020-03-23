#!/bin/bash

MONITORS="$(xrandr --query | grep -o '^[^ ]* connected' | cut -d' ' -f1)"

if [[ "${MONITORS}" == *"DP-1-1"* ]]; then
    # Docked
    xrandr --output eDP-1 --off
    xrandr --output DP-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output DP-1-2 --mode 1920x1080 --pos 1920x0 --rotate normal
    ~/.config/polybar/launch.sh
    set-wallpaper.sh -r
elif [[ "${MONITORS}" == *"HDMI-1"* ]] ; then
    # Home
    xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal
    ~/.config/polybar/launch.sh
    set-wallpaper.sh -r
else
    # Undocked
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output DP-1-1 --off
    xrandr --output DP-1-2 --off
    ~/.config/polybar/launch.sh
    set-wallpaper.sh -r
fi
