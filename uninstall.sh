#!/usr/bin/env bash
# Removes only the files this installer created.
set -euo pipefail

NAME="goanyapi-data"
DEST_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}/$NAME"

if [ ! -e "$DEST_DIR" ]; then
  echo "Nothing to remove: $DEST_DIR does not exist."
  exit 0
fi

rm -f "$DEST_DIR/SKILL.md" "$DEST_DIR/README.md"
rmdir "$DEST_DIR" 2>/dev/null || true
echo "Removed $DEST_DIR"
echo "Your API key lives in your shell environment and was never written by this repository."
