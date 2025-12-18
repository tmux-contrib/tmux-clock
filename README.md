# tmux-clock

A tmux plugin that displays the time for a configurable timezone (world clock).

## Features

- Display time for any timezone
- Customizable time format
- Configurable foreground and background colors
- Lightweight with no external dependencies

## Requirements

- `date` command (available on all Unix-like systems)

## Installation

### Using TPM

Add the following line to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-contrib/tmux-clock'
```

Then press `prefix` + <kbd>I</kbd> to install.

### Manual

Clone the repository:

```bash
git clone https://github.com/tmux-contrib/tmux-clock ~/.tmux/plugins/tmux-clock
```

Add to your `~/.tmux.conf`:

```tmux
run-shell ~/.tmux/plugins/tmux-clock/main.tmux
```

## Usage

Add the `#{world_clock_status}` format string to your status bar:

```tmux
set -g status-right "#{world_clock_status}"
```

### Format Strings

| Format String           | Description                     |
|-------------------------|---------------------------------|
| `#{world_clock_status}` | Time for the configured timezone |

### Configuration

```tmux
# Timezone (default: "US/Eastern")
set -g @world_clock_tz "Europe/London"

# Time format (default: "#[bold]%Z#[nobold]: %H:%M")
set -g @world_clock_fmt "%H:%M %Z"

# Foreground color (default: "default")
set -g @world_clock_fgcolor "yellow"

# Background color (default: "default")
set -g @world_clock_bgcolor "default"
```

### Common Timezones

| Timezone           | Location          |
|--------------------|-------------------|
| `US/Eastern`       | New York          |
| `US/Central`       | Chicago           |
| `US/Pacific`       | Los Angeles       |
| `Europe/London`    | London            |
| `Europe/Paris`     | Paris             |
| `Europe/Amsterdam` | Amsterdam         |
| `Asia/Tokyo`       | Tokyo             |
| `Asia/Shanghai`    | Shanghai          |
| `UTC`              | Coordinated UTC   |

### Example Output

- `EST: 14:30` (with default format)
- `14:30 GMT` (with custom format `%H:%M %Z`)

## Documentation

See [docs/API.md](docs/API.md) for the full API documentation.

## License

[MIT](LICENSE)
