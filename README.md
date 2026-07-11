# Wukong Code

> **AI can write the code. Wukong proves whether it should ship.**

Wukong Code is a terminal-native AI coding agent built as the **control and
verification layer for AI Coding Loops**. It runs on your machine, works with
your existing codebase, and answers the question every other agent leaves open:
*can this AI-written code be merged?*

- **Terminal-native**: launch an interactive TUI or run one-off prompts without
  leaving your shell.
- **Built for AI-generated code**: verify changes, scan for risks, and guard
  against risky commands before you commit.
- **Loop engineering**: `/goal` drives a task until verification passes; interactive
  `/loop` orchestrates the write→verify→fix cycle inside the TUI.

---

## Install

### macOS / Linux

```bash
curl -fsSL https://wukong.today/install.sh | sh
```

Or download the latest binary for your platform from the
[releases page](https://github.com/mutnpc/wukong-code/releases).

### Windows

Download the latest `.exe` from the
[releases page](https://github.com/mutnpc/wukong-code/releases) and place it on
your `PATH`.

### Verify

```bash
wukong --version
```

---

## Quick start

```bash
# Start the interactive TUI
wukong

# Run a one-off prompt
wukong -p "explain this repository"

# Verify current changes before committing
wukong verify

# Scan for delivery risks
wukong scan

# Upload a redacted report to wukong.today
wukong verify --upload
wukong scan --upload
wukong report upload ./wukong-verify-report.md

# Check guard status
wukong guard --status
```

---

## Current commands

| Command | Description |
|---|---|
| `wukong` | Launch the interactive TUI |
| `wukong -p <prompt>` | Run a single prompt and print the result |
| `wukong provider` | Manage LLM providers |
| `wukong login` | Authenticate via device-code flow |
| `wukong verify` | Run deterministic checks and write an evidence report |
| `wukong scan` | Scan git changes for delivery risks |
| `wukong guard` | Inspect or run the command risk guard |
| `wukong proof` | Generate a Merge Proof Report |
| `wukong judge` | Evaluator-only merge decision |
| `wukong loop --dry-run` | Validate a loop plan; execute `/loop` interactively in the TUI |
| `wukong report upload <path>` | Upload a local report markdown file to wukong.today |
| `wukong today` | Show the Daily Proof Briefing and manage today's focus |
| `wukong server` | Start the local REST/WebSocket server |
| `wukong web` | Open the local web UI |
| `wukong doctor` | Validate configuration files |
| `wukong export [sessionId]` | Export a session ZIP |
| `wukong vis [sessionId]` | Open the session visualizer |
| `wukong migrate` | Migrate legacy Wukong data |
| `wukong upgrade` | Upgrade to the latest version |

Inside the TUI, `/verify`, `/scan`, `/guard`, `/report`, `/goal`, `/proof`, `/judge`, `/loop`, and `/today` are available. Planned commands (not yet shipped): `wukong ship`, `wukong schedule` (cloud routine).

Run `wukong --help` for the full option list.

---

## Documentation

Full docs: [docs.wukong.today](https://docs.wukong.today)

- [Getting started](./docs/getting-started.md)
- [Command reference](./docs/commands.md)
- [Configuration](./docs/configuration.md)

---

## Support

- Website: [wukong.today](https://wukong.today)
- Issues: [github.com/mutnpc/wukong-code/issues](https://github.com/mutnpc/wukong-code/issues)
- Email: [support@wukong.today](mailto:support@wukong.today)

---

## License

This is proprietary software. See [LICENSE.md](./LICENSE.md).
