#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/scripts/tmux-core.sh"

# shellcheck disable=1090
world_clock_status="#(${CURRENT_DIR}/scripts/tmux-clock.sh)"
world_clock_status_pattern="\#{world_clock_status}"

tmux_interpolate() {
	local content=$1

	content=${content/$world_clock_status_pattern/$world_clock_status}

	echo "$content"
}

tmux_update_option() {
	local option="$1"
	local option_value

	option_value="$(tmux_get_option "$option")"
	option_value="$(tmux_interpolate "$option_value")"

	tmux_set_option "$option" "$option_value"
}

main() {
	tmux_update_option "status-right"
	tmux_update_option "status-left"
}

main
