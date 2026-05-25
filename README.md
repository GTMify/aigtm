# AI GTM Skills for Claude

**61 ready-to-use AI agent skills for go-to-market operators, marketers, and small-business owners.** Sales execution, marketing, competitive intel, daily operator workflows, file utilities, and a full SMB owner-operator toolkit — all running locally in Claude Code.

Built by [Scott Wueschinski](https://linkedin.com/in/scottwueschinski) for the [Pavilion](https://www.joinpavilion.com/) AI in GTM School.

---

## For the AI in GTM School cohort

If you're here from Pavilion's **Operations: Power Prompting for Revenue Teams** session (Q2 2026), this is your toolkit. Three things to know before you install:

1. **Install once, customize forever.** The bootstrap script gets you fully set up in ~5 minutes. It then runs a 2-minute onboarding flow that captures your role, company, ICP, and competitors — that profile travels into every skill so the outputs feel like they came from inside your company, not from a generic assistant.
2. **The class-day move is customization, not installation.** Install before class on Tuesday so we spend Wednesday's session customizing skills together rather than configuring laptops. Pre-class Slack drop has the install paths.
3. **The Six-Layer Power Prompt Stack** — Context → Role → Task → Constraints → Examples → Output Spec — is the framework you'll see in every `SKILL.md` file. The class walks through it once; the takeaway page below holds the field-kit version you can reference forever.

**Class takeaway page:** [aigtmschool2026q2.vercel.app/power-prompting](https://aigtmschool2026q2.vercel.app/power-prompting) *(goes live May 27, 2026 after Session 5)*

---

## Start Here — 5 Skills (101)

61 skills is a firehose. If this is your first install, ignore the other 56 for the first week and run these five. They cover the full revenue motion, every one fires on a natural phrase, and they're the same five the Session 5 demos walk through:

| Skill | Trigger phrase | When you'd reach for it |
|---|---|---|
| [Meeting Prep](skills/meeting-prep/) | *"prep me for my call with [company]"* | Before any external meeting |
| [Prospect Research](skills/prospect-research/) | *"research [company]"* | Account warm-up; outbound list work |
| [Deal Strategy](skills/deal-strategy/) | *"deal strategy for [account]"* | Mid-funnel deal you need a plan on |
| [Pipeline Health](skills/pipeline-health/) | *"audit my pipeline"* | Monday morning, end of week, commit calls |
| [Post-Call Summary](skills/post-call-summary/) | *"summarize my call"* | Within 10 min of any customer call |

Customize **Layer 1 (Context)** in any one of them with your company / ICP / competitors and the output quality jumps an order of magnitude. The bootstrap onboarding sets a global Context in `~/.claude/CLAUDE.md` — every skill inherits it.

## Once You're Fluent (201)

When the Six-Layer Stack feels obvious and you want the moves that compound across skills — chaining, custom Layer 1 patterns, anti-hallucination constraints at scale, JSON output for chained pipelines, and *when not to use a skill* — read the 201 companion: **[Power Prompting 201](https://aigtmschool2026q2.vercel.app/power-prompting-201)**.

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

This installs everything — Homebrew, Node.js, Python, Claude Code, content tools (pandoc, ffmpeg, imagemagick, poppler, tesseract, yt-dlp), public CLIs (vercel, stripe, supabase, wrangler, netlify, agent-browser), and all 61 skills. Takes about 5-7 minutes. The script then walks you through an optional Bring-Your-Own-Keys `.env` setup, and Claude launches with a 2-minute profile interview.

See the full breakdown in [What Gets Installed](#what-gets-installed) below.

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
| [Launch](skills/launch/) | Product/feature launch plan + content kit | — |
| [Campaign](skills/campaign/) | Multi-channel marketing campaign builder | — |
| [Messaging](skills/messaging/) | Positioning, value props, message hierarchy | — |
| [PMM](skills/pmm/) | Product-marketing artifact suite | — |
| [Programmatic SEO](skills/programmatic-seo/) | Template-based pages at scale | DATAFORSEO |
| [SEO Audit](skills/seo-audit/) | Technical + on-page SEO diagnostic | GA4, DATAFORSEO |
| [Competitor Alternatives](skills/competitor-alternatives/) | "[Competitor] alternatives" landing pages | FIRECRAWL |
| [Pricing Strategy](skills/pricing-strategy/) | Tiers, packaging, willingness-to-pay analysis | — |
| [Marketing Psychology](skills/marketing-psychology/) | Apply mental models to campaigns and copy | — |
| [Kit](skills/kit/) | Lead magnet content kits | — |

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
| [CRM](skills/crm/) | Daily priorities dashboard from pasted CRM data | — |
| [Standup](skills/standup/) | Morning brief that surfaces priorities and follow-ups | — |
| [Inbox Zero](skills/inbox-zero/) | Triage assistant for pasted email subjects/threads | — |
| [Focus Time](skills/focus-time/) | Time-block planner from pasted calendar | — |

### File Utilities

| Skill | What it does | Libraries |
|-------|--------------|-----------|
| [xlsx](skills/xlsx/) | Read/edit/create Excel and CSV spreadsheets | openpyxl, pandas |
| [docx](skills/docx/) | Read/edit/create Word documents | python-docx, Pillow |
| [pdf](skills/pdf/) | Extract/merge/split/create/OCR PDFs | pypdf, pdfplumber, weasyprint, ocrmypdf |
| [pptx](skills/pptx/) | Read/edit/create PowerPoint decks | python-pptx |

### Running an SMB? Start Here

A complete fractional CFO / COO / CHRO / CMO toolkit for owners of small businesses (1-50 employees). All skills work with pasted data — no QuickBooks/Stripe/Gmail integration required. Skills touching tax, legal, or finance carry plain-English disclaimers.

**Money & finance**

| Skill | What it does |
|-------|--------------|
| [Bookkeeping Helper](skills/bookkeeping-helper/) | Categorize transactions from a pasted statement, flag anomalies, produce a monthly P&L summary |
| [Invoice Generator](skills/invoice-generator/) | Create professional invoices with payment terms and branding |
| [Cash Flow Forecast](skills/cash-flow-forecast/) | 13-week rolling cash projection; flags burn risk |
| [Tax Prep Helper](skills/tax-prep-helper/) | Quarterly estimates, 1099 prep, sales-tax primer — surfaces what to send to your CPA |

**Customers & growth**

| Skill | What it does |
|-------|--------------|
| [Customer Support Triage](skills/customer-support-triage/) | Triage a batch of customer messages by urgency, draft responses, flag escalations |
| [Review Response](skills/review-response/) | Draft on-brand replies to Google / Yelp / Trustpilot reviews |
| [Local Marketing](skills/local-marketing/) | Google Business Profile optimization + neighborhood marketing checklist |
| [Pricing Services](skills/pricing-services/) | Hourly vs. value vs. retainer vs. project pricing with margin math |

**Team & operations**

| Skill | What it does |
|-------|--------------|
| [Hiring Kit](skills/hiring-kit/) | JD + screening questions + interview rubric + offer letter template |
| [SOP Writer](skills/sop-writer/) | Turn a process description into a clean SOP with steps, owner, and exception handling |
| [Contract Review](skills/contract-review/) | Plain-English summary + risky-clause flags for vendor, lease, MSA, NDA |
| [Vendor Evaluation](skills/vendor-evaluation/) | Score competing quotes against a weighted rubric |
| [Owner Dashboard](skills/owner-dashboard/) | Weekly review of revenue, cash, top issues, top wins, decisions needed |

---

## What Gets Installed

The bootstrap script runs **10 phases** end-to-end. Here's everything it installs:

| Phase | Tool | What it is |
|:-:|:--|:--|
| 1 | Xcode Command Line Tools | git + compilers (macOS) |
| 2 | Homebrew / winget | Package manager |
| 3 | `mise` / `fnm` | Runtime version manager |
| 3 | `jq` | JSON parser |
| 3 | `gh` | GitHub CLI |
| 3 | `fzf` | Fuzzy finder (Ctrl+R history) |
| 3 | `bat` | `cat` with syntax highlighting |
| 3 | `ripgrep` (`rg`) | Fast grep replacement |
| 3 | `fd` | Fast `find` replacement |
| 3 | `tree` | Directory tree viewer |
| 3 | `direnv` | Per-directory env vars |
| 3 | `httpie` (`http`) | Friendlier curl for API exploration |
| 3 | `pandoc` | Markdown ↔ docx / pdf / html conversion |
| 3 | `poppler` (`pdftotext`) | Extract text from PDFs |
| 3 | `imagemagick` (`magick`) | Image manipulation |
| 3 | `ffmpeg` | Audio / video processing |
| 3 | `tesseract` | OCR for scanned PDFs and images |
| 3 | `yt-dlp` | Download YouTube videos for analysis |
| 4 | Node.js 24 | via mise / fnm |
| 4 | Python 3.13 | via mise (macOS) |
| 5 | **Claude Code CLI** | `@anthropic-ai/claude-code` from npm |
| 6 | `vercel` | One-click deploys for microsites and one-pagers |
| 6 | `stripe` | Payments CLI (used by Proposal skill) |
| 6 | `supabase` | Supabase project + database management |
| 6 | `wrangler` | Cloudflare Workers and Pages |
| 6 | `netlify` | Vercel alternative for static hosting |
| 6 | `agent-browser` | Token-efficient browser automation |
| 7 | `.env` BYOK setup | Interactive prompts → writes `~/.claude/.env` (chmod 600) |
| 8 | 61 GTM skills | Symlinked into `~/.claude/skills/` |
| 9 | `gh auth login` | Interactive GitHub auth |
| 10 | Shell configuration | Managed block in `~/.zshrc` or PowerShell profile (PATH, fzf, env auto-source, aliases) |

The script is **idempotent** — re-running it heals missing pieces without breaking anything that's already there. Run `./setup/bootstrap.sh --check` (macOS) or `.\setup\bootstrap.ps1 -Check` (Windows) for a read-only health report.

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
