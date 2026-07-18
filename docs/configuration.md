---
layout: default
title: Configuration
nav_order: 4
permalink: /configuration/
---

# Configuration

Wukong Code stores configuration and data under `~/.wukong`
(or `$WUKONG_CODE_HOME` when set).

```text
~/.wukong/
  config.toml
  tui.toml
  credentials/
```

## Environment Variables

| Variable | Description |
|---|---|
| `WUKONG_CODE_HOME` | Override the default data directory (`~/.wukong`) |
| `WUKONG_CODE_OAUTH_HOST` | OAuth host for device-code login (default: `https://wukong.today`) |
| `WUKONG_CODE_BASE_URL` | Managed API base URL (default: `https://wukong.today/api/v1`) |
| `WUKONG_API_URL` | Wukong account and Loop quota API base (default: `https://wukong.today`) |
| `WUKONG_CODE_CUSTOM_HEADERS` | Custom outbound LLM request headers |
| `WUKONG_CODE_NO_AUTO_UPDATE` | Disable startup update checks, prompts, and background installation when set to `1`, `true`, `yes`, or `on` |
| `WUKONG_CLI_NO_AUTO_UPDATE` | Legacy alias for `WUKONG_CODE_NO_AUTO_UPDATE` |

### Example

```bash
WUKONG_CODE_HOME=/tmp/wukong-test wukong doctor
```

{: .note }
Device-code OAuth and hosted uploads use **`https://wukong.today`**.
There is no separate `auth.wukong.today` host.

## Automatic updates

Background automatic installation is enabled by default for supported global package-manager installations. Configure it in the TUI through `/settings` → **Upgrade**, or edit `~/.wukong/tui.toml`:

```toml
[upgrade]
auto_install = false
```

This preference stops background installation but leaves update checks and prompts enabled. Use `WUKONG_CODE_NO_AUTO_UPDATE=1` to disable the startup update preflight completely. Neither setting disables TUI announcements. See [Updates and announcements](/updates-and-announcements/).

---

## Configure Providers

Use the interactive provider command:

```bash
wukong provider
```

Or edit `~/.wukong/config.toml` directly.

Optional managed Wukong login (for monthly Loop allowance):

```bash
wukong login
```

---

## Configuration Priority

{: .note }
Settings are resolved in order — later sources override earlier ones.

1. Built-in defaults
2. Config files in `WUKONG_CODE_HOME`
3. Environment variables
4. Command-line options
