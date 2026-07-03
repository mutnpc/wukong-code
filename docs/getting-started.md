---
layout: default
title: Getting Started
nav_order: 2
permalink: /getting-started/
---

# Getting Started

## Requirements

- **macOS**, **Linux**, or **Windows**
- A local workspace directory with your project code
- An API key for your chosen LLM provider

{: .note }
Wukong Code supports multiple providers — managed auth is optional. You can bring your own keys.

---

## Install

### `curl -fsSL https://wukong.today/install.sh | sh`

Install on macOS or Linux:

```bash
curl -fsSL https://wukong.today/install.sh | sh
```

For Windows, download the latest `.exe` from the [releases page](https://github.com/mutnpc/wukong-code/releases) and place it on your `PATH`.

### `wukong --version`

Verify the installation:

```bash
wukong --version
```

---

## First Steps

### `wukong provider`

Configure an LLM provider interactively:

```bash
wukong provider
```

### `wukong`

Launch the interactive TUI:

```bash
wukong
```

Type a task and press Enter:

```text
explain the main modules in this project
```

### `wukong -p <prompt>`

Run a one-off prompt:

```bash
wukong -p "summarize this repository"
```

### `wukong verify`

Run deterministic checks and write an evidence report:

```bash
wukong verify
```

### `wukong scan`

Scan git changes for delivery risks:

```bash
wukong scan
```

---

## Next Steps

- Browse the [command reference](/commands)
- Learn about [configuration options](/configuration)
