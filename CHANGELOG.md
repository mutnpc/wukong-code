# Changelog

All notable changes to the public Wukong Code distribution will be documented in
this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

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
