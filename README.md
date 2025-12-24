# tmux-clock

A tmux plugin that displays the time for a configurable timezone (world clock).

## Installation

```tmux
# configure the tmux plugins manager
set -g @plugin "tmux-plugins/tpm"

# official plugins
set -g @plugin 'tmux-contrib/tmux-clock'
```

## Usage

Add the `#{world_clock_status}` format string to your status bar:

```tmux
set -g status-right "#{world_clock_status}"
```

### Options

| Option                | Default                      | Description                     |
|-----------------------|------------------------------|---------------------------------|
| `@world_clock_tz`     | `"US/Eastern"`               | Timezone to display             |
| `@world_clock_fmt`    | `#[bold]%Z#[nobold]: %H:%M`   | Time format string              |
| `@world_clock_fgcolor`| `"yellow"`                   | Foreground color                |
| `@world_clock_bgcolor`| `"default"`                  | Background color                |

### Format Strings

| Format String           | Description                     |
|-------------------------|---------------------------------|
| `#{world_clock_status}` | Time for the configured timezone |

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
