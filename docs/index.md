---
layout: default
title: Home
nav_order: 1
permalink: /
---

# Wukong Code

{: .fs-9 }
Terminal AI coding agent

{: .fs-6 .fw-300 }
Launch an interactive TUI or run one-off prompts — without leaving your shell.

[Quick Install](#quick-install){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View on GitHub](https://github.com/mutnpc/wukong-code){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Why Wukong Code?

{: .note }
> **Terminal-native** — Stay in your flow. No browser, no IDE plugin, no context switch.

{: .note }
> **Verification built-in** — `wukong verify` checks your changes, `wukong scan` catches delivery risks before they ship.

{: .note }
> **Command guard** — `wukong guard` inspects risky commands before execution, so AI-generated shell scripts don't surprise you.

{: .note }
> **Multi-provider** — Bring your own keys. Supports DeepSeek, Moonshot, OpenAI-compatible providers, and more.

{: .note }
> **Web UI & Server** — `wukong web` opens a local UI; `wukong server` exposes REST and WebSocket endpoints.

---

## Quick Install

```bash
curl -fsSL https://wukong.today/install.sh | sh
```

{: .highlight }
> **macOS**, **Linux**, and **Windows** are fully supported. See [Getting Started](/getting-started) for details.

---

## Quick Start

```bash
# Start the interactive TUI
wukong

# Run a one-off prompt
wukong -p "explain this repo"

# Verify changes before committing
wukong verify

# Scan for delivery risks
wukong scan
```
