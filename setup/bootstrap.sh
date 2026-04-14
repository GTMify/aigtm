#!/bin/bash
# bootstrap.sh — One-command Claude Code + AI GTM Skills setup
#
# Usage:
#   From a blank Mac (nothing installed):
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/GTMify/aigtm/main/setup/bootstrap.sh)"
#
#   From a local clone:
#     ./setup/bootstrap.sh
#
#   Flags:
#     --check      Read-only health report (no changes)
#     --yes        Skip confirmation prompt
#     --help       Show this help
#
# What this installs:
#   Phase 1: Xcode Command Line Tools + Git
#   Phase 2: Homebrew (macOS package manager)
#   Phase 3: Developer tools (mise, jq, gh, fzf, bat, ripgrep, fd, tree)
#   Phase 4: Node.js 24 + Python 3.13 (via mise)
#   Phase 5: Claude Code CLI
#   Phase 6: AI GTM Skills (16 skills linked to ~/.claude/skills/)
#   Phase 7: GitHub authentication
#   Phase 8: Shell configuration
#
# After setup, run 'claude' to start. On first launch, Claude walks you
# through a 2-minute profile setup — your role, company, ICP, and competitors.

# ── No set -e — we handle errors explicitly ───────────────────

# ── Configuration ─────────────────────────────────────────────
MISE_NODE_VERSION="24"
MISE_PYTHON_VERSION="3.13"
CLAUDE_DIR="$HOME/.claude"
WORKSPACE="$HOME/claude"
TOTAL_PHASES=8
FAILED=0

# ── Colors ─────────────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

ok()     { echo -e "  ${GREEN}✓${NC} $1"; }
warn()   { echo -e "  ${YELLOW}!${NC} $1"; }
fail()   { echo -e "  ${RED}✗${NC} $1"; FAILED=$((FAILED + 1)); }
info()   { echo -e "  ${BLUE}→${NC} $1"; }
phase()  { echo -e "\n${BOLD}[$1/$TOTAL_PHASES]${NC} ${BOLD}$2${NC}"; }

# ── Detect environment ─────────────────────────────────────────
# Are we running from a local clone, or piped from curl?
SCRIPT_SOURCE="${BASH_SOURCE[0]:-}"
if [ -n "$SCRIPT_SOURCE" ] && [ -f "$SCRIPT_SOURCE" ]; then
  SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_SOURCE")" && pwd)"
  REPO_DIR="$(dirname "$SCRIPT_DIR")"
  FROM_CURL=false
else
  # Running from curl — no local files yet
  REPO_DIR=""
  FROM_CURL=true
fi

# ── PATH management ───────────────────────────────────────────
# Build PATH progressively as we install tools. Never rely on
# the user's existing PATH or mise activate (which only works
# in interactive shells).
add_to_path() {
  case ":$PATH:" in
    *":$1:"*) ;;  # already there
    *) export PATH="$1:$PATH" ;;
  esac
}

# Pre-seed with known locations in case they exist
[ -d "/opt/homebrew/bin" ] && add_to_path "/opt/homebrew/bin"
[ -d "$HOME/.local/share/mise/shims" ] && add_to_path "$HOME/.local/share/mise/shims"

# ── Detection helpers ──────────────────────────────────────────
has_cmd() { command -v "$1" &>/dev/null; }

# Run a command with error capture. On failure, print what went
# wrong and a recovery hint.
run_or_fail() {
  local description="$1"
  shift
  if "$@" 2>&1; then
    return 0
  else
    local exit_code=$?
    fail "$description (exit code $exit_code)"
    echo -e "    ${DIM}Command: $*${NC}"
    return $exit_code
  fi
}

# ── Argument parsing ───────────────────────────────────────────
MODE="install"
AUTO_YES=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check)  MODE="check"; shift ;;
    --yes|-y) AUTO_YES=true; shift ;;
    --help|-h)
      head -28 "${BASH_SOURCE[0]}" | tail -26
      exit 0
      ;;
    *)
      echo "Unknown option: $1 (try --help)"
      exit 1
      ;;
  esac
done

# ══════════════════════════════════════════════════════════════
#  CHECK MODE
# ══════════════════════════════════════════════════════════════

