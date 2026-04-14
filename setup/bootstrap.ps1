# bootstrap.ps1 — One-command Claude Code + AI GTM Skills setup (Windows)
#
# Usage:
#   From PowerShell:
#     .\setup\bootstrap.ps1
#
#   Flags:
#     -Check       Read-only health report (no changes)
#     -Yes         Skip confirmation prompt
#     -Help        Show this help
#
# What this installs:
#   Phase 1: Git
#   Phase 2: winget (package manager)
#   Phase 3: Developer tools (fnm, jq, gh, fzf, bat, ripgrep, fd, tree)
#   Phase 4: Node.js 24 + Python 3.13
#   Phase 5: Claude Code CLI
#   Phase 6: AI GTM Skills (16 skills linked to ~/.claude/skills/)
#   Phase 7: GitHub authentication
#   Phase 8: PowerShell profile configuration
#
# After setup, run 'claude' to start. On first launch, Claude walks you
# through a 2-minute profile setup — your role, company, ICP, and competitors.

param(
    [switch]$Check,
    [switch]$Yes,
    [switch]$Help
)

# ── Configuration ─────────────────────────────────────────────
$FNM_NODE_VERSION = "24"
$PYTHON_VERSION = "3.13"
$CLAUDE_DIR = "$env:USERPROFILE\.claude"
$WORKSPACE = "$env:USERPROFILE\claude"
$TOTAL_PHASES = 8
$script:Failed = 0

# ── Helpers ────────────────────────────────────────────────────
function Write-Ok     { param($msg) Write-Host "  " -NoNewline; Write-Host "+" -ForegroundColor Green -NoNewline; Write-Host " $msg" }
function Write-Warn   { param($msg) Write-Host "  " -NoNewline; Write-Host "!" -ForegroundColor Yellow -NoNewline; Write-Host " $msg" }
function Write-Fail   { param($msg) Write-Host "  " -NoNewline; Write-Host "x" -ForegroundColor Red -NoNewline; Write-Host " $msg"; $script:Failed++ }
function Write-Info   { param($msg) Write-Host "  " -NoNewline; Write-Host ">" -ForegroundColor Blue -NoNewline; Write-Host " $msg" }
function Write-Phase  { param($num, $msg) Write-Host "`n[$num/$TOTAL_PHASES] $msg" -ForegroundColor White }

function Test-Command { param($cmd) return [bool](Get-Command $cmd -ErrorAction SilentlyContinue) }

function Add-ToPath {
    param($dir)
    if ($env:PATH -notlike "*$dir*") {
        $env:PATH = "$dir;$env:PATH"
    }
}

# ── Detect script location ────────────────────────────────────
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoDir = Split-Path -Parent $ScriptDir

# ── Help ───────────────────────────────────────────────────────
if ($Help) {
    Get-Content $MyInvocation.MyCommand.Path | Select-Object -Skip 1 -First 20
    exit 0
}

# ══════════════════════════════════════════════════════════════
#  CHECK MODE
# ══════════════════════════════════════════════════════════════

