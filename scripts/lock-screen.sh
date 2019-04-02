#!/bin/bash
# requires imagemagick, xrandr, scrot and i3lock-color
# inspired by:
# https://github.com/mehalter/dotfiles/blob/master/.config/i3/scripts/lock/lock.sh

LOCK_IMG="$HOME/.dotfiles/scripts/lock.png"
WALL_IMG="$HOME/.wallpaper"

# Extract 4 main colors from wallpaper
convert "${WALL_IMG}" +dither -colors 5 -define \
    histogram:unique-colors=true -format "%c" histogram:info: | \
        while read -r line ; do
            echo "$line" | \
            awk '{match($0,"#[0-9A-F]+",a)}END{print a[0]}' \
            >> /tmp/colors.txt
        done

# Load colors as variables
set -- $(</tmp/colors.txt)

# Prepare lock image
convert "${LOCK_IMG}" -fuzz 50% -fill "${1}" -opaque "#30AF91" /tmp/lock.png
convert /tmp/lock.png -fuzz 10% -fill "${5}" -opaque "#FFFFFF" /tmp/lock.png
convert /tmp/lock.png -resize 256x256 /tmp/lock.png

# Take a screenshot
scrot /tmp/screen.png

# Blur screenshot
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png

# Add lock image on screenshot (one per screen)
REG_DIMS="([[:digit:]]+)/[[:digit:]]+x([[:digit:]]+)/[[:digit:]]+"
REG_OFFS="([\+\-][[:digit:]]+)([\+\-][[:digit:]]+)"
xrandr --listmonitors | \
    while read -r line ; do
        if [[ ${line} =~ ${REG_DIMS} ]] ; then
            width="${BASH_REMATCH[1]}"
            height="${BASH_REMATCH[2]}"
            if [[ "${line}" =~ ${REG_OFFS} ]] ; then
                offsetx="${BASH_REMATCH[1]}"
                offsety="${BASH_REMATCH[2]}"
            fi
            posx=$((offsetx + width / 2 - 256 / 2))
            [[ "${posx}" -ge 0 ]] && posx="+${posx}"
            posy=$((offsety + height / 2 - 256 / 2))
            [[ "${posy}" -ge 0 ]] && posy="+${posy}"
            convert /tmp/screen.png /tmp/lock.png -geometry "${posx}${posy}" -composite -matte /tmp/screen.png
        fi
    done

# Lock the screen
i3lock -i /tmp/screen.png \
  --radius=125 --ring-width=6 \
  --insidecolor=00000000 --line-uses-inside \
  --insidevercolor=00000000 --veriftext="" \
  --insidewrongcolor=00000000 --wrongtext="" \
  --ringcolor="${1:1:6}ff" \
  --separatorcolor="${1:1:6}ff" \
  --keyhlcolor="${5:1:6}ff" \
  --bshlcolor="${5:1:6}ff" \
  --ringvercolor="${5:1:6}ff" \
  --ringwrongcolor="${3:1:6}ff" \

# Cleanup
rm /tmp/screen.png /tmp/lock.png /tmp/colors.txt