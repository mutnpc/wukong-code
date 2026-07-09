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
[Download Wukong Code](https://wukong.today/download){: .btn .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Wukong Code Website](https://wukong.today){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Why Wukong Code?

{: .note }
> **Proof, not just code** — Other agents write code. Wukong answers whether it can merge: `wukong verify` runs checks, `wukong scan` catches risks, `wukong proof` builds merge evidence, and `wukong guard` blocks dangerous commands.

{: .note }
> **Loop control plane** — `/goal` drives a single objective. `/loop --until verify-pass` iterates locally until the gate passes. `wukong today` shows the Daily Proof Briefing.

{: .note }
> **Terminal-native** — Stay in your flow. No browser, no IDE plugin, no context switch.

{: .note }
> **Multi-provider** — Bring your own keys. Supports DeepSeek, Moonshot, OpenAI-compatible providers, and more. Optional `wukong login` for hosted reports on wukong.today.

{: .note }
> **Web UI & Server** — `wukong web` opens a local UI; `wukong server` exposes REST and WebSocket endpoints.

---

## Quick Install

```bash
curl -fsSL https://wukong.today/install.sh | sh
```

{: .highlight }
> **macOS**, **Linux**, and **Windows** are fully supported. Prefer a guided page? Use [Download Wukong Code](https://wukong.today/download). Details: [Getting Started](/getting-started).

---

## Quick Start

```bash
# Start the interactive TUI
wukong

# Run a one-off prompt
wukong -p "explain this repo"

# Set today's focus and check the Daily Proof Briefing
wukong today "ship auth fix"

# Verify, scan, then prove merge-ready
wukong verify
wukong scan
wukong proof
```
