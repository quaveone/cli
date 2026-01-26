#!/bin/bash
set -e

# Config
REPO="quaveone/cli"
BINARY="quaveone"

# Detect OS
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
case "$OS" in
  linux|darwin) ;;
  mingw*|msys*|cygwin*) OS="windows" ;;
  *) echo "Unsupported OS: $OS"; exit 1 ;;
esac

# Detect architecture
ARCH=$(uname -m)
case "$ARCH" in
  x86_64|amd64) ARCH="amd64" ;;
  arm64|aarch64) ARCH="arm64" ;;
  *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Get latest version
VERSION=$(curl -sL "https://api.github.com/repos/${REPO}/tags" | grep '"name":' | head -1 | cut -d'"' -f4)
if [ -z "$VERSION" ]; then
  echo "Failed to get latest version"
  exit 1
fi

# Build download URL
VERSION_NUM="${VERSION#v}"
FILE="${BINARY}-${VERSION_NUM}-${OS}-${ARCH}"
[ "$OS" = "windows" ] && FILE="${FILE}.exe"
URL="https://github.com/${REPO}/releases/download/${VERSION}/${FILE}"

echo "Installing ${BINARY} ${VERSION} (${OS}/${ARCH})..."

# Install
if [ "$OS" = "windows" ]; then
  INSTALL_DIR="$LOCALAPPDATA/Programs/quaveone"
  mkdir -p "$INSTALL_DIR"
  curl -sLk "$URL" -o "${INSTALL_DIR}/${BINARY}.exe"
  powershell -Command "[Environment]::SetEnvironmentVariable('Path', [Environment]::GetEnvironmentVariable('Path', 'User') + ';${INSTALL_DIR}', 'User')"
  echo "Installed: ${INSTALL_DIR}/${BINARY}.exe"
  echo "Restart your terminal to use '${BINARY}'"
else
  INSTALL_DIR="/usr/local/bin"
  TMP=$(mktemp -d)
  curl -sL "$URL" -o "${TMP}/${BINARY}"
  chmod +x "${TMP}/${BINARY}"
  if [ -w "$INSTALL_DIR" ]; then
    mv "${TMP}/${BINARY}" "${INSTALL_DIR}/"
  else
    sudo mv "${TMP}/${BINARY}" "${INSTALL_DIR}/"
  fi
  rm -rf "$TMP"
  echo "Installed: ${INSTALL_DIR}/${BINARY}"
fi