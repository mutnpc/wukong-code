---
layout: default
title: Home
nav_order: 1
permalink: /
---

# Wukong Code

Wukong Code is a terminal AI coding agent. Launch an interactive TUI or run one-off
prompts without leaving your shell.

## Quick Install

```bash
curl -fsSL https://wukong.today/install.sh | sh
```

## Why Wukong Code?

| | |
|---|---|
| **Terminal-native** | Stay in your flow — no browser, no IDE plugin, no context switch. |
| **Verification built-in** | `wukong verify` checks your changes, `wukong scan` catches delivery risks before they ship. |
| **Command guard** | `wukong guard` inspects risky commands before execution, so AI-generated shell scripts don't surprise you. |
| **Multi-provider** | Bring your own keys — supports DeepSeek, Moonshot, OpenAI-compatible providers, and more. |
| **Web UI & API** | `wukong web` opens a local UI; `wukong server` exposes REST and WebSocket endpoints for tooling. |

## Quick Start

```bash
# Start the interactive TUI
wukong

# Run a one-off prompt
wukong -p "summarize this repo"

# Verify current changes
wukong verify

# Scan for delivery risks
wukong scan
```

## Documentation

| Guide | Description |
|---|---|
| [Getting Started](./getting-started) | Installation and first steps |
| [Commands](./commands) | Complete command reference |
| [Configuration](./configuration) | Configuration options and settings |

## Links

- [Website](https://wukong.today)
- [GitHub](https://github.com/mutnpc/wukong-code)
- [Support](mailto:support@wukong.today)
