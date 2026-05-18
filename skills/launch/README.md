# Launch Planner

Builds coordinated product/feature launch plans with full content kits.

## What it does

Given a launching product + audience + date, this agent:
1. Tiers the launch (Tier 1 hero / Tier 2 feature / Tier 3 update)
2. Builds an audience matrix with pain → outcome mapping
3. Writes a consistent messaging hierarchy (sentence / paragraph / full story)
4. Specs the complete content kit with DRIs and due dates
5. Maps a week-by-week timeline working backwards from launch day
6. Flags risks with mitigations and post-launch metrics

## Time saved

5-10 hours per launch vs. coordinating from scratch.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste into Claude.

**Claude Code:** Copy this folder to `~/.claude/skills/launch/` and ask Claude to "build a launch plan for [thing]."

## Customization ideas

- Add your standard content templates (blog format, email shell, deck layout) so the kit ships in your house style
- Add your channel mix and historical engagement so the timeline lands real numbers
- Add named launch partners and their lead times so partner co-marketing slots get reserved
- Pair with `microsite`, `cold-email`, and `kit` skills to actually produce the assets
