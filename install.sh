#!/bin/bash
set -e

REPO="quaveone/cli"
BINARY="quaveone"
INSTALL_DIR="/usr/local/bin"

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

case "$ARCH" in
  x86_64|amd64) ARCH="amd64" ;;
  arm64|aarch64) ARCH="arm64" ;;
  *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

case "$OS" in
  linux|darwin) ;;
  mingw*|msys*|cygwin*) OS="windows" ;;
  *) echo "Unsupported OS: $OS"; exit 1 ;;
esac

VERSION=$(curl -sL "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name":' | cut -d'"' -f4)

if [ -z "$VERSION" ]; then
  echo "Failed to get latest version"
  exit 1
fi

FILE="${BINARY}-${VERSION}-${OS}-${ARCH}"
[ "$OS" = "windows" ] && FILE="${FILE}.exe"

URL="https://github.com/${REPO}/releases/download/${VERSION}/${FILE}"

echo "Installing ${BINARY} ${VERSION} (${OS}/${ARCH})..."

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