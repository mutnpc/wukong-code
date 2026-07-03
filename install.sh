#!/bin/sh
set -eu

REPO_OWNER="mutnpc"
REPO_NAME="wukong-cli"
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

echo "Installing Wukong CLI ${VERSION} for ${TARGET}..."
echo "Download URL: ${RELEASE_URL}"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

curl -fsSL "$RELEASE_URL" -o "${TMP_DIR}/${ARTIFACT}"

mkdir -p "$INSTALL_DIR"
unzip -o "${TMP_DIR}/${ARTIFACT}" -d "$INSTALL_DIR"
chmod +x "${INSTALL_DIR}/${BINARY_NAME}"

echo ""
echo "Wukong CLI installed to: ${INSTALL_DIR}/${BINARY_NAME}"

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
