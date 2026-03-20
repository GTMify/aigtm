# GTM Agent Skills for Claude

**Pavilion AI in GTM School — Session 5: AI Agents**

A collection of ready-to-use AI agent skills for go-to-market and productivity workflows. Each skill works in **Claude Cowork** (copy-paste a prompt) or **Claude Code** (install as a skill for repeated use).

## What's in the box

### Go-to-Market Skills

| Skill | What it does | Time saved |
|-------|-------------|------------|
| [Meeting Prep](skills/meeting-prep/) | Researches a company + person and produces a scannable briefing before your call | 15-25 min/call |
| [Prospect Research](skills/prospect-research/) | Researches target accounts, finds decision-makers, drafts personalized outreach | 30-45 min/batch |
| [Win/Loss Analyzer](skills/win-loss-analyzer/) | Analyzes deal outcomes for patterns, loss reasons, and actionable takeaways | 2-3 hours/quarter |
| [Competitive Intel](skills/competitive-intel/) | Monitors competitors for product launches, hiring signals, press, and pricing changes | 1-2 hours/week |
| [Pipeline Health](skills/pipeline-health/) | Audits your pipeline for stuck deals, single-threading, and coverage gaps | 30-60 min/week |
| [Post-Call Summary](skills/post-call-summary/) | Turns raw call notes into action items, follow-up email, and CRM-ready summary | 15-20 min/call |

### Productivity Skills

| Skill | What it does | Time saved |
|-------|-------------|------------|
| [Weekly Planner](skills/weekly-planner/) | Synthesizes calendar, pipeline, and priorities into a focused weekly game plan | 30-45 min/week |
| [Inbox Triage](skills/inbox-triage/) | Categorizes, prioritizes, and drafts responses for your email backlog | 20-30 min/day |

## Quick Start

### Option A: Claude Cowork (no setup required)

1. Open Claude Cowork on your desktop
2. Open any skill folder above
3. Copy the prompt from the **`COWORK-PROMPT.md`** file
4. Paste it into Cowork, fill in the `[bracketed fields]`, and hit Enter

### Option B: Claude Code (for power users)

1. Install Claude Code: `brew install claude-code` (Mac) or see [install docs](https://docs.anthropic.com/en/docs/claude-code)
2. Clone this repo:
   ```bash
   git clone https://github.com/YOUR-USERNAME/pavilion-gtm-agents.git
   ```
3. Copy any skill folder into your Claude Code skills directory:
   ```bash
   cp -r pavilion-gtm-agents/skills/meeting-prep ~/.claude/skills/
   ```
4. Use it by name: just ask Claude "prep me for my call with Acme Corp" and the skill activates automatically

### Option C: Claude Code (one-liner)

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

## About

Built by [Scott Wueschinski](https://linkedin.com/in/scottwueschinski) for the Pavilion AI in GTM School.

Questions? Reach out at scott@gtmify.io

---

*These skills use Claude's built-in web search and file tools. No API keys, external services, or coding required for Cowork. Claude Code skills may optionally use MCP servers for CRM integration.*
