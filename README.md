# AI GTM Skills for Claude

**56 ready-to-use AI agent skills for go-to-market, revenue leadership, and small business operations.** Meeting prep, prospect research, deal strategy, pipeline health, competitive intel, cash flow forecasting, contract review, local marketing, and more — all running locally in Claude Code.

Built by [Scott Wueschinski](https://linkedin.com/in/scottwueschinski) for the [Pavilion](https://www.joinpavilion.com/) AI in GTM School, expanded with operator and SMB-owner skill packs.

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

This installs everything — Homebrew, Node.js, Python, Claude Code, and all 16 skills. Takes about 5 minutes. When it finishes, Claude launches automatically and walks you through a 2-minute profile setup.

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

## All 16 Skills

### Sales Execution

| Skill | What it does | Time saved |
|-------|-------------|------------|
| [Meeting Prep](skills/meeting-prep/) | Researches a company + person and produces a scannable briefing before your call | 15-25 min/call |
| [Prospect Research](skills/prospect-research/) | Researches target accounts, finds decision-makers, drafts personalized outreach | 30-45 min/batch |
| [Post-Call Summary](skills/post-call-summary/) | Turns raw call notes into action items, follow-up email, and CRM-ready summary | 15-20 min/call |
| [Objection Handler](skills/objection-handler/) | Diagnoses stuck deals, prescribes recovery plays, and writes the exact messages to send | Deals saved, not time |
| [Deal Strategy](skills/deal-strategy/) | MEDDIC assessment, stakeholder map, competitive positioning, and action plan for active deals | 30-45 min/deal |

### Pipeline & Forecasting

| Skill | What it does | Time saved |
|-------|-------------|------------|
| [Pipeline Health](skills/pipeline-health/) | Audits your pipeline for stuck deals, single-threading, and coverage gaps | 30-60 min/week |
| [Forecast Narrative](skills/forecast-narrative/) | Translates pipeline data into a commit/upside/risk narrative for your CRO or board | 45-60 min/cycle |
| [Territory Analyzer](skills/territory-analyzer/) | Team-level view of rep performance, coverage gaps, whitespace, and reallocation recommendations | 1-2 hours/review |

### Competitive & Market Intelligence

| Skill | What it does | Time saved |
|-------|-------------|------------|
| [Competitive Intel](skills/competitive-intel/) | Monitors competitors for product launches, hiring signals, press, and pricing changes | 1-2 hours/week |
| [Win/Loss Analyzer](skills/win-loss-analyzer/) | Analyzes deal outcomes for patterns, loss reasons, and actionable takeaways | 2-3 hours/quarter |

### Customer Success & Retention

| Skill | What it does | Time saved |
|-------|-------------|------------|
| [QBR Builder](skills/qbr-builder/) | Builds customer-facing quarterly business reviews that lead with value, not features | 2-3 hours/QBR |
| [Churn Early Warning](skills/churn-early-warning/) | Flags at-risk accounts by revenue impact and prescribes save plays before renewal | Catches risk 60-90 days earlier |

### Leadership & Strategy

| Skill | What it does | Time saved |
|-------|-------------|------------|
| [Board Update](skills/board-update/) | Builds structured board or investor updates with revenue, pipeline, team, and strategic narrative | 2-3 hours/update |
| [Hiring Brief](skills/hiring-brief/) | Scopes a role, writes a JD, provides comp guidance, and builds an interview scorecard | 3-4 hours/role |

### Productivity

| Skill | What it does | Time saved |
|-------|-------------|------------|
| [Weekly Planner](skills/weekly-planner/) | Synthesizes calendar, pipeline, and priorities into a focused weekly game plan | 30-45 min/week |
| [Inbox Triage](skills/inbox-triage/) | Categorizes, prioritizes, and drafts responses for your email backlog | 20-30 min/day |

---

## Running an SMB? Start here

If you run a small or medium-sized business (1-50 people — services firm, retail, restaurant, agency, consultancy, e-commerce, trades), the 13 skills below turn Claude into a fractional CFO, COO, CMO, and CHRO. No CRM, no QuickBooks integration, no learning curve. You paste in what you have; Claude returns a usable artifact.

### Money & finance

| Skill | What it does |
|-------|-------------|
| [Bookkeeping Helper](skills/bookkeeping-helper/) | Categorizes transactions from a pasted CSV or statement, flags anomalies, produces a monthly P&L |
| [Invoice Generator](skills/invoice-generator/) | Generates a clean, professional HTML invoice with payment terms, due date, and a cover email |
| [Cash Flow Forecast](skills/cash-flow-forecast/) | 13-week rolling week-by-week cash projection with burn flags and scenario modeling |
| [Tax Prep Helper](skills/tax-prep-helper/) | Quarterly estimates, 1099 prep, sales-tax-by-state — organizes the packet to send your CPA |

### Customers & growth

| Skill | What it does |
|-------|-------------|
| [Customer Support Triage](skills/customer-support-triage/) | Triages a pasted batch of customer messages, drafts routine replies, flags escalations |
| [Review Response](skills/review-response/) | Drafts Google / Yelp / Trustpilot review replies — written for the next customer reading both |
| [Local Marketing](skills/local-marketing/) | Google Business Profile audit + local SEO + neighborhood tactics for brick-and-mortar SMBs |
| [Pricing Services](skills/pricing-services/) | Hourly vs. project vs. retainer vs. value-based pricing with cost-floor math and three-number quote |

### Team & operations

| Skill | What it does |
|-------|-------------|
| [Hiring Kit](skills/hiring-kit/) | JD, screening questions, interview plan, scorecard, and offer letter template — all in one pass |
| [SOP Writer](skills/sop-writer/) | Turns a messy process description into a clean SOP with steps, exceptions, and a done-when checklist |
| [Contract Review](skills/contract-review/) | Plain-English review of NDAs, MSAs, leases, SOWs — with red/yellow/green flags and suggested edits |
| [Vendor Evaluation](skills/vendor-evaluation/) | Weighted scoring across vendor quotes — total cost, capability, stability, contract terms |
| [Owner Dashboard](skills/owner-dashboard/) | Weekly one-page read on the state of the business — wins, issues, decisions needed |

**Heads up on disclaimers.** Anything touching taxes, legal contracts, or financial advice produces operational scaffolding, not professional advice. Every SMB skill has a disclaimer at the top of its `SKILL.md` reminding you to consult a licensed CPA or attorney for binding decisions.

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

**Want to verify your setup?**
```bash
./setup/bootstrap.sh --check    # macOS
.\setup\bootstrap.ps1 -Check    # Windows
```

---

## About

Built by [Scott Wueschinski](https://linkedin.com/in/scottwueschinski) for the Pavilion AI in GTM School. Questions? Reach out at scott@gtmify.io.

These skills use Claude's built-in web search and file tools. No API keys, external services, or coding required for the Desktop/Cowork prompts. Claude Code skills may optionally use MCP servers for CRM integration.

---

*Licensed for personal and commercial use. Fork it, customize it, make it yours.*
