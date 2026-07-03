---
layout: default
title: Getting Started
nav_order: 2
permalink: /getting-started/
---

# Getting Started

---

## Requirements

- **macOS**, **Linux**, or **Windows**
- A local workspace directory
- An API key for your LLM provider

{: .note }
Wukong Code supports multiple providers — managed auth is optional. Bring your own keys.

---

## Install & Verify

### `curl -fsSL https://wukong.today/install.sh | sh`

Install on macOS or Linux:

```bash
curl -fsSL https://wukong.today/install.sh | sh
```

For Windows, download the `.exe` from the [releases page](https://github.com/mutnpc/wukong-code/releases).

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

### `wukong guard`

Inspect risky commands before execution:

```bash
wukong guard --status
```

---

## Next Steps

- Browse the [command reference](/commands)
- Learn about [configuration options](/configuration)
