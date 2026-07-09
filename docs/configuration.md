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
| `WUKONG_API_URL` | Hosted report upload API base (default: `https://wukong.today`) |
| `WUKONG_CODE_CUSTOM_HEADERS` | Custom outbound LLM request headers |

### Example

```bash
WUKONG_CODE_HOME=/tmp/wukong-test wukong doctor
```

{: .note }
Device-code OAuth and hosted uploads use **`https://wukong.today`**.
There is no separate `auth.wukong.today` host.

---

## Configure Providers

Use the interactive provider command:

```bash
wukong provider
```

Or edit `~/.wukong/config.toml` directly.

Optional managed Wukong login (for hosted reports):

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
