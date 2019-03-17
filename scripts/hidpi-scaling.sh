#!/usr/bin/env bash

gsettings set org.gnome.desktop.interface scaling-factor 2
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gdk/WindowScalingFactor': <2>}" 
xrandr --output eDP-1 --scale "${1}"x"${1}"
