#!/usr/bin/env bash
# Installer for kit (and the legacy aksc/aksm shims that forward to kit).
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/zaidhassan168/aks-tools/main/install.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/zaidhassan168/aks-tools/main/install.sh | INSTALL_DIR=~/bin bash

set -euo pipefail

REPO="zaidhassan168/aks-tools"
BRANCH="${BRANCH:-main}"
DEFAULT_DIR="/usr/local/bin"
INSTALL_DIR="${INSTALL_DIR:-$DEFAULT_DIR}"

# If using the default dir and we can't write to it, fall back to ~/bin.
# If the user explicitly set INSTALL_DIR, honour it as-is.
if [[ "$INSTALL_DIR" == "$DEFAULT_DIR" && ! -w "$INSTALL_DIR" ]]; then
  INSTALL_DIR="$HOME/bin"
fi
mkdir -p "$INSTALL_DIR"

raw="https://raw.githubusercontent.com/$REPO/$BRANCH"

fetch() {
  local src="$1" dest="$2"
  echo "→ $dest"
  curl -fsSL "$raw/$src" -o "$dest"
  chmod +x "$dest"
}

echo "Installing aks-tools to $INSTALL_DIR"
fetch "kit/kit"   "$INSTALL_DIR/kit"
fetch "aksc/aksc" "$INSTALL_DIR/aksc"
fetch "aksm/aksm" "$INSTALL_DIR/aksm"

echo
echo "Installed:"
echo "  kit   — main CLI (run \`kit --help\`)"
echo "  aksc  — legacy shim → \`kit console\`"
echo "  aksm  — legacy shim → \`kit\`"
echo

if ! command -v kit >/dev/null 2>&1; then
  echo "WARNING: $INSTALL_DIR is not on your PATH."
  echo "  Add this to your shell rc:  export PATH=\"$INSTALL_DIR:\$PATH\""
fi

echo "Prerequisites: az, kubectl, fzf (recommended), python3"
