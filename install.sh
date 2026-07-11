#!/bin/sh
set -eu

REPO_OWNER="mutnpc"
REPO_NAME="wukong-code"
INSTALL_DIR="${WUKONG_INSTALL_DIR:-$HOME/.wukong/bin}"
BINARY_NAME="wukong"

# Determine platform and architecture
PLATFORM="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"

case "$PLATFORM" in
  darwin)
    PLATFORM="darwin"
    ;;
  linux)
    PLATFORM="linux"
    ;;
  mingw*|msys*|cygwin*)
    PLATFORM="win"
    ;;
  *)
    echo "Unsupported platform: $PLATFORM"
    exit 1
    ;;
esac

case "$ARCH" in
  x86_64|amd64)
    ARCH="x64"
    ;;
  arm64|aarch64)
    ARCH="arm64"
    ;;
  *)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

if [ "$PLATFORM" = "win" ]; then
  TARGET="win-${ARCH}"
  BINARY_NAME="wukong.exe"
else
  TARGET="${PLATFORM}-${ARCH}"
fi

ARTIFACT="wukong-${TARGET}.zip"

# Resolve version: prefer WUKONG_VERSION, otherwise fetch latest release tag.
if [ -n "${WUKONG_VERSION:-}" ]; then
  VERSION="$WUKONG_VERSION"
else
  VERSION="$(curl -fsSL "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/releases/latest" | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p')"
  if [ -z "$VERSION" ]; then
    echo "Failed to determine latest release version."
    exit 1
  fi
fi

RELEASE_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}/releases/download/${VERSION}/${ARTIFACT}"
CHECKSUM_URL="${RELEASE_URL}.sha256"

echo "Installing Wukong Code ${VERSION} for ${TARGET}..."
echo "Download URL: ${RELEASE_URL}"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

curl -fsSL "$RELEASE_URL" -o "${TMP_DIR}/${ARTIFACT}"
curl -fsSL "$CHECKSUM_URL" -o "${TMP_DIR}/${ARTIFACT}.sha256"

EXPECTED_SHA256="$(sed -n 's/^\([0-9a-fA-F]\{64\}\).*/\1/p' "${TMP_DIR}/${ARTIFACT}.sha256")"
if [ -z "$EXPECTED_SHA256" ]; then
  echo "Release checksum is missing or invalid."
  exit 1
fi

if command -v sha256sum >/dev/null 2>&1; then
  ACTUAL_SHA256="$(sha256sum "${TMP_DIR}/${ARTIFACT}" | awk '{print $1}')"
elif command -v shasum >/dev/null 2>&1; then
  ACTUAL_SHA256="$(shasum -a 256 "${TMP_DIR}/${ARTIFACT}" | awk '{print $1}')"
else
  echo "Cannot verify release: sha256sum or shasum is required."
  exit 1
fi

if [ "$ACTUAL_SHA256" != "$EXPECTED_SHA256" ]; then
  echo "Release checksum verification failed."
  exit 1
fi

echo "Verified SHA-256: ${ACTUAL_SHA256}"

mkdir -p "$INSTALL_DIR"
unzip -o "${TMP_DIR}/${ARTIFACT}" -d "$INSTALL_DIR"
chmod +x "${INSTALL_DIR}/${BINARY_NAME}"

echo ""
echo "Wukong Code installed to: ${INSTALL_DIR}/${BINARY_NAME}"

# POSIX-compatible PATH check
case ":${PATH}:" in
  *":${INSTALL_DIR}:"*) ;;
  *)
    echo ""
    echo "Add the following to your shell profile to add wukong to your PATH:"
    echo "  export PATH=\"${INSTALL_DIR}:\$PATH\""
    ;;
esac

echo ""
echo "Run 'wukong --version' to verify the installation."
