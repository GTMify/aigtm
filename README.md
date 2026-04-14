# GTM Agent Skills for Claude

**Pavilion AI in GTM School — Session 5: AI Agents**

A collection of 16 ready-to-use AI agent skills for go-to-market and revenue leadership. Each skill works in **Claude Cowork** (copy-paste a prompt) or **Claude Code** (install as a skill for repeated use).

## What's in the box

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

## Quick Start

### Option A: Full Setup (recommended)

Run the bootstrap script to install Claude Code, dev tools, and all 16 skills in one command:

```bash
# 1. Clone this repo
git clone https://github.com/GTMify/aigtm.git ~/claude/aigtm

# 2. Run the bootstrap
~/claude/aigtm/setup/bootstrap-lite.sh --install

# 3. Reload your shell
source ~/.zshrc

# 4. Verify everything is green
~/claude/aigtm/setup/bootstrap-lite.sh --check

# 5. Launch Claude Code from this repo
cd ~/claude/aigtm && claude
```

This installs Homebrew, Node.js, Python, Claude Code, and links all 16 skills. On first launch, Claude will walk you through a 2-minute profile setup — your role, company, ICP, and competitors. This context makes every skill dramatically more useful.

### Option B: Claude Cowork (no setup required)

1. Open Claude Cowork on your desktop
2. Open any skill folder above
3. Copy the prompt from the **`COWORK-PROMPT.md`** file
4. Paste it into Cowork, fill in the `[bracketed fields]`, and hit Enter

### Option C: Claude Code (for power users)

1. Install Claude Code: `brew install claude-code` (Mac) or see [install docs](https://docs.anthropic.com/en/docs/claude-code)
2. Clone this repo:
   ```bash
   git clone https://github.com/GTMify/aigtm.git
   ```
3. Copy any skill folder into your Claude Code skills directory:
   ```bash
   cp -r aigtm/skills/meeting-prep ~/.claude/skills/
   ```
4. Use it by name: just ask Claude "prep me for my call with Acme Corp" and the skill activates automatically

### Option D: Claude Code (one-liner)

From any Claude Code session, you can also just say:

```
Read the SKILL.md at [path-to-this-repo]/skills/meeting-prep/SKILL.md and use it to prep me for my meeting with Acme Corp
```

## How Skills Work

Each skill folder contains:

```
skills/meeting-prep/
├── SKILL.md            # Claude Code skill definition (the "brain")
├── COWORK-PROMPT.md    # Copy-paste version for Cowork
└── README.md           # What this skill does and how to customize it
```

**SKILL.md** is the instruction set that tells Claude *how to think* about a task — what to research, what format to use, what to avoid, and what guardrails to follow. It's written in plain English. You can read it, edit it, and make it your own.

**COWORK-PROMPT.md** is a self-contained prompt you paste directly into Claude Cowork. Same logic, packaged as a single prompt with fill-in-the-blank fields.

## Customization

These skills are starting points, not finished products. The best agents are the ones tuned to your specific workflow. Some ideas:

- **Add your company context** to the system prompts (your product, your ICP, your competitors)
- **Adjust the output format** to match your CRM fields or team templates
- **Chain skills together** — run Meeting Prep, then Post-Call Summary, then Pipeline Health in sequence
- **Add guardrails** — suppression lists, approval steps, or "never contact" rules for compliance
- **Connect MCP servers** — plug in your CRM, email, calendar, or CS platform for automated data pulls

## About

Built by [Scott Wueschinski](https://linkedin.com/in/scottwueschinski) for the Pavilion AI in GTM School.

Questions? Reach out at scott@gtmify.io

---

*These skills use Claude's built-in web search and file tools. No API keys, external services, or coding required for Cowork. Claude Code skills may optionally use MCP servers for CRM integration.*
