#!/bin/sh
# Always sourced file - Fake bang path to help editors
#
#   Copyright (c) 2022-2025: Jacob.Lundqvist@gmail.com
#   License: MIT
#
#   Part of https://github.com/jaclu/tmux-menus
#
#  Innteracts with tpm, display, install, update, remove plugins
#


#===============================================================
#
#   Main
#
#===============================================================

D_TM_BASE_PATH="$(dirname -- "$(dirname -- "$(realpath "$0")")")"


# shellcheck source=/scripts/helpers.sh
. "$D_TM_BASE_PATH"/scripts/helpers.sh

[ -z "$TMUX_PLUGIN_MANAGER_PATH" ] && {
    error_msg "$rn_current_script - Undefined: \$TMUX_PLUGIN_MANAGER_PATH"
}

d_tpm="$TMUX_PLUGIN_MANAGER_PATH/tpm"
[ ! -d "$d_tpm"  ] && {
    error_msg "$rn_current_script - tpm not found: $d_tpm"
}

cmd="$1"

case "$cmd" in
    install)
	display_message "Will install all defined plugins" no_hold
	output="$("$TMUX_PLUGIN_MANAGER_PATH"/tpm/bin/install_plugins)"
	display_message "$output"
	;;
    update)
	display_message "Will update all defined plugins" no_hold
	output="$("$TMUX_PLUGIN_MANAGER_PATH"/tpm/bin/update_plugins all)"
	display_message "$output"
	;;
    clean)
	display_message "Will remove all undefined plugins" no_hold
	output="$("$TMUX_PLUGIN_MANAGER_PATH"/tpm/bin/clean_plugins)"
	if [ -n "$output" ]; then
	    display_message "$output"
	else
	    display_message "$rn_current_script - Nothing was removed"
	fi
	;;
    *) error_msg "$rn_current_script - valid options: install update clean" ;;
esac
# log_it "=====   plugin_init.sh starting   ====="

