---
layout: default
title: Configuration
nav_order: 4
permalink: /configuration/
---

# Configuration

Wukong Code stores configuration and data under `~/.wukong`. The exact format is
defined by the current CLI release; common files include:

```text
~/.wukong/
  config.toml
  tui.toml
  credentials/
```

## Environment variables

| Variable | Description |
|---|---|
| `WUKONG_HOME` | Override the default data directory |
| `WUKONG_CODE_PROVIDER_NAME` | Default provider name |
| `WUKONG_CODE_CUSTOM_HEADERS` | Custom outbound LLM request headers |

### Example: use a temporary data directory

```bash
WUKONG_HOME=/tmp/wukong-test wukong doctor
```

## Configure providers

Use the provider command:

```bash
wukong provider
```

Or edit `~/.wukong/config.toml` directly.

## Configuration priority

1. Built-in defaults
2. Config files in `WUKONG_HOME`
3. Environment variables
4. Command-line options
