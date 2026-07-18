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
> **Loop until verified** — `wukong loop` writes, runs real repository checks, scans risks, asks a read-only reviewer, and iterates until the delivery gate passes or returns actionable blockers.

{: .note }
> **One result** — Loop returns `PASS`, `NEEDS_WORK`, or `ERROR`. The writer cannot approve its own change, and stale workspace conclusions are rejected.

{: .note }
> **Terminal-native** — Stay in your flow. No browser, no IDE plugin, no context switch.

{: .note }
> **Multi-provider** — Bring your own keys. Supports DeepSeek, Moonshot, OpenAI-compatible providers, and more. Optional `wukong login` for the Free monthly Loop allowance.

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

# Loop until the independent delivery gate passes
wukong loop "finish the current change"

# Set today's focus and check the Daily Proof Briefing
wukong today "ship auth fix"

# Verify, scan, then prove merge-ready
wukong verify
wukong scan
wukong proof
```