if ($Check) {
    Write-Host "==================================================="
    Write-Host "  AI GTM Health Check - $(Get-Date -Format 'yyyy-MM-dd')"
    Write-Host "==================================================="

    $issues = 0
    function Check-Tool { param($name, $cmd)
        if (Test-Command $cmd) { Write-Ok $name } else { Write-Fail "$name - not installed"; $script:issues++ }
    }

    Write-Phase 1 "Git"
    Check-Tool "git" "git"

    Write-Phase 2 "Package manager"
    Check-Tool "winget" "winget"

    Write-Phase 3 "Developer tools"
    Check-Tool "fnm" "fnm"
    Check-Tool "jq" "jq"
    Check-Tool "gh" "gh"

    Write-Phase 4 "Runtimes"
    Check-Tool "Node.js" "node"
    Check-Tool "Python" "python"

    Write-Phase 5 "Claude Code"
    Check-Tool "Claude Code" "claude"

    Write-Phase 6 "Skills"
    $skillCount = 0
    if (Test-Path "$CLAUDE_DIR\skills") {
        $skillCount = (Get-ChildItem "$CLAUDE_DIR\skills" -Directory -ErrorAction SilentlyContinue).Count
    }
    if ($skillCount -ge 16) { Write-Ok "Skills installed ($skillCount linked)" }
    elseif ($skillCount -gt 0) { Write-Warn "Only $skillCount skills linked (expected 16)"; $issues++ }
    else { Write-Fail "No skills installed"; $issues++ }

    Write-Phase 7 "GitHub auth"
    $ghAuth = gh auth status 2>&1
    if ($LASTEXITCODE -eq 0) { Write-Ok "GitHub authenticated" } else { Write-Fail "Not authenticated"; $issues++ }

    Write-Phase 8 "Shell + profile"
    if ((Test-Path $PROFILE) -and (Select-String -Path $PROFILE -Pattern "AIGTM_BOOTSTRAP_START" -Quiet)) {
        Write-Ok "PowerShell profile configured"
    } else { Write-Warn "Profile not configured"; $issues++ }
    if (Test-Path "$CLAUDE_DIR\CLAUDE.md") { Write-Ok "Personal profile" } else { Write-Warn "Profile not created - launch claude to set up" }

    Write-Host ""
    if ($issues -gt 0) {
        Write-Host "$issues issue(s) found. Run bootstrap.ps1 to fix." -ForegroundColor Yellow
        exit 1
    } else {
        Write-Host "All checks passed. Run 'claude' to start." -ForegroundColor Green
        exit 0
    }
}

# ══════════════════════════════════════════════════════════════
#  INSTALL MODE
# ══════════════════════════════════════════════════════════════

Write-Host "==================================================="
Write-Host "  AI GTM Bootstrap (Windows)"
Write-Host "==================================================="
Write-Host ""
Write-Host "  This script will install everything you need to"
Write-Host "  run AI-powered GTM skills in Claude Code."
Write-Host ""
Write-Host "  What gets installed:"
Write-Host "    - Developer tools (Git, Node.js, Python)"
Write-Host "    - Claude Code CLI"
Write-Host "    - 16 AI GTM skills for sales, pipeline, and strategy"
Write-Host ""

if (-not $Yes) {
    $answer = Read-Host "  Ready to start? [Y/n]"
    if ($answer -match '^[Nn]') { Write-Host "  Cancelled."; exit 0 }
}

# ── Phase 1: Git ──────────────────────────────────────────────
Write-Phase 1 "Git"

