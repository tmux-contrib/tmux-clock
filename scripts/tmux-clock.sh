#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/tmux-core.sh"

main() {
	local opt_tz
	local opt_fmt
	local opt_fgcolor
	local opt_bgcolor

	opt_tz="$(tmux_get_option "@world_clock_tz" "US/Eastern")"
	opt_fmt="$(tmux_get_option "@world_clock_fmt" "#[bold]%Z#[nobold]: %H:%M")"
	opt_fgcolor="$(tmux_get_option "@world_clock_fgcolor" "default")"
	opt_bgcolor="$(tmux_get_option "@world_clock_bgcolor" "default")"

	export TZ=$opt_tz

	echo "#[fg='${opt_fgcolor}',bg='${opt_bgcolor}']$(date "+$opt_fmt")"
}

main
