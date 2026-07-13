---
layout: default
title: Updates and announcements
nav_order: 5
permalink: /updates-and-announcements/
---

# Updates and announcements

Wukong Code uses separate channels for software updates and TUI announcements. An announcement never installs software, and the update channel does not depend on announcements.

## Software updates

At startup, the CLI checks Wukong's public version manifest. The check is fail-open: network and manifest errors do not prevent the CLI from starting.

- Global npm, pnpm, yarn, and bun installations support background automatic updates.
- Automatic installation is enabled by default.
- Homebrew, native, and unrecognized installations show a manual command instead of executing an update automatically.
- A successful background installation is reported on the next interactive startup, with a changelog link.
- Passive startup updates may use a staged rollout. `wukong upgrade` always checks the latest release directly.

Run a manual check at any time:

```bash
wukong upgrade
# Alias:
wukong update
```

### Update preferences

Open `/settings` in the TUI and choose **Upgrade**, or edit `~/.wukong/tui.toml`:

```toml
[upgrade]
auto_install = false
```

Setting `auto_install` to `false` stops background installation but keeps update checks and user-visible prompts.

To disable the startup update preflight completely, set:

```bash
export WUKONG_CODE_NO_AUTO_UPDATE=1
```

The legacy `WUKONG_CLI_NO_AUTO_UPDATE` name is also accepted. This setting does not disable the explicit `wukong upgrade` command.

## TUI announcements

After the main TUI mounts, the CLI asynchronously requests the public announcement document at `https://wukong.today/cli/announcements.json` once per startup.

- The request has a three-second timeout and never blocks input.
- Network errors, non-success responses, malformed JSON, and unsupported schemas are silently ignored.
- At most one eligible announcement is shown per startup.
- Announcements may target a client version range and a UTC time window.
- `once` announcements appear once per announcement ID on a device.
- `cooldown` announcements may reappear after their configured interval.
- `always` announcements appear at every startup and are reserved for active incidents.
- Announcement text is sanitized before terminal rendering. Action URLs are limited to approved Wukong and Wukong Code HTTPS destinations.

The CLI stores only the display time needed for `once` and `cooldown` behavior. It does not cache the announcement body.

### Network and privacy behavior

The announcement request does not include a Wukong login token, repository content, prompts, or personalized query parameters. Like any HTTPS request, it exposes ordinary network metadata such as the source IP and User-Agent to the server.

The automatic-update preference and `WUKONG_CODE_NO_AUTO_UPDATE` affect software updates only. There is currently no separate announcement preference.

## Version compatibility

Version `0.0.10` and earlier use the previous announcement address and cannot read the new announcement document. Those clients must first upgrade through the independent version-update channel. The announcement channel becomes available in the first CLI release that includes the new endpoint and can then be used for later releases.

For this reason, a new announcement endpoint must never be the only way users are told to install the release that introduces that endpoint.
