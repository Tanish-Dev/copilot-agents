#!/bin/bash
# ──────────────────────────────────────────────────────────────
# install-global.sh
# Installs all agents from this repo as VS Code User Profile agents
# so they are available globally across every project you open.
# ──────────────────────────────────────────────────────────────

AGENTS_DIR="$(dirname "$0")/agents"
VSCODE_AGENTS_DIR="$HOME/Library/Application Support/Code/User/globalStorage/github.copilot-chat"

# Verify VS Code Copilot directory exists
if [ ! -d "$VSCODE_AGENTS_DIR" ]; then
  echo "❌ VS Code Copilot directory not found at:"
  echo "   $VSCODE_AGENTS_DIR"
  echo ""
  echo "Make sure GitHub Copilot Chat extension is installed in VS Code."
  exit 1
fi

echo "🚀 Installing agents to VS Code User Profile..."
echo ""

# Fallback for macOS Bash 3.2 which lacks associative arrays
AGENTS=(
  "ai-engineer.agent.md:ai-engineer-agent"
  "fullstack-dev.agent.md:fullstack-dev-agent"
  "ml-researcher.agent.md:ml-researcher-agent"
  "code-reviewer.agent.md:code-reviewer-agent"
  "system-designer.agent.md:system-designer-agent"
  "doc-writer.agent.md:doc-writer-agent"
  "security-auditor.agent.md:security-auditor-agent"
  "open-source-contributor.agent.md:open-source-contributor-agent"
  "ui-designer.agent.md:ui-designer-agent"
)

SUCCESS=0
FAILED=0

for item in "${AGENTS[@]}"; do
  FILENAME="${item%%:*}"
  FOLDER="${item##*:}"
  
  SRC="$AGENTS_DIR/$FILENAME"
  DEST_DIR="$VSCODE_AGENTS_DIR/$FOLDER"
  DEST="$DEST_DIR/$FILENAME"

  if [ ! -f "$SRC" ]; then
    echo "  ⚠️  Skipped (not found): $FILENAME"
    ((FAILED++))
    continue
  fi

  mkdir -p "$DEST_DIR"
  cp "$SRC" "$DEST"

  if [ $? -eq 0 ]; then
    echo "  ✅ Installed: $FILENAME"
    ((SUCCESS++))
  else
    echo "  ❌ Failed:    $FILENAME"
    ((FAILED++))
  fi
done

echo ""
echo "────────────────────────────────"
echo "  ✅ Installed: $SUCCESS agents"
if [ $FAILED -gt 0 ]; then
  echo "  ❌ Failed:    $FAILED agents"
fi
echo "────────────────────────────────"
echo ""
echo "👉 Restart VS Code (or reload window with Cmd+Shift+P → 'Reload Window')"
echo "👉 Open Copilot Chat → click the agent picker → your agents appear there"
echo ""
