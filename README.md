# AI GTM Skills for Claude

**43 ready-to-use AI agent skills for go-to-market and revenue operators.** Sales execution, marketing, competitive intel, file utilities, and daily operator workflows — all running locally in Claude Code.

Built by [Scott Wueschinski](https://linkedin.com/in/scottwueschinski) for the [Pavilion](https://www.joinpavilion.com/) AI in GTM School.

---

## See It in Action

Before installing anything, see what these skills produce:

| Example | What was asked | Output |
|---------|---------------|--------|
| [Meeting Prep](examples/meeting-prep-output.md) | "Prep me for my call with Sarah Chen at Meridian Health Systems" | Company snapshot, person brief, pain points, conversation starters, landmines |
| [Deal Strategy](examples/deal-strategy-output.md) | "Deal strategy for NovaBridge Financial — $180K, competing against Clari" | MEDDIC assessment, stakeholder map, competitive positioning, weekly action plan |
| [Pipeline Health](examples/pipeline-health-output.md) | "Audit my pipeline. My quota is $500K this quarter." | Coverage analysis, risk flags, commit vs. upside, prioritized action list |
| [Prospect Research](examples/prospect-research-output.md) | "Research these 3 companies and draft outreach" | Company brief, decision-maker, personalization hook, 3-sentence email |

---

## Quick Start

### macOS (one command)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/GTMify/aigtm/main/setup/bootstrap.sh)"
```

This installs everything — Homebrew, Node.js, Python, Claude Code, public CLIs (vercel/stripe/supabase/wrangler/agent-browser), and all skills. Takes about 5-7 minutes. The script optionally walks you through a Bring-Your-Own-Keys `.env` setup, then Claude launches and runs a 2-minute profile setup.

**Already cloned the repo?**
```bash
./setup/bootstrap.sh
```

### Windows (PowerShell)

```powershell
git clone https://github.com/GTMify/aigtm.git $env:USERPROFILE\claude\aigtm
~\claude\aigtm\setup\bootstrap.ps1
```

Requires winget (built into Windows 11, available via App Installer on Windows 10). After setup, close and reopen your terminal, then run `claude`.

### Claude Desktop / Cowork (no install required)

No terminal needed. Open any skill folder below, copy the prompt from the **`COWORK-PROMPT.md`** file, paste it into Claude, fill in the `[bracketed fields]`, and go.

---

## Bring Your Own Keys (BYOK)

Most skills work fine with **no API keys** — Claude's built-in WebSearch handles research. But some skills become dramatically more powerful when wired to your own keys (Apollo for contact data, Hunter for email verification, Firecrawl for clean scraping, Vercel for one-click deploys, Stripe for proposal payments, etc.).

The bootstrap script offers an interactive `.env` setup. You can also copy the template manually:

```bash
cp setup/env.example ~/.claude/.env
# Edit ~/.claude/.env to fill in only the keys you use
chmod 600 ~/.claude/.env
```

The full annotated key catalog with which-skill-uses-which mapping is in [`setup/env.example`](setup/env.example).

The bootstrap script adds a line to your shell profile that auto-loads `~/.claude/.env` into every new terminal session.

---

## All Skills

### Sales Execution

| Skill | What it does | Optional keys |
|-------|--------------|---------------|
| [Meeting Prep](skills/meeting-prep/) | Research a company + person and produce a pre-call briefing | FIRECRAWL, SERPER |
| [Prospect Research](skills/prospect-research/) | Research target accounts, find decision-makers, draft outreach | APOLLO, HUNTER, FIRECRAWL |
| [Cold Email](skills/cold-email/) | B2B cold emails with 4-touch follow-up sequences | — |
| [Sequence](skills/sequence/) | Multi-channel outreach cadence (email + LinkedIn + phone) | SMARTLEAD, INSTANTLY, LEMLIST, HEYREACH |
| [ABM](skills/abm/) | Account plan with buying committee map and 30-day play | APOLLO, CLEARBIT |
| [Battlecard](skills/battlecard/) | Honest competitive battlecard against a named competitor | FIRECRAWL, SERPER |
| [Referral](skills/referral/) | Warm-intro path finder with forwardable 2-message bundle | — |
| [Post-Call Summary](skills/post-call-summary/) | Raw notes → action items + follow-up + CRM summary | — |
| [Objection Handler](skills/objection-handler/) | Diagnose stuck deals, prescribe plays, write the messages | — |
| [Deal Strategy](skills/deal-strategy/) | MEDDIC, stakeholder map, competitive positioning, action plan | — |
| [Proposal](skills/proposal/) | Customer-facing proposal or SOW with procurement-ready terms | STRIPE |
| [ROI Calculator](skills/roi-calculator/) | Risk-adjusted business case with CFO Q&A | — |
| [One-Pager](skills/one-pager/) | Forwardable champion leave-behind doc | BRANDFETCH |

### Marketing

| Skill | What it does | Optional keys |
|-------|--------------|---------------|
| Launch *(Phase 2)* | Product/feature launch plan + content kit | — |
| Campaign *(Phase 2)* | Multi-channel marketing campaign builder | — |
| Messaging *(Phase 2)* | Positioning, value props, message hierarchy | — |
| PMM *(Phase 2)* | Product-marketing artifact suite | — |
| Programmatic SEO *(Phase 2)* | Template-based pages at scale | DATAFORSEO |
| SEO Audit *(Phase 2)* | Technical + on-page SEO diagnostic | GA4, DATAFORSEO |
| Competitor Alternatives *(Phase 2)* | "[Competitor] alternatives" landing pages | FIRECRAWL |
| Pricing Strategy *(Phase 2)* | Tiers, packaging, willingness-to-pay analysis | — |
| Marketing Psychology *(Phase 2)* | Apply mental models to campaigns and copy | — |
| Kit *(Phase 2)* | Lead magnet content kits | — |

### Cross-Functional

| Skill | What it does | Optional keys |
|-------|--------------|---------------|
| [Brainstorm](skills/brainstorm/) | Structured multi-frame ideation with ranked output | EXA |
| [Repurpose](skills/repurpose/) | Turn one asset into 5-10 derivatives across formats | — |
| [Microsite](skills/microsite/) | Self-contained personalized HTML landing page | VERCEL, CLOUDFLARE, BRANDFETCH |
| [Changelog](skills/changelog/) | User-facing release notes from git history | — |
| [Decision Log](skills/decision-log/) | ADR-style decision capture | — |
| [Roadmap](skills/roadmap/) | Prioritized roadmap with Now/Next/Later tiers | — |

### Pipeline & Forecasting

| Skill | What it does | Optional keys |
|-------|--------------|---------------|
| [Pipeline Health](skills/pipeline-health/) | Audit pipeline for stuck deals and coverage gaps | SALESFORCE, HUBSPOT |
| [Forecast Narrative](skills/forecast-narrative/) | Pipeline data → commit/upside/risk narrative | SALESFORCE, HUBSPOT |
| [Territory Analyzer](skills/territory-analyzer/) | Team-level performance, coverage, whitespace | SALESFORCE, HUBSPOT |

### Competitive & Market Intelligence

| Skill | What it does | Optional keys |
|-------|--------------|---------------|
| [Competitive Intel](skills/competitive-intel/) | Monitor competitors for launches, hiring, press | FIRECRAWL, SERPER |
| [Win/Loss Analyzer](skills/win-loss-analyzer/) | Analyze deal outcomes for patterns | — |

### Customer Success & Retention

| Skill | What it does | Optional keys |
|-------|--------------|---------------|
| [QBR Builder](skills/qbr-builder/) | Customer-facing QBR that leads with value | — |
| [Churn Early Warning](skills/churn-early-warning/) | Flag at-risk accounts, prescribe save plays | SALESFORCE, HUBSPOT |

### Leadership & Strategy

| Skill | What it does | Optional keys |
|-------|--------------|---------------|
| [Board Update](skills/board-update/) | Investor update with revenue, pipeline, narrative | — |
| [Hiring Brief](skills/hiring-brief/) | Role scope + JD + comp + interview scorecard | — |

### Daily Operations

| Skill | What it does | Optional keys |
|-------|--------------|---------------|
| [Weekly Planner](skills/weekly-planner/) | Calendar + pipeline + priorities → weekly game plan | — |
| [Inbox Triage](skills/inbox-triage/) | Categorize, prioritize, draft email responses | — |
| CRM *(Phase 3)* | Daily priorities dashboard from pasted CRM data | — |
| Standup *(Phase 3)* | Morning brief that surfaces priorities and follow-ups | — |
| Inbox Zero *(Phase 3)* | Triage assistant for pasted email subjects/threads | — |
| Focus Time *(Phase 3)* | Time-block planner from pasted calendar | — |

### File Utilities

| Skill | What it does | Libraries |
|-------|--------------|-----------|
| [xlsx](skills/xlsx/) | Read/edit/create Excel and CSV spreadsheets | openpyxl, pandas |
| [docx](skills/docx/) | Read/edit/create Word documents | python-docx, Pillow |
| [pdf](skills/pdf/) | Extract/merge/split/create/OCR PDFs | pypdf, pdfplumber, weasyprint, ocrmypdf |
| [pptx](skills/pptx/) | Read/edit/create PowerPoint decks | python-pptx |

> *Phase 2 (marketing) and Phase 3 (daily operations) skills land in separate PRs and bring the total to 43.*

---

## Customize Your Skills

These skills are starting points. They work out of the box, but they work **dramatically better** when tuned to your company, ICP, and competitive landscape.

See the **[Customization Guide](CUSTOMIZATION.md)** for:
- Adding your company context, value props, and proof points
- Defining your ICP with buying signals and disqualification criteria
- Building a competitor playbook with trap questions and positioning
- Customizing output formats to match your CRM and templates
- Chaining skills into multi-step workflows
- Adding compliance guardrails and suppression lists

---

## How Skills Work

Each skill folder contains:

```
skills/meeting-prep/
├── SKILL.md            # Claude Code skill definition (the "brain")
├── COWORK-PROMPT.md    # Copy-paste version for Claude Desktop
└── README.md           # What this skill does and how to customize it
```

**SKILL.md** is the instruction set that tells Claude *how to think* about a task — what to research, what format to use, what to avoid, and what guardrails to follow. It's written in plain English. You can read it, edit it, and make it your own.

**COWORK-PROMPT.md** is a self-contained prompt you paste directly into Claude Desktop or Cowork. Same logic, packaged as a single prompt with fill-in-the-blank fields.

---

## Troubleshooting

**"command not found: claude" after install**
Close and reopen your terminal, or run `source ~/.zshrc` (Mac) / restart PowerShell (Windows).

**"npm: command not found" during install**
The bootstrap script handles this, but if you see it, run: `export PATH="$HOME/.local/share/mise/shims:$PATH"` then re-run the script.

**Skills not activating in Claude Code**
Check that skills are linked: `ls ~/.claude/skills/`. If empty, re-run `./setup/bootstrap.sh`.

**"Permission denied" on Windows symlinks**
Enable Developer Mode: Settings > Privacy & Security > For developers > Developer Mode. Or run PowerShell as Administrator.

**Env vars not loading in my shell**
The bootstrap adds a block to `~/.zshrc` (or PowerShell profile) that auto-sources `~/.claude/.env`. If you skipped that step, run `./setup/bootstrap.sh` again or add this line manually:
```bash
set -a; . ~/.claude/.env; set +a
```

**Want to verify your setup?**
```bash
./setup/bootstrap.sh --check    # macOS
.\setup\bootstrap.ps1 -Check    # Windows
```

---

## About

Built by [Scott Wueschinski](https://linkedin.com/in/scottwueschinski) for the Pavilion AI in GTM School. Questions? Reach out at scott@gtmify.io.

Skills use Claude's built-in web search and file tools out of the box. Optional API keys (Apollo, Hunter, Firecrawl, Vercel, Stripe, etc.) supercharge specific skills — see [`setup/env.example`](setup/env.example) for the full catalog.

---

*Licensed for personal and commercial use. Fork it, customize it, make it yours.*
