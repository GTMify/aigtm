#!/bin/bash
# bootstrap-lite.sh — Lightweight Claude Code environment setup
#
# Usage:
#   ./bootstrap-lite.sh              # Default: --check mode (read-only health report)
#   ./bootstrap-lite.sh --check      # Read-only: report what's installed vs missing
#   ./bootstrap-lite.sh --install    # Install everything + configure Claude Code
#   ./bootstrap-lite.sh --fix        # Re-run install to fix anything missing
#
# What this sets up:
#   - Homebrew, mise (Node 24, Python 3.13), jq, gh, git
#   - Claude Code CLI
#   - Developer tools: fzf, bat, ripgrep, fd, tree
#   - Claude Code config: CLAUDE.md, shell aliases, skills from this repo
#   - Organized ~/claude/ workspace
#
# This is a standalone script — no access to other repos required.
# For the full GTMify team setup, see: github.com/GTMify/gtmify-config

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
CLAUDE_DIR="$HOME/.claude"
WORKSPACE="$HOME/claude"

MISE_NODE_VERSION="24"
MISE_PYTHON_VERSION="3.13"

# ── Colors ─────────────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

ok() { echo -e "  ${GREEN}✓${NC} $1"; }
warn() { echo -e "  ${YELLOW}!${NC} $1"; }
fail() { echo -e "  ${RED}✗${NC} $1"; }
info() { echo -e "  ${BLUE}→${NC} $1"; }
header() { echo -e "\n${BOLD}$1${NC}"; }

# ── Argument parsing ───────────────────────────────────────────
MODE="check"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check)   MODE="check"; shift ;;
    --install) MODE="install"; shift ;;
    --fix)     MODE="install"; shift ;;
    --help|-h)
      head -14 "${BASH_SOURCE[0]}" | tail -12
      exit 0
      ;;
    *)
      echo "Unknown option: $1 (try --help)"
      exit 1
      ;;
  esac
done

# ── Detection functions ────────────────────────────────────────
has_cmd() { command -v "$1" &>/dev/null; }

ISSUES=0

check_tool() {
  local name="$1" check_cmd="$2"
  if eval "$check_cmd" 2>/dev/null; then
    ok "$name"
  else
    fail "$name — not installed"
    ISSUES=$((ISSUES + 1))
  fi
}

# ══════════════════════════════════════════════════════════════
#  CHECK MODE
# ══════════════════════════════════════════════════════════════

run_check() {
  header "CLI Tools"
  check_tool "Homebrew"      "has_cmd brew"
  check_tool "mise"          "has_cmd mise"
  check_tool "jq"            "has_cmd jq"
  check_tool "gh"            "has_cmd gh"
  check_tool "git"           "has_cmd git"
  check_tool "Claude Code"   "has_cmd claude"
  check_tool "Node.js (mise)" "mise which node &>/dev/null"
  check_tool "Python (mise)"  "mise which python &>/dev/null"
  check_tool "fzf"           "has_cmd fzf"
  check_tool "bat"           "has_cmd bat"
  check_tool "ripgrep"       "has_cmd rg"
  check_tool "fd"            "has_cmd fd"
  check_tool "tree"          "has_cmd tree"

  header "Claude Code Config"
  if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    ok "~/.claude/CLAUDE.md"
  else
    fail "~/.claude/CLAUDE.md missing"
    ISSUES=$((ISSUES + 1))
  fi

  local skill_count=0
  if [ -d "$CLAUDE_DIR/skills" ]; then
    skill_count=$(find "$CLAUDE_DIR/skills" -maxdepth 1 -mindepth 1 -type d -o -type l 2>/dev/null | wc -l | tr -d ' ')
  fi
  if [ "$skill_count" -gt 0 ]; then
    ok "~/.claude/skills/ ($skill_count skills)"
  else
    fail "~/.claude/skills/ empty or missing"
    ISSUES=$((ISSUES + 1))
  fi

  header "Shell Config"
  if [ -f "$HOME/.zshrc" ]; then
    if grep -q "AIGTM_BOOTSTRAP_START" "$HOME/.zshrc"; then
      ok "~/.zshrc has managed block"
    else
      warn "~/.zshrc exists but no managed block — run --install to add"
      ISSUES=$((ISSUES + 1))
    fi
  else
    fail "~/.zshrc missing"
    ISSUES=$((ISSUES + 1))
  fi

  header "Workspace"
  if [ -d "$WORKSPACE" ]; then
    ok "~/claude/ exists"
  else
    fail "~/claude/ not created"
    ISSUES=$((ISSUES + 1))
  fi

  header "GitHub Auth"
  if gh auth status &>/dev/null 2>&1; then
    local gh_user
    gh_user=$(gh auth status 2>&1 | grep -o 'Logged in to github.com as [^ ]*' | awk '{print $NF}')
    ok "Authenticated as $gh_user"
  else
    fail "Not authenticated — run: gh auth login"
    ISSUES=$((ISSUES + 1))
  fi

  echo
  if [ "$ISSUES" -gt 0 ]; then
    echo -e "${YELLOW}$ISSUES issue(s) found.${NC} Run with --install to resolve."
    exit 1
  else
    echo -e "${GREEN}All checks passed. You're ready to go.${NC}"
    exit 0
  fi
}

