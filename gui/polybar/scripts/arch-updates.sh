#!/bin/bash

if ! UPDATES_ARCH=$(pacman -Qu 2> /dev/null | wc -l ); then
    UPDATES_ARCH=0
fi

if ! UPDATES_AUR=$(yay -Qum 2> /dev/null | wc -l); then
    UPDATES_AUR=0
fi

UPDATES=$((UPDATES_ARCH + UPDATES_AUR))

if [ "${UPDATES}" -gt 0 ]; then
    echo " $(printf "%3s" ${UPDATES})"
else
    echo " $(printf "%3s" 0)"
fi
