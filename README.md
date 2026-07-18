# Wukong Code

> **Resume the task. Loop until the Gate passes.**

Wukong Code is a terminal-native AI coding agent built around one workflow:
**Resume → Loop → Gate**. Continue unfinished work, run the repository's real
checks, review the result from a fresh context, and iterate until the outcome is
actionable.

- **Terminal-native**: launch an interactive TUI or run one-off prompts without
  leaving your shell.
- **Loop until verified**: `wukong loop` writes, runs real project checks, scans
  risks, asks a fresh-context read-only reviewer, and fixes what remains.
- **Cross-Agent Resume**: continue local Codex, Claude Code, or Cursor sessions
  from the Wukong TUI without modifying the source session.
- **Actionable result**: every Loop ends as `PASS`, `NEEDS_WORK`, or `ERROR`,
  with structured blockers and stable process exit codes.
- **Bring your own provider key**: Wukong uses the model API you configure;
  login is used only for the Free Loop allowance and account state.

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

# In the TUI, continue a local session from another coding agent
/resume codex
/resume claude
/resume cursor

# Run a one-off prompt
wukong -p "explain this repository"

# Iterate until the independent delivery gate passes
wukong loop "finish the current change"

# Verify current changes before committing
wukong verify

# Scan for delivery risks
wukong scan

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
| `wukong verify` | Advanced local deterministic checks used by Loop |
| `wukong scan` | Advanced local risk scan used by Loop |
| `wukong guard` | Inspect or run the command risk guard |
| `wukong proof` | Advanced local verify + scan summary used by Loop |
| `wukong judge` | Evaluator-only merge decision |
| `wukong loop <objective>` | Run the Loop-first delivery workflow; supports `--max-iterations`, `--every`, `--model`, and `--role` |
| `wukong today` | Show the Daily Proof Briefing and manage today's focus |
| `wukong server` | Start the local REST/WebSocket server |
| `wukong web` | Open the local web UI |
| `wukong doctor` | Validate configuration files |
| `wukong export [sessionId]` | Export a session ZIP |
| `wukong vis [sessionId]` | Open the session visualizer |
| `wukong migrate` | Migrate legacy Wukong data |
| `wukong upgrade` / `wukong update` | Upgrade to the latest version |

Inside the TUI, `/resume`, `/resume codex`, `/resume claude`, `/resume cursor`,
and `/loop` are the primary workflow. Advanced local diagnostics remain
available through `/verify`, `/scan`, `/proof`, `/judge`, and `/guard`.

Version 0.0.14 provides one two-iteration Guest trial. Signed-in Free users get
10 Loop sessions per month with up to five iterations each. Internal verify,
scan, and proof checks do not consume extra quota. Loop exits with `0` for
`PASS`, `1` for `NEEDS_WORK`, `2` for `ERROR`, `3` for auth/quota rejection,
and `130` when interrupted.

Run `wukong --help` for the full option list.

---

## Documentation

Full docs: [docs.wukong.today](https://docs.wukong.today)

- [Getting started](./docs/getting-started.md)
- [Command reference](./docs/commands.md)
- [Configuration](./docs/configuration.md)
- [Updates and announcements](./docs/updates-and-announcements.md)

---

## Support

- Website: [wukong.today](https://wukong.today)
- Issues: [github.com/mutnpc/wukong-code/issues](https://github.com/mutnpc/wukong-code/issues)
- Email: [support@wukong.today](mailto:support@wukong.today)

---

## License

This is proprietary software. See [LICENSE.md](./LICENSE.md).