if (Test-Command git) {
    Write-Ok "Git already installed"
} else {
    Write-Info "Installing Git..."
    winget install Git.Git --accept-package-agreements --accept-source-agreements 2>$null
    # Refresh PATH
    $env:PATH = [Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [Environment]::GetEnvironmentVariable("PATH", "User")
    if (Test-Command git) { Write-Ok "Git installed" } else { Write-Fail "Git installation failed - install manually from git-scm.com" }
}

# ── Phase 2: winget ───────────────────────────────────────────
Write-Phase 2 "Package manager"

if (Test-Command winget) {
    Write-Ok "winget available"
} else {
    Write-Fail "winget not found"
    Write-Host "    Install 'App Installer' from the Microsoft Store, then re-run this script." -ForegroundColor DarkGray
    exit 1
}

# ── Phase 3: Developer tools ──────────────────────────────────
Write-Phase 3 "Developer tools"

function Install-Winget {
    param($name, $id, $cmd)
    if (-not $cmd) { $cmd = $name.ToLower() }
    if (Test-Command $cmd) {
        Write-Ok "$name already installed"
    } else {
        Write-Info "Installing $name..."
        winget install $id --accept-package-agreements --accept-source-agreements 2>$null | Out-Null
        # Refresh PATH after install
        $env:PATH = [Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [Environment]::GetEnvironmentVariable("PATH", "User")
        if (Test-Command $cmd) { Write-Ok "$name installed" } else { Write-Fail "$name installation failed" }
    }
}

Install-Winget "fnm" "Schniz.fnm" "fnm"
Install-Winget "jq" "jqlang.jq" "jq"
Install-Winget "gh" "GitHub.cli" "gh"

# ── Phase 4: Runtimes ─────────────────────────────────────────
Write-Phase 4 "Node.js $FNM_NODE_VERSION + Python $PYTHON_VERSION"

# Node.js via fnm
if (Test-Command node) {
    Write-Ok "Node.js already installed"
} else {
    if (Test-Command fnm) {
        Write-Info "Installing Node.js $FNM_NODE_VERSION via fnm..."
        fnm install $FNM_NODE_VERSION 2>$null
        fnm default $FNM_NODE_VERSION 2>$null
        fnm env --use-on-cd | Out-String | Invoke-Expression
        if (Test-Command node) { Write-Ok "Node.js installed" } else { Write-Fail "Node.js installation failed" }
    } else {
        Write-Fail "fnm not available - cannot install Node.js"
    }
}

# Python via winget
if (Test-Command python) {
    Write-Ok "Python already installed"
} else {
    Write-Info "Installing Python $PYTHON_VERSION..."
    winget install Python.Python.$PYTHON_VERSION --accept-package-agreements --accept-source-agreements 2>$null | Out-Null
    $env:PATH = [Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [Environment]::GetEnvironmentVariable("PATH", "User")
    if (Test-Command python) { Write-Ok "Python installed" } else { Write-Fail "Python installation failed" }
}

# ── Phase 5: Claude Code ──────────────────────────────────────
Write-Phase 5 "Claude Code"

if (Test-Command claude) {
    Write-Ok "Claude Code already installed"
} else {
    if (Test-Command npm) {
        Write-Info "Installing Claude Code..."
        npm install -g @anthropic-ai/claude-code 2>$null
        # Add npm global bin to PATH
        $npmPrefix = npm config get prefix 2>$null
        if ($npmPrefix -and (Test-Path "$npmPrefix")) { Add-ToPath "$npmPrefix" }
        if (Test-Command claude) { Write-Ok "Claude Code installed" } else { Write-Fail "Claude Code installation failed - try: npm install -g @anthropic-ai/claude-code" }
    } else {
        Write-Fail "npm not found - cannot install Claude Code"
    }
}

# ── Phase 6: Skills ───────────────────────────────────────────
Write-Phase 6 "AI GTM Skills"

# Check for Developer Mode (required for symlinks without admin)
$devMode = $false
try {
    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
    $devMode = (Get-ItemProperty -Path $regPath -Name AllowDevelopmentWithoutDevLicense -ErrorAction SilentlyContinue).AllowDevelopmentWithoutDevLicense -eq 1
} catch {}

$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $devMode -and -not $isAdmin) {
    Write-Warn "Developer Mode is not enabled. Symlinks may fail."
    Write-Host "    Enable it: Settings > Privacy & Security > For developers > Developer Mode" -ForegroundColor DarkGray
    Write-Host "    Or re-run this script as Administrator." -ForegroundColor DarkGray
}

New-Item -Path "$CLAUDE_DIR\skills" -ItemType Directory -Force -ErrorAction SilentlyContinue | Out-Null

$skillsSource = Join-Path $RepoDir "skills"
if (Test-Path $skillsSource) {
    $skillCount = 0
    foreach ($skillDir in (Get-ChildItem $skillsSource -Directory)) {
        $target = Join-Path "$CLAUDE_DIR\skills" $skillDir.Name
        # Remove existing symlink or junction
        if (Test-Path $target) { Remove-Item $target -Force -Recurse -ErrorAction SilentlyContinue }
        try {
            New-Item -Path $target -ItemType SymbolicLink -Value $skillDir.FullName -Force -ErrorAction Stop | Out-Null
            $skillCount++
        } catch {
            # Fallback: copy instead of symlink
            Copy-Item $skillDir.FullName $target -Recurse -Force
            $skillCount++
        }
    }
    if ($skillCount -ge 16) { Write-Ok "Linked $skillCount skills to ~/.claude/skills/" }
    elseif ($skillCount -gt 0) { Write-Warn "Linked $skillCount skills (expected 16)" }
    else { Write-Fail "No skills found" }
} else {
    Write-Fail "Skills directory not found at $skillsSource"
}

# ── Phase 7: GitHub auth ──────────────────────────────────────
Write-Phase 7 "GitHub authentication"

$ghAuth = gh auth status 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Ok "GitHub authenticated"
} else {
    if (Test-Command gh) {
        Write-Info "Let's connect your GitHub account."
        Write-Info "A browser window will open - log in and authorize the CLI."
        Write-Host ""
        gh auth login --web --git-protocol https
        if ($LASTEXITCODE -eq 0) { Write-Ok "GitHub authenticated" }
        else { Write-Warn "GitHub auth skipped - you can do this later with: gh auth login" }
    } else {
        Write-Warn "gh CLI not installed - skipping GitHub auth"
    }
}

# ── Phase 8: PowerShell profile ───────────────────────────────
Write-Phase 8 "Shell configuration"

$profileBlock = @'
# === AIGTM_BOOTSTRAP_START ===
# Managed by aigtm/setup/bootstrap.ps1 — do not edit this block manually.

# ── fnm (Node.js version manager) ──
if (Get-Command fnm -ErrorAction SilentlyContinue) {
    fnm env --use-on-cd | Out-String | Invoke-Expression
}

# ── npm global bin ──
if (Get-Command npm -ErrorAction SilentlyContinue) {
    $npmPrefix = npm config get prefix 2>$null
    if ($npmPrefix -and (Test-Path "$npmPrefix") -and $env:PATH -notlike "*$npmPrefix*") {
        $env:PATH = "$npmPrefix;$env:PATH"
    }
}

# ── Aliases ──
Set-Alias -Name gs -Value "git status" -Option AllScope -ErrorAction SilentlyContinue
function gl { git log --oneline -20 }
function gd { git diff }

# === AIGTM_BOOTSTRAP_END ===
'@

$profileDir = Split-Path -Parent $PROFILE
if (-not (Test-Path $profileDir)) { New-Item -Path $profileDir -ItemType Directory -Force | Out-Null }

if (-not (Test-Path $PROFILE)) {
    Set-Content -Path $PROFILE -Value $profileBlock
    Write-Ok "Created PowerShell profile"
} elseif (Select-String -Path $PROFILE -Pattern "AIGTM_BOOTSTRAP_START" -Quiet) {
    $content = Get-Content $PROFILE -Raw
    $content = $content -replace '(?s)# === AIGTM_BOOTSTRAP_START ===.*?# === AIGTM_BOOTSTRAP_END ===', $profileBlock
    Set-Content -Path $PROFILE -Value $content
    Write-Ok "Updated PowerShell profile"
} else {
    Add-Content -Path $PROFILE -Value "`n$profileBlock"
    Write-Ok "Updated PowerShell profile"
}

# ══════════════════════════════════════════════════════════════
#  SUMMARY
# ══════════════════════════════════════════════════════════════

Write-Host ""
Write-Host "==================================================="
if ($script:Failed -eq 0) {
    Write-Host "  Setup complete. All $TOTAL_PHASES phases passed." -ForegroundColor Green
} else {
    Write-Host "  Setup finished with $($script:Failed) issue(s)." -ForegroundColor Yellow
    Write-Host "  Run bootstrap.ps1 -Check to see what needs fixing."
}
Write-Host "==================================================="
Write-Host ""
Write-Host "  Next steps:"
Write-Host "    1. Close and reopen this terminal"
Write-Host "    2. Run: cd $RepoDir"
Write-Host "    3. Run: claude"
Write-Host ""
Write-Host "  Claude will walk you through a quick profile setup."
Write-Host "  Your AI GTM skills are ready to use - just ask:"
Write-Host "    'Prep me for my call with Acme Corp'" -ForegroundColor DarkGray
Write-Host "    'Audit my pipeline'" -ForegroundColor DarkGray
Write-Host "    'Draft outreach for these 5 accounts'" -ForegroundColor DarkGray
Write-Host ""
