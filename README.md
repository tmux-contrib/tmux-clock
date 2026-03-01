# tmux-clock

Display a world clock with any timezone in your tmux status bar.

## Installation

Add this plugin to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-contrib/tmux-clock'
```

And install it by running `<prefix> + I`.

## Usage

Add the `#{world_clock_status}` format string to your status bar:

```tmux
set -g status-right "#{world_clock_status}"
```

## Configuration

Add these options to your `~/.tmux.conf`:

```tmux
# Timezone to display (default: US/Eastern)
set -g @world_clock_tz "Europe/London"

# Time format string (default: #[bold]%Z#[nobold]: %H:%M)
set -g @world_clock_fmt "#[bold]%Z#[nobold]: %H:%M"

# Foreground color (default: default)
set -g @world_clock_fgcolor "yellow"

# Background color (default: default)
set -g @world_clock_bgcolor "default"
```

### Options

| Option                 | Default                        | Description        |
|------------------------|--------------------------------|--------------------|
| `@world_clock_tz`      | `"US/Eastern"`                 | Timezone to display |
| `@world_clock_fmt`     | `#[bold]%Z#[nobold]: %H:%M`   | Time format string |
| `@world_clock_fgcolor` | `"default"`                    | Foreground color   |
| `@world_clock_bgcolor` | `"default"`                    | Background color   |

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
