#!/usr/bin/env bash
set -euo pipefail

[[ -z "${DEBUG:-}" ]] || set -x

# tmux-clock plugin entry point.
#
# This plugin provides a #{clock} format string that displays
# the current time for a configurable timezone in the tmux status bar.
#
# Usage:
#   Add #{clock} to your status-left or status-right option.
#
# Example:
#   set -g status-right "#{clock} | %H:%M"
#
# Configuration:
#   @clock-tz       - Timezone (default: "US/Eastern")
#   @clock-fmt      - Time format (default: "#[bold]%Z#[nobold]: %H:%M")
#   @clock-fg-color - Foreground color (default: "default")
#   @clock-bg-color - Background color (default: "default")

_tmux_clock_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

[[ -f "$_tmux_clock_root/scripts/tmux_core.sh" ]] || {
	echo "tmux-clock: missing tmux_core.sh" >&2
	exit 1
}

# shellcheck source=scripts/tmux_core.sh
source "$_tmux_clock_root/scripts/tmux_core.sh"

clock_status="#($_tmux_clock_root/scripts/tmux_clock.sh)"
clock_status_pattern="\#{clock}"

# Interpolate the clock status pattern in content
#
# Arguments:
#   $1 - The content string containing the pattern
# Outputs:
#   The content with pattern replaced by tmux command string
_tmux_interpolate() {
	local content=$1

	content=${content/$clock_status_pattern/$clock_status}

	echo "$content"
}

# Update a tmux option by interpolating the world clock pattern
#
# Arguments:
#   $1 - The name of the tmux option to update
_tmux_update_option() {
	local option="$1"
	local option_value

	option_value="$(_tmux_get_option "$option")"
	option_value="$(_tmux_interpolate "$option_value")"

	_tmux_set_option "$option" "$option_value"
}

main() {
	_tmux_update_option "status-right"
	_tmux_update_option "status-left"
}

main
