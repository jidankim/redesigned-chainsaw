#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="${MISE_BOOTSTRAP_VERSION:-v2026.4.17}"
INSTALL_DIR="$ROOT_DIR/.tools/mise/bin"
INSTALL_PATH="$INSTALL_DIR/mise"

mkdir -p "$INSTALL_DIR"
mkdir -p "$ROOT_DIR/.cache" "$ROOT_DIR/.config" "$ROOT_DIR/.local/share" "$ROOT_DIR/.local/state"

os="$(uname -s)"
arch="$(uname -m)"

case "$os" in
  Darwin) platform_os="macos" ;;
  Linux) platform_os="linux" ;;
  *)
    echo "Unsupported OS for repo-local mise bootstrap: $os" >&2
    exit 1
    ;;
esac

case "$arch" in
  arm64|aarch64) platform_arch="arm64" ;;
  x86_64|amd64) platform_arch="x64" ;;
  *)
    echo "Unsupported architecture for repo-local mise bootstrap: $arch" >&2
    exit 1
    ;;
esac

platform="${platform_os}-${platform_arch}"
download_url="https://github.com/jdx/mise/releases/download/${VERSION}/mise-${VERSION}-${platform}.tar.gz"
tmp_dir="$(mktemp -d)"
archive_path="$tmp_dir/mise.tar.gz"

cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$download_url" -o "$archive_path"
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$archive_path" "$download_url"
else
  echo "curl or wget is required to bootstrap repo-local mise." >&2
  exit 1
fi

tar -xzf "$archive_path" -C "$tmp_dir"

if [[ ! -f "$tmp_dir/mise/bin/mise" ]]; then
  echo "Unexpected archive layout while bootstrapping mise from $download_url" >&2
  exit 1
fi

mv "$tmp_dir/mise/bin/mise" "$INSTALL_PATH"
chmod +x "$INSTALL_PATH"

echo "Installed repo-local mise ${VERSION} to $INSTALL_PATH"
