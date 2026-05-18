# Campaign Builder

Builds multi-channel marketing campaigns with a narrative arc, full content calendar, and conversion path.

## What it does

Given a goal + audience + window, this agent:
1. Picks the right narrative arc (insight-led, problem-agitate-solve, customer story, contrarian, tutorial)
2. Maps channels to roles in the arc (open, deepen, convert)
3. Writes a full content calendar with headlines, CTAs, and owners
4. Drafts the major assets (emails, social posts, landing page hero)
5. Wires the conversion path end-to-end
6. Defines leading and lagging metrics with review cadence
7. Names stop conditions

## Time saved

8-15 hours per campaign vs. planning from scratch.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste into Claude.

**Claude Code:** Copy this folder to `~/.claude/skills/campaign/` and ask Claude to "build a campaign for [goal]."

## Customization ideas

- Add your historical channel performance so the channel mix recommendations are calibrated
- Add your CRM stages and lifecycle email templates so conversion paths land in your existing automation
- Add your brand voice rules so drafts ship on-tone
- Pair with `cold-email`, `microsite`, and `repurpose` skills to produce the assets