run_check() {
  local issues=0

  check() {
    local name="$1" cmd="$2"
    if eval "$cmd" 2>/dev/null; then
      ok "$name"
    else
      fail "$name — not installed"
      issues=$((issues + 1))
    fi
  }

  phase 1 "Xcode CLT + Git"
  check "Xcode CLT"   "xcode-select -p &>/dev/null"
  check "git"          "has_cmd git"

  phase 2 "Homebrew"
  check "Homebrew"     "has_cmd brew"

  phase 3 "Developer tools"
  check "mise"         "has_cmd mise"
  check "jq"           "has_cmd jq"
  check "gh"           "has_cmd gh"
  check "fzf"          "has_cmd fzf"
  check "bat"          "has_cmd bat"
  check "ripgrep"      "has_cmd rg"
  check "fd"           "has_cmd fd"
  check "tree"         "has_cmd tree"

  phase 4 "Runtimes"
  check "Node.js"      "has_cmd node"
  check "Python"       "has_cmd python3"

  phase 5 "Claude Code"
  check "Claude Code"  "has_cmd claude"

  phase 6 "Skills"
  local skill_count=0
  if [ -d "$CLAUDE_DIR/skills" ]; then
    skill_count=$(find "$CLAUDE_DIR/skills" -maxdepth 1 -mindepth 1 \( -type d -o -type l \) 2>/dev/null | wc -l | tr -d ' ')
  fi
  if [ "$skill_count" -ge 16 ]; then
    ok "Skills installed ($skill_count linked)"
  elif [ "$skill_count" -gt 0 ]; then
    warn "Only $skill_count skills linked (expected 16)"
    issues=$((issues + 1))
  else
    fail "No skills installed"
    issues=$((issues + 1))
  fi

  phase 7 "GitHub auth"
  if gh auth status &>/dev/null 2>&1; then
    local gh_user
    gh_user=$(gh auth status 2>&1 | grep -oE 'Logged in to github.com as [^ ]+' | awk '{print $NF}')
    ok "Authenticated as ${gh_user:-unknown}"
  else
    fail "Not authenticated — run: gh auth login"
    issues=$((issues + 1))
  fi

  phase 8 "Shell + profile"
  if [ -f "$HOME/.zshrc" ] && grep -q "AIGTM_BOOTSTRAP_START" "$HOME/.zshrc"; then
    ok "Shell configured"
  else
    warn "Shell not configured — run bootstrap to fix"
    issues=$((issues + 1))
  fi
  if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    ok "Personal profile (~/.claude/CLAUDE.md)"
  else
    warn "Profile not created yet — launch claude to set up"
  fi

  echo
  if [ "$issues" -gt 0 ]; then
    echo -e "${YELLOW}$issues issue(s) found.${NC} Run ${BOLD}bootstrap.sh${NC} to fix."
    exit 1
  else
    echo -e "${GREEN}All checks passed. Run 'claude' to start.${NC}"
    exit 0
  fi
}

if [ "$MODE" = "check" ]; then
  echo "═══════════════════════════════════════════════════"
  echo "  AI GTM Health Check — $(date '+%Y-%m-%d')"
  echo "═══════════════════════════════════════════════════"
  run_check
fi

# ══════════════════════════════════════════════════════════════
#  INSTALL MODE
# ══════════════════════════════════════════════════════════════

echo "═══════════════════════════════════════════════════"
echo "  AI GTM Bootstrap"
echo "═══════════════════════════════════════════════════"
echo
echo "  This script will install everything you need to"
echo "  run AI-powered GTM skills in Claude Code."
echo
echo "  What gets installed:"
echo "    - Developer tools (Homebrew, Node.js, Python)"
echo "    - Claude Code CLI"
echo "    - 16 AI GTM skills for sales, pipeline, and strategy"
echo

if ! $AUTO_YES; then
  echo -en "  ${BOLD}Ready to start?${NC} [Y/n] "
  read -r answer
  if [[ "$answer" =~ ^[Nn] ]]; then
    echo "  Cancelled."
    exit 0
  fi
fi

# ── Phase 1: Xcode CLT + Git ──────────────────────────────────
phase 1 "Xcode Command Line Tools + Git"