# ══════════════════════════════════════════════════════════════
#  INSTALL MODE
# ══════════════════════════════════════════════════════════════

install_tools() {
  header "Installing CLI Tools"

  # Homebrew
  if ! has_cmd brew; then
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"
  else
    ok "Homebrew already installed"
  fi

  # Brew packages
  local pkgs=(mise jq gh fzf bat ripgrep fd tree)
  for pkg in "${pkgs[@]}"; do
    local cmd="$pkg"
    [[ "$pkg" == "ripgrep" ]] && cmd="rg"
    if ! has_cmd "$cmd"; then
      info "Installing $pkg..."
      brew install "$pkg"
    else
      ok "$pkg already installed"
    fi
  done

  # Node.js via mise
  if ! mise which node &>/dev/null 2>&1; then
    info "Installing Node.js $MISE_NODE_VERSION via mise..."
    mise install "node@$MISE_NODE_VERSION"
    mise use --global "node@$MISE_NODE_VERSION"
  else
    ok "Node.js already installed via mise"
  fi

  # Python via mise
  if ! mise which python &>/dev/null 2>&1; then
    info "Installing Python $MISE_PYTHON_VERSION via mise..."
    mise install "python@$MISE_PYTHON_VERSION"
    mise use --global "python@$MISE_PYTHON_VERSION"
  else
    ok "Python already installed via mise"
  fi

  # Claude Code
  if ! has_cmd claude; then
    info "Installing Claude Code..."
    npm install -g @anthropic-ai/claude-code
  else
    ok "Claude Code already installed"
  fi
}

