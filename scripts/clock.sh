#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/helpers.sh"

main() {
	local opt_tz
	local opt_fmt
	local opt_fgcolor
	local opt_bgcolor

	opt_tz="$(get_tmux_option "@world_clock_tz" "US/Eastern")"
	opt_fmt="$(get_tmux_option "@world_clock_fmt" "#[bold]%Z#[nobold]: %H:%M")"
	opt_fgcolor="$(get_tmux_option "@world_clock_fgcolor" "default")"
	opt_bgcolor="$(get_tmux_option "@world_clock_bgcolor" "default")"

	export TZ=$opt_tz

	echo "#[fg='${opt_fgcolor}',bg='${opt_bgcolor}']$(date "+$opt_fmt")"
}

main
