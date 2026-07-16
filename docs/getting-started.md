---
layout: default
title: Getting Started
nav_order: 2
permalink: /getting-started/
---

# Getting Started

Wukong Code is a terminal-native AI coding agent built as the **control and
verification layer for AI Coding Loops** — it answers whether AI-written code
can be merged, not just whether it can be written.

---

## Requirements

- **macOS**, **Linux**, or **Windows**
- A local workspace directory
- An API key for your LLM provider

{: .note }
Wukong Code supports multiple providers — managed auth is optional. Bring your own keys.
Use `wukong login` for the Free monthly Loop allowance and optional hosted report upload.

---

## Install & Verify

### `curl -fsSL https://wukong.today/install.sh | sh`

Install on macOS or Linux:

```bash
curl -fsSL https://wukong.today/install.sh | sh
```

For Windows, download the `.exe` from the [releases page](https://github.com/mutnpc/wukong-code/releases),
or use the guided installer on [Download Wukong Code](https://wukong.today/download).

Prefer a browser walkthrough? Start at [wukong.today](https://wukong.today) → [Download Wukong Code](https://wukong.today/download).

### `wukong --version`

Verify the installation:

```bash
wukong --version
```

---

## Core Workflow

### `wukong provider`

Configure an LLM provider:

```bash
wukong provider
```

### `wukong`

Launch the interactive TUI:

```bash
wukong
```

### `wukong -p <prompt>`

Run a one-off prompt:

```bash
wukong -p "summarize this repository"
```

### `wukong loop <objective>`

Run the primary write → check → review → fix workflow:

```bash
wukong loop "finish the current change"
```

Every Loop ends with `PASS`, `NEEDS_WORK`, or `ERROR`. Guest gets one local
trial with up to two iterations. Run `wukong login` for 10 Free Loop sessions
per month with up to five iterations each.

### `wukong today`

Show the Daily Proof Briefing (local stats, focus, next actions, and hosted-report usage when logged in):

```bash
wukong today
wukong today "ship auth fix"
wukong today --clear-focus
```

---

## Verification

### `wukong verify`

Run checks and write an evidence report:

```bash
wukong verify
```

### `wukong scan`

Scan git changes for delivery risks:

```bash
wukong scan
```

### `wukong proof`

Build a merge-ready evidence report from verify + scan:

```bash
wukong proof
```

### `wukong guard`

Inspect risky commands before execution:

```bash
wukong guard --status
```

---

## Optional: Hosted Upload

After `wukong login`, upload a redacted report:

```bash
wukong login
wukong proof --upload           # private Dashboard history
wukong proof --upload --public  # public share link
# or
wukong report upload ./wukong-verify-report.md
```

Device-code login opens `https://wukong.today/auth/device`.

---

## Next Steps

- Browse the [command reference](/commands)
- Learn about [configuration options](/configuration)
