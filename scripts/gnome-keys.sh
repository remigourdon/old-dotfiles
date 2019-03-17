#!/usr/bin/env bash

usage() {
    echo "$(basename "${0}") MODE"
    echo MODE is 'import' or 'export'
}

MODE=${1}
WMKEYS="${HOME}/.dotfiles/gui/gnome/wm.keys"
MEDIAKEYS="${HOME}/.dotfiles/gui/gnome/media.keys"

if [[ ${MODE} == "import" ]] ; then
    dconf load /org/gnome/desktop/wm/keybindings/ < "${WMKEYS}"
    dconf load /org/gnome/settings-daemon/plugins/media-keys/ < "${MEDIAKEYS}"
    echo "Keys were imported!"
elif [[ ${MODE} == "export" ]] ; then
    dconf dump /org/gnome/desktop/wm/keybindings/ > "${WMKEYS}"
    dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > "${MEDIAKEYS}"
    echo "Keys were exported!"
else
    usage
fi
