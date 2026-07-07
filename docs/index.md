---
layout: default
title: Home
nav_order: 1
permalink: /
---

# Wukong Code

{: .fs-9 }
AI can write the code. Wukong proves whether it should ship.

{: .fs-6 .fw-300 }
A terminal-native AI coding agent built as the control and verification layer for AI Coding Loops.

[Quick Install](#quick-install){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View on GitHub](https://github.com/mutnpc/wukong-code){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Why Wukong Code?

{: .note }
> **Proof, not just code** — Other agents write code. Wukong answers whether it can merge: `wukong verify` runs checks, `wukong scan` catches risks, `wukong guard` blocks dangerous commands.

{: .note }
> **Loop engineering** — `/goal` drives a task until verification passes. Planned `/loop` orchestrates the whole write → verify → fix cycle so you stop manually prompting the agent.

{: .note }
> **Terminal-native** — Stay in your flow. No browser, no IDE plugin, no context switch.

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
