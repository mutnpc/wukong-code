# Changelog

All notable changes to the public Wukong Code distribution will be documented in
this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

## [0.0.11] - 2026-07-13

Wukong Code 0.0.11 closes the first hosted-evidence UX loop: generate proof locally, keep it private in hosted history by default, and create a public reviewer link only when explicitly requested.

### Added
- Non-blocking TUI announcements fetched from `https://wukong.today/cli/announcements.json`. Messages can target client versions and UTC time windows, use `once` / `cooldown` / `always` frequency, and link only to approved Wukong destinations.
- Explicit public hosted-report sharing through `wukong verify --upload --public`, `wukong scan --upload --public`, `wukong proof --upload --public`, and `wukong report upload <path> --public`.
- A hosted-evidence next step after `wukong proof`, showing the private-history and public-share commands instead of leaving upload undiscoverable.
- Hosted-report plan, usage, quota, and Dashboard destination in logged-in `wukong today` output.

### Changed
- Hosted report uploads are private by default. A public reviewer link is created only with the explicit `--public` flag, and `--public` without `--upload` returns a usage error.
- Refined TUI welcome, loop status, proof actions, status tracks, and footer alignment for narrow and wide terminals.
- Reworked the Wukong Dashboard around real report history, evidence status, hosted quota, and task-oriented next actions instead of generic SaaS metrics.
- Added public documentation for software updates, automatic-update controls, announcement privacy, operator JSON workflow, and version compatibility.

### Fixed
- Hosted report visibility is now explicit end to end, so a public upload reliably returns a share link while ordinary uploads stay private.
- Hosted usage and announcement network failures remain fail-open and never block the local briefing or TUI startup.
- The public announcement endpoint now ships as cacheable static JSON with a five-minute cache policy and no authentication requirement.

## [0.0.10] - 2026-07-09

### Fixed
- OAuth device-code login now targets `https://wukong.today` (the previous `auth.wukong.today` host had no DNS).
- Accept legacy `oauth/` credential key prefixes so persisted `oauth_host` is not dropped during login.
- Startup no longer warns when refreshing `managed:wukong` models while logged out.
- CLI `--help` documentation link points to `https://docs.wukong.today`.

## [0.0.9] - 2026-07-09

### Added
- `wukong today` Daily Proof Briefing: local verify/scan/proof stats, streak, focus, and next actions. Run `wukong today` or `/today`.
- M1 Hosted Reports: upload redacted `verify`/`scan`/`proof` reports to wukong.today with `wukong verify --upload`, `wukong scan --upload`, `wukong proof --upload`, or `wukong report upload <path>`.
- Hosted report list and share page at `https://wukong.today/r/<id>`.
- Per-tier monthly hosted report quota (founder/pro) with usage tracking.
- Loop-driven TUI chrome: Claude Code-style borderless editor, loop-phase heartbeat, and verify/proof conclusion tracks.

### Fixed
- Chrome-state no longer treats goal blocked as a verify failure; hydrate keeps the newest stats events; warning/judge mapping matches CLI semantics.
- Nix/SEA Node 26.4.0 build and verification workspace wiring.

## [0.0.8] - 2026-07-08

### Added
- Milestone 0.5 AI Coding Loop control plane: interactive `/loop` for local iteration pacing. The non-interactive driver and cloud `/schedule` remain planned.
- `/loop --every` cron-style scheduler pacing for recurring agent loops.
- Verification layer merge proof and stop conditions for `verify-skill`.

### Changed
- Point CLI default OAuth host and API base URL to `wukong.today`.
- Regenerate web favicon from the Wukong logo.

### Fixed
- Clear all lint warnings and fix latent bugs uncovered by lint (verification double-resolve, jitter hash safety, oauth Set typing).
- Fix Vitest `#/cli/*` alias resolution so the CLI test suite runs green.

## [0.0.7] - 2026-07-03

### Changed
- Point CLI default OAuth host to `wukong.today` so `wukong login` uses the new web device-code flow.

## [0.0.6] - 2026-07-03

### Changed
- Rebrand TUI welcome card to **Wukong Code** with a compact startup layout.
- Simplify platform selector to OAuth-only, removing API-key platform options.

## [0.0.5] - 2026-07-03

### Added
- Native binaries for all six target platforms: macOS Intel (`darwin-x64`), macOS Apple Silicon (`darwin-arm64`), Linux x64, Linux arm64, Windows x64, and Windows arm64.
- POSIX-compatible `install.sh` that auto-detects platform/architecture and downloads the matching release asset.

### Fixed
- Windows native build failures caused by PowerShell interpreting `@wukong` in pnpm filter commands; CI steps now explicitly use `shell: bash`.
- macOS x64 build by cross-compiling on `macos-latest` Apple Silicon runners with a target-architecture Node.js SEA base binary.
- Public release publish job failing due to missing `WUKONG_PUBLIC_RELEASE_TOKEN` repository secret.

## [0.0.1] - 2026-07-03

### Added
- Initial public release of Wukong Code as a terminal AI coding agent.
- Interactive TUI (`wukong`) and one-off prompt mode (`wukong -p`).
- Verification suite: `wukong verify`, `wukong scan`, `wukong guard`.
- Provider management (`wukong provider`) with built-in support for DeepSeek, Moonshot, OpenAI-compatible providers, and more.
- Local web UI (`wukong web`) and REST/WebSocket server (`wukong server`).
- ACP server mode (`wukong acp`), session export, session visualizer, and legacy migration.
- Native binary distribution for macOS, Linux, and Windows.

### Notes
- This public release corresponds to the implementation work in the internal `mutnpc/wukong_cli` repository.
- No API keys are bundled with the binary; users bring their own model provider keys.

---

## Legacy history

### [1.0.0] - 2026-02-03

### Added
- Legacy public release preparation covering login, sync, config, and bug reporting commands.
