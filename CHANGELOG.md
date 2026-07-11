# Changelog

All notable changes to the public Wukong Code distribution will be documented in
this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

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
