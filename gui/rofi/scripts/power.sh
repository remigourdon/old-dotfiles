#!/bin/bash
# Rofi script for power management
set -u # Treat unset variables and parameters as errors

LAUNCHER="rofi -dmenu -i -p power -format d"

OPTIONS="Lock system\nReboot system\nPower-off system"

OPTION=$(echo -e "${OPTIONS}" | ${LAUNCHER})

if [[ "${#OPTION}" -gt 0 ]] ; then
    case "${OPTION}" in
        "") ;;
        0) ;;
        1) loginctl lock-session ;;
        2) systemctl reboot ;;
        3) systemctl poweroff ;;
        *) ;;
    esac
fi
