# tmux-clock

[![Test](https://github.com/tmux-contrib/tmux-clock/actions/workflows/test.yml/badge.svg)](https://github.com/tmux-contrib/tmux-clock/actions/workflows/test.yml) [![Release](https://img.shields.io/github/v/release/tmux-contrib/tmux-clock)](https://github.com/tmux-contrib/tmux-clock/releases) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Display a world clock with any timezone in your tmux status bar.

## Installation

Add this plugin to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-contrib/tmux-clock'
```

And install it by running `<prefix> + I`.

## Usage

Add the `#{clock}` format string to your status bar:

```tmux
set -g status-right "#{clock}"
```

## Configuration

Add these options to your `~/.tmux.conf`:

```tmux
# Timezone to display (default: US/Eastern)
set -g @clock-tz "Europe/London"

# Time format string (default: #[bold]%Z#[nobold]: %H:%M)
set -g @clock-fmt "#[bold]%Z#[nobold]: %H:%M"

# Foreground color (default: default)
set -g @clock-fg-color "yellow"

# Background color (default: default)
set -g @clock-bg-color "default"
```

### Options

| Option           | Default                        | Description         |
|------------------|--------------------------------|---------------------|
| `@clock-tz`      | `"US/Eastern"`                 | Timezone to display |
| `@clock-fmt`     | `#[bold]%Z#[nobold]: %H:%M`   | Time format string  |
| `@clock-fg-color`| `"default"`                    | Foreground color    |
| `@clock-bg-color`| `"default"`                    | Background color    |

### Common Timezones

| Timezone           | Location        |
|--------------------|-----------------|
| `US/Eastern`       | New York        |
| `US/Central`       | Chicago         |
| `US/Pacific`       | Los Angeles     |
| `Europe/London`    | London          |
| `Europe/Paris`     | Paris           |
| `Europe/Amsterdam` | Amsterdam       |
| `Asia/Tokyo`       | Tokyo           |
| `Asia/Shanghai`    | Shanghai        |
| `UTC`              | Coordinated UTC |

## Development

### Prerequisites

Install dependencies using [Nix](https://nixos.org/):

```sh
nix develop
```

Or install manually: `bash`, `tmux`, `bats`

### Running Tests

```sh
bats tests/
```

### Debugging

Enable trace output with the `DEBUG` environment variable:

```sh
DEBUG=1 /path/to/tmux-clock/scripts/tmux_clock.sh
```

## License

GPL-3.0
