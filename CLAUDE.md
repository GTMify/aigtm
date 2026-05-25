# AI GTM Skills for Claude Code

This repo contains 16 ready-to-use AI agent skills for go-to-market and revenue leadership. Skills are installed to `~/.claude/skills/` by the bootstrap script.

**First week?** Start with five: `meeting-prep`, `prospect-research`, `deal-strategy`, `pipeline-health`, `post-call-summary`. They cover the full revenue motion and are the same five the Session 5 demos walk through. Once those feel automatic, the [Power Prompting 201](https://aigtmschool2026q2.vercel.app/power-prompting-201) reference covers the compounding moves (chaining, custom Layer 1 patterns, anti-hallucination constraints, JSON output, when *not* to use a skill).

## Available Skills

| Skill | Trigger Phrases |
|-------|----------------|
| meeting-prep | "prep me for my call", "meeting prep", "brief me on [company]" |
| prospect-research | "research [company]", "find decision-makers at [company]" |
| post-call-summary | "summarize my call", "post-call summary", "write follow-up" |
| deal-strategy | "deal strategy for [account]", "MEDDIC assessment" |
| objection-handler | "handle this objection", "stuck deal", "they said [objection]" |
| pipeline-health | "audit my pipeline", "pipeline health check" |
| forecast-narrative | "build my forecast", "forecast narrative" |
| territory-analyzer | "analyze my territory", "rep performance" |
| competitive-intel | "competitive intel on [company]", "monitor competitors" |
| win-loss-analyzer | "analyze our wins and losses", "why did we lose [deal]" |
| qbr-builder | "build a QBR for [client]", "quarterly business review" |
| churn-early-warning | "flag at-risk accounts", "churn risk" |
| board-update | "write a board update", "investor update" |
| hiring-brief | "write a job description for [role]", "hiring brief" |
| weekly-planner | "plan my week", "weekly priorities" |
| inbox-triage | "triage my inbox", "prioritize these emails" |

---

## First-Time Setup: Personal Profile

**If `~/.claude/CLAUDE.md` does not exist, you MUST run the onboarding flow below before doing anything else.** Do not skip this. Do not summarize the skills. Do not answer other questions first. The skills work significantly better when Claude has context about who the user is.

### Onboarding Flow

Walk the user through these questions conversationally. Be warm and direct — this is a colleague setting up their workspace, not a customer filling out a form.

**Step 1: Who are you?**
- What's your name?
- What's your title and company?
- One sentence: what do you do day-to-day?

**Step 2: What do you sell?**
- What does your company sell? (product/service, one sentence)
- Who buys it? (target buyer title and company type)
- What's your average deal size and sales cycle length? (rough is fine)

**Step 3: Who's your ICP?**
- What industry or vertical do your best customers come from?
- What company size (employees or revenue) is your sweet spot?
- What signals tell you a company is a good fit? (tech stack, funding stage, hiring patterns, etc.)

**Step 4: Who do you compete with?**
- Name your top 3-5 competitors.
- In one sentence each, how do you position against them?

**Step 5: What tools do you use?**
- CRM? (Salesforce, HubSpot, Clarify, etc.)
- Outreach platform? (Outreach, Salesloft, lemlist, Reply.io, etc.)
- Any other tools you use daily?

### After the conversation:

Generate a `~/.claude/CLAUDE.md` file using the Write tool with the following structure. Fill it in based on their answers. Use their natural language — don't over-formalize it.

```markdown
# Claude Code — [Name]'s Configuration

## About Me

[Name], [Title] at [Company]. [One sentence about what they do.]

## My Company

**What we sell:** [Product/service description]
**Target buyer:** [Buyer title] at [company type]
**Deal size:** [Range] | **Sales cycle:** [Duration]

## Ideal Customer Profile

- **Industry:** [Industries]
- **Company size:** [Size range]
- **Signals:** [Buying signals they mentioned]

## Competitors

| Competitor | Our Positioning |
|-----------|----------------|
| [Name] | [How they differentiate] |
| [Name] | [How they differentiate] |
| [Name] | [How they differentiate] |

## Tools I Use

- **CRM:** [Tool]
- **Outreach:** [Tool]
- **Other:** [Tools]

## Installed Skills

16 AI GTM skills installed from the [aigtm](https://github.com/GTMify/aigtm) repo.
Use trigger phrases naturally — e.g., "prep me for my call with Acme Corp" or "audit my pipeline."

---

*Update this file anytime your role, ICP, or competitive landscape changes.*
```

After writing the file, confirm it was created and tell the user they're all set. Mention that they can update it anytime by editing `~/.claude/CLAUDE.md` or by asking Claude to update it for them.
