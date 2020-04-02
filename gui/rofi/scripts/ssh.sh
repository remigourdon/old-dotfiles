#!/bin/bash
# Rofi script to connect to an SSH remote
set -u # Treat unset variables and parameters as errors

# Remote selection
LIST="$(awk '$0 ~ "Host " {print $2}' ~/.ssh/config)"
LAUNCHER="rofi -dmenu -i -p script"
if ! REMOTE=$(echo "${LIST}" | ${LAUNCHER}) ; then
    exit 1
fi
st -e ssh "${REMOTE}"
