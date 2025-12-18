# tmux-clock API Documentation

This document describes the public API for the tmux-clock plugin.

## Table of Contents

- [Overview](#overview)
- [Format Strings](#format-strings)
- [Configuration](#configuration)
- [Core Functions](#core-functions)
  - [tmux_get_option](#tmux_get_option)
  - [tmux_set_option](#tmux_set_option)
- [Plugin Functions](#plugin-functions)
  - [main (tmux-clock.sh)](#main-tmux-clocksh)
  - [tmux_interpolate](#tmux_interpolate)
  - [tmux_update_option](#tmux_update_option)

---

## Overview

The tmux-clock plugin displays the current time for a configurable timezone
in the tmux status bar. It supports custom time formats and colors.

## Format Strings

| Format String           | Description                              |
|-------------------------|------------------------------------------|
| `#{world_clock_status}` | Current time for configured timezone     |

**Usage Example:**
```tmux
set -g status-right "#{world_clock_status}"
```

## Configuration

| Option               | Description                  | Default                         |
|----------------------|------------------------------|--------------------------------|
| `@world_clock_tz`    | Timezone identifier          | `"US/Eastern"`                 |
| `@world_clock_fmt`   | Time format string           | `"#[bold]%Z#[nobold]: %H:%M"`  |
| `@world_clock_fgcolor`| Foreground color            | `"default"`                    |
| `@world_clock_bgcolor`| Background color            | `"default"`                    |

**Example:**
```tmux
set -g @world_clock_tz "Europe/London"
set -g @world_clock_fmt "%H:%M %Z"
set -g @world_clock_fgcolor "yellow"
```

**Common Timezone Values:**
- `US/Eastern`, `US/Central`, `US/Pacific`
- `Europe/London`, `Europe/Paris`, `Europe/Berlin`
- `Asia/Tokyo`, `Asia/Shanghai`, `Asia/Singapore`
- `UTC`

---

## Core Functions

Located in `scripts/core.sh`.

### tmux_get_option

Get a tmux option value.

Retrieves the value of a global tmux option. If the option is not set,
returns the provided default value.

```bash
tmux_get_option "option_name" "default_value"
```

**Arguments:**
- `$1` - The name of the tmux option to retrieve
- `$2` - The default value to return if the option is not set

**Outputs:**
- The option value or default value to stdout

**Returns:**
- `0` on success

---

### tmux_set_option

Set a tmux option value.

Sets a global tmux option to the specified value.

```bash
tmux_set_option "option_name" "value"
```

**Arguments:**
- `$1` - The name of the tmux option to set
- `$2` - The value to set the option to

**Returns:**
- `0` on success, non-zero on failure

---

## Plugin Functions

### main (tmux-clock.sh)

Located in `scripts/tmux-clock.sh`.

Get the current time for a specific timezone.

Displays the current time formatted according to the configured timezone
and format string. Supports custom foreground and background colors.

```bash
./scripts/tmux-clock.sh
# Output: "#[fg='default',bg='default']EST: 14:30"
```

**Arguments:**
- None

**Outputs:**
- Formatted time string with tmux styling to stdout

**Returns:**
- `0` on success

**Dependencies:**
- `date`: system command for time formatting

---

### tmux_interpolate

Located in `main.tmux`.

Interpolate the world clock status pattern in content.

Replaces `#{world_clock_status}` pattern in the given content string with
the actual tmux command string to retrieve the world clock time.

```bash
tmux_interpolate "Time: #{world_clock_status}"
# Output: "Time: #(/path/to/scripts/tmux-clock.sh)"
```

**Arguments:**
- `$1` - The content string containing the pattern

**Outputs:**
- The content with pattern replaced by tmux command string

**Returns:**
- `0` on success

---

### tmux_update_option

Located in `main.tmux`.

Update a tmux option by interpolating the world clock pattern.

Retrieves the current value of the specified tmux option, replaces any
occurrences of `#{world_clock_status}` with the actual command string, and
sets the option to the new value.

```bash
tmux_update_option "status-right"
```

**Arguments:**
- `$1` - The name of the tmux option to update (e.g., "status-right")

**Returns:**
- `0` on success
