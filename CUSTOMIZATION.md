# Customizing Your AI GTM Skills

The 16 skills in this repo work out of the box, but they work **dramatically better** when Claude knows who you are, what you sell, and who you sell to. This guide shows you how to go from generic outputs to outputs that sound like they came from someone on your team.

---

## Your CLAUDE.md Is the Control Center

Every time Claude Code starts a session, it reads `~/.claude/CLAUDE.md`. This file is your persistent context — it tells Claude your role, your company, your ICP, and your competitive landscape. Every skill reads this context automatically.

**The difference is significant.** Here's what Meeting Prep produces without and with company context:

| Without context | With context |
|----------------|-------------|
| "This company may benefit from automation solutions" | "Meridian's 6 open RevOps roles suggest they're building the analytics function your platform replaces — position around time-to-value vs. hiring" |
| Generic conversation starters | Questions that reference your specific product's strengths against their likely pain points |
| No competitive awareness | Flags when a prospect is using a competitor's product and suggests differentiation angles |

The onboarding flow created a starter CLAUDE.md when you first launched Claude Code. Now it's time to make it great.

---

## 1. Add Your Company Context

Open `~/.claude/CLAUDE.md` in any text editor, or ask Claude: "Update my CLAUDE.md to add more company context."

Add a section like this:

```markdown
## My Company — Deep Context

**What we sell:** [Product name] — [one paragraph explaining what it does, who uses it, and why they buy it]

**Value propositions:**
1. [Primary value prop — the one that wins deals]
2. [Secondary value prop]
3. [Third value prop]

**Proof points:**
- [Customer name] achieved [specific result] in [timeframe]
- [Metric]: [X]% improvement for [customer segment]
- [Award, analyst recognition, or third-party validation]

**Pricing context:**
- Average deal size: $[X]
- Pricing model: [per seat / platform fee / usage-based]
- Common objection: "[price objection]" → Our response: "[how you handle it]"
```

**Why this matters:** When you run Prospect Research, Claude uses your value props to write personalized emails. When you run Deal Strategy, it uses your proof points to recommend which reference customers to deploy. When you run Objection Handler, it uses your pricing context to craft responses.

---

## 2. Define Your ICP Deeply

The onboarding flow asked for industry and company size. Go deeper:

```markdown
## Ideal Customer Profile — Detailed

**Best-fit companies:**
- Industry: [specific verticals, not just "SaaS"]
- Size: [employee count AND revenue range]
- Stage: [Series B-D / mid-market / enterprise]
- Tech stack signals: [tools they use that indicate fit — e.g., "Salesforce Enterprise, Snowflake, already using a BI tool"]
- Buying triggers: [events that create urgency — e.g., "just raised a round", "new CRO hired", "scaling past 50 reps"]

**Disqualification signals:**
- [e.g., "Under 20 reps — too small for our platform"]
- [e.g., "Already using [competitor] with a 2-year contract"]
- [e.g., "No dedicated RevOps or Sales Ops function"]

**Target personas (in priority order):**
1. [Title] — they care about [what], they evaluate based on [what]
2. [Title] — they care about [what], they evaluate based on [what]
3. [Title] — they care about [what], they evaluate based on [what]
```

**Why this matters:** Pipeline Health uses disqualification signals to flag deals that shouldn't be in your pipeline. Prospect Research uses buying triggers to find the most timely personalization hooks. Territory Analyzer uses ICP criteria to identify whitespace.

---

## 3. Add Your Competitor Playbook

The onboarding asked for competitor names. Now add the intel that wins deals:

```markdown
## Competitive Playbook

### vs. [Competitor 1]
- **Their pitch:** [How they position themselves]
- **Where they win:** [Their genuine strengths]
- **Where we win:** [Our genuine advantages]
- **Trap questions to plant:** ["Can you show me how [specific workflow] works?" — exposes their weakness in [area]]
- **Proof point:** [Customer who evaluated both and chose us, with reasoning]
- **Watch for:** [Signal that a prospect is already talking to them — e.g., "they mention 'AI forecasting' which is their positioning"]

### vs. [Competitor 2]
[Same structure]
```