if xcode-select -p &>/dev/null; then
  ok "Xcode CLT already installed"
else
  info "Installing Xcode Command Line Tools..."
  info "A dialog box will appear — click 'Install' and wait for it to finish."
  xcode-select --install 2>/dev/null || true

  # Poll until the install completes (up to 10 minutes)
  local_timeout=600
  elapsed=0
  while ! xcode-select -p &>/dev/null; do
    sleep 5
    elapsed=$((elapsed + 5))
    if [ $elapsed -ge $local_timeout ]; then
      fail "Xcode CLT install timed out. Install it manually, then re-run this script."
      exit 1
    fi
  done
  ok "Xcode CLT installed"
fi

if has_cmd git; then
  ok "git available"
else
  fail "git not found after Xcode CLT install"
  echo "    Try: xcode-select --install"
  exit 1
fi

# ── Phase 2: Homebrew ──────────────────────────────────────────
phase 2 "Homebrew"

if has_cmd brew; then
  ok "Homebrew already installed"
else
  info "Installing Homebrew (this may take a few minutes)..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
    fail "Homebrew installation failed"
    echo "    Visit https://brew.sh for manual install instructions"
    exit 1
  }
  ok "Homebrew installed"
fi

# Ensure brew is on PATH for the rest of this script
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  add_to_path "/opt/homebrew/bin"
elif [ -f /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
  add_to_path "/usr/local/bin"
fi

if ! has_cmd brew; then
  fail "brew command not found after install"
  exit 1
fi

# ── Phase 3: Developer tools ──────────────────────────────────
phase 3 "Developer tools"

brew_install() {
  local pkg="$1" cmd="${2:-$1}"
  if has_cmd "$cmd"; then
    ok "$pkg already installed"
  else
    info "Installing $pkg..."
    if brew install "$pkg" &>/dev/null; then
      ok "$pkg installed"
    else
      fail "$pkg installation failed"
      echo "    Try: brew install $pkg"
    fi
  fi
}

brew_install mise
brew_install jq
brew_install gh
brew_install fzf
brew_install bat
brew_install ripgrep rg
brew_install fd
brew_install tree

# ── Phase 4: Runtimes (Node + Python via mise) ─────────────────
phase 4 "Node.js $MISE_NODE_VERSION + Python $MISE_PYTHON_VERSION"

if ! has_cmd mise; then
  fail "mise not available — cannot install runtimes"
  echo "    Try: brew install mise"
else
  # Install Node
  if mise which node &>/dev/null 2>&1; then
    ok "Node.js already installed via mise"
  else
    info "Installing Node.js $MISE_NODE_VERSION (this may take a minute)..."
    if mise install "node@$MISE_NODE_VERSION" &>/dev/null && mise use --global "node@$MISE_NODE_VERSION" &>/dev/null; then
      ok "Node.js $MISE_NODE_VERSION installed"
    else
      fail "Node.js installation failed"
      echo "    Try: mise install node@$MISE_NODE_VERSION && mise use --global node@$MISE_NODE_VERSION"
    fi
  fi

  # Install Python
  if mise which python &>/dev/null 2>&1; then
    ok "Python already installed via mise"
  else
    info "Installing Python $MISE_PYTHON_VERSION (this may take a minute)..."
    if mise install "python@$MISE_PYTHON_VERSION" &>/dev/null && mise use --global "python@$MISE_PYTHON_VERSION" &>/dev/null; then
      ok "Python $MISE_PYTHON_VERSION installed"
    else
      fail "Python installation failed"
      echo "    Try: mise install python@$MISE_PYTHON_VERSION && mise use --global python@$MISE_PYTHON_VERSION"
    fi
  fi

  # Add mise shims to PATH so node/npm/python are available NOW
  add_to_path "$HOME/.local/share/mise/shims"

  # Verify
  if has_cmd node; then
    ok "node $(node --version) on PATH"
  else
    fail "node not found on PATH after install"
    echo "    The mise shims directory may not exist yet."
    echo "    Try: export PATH=\"\$HOME/.local/share/mise/shims:\$PATH\" && node --version"
  fi
fi

# ── Phase 5: Claude Code ──────────────────────────────────────
phase 5 "Claude Code"

if has_cmd claude; then
  ok "Claude Code already installed"
else
  if ! has_cmd npm; then
    fail "npm not found — cannot install Claude Code"
    echo "    Ensure Node.js installed successfully in Phase 4"
  else
    info "Installing Claude Code..."
    if npm install -g @anthropic-ai/claude-code 2>&1 | tail -3; then
      # Verify it actually worked
      # npm global bin might not be on PATH yet
      local npm_prefix
      npm_prefix=$(npm config get prefix 2>/dev/null)
      [ -n "$npm_prefix" ] && [ -d "$npm_prefix/bin" ] && add_to_path "$npm_prefix/bin"

      if has_cmd claude; then
        ok "Claude Code installed"
      else
        fail "Claude Code installed but 'claude' command not found on PATH"
        echo "    Try: export PATH=\"$(npm config get prefix)/bin:\$PATH\""
      fi
    else
      fail "Claude Code installation failed"
      echo "    Try: npm install -g @anthropic-ai/claude-code"
    fi
  fi
fi

# ── Phase 6: Repo + Skills ────────────────────────────────────
phase 6 "AI GTM Skills"

# If we came from curl, clone the repo first
if $FROM_CURL; then
  REPO_DIR="$WORKSPACE/aigtm"
  if [ -d "$REPO_DIR/.git" ]; then
    ok "Repo already cloned at $REPO_DIR"
  else
    if has_cmd gh; then
      info "Cloning AI GTM repo..."
      mkdir -p "$WORKSPACE"
      if gh repo clone GTMify/aigtm "$REPO_DIR" -- --quiet 2>/dev/null; then
        ok "Cloned to $REPO_DIR"
      else
        # Fallback to git clone (repo may be public)
        if git clone https://github.com/GTMify/aigtm.git "$REPO_DIR" --quiet 2>/dev/null; then
          ok "Cloned to $REPO_DIR"
        else
          fail "Could not clone repo"
          echo "    Try: git clone https://github.com/GTMify/aigtm.git $REPO_DIR"
        fi
      fi
    elif has_cmd git; then
      info "Cloning AI GTM repo..."
      mkdir -p "$WORKSPACE"
      if git clone https://github.com/GTMify/aigtm.git "$REPO_DIR" --quiet 2>/dev/null; then
        ok "Cloned to $REPO_DIR"
      else
        fail "Could not clone repo — you may need GitHub access"
        echo "    Try: gh auth login, then re-run this script"
      fi
    else
      fail "Neither gh nor git available — cannot clone repo"
    fi
  fi
fi

# Link skills
mkdir -p "$CLAUDE_DIR/skills"
local_skills_dir="$REPO_DIR/skills"

if [ -d "$local_skills_dir" ]; then
  skill_count=0
  for skill_dir in "$local_skills_dir"/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name=$(basename "$skill_dir")
    target="$CLAUDE_DIR/skills/$skill_name"

    # Create or update symlink
    if [ -L "$target" ]; then
      ln -sfn "$skill_dir" "$target"
    elif [ -d "$target" ]; then
      # Directory exists (not a symlink) — skip to avoid overwriting
      continue
    else
      ln -sfn "$skill_dir" "$target"
    fi
    skill_count=$((skill_count + 1))
  done

  if [ "$skill_count" -ge 16 ]; then
    ok "Linked $skill_count skills to ~/.claude/skills/"
  elif [ "$skill_count" -gt 0 ]; then
    warn "Linked $skill_count skills (expected 16)"
  else
    fail "No skills found in $local_skills_dir"
  fi
else
  fail "Skills directory not found at $local_skills_dir"
  if $FROM_CURL; then
    echo "    The repo clone may have failed in an earlier step."
  fi
fi

# ── Phase 7: GitHub auth ──────────────────────────────────────
phase 7 "GitHub authentication"

if gh auth status &>/dev/null 2>&1; then
  local_gh_user=$(gh auth status 2>&1 | grep -oE 'Logged in to github.com as [^ ]+' | awk '{print $NF}')
  ok "Authenticated as ${local_gh_user:-unknown}"
else
  if has_cmd gh; then
    info "Let's connect your GitHub account."
    info "A browser window will open — log in and authorize the CLI."
    echo
    if gh auth login --web --git-protocol https 2>&1; then
      ok "GitHub authenticated"
    else
      warn "GitHub auth skipped — you can do this later with: gh auth login"
    fi
  else
    warn "gh CLI not installed — skipping GitHub auth"
  fi
fi

# ── Phase 8: Shell configuration ──────────────────────────────
phase 8 "Shell configuration"

zshrc="$HOME/.zshrc"
managed_block=$(cat << 'SHELL_BLOCK'
# === AIGTM_BOOTSTRAP_START ===
# Managed by aigtm/setup/bootstrap.sh — do not edit this block manually.
# To update: re-run bootstrap.sh

# ── Homebrew ──
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ── mise runtimes (Node, Python) ──
export PATH="$HOME/.local/share/mise/shims:$PATH"
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# ── fzf keybindings (Ctrl+R history, Ctrl+T files) ──
if command -v fzf &>/dev/null; then
  source <(fzf --zsh) 2>/dev/null
fi

# ── npm global bin ──
if command -v npm &>/dev/null; then
  _npm_prefix=$(npm config get prefix 2>/dev/null)
  [ -n "$_npm_prefix" ] && [ -d "$_npm_prefix/bin" ] && export PATH="$_npm_prefix/bin:$PATH"
  unset _npm_prefix
fi

# ── PATH extras ──
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# ── Aliases ──
alias gs="git status"
alias gl="git log --oneline -20"
alias gd="git diff"

# === AIGTM_BOOTSTRAP_END ===
SHELL_BLOCK
)

if [ ! -f "$zshrc" ]; then
  echo "$managed_block" > "$zshrc"
  ok "Created ~/.zshrc"
elif grep -q "AIGTM_BOOTSTRAP_START" "$zshrc"; then
  # Replace existing managed block
  tmp=$(mktemp)
  awk '
    /AIGTM_BOOTSTRAP_START/ { skip=1; next }
    /AIGTM_BOOTSTRAP_END/   { skip=0; next }
    !skip { print }
  ' "$zshrc" > "$tmp"
  echo "" >> "$tmp"
  echo "$managed_block" >> "$tmp"
  mv "$tmp" "$zshrc"
  ok "Updated ~/.zshrc"
elif grep -q "CLAUDE_BOOTSTRAP_START" "$zshrc"; then
  ok "Full bootstrap already in ~/.zshrc (keeping existing)"
else
  echo "" >> "$zshrc"
  echo "$managed_block" >> "$zshrc"
  ok "Updated ~/.zshrc"
fi

# ══════════════════════════════════════════════════════════════
#  SUMMARY
# ══════════════════════════════════════════════════════════════

echo
echo "═══════════════════════════════════════════════════"
if [ "$FAILED" -eq 0 ]; then
  echo -e "  ${GREEN}Setup complete.${NC} All $TOTAL_PHASES phases passed."
else
  echo -e "  ${YELLOW}Setup finished with $FAILED issue(s).${NC}"
  echo -e "  Run ${BOLD}bootstrap.sh --check${NC} to see what needs fixing."
fi
echo "═══════════════════════════════════════════════════"
echo
echo -e "  ${BOLD}Next:${NC} Claude Code will launch and walk you"
echo "  through a quick profile setup (2 minutes)."
echo
echo "  Your AI GTM skills are ready to use — just ask:"
echo -e "    ${DIM}\"Prep me for my call with Acme Corp\"${NC}"
echo -e "    ${DIM}\"Audit my pipeline\"${NC}"
echo -e "    ${DIM}\"Draft outreach for these 5 accounts\"${NC}"
echo

# If repo exists, launch claude from it so CLAUDE.md onboarding triggers
if [ -n "$REPO_DIR" ] && [ -d "$REPO_DIR" ]; then
  echo -e "  Launching Claude Code..."
  echo
  cd "$REPO_DIR"
  exec zsh -l -c "cd '$REPO_DIR' && claude"
else
  echo -e "  Reloading your shell..."
  exec zsh -l
fi