setup_workspace() {
  header "Setting Up Workspace"

  mkdir -p "$WORKSPACE"
  ok "~/claude/ created"

  # If this repo isn't already under ~/claude/, suggest moving it
  if [[ "$REPO_DIR" != "$WORKSPACE"/* ]]; then
    local target="$WORKSPACE/aigtm"
    if [ ! -d "$target" ]; then
      warn "This repo is at $REPO_DIR"
      warn "Consider moving it: mv $REPO_DIR $target"
    fi
  fi
}

deploy_claude_config() {
  header "Deploying Claude Code Config"

  mkdir -p "$CLAUDE_DIR"
  mkdir -p "$CLAUDE_DIR/skills"

  # Deploy CLAUDE.md if none exists (never overwrite a user's existing config)
  if [ ! -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    cat > "$CLAUDE_DIR/CLAUDE.md" << 'CLAUDE_MD'
# Claude Code — Personal Configuration

## How I Work

I use Claude Code as my primary development and operations interface. This file provides persistent context across all sessions.

## Communication Preferences

- **Tone:** Professional, clear, and direct.
- **Style:** Structured prose with tables for comparisons. Bold for key concepts.
- **Format:** GitHub-flavored Markdown with clear headings.

## Development Preferences

- Use modern best practices for the given language.
- In JavaScript/TypeScript, prefer ES modules, named exports, and strict mode.
- Before committing code, run linters and tests.
- When research is required, start broad and narrow down. Save key findings.

## Installed Skills

AI GTM skills are installed from the [aigtm](https://github.com/GTMify/aigtm) repo:

| Skill | What It Does |
|-------|-------------|
| `/meeting-prep` | Research a company + person, produce a briefing before your call |
| `/prospect-research` | Research target accounts, find decision-makers, draft outreach |
| `/deal-strategy` | MEDDIC assessment, stakeholder map, action plan for active deals |
| `/pipeline-health` | Audit pipeline for stuck deals, coverage gaps, risk |
| `/competitive-intel` | Monitor competitors for signals, pricing, product moves |
| `/post-call-summary` | Turn call notes into actions, follow-up email, CRM summary |

Type the skill name to activate it. Run `/help` to see all available commands.

---

*Edit this file to add your own context: your role, your company, your ICP, your tools.*
CLAUDE_MD
    ok "Created ~/.claude/CLAUDE.md (starter template)"
  else
    ok "~/.claude/CLAUDE.md already exists (not overwriting)"
  fi

  # Symlink skills from this repo
  local skills_source="$REPO_DIR/skills"
  if [ -d "$skills_source" ]; then
    local count=0
    for skill_dir in "$skills_source"/*/; do
      [ -d "$skill_dir" ] || continue
      local skill_name
      skill_name=$(basename "$skill_dir")
      local target="$CLAUDE_DIR/skills/$skill_name"

      if [ -L "$target" ]; then
        # Already a symlink — update if pointing to wrong place
        local current_link
        current_link=$(readlink "$target")
        if [ "$current_link" != "$skill_dir" ]; then
          ln -sfn "$skill_dir" "$target"
        fi
      elif [ -d "$target" ]; then
        warn "skills/$skill_name/ exists as directory (not symlink) — skipping"
        continue
      else
        ln -sfn "$skill_dir" "$target"
      fi
      count=$((count + 1))
    done
    ok "Linked $count skills from aigtm repo"
  else
    warn "No skills directory found at $skills_source"
  fi
}

configure_shell() {
  header "Configuring Shell"

  local zshrc="$HOME/.zshrc"
  local block
  block=$(cat << 'SHELL_BLOCK'
# === AIGTM_BOOTSTRAP_START ===
# Managed by aigtm/setup/bootstrap-lite.sh — do not edit this block manually.
# To update: re-run bootstrap-lite.sh --install

# ── Homebrew ──
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# ── mise (version management — replaces nvm/pyenv) ──
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# ── fzf keybindings (Ctrl+R history, Ctrl+T files) ──
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
fi

# ── PATH ──
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# ── npm global bin ──
if command -v npm &>/dev/null; then
  npm_prefix=$(npm config get prefix 2>/dev/null)
  [ -n "$npm_prefix" ] && [ -d "$npm_prefix/bin" ] && export PATH="$npm_prefix/bin:$PATH"
  unset npm_prefix
fi

# ── Workspace aliases ──
alias gs="git status"
alias gl="git log --oneline -20"
alias gd="git diff"

cc() {
  cd ~/claude || return
  claude "$@"
}

# === AIGTM_BOOTSTRAP_END ===
SHELL_BLOCK
)

  if [ ! -f "$zshrc" ]; then
    echo "$block" > "$zshrc"
    ok "Created ~/.zshrc with managed block"
    return
  fi

  if grep -q "AIGTM_BOOTSTRAP_START" "$zshrc"; then
    # Replace existing block
    local tmp
    tmp=$(mktemp)
    awk '
      /AIGTM_BOOTSTRAP_START/ { skip=1; next }
      /AIGTM_BOOTSTRAP_END/   { skip=0; next }
      !skip { print }
    ' "$zshrc" > "$tmp"
    echo "" >> "$tmp"
    echo "$block" >> "$tmp"
    mv "$tmp" "$zshrc"
    ok "Updated managed block in ~/.zshrc"
  elif grep -q "CLAUDE_BOOTSTRAP_START" "$zshrc"; then
    # Full bootstrap already present — don't add a competing block
    ok "Full bootstrap block already in ~/.zshrc (skipping lite block)"
  else
    echo "" >> "$zshrc"
    echo "$block" >> "$zshrc"
    ok "Appended managed block to ~/.zshrc"
  fi
}

run_install() {
  install_tools
  setup_workspace
  deploy_claude_config
  configure_shell

  echo
  echo -e "${GREEN}Setup complete.${NC}"
  echo
  echo "  Next steps:"
  echo "    1. Reload your shell:  source ~/.zshrc"
  echo "    2. Verify:             $(basename "$0") --check"
  echo "    3. Start Claude Code:  cc"
  echo
  echo "  Edit ~/.claude/CLAUDE.md to add your company context,"
  echo "  ICP, competitors, and role — the skills work better"
  echo "  when Claude knows who you are."
}

# ══════════════════════════════════════════════════════════════
#  MAIN
# ══════════════════════════════════════════════════════════════

echo "═══════════════════════════════════════════════════"
echo "  AI GTM Bootstrap — $(date '+%Y-%m-%d')"
echo "═══════════════════════════════════════════════════"

case "$MODE" in
  check)   run_check ;;
  install) run_install ;;
esac
