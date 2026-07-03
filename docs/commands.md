# Command Reference

Complete reference for the current Wukong Code command surface.

Run `wukong --help` for the most up-to-date options.

---

## Global options

| Option | Description |
|---|---|
| `-h, --help` | Show help |
| `-V, --version` | Show version |
| `-p, --prompt <prompt>` | Run one prompt non-interactively |
| `-c, --continue` | Continue the previous session for the working directory |
| `-S, --session [id]` | Resume a session |
| `--yes, --yolo` | Automatically approve all actions |
| `--plan` | Start in plan mode |

---

## Core commands

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
wukong provider --help
```

### `wukong login`

Authenticate via the device-code flow.

```bash
wukong login
```

---

## Verification commands

### `wukong verify`

Run deterministic checks on the current workspace and write an evidence report.

```bash
wukong verify
wukong verify --build
wukong verify --command "pnpm test"
wukong verify --json
wukong verify --no-report
```

### `wukong scan`

Read-only risk scan of git changes.

```bash
wukong scan
wukong scan --json
wukong scan --report ./reports/risk.md
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

## Server and web commands

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

## Utility commands

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

## Exit codes

| Code | Meaning |
|---|---|
| 0 | Success |
| 1 | Command failure or high-risk verification result |
| 2 | Invalid arguments or environment error |
