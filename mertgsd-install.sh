#!/bin/bash
# MertGSD Installer — copies .agent/ to your project directory

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-.}"

if [ ! -d "$SCRIPT_DIR/.agent" ]; then
  echo "❌ .agent/ directory not found in MertGSD repo."
  exit 1
fi

if [ "$TARGET_DIR" = "." ]; then
  TARGET_DIR="$(pwd)"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " MertGSD — Installing to: $TARGET_DIR"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Copy .agent directory
cp -r "$SCRIPT_DIR/.agent" "$TARGET_DIR/.agent"

AGENT_COUNT=$(ls "$TARGET_DIR/.agent/agents/"*.md 2>/dev/null | wc -l)
WORKFLOW_COUNT=$(ls "$TARGET_DIR/.agent/workflows/"*.md 2>/dev/null | wc -l)

echo " ✓ Agents:    $AGENT_COUNT"
echo " ✓ Workflows: $WORKFLOW_COUNT"
echo ""
echo " Next steps:"
echo "   cd $TARGET_DIR"
echo "   /gsd-new-project    → Start a new project"
echo "   /gsd-help           → See all commands"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " MertGSD installed successfully ✓"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
