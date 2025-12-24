#!/usr/bin/env bash

# Get the current time for a specific timezone.
#
# Displays the current time formatted according to the configured timezone
# and format string. Supports custom foreground and background colors.
#
# Configuration Options:
#   @world_clock_tz      - Timezone (default: "US/Eastern")
#   @world_clock_fmt     - Time format string (default: "#[bold]%Z#[nobold]: %H:%M")
#   @world_clock_fgcolor - Foreground color (default: "default")
#   @world_clock_bgcolor - Background color (default: "default")
#
# Globals:
#   TZ - Temporarily set to the configured timezone
# Arguments:
#   None
# Outputs:
#   Formatted time string with tmux styling to stdout
# Returns:
#   0 on success
# Dependencies:
#   - date: system command for time formatting

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=scripts/core.sh
source "${CURRENT_DIR}/core.sh"

# Main entry point for the world clock script.
#
# Reads configuration options and outputs the formatted time for the
# specified timezone with tmux color styling.
#
# Globals:
#   TZ - Set to the configured timezone
# Arguments:
#   None
# Outputs:
#   Formatted time string (e.g., "#[fg='default',bg='default']EST: 14:30")
# Returns:
#   0 on success
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
