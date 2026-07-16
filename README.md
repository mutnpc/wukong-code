# Wukong Code

> **AI can write the code. Wukong proves whether it should ship.**

Wukong Code is a terminal-native AI coding agent built as the **control and
verification layer for AI Coding Loops**. It runs on your machine, works with
your existing codebase, and answers the question every other agent leaves open:
*can this AI-written code be merged?*

- **Terminal-native**: launch an interactive TUI or run one-off prompts without
  leaving your shell.
- **Loop until verified**: `wukong loop` writes, runs real project checks, scans
  risks, asks a fresh-context read-only reviewer, and fixes what remains.
- **Actionable result**: every Loop ends as `PASS`, `NEEDS_WORK`, or `ERROR`,
  with structured blockers and stable process exit codes.
- **Bring your own provider key**: Wukong uses the model you configure; login is
  used for the Free Loop allowance and optional hosted features, not a local model.

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

# Iterate until the independent delivery gate passes
wukong loop "finish the current change"

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
| `wukong loop <objective>` | Run the Loop-first delivery workflow; supports `--max-iterations`, `--every`, `--model`, and `--role` |
| `wukong report upload <path>` | Upload a local report markdown file to wukong.today |
| `wukong today` | Show the Daily Proof Briefing and manage today's focus |
| `wukong server` | Start the local REST/WebSocket server |
| `wukong web` | Open the local web UI |
| `wukong doctor` | Validate configuration files |
| `wukong export [sessionId]` | Export a session ZIP |
| `wukong vis [sessionId]` | Open the session visualizer |
| `wukong migrate` | Migrate legacy Wukong data |
| `wukong upgrade` / `wukong update` | Upgrade to the latest version |

Inside the TUI, `/verify`, `/scan`, `/guard`, `/report`, `/goal`, `/proof`, `/judge`, `/loop`, and `/today` are available. Planned commands (not yet shipped): `wukong ship`, `wukong schedule` (cloud routine).

Version 0.0.12 provides one two-iteration Guest trial. Signed-in Free users get
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
