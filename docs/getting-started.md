---
layout: default
title: Getting Started
nav_order: 2
permalink: /getting-started/
---

# Getting Started

Wukong Code v0.0.16 is a terminal AI coding agent centered on one workflow:
**Goal → Write → Check → Review → Fix**.

## Requirements

- macOS, Linux, or Windows
- A local workspace directory
- An API key for a supported model provider

Wukong calls the provider API you configure. BYOK does not mean a local model.
Device Login is optional and is used for the Free Loop allowance and account
state.

## Install

### macOS and Linux

```bash
curl -fsSL https://wukong.today/install.sh | sh
wukong --version
```

The installer downloads the matching native binary from the public release and
verifies its SHA-256 file.

### Windows

Download the matching Windows x64 or ARM64 ZIP from the
[release page](https://github.com/mutnpc/wukong-code/releases/tag/v0.0.16),
extract `wukong.exe`, and add it to your `PATH`.

### Upgrade

```bash
wukong upgrade
```

Native macOS and Linux installations upgrade in place after checking the
release SHA-256. Windows native installations open the download path when an
automatic replacement is unavailable.

## Configure a model

Start the TUI and open the guided provider manager:

```bash
wukong
```

```text
/provider
```

For non-interactive provider commands:

```bash
wukong provider --help
wukong provider list
```

## Run your first Loop

Inside the TUI:

```text
/loop add input validation to the signup form
```

Or run a headless Loop:

```bash
wukong loop "add input validation to the signup form"
```

The Loop:

1. Works on the goal.
2. Runs the checks available in the repository.
3. Reviews the change from a fresh read-only context.
4. Fixes blocking findings against the same goal.
5. Returns `PASS`, `NEEDS_WORK`, or `ERROR`.

v0.0.16 remembers earlier blockers. If the same blocker survives repeated
reviews, Wukong tries one fresh read-only strategy and then stops with
`NEEDS_WORK/no_progress` if the work is still not moving forward.

Loop exit codes are `PASS=0`, `NEEDS_WORK=1`, `ERROR=2`, auth or quota rejection
`=3`, and interruption `=130`.

## Resume unfinished work

Use `/resume` for Wukong sessions. Name another source only when you want Wukong
to scan that agent's local sessions:

```text
/resume
/resume codex
/resume claude
/resume cursor
```

External history is imported as read-only context. Wukong does not restart the
other agent, inherit its permissions, replay its old tools, or modify the source
session. You choose whether to continue directly or start an editable Loop goal.

## Use a focused role

Role profiles are experimental. Enable them in `~/.wukong/config.toml`:

```toml
[experimental]
role_profiles = true
```

Then list or select a role:

```bash
wukong roles list
wukong --role security
```

Inside the TUI:

```text
/transform security
/transform off
```

Roles can select instructions, models, and a narrower tool set. They cannot
expand Wukong's hard safety boundaries.

## Use subagents

Wukong can delegate bounded work without changing the main Loop contract:

```text
/swarm investigate the failing tests and propose independent fixes
/btw explain whether this migration is backward compatible
/tasks
```

- `/swarm <task>` enables swarm mode and starts a task that may delegate work.
- `/btw <question>` opens a forked side agent for a focused question.
- `/tasks` shows background agents and their current state.

Read-only reviewers and strategists remain read-only even when the parent agent
uses Auto or YOLO.

## Choose a permission mode

- **Manual** asks before operations covered by approval rules.
- **Auto** does not ask follow-up approval questions, but blocks workspace
  escapes, sensitive targets, high-risk commands, and unclassified external
  tools.
- **YOLO** skips ordinary approvals, but cannot bypass explicit deny rules,
  safety hooks, plan guards, role limits, or read-only agent limits.

Headless prompt mode defaults to guarded Auto. Dangerous headless execution
requires both flags:

```bash
wukong -p "finish the current change" --yolo --yes
```

`--yes` by itself does not enable YOLO.

## Free allowance

Guests receive one local trial with up to two Loop iterations. Signed-in Free
users receive 10 Loop sessions per month with up to five iterations each.
Internal checks do not consume additional quota.

```bash
wukong login
```

## Advanced diagnostics

`verify`, `scan`, `proof`, and `judge` remain directly executable for diagnosis
and CI. Loop already runs these layers, so they are not separate products or
separate quotas. See the [Command Reference](/commands/#advanced-diagnostics).

## Next steps

- Browse the [Command Reference](/commands/)
- Configure [permissions, roles, Resume, and updates](/configuration/)
- Read [Updates and announcements](/updates-and-announcements/)
