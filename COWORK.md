# Using aigtm in Claude Cowork

No terminal? No problem. This page is the one-shot install path for Claude Cowork (Claude.ai desktop / web). Two ways in, depending on whether your Cowork has the folder-connector feature.

> **First-time user?** Read the "Start Here — 5 Skills (101)" section in the [README](README.md) first. The five-skill starter set is the same in Cowork as in the terminal install.

---

## Path A — Connect the repo as a knowledge source (recommended)

If your Cowork has the **"Add folder" / "Connect a knowledge source"** feature:

1. Click *Add folder* in Cowork (the exact label varies by Cowork release — it's the same UI you'd use to add a Google Drive folder or a GitHub repo).
2. Paste the repo URL:
   ```
   https://github.com/GTMify/aigtm
   ```
3. Cowork imports all 62 skills as searchable, retrievable knowledge.
4. Use the trigger phrases below — Cowork finds the matching `SKILL.md` and runs it.

**That's it.** Same triggers, same six-layer structure, same outputs as the terminal install. The only difference is Cowork doesn't have a filesystem — so the customization step (editing Layer 1 Context) works by *adding a context block in your Cowork conversation* instead of editing a file on disk. See the "Customizing in Cowork" section below.

---

## Path B — Paste the master prompt (works without folder connector)

If your Cowork doesn't have a folder connector, paste this single message into a new Cowork conversation. It tells Cowork how to find and use the skills via the GitHub repo:

```text
Treat https://github.com/GTMify/aigtm as my AI GTM skill library
for this conversation. When I say any of the trigger phrases below,
find the matching `skills/<skill-name>/COWORK-PROMPT.md` in that repo
and execute it against the input I provide. Use the six-layer Power
Prompt Stack (Context → Role → Task → Constraints → Examples → Output
Spec) — each skill file already has all six layers structured.

Trigger phrases (16 revenue-team skills):

• "prep me for my call with [company]"            → meeting-prep
• "research [company]" / "research these prospects" → prospect-research
• "summarize my call" / "draft a follow-up"        → post-call-summary
• "deal strategy for [account]" / "MEDDIC this deal" → deal-strategy
• "this deal is stuck" / "they went dark"          → objection-handler
• "audit my pipeline" / "pipeline review"          → pipeline-health
• "build my forecast" / "commit email"             → forecast-narrative
• "territory analysis" / "rep performance"         → territory-analyzer
• "competitive intel on [company]" / "monitor competitors" → competitive-intel
• "win/loss analysis" / "why did we lose [deal]"   → win-loss-analyzer
• "build a QBR for [client]"                       → qbr-builder
• "churn risk" / "at-risk accounts"                → churn-early-warning
• "write a board update"                           → board-update
• "hiring brief" / "scope this role"               → hiring-brief
• "plan my week" / "weekly priorities"             → weekly-planner
• "triage my inbox" / "prioritize these emails"    → inbox-triage

For any skill not in the list above, browse the repo's `skills/`
folder and find the one whose `description` field matches my request.
There are 45+ additional skills for marketing, ops, customer support,
and SMB owner-operator workflows.

Confirm you've loaded this skill library by responding "Toolkit
loaded — what should I run first?"
```

After Cowork confirms, you can use any of the trigger phrases above in the same conversation.

---

## Customizing in Cowork

In the terminal install, Layer 1 (Context) is customized by editing `~/.claude/skills/<name>/SKILL.md` on disk. In Cowork, you do the equivalent by **adding a Company Context block at the start of your Cowork conversation**. Cowork carries that context forward into every skill invocation in the same conversation.

Drop this template into your Cowork chat once, then never type it again:

```text
COMPANY CONTEXT (apply to every skill in this conversation):

Company: [Your company name]
What we sell: [One sentence product description]
ICP:
  - Industries: [Industry or vertical]
  - Company size: [Employee count or ARR band]
  - Buying signals: [3-5 fit signals]

Top 3 competitors and how we beat each:
  1. [Competitor] — [one-sentence wedge]
  2. [Competitor] — [one-sentence wedge]
  3. [Competitor] — [one-sentence wedge]

Differentiator (one sentence): [What's true about us that no one else
in the category can credibly say about themselves]

Deal economics:
  - Average deal size: [ACV]
  - Sales cycle: [median days]

Top deal-killers to flag in any deal review:
  1. [Recurring 'no' #1]
  2. [Recurring 'no' #2]
  3. [Recurring 'no' #3]

Apply this Company Context to every skill I invoke below. Do not
invent competitive positioning that contradicts the wedges above.
```

Once that block is in your conversation, every trigger phrase you fire afterward will inherit it. The output goes from "any rep at any company" to "feels-like-it-came-from-inside-your-team" — same lift as customizing Layer 1 in the terminal install.

---

## The 45+ other skills

The 16 above are the revenue-team starter set. The full repo has 45+ more for:

- **Marketing** — `campaign`, `messaging`, `marketing-psychology`, `pmm`, `launch`, `microsite`, `programmatic-seo`, `repurpose`, `seo-audit`, `one-pager`, `proposal`
- **Customer success** — `customer-support-triage`, `review-response`
- **RevOps** — `crm`, `roadmap`, `decision-log`, `standup`, `sop-writer`, `vendor-evaluation`
- **SMB owner-operator** — `bookkeeping-helper`, `cash-flow-forecast`, `invoice-generator`, `owner-dashboard`, `pricing-services`, `pricing-strategy`, `roi-calculator`, `tax-prep-helper`, `referral`, `local-marketing`
- **Hiring** — `hiring-kit`, `hiring-brief`
- **Document workflows** — `docx`, `pdf`, `pptx`, `xlsx`
- **General-purpose** — `brainstorm`, `focus-time`, `changelog`, `contract-review`, `inbox-zero`, `competitor-alternatives`, `battlecard`

Ask Cowork: *"Find the skill that best matches [the job I'm trying to do]"* — it'll search the loaded library and tell you which one to fire.

---

## Once you're fluent

Read the [Power Prompting 201 companion](https://aigtmschool2026q2.vercel.app/power-prompting-201) — the moves the live class didn't have time for: chaining skills into pipelines, custom Layer 1 patterns, anti-hallucination constraints at scale, JSON output for chained workflows, and *when not to use a skill*.

---

## Pavilion AI in GTM School cohort

If you're here from the May 27, 2026 session, the live takeaway is at:

**https://aigtmschool2026q2.vercel.app/power-prompting**

The bonus token-management field kit:

**https://aigtmschool2026q2.vercel.app/token-management**

Built for the cohort. Pass it along.
