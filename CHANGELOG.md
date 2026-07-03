# Changelog

All notable changes to the public Wukong Code distribution will be documented in
this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Changed
- Product name unified to **Wukong Code** across documentation, website, and CLI metadata.
- Public repository renamed to `mutnpc/wukong-code`; release binaries continue to be published here.
- Installation script (`install.sh`) updated to pull from the `wukong-code` release feed.
- CLI User-Agent updated to `wukong-code`.

## [0.0.3] - 2026-07-03

### Added
- Native binaries for all six target platforms: macOS Intel (`darwin-x64`), macOS Apple Silicon (`darwin-arm64`), Linux x64, Linux arm64, Windows x64, and Windows arm64.
- POSIX-compatible `install.sh` that auto-detects platform/architecture and downloads the matching release asset.

### Fixed
- Windows native build failures caused by PowerShell interpreting `@wukong` in pnpm filter commands; CI steps now explicitly use `shell: bash`.
- macOS x64 artifact mismatch by building it on the `macos-13` Intel runner.
- Public release publish job failing due to missing `WUKONG_PUBLIC_RELEASE_TOKEN` repository secret.

## [0.0.2] - 2026-07-03

### Added
- Built-in provider catalog entry for DeepSeek V4 Pro and Flash models (`deepseek-v4-pro`, `deepseek-v4-flash`).

### Fixed
- POSIX `sh` compatibility in `install.sh` (removed `pipefail` option).
- Release asset upload to the public `mutnpc/wukong-code` repository.

## [0.0.1] - 2026-07-03

### Added
- Initial public release of Wukong Code as a local-first terminal AI coding agent.
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
