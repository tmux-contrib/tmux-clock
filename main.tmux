#!/usr/bin/env bash

# tmux-clock plugin entry point.
#
# This plugin provides a #{world_clock_status} format string that displays
# the current time for a configurable timezone in the tmux status bar.
#
# Usage:
#   Add #{world_clock_status} to your status-left or status-right option.
#
# Example:
#   set -g status-right "#{world_clock_status} | %H:%M"
#
# Configuration:
#   @world_clock_tz      - Timezone (default: "US/Eastern")
#   @world_clock_fmt     - Time format (default: "#[bold]%Z#[nobold]: %H:%M")
#   @world_clock_fgcolor - Foreground color (default: "default")
#   @world_clock_bgcolor - Background color (default: "default")

_tmux_clock_root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=scripts/tmux_clock_core.sh
source "$_tmux_clock_root_dir/scripts/tmux_clock_core.sh"

world_clock_status="#($_tmux_clock_root_dir/scripts/tmux_clock.sh)"
world_clock_status_pattern="\#{world_clock_status}"

# Interpolate the world clock status pattern in content.
#
# Replaces #{world_clock_status} pattern in the given content string with
# the actual tmux command string to retrieve the world clock time.
#
# Globals:
#   world_clock_status - The tmux command string to get world clock time
#   world_clock_status_pattern - The pattern to replace (#{world_clock_status})
# Arguments:
#   $1 - The content string containing the pattern
# Outputs:
#   The content with pattern replaced by tmux command string
# Returns:
#   0 on success
tmux_interpolate() {
	local content=$1

	content=${content/$world_clock_status_pattern/$world_clock_status}

	echo "$content"
}

# Update a tmux option by interpolating the world clock pattern.
#
# Retrieves the current value of the specified tmux option, replaces any
# occurrences of #{world_clock_status} with the actual command string, and
# sets the option to the new value.
#
# Globals:
#   None
# Arguments:
#   $1 - The name of the tmux option to update (e.g., "status-right")
# Returns:
#   0 on success
tmux_update_option() {
	local option="$1"
	local option_value

	option_value="$(tmux_get_option "$option")"
	option_value="$(tmux_interpolate "$option_value")"

	tmux_set_option "$option" "$option_value"
}

# Main entry point for the plugin.
#
# Initializes the world clock plugin by updating the status-right and
# status-left options to interpolate the world_clock_status pattern.
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   0 on success
main() {
	tmux_update_option "status-right"
	tmux_update_option "status-left"
}

main
