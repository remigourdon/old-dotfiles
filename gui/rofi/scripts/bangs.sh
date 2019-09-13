#!/bin/bash
# Inspired by rofi-bangs.sh by https://github.com/gotbletu/
# This is a rofi scripts launcher
set -u # Treat unset variables and parameters as errors

declare -A COMMANDS

#########
# BANGS #
#########

# Power
COMMANDS["power"]="${HOME}/.config/rofi/scripts/power.sh"

# PDF opener
COMMANDS["pdfs"]="${HOME}/.config/rofi/scripts/pdfs.sh"

# VirtualBox
COMMANDS["vbox"]="${HOME}/.config/rofi/scripts/vbox.sh"

############
# GENERATE #
############

printMenu()
{
    for key in "${!COMMANDS[@]}" ; do
        echo -e "$key\t\t${COMMANDS[${key}]}"
    done
}

#######
# RUN #
#######

run_rofi()
{
    printMenu | sort | rofi -dmenu -i -p "rofi-bangs"
}

RETURN="$(run_rofi)"

# Split input and grap up to first space
CHOICE="$(cut -f1 <<<${RETURN})"

###########
# PROCESS #
###########

# If cancelled, exit
[[ -z "${CHOICE}" ]] && exit 1

# If choice exists, execute
if test ${COMMANDS[${CHOICE}]+isset} ; then
    COMMAND="${COMMANDS[${CHOICE}]}"
    echo "Executing: ${COMMAND}"
    eval "${COMMAND}" &>/dev/null
fi
