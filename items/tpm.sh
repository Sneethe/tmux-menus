#!/bin/sh
#
#   Copyright (c) 2022-2025: Jacob.Lundqvist@gmail.com
#   License: MIT
#
#   Part of https://github.com/jaclu/tmux-menus
#
#   Advanced options
#

static_content() {
    # 2.7 M M "Manage clients    $nav_next" advanced_manage_clients.sh \
    set -- \
        0.0 M Left "Back to Main menu  $nav_home" main.sh
    menu_generate_part 1 "$@"
    $cfg_display_cmds && display_commands_togglep 2

    set -- \
        0.0 S \
	1.8 E p "Plugins inventory" "$D_TM_BASE_PATH/tools/plugins.sh" \
	1.8 E i "Install all plugins" "$d_scripts/tpm.sh install" \
	1.8 E u "Update all plugins " "$d_scripts/tpm.sh update" \
	1.8 E c "Cleanup plugins    " "$d_scripts/tpm.sh clean"
    menu_generate_part 3 "$@"
}

#===============================================================
#
#   Main
#
#===============================================================

menu_name="tpm - Tmux Plugin Manager"
menu_min_vers=1.8

#  Full path to tmux-menux plugin
D_TM_BASE_PATH="$(dirname -- "$(dirname -- "$(realpath "$0")")")"

# shellcheck source=scripts/dialog_handling.sh
. "$D_TM_BASE_PATH"/scripts/dialog_handling.sh
