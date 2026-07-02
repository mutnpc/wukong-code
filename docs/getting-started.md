# Getting Started

## Requirements

- **macOS**, **Linux**, or **Windows**
- A local workspace directory with your project code
- An API key for your chosen LLM provider (Wukong CLI supports multiple
  providers; managed Wukong auth is optional)

## Install

### macOS / Linux

```bash
curl -fsSL https://wukong.today/install.sh | sh
```

### Windows

Download the latest `.exe` from the
[releases page](https://github.com/mutnpc/wukong-cli/releases) and place it on
your `PATH`.

### Verify

```bash
wukong --version
```

## First steps

### 1. Add a provider

```bash
wukong provider
```

Follow the prompts to configure an LLM provider.

### 2. Start the interactive TUI

```bash
wukong
```

Type a task and press Enter:

```text
explain the main modules in this project
```

### 3. Run a one-off prompt

```bash
wukong -p "summarize this repository"
```

### 4. Verify changes before committing

```bash
wukong verify
```

### 5. Scan for risks

```bash
wukong scan
```

## Next steps

- Read the [command reference](./commands.md)
- Learn about [configuration](./configuration.md)
