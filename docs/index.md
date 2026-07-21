---
layout: default
title: Home
nav_order: 1
permalink: /
---

# Give Wukong a goal. It loops until the change is ready.

{: .fs-6 .fw-300 }
Wukong Code is a terminal AI coding agent built around one workflow:
**Goal → Write → Check → Review → Fix**.

[Install v0.0.16](#install){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Download Wukong Code](https://wukong.today/download){: .btn .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View the release](https://github.com/mutnpc/wukong-code/releases/tag/v0.0.16){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## One workflow

{: .note }
> **Loop until ready** — `/loop` works on one goal, runs the repository's real
> checks, reviews from a fresh read-only context, and fixes blocking findings.

{: .note }
> **Stop instead of drift** — v0.0.16 keeps the goal fixed, remembers earlier
> blockers, and stops with a clear reason when another iteration would repeat
> the same work.

{: .note }
> **Resume unfinished work** — continue local Codex, Claude Code, or Cursor
> sessions without modifying the source session or replaying old tools.

{: .note }
> **Roles and subagents** — transform Wukong for focused work, delegate an
> independent task, and inspect background agents without creating a second
> workflow.

{: .note }
> **BYOK** — choose your provider and model API. Wukong does not require a local
> model. Device Login is only for the Free Loop allowance and account state.

## Install

macOS and Linux:

```bash
curl -fsSL https://wukong.today/install.sh | sh
wukong --version
```

Windows users can download the matching x64 or ARM64 ZIP from the
[release page](https://github.com/mutnpc/wukong-code/releases/tag/v0.0.16).

## Start a Loop

```bash
# Start the TUI
wukong

# Or run a Loop directly
wukong loop "finish the current change"
```

Inside the TUI:

```text
/provider
/loop add input validation to the signup form
/resume codex
```

Every Loop finishes as `PASS`, `NEEDS_WORK`, or `ERROR`. Start with the
[Getting Started guide](/getting-started/) or browse the
[Command Reference](/commands/).

## Current product boundary

v0.0.16 is free and bring-your-own-key. It includes one Guest trial and 10
signed-in Free Loop sessions per month. There is no public paid plan, Checkout,
hosted report workflow, or managed model credit in this release.
