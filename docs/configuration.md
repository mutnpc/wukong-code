---
layout: default
title: Configuration
nav_order: 4
permalink: /configuration/
---

# Configuration

Wukong Code stores configuration and data under `~/.wukong`.

```text
~/.wukong/
  config.toml
  tui.toml
  credentials/
```

## Environment Variables

| Variable | Description |
|---|---|
| `WUKONG_HOME` | Override the default data directory |
| `WUKONG_CODE_PROVIDER_NAME` | Default provider name |
| `WUKONG_CODE_CUSTOM_HEADERS` | Custom outbound LLM request headers |

### Example

```bash
WUKONG_HOME=/tmp/wukong-test wukong doctor
```

---

## Configure Providers

Use the interactive provider command:

```bash
wukong provider
```

Or edit `~/.wukong/config.toml` directly.

---

## Configuration Priority

{: .note }
Settings are resolved in order — later sources override earlier ones.

1. Built-in defaults
2. Config files in `WUKONG_HOME`
3. Environment variables
4. Command-line options
