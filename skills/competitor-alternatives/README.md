# Competitor Alternatives / VS Pages

Builds "[Competitor] alternatives" and "[A] vs [B]" landing pages for SEO and sales enablement.

## What it does

Given a competitor + your positioning, this agent:
1. Picks the right pattern (alternatives vs. comparison)
2. Builds an honest strategic frame
3. Generates the SEO wire-up (URL, title, meta, schema)
4. Writes the full landing page (hero, why-search, comparison table, win/lose framing, customer quotes, migration considerations, CTA)
5. Runs a pre-launch checklist (sources, dates, legal review, permissions)

## Time saved

8-15 hours per page vs. drafting from scratch.

## Optional keys

- `FIRECRAWL_API_KEY` — clean scrape of competitor's homepage and pricing page
- `DATAFORSEO_LOGIN` / `DATAFORSEO_PASSWORD` — search volume and competition data

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste into Claude.

**Claude Code:** Copy this folder to `~/.claude/skills/competitor-alternatives/` and ask Claude to "build a [competitor] alternatives page."

## Customization ideas

- Add your standard landing page template so output ships in your house style
- Maintain a master list of customer quotes with permissions tracked
- Add legal review checklist for trademark use
- Pair with `battlecard` skill to keep public page and internal battlecard aligned
- Set a quarterly review cadence so comparison data stays fresh