**Why this matters:** Deal Strategy uses trap questions in its competitive positioning section. Competitive Intel knows what to monitor for each competitor. Objection Handler crafts responses specific to each competitor's pitch.

---

## 4. Customize Output Formats

Each skill has a SKILL.md file that defines its output format. You can edit these to match your team's templates.

**Where skills live:** `~/.claude/skills/[skill-name]/SKILL.md`

**Common customizations:**

**Match your CRM fields:**
If your CRM uses specific field names, update the output format in the skill:
```markdown
## Output Format
- **Salesforce Opportunity Name:** [Company] - [Product] - [Quarter]
- **Stage:** [Your stage names, not the default ones]
- **Next Step (CRM field):** [Action by date]
```

**Add your team's templates:**
If your team has a standard deal review template or QBR format, paste it into the relevant SKILL.md and tell Claude to use that format.

**Adjust stage probabilities:**
Pipeline Health uses default stage probabilities (Discovery: 10%, Qualification: 20%, etc.). If your company uses different numbers:
```markdown
## Stage Probabilities (override defaults)
- Prospecting: 5%
- Discovery: 15%
- Solution Design: 35%
- Proposal: 55%
- Negotiation: 75%
- Verbal: 90%
```

---

## 5. Chain Skills Together

Individual skills are useful. Chained workflows are transformative. Here are proven sequences:

**Pre-call to post-call pipeline update:**
1. Run **Meeting Prep** before the call
2. After the call, run **Post-Call Summary** with your notes
3. Weekly, run **Pipeline Health** to see how your deals shifted

Tell Claude: "Prep me for my call with Acme Corp. After the call I'll give you my notes and we'll do a post-call summary, then update my pipeline."

**Account pursuit sequence:**
1. Run **Prospect Research** on your target accounts
2. For accounts that engage, run **Deal Strategy** to build the plan
3. As deals progress, run **Objection Handler** when you hit resistance
4. At end of quarter, run **Win/Loss Analyzer** on the outcomes

**Forecast prep:**
1. Run **Pipeline Health** on your full pipeline
2. Run **Forecast Narrative** using the health check output
3. Run **Territory Analyzer** if you manage a team

Each skill's output becomes context for the next one. Claude remembers the previous outputs within the same session.

---

## 6. Add Guardrails and Compliance Rules

For enterprise GTM teams that need compliance controls:

```markdown
## Guardrails

**Suppression list:** Never research, draft outreach for, or include in any analysis:
- [List of companies — e.g., existing customers, do-not-contact list]
- [List of domains — e.g., competitor employees]

**Compliance rules:**
- All outreach must include an unsubscribe mechanism reference
- Never reference personal information (family, health, politics)
- Flag any prospect in [regulated industry] for legal review before outreach
- All deal values over $[threshold] require VP approval — flag in action plans

**Data handling:**
- Do not store or reference PII beyond what's needed for the current task
- Flag any GDPR-relevant prospect (EU-based) for consent verification
```

Add this to your `~/.claude/CLAUDE.md` and every skill will respect these constraints automatically.

---

## Quick Reference: What to Customize Where

| What you want to change | Where to change it |
|------------------------|-------------------|
| Your role, company, ICP, competitors | `~/.claude/CLAUDE.md` |
| A specific skill's output format | `~/.claude/skills/[skill-name]/SKILL.md` |
| Stage probabilities for pipeline analysis | `~/.claude/skills/pipeline-health/SKILL.md` |
| Suppression lists and compliance rules | `~/.claude/CLAUDE.md` |
| The Cowork version of a skill | Copy and edit the `COWORK-PROMPT.md` file |

---

## Getting Help

You can always ask Claude to make these changes for you:

- "Add my top 3 competitors to my CLAUDE.md"
- "Update the pipeline health skill to use our stage names"
- "Add a suppression list for our existing customers"
- "Show me my current CLAUDE.md"

Claude will read the file, make the edit, and confirm what changed.
