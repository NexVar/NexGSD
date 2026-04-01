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

# Copy MertGSD payload without creating nested .agent/.agent on reinstall
mkdir -p "$TARGET_DIR/.agent"
rm -rf "$TARGET_DIR/.agent/agents" "$TARGET_DIR/.agent/workflows" "$TARGET_DIR/.agent/templates" "$TARGET_DIR/.agent/references"
cp -r "$SCRIPT_DIR/.agent/agents" "$TARGET_DIR/.agent/agents"
cp -r "$SCRIPT_DIR/.agent/workflows" "$TARGET_DIR/.agent/workflows"
cp -r "$SCRIPT_DIR/.agent/templates" "$TARGET_DIR/.agent/templates"
cp -r "$SCRIPT_DIR/.agent/references" "$TARGET_DIR/.agent/references"

AGENT_COUNT=$(ls "$TARGET_DIR/.agent/agents/"*.md 2>/dev/null | wc -l)
WORKFLOW_COUNT=$(ls "$TARGET_DIR/.agent/workflows/"*.md 2>/dev/null | wc -l)

echo " ✓ Agents:    $AGENT_COUNT"
echo " ✓ Workflows: $WORKFLOW_COUNT"
echo ""
echo " Next steps:"
echo "   cd $TARGET_DIR"
echo "   /mertgsd-new-project    → Start a new project"
echo "   /mertgsd-help           → See all commands"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " MertGSD installed successfully ✓"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
