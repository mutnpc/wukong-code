---
layout: default
title: Commands
nav_order: 3
permalink: /commands/
---

# Command Reference

{: .highlight }
Run `wukong --help` for the most up-to-date options.
Full docs live at [docs.wukong.today](https://docs.wukong.today).

## Global Options

| Option | Description |
|---|---|
| `-h, --help` | Show help |
| `-V, --version` | Show version |
| `-p, --prompt <prompt>` | Run one prompt non-interactively |
| `-c, --continue` | Continue the previous session |
| `-S, --session [id]` | Resume a session |
| `--yes, --yolo` | Automatically approve all actions |
| `--plan` | Start in plan mode |

---

## Core Commands

### `wukong`

Launch the interactive TUI.

```bash
wukong
```

### `wukong -p <prompt>`

Run a single prompt and print the response.

```bash
wukong -p "explain the project structure"
```

### `wukong provider`

Manage LLM providers.

```bash
wukong provider
wukong provider catalog add deepseek --api-key <key> --default-model deepseek-v4-pro
```

### `wukong login`

Authenticate via the device-code flow (needed for hosted report upload).

```bash
wukong login
```

Opens `https://wukong.today/auth/device`. OAuth endpoints live on `wukong.today`
(not a separate `auth.*` subdomain).

### `wukong today`

Show the Daily Proof Briefing: today's verify/scan/proof/guard stats, streak,
last proof summary, and next suggestions. Optionally set or clear focus.

```bash
wukong today
wukong today "ship auth fix"
wukong today --clear-focus
```

In the TUI, `/today` shows the same briefing.

---

## Verification Commands

### `wukong verify`

Run deterministic checks on the current workspace and write an evidence report.

```bash
wukong verify
wukong verify --build
wukong verify --command "pnpm test"
wukong verify --json
wukong verify --no-report
wukong verify --upload
```

### `wukong scan`

Read-only risk scan of git changes.

```bash
wukong scan
wukong scan --json
wukong scan --report ./reports/risk.md
wukong scan --upload
```

### `wukong proof`

Generate a Merge Proof Report (verify + scan + recommendation).

```bash
wukong proof
wukong proof --json
wukong proof --upload
```

### `wukong judge`

Deterministic pass/block judgment from proof signals (no model calls by default).

```bash
wukong judge
wukong judge --json
```

### `wukong report upload <path>`

Upload an existing local report markdown file to wukong.today. Requires login.
The type is auto-detected from the markdown content or can be set with `--type`.

```bash
wukong report upload ./wukong-verify-report.md
wukong report upload ./scan-report.md --type scan
```

### `wukong guard`

Inspect or run the command risk guard.

```bash
wukong guard --status
wukong guard --stats
wukong guard --enable
wukong guard --disable
wukong guard -- rm -rf ./tmp
```

---

## Loop Control (TUI)

Inside the TUI:

| Slash command | Description |
|---|---|
| `/today` | Daily Proof Briefing |
| `/verify` | Run verification |
| `/scan` | Risk scan |
| `/proof` | Merge proof report |
| `/judge` | Pass/block judgment |
| `/goal` | Drive a single objective; optional `--until verify-pass\|scan-clean\|judge-pass` |
| `/loop` | Iterate locally until a verification gate passes |
| `/guard` | Guard status |
| `/report` | Open the latest verification, scan, or proof report |

### `wukong loop`

CLI entry for a local iteration loop with a verification gate. Prefer `/loop`
in the TUI for the interactive driver.

```bash
wukong loop --until verify-pass --dry-run
```

---

## Planned Commands

{: .warning }
> The commands below are **not yet shipped**. They are tracked in the roadmap
> as future milestones.

| Command | Description |
|---|---|
| `wukong ship` | Release gate: proof + version/changelog checks + dry-run |
| `wukong schedule` | Cloud routine that keeps running when your machine is off (hosted, later) |

---

## Server & Web Commands

### `wukong server`

Start the local REST/WebSocket server.

```bash
wukong server run --foreground
```

### `wukong web`

Open the local web UI.

```bash
wukong web
```

---

## Utility Commands

### `wukong doctor`

Validate configuration files.

```bash
wukong doctor
```

### `wukong export [sessionId]`

Export a session as a ZIP file.

```bash
wukong export
wukong export <session-id>
```

### `wukong vis [sessionId]`

Open the session visualizer.

```bash
wukong vis
wukong vis <session-id>
```

### `wukong migrate`

Migrate legacy Wukong data.

```bash
wukong migrate
```

### `wukong upgrade`

Upgrade to the latest version.

```bash
wukong upgrade
```

---

## Exit Codes

| Code | Meaning |
|---|---|
| `0` | Success |
| `1` | Command failure or high-risk verification |
| `2` | Invalid arguments or environment error |
