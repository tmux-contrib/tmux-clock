#!/usr/bin/env bash
set -euo pipefail

[[ -z "${DEBUG:-}" ]] || set -x

_tmux_clock_source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

[[ -f "$_tmux_clock_source_dir/tmux_core.sh" ]] || {
	echo "tmux-clock: missing tmux_core.sh" >&2
	exit 1
}

# shellcheck source=tmux_core.sh
source "$_tmux_clock_source_dir/tmux_core.sh"

# Main entry point for the world clock script
#
# Reads configuration options and outputs the formatted time for the
# specified timezone with tmux color styling.
main() {
	local opt_tz
	local opt_fmt
	local opt_fgcolor
	local opt_bgcolor

	opt_tz="$(_tmux_get_option "@clock-tz" "US/Eastern")"
	opt_fmt="$(_tmux_get_option "@clock-fmt" "#[bold]%Z#[nobold]: %H:%M")"
	opt_fgcolor="$(_tmux_get_option "@clock-fg-color" "default")"
	opt_bgcolor="$(_tmux_get_option "@clock-bg-color" "default")"

	export TZ=$opt_tz

	echo "#[fg='${opt_fgcolor}',bg='${opt_bgcolor}']$(date "+$opt_fmt")"
}

main
