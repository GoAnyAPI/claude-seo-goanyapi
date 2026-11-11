#!/usr/bin/env bash
# Installs the GoAnyAPI data skill into the user's own Claude skills directory.
# Touches nothing belonging to Claude SEO.
set -euo pipefail

NAME="goanyapi-data"
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}/$NAME"

if [ -e "$DEST_DIR" ] && [ "${1:-}" != "--force" ]; then
  echo "Already installed at $DEST_DIR" >&2
  echo "Re-run with --force to overwrite." >&2
  exit 1
fi

mkdir -p "$DEST_DIR"
cp "$SRC_DIR/SKILL.md" "$DEST_DIR/SKILL.md"
cp "$SRC_DIR/README.md" "$DEST_DIR/README.md"

echo "Installed $NAME to $DEST_DIR"
echo
echo "Next: export GOANYAPI_API_KEY=... in your shell profile, then restart Claude Code."
echo "No key is stored by this installer, and none is written to disk."
