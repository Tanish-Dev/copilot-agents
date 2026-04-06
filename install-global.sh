#!/bin/bash
# Installs custom Copilot agent files either:
# 1) Into a project at .github/agents (recommended), or
# 2) Into VS Code User Profile storage (global).

set -u

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOCAL_AGENTS_DIR="$SCRIPT_DIR/agents"
RAW_BASE_URL="https://raw.githubusercontent.com/Tanish-Dev/copilot-agents/main/agents"
VSCODE_AGENTS_DIR="$HOME/Library/Application Support/Code/User/globalStorage/github.copilot-chat"

MODE="project"
PROJECT_PATH="."

print_help() {
  cat <<EOF
Usage:
  ./install-global.sh [--project <path>] [--global] [--help]

Options:
  --project <path>  Install all agents into <path>/.github/agents (default: current directory)
  --global          Install agents into VS Code user profile (global)
  --help            Show this help

Examples:
  ./install-global.sh --project .
  ./install-global.sh --project ../my-repo
  ./install-global.sh --global
EOF
}

while [ $# -gt 0 ]; do
  case "$1" in
    --project)
      MODE="project"
      if [ $# -lt 2 ]; then
        echo "Error: --project requires a path argument."
        exit 1
      fi
      PROJECT_PATH="$2"
      shift 2
      ;;
    --global)
      MODE="global"
      shift
      ;;
    --help|-h)
      print_help
      exit 0
      ;;
    *)
      echo "Error: unknown option '$1'"
      print_help
      exit 1
      ;;
  esac
done

# "filename:global-folder-name"
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

copy_agent_content() {
  local filename="$1"
  local dest="$2"
  local local_src="$LOCAL_AGENTS_DIR/$filename"

  if [ -f "$local_src" ]; then
    cp "$local_src" "$dest"
    return $?
  fi

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$RAW_BASE_URL/$filename" -o "$dest"
    return $?
  fi

  echo "  Failed: local agent source missing and curl is not available for download."
  return 1
}

if [ "$MODE" = "project" ]; then
  DEST_ROOT="$PROJECT_PATH/.github/agents"
  mkdir -p "$DEST_ROOT"

  echo "Installing agents into project folder: $DEST_ROOT"
  echo ""

  for item in "${AGENTS[@]}"; do
    FILENAME="${item%%:*}"
    DEST="$DEST_ROOT/$FILENAME"

    if copy_agent_content "$FILENAME" "$DEST"; then
      echo "  Installed: $FILENAME"
      SUCCESS=$((SUCCESS + 1))
    else
      echo "  Failed:    $FILENAME"
      FAILED=$((FAILED + 1))
    fi
  done

  echo ""
  echo "--------------------------------"
  echo "  Installed: $SUCCESS agents"
  if [ $FAILED -gt 0 ]; then
    echo "  Failed:    $FAILED agents"
  fi
  echo "--------------------------------"
  echo ""
  echo "Next steps:"
  echo "1) Commit and push .github/agents/*.agent.md"
  echo "2) Open GitHub Copilot Chat and pick your agent"
  echo ""
  exit 0
fi

# Global mode
if [ ! -d "$VSCODE_AGENTS_DIR" ]; then
  echo "VS Code Copilot directory not found at:"
  echo "  $VSCODE_AGENTS_DIR"
  echo ""
  echo "Install the GitHub Copilot Chat extension first, then retry."
  exit 1
fi

echo "Installing agents to VS Code User Profile storage..."
echo ""

for item in "${AGENTS[@]}"; do
  FILENAME="${item%%:*}"
  FOLDER="${item##*:}"
  DEST_DIR="$VSCODE_AGENTS_DIR/$FOLDER"
  DEST="$DEST_DIR/$FILENAME"

  mkdir -p "$DEST_DIR"

  if copy_agent_content "$FILENAME" "$DEST"; then
    echo "  Installed: $FILENAME"
    SUCCESS=$((SUCCESS + 1))
  else
    echo "  Failed:    $FILENAME"
    FAILED=$((FAILED + 1))
  fi
done

echo ""
echo "--------------------------------"
echo "  Installed: $SUCCESS agents"
if [ $FAILED -gt 0 ]; then
  echo "  Failed:    $FAILED agents"
fi
echo "--------------------------------"
echo ""
echo "Restart VS Code (or run: Cmd+Shift+P -> Reload Window)"
echo "Then open Copilot Chat and select an installed agent."
echo ""
