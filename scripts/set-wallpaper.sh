#!/bin/bash
# Set wallpaper and update wal theme
set -u # Treat unset variables and parameters as errors

#########
# USAGE #
#########

usage() {
    echo "Usage: $(basename "${0}") [OPTIONS] INPUT_IMAGE

Set wallpaper and update wal theme.

OPTIONS:
    -o    Only set wallpaper
    -r    Only reload the wallpaper
    -h    Display this message"
}

###############
# DEFINITIONS #
###############

WAL_IMG="${HOME}/.wallpaper"

###################
# OPTIONS PARSING #
###################

SET_THEME=true
INPUT_IMAGE=""

while getopts 'orh' opts ; do
    case "${opts}" in
        o)
            SET_THEME=false
            ;;
        r)
            feh --bg-scale "${WAL_IMG}"
            exit 0
            ;;
        h)
            usage
            exit 1
            ;;
        ?)
            usage
            exit 1
            ;;
    esac
done
shift "$((OPTIND - 1))"

################
# ARGS PARSING #
################

if [[ ${#} -ne 1 ]] ; then
    usage
    exit 1
else
    INPUT_IMAGE="${1%$'\n'}"
fi

##########
# ACTION #
##########

cp -f "${INPUT_IMAGE}" "${WAL_IMG}"

if [[ "${SET_THEME}" = true ]] ; then
    wal -c && wal -q -o after-wal.sh -i "${WAL_IMG}"
else
    feh --bg-scale "${WAL_IMG}"
fi
