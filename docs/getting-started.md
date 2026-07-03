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

## Install

### macOS / Linux

```bash
curl -fsSL https://wukong.today/install.sh | sh
```

### Windows

Download the latest `.exe` from the
[releases page](https://github.com/mutnpc/wukong-code/releases) and place it on
your `PATH`.

### Verify

```bash
wukong --version
```

---

## First Steps

### 1. Add a Provider

```bash
wukong provider
```

Follow the interactive prompts to configure an LLM provider.

### 2. Launch the TUI

```bash
wukong
```

Type a task and press Enter:

```text
explain the main modules in this project
```

### 3. Run a One-off Prompt

```bash
wukong -p "summarize this repository"
```

### 4. Verify Changes

```bash
wukong verify
```

### 5. Scan for Risks

```bash
wukong scan
```

---

## Next Steps

- Browse the [command reference](/commands)
- Learn about [configuration options](/configuration)
